// Importando Web3
const Web3 = require('web3');

// Conectando ao provedor do Ethereum (exemplo com Metamask)
const web3 = new Web3(window.ethereum);
await window.ethereum.enable();

// Substituir pelo endereço do contrato após o deploy
const contractAddress = 'YOUR_CONTRACT_ADDRESS_HERE';
const contractABI = []; // Substituir pelo ABI gerado após compilar o contrato

const contract = new web3.eth.Contract(contractABI, contractAddress);

async function createProject() {
    const accounts = await web3.eth.getAccounts();
    contract.methods.createProject().send({ from: accounts[0] })
    .then(function(result){
        alert('Projeto criado com sucesso!');
        console.log(result);
    })
    .catch(function(error){
        console.error('Erro ao criar projeto:', error);
    });
}

document.getElementById('projects').innerHTML = `<p>Carregue projetos aqui...</p>`;
