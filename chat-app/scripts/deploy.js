const hre = require("hardhat");

async function main() {
  const ChatDapp = await hre.ethers.getContractFactory("ChatDapp");
  const chatDapp = await ChatDapp.deploy();

  await chatDapp.deployed();

  console.log(`Contract Address: ${chatDapp.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

