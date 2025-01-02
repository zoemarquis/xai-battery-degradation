input_dir = '/Users/zoemarquis/Documents/projet_industrie/projet_batteries/Data/' ;

% Décommente un par un
% input_filename = '2017-05-12_batchdata_updated_struct_errorcorrect.mat'; 
% input_filename = '2017-06-30_batchdata_updated_struct_errorcorrect.mat';
input_filename = '2018-04-12_batchdata_updated_struct_errorcorrect.mat';

% Créer le chemin complet vers le fichier
file_path = fullfile(input_dir, input_filename);

% Charger le fichier MAT dans le workspace
load(file_path);

% Afficher les variables chargées dans le workspace
disp('Fichier chargé avec succès.');
whos;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fields = fieldnames(batch);
disp('Types des champs dans la structure :');
for i = 1:numel(fields)
    field = fields{i};
    data = batch.(field);
    fprintf('Champ: %s, Type: %s\n', field, class(data));  % Afficher le type du champ
end

% Vérifier si 'channel_id' existe et le convertir en entier
if isfield(batch, 'channel_id')
    for i = 1:numel(batch)
        % Extraire le champ channel_id
        channel_id_data = batch(i).channel_id;
        
        % Vérifier le type de channel_id et effectuer la conversion
        if isstring(channel_id_data)
            % Convertir chaque chaîne en entier
            channel_id_int = str2double(channel_id_data); % Convertit une chaîne en nombre
            
            if ~isnan(channel_id_int) % Vérifie si la conversion est réussie
                batch(i).channel_id_int = int32(channel_id_int); % Ajouter en tant qu'entier
            else
                warning('Element %d : Conversion échouée pour channel_id = %s', i, channel_id_data);
            end
        else
            warning('Element %d : channel_id n''est pas un type chaîne.', i);
        end
    end
    disp('La colonne channel_id a été dupliquée et convertie en entier.');
else
    disp('Le champ channel_id n''existe pas dans la structure.');
end


% Vérifier si le champ barcode existe
if isfield(batch, 'barcode')
    for i = 1:numel(batch)
        % Extraire le champ barcode
        barcode_data = batch(i).barcode;
        
        % Vérifier si c'est un type string
        if isstring(barcode_data)
            % Vérifier si le barcode commence par "EL150800"
            if startsWith(barcode_data, "EL150800")
                % Extraire la partie numérique après "EL150800"
                numeric_part = extractAfter(barcode_data, "EL150800");
                
                % Convertir la partie numérique en entier
                barcode_numeric = str2double(numeric_part);
                
                if ~isnan(barcode_numeric) % Vérifier si la conversion a réussi
                    batch(i).barcode_numeric = int64(barcode_numeric); % Ajouter en tant qu'entier
                else
                    warning('Element %d : Conversion échouée pour barcode = %s', i, barcode_data);
                end
            else
                if startsWith(barcode_data, "el150800")
                    % Extraire la partie numérique après "EL150800"
                    numeric_part = extractAfter(barcode_data, "el150800");
                    
                    % Convertir la partie numérique en entier
                    barcode_numeric = str2double(numeric_part);
                    
                    if ~isnan(barcode_numeric) % Vérifier si la conversion a réussi
                        batch(i).barcode_numeric = int64(barcode_numeric); % Ajouter en tant qu'entier
                    else
                        warning('Element %d : Conversion échouée pour barcode = %s', i, barcode_data);
                    end
                else
                    warning('Element %d : Barcode ne commence pas par "EL150800".', i);
                end
            end
        else
            warning('Element %d : barcode n''est pas un type chaîne.', i);
        end
    end
    disp('Les barcodes ont été traités et la partie numérique ajoutée.');
else
    disp('Le champ barcode n''existe pas dans la structure.');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Générer un nouveau nom pour le fichier de sortie
[~, name, ext] = fileparts(input_filename);  % Extraire nom et extension
output_filename = ['zoe_modified_' name ext];  % Ajouter le préfixe

% Spécifier le chemin du dossier de destination
output_dir = '/Users/zoemarquis/Documents/projet_industrie/projet_batteries/Data/';

% Sauvegarder la variable 'batch' dans le dossier spécifié
% save(fullfile(output_dir, output_filename), 'batch');
save(fullfile(output_dir, output_filename), 'batch', '-v7.3');

% Sauvegarder la structure mise à jour
% save(output_filename, 'batch');
disp(['Batch mis à jour et sauvegardé sous : ', output_filename]);
