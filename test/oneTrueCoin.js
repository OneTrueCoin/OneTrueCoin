var OneTrueCoin = artifacts.require("./OneTrueCoin.sol");

contract('OneTrueCoin', function(accounts) {
    it("the first account should own the one coin to rule them all", async function() {
        const otc = await OneTrueCoin.deployed()
        const isOwner = await otc.isOwner.call(accounts[0])
        console.log(isOwner)
        assert.isTrue(isOwner, "The original account isn't the owner of the coin!")
    });

    it("can transfer the coin", async function() {
        const otc = await OneTrueCoin.deployed()
        const owner = await otc.getOwner.call()
        assert.equal(accounts[0], owner, "The first user should be the owner")
        await otc.sendCoin(accounts[1], {from: owner})
        const newOwner = await otc.getOwner.call()
        assert.equal(newOwner, accounts[1], "The new user should be the owner")
    });
});
