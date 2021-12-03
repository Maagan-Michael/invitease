from main import app
import os

if __name__ == '__main__':
    os.environ['IVT_CONNECTION_STRING'] = 'postgresql://invitease:password@localhost:5432/invitease'
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)
