SECTION .data
	SYS_EXIT_PROGRAM  	equ 1
	SYS_STANDARD_OUTPUT equ 1
	SYS_STANDARD_INPUT 	equ 2
	SYS_READ_FILE  		equ 3
	SYS_WRITE_FILE 		equ 4
	SYSTEM_CALL 		equ 0x80

	mensagemUm: db '',10,0,\
		'TUTOR DE TRUCO',10,0,\
		'Desenvolvido pelos alunos:',10,0,\
		'Eduardo Henrique Cruz | Matricula 258635',10,0,\
		'Lucas Matheus Dorada Marcílio | Matricula 258918',10,0,10,0
	tamanhoMensagemUm: equ $-mensagemUm

	cartas: db '4567qjka23s',0
	naipes: db 'oecps',0

	mensagemCartas: db 'OPÇÕES DE CARTAS',10,0, \
		'4- Quatro',10,0, \
		'5- Cinco',10,0, \
		'6- Seis',10,0, \
		'7- Sete',10,0, \
		'Q- Dama',10,0, \
		'J- Valete',10,0, \
		'K- Rei',10,0, \
		'A- Ás',10,0, \
		'2- Dois',10,0, \
		'3- Três',10,0, \
		'S- SAIR',10,0, \
		'Digite o valor da carta vira ou [S] para sair: ',0
	tamanhoMensagemCartas: equ $-mensagemCartas

	mensagemNaipe: db 'OPÇÕES DE NAIPES',10,0, \
		'O- Ouros',10,0, \
		'E- Espadas',10,0, \
		'C- Copas',10,0, \
		'P- Paus',10,0, \
		'S- SAIR',10,0, \
		'Digite o valor do naipe da carta vira ou [S] para sair: ',0
	tamanhoMensagemNaipes: equ $-mensagemNaipe

	mensagemCartaInvalida: db '',10,0,\
		'O valor da carta digitada é inválido, tente novamente!',10,0
	tamanhoCartaInvalida: equ $-mensagemCartaInvalida

	mensagemNaipeInvalido: db '',10,0,\
		'O valor do naipe digitado é inválido, tente novamente!',10,0
	tamanhoNaipeInvalido: equ $-mensagemNaipeInvalido

	mensagemContinuar: db '',10,0,\
		'Deseja continuar?[S/n]: ',0
	tamanhoMensagemContinuar: equ $-mensagemContinuar

	quatro: db '4 de ',0
	tamanhoQuatro: equ $-quatro
	cinco: db '5 de ',0
	tamanhoCinco: equ $-cinco
	seis: db '6 de ',0
	tamanhoSeis: equ $-seis
	seven: db '7 de ',0
	tamanhoSeven: equ $-seven
	dama: db 'dama de ',0
	tamanhoDama: equ $-dama
	valete: db 'valete de ',0
	tamanhoValete: equ $-valete
	rei: db 'rei de ',0
	tamanhoRei: equ $-rei
	as: db 'ás de ',0
	tamanhoAs: equ $-as
	dois: db '2 de ',0
	tamanhoDois: equ $-dois
	tres: db '3 de ',0
	tamanhoTres: equ $-tres
	
	ouro: db 'ouros',0
	tamanhoOuro: equ $-ouro
	espada: db 'espadas',0
	tamanhoEspada: equ $-espada
	copas: db 'copas',0
	tamanhoCopas: equ $-copas
	paus: db 'paus',0
	tamanhoPaus: equ $-paus

	virgula: db ', ',0
	tamanhoVirgula: equ $-virgula

	virgulaQuebraLinha: db ',',10,0
	tamanhoVirgulaQLinha: equ $-virgulaQuebraLinha

	ponto: db '.',10,0
	tamanhoPonto: equ $-ponto

	quebraLinha: db '',10,0
	tamanhoQuebraLinha: equ $-quebraLinha
SECTION .bss
	opcao: resb 2
	c: resb 2
	n: resb 2
	cartaDigitada: resb 4
	naipeDigitado: resb 4
	vira: resb 4
	tamanhoVira: resb 4
	manilha: resb 4
	tamanhoManilha: resb 4
SECTION .text
	GLOBAL _start
