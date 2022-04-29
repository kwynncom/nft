<?php

require_once('/opt/kwynn/kwutils.php');

$fs = glob('rawimages/*');

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
	copy($f, __DIR__ . '/../md/images' . '/' . $nn);
	$info[] = $t;
	continue;
}

kwas(count($fs) === count($hashes), 'not unique files!');
echo(count($hashes) . ' unique files' . "\n");

exit(0);

function save_md($a) {
	$f =  $a['filename'];
	$seq = $a['seq'];
	$a['originalFileName'] = $a['basename'];
	
	$keep = ['originalFileName', 'filename', 'sha512'];
	foreach($a as $key => $ignore) if (!in_array($key, $keep)) unset($a[$key]);

	file_put_contents(__DIR__ . '/../md/metadata/' . $seq, json_encode($a, JSON_PRETTY_PRINT));
	
}

// https://docs.opensea.io/docs/part-3-adding-metadata-and-payments-to-your-contract