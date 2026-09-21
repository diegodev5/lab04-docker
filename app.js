const express = require('express');
const app = express();

app.use(express.json());
app.use('/clientes', require('./routes/clientes'));
app.use('/productos', require('./routes/productos'));

app.get('/', (req, res) => {
  res.send('Laboratorio 04 - Aplicación con Express y Docker');
});

app.listen(9000, '0.0.0.0', () => {
  console.log('Servidor iniciado en el puerto 9000');
});
