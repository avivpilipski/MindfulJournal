https://mindfuljournal-c5bf0.web.app/
# Mindful Journal

A decentralized journaling application that allows users to record their thoughts and reflections securely on the blockchain, with options for private or public entries.

## Overview

Mindful Journal is a Web3 application that combines blockchain technology with a clean, user-friendly interface for personal journaling. Users can:
- Connect their Ethereum wallet (via MetaMask)
- Create journal entries that are stored on the blockchain
- Choose to make entries public or keep them private
- View their personal journal history
- Browse public journal entries from other users

## Features

- **Wallet Integration**: Connects with MetaMask for secure authentication and transaction signing
- **Privacy Options**: Toggle between public and private entries
- **Blockchain Storage**: Entries are stored on Ethereum blockchain with metadata in Firebase
- **Responsive Design**: Mobile-friendly interface
- **Transaction Tracking**: View entries with blockchain transaction details (block number, tx hash)

## Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript
- **Blockchain**: 
  - Ethers.js v5.7.2 for Ethereum interaction
  - Smart Contract deployed at `0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47`
- **Database**: Firebase Firestore for metadata storage
- **Dependencies**:
  - Firebase SDK 9.17.2
  - Ethers.js CDN

## Setup Instructions

1. **Prerequisites**:
   - MetaMask browser extension installed
   - Modern web browser (Chrome, Firefox recommended)
   - Ethereum network access (supports Mainnet, Polygon, Sepolia)

2. **Deployment**:
   - Clone the repository or use the HTML file directly
   - Host on any static file server (GitHub Pages, Netlify, etc.)
   - No additional build steps required as it's a single HTML file

3. **Configuration**:
   - Firebase configuration is embedded in the code (update with your own credentials if forking)
   - Contract address and ABI are predefined (update if deploying your own contract)

## Usage

1. Open the website in a browser with MetaMask installed
2. Click "Connect Wallet" to link your Ethereum account
3. Write your journal entry in the text area
4. Toggle the "Make Public" switch as desired
5. Click "Save Journal Entry" to record it on the blockchain
6. View your entries under "Your Journal Entries"
7. Browse community posts under "Public Journal Entries"

## Development Notes

- **Smart Contract**: 
  - Functions: `create_journal`, `view_journal`, `toggle_privacy`
  - Events: `JournalCreated`

- **Firestore Structure**:
  - Collection: `journals`
  - Fields: `owner`, `lowercaseOwner`, `content`, `is_public`, `tx_hash`, `block_number`, `network_id`, `etherscan_domain`, `timestamp`

- **Indexes Required**:
  - `journals`: `lowercaseOwner ASC, timestamp DESC`
  - `journals`: `owner ASC, timestamp DESC`

- **Error Handling**: 
  - Wallet connection errors
  - Transaction failures
  - Firestore query issues

## Styling

- Modern, clean design with green accents
- CSS custom properties for easy theming
- Responsive layout with media queries
- Card-based UI with subtle shadows
- Custom toggle switch component

## Known Limitations

- Requires MetaMask or Web3-compatible browser
- Gas fees apply for each journal entry
- Firestore indexes must be manually created in Firebase console
- Limited to 20 public entries in display

## Future Improvements

- Add journal entry editing
- Implement pagination for journal lists
- Add search functionality
- Support additional blockchain networks
- Add user profile features

## Contributing

Feel free to fork and submit pull requests with improvements! Issues and feature requests are welcome in the repository's issue tracker.

## License

MIT License - feel free to use and modify for personal or commercial use.