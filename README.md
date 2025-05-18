# Guide d'utilisation

[![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](https://opensource.org/licenses/MIT)

## Préparation de l'environnement 

1. Créez un environnement virtuel : 

    python3.11 -m venv mon_venv 
    source mon_venv/bin/activate
    pip install --upgrade pip   
    pip install -r requirements.txt

2. Placez les fichiers `.mat` dans le dossier `Data/`.

## Étapes principales

1. Exécutez le script MATLAB : `script_barcode_channel_id.m`
2. Lancez les scripts de construction (`BuildPlk_batchX`) nécessaires.
3. Suivez l'ordre des notebooks ci-dessous en utilisant le kernel de l'environnement virtuel.

## Ordre des notebooks 

- `1_preparation.ipynb` : Préparation des données (nettoyage, création de fenêtres glissantes).
- `2_rf_search_window.ipynb` : Recherche de la taille optimale de fenêtre avec Random Forest.
- `3_1_rf_gridsearch.ipynb` : Grid search des hyperparamètres pour Random Forest.
- `3_2_rf.ipynb` : Entraînement du modèle Random Forest (meilleurs hyperparamètres, graphiques SHAP).
- `4_regressions_grid_search.ipynb` : Grid search pour les modèles de régression (Linéaire, Ridge, Lasso, Elastic Net). Graphique SHAP sur meilleur modèle.
- `5_1_xgboost_gridsearch.ipynb` : Grid search pour XGBoost.
- `5_2_xgboost.ipynb` :  Entraînement de XGBoost (meilleurs hyperparamètres, sauvegarde).
- `6_cnn.ipynb` : Entraînement d'un modèle CNN 1D.
- `6_lstm.ipynb` :  Entraînement d'un modèle LSTM.
- `6_rnn.ipynb` :  Entraînement d'un modèle RNN.
- `7_results.ipynb` : Comparaison des performances des différents modèles.
- `8_xgboost_XAI.ipynb` : Analyse d'explicabilité du meilleur modèle (XGBoost).


## Remarque 
Le notebook `9_cnn_timeshap.ipynb` est un essai d’implémentation de TimeSHAP et n'est pas essentiel pour ce pipeline.


## Structure des dossiers
- `archive` : Anciens notebooks (work in progress).
- `Data` : Données brutes, fenêtres glissantes et données de sortie de la préparation. (*Exclu du dépôt via .gitignore pour éviter une surcharge*).
- `Data_to_Share` : Performances des différents modèles pour le notebook `7_results.ipynb`.
- `Images` : Graphiques et visualisations (notamment pour l’explicabilité).
- `Models` : Paramètres des modèles et sauvegardes des entraînements, pour réutilisation sans réentraînement.
