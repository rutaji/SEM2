function [x, M] = find_int_roots(p)
    %nalezení celých kořenů za pomoci Hornerova schématu
    nejvetsi_clen = p(1);
    nejmensi_clen = p(find(p,1,'last'));%vezme nejmenší NEnulový kořen
    podezrele_koreny = 1:abs(nejmensi_clen);%sus
    podezrele_koreny = podezrele_koreny(rem(nejmensi_clen,podezrele_koreny)==0); %všechny potenciální kořeny v absolutních hodnotách 

    %věta o omezenosti kořenů
    if (length(p) > 1)
        A = max(abs(p(2:end)));
        podezrele_koreny = podezrele_koreny(abs(podezrele_koreny) < 1 + A./abs(nejvetsi_clen));
    end

    %přidání záporných kořenů a 0
    podezrele_koreny = [podezrele_koreny podezrele_koreny* -1 0];
    
    M = p;
    x = [];
    nejmensi_polynom = p; %pro začátek se zde vloží začáteční polynom. Po nalezení sem vložím zkrácený polynom.
    while ~isempty(nejmensi_polynom)
        to_break = 1;
        for i=1:length(podezrele_koreny)
            [q, r] = deconv(nejmensi_polynom, [1 podezrele_koreny(i)]);%vydělím polynomem: x + kořen
            if (any(r ~= 0))% pokud zbytek není 0, nejedná se o kořen => pokračuj v hledání.
                continue
            end
    
            x(end + 1) = podezrele_koreny(i);%nalezený kořen uložen
            M(end + 1, 1:length(q)) = q; %uložení postupu
            nejmensi_polynom = q; %polynom zkrácen
            
            if (abs(q - 0) < 1e-15)
                break;
            end
            to_break = 0;
            break
        end
        if to_break == 1 %pokud v nekonečném cyklu (našel jsem všechno co můžu) break
            break
        end
    end
    x = -1 * x;%kořeny jsou počítány s obrácenými hodnotami
    x = x'; %code critic chce sloupce
end
