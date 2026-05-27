# Aivion Guardian™ — AI-Powered Data Drift Radar (Starter)

Real-time **data drift** + **schema change** detection with a live Streamlit dashboard.

## Quick Start
```bash
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env

# create baseline + empty stream
python scripts/generate_baseline.py

# start stream (terminal 1)
python ingestion/simulator.py

# run checks (terminal 2)
python orchestration/run_demo.py

# launch dashboard (terminal 3)
streamlit run dashboards/streamlit_app.py
```
