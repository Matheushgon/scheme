# scheme
Arvore Binária - testes
  (define arvore (inserir-no 5 '()))   ; Criar árvore inicial com nó 5

  (set! arvore (inserir-no 3 arvore))  ; Inserir 3
  (set! arvore (inserir-no 7 arvore))  ; Inserir 7
  (set! arvore (inserir-no 4 arvore))  ; Inserir 4
  (set! arvore (inserir-no 6 arvore))  ; Inserir 6

  (set! arvore (remover-no 3 arvore))

  (display (buscar-no 4 arvore))  ; #t (existe)
  (display (buscar-no 10 arvore))  ; #f (não existe)
