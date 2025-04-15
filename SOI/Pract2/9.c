// Sin sincronizacion: 0.006s
// Peterson: 0.074s
// incl: 0.080
// con mutex: 0.087s
// Un molinete: 0.007s

// con 40Millones:
// un molinete: 0.724s
// Peterson mfence: 7.659s
// locks: 7.274s

// Me esta llevando muchisimo mas tiempo hacer el lock que lo que me lleva la operacion del ++.
