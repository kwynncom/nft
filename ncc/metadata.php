<?php

require_once('/opt/kwynn/kwutils.php');

$fs = glob('rawimages/*');

$URI = false;

$cnt1 = count($fs);

$info = [];
$hashes = [];

$i = 1;
foreach($fs as $f) {
	$t = pathinfo($f ); 
	$h = $t['sha512'] = hash_file('sha512', $f);
	kwas(!isset($hashes[$h]), 'hash already exists!!!');
	$hashes[$h] = true;
	$t['seq'] = $i;
	$nn = $t['filename'] = ((string)($i)) . '.' . strtolower($t['extension']); unset($t['extension']);
	$i++;
	save_md($t);
	$newPath = __DIR__ . '/../md/images' . '/' . $nn;
	if (!file_exists($newPath)) kwas(copy($f, $newPath), 'copy failed');
	else kwas($h === hash_file('sha512', $newPath));
	$info[] = $t;
	continue;
}

// cd ~/nft && npx ipfs-car --pack /tmp/i --output /tmp/test.car
// cd ~/nft && npx ipfs-car --pack /tmp/i 
// root CID: bafybeiausa5xpyncqe3bodo3v4jokoq26dxrckonsap7xtkpjrhhq64wbe
// output: i.car
// npx ipfs-car --list-roots /tmp/test.car
// bafybeiausa5xpyncqe3bodo3v4jokoq26dxrckonsap7xtkpjrhhq64wbe


kwas(count($fs) === count($hashes), 'not unique files!');
echo(count($hashes) . ' unique files' . "\n");

exit(0);

function save_md($a) {
	
	global $URI;
	
	$f =  $a['filename'];
	$seq = $a['seq'];
	$a['originalFileName'] = $a['basename'];
	if ($URI) $a['image'] = $URI . $f; 
	
	$keep = ['originalFileName', 'filename', 'sha512', 'image'];
	foreach($a as $key => $ignore) if (!in_array($key, $keep)) unset($a[$key]);

	$newfn = __DIR__ . '/../md/metadata/' . $seq;
	file_put_contents($newfn, json_encode($a, JSON_PRETTY_PRINT |  JSON_UNESCAPED_SLASHES));
	
}

// https://docs.opensea.io/docs/part-3-adding-metadata-and-payments-to-your-contract