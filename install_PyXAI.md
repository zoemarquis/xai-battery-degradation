https://www.cril.univ-artois.fr/pyxai/documentation/installation/github/

install PyXAI (sur MacOS)

git clone https://github.com/crillab/pyxai.git
export PYTHONPATH="${PYTHONPATH}:${PWD}/.."
cd pyxai
python3 -m pip install -e .
python3 setup.py install --user

PyXAI’s graphical interface

python3 -m pip install pyqt6