;*********************
; Procedimento que exibe ao usuario
; uma carta com os 4 naipes(4 cartas)
;*********************
exibecarta:
	mov ecx,esi
	mov edx,edi
	call exibemensagem
	mov ecx,ouro
	mov edx,tamanhoOuro
	call exibemensagem
	mov ecx,virgula
	mov edx,tamanhoVirgula
	call exibemensagem

	mov ecx,esi
	mov edx,edi
	call exibemensagem
	mov ecx,espada
	mov edx,tamanhoEspada
	call exibemensagem
	mov ecx,virgula
	mov edx,tamanhoVirgula
	call exibemensagem

	mov ecx,esi
	mov edx,edi
	call exibemensagem
	mov ecx,copas
	mov edx,tamanhoCopas
	call exibemensagem
	mov ecx,virgula
	mov edx,tamanhoVirgula
	call exibemensagem

	mov ecx,esi
	mov edx,edi
	call exibemensagem
	mov ecx,paus
	mov edx,tamanhoPaus
	call exibemensagem
	mov ecx,virgulaQuebraLinha
	mov edx,tamanhoVirgulaQLinha
	call exibemensagem
	ret
;*********************
; Procedimento que exibe ao usuario
; a sequência de cartas excluindo a vira(3 cartas)
;*********************
exibevira:
	mov al,BYTE[naipeDigitado]
	cmp [naipes],al
	jne exibeouro
	jmp comparacaoUm
	exibeouro:
	mov ecx,[vira]
	mov edx,[tamanhoVira]
	call exibemensagem
	mov ecx,ouro
	mov edx,tamanhoOuro
	call exibemensagem
	mov ecx,virgula
	mov edx,tamanhoVirgula
	call exibemensagem

	comparacaoUm:
	mov al,BYTE[naipeDigitado]
	cmp [naipes+1],al
	jne exibeespada
	jmp comparacaoDois
	exibeespada:
	mov ecx,[vira]
	mov edx,[tamanhoVira]
	call exibemensagem
	mov ecx,espada
	mov edx,tamanhoEspada
	call exibemensagem
	mov ecx,virgula
	mov edx,tamanhoVirgula
	call exibemensagem

	comparacaoDois:
	mov al,BYTE[naipeDigitado]
	cmp [naipes+2],al
	jne exibecopas
	jmp comparacaoTres
	exibecopas:
	mov ecx,[vira]
	mov edx,[tamanhoVira]
	call exibemensagem
	mov ecx,copas
	mov edx,tamanhoCopas
	call exibemensagem
	mov ecx,virgula
	mov edx,tamanhoVirgula
	call exibemensagem

	comparacaoTres:
	mov al,BYTE[naipeDigitado]
	cmp [naipes+3],al
	jne exibepaus
	jmp qlinha
	exibepaus:
	mov ecx,[vira]
	mov edx,[tamanhoVira]
	call exibemensagem
	mov ecx,paus
	mov edx,tamanhoPaus
	call exibemensagem
	mov ecx,virgula
	mov edx,tamanhoVirgula
	call exibemensagem

	qlinha:;quebra linha
	mov ecx,quebraLinha
	mov edx,tamanhoQuebraLinha
	call exibemensagem
	ret
;*********************
; Procedimento que exibe ao usuario
; a carta manilha(4 cartas)
;*********************
exibemanilha:
	;ouro
	mov ecx,[manilha]
	mov edx,[tamanhoManilha]
	call exibemensagem
	mov ecx,ouro
	mov edx,tamanhoOuro
	call exibemensagem
	mov ecx,virgulaQuebraLinha
	mov edx,tamanhoVirgulaQLinha
	call exibemensagem
	;espada
	mov ecx,[manilha]
	mov edx,[tamanhoManilha]
	call exibemensagem
	mov ecx,espada
	mov edx,tamanhoEspada
	call exibemensagem
	mov ecx,virgulaQuebraLinha
	mov edx,tamanhoVirgulaQLinha
	call exibemensagem
	;copas
	mov ecx,[manilha]
	mov edx,[tamanhoManilha]
	call exibemensagem
	mov ecx,copas
	mov edx,tamanhoCopas
	call exibemensagem
	mov ecx,virgulaQuebraLinha
	mov edx,tamanhoVirgulaQLinha
	call exibemensagem
	;paus
	mov ecx,[manilha]
	mov edx,[tamanhoManilha]
	call exibemensagem
	mov ecx,paus
	mov edx,tamanhoPaus
	call exibemensagem
	mov ecx,ponto
	mov edx,tamanhoPonto
	call exibemensagem
	ret
;*********************
; Procedimento que exibe algo na tela do usuario
;*********************
exibemensagem:
	mov eax,SYS_WRITE_FILE
	mov ebx,SYS_STANDARD_OUTPUT
	int SYSTEM_CALL
	ret
