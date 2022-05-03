const Vaccine = artifacts.require("Vaccine");

contract('Vaccine', function([deployer, user1, user2]) {
    it('construct', async() => {
        console.log('construct');
        vaccine = await Vaccine.new();
    })

    it('claim credentail', async() => {
        console.log('claim credential');
        let result = await vaccine.claimCredential("0x9e99b1aaa2114fdae97c9ab2f20863dfde4659bc", 1);
        console.log(result);
    })

    it('iscredential', async() => {
        console.log('iscredential');
        let result = await vaccine.isCredential("0x9e99b1aaa2114fdae97c9ab2f20863dfde4659bc");
        console.log(result);
    })

    it('getVaccineType', async() => {
        console.log('getVaccineType');
        let result = await vaccine.getVaccineType("0x9e99b1aaa2114fdae97c9ab2f20863dfde4659bc");
        console.log(result);
    })
})