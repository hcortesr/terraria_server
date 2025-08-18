import {WebSocketServer} from 'ws';
import fs from 'fs';
import readline from 'readline';
import https from 'https'

// Load SSL certificates
const server = https.createServer({
  key: fs.readFileSync('server.key'),
  cert: fs.readFileSync('server.cert')
});

// Map auth users
const users = new Map();

// Password
const password = "qwer";

// Read input from terminal
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Create WebSocket server on top of HTTPS server
const wss = new WebSocketServer({ server });

wss.on('connection', (ws) => {
  console.log('Client connected via WSS');
  users.set(ws, false);
 
  ws.on('message', (message) => {
    if (message == password) {
        ws.send("Correct password");
        users.set(ws, true);
    } else {
        ws.send("Incorrect password");
    }
  });

    ws.send('Welcome to the secure WebSocket server!');
  // Read input from terminal
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
    rl.on("line", (line) => {
        const isAuth = users.get(ws);
        if (isAuth) {
            ws.send(line);
        }
        
    });
    setTimeout(() => {
        ws.close()
    }, 100000)
});



// Start server
server.listen(8080, () => {
  console.log('WSS server running on https://localhost:8080');
});