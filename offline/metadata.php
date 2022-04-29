<?php

require_once('/opt/kwynn/kwutils.php');

$fs = glob(__DIR__ . '/../md/images/*');

$cnt1 = count($fs);

$info = [];
$hashes = [];

$i = 0;
foreach($fs as $f) {
	$t = pathinfo($f);
	$h = $t['sha512'] = hash_file('sha512', $f);
	kwas(!isset($hashes[$h]), 'hash already exists!!!');
	$hashes[$h] = true;
	$t['newname'] = ((string)(++$i)) . '.' . strtolower($t['extension']);
	$info[] = $t;
	continue;
}

kwas(count($fs) === count($hashes), 'not unique files!');
echo(count($hashes) . ' unique files' . "\n");

exit(0);