password_ofuscated:     file format elf32-i386


Disassembly of section .init:

08048330 <_init>:
 8048330:	53                   	push   ebx
 8048331:	83 ec 08             	sub    esp,0x8
 8048334:	e8 c7 00 00 00       	call   8048400 <__x86.get_pc_thunk.bx>
 8048339:	81 c3 c7 1c 00 00    	add    ebx,0x1cc7
 804833f:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 8048345:	85 c0                	test   eax,eax
 8048347:	74 05                	je     804834e <_init+0x1e>
 8048349:	e8 72 00 00 00       	call   80483c0 <__gmon_start__@plt>
 804834e:	83 c4 08             	add    esp,0x8
 8048351:	5b                   	pop    ebx
 8048352:	c3                   	ret

Disassembly of section .plt:

08048360 <.plt>:
 8048360:	ff 35 04 a0 04 08    	push   DWORD PTR ds:0x804a004
 8048366:	ff 25 08 a0 04 08    	jmp    DWORD PTR ds:0x804a008
 804836c:	00 00                	add    BYTE PTR [eax],al
	...

08048370 <strcmp@plt>:
 8048370:	ff 25 0c a0 04 08    	jmp    DWORD PTR ds:0x804a00c
 8048376:	68 00 00 00 00       	push   0x0
 804837b:	e9 e0 ff ff ff       	jmp    8048360 <.plt>

08048380 <printf@plt>:
 8048380:	ff 25 10 a0 04 08    	jmp    DWORD PTR ds:0x804a010
 8048386:	68 08 00 00 00       	push   0x8
 804838b:	e9 d0 ff ff ff       	jmp    8048360 <.plt>

08048390 <puts@plt>:
 8048390:	ff 25 14 a0 04 08    	jmp    DWORD PTR ds:0x804a014
 8048396:	68 10 00 00 00       	push   0x10
 804839b:	e9 c0 ff ff ff       	jmp    8048360 <.plt>

080483a0 <__libc_start_main@plt>:
 80483a0:	ff 25 18 a0 04 08    	jmp    DWORD PTR ds:0x804a018
 80483a6:	68 18 00 00 00       	push   0x18
 80483ab:	e9 b0 ff ff ff       	jmp    8048360 <.plt>

080483b0 <__isoc99_scanf@plt>:
 80483b0:	ff 25 1c a0 04 08    	jmp    DWORD PTR ds:0x804a01c
 80483b6:	68 20 00 00 00       	push   0x20
 80483bb:	e9 a0 ff ff ff       	jmp    8048360 <.plt>

Disassembly of section .plt.got:

080483c0 <__gmon_start__@plt>:
 80483c0:	ff 25 fc 9f 04 08    	jmp    DWORD PTR ds:0x8049ffc
 80483c6:	66 90                	xchg   ax,ax

Disassembly of section .text:

080483d0 <_start>:
 80483d0:	31 ed                	xor    ebp,ebp
 80483d2:	5e                   	pop    esi
 80483d3:	89 e1                	mov    ecx,esp
 80483d5:	83 e4 f0             	and    esp,0xfffffff0
 80483d8:	50                   	push   eax
 80483d9:	54                   	push   esp
 80483da:	52                   	push   edx
 80483db:	68 10 86 04 08       	push   0x8048610
 80483e0:	68 b0 85 04 08       	push   0x80485b0
 80483e5:	51                   	push   ecx
 80483e6:	56                   	push   esi
 80483e7:	68 1f 85 04 08       	push   0x804851f
 80483ec:	e8 af ff ff ff       	call   80483a0 <__libc_start_main@plt>
 80483f1:	f4                   	hlt
 80483f2:	66 90                	xchg   ax,ax
 80483f4:	66 90                	xchg   ax,ax
 80483f6:	66 90                	xchg   ax,ax
 80483f8:	66 90                	xchg   ax,ax
 80483fa:	66 90                	xchg   ax,ax
 80483fc:	66 90                	xchg   ax,ax
 80483fe:	66 90                	xchg   ax,ax

