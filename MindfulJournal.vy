# @version ^0.3.10
from vyper.interfaces import ERC20

journal_token: public(ERC20)

struct JournalEntry:
    owner: address
    content: String[500]  # Limit journal entry length
    is_public: bool

journals: public(HashMap[uint256, JournalEntry])
user_journal_count: public(HashMap[address, uint256])
token_required: public(uint256)

event JournalCreated:
    user: address
    entry_id: uint256
    is_public: bool

@external
def __init__(_token: address, _token_required: uint256):
    """
    Initialize contract with ERC-20 token address and minimum token balance required to create entries.
    """
    self.journal_token = ERC20(_token)
    self.token_required = _token_required

@external
def create_journal(content: String[500], is_public: bool):
    """
    Creates a journal entry. User must hold the required ERC-20 tokens.
    """
    assert self.journal_token.balanceOf(msg.sender) >= self.token_required, "Insufficient tokens to journal"

    entry_id: uint256 = self.user_journal_count[msg.sender] + 1
    self.journals[entry_id] = JournalEntry({
        owner: msg.sender,
        content: content,
        is_public: is_public
    })
    self.user_journal_count[msg.sender] = entry_id

    log JournalCreated(msg.sender, entry_id, is_public)

@external
@view
def view_journal(entry_id: uint256) -> String[500]:
    """
    Allows users to view a journal entry.
    - Public entries can be viewed by anyone.
    - Private entries can only be viewed by the owner.
    """
    journal: JournalEntry = self.journals[entry_id]
    assert journal.is_public or journal.owner == msg.sender, "Private journal entry"

    return journal.content

@external
def toggle_privacy(entry_id: uint256):
    """
    Allows the owner of a journal entry to toggle its privacy setting.
    """
    assert self.journals[entry_id].owner == msg.sender, "Not your journal"
    self.journals[entry_id].is_public = not self.journals[entry_id].is_public
