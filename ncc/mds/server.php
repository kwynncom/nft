<?php

require_once('/opt/kwynn/kwutils.php');

$rawin = isrv('tokenId'); kwas($rawin && is_numeric($rawin), 'bad input 10');
$tid = intval($rawin); kwas($tid >= 1, 'bad input 20');

kwas($tid === 1, 'only number 1 is supported');

$a = [];
$a['name'] = 'test token local 1 name';
$a['description'] = 'test  token local 1 descr';
$a['image'] = 'https://ipfs.io/ipfs/bafybeid6dp7rbskcx6fnlfeeuuf37ujwayffyvhhk7nzbpcfypig3pwrbq/images/1.png';

kwjae($a);