08048400 <__x86.get_pc_thunk.bx>:
 8048400:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 8048403:	c3                   	ret
 8048404:	66 90                	xchg   ax,ax
 8048406:	66 90                	xchg   ax,ax
 8048408:	66 90                	xchg   ax,ax
 804840a:	66 90                	xchg   ax,ax
 804840c:	66 90                	xchg   ax,ax
 804840e:	66 90                	xchg   ax,ax

08048410 <deregister_tm_clones>:
 8048410:	b8 2b a0 04 08       	mov    eax,0x804a02b
 8048415:	2d 28 a0 04 08       	sub    eax,0x804a028
 804841a:	83 f8 06             	cmp    eax,0x6
 804841d:	76 1a                	jbe    8048439 <deregister_tm_clones+0x29>
 804841f:	b8 00 00 00 00       	mov    eax,0x0
 8048424:	85 c0                	test   eax,eax
 8048426:	74 11                	je     8048439 <deregister_tm_clones+0x29>
 8048428:	55                   	push   ebp
 8048429:	89 e5                	mov    ebp,esp
 804842b:	83 ec 14             	sub    esp,0x14
 804842e:	68 28 a0 04 08       	push   0x804a028
 8048433:	ff d0                	call   eax
 8048435:	83 c4 10             	add    esp,0x10
 8048438:	c9                   	leave
 8048439:	f3 c3                	repz ret
 804843b:	90                   	nop
 804843c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

08048440 <register_tm_clones>:
 8048440:	b8 28 a0 04 08       	mov    eax,0x804a028
 8048445:	2d 28 a0 04 08       	sub    eax,0x804a028
 804844a:	c1 f8 02             	sar    eax,0x2
 804844d:	89 c2                	mov    edx,eax
 804844f:	c1 ea 1f             	shr    edx,0x1f
 8048452:	01 d0                	add    eax,edx
 8048454:	d1 f8                	sar    eax,1
 8048456:	74 1b                	je     8048473 <register_tm_clones+0x33>
 8048458:	ba 00 00 00 00       	mov    edx,0x0
 804845d:	85 d2                	test   edx,edx
 804845f:	74 12                	je     8048473 <register_tm_clones+0x33>
 8048461:	55                   	push   ebp
 8048462:	89 e5                	mov    ebp,esp
 8048464:	83 ec 10             	sub    esp,0x10
 8048467:	50                   	push   eax
 8048468:	68 28 a0 04 08       	push   0x804a028
 804846d:	ff d2                	call   edx
 804846f:	83 c4 10             	add    esp,0x10
 8048472:	c9                   	leave
 8048473:	f3 c3                	repz ret
 8048475:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048479:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048480 <__do_global_dtors_aux>:
 8048480:	80 3d 28 a0 04 08 00 	cmp    BYTE PTR ds:0x804a028,0x0
 8048487:	75 13                	jne    804849c <__do_global_dtors_aux+0x1c>
 8048489:	55                   	push   ebp
 804848a:	89 e5                	mov    ebp,esp
 804848c:	83 ec 08             	sub    esp,0x8
 804848f:	e8 7c ff ff ff       	call   8048410 <deregister_tm_clones>
 8048494:	c6 05 28 a0 04 08 01 	mov    BYTE PTR ds:0x804a028,0x1
 804849b:	c9                   	leave
 804849c:	f3 c3                	repz ret
 804849e:	66 90                	xchg   ax,ax

