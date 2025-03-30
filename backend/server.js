import app from './app.js';

// Konfiguracja środowiskowa (.env)


// Port serwera (z pliku .env lub domyślny 5000)
const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`🚀 Serwer uruchomiony na porcie ${PORT}`);
});