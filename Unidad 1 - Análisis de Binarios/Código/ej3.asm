
fortune:     file format elf32-i386


Disassembly of section .init:

0804830c <_init>:
 804830c:	53                   	push   ebx
 804830d:	83 ec 08             	sub    esp,0x8
 8048310:	e8 ab 00 00 00       	call   80483c0 <__x86.get_pc_thunk.bx>
 8048315:	81 c3 eb 1c 00 00    	add    ebx,0x1ceb
 804831b:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 8048321:	85 c0                	test   eax,eax
 8048323:	74 05                	je     804832a <_init+0x1e>
 8048325:	e8 56 00 00 00       	call   8048380 <__gmon_start__@plt>
 804832a:	83 c4 08             	add    esp,0x8
 804832d:	5b                   	pop    ebx
 804832e:	c3                   	ret

Disassembly of section .plt:

08048330 <.plt>:
 8048330:	ff 35 04 a0 04 08    	push   DWORD PTR ds:0x804a004
 8048336:	ff 25 08 a0 04 08    	jmp    DWORD PTR ds:0x804a008
 804833c:	00 00                	add    BYTE PTR [eax],al
	...

08048340 <printf@plt>:
 8048340:	ff 25 0c a0 04 08    	jmp    DWORD PTR ds:0x804a00c
 8048346:	68 00 00 00 00       	push   0x0
 804834b:	e9 e0 ff ff ff       	jmp    8048330 <.plt>

08048350 <puts@plt>:
 8048350:	ff 25 10 a0 04 08    	jmp    DWORD PTR ds:0x804a010
 8048356:	68 08 00 00 00       	push   0x8
 804835b:	e9 d0 ff ff ff       	jmp    8048330 <.plt>

08048360 <__libc_start_main@plt>:
 8048360:	ff 25 14 a0 04 08    	jmp    DWORD PTR ds:0x804a014
 8048366:	68 10 00 00 00       	push   0x10
 804836b:	e9 c0 ff ff ff       	jmp    8048330 <.plt>

08048370 <__isoc99_scanf@plt>:
 8048370:	ff 25 18 a0 04 08    	jmp    DWORD PTR ds:0x804a018
 8048376:	68 18 00 00 00       	push   0x18
 804837b:	e9 b0 ff ff ff       	jmp    8048330 <.plt>

Disassembly of section .plt.got:

08048380 <__gmon_start__@plt>:
 8048380:	ff 25 fc 9f 04 08    	jmp    DWORD PTR ds:0x8049ffc
 8048386:	66 90                	xchg   ax,ax

Disassembly of section .text:

08048390 <_start>:
 8048390:	31 ed                	xor    ebp,ebp
 8048392:	5e                   	pop    esi
 8048393:	89 e1                	mov    ecx,esp
 8048395:	83 e4 f0             	and    esp,0xfffffff0
 8048398:	50                   	push   eax
 8048399:	54                   	push   esp
 804839a:	52                   	push   edx
 804839b:	68 b0 85 04 08       	push   0x80485b0
 80483a0:	68 50 85 04 08       	push   0x8048550
 80483a5:	51                   	push   ecx
 80483a6:	56                   	push   esi
 80483a7:	68 d0 84 04 08       	push   0x80484d0
 80483ac:	e8 af ff ff ff       	call   8048360 <__libc_start_main@plt>
 80483b1:	f4                   	hlt
 80483b2:	66 90                	xchg   ax,ax
 80483b4:	66 90                	xchg   ax,ax
 80483b6:	66 90                	xchg   ax,ax
 80483b8:	66 90                	xchg   ax,ax
 80483ba:	66 90                	xchg   ax,ax
 80483bc:	66 90                	xchg   ax,ax
 80483be:	66 90                	xchg   ax,ax

080483c0 <__x86.get_pc_thunk.bx>:
 80483c0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 80483c3:	c3                   	ret
 80483c4:	66 90                	xchg   ax,ax
 80483c6:	66 90                	xchg   ax,ax
 80483c8:	66 90                	xchg   ax,ax
 80483ca:	66 90                	xchg   ax,ax
 80483cc:	66 90                	xchg   ax,ax
 80483ce:	66 90                	xchg   ax,ax

080483d0 <deregister_tm_clones>:
 80483d0:	b8 43 a0 04 08       	mov    eax,0x804a043
 80483d5:	2d 40 a0 04 08       	sub    eax,0x804a040
 80483da:	83 f8 06             	cmp    eax,0x6
 80483dd:	76 1a                	jbe    80483f9 <deregister_tm_clones+0x29>
 80483df:	b8 00 00 00 00       	mov    eax,0x0
 80483e4:	85 c0                	test   eax,eax
 80483e6:	74 11                	je     80483f9 <deregister_tm_clones+0x29>
 80483e8:	55                   	push   ebp
 80483e9:	89 e5                	mov    ebp,esp
 80483eb:	83 ec 14             	sub    esp,0x14
 80483ee:	68 40 a0 04 08       	push   0x804a040
 80483f3:	ff d0                	call   eax
 80483f5:	83 c4 10             	add    esp,0x10
 80483f8:	c9                   	leave
 80483f9:	f3 c3                	repz ret
 80483fb:	90                   	nop
 80483fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