080484a0 <frame_dummy>:
 80484a0:	b8 10 9f 04 08       	mov    eax,0x8049f10
 80484a5:	8b 10                	mov    edx,DWORD PTR [eax]
 80484a7:	85 d2                	test   edx,edx
 80484a9:	75 05                	jne    80484b0 <frame_dummy+0x10>
 80484ab:	eb 93                	jmp    8048440 <register_tm_clones>
 80484ad:	8d 76 00             	lea    esi,[esi+0x0]
 80484b0:	ba 00 00 00 00       	mov    edx,0x0
 80484b5:	85 d2                	test   edx,edx
 80484b7:	74 f2                	je     80484ab <frame_dummy+0xb>
 80484b9:	55                   	push   ebp
 80484ba:	89 e5                	mov    ebp,esp
 80484bc:	83 ec 14             	sub    esp,0x14
 80484bf:	50                   	push   eax
 80484c0:	ff d2                	call   edx
 80484c2:	83 c4 10             	add    esp,0x10
 80484c5:	c9                   	leave
 80484c6:	e9 75 ff ff ff       	jmp    8048440 <register_tm_clones>

080484cb <fillpassword>:
 80484cb:	55                   	push   ebp
 80484cc:	89 e5                	mov    ebp,esp
 80484ce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484d1:	c6 00 53             	mov    BYTE PTR [eax],0x53
 80484d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484d7:	83 c0 01             	add    eax,0x1
 80484da:	c6 00 30             	mov    BYTE PTR [eax],0x30
 80484dd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484e0:	83 c0 02             	add    eax,0x2
 80484e3:	c6 00 52             	mov    BYTE PTR [eax],0x52
 80484e6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484e9:	83 c0 03             	add    eax,0x3
 80484ec:	c6 00 50             	mov    BYTE PTR [eax],0x50
 80484ef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484f2:	83 c0 04             	add    eax,0x4
 80484f5:	c6 00 52             	mov    BYTE PTR [eax],0x52
 80484f8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484fb:	83 c0 05             	add    eax,0x5
 80484fe:	c6 00 33             	mov    BYTE PTR [eax],0x33
 8048501:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048504:	83 c0 06             	add    eax,0x6
 8048507:	c6 00 53             	mov    BYTE PTR [eax],0x53
 804850a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 804850d:	83 c0 07             	add    eax,0x7
 8048510:	c6 00 34             	mov    BYTE PTR [eax],0x34
 8048513:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048516:	83 c0 08             	add    eax,0x8
 8048519:	c6 00 00             	mov    BYTE PTR [eax],0x0
 804851c:	90                   	nop
 804851d:	5d                   	pop    ebp
 804851e:	c3                   	ret

0804851f <main>:
 804851f:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 8048523:	83 e4 f0             	and    esp,0xfffffff0
 8048526:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 8048529:	55                   	push   ebp
 804852a:	89 e5                	mov    ebp,esp
 804852c:	51                   	push   ecx
 804852d:	83 ec 44             	sub    esp,0x44
 8048530:	8d 45 bc             	lea    eax,[ebp-0x44]
 8048533:	50                   	push   eax
 8048534:	e8 92 ff ff ff       	call   80484cb <fillpassword>
 8048539:	83 c4 04             	add    esp,0x4
 804853c:	83 ec 0c             	sub    esp,0xc
 804853f:	68 30 86 04 08       	push   0x8048630
 8048544:	e8 37 fe ff ff       	call   8048380 <printf@plt>
 8048549:	83 c4 10             	add    esp,0x10
 804854c:	83 ec 08             	sub    esp,0x8
 804854f:	8d 45 da             	lea    eax,[ebp-0x26]
 8048552:	50                   	push   eax
 8048553:	68 47 86 04 08       	push   0x8048647
 8048558:	e8 53 fe ff ff       	call   80483b0 <__isoc99_scanf@plt>
 804855d:	83 c4 10             	add    esp,0x10
 8048560:	83 ec 08             	sub    esp,0x8
 8048563:	8d 45 da             	lea    eax,[ebp-0x26]
 8048566:	50                   	push   eax
 8048567:	8d 45 bc             	lea    eax,[ebp-0x44]
 804856a:	50                   	push   eax
 804856b:	e8 00 fe ff ff       	call   8048370 <strcmp@plt>
 8048570:	83 c4 10             	add    esp,0x10
 8048573:	85 c0                	test   eax,eax
 8048575:	75 12                	jne    8048589 <main+0x6a>
 8048577:	83 ec 0c             	sub    esp,0xc
 804857a:	68 4a 86 04 08       	push   0x804864a
 804857f:	e8 0c fe ff ff       	call   8048390 <puts@plt>
 8048584:	83 c4 10             	add    esp,0x10
 8048587:	eb 10                	jmp    8048599 <main+0x7a>
 8048589:	83 ec 0c             	sub    esp,0xc
 804858c:	68 5e 86 04 08       	push   0x804865e
 8048591:	e8 fa fd ff ff       	call   8048390 <puts@plt>
 8048596:	83 c4 10             	add    esp,0x10
 8048599:	b8 00 00 00 00       	mov    eax,0x0
 804859e:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 80485a1:	c9                   	leave
 80485a2:	8d 61 fc             	lea    esp,[ecx-0x4]
 80485a5:	c3                   	ret
 80485a6:	66 90                	xchg   ax,ax
 80485a8:	66 90                	xchg   ax,ax
 80485aa:	66 90                	xchg   ax,ax
 80485ac:	66 90                	xchg   ax,ax
 80485ae:	66 90                	xchg   ax,ax

