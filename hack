index.html
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Hacked Phone</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: black;
      color: #00ff00;
      font-family: 'Courier New', monospace;
      text-align: center;
      overflow: hidden;
    }
    h1 {
      margin-top: 20%;
      font-size: 3em;
      text-shadow: 0 0 10px #00ff00, 0 0 20px #00ff00;
      animation: glitch 1s infinite;
    }
    @keyframes glitch {
      0% { text-shadow: 2px 2px #ff0000; }
      25% { text-shadow: -2px -2px #00ffff; }
      50% { text-shadow: 2px -2px #ff00ff; }
      75% { text-shadow: -2px 2px #ffff00; }
      100% { text-shadow: 0 0 10px #00ff00; }
    }
    .matrix {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      color: #00ff00;
      font-size: 18px;
      pointer-events: none;
    }
  </style>
</head>
<body>
  <h1>📱 Hacked Phone 📱</h1>
  <canvas class="matrix"></canvas>

  <script>
    // Matrix rain effect
    const canvas = document.querySelector(".matrix");
    const ctx = canvas.getContext("2d");

    canvas.height = window.innerHeight;
    canvas.width = window.innerWidth;

    const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    const fontSize = 14;
    const columns = canvas.width / fontSize;
    const drops = [];

    for (let x = 0; x < columns; x++) {
      drops[x] = 1;
    }

    function draw() {
      ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
      ctx.fillRect(0, 0, canvas.width, canvas.height);

      ctx.fillStyle = "#0F0";
      ctx.font = fontSize + "px Courier New";
      for (let i = 0; i < drops.length; i++) {
        const text = letters.charAt(Math.floor(Math.random() * letters.length));
        ctx.fillText(text, i * fontSize, drops[i] * fontSize);

        if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) {
          drops[i] = 0;
        }
        drops[i]++;
      }
    }

    setInterval(draw, 33);
  </script>
</body>
</html>