08048400 <register_tm_clones>:
 8048400:	b8 40 a0 04 08       	mov    eax,0x804a040
 8048405:	2d 40 a0 04 08       	sub    eax,0x804a040
 804840a:	c1 f8 02             	sar    eax,0x2
 804840d:	89 c2                	mov    edx,eax
 804840f:	c1 ea 1f             	shr    edx,0x1f
 8048412:	01 d0                	add    eax,edx
 8048414:	d1 f8                	sar    eax,1
 8048416:	74 1b                	je     8048433 <register_tm_clones+0x33>
 8048418:	ba 00 00 00 00       	mov    edx,0x0
 804841d:	85 d2                	test   edx,edx
 804841f:	74 12                	je     8048433 <register_tm_clones+0x33>
 8048421:	55                   	push   ebp
 8048422:	89 e5                	mov    ebp,esp
 8048424:	83 ec 10             	sub    esp,0x10
 8048427:	50                   	push   eax
 8048428:	68 40 a0 04 08       	push   0x804a040
 804842d:	ff d2                	call   edx
 804842f:	83 c4 10             	add    esp,0x10
 8048432:	c9                   	leave
 8048433:	f3 c3                	repz ret
 8048435:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048439:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048440 <__do_global_dtors_aux>:
 8048440:	80 3d 40 a0 04 08 00 	cmp    BYTE PTR ds:0x804a040,0x0
 8048447:	75 13                	jne    804845c <__do_global_dtors_aux+0x1c>
 8048449:	55                   	push   ebp
 804844a:	89 e5                	mov    ebp,esp
 804844c:	83 ec 08             	sub    esp,0x8
 804844f:	e8 7c ff ff ff       	call   80483d0 <deregister_tm_clones>
 8048454:	c6 05 40 a0 04 08 01 	mov    BYTE PTR ds:0x804a040,0x1
 804845b:	c9                   	leave
 804845c:	f3 c3                	repz ret
 804845e:	66 90                	xchg   ax,ax

08048460 <frame_dummy>:
 8048460:	b8 10 9f 04 08       	mov    eax,0x8049f10
 8048465:	8b 10                	mov    edx,DWORD PTR [eax]
 8048467:	85 d2                	test   edx,edx
 8048469:	75 05                	jne    8048470 <frame_dummy+0x10>
 804846b:	eb 93                	jmp    8048400 <register_tm_clones>
 804846d:	8d 76 00             	lea    esi,[esi+0x0]
 8048470:	ba 00 00 00 00       	mov    edx,0x0
 8048475:	85 d2                	test   edx,edx
 8048477:	74 f2                	je     804846b <frame_dummy+0xb>
 8048479:	55                   	push   ebp
 804847a:	89 e5                	mov    ebp,esp
 804847c:	83 ec 14             	sub    esp,0x14
 804847f:	50                   	push   eax
 8048480:	ff d2                	call   edx
 8048482:	83 c4 10             	add    esp,0x10
 8048485:	c9                   	leave
 8048486:	e9 75 ff ff ff       	jmp    8048400 <register_tm_clones>

0804848b <fortune>:
 804848b:	55                   	push   ebp
 804848c:	89 e5                	mov    ebp,esp
 804848e:	83 ec 10             	sub    esp,0x10
 8048491:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 8048498:	eb 08                	jmp    80484a2 <fortune+0x17>
 804849a:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 804849e:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 80484a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 80484a5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 80484a8:	84 c0                	test   al,al
 80484aa:	75 ee                	jne    804849a <fortune+0xf>
 80484ac:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 80484af:	ba ab aa aa aa       	mov    edx,0xaaaaaaab
 80484b4:	89 c8                	mov    eax,ecx
 80484b6:	f7 e2                	mul    edx
 80484b8:	c1 ea 02             	shr    edx,0x2
 80484bb:	89 d0                	mov    eax,edx
 80484bd:	01 c0                	add    eax,eax
 80484bf:	01 d0                	add    eax,edx
 80484c1:	01 c0                	add    eax,eax
 80484c3:	29 c1                	sub    ecx,eax
 80484c5:	89 ca                	mov    edx,ecx
 80484c7:	8b 04 95 24 a0 04 08 	mov    eax,DWORD PTR [edx*4+0x804a024]
 80484ce:	c9                   	leave
 80484cf:	c3                   	ret

