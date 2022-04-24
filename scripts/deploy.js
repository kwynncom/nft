async function main() {

	// Get our account (as deployer) to verify that a minimum wallet balance is available
	const [deployer] = await ethers.getSigners();

	console.log(`Deploying contracts with the account: ${deployer.address}`);
	console.log(`Account balance: ${(await deployer.getBalance()).toString()}`);

	// Fetch the compiled contract using ethers.js
	const NFT = await ethers.getContractFactory("NFT");
	// calling deploy() will return an async Promise that we can await on 
	const nft = await NFT.deploy();

	// nft.setWL(0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097);

	console.log(`Contract deployed to address: ${nft.address}`);
}

main()
.then(() => process.exit(0))
.catch((error) => {
	console.error(error);
	process.exit(1);
});