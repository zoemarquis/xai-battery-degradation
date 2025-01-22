    python3.11 -m venv mon_venv 
    source mon_venv/bin/activate
    pip install --upgrade pip   
    pip install -r requirements.txt

- Télécharger les fichiers .mat
- Les mettre dans Data/
- Dans les notebooks utiliser le Kernel du venv

- Jouer le script matlab `script_barcode_channel_id.m`
- Jouer les Build 
- Jouer les notebooks en suivant l'ordre:
    - `1_preparation.ipynb`
    - `2_rf_search_window.ipynb`
    - `3_1_rf_gridsearch.ipynb`
    - `3_2_rf.ipynb`
    - `4_regressions_grid_search.ipynb`
    - `5_1_xgboost_gridsearch.ipynb`
    - `5_2_xgboost.ipynb`
    - `6_cnn.ipynb`
    - `6_lstm.ipynb`
    - `6_rnn.ipynb`
    - `7_results.ipynb`
    - `8_xgboost_XAI.ipynb`


- Explication à quoi sert chaque Notebook : 
    - `1_preparation.ipynb` : Préparation des données, nettoyage, création des fenêtres glissantes
    - `2_rf_search_window.ipynb` : Recherche incrémental avec Random Forest pour déterminer la bonne taille de fenêtre
    - `3_1_rf_gridsearch.ipynb` : Grid search pour déterminer les meilleurs hyperparamètres pour Fandom Forest
    - `3_2_rf.ipynb` : Entraînement du modèle avec mielleurs hyperparametres (et sauvegarde). Quelques grpahiques SHAP.
    - `4_regressions_grid_search.ipynb` : Grid search régression : Linéaire, Ridge, Lasso, Elastic Net. Graphique SHAP avec le  meilleur modèle.
    - `5_1_xgboost_gridsearch.ipynb` : Grid search XGBoost : recherche des meilleurs hyperparamètres.
    - `5_2_xgboost.ipynb` : Entraînement de XGBoost avec les meilleurs hyperparamètres (et sauvegarde du modèle).
    - `6_cnn.ipynb` : Entraînement d'un CNN 1D.
    - `6_lstm.ipynb` :  Entraînement d'un LSTM.
    - `6_rnn.ipynb` :  Entraînement d'un RNN.
    - `7_results.ipynb` : Comparaison performances des différents modèles.
    - `8_xgboost_XAI.ipynb` : Extraire explicabilité du meilleur modèle : XGBoost.

Le notebook `9_cnn_timeshap.ipynb` est un reste d'un essai d'implémentation de `timeshap`.