080485b0 <__libc_csu_init>:
 80485b0:	55                   	push   ebp
 80485b1:	57                   	push   edi
 80485b2:	56                   	push   esi
 80485b3:	53                   	push   ebx
 80485b4:	e8 47 fe ff ff       	call   8048400 <__x86.get_pc_thunk.bx>
 80485b9:	81 c3 47 1a 00 00    	add    ebx,0x1a47
 80485bf:	83 ec 0c             	sub    esp,0xc
 80485c2:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 80485c6:	8d b3 0c ff ff ff    	lea    esi,[ebx-0xf4]
 80485cc:	e8 5f fd ff ff       	call   8048330 <_init>
 80485d1:	8d 83 08 ff ff ff    	lea    eax,[ebx-0xf8]
 80485d7:	29 c6                	sub    esi,eax
 80485d9:	c1 fe 02             	sar    esi,0x2
 80485dc:	85 f6                	test   esi,esi
 80485de:	74 25                	je     8048605 <__libc_csu_init+0x55>
 80485e0:	31 ff                	xor    edi,edi
 80485e2:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 80485e8:	83 ec 04             	sub    esp,0x4
 80485eb:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 80485ef:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 80485f3:	55                   	push   ebp
 80485f4:	ff 94 bb 08 ff ff ff 	call   DWORD PTR [ebx+edi*4-0xf8]
 80485fb:	83 c7 01             	add    edi,0x1
 80485fe:	83 c4 10             	add    esp,0x10
 8048601:	39 fe                	cmp    esi,edi
 8048603:	75 e3                	jne    80485e8 <__libc_csu_init+0x38>
 8048605:	83 c4 0c             	add    esp,0xc
 8048608:	5b                   	pop    ebx
 8048609:	5e                   	pop    esi
 804860a:	5f                   	pop    edi
 804860b:	5d                   	pop    ebp
 804860c:	c3                   	ret
 804860d:	8d 76 00             	lea    esi,[esi+0x0]

08048610 <__libc_csu_fini>:
 8048610:	f3 c3                	repz ret

Disassembly of section .fini:

08048614 <_fini>:
 8048614:	53                   	push   ebx
 8048615:	83 ec 08             	sub    esp,0x8
 8048618:	e8 e3 fd ff ff       	call   8048400 <__x86.get_pc_thunk.bx>
 804861d:	81 c3 e3 19 00 00    	add    ebx,0x19e3
 8048623:	83 c4 08             	add    esp,0x8
 8048626:	5b                   	pop    ebx

