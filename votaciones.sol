pragma solidity ^0.4.11;
// Versión del compilador

contract Votaciones {

  /* Hash que asocia los nombres de los candidatos (bytes32) con el
  número de votos recibidos (uint8) */
  mapping (bytes32 => uint8) public tablaDeVotaciones;

  // La lista de candidatos se almacena en un vector de tipo bytes32
  bytes32[] public listaDeCandidatos;

  // Constructor
  function Votaciones(bytes32[] nombresDeCandidatos) {
    listaDeCandidatos = nombresDeCandidatos;
  }

  // Esta función devuelve el total de votos que un candidato ha recibido hasta el momento
  function numeroDeVotosPara(bytes32 candidato) returns (uint8) {
    if (elCandidatoEsValido(candidato) == false) throw;
    return tablaDeVotaciones[candidato];
  }

  // Esta función incrementa el número de votos de un candidato
  function votarPor(bytes32 candidato) {
    if (elCandidatoEsValido(candidato) == false) throw;
    tablaDeVotaciones[candidato] += 1;
  }

  function elCandidatoEsValido(bytes32 candidato) returns (bool) {
    for(uint i = 0; i < listaDeCandidatos.length; i++) {
      if (listaDeCandidatos[i] == candidato) {
        return true;
      }
    }
    return false;
  }
}