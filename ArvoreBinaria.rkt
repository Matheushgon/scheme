#lang scheme

;cria um nó
(define (cria-no valor esquerda direita)
  (list valor esquerda direita))

;pega o valor do nó
(define (valor-no no)
  (car no))

;pega a subárvore esquerda
(define (no-esquerda no)
  (cadr no))

;pega a subárvore direita
(define (no-direita no)
  (caddr no))

;verifica se o nó é vazio
(define (no-vazio? no)
  (null? no))

;insere um valor
(define (inserir-no valor no)
  (if (no-vazio? no)
      (cria-no valor '() '())  ;criar um novo nó se a árvore estiver vazia
      (let ((valor-no-atual (valor-no no))
            (esquerda (no-esquerda no))
            (direita (no-direita no)))
        (cond
          ((= valor valor-no-atual) no)  ;se o valor já existir, retorna a árvore sem mudanças
          ((< valor valor-no-atual)
           (cria-no valor-no-atual (inserir-no valor esquerda) direita))  ;insere na esquerda
          (else
           (cria-no valor-no-atual esquerda (inserir-no valor direita))))))) ;insere na direita

;retorna o menor nó da subárvore direita
(define (minimo-no no)
  (if (no-vazio? (no-esquerda no))
      no
      (minimo-no (no-esquerda no))))

;remove um nó com determinado valor
(define (remover-no valor no)
  (if (no-vazio? no)
      no  ;retorna vazio se o nó não for encontrado
      (let ((valor-no-atual (valor-no no))
            (esquerda (no-esquerda no))
            (direita (no-direita no)))
        (cond
          ((< valor valor-no-atual)  ;buscar na esquerda
           (cria-no valor-no-atual (remover-no valor esquerda) direita))
          ((> valor valor-no-atual)  ;buscar na direita
           (cria-no valor-no-atual esquerda (remover-no valor direita)))
          (else
           (cond
             ((no-vazio? esquerda) direita)   ;sem filhos ou só tem filho direito
             ((no-vazio? direita) esquerda)   ;só tem filho esquerdo
             (else
              (let* ((min-no (minimo-no direita))   ;tem dois filhos
                     (novo-valor (valor-no min-no))
                     (nova-direita (remover-no novo-valor direita)))  ;remove substituto
                (cria-no novo-valor esquerda nova-direita)))))))))  ;substitui pelo menor da direita

;busca um valor e retorna #t ou #f
(define (buscar-no valor no)
  (if (no-vazio? no)
      #f  ;não encontrou
      (let ((valor-no-atual (valor-no no)))
        (cond
          ((= valor valor-no-atual) #t)  ;encontrou
          ((< valor valor-no-atual) (buscar-no valor (no-esquerda no)))  ;buscar na esquerda
          (else (buscar-no valor (no-direita no)))))))  ;buscar na direita