080484d0 <main>:
 80484d0:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 80484d4:	83 e4 f0             	and    esp,0xfffffff0
 80484d7:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 80484da:	55                   	push   ebp
 80484db:	89 e5                	mov    ebp,esp
 80484dd:	51                   	push   ecx
 80484de:	83 ec 24             	sub    esp,0x24
 80484e1:	83 ec 0c             	sub    esp,0xc
 80484e4:	68 2c 87 04 08       	push   0x804872c
 80484e9:	e8 62 fe ff ff       	call   8048350 <puts@plt>
 80484ee:	83 c4 10             	add    esp,0x10
 80484f1:	83 ec 0c             	sub    esp,0xc
 80484f4:	68 b3 87 04 08       	push   0x80487b3
 80484f9:	e8 42 fe ff ff       	call   8048340 <printf@plt>
 80484fe:	83 c4 10             	add    esp,0x10
 8048501:	83 ec 08             	sub    esp,0x8
 8048504:	8d 45 da             	lea    eax,[ebp-0x26]
 8048507:	50                   	push   eax
 8048508:	68 c8 87 04 08       	push   0x80487c8
 804850d:	e8 5e fe ff ff       	call   8048370 <__isoc99_scanf@plt>
 8048512:	83 c4 10             	add    esp,0x10
 8048515:	83 ec 0c             	sub    esp,0xc
 8048518:	8d 45 da             	lea    eax,[ebp-0x26]
 804851b:	50                   	push   eax
 804851c:	e8 6a ff ff ff       	call   804848b <fortune>
 8048521:	83 c4 10             	add    esp,0x10
 8048524:	83 ec 08             	sub    esp,0x8
 8048527:	50                   	push   eax
 8048528:	68 cb 87 04 08       	push   0x80487cb
 804852d:	e8 0e fe ff ff       	call   8048340 <printf@plt>
 8048532:	83 c4 10             	add    esp,0x10
 8048535:	b8 00 00 00 00       	mov    eax,0x0
 804853a:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 804853d:	c9                   	leave
 804853e:	8d 61 fc             	lea    esp,[ecx-0x4]
 8048541:	c3                   	ret
 8048542:	66 90                	xchg   ax,ax
 8048544:	66 90                	xchg   ax,ax
 8048546:	66 90                	xchg   ax,ax
 8048548:	66 90                	xchg   ax,ax
 804854a:	66 90                	xchg   ax,ax
 804854c:	66 90                	xchg   ax,ax
 804854e:	66 90                	xchg   ax,ax

08048550 <__libc_csu_init>:
 8048550:	55                   	push   ebp
 8048551:	57                   	push   edi
 8048552:	56                   	push   esi
 8048553:	53                   	push   ebx
 8048554:	e8 67 fe ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 8048559:	81 c3 a7 1a 00 00    	add    ebx,0x1aa7
 804855f:	83 ec 0c             	sub    esp,0xc
 8048562:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 8048566:	8d b3 0c ff ff ff    	lea    esi,[ebx-0xf4]
 804856c:	e8 9b fd ff ff       	call   804830c <_init>
 8048571:	8d 83 08 ff ff ff    	lea    eax,[ebx-0xf8]
 8048577:	29 c6                	sub    esi,eax
 8048579:	c1 fe 02             	sar    esi,0x2
 804857c:	85 f6                	test   esi,esi
 804857e:	74 25                	je     80485a5 <__libc_csu_init+0x55>
 8048580:	31 ff                	xor    edi,edi
 8048582:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 8048588:	83 ec 04             	sub    esp,0x4
 804858b:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 804858f:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 8048593:	55                   	push   ebp
 8048594:	ff 94 bb 08 ff ff ff 	call   DWORD PTR [ebx+edi*4-0xf8]
 804859b:	83 c7 01             	add    edi,0x1
 804859e:	83 c4 10             	add    esp,0x10
 80485a1:	39 fe                	cmp    esi,edi
 80485a3:	75 e3                	jne    8048588 <__libc_csu_init+0x38>
 80485a5:	83 c4 0c             	add    esp,0xc
 80485a8:	5b                   	pop    ebx
 80485a9:	5e                   	pop    esi
 80485aa:	5f                   	pop    edi
 80485ab:	5d                   	pop    ebp
 80485ac:	c3                   	ret
 80485ad:	8d 76 00             	lea    esi,[esi+0x0]

080485b0 <__libc_csu_fini>:
 80485b0:	f3 c3                	repz ret

Disassembly of section .fini:

080485b4 <_fini>:
 80485b4:	53                   	push   ebx
 80485b5:	83 ec 08             	sub    esp,0x8
 80485b8:	e8 03 fe ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 80485bd:	81 c3 43 1a 00 00    	add    ebx,0x1a43
 80485c3:	83 c4 08             	add    esp,0x8
 80485c6:	5b                   	pop    ebx
 80485c7:	c3                   	ret

