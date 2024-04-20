const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("HalvingTokenModule", (m) => {

  const token = m.contract("HalvingToken", [], {
    value: 0,
  });

  return { token };
});