;*********************
; Guarda o valor da carta vira e o valor da manilha
;*********************
definacarta:
	mov [tamanhoManilha],edx
	mov [manilha],ecx
	mov [tamanhoVira],ebx
	mov [vira],eax
	mov BYTE[cartaDigitada],al
	ret
_start:
	mov eax,SYS_WRITE_FILE
	mov ebx,SYS_STANDARD_OUTPUT
	mov ecx,mensagemUm
	mov edx,tamanhoMensagemUm
	int SYSTEM_CALL
pedecarta:
	mov ecx,mensagemCartas
	mov edx,tamanhoMensagemCartas
	call exibemensagem
	
	mov eax,SYS_READ_FILE
	mov ebx,SYS_STANDARD_INPUT
	mov ecx,c
	mov edx,2
	int SYSTEM_CALL
	
	mov al,[c]
	or al,0x20
	
	cmp [cartas],al;4
	je setaquatro
	cmp [cartas+1],al;5
	je setacinco
	cmp [cartas+2],al;6
	je setaseis
	cmp [cartas+3],al;7
	je setasete
	cmp [cartas+4],al;Q
	je setadama
	cmp [cartas+5],al;J
	je setavalete
	cmp [cartas+6],al;K
	je setarei
	cmp [cartas+7],al;A
	je setaas
	cmp [cartas+8],al;2
	je setadois
	cmp [cartas+9],al;3
	je setatres
	cmp [cartas+10],al;SAIR
	je fim
	mov ecx,mensagemCartaInvalida
	mov edx,tamanhoCartaInvalida
	call exibemensagem; caso o valor seja invalido, exibe uma mensagem de erro e
	jmp pedecarta ; volta a pedir uma carta novamente
	;**guarda o valor digitado, guarda a manilha e pede o naipe**
	setaquatro:; se o valor digitado for válido, amanzena o valor da carta vira e manilha
	mov eax,quatro
	mov ebx,tamanhoQuatro
	mov ecx,cinco
	mov edx,tamanhoCinco
	call definacarta; chama o procedimento
	jmp pedenaipe
	setacinco:
	mov eax,cinco
	mov ebx,tamanhoCinco
	mov ecx,seis
	mov edx,tamanhoSeis
	call definacarta
	jmp pedenaipe
	setaseis:
	mov eax,seis
	mov ebx,tamanhoSeis
	mov ecx,seven
	mov edx,tamanhoSeven
	call definacarta
	jmp pedenaipe
	setasete:
	mov eax,seven
	mov ebx,tamanhoSeven
	mov ecx,dama
	mov edx,tamanhoDama
	call definacarta
	jmp pedenaipe
	setadama:
	mov eax,dama
	mov ebx,tamanhoDama
	mov ecx,valete
	mov edx,tamanhoValete
	call definacarta
	jmp pedenaipe
	setavalete:
	mov eax,valete
	mov ebx,tamanhoValete
	mov ecx,rei
	mov edx,tamanhoRei
	call definacarta
	jmp pedenaipe
	setarei:
	mov eax,rei
	mov ebx,tamanhoRei
	mov ecx,as
	mov edx,tamanhoAs
	call definacarta
	jmp pedenaipe
	setaas:
	mov eax,as
	mov ebx,tamanhoAs
	mov ecx,dois
	mov edx,tamanhoDois
	call definacarta
	jmp pedenaipe
	setadois:
	mov eax,dois
	mov ebx,tamanhoDois
	mov ecx,tres
	mov edx,tamanhoTres
	call definacarta
	jmp pedenaipe
	setatres:
	mov eax,tres
	mov ebx,tamanhoTres
	mov ecx,quatro
	mov edx,tamanhoQuatro
	call definacarta
	jmp pedenaipe
pedenaipe:
	mov ecx,mensagemNaipe
	mov edx,tamanhoMensagemNaipes
	call exibemensagem
	
	mov eax,SYS_READ_FILE
	mov ebx,SYS_STANDARD_INPUT
	mov ecx,n
	mov edx,2
	int SYSTEM_CALL
	
	mov al,[n]
	or al,0x20
	
	cmp al,[naipes];ouro
	mov BYTE[naipeDigitado],al
	je comparacao
	cmp al,[naipes+1];espada
	mov BYTE[cartaDigitada],al
	je comparacao
	cmp al,[naipes+2];copas
	mov BYTE[cartaDigitada],al
	je comparacao
	cmp al,[naipes+3];paus
	mov BYTE[cartaDigitada],al	
	je comparacao
	cmp al,[naipes+4];SAIR
	je fim
	mov ecx,mensagemNaipeInvalido
	mov edx,tamanhoNaipeInvalido
	call exibemensagem
	jmp pedenaipe
