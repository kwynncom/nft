<?php

require_once('/opt/kwynn/kwutils.php');

define('WHITELIST_ALLOWED_MINTS', 2);

$t = file_get_contents('rawWhitelist.txt'); // MUST BE MIXED-CASE / checksummed!
define(		  'ETH_ADDR_REGEX', '/0x[A-Fa-f0-9]{40}/');
preg_match_all(ETH_ADDR_REGEX, $t, $ms);

if (!isset($ms[0][0])) { echo('no addresses found'); exit(0); }

$ain = $ms[0]; unset($ms);
$n = count($ain);
echo("$n addresses before uniqueness check\n");

$out = [];

foreach($ain as $a) $out[$a] = 1 /* temp value */; unset($a);

echo(count($out) . ' addresses after uniqueness check' . "\n");

$l = '';
foreach($out as $addr => $ignore) {
	$l .= '	thelistv[' . $addr . '] = ' . WHITELIST_ALLOWED_MINTS . ';' . "\n";
}

$needle = '// NFT-WHITELIST-AUTOGEN-GOES-BELOW' . "\n";

$p = __DIR__ . '/../contracts/whitelist.sol';
$f = file_get_contents($p);
$f = str_replace($needle, $needle . $l, $f);
file_put_contents($p, $f);

echo($f);

exit(0);
