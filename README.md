# 💰 TipJar Smart Contract

A simple and secure Ethereum smart contract that allows users to send tips with messages to a contract owner. Perfect for content creators, developers, or anyone looking to receive cryptocurrency donations with personalized messages. 💬✨

## ✨ Features

- **💸 Send Tips**: Users can send ETH tips along with custom messages
- **📝 Event Logging**: All tips are logged with sender address, amount, and message
- **🔐 Owner Withdrawal**: Only the contract owner can withdraw accumulated tips
- **📊 Balance Tracking**: Public function to check the contract's current balance
- **⚡ Gas Efficient**: Minimal gas consumption for tip transactions

## 📋 Contract Overview

The TipJar contract is built with Solidity ^0.8.20 and follows best practices for security and efficiency. 🏗️

### 🔧 Core Functions

#### 💰 `sendTip(string calldata _message)`
- Allows users to send ETH tips with a custom message
- Requires a non-zero tip amount
- Emits a `NewTip` event for transparency

#### 💳 `withdrawTips()`
- Restricted to contract owner only
- Transfers entire contract balance to owner
- Uses `transfer()` for secure ETH transmission

#### 📊 `getBalance()`
- Public view function
- Returns current contract balance in wei
- No gas cost when called externally

### 📡 Events

```solidity
event NewTip(address indexed from, uint256 amount, string message);
```

Emitted whenever a new tip is received, including:
- `from`: Address of the tipper
- `amount`: Tip amount in wei
- `message`: Custom message from the tipper

## 🚀 Deployment

### 📋 Prerequisites

- Node.js and npm 📦
- Hardhat or Truffle development environment 🔨
- MetaMask or similar Web3 wallet 🦊
- Test ETH for deployment (Sepolia, Goerli, etc.) 🧪

### 📝 Deployment Steps

1. **🔧 Compile the contract:**
   ```bash
   npx hardhat compile
   ```

2. **🌐 Deploy to testnet:**
   ```bash
   npx hardhat run scripts/deploy.js --network sepolia
   ```

3. **✅ Verify on Etherscan (optional):**
   ```bash
   npx hardhat verify --network sepolia CONTRACT_ADDRESS
   ```

## 💡 Usage Examples

### 💸 Sending a Tip

```javascript
// Using ethers.js
const tipJar = new ethers.Contract(contractAddress, abi, signer);
const tx = await tipJar.sendTip("Thanks for the great content!", {
    value: ethers.parseEther("0.01") // 0.01 ETH tip
});
await tx.wait();
```

### 📊 Checking Balance

```javascript
const balance = await tipJar.getBalance();
console.log(`Current balance: ${ethers.formatEther(balance)} ETH`);
```

### 💰 Withdrawing Tips (Owner Only)

```javascript
const tx = await tipJar.withdrawTips();
await tx.wait();
```

## 🔒 Security Considerations

- **👑 Owner Privileges**: Only the deployer can withdraw funds
- **🛡️ Reentrancy Protection**: Uses `transfer()` which limits gas and prevents reentrancy
- **✅ Input Validation**: Requires non-zero tip amounts
- **🌐 Event Transparency**: All tips are publicly logged

## ⛽ Gas Estimates

| Function | Estimated Gas |
|----------|---------------|
| `sendTip()` | ~50,000 gas |
| `withdrawTips()` | ~30,000 gas |
| `getBalance()` | ~2,100 gas |

## 📄 License

This project is licensed under the MIT License - see the contract header for details

---

**⚠️ Disclaimer**: This contract is provided as-is. Please conduct thorough testing before using with real funds. Consider getting a security audit for production deployments. 🔍