;******************************
; Compara as cartas para exibilas corrretamente
;******************************
comparacao:
 	mov ecx,quebraLinha
	mov edx,tamanhoQuebraLinha
	call exibemensagem

	mov al,[c]
	or al,0x20
	cartaquatro:
	cmp [cartas],al
	je cartaquatroVira ; se for igual é porque o 4 é vira
	; essa verificação somente acontece com a carta 4
	cmp [cartas+9],al; verifica se o vira for 3 exibe o 4 apenas como manilha
	je cartacinco
	mov esi,quatro ; exibe o 4 normalmente caso ele não seja manilha ou vira
	mov edi,tamanhoQuatro ; exibe o 4 normalmente caso ele não seja manilha ou vira
	call exibecarta	; exibe o 4 normalmente caso ele não seja manilha ou vira
	jmp cartacinco ; e pula para a pŕoxima verificação, no caso a carta 5
	cartaquatroVira: 
	call exibevira ; exibe o 4 caso ele venha a ser carta vira
	jmp cartaseis ;pula para a próxima verificação
	;as outras comparações fazem a mesma coisa
	
	cartacinco:
	mov al,[c]
	or al,0x20
	cmp [cartas+1],al
	je cartacincovira
	mov esi,cinco
	mov edi,tamanhoCinco
	call exibecarta	
	jmp cartaseis
	cartacincovira:
	call exibevira
	jmp cartasete
	
	cartaseis:
	mov al,[c]
	or al,0x20
	cmp [cartas+2],al
	je cartaseisvira
	mov esi,seis
	mov edi,tamanhoSeis
	call exibecarta
	jmp cartasete
	cartaseisvira:
	call exibevira
	jmp cartadama
	
	cartasete:
	mov al,[c]
	or al,0x20
	cmp [cartas+3],al
	je cartasetevira
	mov esi,seven
	mov edi,tamanhoSeven
	call exibecarta
	jmp cartadama
	cartasetevira:
	call exibevira
	jmp cartavalete
	
	cartadama:
	mov al,[c]
	or al,0x20
	cmp [cartas+4],al
	je cartadamavira
	mov esi,dama
	mov edi,tamanhoDama
	call exibecarta
	jmp cartavalete
	cartadamavira:
	call exibevira
	jmp cartarei
	
	cartavalete:
	mov al,[c]
	or al,0x20
	cmp [cartas+5],al
	je cartavaletevira
	mov esi,valete
	mov edi,tamanhoValete
	call exibecarta
	jmp cartarei
	cartavaletevira:
	call exibevira
	jmp cartaas
	
	cartarei:
	mov al,[c]
	or al,0x20
	cmp [cartas+6],al
	je cartareivira
	mov esi,rei
	mov edi,tamanhoRei
	call exibecarta
	jmp cartaas
	cartareivira:
	call exibevira
	jmp cartadois
	
	cartaas:
	mov al,[c]
	or al,0x20
	cmp [cartas+7],al
	je cartaasvira
	mov esi,as
	mov edi,tamanhoAs
	call exibecarta
	jmp cartadois
	cartaasvira:
	call exibevira
	jmp cartatres
	
	cartadois:
	mov al,[c]
	or al,0x20
	cmp [cartas+8],al
	je cartadoisvira
	mov esi,dois
	mov edi,tamanhoDois
	call exibecarta
	jmp cartatres
	cartadoisvira:
	call exibevira
	jmp cartamanilha
	
	cartatres:
	mov al,[c]
	or al,0x20
	cmp [cartas+9],al
	je cartatresvira
	mov esi,tres
	mov edi,tamanhoTres
	call exibecarta
	jmp cartamanilha
	cartatresvira:
	call exibevira

	cartamanilha:
	call exibemanilha
continuar:
	mov ecx,mensagemContinuar
	mov edx,tamanhoMensagemContinuar
	call exibemensagem
	mov eax,SYS_READ_FILE
	mov ebx,SYS_STANDARD_INPUT
	mov ecx,opcao
	mov edx,2
	int SYSTEM_CALL
	mov al,[opcao]
	or al,0x20
	cmp al,'s'
	je pedecarta
fim:
	mov eax,SYS_EXIT_PROGRAM
	xor ebx,ebx
	int SYSTEM_CALL