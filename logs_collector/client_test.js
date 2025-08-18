import WebSocket from "ws";

// Replace with your server URL and optional secret key

const ws = new WebSocket("wss://localhost:8080", {
  rejectUnauthorized: false // <- this ignores the certificate check
});

// Connection opened
ws.on("open", () => {
  console.log("Connected to server");
  ws.send("qwer");
});

// Receive messages
ws.on("message", (msg) => {
  console.log("Server:", msg.toString());
});

// Handle errors
ws.on("error", (err) => {
  console.error("WebSocket error:", err.message);
});

// Connection closed
ws.on("close", (code, reason) => {
  console.log(`Disconnected: ${code} ${reason}`);
});
