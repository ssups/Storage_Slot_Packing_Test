import { ethers } from "hardhat";
import { StorageSlot } from "../typechain-types";

describe("StorageSlotTest", () => {
  let contract: StorageSlot;
  let signer: any;
  before(async () => {
    contract = (await ethers.deployContract("StorageSlot")) as StorageSlot;
    [signer] = await ethers.getSigners();
  });
  it("all", async () => {
    const promises = Object.values(contract.functions).map((func) => {
      return func();
    });
    await Promise.all(promises);
  });
});
