<?php

require_once('/opt/kwynn/kwutils.php');

$rawin = isrv('tokenId'); kwas($rawin && is_numeric($rawin), 'bad input 10');
$tid = intval($rawin); kwas($tid >= 1, 'bad input 20');


$a = [];
$a['name'] = 'test token local name ' . $tid;
$a['description'] = 'test  token local 1 descr ' . $tid;
$a['image'] = 'ipfs://bafybeid6dp7rbskcx6fnlfeeuuf37ujwayffyvhhk7nzbpcfypig3pwrbq/images/' . $tid . '.png';

kwjae($a);
