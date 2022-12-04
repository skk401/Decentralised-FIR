const main = async () => {
    const waveContractFactory = await hre.ethers.getContractFactory("FIR");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
    console.log("Contract addy:", waveContract.address);
  
    let waveCount;
    waveCount = await waveContract.getTotalCases();
    console.log(waveCount.toNumber());
  
    /**
     * Let's send a few waves!
     */
    let waveTxn = await waveContract.Case("A message!");
    await waveTxn.wait(); // Wait for the transaction to be mined
  
    const [_, randomPerson] = await hre.ethers.getSigners();
    waveTxn = await waveContract.connect(randomPerson).Case("Another message!");
    await waveTxn.wait(); // Wait for the transaction to be mined

    waveTxn = await waveContract.Case("Aayiye dekhte hai bhenchod!");
    await waveTxn.wait(); // Wait for the transaction to be mined
  
    let allWaves = await waveContract.getAllWaves();
    console.log(allWaves);
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0); // exit Node process without error
    } catch (error) { 
      console.log(error);
      process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
    }
    // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
  };
  
  runMain();