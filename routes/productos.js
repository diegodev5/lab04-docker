const express = require('express');
const router = express.Router();
const pool = require('../db');

router.get('/', async (req, res) => {
  try {
    const resultado = await pool.query(
      'SELECT id, nombre, precio, stock FROM productos ORDER BY id'
    );
    res.json(resultado.rows);
  } catch (error) {
    console.error('Error al consultar productos:', error);
    res.status(500).json({ error: 'No se pudieron consultar los productos' });
  }
});

module.exports = router;
