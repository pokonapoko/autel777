let log = [];
export default function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') { return res.status(200).end(); }
  if(req.method === 'POST'){
    const entry = { time: req.body.time, etat: req.body.etat };
    log.push(entry);
    if(log.length > 50) log.shift();
  }
  res.status(200).json(log);
}
