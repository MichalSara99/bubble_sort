					.686
					.model flat,c
					.stack 100h
printf				PROTO			arg1:Ptr			byte,printlist:VARARG
scanf				PROTO			arg2:Ptr			byte,inputlist:VARARG
					.data
arry				sdword			20 dup(?)
n					sdword				?
tmp					sdword				?
issort				sdword				1			
msg1fmt				byte				0Ah,"%s",0
msg2fmt				byte				"%d, ",0
in1fmt				byte				"%d",0
msg1				byte			"Enter the number of elements: ",0
msg2				byte			"Enter an integer: ",0
msg3				byte			"Original:",0Ah,0
msg4				byte			"Sorted:",0Ah,0
					.code
main				proc
					INVOKE printf,ADDR msg1fmt,ADDR msg1
					INVOKE scanf,ADDR in1fmt,ADDR n
		if01:		cmp n,0
					jle endif01
		then01:		;; ===================== inserting into arry ===========================
					mov ecx,n
					mov edi,offset arry+0
		while01:	cmp ecx,0
					jle endw01
					push ecx
					INVOKE printf,ADDR msg1fmt,ADDR msg2
					INVOKE scanf,ADDR in1fmt,ADDR [edi]
					add edi,4
					pop ecx
					dec ecx
					jmp while01
		endw01:		;;nop
					;; =====================================================================
					;; ================= display original arry =============================
					INVOKE printf,ADDR msg1fmt,ADDR msg3
					mov ecx,n
					mov esi,offset arry+0
		while02:	cmp ecx,0
					jle endw02
					push ecx
					mov eax,[esi]
					mov tmp,eax
					INVOKE printf,ADDR msg2fmt,tmp
					add esi,4
					pop ecx
					dec ecx
					jmp while02
		endw02:		;;nop
					;; =====================================================================
		if02:		cmp n,1
					jle endif02
		then02:		;; ======================= bubble sort arry =============================
					mov ecx,n
					dec ecx
					mov esi,offset arry+0
					mov edi,offset arry+4
		while04:	cmp ecx,0
					jle endw04
					mov eax,[edi]
		if03:		cmp [esi],eax
					jle endif03
		then03:		mov issort,0
		endif03:	;;nop
					dec ecx
					jmp while04
		endw04:		;;nop
		if04:		cmp issort,0
					jne endif04
		then04:		mov ecx,n
					dec ecx
		while05:	cmp ecx,0
					jle endw05
					push ecx
					mov esi,offset arry+0
					mov edi,offset arry+4
		while06:	cmp ecx,0
					jle endw06
					mov eax,[esi]
		if05:		cmp eax,[edi]
					jle endif05
		then05:		xchg eax,[edi]
					mov [esi],eax
		endif05:	;;nop
					add esi,4
					add edi,4
					dec ecx
					jmp while06
		endw06:		;;nop
					pop ecx
					dec ecx
					jmp while05
		endw05:		;;nop
		endif04:	;;nop
					;; ======================================================================
		endif02:	;;nop
					;; ==================== display sorted arry =============================
					INVOKE printf,ADDR msg1fmt,ADDR msg4
					mov ecx,n
					mov esi,offset arry+0
		while03:	cmp ecx,0
					jle endw03
					push ecx
					mov eax,[esi]
					mov tmp,eax
					INVOKE printf,ADDR msg2fmt,tmp
					add esi,4
					pop ecx
					dec ecx
					jmp while03
		endw03:		;;nop
					;; =====================================================================

		endif01:	;;nop





					ret
main				endp
					end
