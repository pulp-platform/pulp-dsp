/home/fischeti/toolchain/bin/riscv32-unknown-elf-objdump -Mmarch=rv32imfcxpulpv2 /home/fischeti/PULP-DSP/test/mrWolf/fft/test_lib/singlecore_riscy/build/wolfe/test/test -d

/home/fischeti/PULP-DSP/test/mrWolf/fft/test_lib/singlecore_riscy/build/wolfe/test/test:     file format elf32-littleriscv


Disassembly of section .vectors:

1c008000 <__irq_vector_base>:
1c008000:	0940006f          	j	1c008094 <__rt_no_irq_handler>
1c008004:	0900006f          	j	1c008094 <__rt_no_irq_handler>
1c008008:	08c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00800c:	0880006f          	j	1c008094 <__rt_no_irq_handler>
1c008010:	0840006f          	j	1c008094 <__rt_no_irq_handler>
1c008014:	0800006f          	j	1c008094 <__rt_no_irq_handler>
1c008018:	07c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00801c:	0780006f          	j	1c008094 <__rt_no_irq_handler>
1c008020:	0740006f          	j	1c008094 <__rt_no_irq_handler>
1c008024:	0700006f          	j	1c008094 <__rt_no_irq_handler>
1c008028:	06c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00802c:	0680006f          	j	1c008094 <__rt_no_irq_handler>
1c008030:	0640006f          	j	1c008094 <__rt_no_irq_handler>
1c008034:	0600006f          	j	1c008094 <__rt_no_irq_handler>
1c008038:	05c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00803c:	0580006f          	j	1c008094 <__rt_no_irq_handler>
1c008040:	0540006f          	j	1c008094 <__rt_no_irq_handler>
1c008044:	0500006f          	j	1c008094 <__rt_no_irq_handler>
1c008048:	04c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00804c:	0480006f          	j	1c008094 <__rt_no_irq_handler>
1c008050:	0440006f          	j	1c008094 <__rt_no_irq_handler>
1c008054:	0400006f          	j	1c008094 <__rt_no_irq_handler>
1c008058:	03c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00805c:	0380006f          	j	1c008094 <__rt_no_irq_handler>
1c008060:	0340006f          	j	1c008094 <__rt_no_irq_handler>
1c008064:	0300006f          	j	1c008094 <__rt_no_irq_handler>
1c008068:	02c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00806c:	0280006f          	j	1c008094 <__rt_no_irq_handler>
1c008070:	0240006f          	j	1c008094 <__rt_no_irq_handler>
1c008074:	0200006f          	j	1c008094 <__rt_no_irq_handler>
1c008078:	01c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00807c:	0180006f          	j	1c008094 <__rt_no_irq_handler>

1c008080 <_start>:
1c008080:	0200006f          	j	1c0080a0 <_entry>
1c008084:	1ce0006f          	j	1c008252 <__rt_illegal_instr>
	...

1c008090 <__rt_debug_struct_ptr>:
1c008090:	172c                	addi	a1,sp,936
1c008092:	1c00                	addi	s0,sp,560

1c008094 <__rt_no_irq_handler>:
1c008094:	0000006f          	j	1c008094 <__rt_no_irq_handler>

1c008098 <__rt_semihosting_call>:
1c008098:	00100073          	ebreak
1c00809c:	00008067          	ret

Disassembly of section .text:

1c0080a0 <_entry>:
1c0080a0:	7a101073          	csrw	pcmr,zero
1c0080a4:	f1402573          	csrr	a0,mhartid
1c0080a8:	01f57593          	andi	a1,a0,31
1c0080ac:	8115                	srli	a0,a0,0x5
1c0080ae:	467d                	li	a2,31
1c0080b0:	00c50463          	beq	a0,a2,1c0080b8 <_entry+0x18>
1c0080b4:	74d0706f          	j	1c010000 <__cluster_text_start>
1c0080b8:	ffff9297          	auipc	t0,0xffff9
1c0080bc:	74028293          	addi	t0,t0,1856 # 1c0017f8 <_bss_start>
1c0080c0:	ffffa317          	auipc	t1,0xffffa
1c0080c4:	89430313          	addi	t1,t1,-1900 # 1c001954 <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0)
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	d3e10113          	addi	sp,sp,-706 # 1c000e10 <stack>
1c0080da:	0ec010ef          	jal	ra,1c0091c6 <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00000397          	auipc	t2,0x0
1c0080ea:	74638393          	addi	t2,t2,1862 # 1c00882c <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	246010ef          	jal	ra,1c00933a <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	68e020ef          	jal	ra,1c00a788 <exit>

1c0080fe <_fini>:
1c0080fe:	8082                	ret

1c008100 <__rt_event_enqueue>:
1c008100:	0035f513          	andi	a0,a1,3
1c008104:	02051c63          	bnez	a0,1c00813c <__rt_handle_special_event>
1c008108:	e3ff8517          	auipc	a0,0xe3ff8
1c00810c:	f2050513          	addi	a0,a0,-224 # 28 <__rt_sched>
1c008110:	0005ac23          	sw	zero,24(a1)
1c008114:	4110                	lw	a2,0(a0)
1c008116:	c601                	beqz	a2,1c00811e <__rt_no_first>
1c008118:	4150                	lw	a2,4(a0)
1c00811a:	ce0c                	sw	a1,24(a2)
1c00811c:	a011                	j	1c008120 <__rt_common>

1c00811e <__rt_no_first>:
1c00811e:	c10c                	sw	a1,0(a0)

1c008120 <__rt_common>:
1c008120:	c14c                	sw	a1,4(a0)
1c008122:	4550                	lw	a2,12(a0)
1c008124:	00052623          	sw	zero,12(a0)
1c008128:	ca01                	beqz	a2,1c008138 <enqueue_end>
1c00812a:	e3ff8517          	auipc	a0,0xe3ff8
1c00812e:	ef650513          	addi	a0,a0,-266 # 20 <__rt_thread_current>
1c008132:	4108                	lw	a0,0(a0)
1c008134:	00c51363          	bne	a0,a2,1c00813a <thread_enqueue>

1c008138 <enqueue_end>:
1c008138:	8482                	jr	s1

1c00813a <thread_enqueue>:
1c00813a:	8482                	jr	s1

1c00813c <__rt_handle_special_event>:
1c00813c:	5571                	li	a0,-4
1c00813e:	8de9                	and	a1,a1,a0
1c008140:	4190                	lw	a2,0(a1)
1c008142:	41c8                	lw	a0,4(a1)
1c008144:	a0e1                	j	1c00820c <__rt_call_external_c_function>

1c008146 <__rt_bridge_enqueue_event>:
1c008146:	fe812e23          	sw	s0,-4(sp)
1c00814a:	fe912c23          	sw	s1,-8(sp)
1c00814e:	fea12a23          	sw	a0,-12(sp)
1c008152:	feb12823          	sw	a1,-16(sp)
1c008156:	fec12623          	sw	a2,-20(sp)
1c00815a:	00001617          	auipc	a2,0x1
1c00815e:	59c60613          	addi	a2,a2,1436 # 1c0096f6 <__rt_bridge_handle_notif>
1c008162:	0aa004ef          	jal	s1,1c00820c <__rt_call_external_c_function>
1c008166:	ffc12403          	lw	s0,-4(sp)
1c00816a:	ff812483          	lw	s1,-8(sp)
1c00816e:	ff412503          	lw	a0,-12(sp)
1c008172:	ff012583          	lw	a1,-16(sp)
1c008176:	fec12603          	lw	a2,-20(sp)
1c00817a:	30200073          	mret

1c00817e <__rt_remote_enqueue_event>:
1c00817e:	fe812e23          	sw	s0,-4(sp)
1c008182:	fe912c23          	sw	s1,-8(sp)
1c008186:	fea12a23          	sw	a0,-12(sp)
1c00818a:	feb12823          	sw	a1,-16(sp)
1c00818e:	fec12623          	sw	a2,-20(sp)
1c008192:	4405                	li	s0,1
1c008194:	ffff9497          	auipc	s1,0xffff9
1c008198:	78448493          	addi	s1,s1,1924 # 1c001918 <__rt_fc_cluster_data>

1c00819c <__rt_remote_enqueue_event_loop_cluster>:
1c00819c:	40cc                	lw	a1,4(s1)
1c00819e:	02058d63          	beqz	a1,1c0081d8 <__rt_remote_enqueue_event_loop_cluster_continue>
1c0081a2:	48cc                	lw	a1,20(s1)
1c0081a4:	41c8                	lw	a0,4(a1)
1c0081a6:	00050e63          	beqz	a0,1c0081c2 <__rt_cluster_pool_update_end>

1c0081aa <__rt_cluster_pool_update_loop>:
1c0081aa:	5150                	lw	a2,36(a0)
1c0081ac:	e219                	bnez	a2,1c0081b2 <__rt_cluster_pool_update_loop_end>
1c0081ae:	5108                	lw	a0,32(a0)
1c0081b0:	fd6d                	bnez	a0,1c0081aa <__rt_cluster_pool_update_loop>

1c0081b2 <__rt_cluster_pool_update_loop_end>:
1c0081b2:	c501                	beqz	a0,1c0081ba <__rt_cluster_pool_update_no_current>
1c0081b4:	5108                	lw	a0,32(a0)
1c0081b6:	c1c8                	sw	a0,4(a1)
1c0081b8:	a029                	j	1c0081c2 <__rt_cluster_pool_update_end>

1c0081ba <__rt_cluster_pool_update_no_current>:
1c0081ba:	0005a223          	sw	zero,4(a1)
1c0081be:	0005a423          	sw	zero,8(a1)

1c0081c2 <__rt_cluster_pool_update_end>:
1c0081c2:	40cc                	lw	a1,4(s1)
1c0081c4:	4890                	lw	a2,16(s1)
1c0081c6:	0004a223          	sw	zero,4(s1)
1c0081ca:	00062023          	sw	zero,0(a2)
1c0081ce:	00000497          	auipc	s1,0x0
1c0081d2:	00a48493          	addi	s1,s1,10 # 1c0081d8 <__rt_remote_enqueue_event_loop_cluster_continue>
1c0081d6:	b72d                	j	1c008100 <__rt_event_enqueue>

1c0081d8 <__rt_remote_enqueue_event_loop_cluster_continue>:
1c0081d8:	147d                	addi	s0,s0,-1
1c0081da:	00804e63          	bgtz	s0,1c0081f6 <__rt_remote_enqueue_event_loop_next_cluster>
1c0081de:	ffc12403          	lw	s0,-4(sp)
1c0081e2:	ff812483          	lw	s1,-8(sp)
1c0081e6:	ff412503          	lw	a0,-12(sp)
1c0081ea:	ff012583          	lw	a1,-16(sp)
1c0081ee:	fec12603          	lw	a2,-20(sp)
1c0081f2:	30200073          	mret

1c0081f6 <__rt_remote_enqueue_event_loop_next_cluster>:
1c0081f6:	ffff9497          	auipc	s1,0xffff9
1c0081fa:	72248493          	addi	s1,s1,1826 # 1c001918 <__rt_fc_cluster_data>
1c0081fe:	4084                	lw	s1,0(s1)
1c008200:	02800593          	li	a1,40
1c008204:	02b405b3          	mul	a1,s0,a1
1c008208:	94ae                	add	s1,s1,a1
1c00820a:	bf49                	j	1c00819c <__rt_remote_enqueue_event_loop_cluster>

1c00820c <__rt_call_external_c_function>:
1c00820c:	7119                	addi	sp,sp,-128
1c00820e:	c006                	sw	ra,0(sp)
1c008210:	c20e                	sw	gp,4(sp)
1c008212:	c412                	sw	tp,8(sp)
1c008214:	c616                	sw	t0,12(sp)
1c008216:	c81a                	sw	t1,16(sp)
1c008218:	ca1e                	sw	t2,20(sp)
1c00821a:	d236                	sw	a3,36(sp)
1c00821c:	d43a                	sw	a4,40(sp)
1c00821e:	d63e                	sw	a5,44(sp)
1c008220:	d842                	sw	a6,48(sp)
1c008222:	da46                	sw	a7,52(sp)
1c008224:	dc72                	sw	t3,56(sp)
1c008226:	de76                	sw	t4,60(sp)
1c008228:	c0fa                	sw	t5,64(sp)
1c00822a:	c6fe                	sw	t6,76(sp)
1c00822c:	000600e7          	jalr	a2
1c008230:	4082                	lw	ra,0(sp)
1c008232:	4192                	lw	gp,4(sp)
1c008234:	4222                	lw	tp,8(sp)
1c008236:	42b2                	lw	t0,12(sp)
1c008238:	4342                	lw	t1,16(sp)
1c00823a:	43d2                	lw	t2,20(sp)
1c00823c:	5692                	lw	a3,36(sp)
1c00823e:	5722                	lw	a4,40(sp)
1c008240:	57b2                	lw	a5,44(sp)
1c008242:	5842                	lw	a6,48(sp)
1c008244:	58d2                	lw	a7,52(sp)
1c008246:	5e62                	lw	t3,56(sp)
1c008248:	5ef2                	lw	t4,60(sp)
1c00824a:	4f06                	lw	t5,64(sp)
1c00824c:	4fb6                	lw	t6,76(sp)
1c00824e:	6109                	addi	sp,sp,128
1c008250:	8482                	jr	s1

1c008252 <__rt_illegal_instr>:
1c008252:	fe112e23          	sw	ra,-4(sp)
1c008256:	fea12c23          	sw	a0,-8(sp)
1c00825a:	00001517          	auipc	a0,0x1
1c00825e:	17050513          	addi	a0,a0,368 # 1c0093ca <__rt_handle_illegal_instr>
1c008262:	010000ef          	jal	ra,1c008272 <__rt_call_c_function>
1c008266:	ffc12083          	lw	ra,-4(sp)
1c00826a:	ff812503          	lw	a0,-8(sp)
1c00826e:	30200073          	mret

1c008272 <__rt_call_c_function>:
1c008272:	7119                	addi	sp,sp,-128
1c008274:	c006                	sw	ra,0(sp)
1c008276:	c20e                	sw	gp,4(sp)
1c008278:	c412                	sw	tp,8(sp)
1c00827a:	c616                	sw	t0,12(sp)
1c00827c:	c81a                	sw	t1,16(sp)
1c00827e:	ca1e                	sw	t2,20(sp)
1c008280:	ce2e                	sw	a1,28(sp)
1c008282:	d032                	sw	a2,32(sp)
1c008284:	d236                	sw	a3,36(sp)
1c008286:	d43a                	sw	a4,40(sp)
1c008288:	d63e                	sw	a5,44(sp)
1c00828a:	d842                	sw	a6,48(sp)
1c00828c:	da46                	sw	a7,52(sp)
1c00828e:	dc72                	sw	t3,56(sp)
1c008290:	de76                	sw	t4,60(sp)
1c008292:	c0fa                	sw	t5,64(sp)
1c008294:	c6fe                	sw	t6,76(sp)
1c008296:	000500e7          	jalr	a0
1c00829a:	4082                	lw	ra,0(sp)
1c00829c:	4192                	lw	gp,4(sp)
1c00829e:	4222                	lw	tp,8(sp)
1c0082a0:	42b2                	lw	t0,12(sp)
1c0082a2:	4342                	lw	t1,16(sp)
1c0082a4:	43d2                	lw	t2,20(sp)
1c0082a6:	45f2                	lw	a1,28(sp)
1c0082a8:	5602                	lw	a2,32(sp)
1c0082aa:	5692                	lw	a3,36(sp)
1c0082ac:	5722                	lw	a4,40(sp)
1c0082ae:	57b2                	lw	a5,44(sp)
1c0082b0:	5842                	lw	a6,48(sp)
1c0082b2:	58d2                	lw	a7,52(sp)
1c0082b4:	5e62                	lw	t3,56(sp)
1c0082b6:	5ef2                	lw	t4,60(sp)
1c0082b8:	4f06                	lw	t5,64(sp)
1c0082ba:	4fb6                	lw	t6,76(sp)
1c0082bc:	6109                	addi	sp,sp,128
1c0082be:	8082                	ret

1c0082c0 <__rt_thread_start>:
1c0082c0:	8526                	mv	a0,s1
1c0082c2:	80ca                	mv	ra,s2
1c0082c4:	8402                	jr	s0

1c0082c6 <__rt_thread_switch>:
1c0082c6:	00152023          	sw	ra,0(a0)
1c0082ca:	c140                	sw	s0,4(a0)
1c0082cc:	c504                	sw	s1,8(a0)
1c0082ce:	01252623          	sw	s2,12(a0)
1c0082d2:	01352823          	sw	s3,16(a0)
1c0082d6:	01452a23          	sw	s4,20(a0)
1c0082da:	01552c23          	sw	s5,24(a0)
1c0082de:	01652e23          	sw	s6,28(a0)
1c0082e2:	03752023          	sw	s7,32(a0)
1c0082e6:	03852223          	sw	s8,36(a0)
1c0082ea:	03952423          	sw	s9,40(a0)
1c0082ee:	03a52623          	sw	s10,44(a0)
1c0082f2:	03b52823          	sw	s11,48(a0)
1c0082f6:	02252a23          	sw	sp,52(a0)
1c0082fa:	0005a083          	lw	ra,0(a1)
1c0082fe:	41c0                	lw	s0,4(a1)
1c008300:	4584                	lw	s1,8(a1)
1c008302:	00c5a903          	lw	s2,12(a1)
1c008306:	0105a983          	lw	s3,16(a1)
1c00830a:	0145aa03          	lw	s4,20(a1)
1c00830e:	0185aa83          	lw	s5,24(a1)
1c008312:	01c5ab03          	lw	s6,28(a1)
1c008316:	0205ab83          	lw	s7,32(a1)
1c00831a:	0245ac03          	lw	s8,36(a1)
1c00831e:	0285ac83          	lw	s9,40(a1)
1c008322:	02c5ad03          	lw	s10,44(a1)
1c008326:	0305ad83          	lw	s11,48(a1)
1c00832a:	0345a103          	lw	sp,52(a1)
1c00832e:	8082                	ret

1c008330 <__rt_fc_socevents_handler>:
1c008330:	7119                	addi	sp,sp,-128
1c008332:	c022                	sw	s0,0(sp)
1c008334:	c226                	sw	s1,4(sp)
1c008336:	c42a                	sw	a0,8(sp)
1c008338:	c62e                	sw	a1,12(sp)
1c00833a:	c832                	sw	a2,16(sp)
1c00833c:	1a10a437          	lui	s0,0x1a10a
1c008340:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_end+0xa1097e0>
1c008344:	5048                	lw	a0,36(s0)
1c008346:	44bd                	li	s1,15
1c008348:	00955c63          	ble	s1,a0,1c008360 <__rt_soc_evt_no_udma_channel>
1c00834c:	e3ff8417          	auipc	s0,0xe3ff8
1c008350:	cf440413          	addi	s0,s0,-780 # 40 <periph_channels>
1c008354:	00551493          	slli	s1,a0,0x5
1c008358:	94a2                	add	s1,s1,s0
1c00835a:	4ccc                	lw	a1,28(s1)
1c00835c:	4080                	lw	s0,0(s1)
1c00835e:	8582                	jr	a1

1c008360 <__rt_soc_evt_no_udma_channel>:
1c008360:	44f9                	li	s1,30
1c008362:	00955863          	ble	s1,a0,1c008372 <__rt_soc_evt_no_udma>
1c008366:	fea50593          	addi	a1,a0,-22
1c00836a:	058a                	slli	a1,a1,0x2
1c00836c:	2485a583          	lw	a1,584(a1)
1c008370:	8582                	jr	a1

1c008372 <__rt_soc_evt_no_udma>:
1c008372:	e3ff8497          	auipc	s1,0xe3ff8
1c008376:	ece48493          	addi	s1,s1,-306 # 240 <__rt_socevents_status>
1c00837a:	02000593          	li	a1,32
1c00837e:	00b54463          	blt	a0,a1,1c008386 <socevents_set>
1c008382:	0491                	addi	s1,s1,4
1c008384:	1501                	addi	a0,a0,-32

1c008386 <socevents_set>:
1c008386:	408c                	lw	a1,0(s1)
1c008388:	4405                	li	s0,1
1c00838a:	00a41533          	sll	a0,s0,a0
1c00838e:	00a5e633          	or	a2,a1,a0
1c008392:	c090                	sw	a2,0(s1)

1c008394 <udma_event_handler_end>:
1c008394:	4402                	lw	s0,0(sp)
1c008396:	4492                	lw	s1,4(sp)
1c008398:	4522                	lw	a0,8(sp)
1c00839a:	45b2                	lw	a1,12(sp)
1c00839c:	4642                	lw	a2,16(sp)
1c00839e:	6109                	addi	sp,sp,128
1c0083a0:	30200073          	mret

1c0083a4 <udma_event_handler>:
1c0083a4:	4080                	lw	s0,0(s1)
1c0083a6:	448c                	lw	a1,8(s1)
1c0083a8:	0a040363          	beqz	s0,1c00844e <__rt_udma_no_copy>
1c0083ac:	4c50                	lw	a2,28(s0)
1c0083ae:	4848                	lw	a0,20(s0)
1c0083b0:	06061263          	bnez	a2,1c008414 <dmaCmd>
1c0083b4:	c088                	sw	a0,0(s1)
1c0083b6:	4448                	lw	a0,12(s0)
1c0083b8:	e55d                	bnez	a0,1c008466 <handle_special_end>

1c0083ba <resume_after_special_end>:
1c0083ba:	04058263          	beqz	a1,1c0083fe <checkTask>
1c0083be:	4990                	lw	a2,16(a1)
1c0083c0:	49c8                	lw	a0,20(a1)
1c0083c2:	c611                	beqz	a2,1c0083ce <__rt_udma_call_enqueue_callback_resume>
1c0083c4:	00000497          	auipc	s1,0x0
1c0083c8:	00a48493          	addi	s1,s1,10 # 1c0083ce <__rt_udma_call_enqueue_callback_resume>
1c0083cc:	8602                	jr	a2

1c0083ce <__rt_udma_call_enqueue_callback_resume>:
1c0083ce:	44d0                	lw	a2,12(s1)
1c0083d0:	c488                	sw	a0,8(s1)
1c0083d2:	4188                	lw	a0,0(a1)
1c0083d4:	41c4                	lw	s1,4(a1)
1c0083d6:	c208                	sw	a0,0(a2)
1c0083d8:	c244                	sw	s1,4(a2)
1c0083da:	45c4                	lw	s1,12(a1)
1c0083dc:	88bd                	andi	s1,s1,15
1c0083de:	4515                	li	a0,5
1c0083e0:	00a4cd63          	blt	s1,a0,1c0083fa <transfer_resume>
1c0083e4:	4519                	li	a0,6
1c0083e6:	00a48563          	beq	s1,a0,1c0083f0 <dual>
1c0083ea:	451d                	li	a0,7
1c0083ec:	00a48263          	beq	s1,a0,1c0083f0 <dual>

1c0083f0 <dual>:
1c0083f0:	553d                	li	a0,-17
1c0083f2:	00a674b3          	and	s1,a2,a0
1c0083f6:	51c8                	lw	a0,36(a1)
1c0083f8:	d088                	sw	a0,32(s1)

1c0083fa <transfer_resume>:
1c0083fa:	4588                	lw	a0,8(a1)
1c0083fc:	c608                	sw	a0,8(a2)

1c0083fe <checkTask>:
1c0083fe:	4c0c                	lw	a1,24(s0)
1c008400:	00000497          	auipc	s1,0x0
1c008404:	f9448493          	addi	s1,s1,-108 # 1c008394 <udma_event_handler_end>
1c008408:	00058463          	beqz	a1,1c008410 <checkTask+0x12>
1c00840c:	cf5ff06f          	j	1c008100 <__rt_event_enqueue>
1c008410:	f85ff06f          	j	1c008394 <udma_event_handler_end>

1c008414 <dmaCmd>:
1c008414:	44cc                	lw	a1,12(s1)
1c008416:	553d                	li	a0,-17
1c008418:	00a5f4b3          	and	s1,a1,a0
1c00841c:	5048                	lw	a0,36(s0)
1c00841e:	9532                	add	a0,a0,a2
1c008420:	d088                	sw	a0,32(s1)
1c008422:	d048                	sw	a0,36(s0)
1c008424:	4008                	lw	a0,0(s0)
1c008426:	5004                	lw	s1,32(s0)
1c008428:	9532                	add	a0,a0,a2
1c00842a:	8c91                	sub	s1,s1,a2
1c00842c:	00964963          	blt	a2,s1,1c00843e <not_last>
1c008430:	8626                	mv	a2,s1
1c008432:	00042e23          	sw	zero,28(s0)
1c008436:	00061463          	bnez	a2,1c00843e <not_last>
1c00843a:	f5bff06f          	j	1c008394 <udma_event_handler_end>

1c00843e <not_last>:
1c00843e:	c008                	sw	a0,0(s0)
1c008440:	d004                	sw	s1,32(s0)
1c008442:	c188                	sw	a0,0(a1)
1c008444:	c1d0                	sw	a2,4(a1)
1c008446:	4541                	li	a0,16
1c008448:	c588                	sw	a0,8(a1)
1c00844a:	f4bff06f          	j	1c008394 <udma_event_handler_end>

1c00844e <__rt_udma_no_copy>:
1c00844e:	e3ff8497          	auipc	s1,0xe3ff8
1c008452:	df248493          	addi	s1,s1,-526 # 240 <__rt_socevents_status>
1c008456:	4080                	lw	s0,0(s1)
1c008458:	4585                	li	a1,1
1c00845a:	00a59533          	sll	a0,a1,a0
1c00845e:	8c49                	or	s0,s0,a0
1c008460:	c080                	sw	s0,0(s1)
1c008462:	f33ff06f          	j	1c008394 <udma_event_handler_end>

1c008466 <handle_special_end>:
1c008466:	460d                	li	a2,3
1c008468:	04c50663          	beq	a0,a2,1c0084b4 <i2c_step1>
1c00846c:	4611                	li	a2,4
1c00846e:	06c50163          	beq	a0,a2,1c0084d0 <i2c_step2>
1c008472:	b7a1                	j	1c0083ba <resume_after_special_end>

1c008474 <spim_step3>:
1c008474:	5408                	lw	a0,40(s0)
1c008476:	c448                	sw	a0,12(s0)
1c008478:	4088                	lw	a0,0(s1)
1c00847a:	c848                	sw	a0,20(s0)
1c00847c:	c080                	sw	s0,0(s1)
1c00847e:	44d0                	lw	a2,12(s1)
1c008480:	5448                	lw	a0,44(s0)
1c008482:	c208                	sw	a0,0(a2)
1c008484:	5048                	lw	a0,36(s0)
1c008486:	c248                	sw	a0,4(a2)
1c008488:	4408                	lw	a0,8(s0)
1c00848a:	c608                	sw	a0,8(a2)
1c00848c:	f09ff06f          	j	1c008394 <udma_event_handler_end>

1c008490 <spim_step2>:
1c008490:	00042623          	sw	zero,12(s0)
1c008494:	4088                	lw	a0,0(s1)
1c008496:	c848                	sw	a0,20(s0)
1c008498:	c080                	sw	s0,0(s1)
1c00849a:	90000637          	lui	a2,0x90000
1c00849e:	c070                	sw	a2,68(s0)
1c0084a0:	44d0                	lw	a2,12(s1)
1c0084a2:	04440513          	addi	a0,s0,68
1c0084a6:	c208                	sw	a0,0(a2)
1c0084a8:	4511                	li	a0,4
1c0084aa:	c248                	sw	a0,4(a2)
1c0084ac:	4541                	li	a0,16
1c0084ae:	c608                	sw	a0,8(a2)
1c0084b0:	ee5ff06f          	j	1c008394 <udma_event_handler_end>

1c0084b4 <i2c_step1>:
1c0084b4:	5408                	lw	a0,40(s0)
1c0084b6:	c448                	sw	a0,12(s0)
1c0084b8:	4088                	lw	a0,0(s1)
1c0084ba:	c848                	sw	a0,20(s0)
1c0084bc:	c080                	sw	s0,0(s1)
1c0084be:	44d0                	lw	a2,12(s1)
1c0084c0:	4008                	lw	a0,0(s0)
1c0084c2:	c208                	sw	a0,0(a2)
1c0084c4:	5048                	lw	a0,36(s0)
1c0084c6:	c248                	sw	a0,4(a2)
1c0084c8:	4408                	lw	a0,8(s0)
1c0084ca:	c608                	sw	a0,8(a2)
1c0084cc:	ec9ff06f          	j	1c008394 <udma_event_handler_end>

1c0084d0 <i2c_step2>:
1c0084d0:	00042623          	sw	zero,12(s0)
1c0084d4:	4088                	lw	a0,0(s1)
1c0084d6:	c848                	sw	a0,20(s0)
1c0084d8:	c080                	sw	s0,0(s1)
1c0084da:	02000613          	li	a2,32
1c0084de:	c070                	sw	a2,68(s0)
1c0084e0:	44d0                	lw	a2,12(s1)
1c0084e2:	04440513          	addi	a0,s0,68
1c0084e6:	c208                	sw	a0,0(a2)
1c0084e8:	4505                	li	a0,1
1c0084ea:	c248                	sw	a0,4(a2)
1c0084ec:	4541                	li	a0,16
1c0084ee:	c608                	sw	a0,8(a2)
1c0084f0:	ea5ff06f          	j	1c008394 <udma_event_handler_end>

1c0084f4 <__clzsi2>:
1c0084f4:	67c1                	lui	a5,0x10
1c0084f6:	02f57663          	bleu	a5,a0,1c008522 <__clzsi2+0x2e>
1c0084fa:	0ff00793          	li	a5,255
1c0084fe:	00a7b7b3          	sltu	a5,a5,a0
1c008502:	078e                	slli	a5,a5,0x3
1c008504:	02000713          	li	a4,32
1c008508:	8f1d                	sub	a4,a4,a5
1c00850a:	00f557b3          	srl	a5,a0,a5
1c00850e:	1c000537          	lui	a0,0x1c000
1c008512:	2ec50513          	addi	a0,a0,748 # 1c0002ec <__DTOR_END__>
1c008516:	97aa                	add	a5,a5,a0
1c008518:	0007c503          	lbu	a0,0(a5) # 10000 <__l1_heap_size+0x20>
1c00851c:	40a70533          	sub	a0,a4,a0
1c008520:	8082                	ret
1c008522:	01000737          	lui	a4,0x1000
1c008526:	47c1                	li	a5,16
1c008528:	fce56ee3          	bltu	a0,a4,1c008504 <__clzsi2+0x10>
1c00852c:	47e1                	li	a5,24
1c00852e:	bfd9                	j	1c008504 <__clzsi2+0x10>

1c008530 <cluster_entry>:
1c008530:	f1402673          	csrr	a2,mhartid
1c008534:	1c000537          	lui	a0,0x1c000
1c008538:	40565593          	srai	a1,a2,0x5
1c00853c:	7159                	addi	sp,sp,-112
1c00853e:	f4563633          	p.bclr	a2,a2,26,5
1c008542:	f265b5b3          	p.bclr	a1,a1,25,6
1c008546:	3ec50513          	addi	a0,a0,1004 # 1c0003ec <__DTOR_END__+0x100>
1c00854a:	d686                	sw	ra,108(sp)
1c00854c:	d0ca                	sw	s2,96(sp)
1c00854e:	d4a2                	sw	s0,104(sp)
1c008550:	d2a6                	sw	s1,100(sp)
1c008552:	cece                	sw	s3,92(sp)
1c008554:	2d2020ef          	jal	ra,1c00a826 <printf>
1c008558:	40000593          	li	a1,1024
1c00855c:	450d                	li	a0,3
1c00855e:	10000937          	lui	s2,0x10000
1c008562:	230d                	jal	1c008a84 <rt_alloc>
1c008564:	01490913          	addi	s2,s2,20 # 10000014 <Twiddles_l1>
1c008568:	00a92023          	sw	a0,0(s2)
1c00856c:	40000593          	li	a1,1024
1c008570:	450d                	li	a0,3
1c008572:	2b09                	jal	1c008a84 <rt_alloc>
1c008574:	6585                	lui	a1,0x1
1c008576:	00a92223          	sw	a0,4(s2)
1c00857a:	80058593          	addi	a1,a1,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00857e:	450d                	li	a0,3
1c008580:	2311                	jal	1c008a84 <rt_alloc>
1c008582:	00092683          	lw	a3,0(s2)
1c008586:	002047b7          	lui	a5,0x204
1c00858a:	00a92423          	sw	a0,8(s2)
1c00858e:	4007a583          	lw	a1,1024(a5) # 204400 <__l1_heap_size+0x1f4420>
1c008592:	000b0737          	lui	a4,0xb0
1c008596:	40070713          	addi	a4,a4,1024 # b0400 <__l1_heap_size+0xa0420>
1c00859a:	c1574733          	p.bset	a4,a4,0,21
1c00859e:	40e7a023          	sw	a4,1024(a5)
1c0085a2:	40d7a023          	sw	a3,1024(a5)
1c0085a6:	1c001737          	lui	a4,0x1c001
1c0085aa:	32c70713          	addi	a4,a4,812 # 1c00132c <twiddleCoef_i16_512>
1c0085ae:	40e7a023          	sw	a4,1024(a5)
1c0085b2:	4047a783          	lw	a5,1028(a5)
1c0085b6:	40b7d7b3          	sra	a5,a5,a1
1c0085ba:	fc17b7b3          	p.bclr	a5,a5,30,1
1c0085be:	c385                	beqz	a5,1c0085de <cluster_entry+0xae>
1c0085c0:	4605                	li	a2,1
1c0085c2:	00b61633          	sll	a2,a2,a1
1c0085c6:	10000693          	li	a3,256
1c0085ca:	002047b7          	lui	a5,0x204
1c0085ce:	c794                	sw	a3,8(a5)
1c0085d0:	03c7e703          	p.elw	a4,60(a5) # 20403c <__l1_heap_size+0x1f405c>
1c0085d4:	c3d4                	sw	a3,4(a5)
1c0085d6:	4047a703          	lw	a4,1028(a5)
1c0085da:	8f71                	and	a4,a4,a2
1c0085dc:	fb6d                	bnez	a4,1c0085ce <cluster_entry+0x9e>
1c0085de:	4605                	li	a2,1
1c0085e0:	00b615b3          	sll	a1,a2,a1
1c0085e4:	002047b7          	lui	a5,0x204
1c0085e8:	40b7a223          	sw	a1,1028(a5) # 204404 <__l1_heap_size+0x1f4424>
1c0085ec:	00492683          	lw	a3,4(s2)
1c0085f0:	4007a583          	lw	a1,1024(a5)
1c0085f4:	000b0737          	lui	a4,0xb0
1c0085f8:	40070713          	addi	a4,a4,1024 # b0400 <__l1_heap_size+0xa0420>
1c0085fc:	c1574733          	p.bset	a4,a4,0,21
1c008600:	40e7a023          	sw	a4,1024(a5)
1c008604:	40d7a023          	sw	a3,1024(a5)
1c008608:	1c001737          	lui	a4,0x1c001
1c00860c:	f2c70713          	addi	a4,a4,-212 # 1c000f2c <SwapTable_512>
1c008610:	40e7a023          	sw	a4,1024(a5)
1c008614:	4047a783          	lw	a5,1028(a5)
1c008618:	40b7d7b3          	sra	a5,a5,a1
1c00861c:	fc17b7b3          	p.bclr	a5,a5,30,1
1c008620:	cf99                	beqz	a5,1c00863e <cluster_entry+0x10e>
1c008622:	00b61633          	sll	a2,a2,a1
1c008626:	10000693          	li	a3,256
1c00862a:	002047b7          	lui	a5,0x204
1c00862e:	c794                	sw	a3,8(a5)
1c008630:	03c7e703          	p.elw	a4,60(a5) # 20403c <__l1_heap_size+0x1f405c>
1c008634:	c3d4                	sw	a3,4(a5)
1c008636:	4047a703          	lw	a4,1028(a5)
1c00863a:	8f71                	and	a4,a4,a2
1c00863c:	fb6d                	bnez	a4,1c00862e <cluster_entry+0xfe>
1c00863e:	4605                	li	a2,1
1c008640:	00b615b3          	sll	a1,a2,a1
1c008644:	002047b7          	lui	a5,0x204
1c008648:	40b7a223          	sw	a1,1028(a5) # 204404 <__l1_heap_size+0x1f4424>
1c00864c:	00892683          	lw	a3,8(s2)
1c008650:	4007a583          	lw	a1,1024(a5)
1c008654:	000b1737          	lui	a4,0xb1
1c008658:	80070713          	addi	a4,a4,-2048 # b0800 <__l1_heap_size+0xa0820>
1c00865c:	c1574733          	p.bset	a4,a4,0,21
1c008660:	40e7a023          	sw	a4,1024(a5)
1c008664:	40d7a023          	sw	a3,1024(a5)
1c008668:	1c011737          	lui	a4,0x1c011
1c00866c:	96870713          	addi	a4,a4,-1688 # 1c010968 <x>
1c008670:	40e7a023          	sw	a4,1024(a5)
1c008674:	4047a783          	lw	a5,1028(a5)
1c008678:	40b7d7b3          	sra	a5,a5,a1
1c00867c:	fc17b7b3          	p.bclr	a5,a5,30,1
1c008680:	cf99                	beqz	a5,1c00869e <cluster_entry+0x16e>
1c008682:	00b61633          	sll	a2,a2,a1
1c008686:	10000693          	li	a3,256
1c00868a:	002047b7          	lui	a5,0x204
1c00868e:	c794                	sw	a3,8(a5)
1c008690:	03c7e703          	p.elw	a4,60(a5) # 20403c <__l1_heap_size+0x1f405c>
1c008694:	c3d4                	sw	a3,4(a5)
1c008696:	4047a703          	lw	a4,1028(a5)
1c00869a:	8f71                	and	a4,a4,a2
1c00869c:	fb6d                	bnez	a4,1c00868e <cluster_entry+0x15e>
1c00869e:	4785                	li	a5,1
1c0086a0:	00b797b3          	sll	a5,a5,a1
1c0086a4:	00204737          	lui	a4,0x204
1c0086a8:	40f72223          	sw	a5,1028(a4) # 204404 <__l1_heap_size+0x1f4424>
1c0086ac:	0028                	addi	a0,sp,8
1c0086ae:	2e1000ef          	jal	ra,1c00918e <rt_perf_init>
1c0086b2:	65c1                	lui	a1,0x10
1c0086b4:	0589                	addi	a1,a1,2
1c0086b6:	0028                	addi	a0,sp,8
1c0086b8:	2eb000ef          	jal	ra,1c0091a2 <rt_perf_conf>
1c0086bc:	477d                	li	a4,31
1c0086be:	f14027f3          	csrr	a5,mhartid
1c0086c2:	ca5797b3          	p.extractu	a5,a5,5,5
1c0086c6:	10e78e63          	beq	a5,a4,1c0087e2 <cluster_entry+0x2b2>
1c0086ca:	102007b7          	lui	a5,0x10200
1c0086ce:	4705                	li	a4,1
1c0086d0:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x2003e0>
1c0086d4:	02e7a023          	sw	a4,32(a5)
1c0086d8:	4781                	li	a5,0
1c0086da:	79f79073          	csrw	pccr31,a5
1c0086de:	f14027f3          	csrr	a5,mhartid
1c0086e2:	477d                	li	a4,31
1c0086e4:	ca5797b3          	p.extractu	a5,a5,5,5
1c0086e8:	10e78c63          	beq	a5,a4,1c008800 <cluster_entry+0x2d0>
1c0086ec:	102007b7          	lui	a5,0x10200
1c0086f0:	4705                	li	a4,1
1c0086f2:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x2003e0>
1c0086f6:	00e7ac23          	sw	a4,24(a5)
1c0086fa:	478d                	li	a5,3
1c0086fc:	7a179073          	csrw	pcmr,a5
1c008700:	00492603          	lw	a2,4(s2)
1c008704:	00092583          	lw	a1,0(s2)
1c008708:	00892503          	lw	a0,8(s2)
1c00870c:	20000693          	li	a3,512
1c008710:	2ab1                	jal	1c00886c <plp_cfft_i16s_rv32im>
1c008712:	477d                	li	a4,31
1c008714:	f14027f3          	csrr	a5,mhartid
1c008718:	ca5797b3          	p.extractu	a5,a5,5,5
1c00871c:	10e78063          	beq	a5,a4,1c00881c <cluster_entry+0x2ec>
1c008720:	102007b7          	lui	a5,0x10200
1c008724:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x2003e0>
1c008728:	0007a023          	sw	zero,0(a5)
1c00872c:	4781                	li	a5,0
1c00872e:	7a179073          	csrw	pcmr,a5
1c008732:	1c000537          	lui	a0,0x1c000
1c008736:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c00873a:	7ed010ef          	jal	ra,1c00a726 <puts>
1c00873e:	4401                	li	s0,0
1c008740:	1c0004b7          	lui	s1,0x1c000
1c008744:	00892783          	lw	a5,8(s2)
1c008748:	41848513          	addi	a0,s1,1048 # 1c000418 <__DTOR_END__+0x12c>
1c00874c:	97a2                	add	a5,a5,s0
1c00874e:	00079583          	lh	a1,0(a5)
1c008752:	0409                	addi	s0,s0,2
1c008754:	0d2020ef          	jal	ra,1c00a826 <printf>
1c008758:	80040793          	addi	a5,s0,-2048
1c00875c:	f7e5                	bnez	a5,1c008744 <cluster_entry+0x214>
1c00875e:	1c0009b7          	lui	s3,0x1c000
1c008762:	44098513          	addi	a0,s3,1088 # 1c000440 <__DTOR_END__+0x154>
1c008766:	7c1010ef          	jal	ra,1c00a726 <puts>
1c00876a:	1c000537          	lui	a0,0x1c000
1c00876e:	1c010437          	lui	s0,0x1c010
1c008772:	6905                	lui	s2,0x1
1c008774:	42050513          	addi	a0,a0,1056 # 1c000420 <__DTOR_END__+0x134>
1c008778:	16840413          	addi	s0,s0,360 # 1c010168 <__cluster_text_end>
1c00877c:	80090913          	addi	s2,s2,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c008780:	7a7010ef          	jal	ra,1c00a726 <puts>
1c008784:	9922                	add	s2,s2,s0
1c008786:	0024158b          	p.lh	a1,2(s0!)
1c00878a:	41848513          	addi	a0,s1,1048
1c00878e:	098020ef          	jal	ra,1c00a826 <printf>
1c008792:	ff241ae3          	bne	s0,s2,1c008786 <cluster_entry+0x256>
1c008796:	44098513          	addi	a0,s3,1088
1c00879a:	78d010ef          	jal	ra,1c00a726 <puts>
1c00879e:	477d                	li	a4,31
1c0087a0:	f14027f3          	csrr	a5,mhartid
1c0087a4:	ca5797b3          	p.extractu	a5,a5,5,5
1c0087a8:	06e78563          	beq	a5,a4,1c008812 <cluster_entry+0x2e2>
1c0087ac:	102005b7          	lui	a1,0x10200
1c0087b0:	40058593          	addi	a1,a1,1024 # 10200400 <__l1_end+0x2003e0>
1c0087b4:	0085a583          	lw	a1,8(a1)
1c0087b8:	1c000537          	lui	a0,0x1c000
1c0087bc:	43050513          	addi	a0,a0,1072 # 1c000430 <__DTOR_END__+0x144>
1c0087c0:	066020ef          	jal	ra,1c00a826 <printf>
1c0087c4:	781025f3          	csrr	a1,pccr1
1c0087c8:	1c000537          	lui	a0,0x1c000
1c0087cc:	44450513          	addi	a0,a0,1092 # 1c000444 <__DTOR_END__+0x158>
1c0087d0:	056020ef          	jal	ra,1c00a826 <printf>
1c0087d4:	50b6                	lw	ra,108(sp)
1c0087d6:	5426                	lw	s0,104(sp)
1c0087d8:	5496                	lw	s1,100(sp)
1c0087da:	5906                	lw	s2,96(sp)
1c0087dc:	49f6                	lw	s3,92(sp)
1c0087de:	6165                	addi	sp,sp,112
1c0087e0:	8082                	ret
1c0087e2:	4785                	li	a5,1
1c0087e4:	1a10b737          	lui	a4,0x1a10b
1c0087e8:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa10b000>
1c0087ec:	4781                	li	a5,0
1c0087ee:	79f79073          	csrw	pccr31,a5
1c0087f2:	f14027f3          	csrr	a5,mhartid
1c0087f6:	477d                	li	a4,31
1c0087f8:	ca5797b3          	p.extractu	a5,a5,5,5
1c0087fc:	eee798e3          	bne	a5,a4,1c0086ec <cluster_entry+0x1bc>
1c008800:	4785                	li	a5,1
1c008802:	1a10b737          	lui	a4,0x1a10b
1c008806:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa10aff8>
1c00880a:	478d                	li	a5,3
1c00880c:	7a179073          	csrw	pcmr,a5
1c008810:	bdc5                	j	1c008700 <cluster_entry+0x1d0>
1c008812:	1a10b5b7          	lui	a1,0x1a10b
1c008816:	0085a583          	lw	a1,8(a1) # 1a10b008 <__l1_end+0xa10afe8>
1c00881a:	bf79                	j	1c0087b8 <cluster_entry+0x288>
1c00881c:	1a10b7b7          	lui	a5,0x1a10b
1c008820:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa10afe0>
1c008824:	4781                	li	a5,0
1c008826:	7a179073          	csrw	pcmr,a5
1c00882a:	b721                	j	1c008732 <cluster_entry+0x202>

1c00882c <main>:
1c00882c:	1101                	addi	sp,sp,-32
1c00882e:	4681                	li	a3,0
1c008830:	4601                	li	a2,0
1c008832:	4581                	li	a1,0
1c008834:	4505                	li	a0,1
1c008836:	ce06                	sw	ra,28(sp)
1c008838:	00d000ef          	jal	ra,1c009044 <rt_cluster_mount>
1c00883c:	1c008637          	lui	a2,0x1c008
1c008840:	4881                	li	a7,0
1c008842:	4801                	li	a6,0
1c008844:	4781                	li	a5,0
1c008846:	4701                	li	a4,0
1c008848:	4681                	li	a3,0
1c00884a:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c00884e:	4581                	li	a1,0
1c008850:	c002                	sw	zero,0(sp)
1c008852:	4501                	li	a0,0
1c008854:	756000ef          	jal	ra,1c008faa <rt_cluster_call>
1c008858:	4501                	li	a0,0
1c00885a:	4681                	li	a3,0
1c00885c:	4601                	li	a2,0
1c00885e:	4581                	li	a1,0
1c008860:	7e4000ef          	jal	ra,1c009044 <rt_cluster_mount>
1c008864:	40f2                	lw	ra,28(sp)
1c008866:	4501                	li	a0,0
1c008868:	6105                	addi	sp,sp,32
1c00886a:	8082                	ret

1c00886c <plp_cfft_i16s_rv32im>:
1c00886c:	7179                	addi	sp,sp,-48
1c00886e:	c662                	sw	s8,12(sp)
1c008870:	d622                	sw	s0,44(sp)
1c008872:	d426                	sw	s1,40(sp)
1c008874:	d24a                	sw	s2,36(sp)
1c008876:	d04e                	sw	s3,32(sp)
1c008878:	ce52                	sw	s4,28(sp)
1c00887a:	cc56                	sw	s5,24(sp)
1c00887c:	ca5a                	sw	s6,20(sp)
1c00887e:	c85e                	sw	s7,16(sp)
1c008880:	c466                	sw	s9,8(sp)
1c008882:	c26a                	sw	s10,4(sp)
1c008884:	0016dc13          	srli	s8,a3,0x1
1c008888:	160c0163          	beqz	s8,1c0089ea <plp_cfft_i16s_rv32im+0x17e>
1c00888c:	87e2                	mv	a5,s8
1c00888e:	4b81                	li	s7,0
1c008890:	a011                	j	1c008894 <plp_cfft_i16s_rv32im+0x28>
1c008892:	8bba                	mv	s7,a4
1c008894:	8385                	srli	a5,a5,0x1
1c008896:	001b8713          	addi	a4,s7,1
1c00889a:	ffe5                	bnez	a5,1c008892 <plp_cfft_i16s_rv32im+0x26>
1c00889c:	0a0b8a63          	beqz	s7,1c008950 <plp_cfft_i16s_rv32im+0xe4>
1c0088a0:	8b62                	mv	s6,s8
1c0088a2:	4405                	li	s0,1
1c0088a4:	4c81                	li	s9,0
1c0088a6:	080b0d63          	beqz	s6,1c008940 <plp_cfft_i16s_rv32im+0xd4>
1c0088aa:	002b1993          	slli	s3,s6,0x2
1c0088ae:	c849                	beqz	s0,1c008940 <plp_cfft_i16s_rv32im+0xd4>
1c0088b0:	00a98a33          	add	s4,s3,a0
1c0088b4:	00241a93          	slli	s5,s0,0x2
1c0088b8:	892e                	mv	s2,a1
1c0088ba:	84aa                	mv	s1,a0
1c0088bc:	003b1393          	slli	t2,s6,0x3
1c0088c0:	0989                	addi	s3,s3,2
1c0088c2:	00091283          	lh	t0,0(s2)
1c0088c6:	00291f83          	lh	t6,2(s2)
1c0088ca:	00998333          	add	t1,s3,s1
1c0088ce:	8e26                	mv	t3,s1
1c0088d0:	4e81                	li	t4,0
1c0088d2:	000e1803          	lh	a6,0(t3)
1c0088d6:	ffe31d03          	lh	s10,-2(t1)
1c0088da:	002e1f03          	lh	t5,2(t3)
1c0088de:	00035703          	lhu	a4,0(t1)
1c0088e2:	41a807b3          	sub	a5,a6,s10
1c0088e6:	986a                	add	a6,a6,s10
1c0088e8:	40185813          	srai	a6,a6,0x1
1c0088ec:	010e1023          	sh	a6,0(t3)
1c0088f0:	00031803          	lh	a6,0(t1)
1c0088f4:	40ef0733          	sub	a4,t5,a4
1c0088f8:	07c2                	slli	a5,a5,0x10
1c0088fa:	0742                	slli	a4,a4,0x10
1c0088fc:	87c1                	srai	a5,a5,0x10
1c0088fe:	8741                	srai	a4,a4,0x10
1c008900:	025788b3          	mul	a7,a5,t0
1c008904:	9f42                	add	t5,t5,a6
1c008906:	401f5f13          	srai	t5,t5,0x1
1c00890a:	01ee1123          	sh	t5,2(t3)
1c00890e:	0e85                	addi	t4,t4,1
1c008910:	9e1e                	add	t3,t3,t2
1c008912:	03f70833          	mul	a6,a4,t6
1c008916:	03f787b3          	mul	a5,a5,t6
1c00891a:	410888b3          	sub	a7,a7,a6
1c00891e:	4108d893          	srai	a7,a7,0x10
1c008922:	ff131f23          	sh	a7,-2(t1)
1c008926:	02570733          	mul	a4,a4,t0
1c00892a:	97ba                	add	a5,a5,a4
1c00892c:	87c1                	srai	a5,a5,0x10
1c00892e:	00f31023          	sh	a5,0(t1)
1c008932:	931e                	add	t1,t1,t2
1c008934:	f88e9fe3          	bne	t4,s0,1c0088d2 <plp_cfft_i16s_rv32im+0x66>
1c008938:	0491                	addi	s1,s1,4
1c00893a:	9956                	add	s2,s2,s5
1c00893c:	f89a13e3          	bne	s4,s1,1c0088c2 <plp_cfft_i16s_rv32im+0x56>
1c008940:	0c85                	addi	s9,s9,1
1c008942:	0406                	slli	s0,s0,0x1
1c008944:	001b5b13          	srli	s6,s6,0x1
1c008948:	f57cefe3          	bltu	s9,s7,1c0088a6 <plp_cfft_i16s_rv32im+0x3a>
1c00894c:	040c0163          	beqz	s8,1c00898e <plp_cfft_i16s_rv32im+0x122>
1c008950:	003c1313          	slli	t1,s8,0x3
1c008954:	87aa                	mv	a5,a0
1c008956:	932a                	add	t1,t1,a0
1c008958:	0047d883          	lhu	a7,4(a5)
1c00895c:	0007d583          	lhu	a1,0(a5)
1c008960:	0027d703          	lhu	a4,2(a5)
1c008964:	0067d803          	lhu	a6,6(a5)
1c008968:	01158e33          	add	t3,a1,a7
1c00896c:	411585b3          	sub	a1,a1,a7
1c008970:	010708b3          	add	a7,a4,a6
1c008974:	41070733          	sub	a4,a4,a6
1c008978:	01c79023          	sh	t3,0(a5)
1c00897c:	01179123          	sh	a7,2(a5)
1c008980:	00b79223          	sh	a1,4(a5)
1c008984:	00e79323          	sh	a4,6(a5)
1c008988:	07a1                	addi	a5,a5,8
1c00898a:	fc6797e3          	bne	a5,t1,1c008958 <plp_cfft_i16s_rv32im+0xec>
1c00898e:	c2a9                	beqz	a3,1c0089d0 <plp_cfft_i16s_rv32im+0x164>
1c008990:	4701                	li	a4,0
1c008992:	4781                	li	a5,0
1c008994:	00279593          	slli	a1,a5,0x2
1c008998:	0786                	slli	a5,a5,0x1
1c00899a:	97b2                	add	a5,a5,a2
1c00899c:	0007d803          	lhu	a6,0(a5)
1c0089a0:	95aa                	add	a1,a1,a0
1c0089a2:	00170893          	addi	a7,a4,1
1c0089a6:	00281793          	slli	a5,a6,0x2
1c0089aa:	97aa                	add	a5,a5,a0
1c0089ac:	01077c63          	bleu	a6,a4,1c0089c4 <plp_cfft_i16s_rv32im+0x158>
1c0089b0:	00079803          	lh	a6,0(a5)
1c0089b4:	4198                	lw	a4,0(a1)
1c0089b6:	01059023          	sh	a6,0(a1)
1c0089ba:	00279803          	lh	a6,2(a5)
1c0089be:	01059123          	sh	a6,2(a1)
1c0089c2:	c398                	sw	a4,0(a5)
1c0089c4:	01089713          	slli	a4,a7,0x10
1c0089c8:	8341                	srli	a4,a4,0x10
1c0089ca:	87ba                	mv	a5,a4
1c0089cc:	fcd764e3          	bltu	a4,a3,1c008994 <plp_cfft_i16s_rv32im+0x128>
1c0089d0:	5432                	lw	s0,44(sp)
1c0089d2:	54a2                	lw	s1,40(sp)
1c0089d4:	5912                	lw	s2,36(sp)
1c0089d6:	5982                	lw	s3,32(sp)
1c0089d8:	4a72                	lw	s4,28(sp)
1c0089da:	4ae2                	lw	s5,24(sp)
1c0089dc:	4b52                	lw	s6,20(sp)
1c0089de:	4bc2                	lw	s7,16(sp)
1c0089e0:	4c32                	lw	s8,12(sp)
1c0089e2:	4ca2                	lw	s9,8(sp)
1c0089e4:	4d12                	lw	s10,4(sp)
1c0089e6:	6145                	addi	sp,sp,48
1c0089e8:	8082                	ret
1c0089ea:	5bfd                	li	s7,-1
1c0089ec:	bd55                	j	1c0088a0 <plp_cfft_i16s_rv32im+0x34>

1c0089ee <rt_user_alloc_init>:
1c0089ee:	00758793          	addi	a5,a1,7
1c0089f2:	9be1                	andi	a5,a5,-8
1c0089f4:	40b785b3          	sub	a1,a5,a1
1c0089f8:	c11c                	sw	a5,0(a0)
1c0089fa:	8e0d                	sub	a2,a2,a1
1c0089fc:	00c05663          	blez	a2,1c008a08 <rt_user_alloc_init+0x1a>
1c008a00:	9a61                	andi	a2,a2,-8
1c008a02:	c390                	sw	a2,0(a5)
1c008a04:	0007a223          	sw	zero,4(a5)
1c008a08:	8082                	ret

1c008a0a <rt_user_alloc>:
1c008a0a:	411c                	lw	a5,0(a0)
1c008a0c:	059d                	addi	a1,a1,7
1c008a0e:	99e1                	andi	a1,a1,-8
1c008a10:	4681                	li	a3,0
1c008a12:	cb89                	beqz	a5,1c008a24 <rt_user_alloc+0x1a>
1c008a14:	4398                	lw	a4,0(a5)
1c008a16:	00b74963          	blt	a4,a1,1c008a28 <rt_user_alloc+0x1e>
1c008a1a:	00b71c63          	bne	a4,a1,1c008a32 <rt_user_alloc+0x28>
1c008a1e:	43d8                	lw	a4,4(a5)
1c008a20:	c699                	beqz	a3,1c008a2e <rt_user_alloc+0x24>
1c008a22:	c2d8                	sw	a4,4(a3)
1c008a24:	853e                	mv	a0,a5
1c008a26:	8082                	ret
1c008a28:	86be                	mv	a3,a5
1c008a2a:	43dc                	lw	a5,4(a5)
1c008a2c:	b7dd                	j	1c008a12 <rt_user_alloc+0x8>
1c008a2e:	c118                	sw	a4,0(a0)
1c008a30:	bfd5                	j	1c008a24 <rt_user_alloc+0x1a>
1c008a32:	8f0d                	sub	a4,a4,a1
1c008a34:	c398                	sw	a4,0(a5)
1c008a36:	97ba                	add	a5,a5,a4
1c008a38:	b7f5                	j	1c008a24 <rt_user_alloc+0x1a>

1c008a3a <rt_user_free>:
1c008a3a:	411c                	lw	a5,0(a0)
1c008a3c:	061d                	addi	a2,a2,7
1c008a3e:	9a61                	andi	a2,a2,-8
1c008a40:	4701                	li	a4,0
1c008a42:	c399                	beqz	a5,1c008a48 <rt_user_free+0xe>
1c008a44:	02b7e763          	bltu	a5,a1,1c008a72 <rt_user_free+0x38>
1c008a48:	00c586b3          	add	a3,a1,a2
1c008a4c:	02d79663          	bne	a5,a3,1c008a78 <rt_user_free+0x3e>
1c008a50:	4394                	lw	a3,0(a5)
1c008a52:	43dc                	lw	a5,4(a5)
1c008a54:	9636                	add	a2,a2,a3
1c008a56:	c190                	sw	a2,0(a1)
1c008a58:	c1dc                	sw	a5,4(a1)
1c008a5a:	c31d                	beqz	a4,1c008a80 <rt_user_free+0x46>
1c008a5c:	4314                	lw	a3,0(a4)
1c008a5e:	00d707b3          	add	a5,a4,a3
1c008a62:	00f59d63          	bne	a1,a5,1c008a7c <rt_user_free+0x42>
1c008a66:	419c                	lw	a5,0(a1)
1c008a68:	97b6                	add	a5,a5,a3
1c008a6a:	c31c                	sw	a5,0(a4)
1c008a6c:	41dc                	lw	a5,4(a1)
1c008a6e:	c35c                	sw	a5,4(a4)
1c008a70:	8082                	ret
1c008a72:	873e                	mv	a4,a5
1c008a74:	43dc                	lw	a5,4(a5)
1c008a76:	b7f1                	j	1c008a42 <rt_user_free+0x8>
1c008a78:	c190                	sw	a2,0(a1)
1c008a7a:	bff9                	j	1c008a58 <rt_user_free+0x1e>
1c008a7c:	c34c                	sw	a1,4(a4)
1c008a7e:	8082                	ret
1c008a80:	c10c                	sw	a1,0(a0)
1c008a82:	8082                	ret

1c008a84 <rt_alloc>:
1c008a84:	1101                	addi	sp,sp,-32
1c008a86:	cc22                	sw	s0,24(sp)
1c008a88:	ce06                	sw	ra,28(sp)
1c008a8a:	ca26                	sw	s1,20(sp)
1c008a8c:	c84a                	sw	s2,16(sp)
1c008a8e:	c64e                	sw	s3,12(sp)
1c008a90:	c452                	sw	s4,8(sp)
1c008a92:	4789                	li	a5,2
1c008a94:	842a                	mv	s0,a0
1c008a96:	02a7ed63          	bltu	a5,a0,1c008ad0 <rt_alloc+0x4c>
1c008a9a:	1c002937          	lui	s2,0x1c002
1c008a9e:	89ae                	mv	s3,a1
1c008aa0:	448d                	li	s1,3
1c008aa2:	90890913          	addi	s2,s2,-1784 # 1c001908 <__rt_alloc_l2>
1c008aa6:	4a0d                	li	s4,3
1c008aa8:	00241513          	slli	a0,s0,0x2
1c008aac:	85ce                	mv	a1,s3
1c008aae:	954a                	add	a0,a0,s2
1c008ab0:	3fa9                	jal	1c008a0a <rt_user_alloc>
1c008ab2:	e519                	bnez	a0,1c008ac0 <rt_alloc+0x3c>
1c008ab4:	0405                	addi	s0,s0,1
1c008ab6:	01441363          	bne	s0,s4,1c008abc <rt_alloc+0x38>
1c008aba:	4401                	li	s0,0
1c008abc:	14fd                	addi	s1,s1,-1
1c008abe:	f4ed                	bnez	s1,1c008aa8 <rt_alloc+0x24>
1c008ac0:	40f2                	lw	ra,28(sp)
1c008ac2:	4462                	lw	s0,24(sp)
1c008ac4:	44d2                	lw	s1,20(sp)
1c008ac6:	4942                	lw	s2,16(sp)
1c008ac8:	49b2                	lw	s3,12(sp)
1c008aca:	4a22                	lw	s4,8(sp)
1c008acc:	6105                	addi	sp,sp,32
1c008ace:	8082                	ret
1c008ad0:	1c0027b7          	lui	a5,0x1c002
1c008ad4:	ffd50413          	addi	s0,a0,-3
1c008ad8:	9047a503          	lw	a0,-1788(a5) # 1c001904 <__rt_alloc_l1>
1c008adc:	040a                	slli	s0,s0,0x2
1c008ade:	40f2                	lw	ra,28(sp)
1c008ae0:	9522                	add	a0,a0,s0
1c008ae2:	4462                	lw	s0,24(sp)
1c008ae4:	44d2                	lw	s1,20(sp)
1c008ae6:	4942                	lw	s2,16(sp)
1c008ae8:	49b2                	lw	s3,12(sp)
1c008aea:	4a22                	lw	s4,8(sp)
1c008aec:	6105                	addi	sp,sp,32
1c008aee:	bf31                	j	1c008a0a <rt_user_alloc>

1c008af0 <__rt_alloc_init_l1>:
1c008af0:	1c0027b7          	lui	a5,0x1c002
1c008af4:	9047a703          	lw	a4,-1788(a5) # 1c001904 <__rt_alloc_l1>
1c008af8:	100007b7          	lui	a5,0x10000
1c008afc:	01651593          	slli	a1,a0,0x16
1c008b00:	6641                	lui	a2,0x10
1c008b02:	050a                	slli	a0,a0,0x2
1c008b04:	02078793          	addi	a5,a5,32 # 10000020 <__l1_end>
1c008b08:	fe060613          	addi	a2,a2,-32 # ffe0 <__l1_heap_size>
1c008b0c:	95be                	add	a1,a1,a5
1c008b0e:	953a                	add	a0,a0,a4
1c008b10:	bdf9                	j	1c0089ee <rt_user_alloc_init>

1c008b12 <__rt_alloc_init_l1_for_fc>:
1c008b12:	100005b7          	lui	a1,0x10000
1c008b16:	01651793          	slli	a5,a0,0x16
1c008b1a:	02058593          	addi	a1,a1,32 # 10000020 <__l1_end>
1c008b1e:	00b78733          	add	a4,a5,a1
1c008b22:	050a                	slli	a0,a0,0x2
1c008b24:	0791                	addi	a5,a5,4
1c008b26:	6641                	lui	a2,0x10
1c008b28:	1c0026b7          	lui	a3,0x1c002
1c008b2c:	fdc60613          	addi	a2,a2,-36 # ffdc <__rt_hyper_pending_emu_stride+0xfd34>
1c008b30:	95be                	add	a1,a1,a5
1c008b32:	953a                	add	a0,a0,a4
1c008b34:	90e6a223          	sw	a4,-1788(a3) # 1c001904 <__rt_alloc_l1>
1c008b38:	bd5d                	j	1c0089ee <rt_user_alloc_init>

1c008b3a <__rt_allocs_init>:
1c008b3a:	1141                	addi	sp,sp,-16
1c008b3c:	1c0025b7          	lui	a1,0x1c002
1c008b40:	c606                	sw	ra,12(sp)
1c008b42:	95458793          	addi	a5,a1,-1708 # 1c001954 <__l2_priv0_end>
1c008b46:	1c008637          	lui	a2,0x1c008
1c008b4a:	06c7ca63          	blt	a5,a2,1c008bbe <__rt_allocs_init+0x84>
1c008b4e:	4581                	li	a1,0
1c008b50:	4601                	li	a2,0
1c008b52:	1c002537          	lui	a0,0x1c002
1c008b56:	90850513          	addi	a0,a0,-1784 # 1c001908 <__rt_alloc_l2>
1c008b5a:	3d51                	jal	1c0089ee <rt_user_alloc_init>
1c008b5c:	1c00b5b7          	lui	a1,0x1c00b
1c008b60:	49058793          	addi	a5,a1,1168 # 1c00b490 <__l2_priv1_end>
1c008b64:	1c010637          	lui	a2,0x1c010
1c008b68:	04c7cf63          	blt	a5,a2,1c008bc6 <__rt_allocs_init+0x8c>
1c008b6c:	4581                	li	a1,0
1c008b6e:	4601                	li	a2,0
1c008b70:	1c002537          	lui	a0,0x1c002
1c008b74:	90c50513          	addi	a0,a0,-1780 # 1c00190c <__rt_alloc_l2+0x4>
1c008b78:	3d9d                	jal	1c0089ee <rt_user_alloc_init>
1c008b7a:	1c0115b7          	lui	a1,0x1c011
1c008b7e:	1a458793          	addi	a5,a1,420 # 1c0111a4 <__l2_shared_end>
1c008b82:	1c080637          	lui	a2,0x1c080
1c008b86:	1c002537          	lui	a0,0x1c002
1c008b8a:	8e1d                	sub	a2,a2,a5
1c008b8c:	1a458593          	addi	a1,a1,420
1c008b90:	91050513          	addi	a0,a0,-1776 # 1c001910 <__rt_alloc_l2+0x8>
1c008b94:	3da9                	jal	1c0089ee <rt_user_alloc_init>
1c008b96:	f14027f3          	csrr	a5,mhartid
1c008b9a:	8795                	srai	a5,a5,0x5
1c008b9c:	03f7f793          	andi	a5,a5,63
1c008ba0:	e789                	bnez	a5,1c008baa <__rt_allocs_init+0x70>
1c008ba2:	40b2                	lw	ra,12(sp)
1c008ba4:	4501                	li	a0,0
1c008ba6:	0141                	addi	sp,sp,16
1c008ba8:	b7ad                	j	1c008b12 <__rt_alloc_init_l1_for_fc>
1c008baa:	4591                	li	a1,4
1c008bac:	4501                	li	a0,0
1c008bae:	3dd9                	jal	1c008a84 <rt_alloc>
1c008bb0:	40b2                	lw	ra,12(sp)
1c008bb2:	1c0027b7          	lui	a5,0x1c002
1c008bb6:	90a7a223          	sw	a0,-1788(a5) # 1c001904 <__rt_alloc_l1>
1c008bba:	0141                	addi	sp,sp,16
1c008bbc:	8082                	ret
1c008bbe:	8e1d                	sub	a2,a2,a5
1c008bc0:	95458593          	addi	a1,a1,-1708
1c008bc4:	b779                	j	1c008b52 <__rt_allocs_init+0x18>
1c008bc6:	8e1d                	sub	a2,a2,a5
1c008bc8:	49058593          	addi	a1,a1,1168
1c008bcc:	b755                	j	1c008b70 <__rt_allocs_init+0x36>

1c008bce <__rt_init_cluster_data>:
1c008bce:	04050793          	addi	a5,a0,64
1c008bd2:	01679693          	slli	a3,a5,0x16
1c008bd6:	6705                	lui	a4,0x1
1c008bd8:	177d                	addi	a4,a4,-1
1c008bda:	00400793          	li	a5,4
1c008bde:	8ff9                	and	a5,a5,a4
1c008be0:	1c011737          	lui	a4,0x1c011
1c008be4:	97b6                	add	a5,a5,a3
1c008be6:	18870713          	addi	a4,a4,392 # 1c011188 <_l1_preload_start_inL2>
1c008bea:	01c00613          	li	a2,28
1c008bee:	8f99                	sub	a5,a5,a4
1c008bf0:	00f705b3          	add	a1,a4,a5
1c008bf4:	02c04b63          	bgtz	a2,1c008c2a <__rt_init_cluster_data+0x5c>
1c008bf8:	02800713          	li	a4,40
1c008bfc:	02e50733          	mul	a4,a0,a4
1c008c00:	1c0027b7          	lui	a5,0x1c002
1c008c04:	91878513          	addi	a0,a5,-1768 # 1c001918 <__rt_fc_cluster_data>
1c008c08:	002017b7          	lui	a5,0x201
1c008c0c:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c008c10:	97b6                	add	a5,a5,a3
1c008c12:	953a                	add	a0,a0,a4
1c008c14:	c91c                	sw	a5,16(a0)
1c008c16:	6705                	lui	a4,0x1
1c008c18:	00400793          	li	a5,4
1c008c1c:	177d                	addi	a4,a4,-1
1c008c1e:	8ff9                	and	a5,a5,a4
1c008c20:	97b6                	add	a5,a5,a3
1c008c22:	00052423          	sw	zero,8(a0)
1c008c26:	c95c                	sw	a5,20(a0)
1c008c28:	8082                	ret
1c008c2a:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008c2e:	1671                	addi	a2,a2,-4
1c008c30:	0711                	addi	a4,a4,4
1c008c32:	0105a023          	sw	a6,0(a1)
1c008c36:	bf6d                	j	1c008bf0 <__rt_init_cluster_data+0x22>

1c008c38 <__rt_cluster_mount_step>:
1c008c38:	7179                	addi	sp,sp,-48
1c008c3a:	d04a                	sw	s2,32(sp)
1c008c3c:	ce4e                	sw	s3,28(sp)
1c008c3e:	6785                	lui	a5,0x1
1c008c40:	1c0089b7          	lui	s3,0x1c008
1c008c44:	00400913          	li	s2,4
1c008c48:	17fd                	addi	a5,a5,-1
1c008c4a:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008c4e:	d422                	sw	s0,40(sp)
1c008c50:	d606                	sw	ra,44(sp)
1c008c52:	d226                	sw	s1,36(sp)
1c008c54:	cc52                	sw	s4,24(sp)
1c008c56:	842a                	mv	s0,a0
1c008c58:	00f97933          	and	s2,s2,a5
1c008c5c:	f009f993          	andi	s3,s3,-256
1c008c60:	4c5c                	lw	a5,28(s0)
1c008c62:	4705                	li	a4,1
1c008c64:	02e78d63          	beq	a5,a4,1c008c9e <__rt_cluster_mount_step+0x66>
1c008c68:	4709                	li	a4,2
1c008c6a:	0ae78d63          	beq	a5,a4,1c008d24 <__rt_cluster_mount_step+0xec>
1c008c6e:	e7dd                	bnez	a5,1c008d1c <__rt_cluster_mount_step+0xe4>
1c008c70:	5018                	lw	a4,32(s0)
1c008c72:	00042c23          	sw	zero,24(s0)
1c008c76:	eb01                	bnez	a4,1c008c86 <__rt_cluster_mount_step+0x4e>
1c008c78:	5048                	lw	a0,36(s0)
1c008c7a:	006c                	addi	a1,sp,12
1c008c7c:	c602                	sw	zero,12(sp)
1c008c7e:	1e8010ef          	jal	ra,1c009e66 <__rt_pmu_cluster_power_up>
1c008c82:	47b2                	lw	a5,12(sp)
1c008c84:	cc08                	sw	a0,24(s0)
1c008c86:	4c58                	lw	a4,28(s0)
1c008c88:	0705                	addi	a4,a4,1
1c008c8a:	cc58                	sw	a4,28(s0)
1c008c8c:	dbf1                	beqz	a5,1c008c60 <__rt_cluster_mount_step+0x28>
1c008c8e:	50b2                	lw	ra,44(sp)
1c008c90:	5422                	lw	s0,40(sp)
1c008c92:	5492                	lw	s1,36(sp)
1c008c94:	5902                	lw	s2,32(sp)
1c008c96:	49f2                	lw	s3,28(sp)
1c008c98:	4a62                	lw	s4,24(sp)
1c008c9a:	6145                	addi	sp,sp,48
1c008c9c:	8082                	ret
1c008c9e:	02042a03          	lw	s4,32(s0)
1c008ca2:	040a0493          	addi	s1,s4,64
1c008ca6:	04da                	slli	s1,s1,0x16
1c008ca8:	00990733          	add	a4,s2,s1
1c008cac:	00072223          	sw	zero,4(a4)
1c008cb0:	00072423          	sw	zero,8(a4)
1c008cb4:	00072023          	sw	zero,0(a4)
1c008cb8:	1c001737          	lui	a4,0x1c001
1c008cbc:	7ec72703          	lw	a4,2028(a4) # 1c0017ec <__rt_platform>
1c008cc0:	00f70f63          	beq	a4,a5,1c008cde <__rt_cluster_mount_step+0xa6>
1c008cc4:	4505                	li	a0,1
1c008cc6:	727000ef          	jal	ra,1c009bec <__rt_fll_init>
1c008cca:	1c0027b7          	lui	a5,0x1c002
1c008cce:	94878793          	addi	a5,a5,-1720 # 1c001948 <__rt_freq_domains>
1c008cd2:	43cc                	lw	a1,4(a5)
1c008cd4:	c5b1                	beqz	a1,1c008d20 <__rt_cluster_mount_step+0xe8>
1c008cd6:	4601                	li	a2,0
1c008cd8:	4505                	li	a0,1
1c008cda:	0a8010ef          	jal	ra,1c009d82 <rt_freq_set_and_get>
1c008cde:	8552                	mv	a0,s4
1c008ce0:	35fd                	jal	1c008bce <__rt_init_cluster_data>
1c008ce2:	8552                	mv	a0,s4
1c008ce4:	3531                	jal	1c008af0 <__rt_alloc_init_l1>
1c008ce6:	002017b7          	lui	a5,0x201
1c008cea:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1420>
1c008cee:	97a6                	add	a5,a5,s1
1c008cf0:	577d                	li	a4,-1
1c008cf2:	c398                	sw	a4,0(a5)
1c008cf4:	002007b7          	lui	a5,0x200
1c008cf8:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f0060>
1c008cfc:	06078793          	addi	a5,a5,96
1c008d00:	9726                	add	a4,a4,s1
1c008d02:	97a6                	add	a5,a5,s1
1c008d04:	01372023          	sw	s3,0(a4)
1c008d08:	0711                	addi	a4,a4,4
1c008d0a:	fef71de3          	bne	a4,a5,1c008d04 <__rt_cluster_mount_step+0xcc>
1c008d0e:	002007b7          	lui	a5,0x200
1c008d12:	07a1                	addi	a5,a5,8
1c008d14:	94be                	add	s1,s1,a5
1c008d16:	0ff00793          	li	a5,255
1c008d1a:	c09c                	sw	a5,0(s1)
1c008d1c:	4781                	li	a5,0
1c008d1e:	b7a5                	j	1c008c86 <__rt_cluster_mount_step+0x4e>
1c008d20:	c3c8                	sw	a0,4(a5)
1c008d22:	bf75                	j	1c008cde <__rt_cluster_mount_step+0xa6>
1c008d24:	505c                	lw	a5,36(s0)
1c008d26:	5b98                	lw	a4,48(a5)
1c008d28:	d398                	sw	a4,32(a5)
1c008d2a:	5798                	lw	a4,40(a5)
1c008d2c:	c398                	sw	a4,0(a5)
1c008d2e:	57d8                	lw	a4,44(a5)
1c008d30:	c3d8                	sw	a4,4(a5)
1c008d32:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f0050>
1c008d36:	505c                	lw	a5,36(s0)
1c008d38:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008d3c:	0007ac23          	sw	zero,24(a5)
1c008d40:	cb01                	beqz	a4,1c008d50 <__rt_cluster_mount_step+0x118>
1c008d42:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008d46:	cf1c                	sw	a5,24(a4)
1c008d48:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008d4c:	4785                	li	a5,1
1c008d4e:	bf25                	j	1c008c86 <__rt_cluster_mount_step+0x4e>
1c008d50:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008d54:	bfd5                	j	1c008d48 <__rt_cluster_mount_step+0x110>

1c008d56 <__rt_cluster_init>:
1c008d56:	1c002537          	lui	a0,0x1c002
1c008d5a:	1141                	addi	sp,sp,-16
1c008d5c:	02800613          	li	a2,40
1c008d60:	4581                	li	a1,0
1c008d62:	91850513          	addi	a0,a0,-1768 # 1c001918 <__rt_fc_cluster_data>
1c008d66:	c606                	sw	ra,12(sp)
1c008d68:	073010ef          	jal	ra,1c00a5da <memset>
1c008d6c:	1c0085b7          	lui	a1,0x1c008
1c008d70:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008d74:	4505                	li	a0,1
1c008d76:	2bfd                	jal	1c009374 <rt_irq_set_handler>
1c008d78:	f14027f3          	csrr	a5,mhartid
1c008d7c:	8795                	srai	a5,a5,0x5
1c008d7e:	03f7f793          	andi	a5,a5,63
1c008d82:	477d                	li	a4,31
1c008d84:	02e79e63          	bne	a5,a4,1c008dc0 <__rt_cluster_init+0x6a>
1c008d88:	1a10a7b7          	lui	a5,0x1a10a
1c008d8c:	4709                	li	a4,2
1c008d8e:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c008d92:	1c0085b7          	lui	a1,0x1c008
1c008d96:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008d9a:	4511                	li	a0,4
1c008d9c:	2be1                	jal	1c009374 <rt_irq_set_handler>
1c008d9e:	f14027f3          	csrr	a5,mhartid
1c008da2:	8795                	srai	a5,a5,0x5
1c008da4:	03f7f793          	andi	a5,a5,63
1c008da8:	477d                	li	a4,31
1c008daa:	02e79063          	bne	a5,a4,1c008dca <__rt_cluster_init+0x74>
1c008dae:	1a10a7b7          	lui	a5,0x1a10a
1c008db2:	4741                	li	a4,16
1c008db4:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c008db8:	40b2                	lw	ra,12(sp)
1c008dba:	4501                	li	a0,0
1c008dbc:	0141                	addi	sp,sp,16
1c008dbe:	8082                	ret
1c008dc0:	002047b7          	lui	a5,0x204
1c008dc4:	4709                	li	a4,2
1c008dc6:	cbd8                	sw	a4,20(a5)
1c008dc8:	b7e9                	j	1c008d92 <__rt_cluster_init+0x3c>
1c008dca:	002047b7          	lui	a5,0x204
1c008dce:	4741                	li	a4,16
1c008dd0:	cbd8                	sw	a4,20(a5)
1c008dd2:	b7dd                	j	1c008db8 <__rt_cluster_init+0x62>

1c008dd4 <pi_cluster_conf_init>:
1c008dd4:	00052223          	sw	zero,4(a0)
1c008dd8:	8082                	ret

1c008dda <pi_cluster_open>:
1c008dda:	1101                	addi	sp,sp,-32
1c008ddc:	ce06                	sw	ra,28(sp)
1c008dde:	cc22                	sw	s0,24(sp)
1c008de0:	ca26                	sw	s1,20(sp)
1c008de2:	c84a                	sw	s2,16(sp)
1c008de4:	c64e                	sw	s3,12(sp)
1c008de6:	30047973          	csrrci	s2,mstatus,8
1c008dea:	00452983          	lw	s3,4(a0)
1c008dee:	02800793          	li	a5,40
1c008df2:	0049a483          	lw	s1,4(s3)
1c008df6:	02f484b3          	mul	s1,s1,a5
1c008dfa:	1c0027b7          	lui	a5,0x1c002
1c008dfe:	91878793          	addi	a5,a5,-1768 # 1c001918 <__rt_fc_cluster_data>
1c008e02:	94be                	add	s1,s1,a5
1c008e04:	c504                	sw	s1,8(a0)
1c008e06:	3b7000ef          	jal	ra,1c0099bc <__rt_wait_event_prepare_blocking>
1c008e0a:	f14027f3          	csrr	a5,mhartid
1c008e0e:	8795                	srai	a5,a5,0x5
1c008e10:	03f7f793          	andi	a5,a5,63
1c008e14:	477d                	li	a4,31
1c008e16:	842a                	mv	s0,a0
1c008e18:	04e79463          	bne	a5,a4,1c008e60 <pi_cluster_open+0x86>
1c008e1c:	511c                	lw	a5,32(a0)
1c008e1e:	0004ae23          	sw	zero,28(s1)
1c008e22:	d0c8                	sw	a0,36(s1)
1c008e24:	d91c                	sw	a5,48(a0)
1c008e26:	411c                	lw	a5,0(a0)
1c008e28:	02052223          	sw	zero,36(a0)
1c008e2c:	d51c                	sw	a5,40(a0)
1c008e2e:	415c                	lw	a5,4(a0)
1c008e30:	c144                	sw	s1,4(a0)
1c008e32:	d55c                	sw	a5,44(a0)
1c008e34:	1c0097b7          	lui	a5,0x1c009
1c008e38:	c3878793          	addi	a5,a5,-968 # 1c008c38 <__rt_cluster_mount_step>
1c008e3c:	c11c                	sw	a5,0(a0)
1c008e3e:	4785                	li	a5,1
1c008e40:	d11c                	sw	a5,32(a0)
1c008e42:	8526                	mv	a0,s1
1c008e44:	3bd5                	jal	1c008c38 <__rt_cluster_mount_step>
1c008e46:	8522                	mv	a0,s0
1c008e48:	4c5000ef          	jal	ra,1c009b0c <__rt_wait_event>
1c008e4c:	30091073          	csrw	mstatus,s2
1c008e50:	40f2                	lw	ra,28(sp)
1c008e52:	4462                	lw	s0,24(sp)
1c008e54:	44d2                	lw	s1,20(sp)
1c008e56:	4942                	lw	s2,16(sp)
1c008e58:	49b2                	lw	s3,12(sp)
1c008e5a:	4501                	li	a0,0
1c008e5c:	6105                	addi	sp,sp,32
1c008e5e:	8082                	ret
1c008e60:	0049a483          	lw	s1,4(s3)
1c008e64:	8526                	mv	a0,s1
1c008e66:	33a5                	jal	1c008bce <__rt_init_cluster_data>
1c008e68:	04048513          	addi	a0,s1,64
1c008e6c:	002017b7          	lui	a5,0x201
1c008e70:	055a                	slli	a0,a0,0x16
1c008e72:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1420>
1c008e76:	97aa                	add	a5,a5,a0
1c008e78:	577d                	li	a4,-1
1c008e7a:	c398                	sw	a4,0(a5)
1c008e7c:	1c0086b7          	lui	a3,0x1c008
1c008e80:	002007b7          	lui	a5,0x200
1c008e84:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f0064>
1c008e88:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c008e8c:	06078793          	addi	a5,a5,96
1c008e90:	972a                	add	a4,a4,a0
1c008e92:	97aa                	add	a5,a5,a0
1c008e94:	f006f693          	andi	a3,a3,-256
1c008e98:	c314                	sw	a3,0(a4)
1c008e9a:	0711                	addi	a4,a4,4
1c008e9c:	fef71ee3          	bne	a4,a5,1c008e98 <pi_cluster_open+0xbe>
1c008ea0:	002007b7          	lui	a5,0x200
1c008ea4:	07a1                	addi	a5,a5,8
1c008ea6:	953e                	add	a0,a0,a5
1c008ea8:	57fd                	li	a5,-1
1c008eaa:	c11c                	sw	a5,0(a0)
1c008eac:	8522                	mv	a0,s0
1c008eae:	3db000ef          	jal	ra,1c009a88 <rt_event_push>
1c008eb2:	bf51                	j	1c008e46 <pi_cluster_open+0x6c>

1c008eb4 <pi_cluster_close>:
1c008eb4:	451c                	lw	a5,8(a0)
1c008eb6:	1101                	addi	sp,sp,-32
1c008eb8:	cc22                	sw	s0,24(sp)
1c008eba:	5380                	lw	s0,32(a5)
1c008ebc:	1c0017b7          	lui	a5,0x1c001
1c008ec0:	7ec7a703          	lw	a4,2028(a5) # 1c0017ec <__rt_platform>
1c008ec4:	ce06                	sw	ra,28(sp)
1c008ec6:	4785                	li	a5,1
1c008ec8:	00f70563          	beq	a4,a5,1c008ed2 <pi_cluster_close+0x1e>
1c008ecc:	4505                	li	a0,1
1c008ece:	5d5000ef          	jal	ra,1c009ca2 <__rt_fll_deinit>
1c008ed2:	c602                	sw	zero,12(sp)
1c008ed4:	e409                	bnez	s0,1c008ede <pi_cluster_close+0x2a>
1c008ed6:	006c                	addi	a1,sp,12
1c008ed8:	4501                	li	a0,0
1c008eda:	749000ef          	jal	ra,1c009e22 <__rt_pmu_cluster_power_down>
1c008ede:	40f2                	lw	ra,28(sp)
1c008ee0:	4462                	lw	s0,24(sp)
1c008ee2:	4501                	li	a0,0
1c008ee4:	6105                	addi	sp,sp,32
1c008ee6:	8082                	ret

1c008ee8 <__rt_cluster_push_fc_event>:
1c008ee8:	002047b7          	lui	a5,0x204
1c008eec:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f40e0>
1c008ef0:	0007e703          	p.elw	a4,0(a5)
1c008ef4:	f14027f3          	csrr	a5,mhartid
1c008ef8:	8795                	srai	a5,a5,0x5
1c008efa:	02800693          	li	a3,40
1c008efe:	03f7f793          	andi	a5,a5,63
1c008f02:	02d787b3          	mul	a5,a5,a3
1c008f06:	1c002737          	lui	a4,0x1c002
1c008f0a:	91870713          	addi	a4,a4,-1768 # 1c001918 <__rt_fc_cluster_data>
1c008f0e:	4689                	li	a3,2
1c008f10:	97ba                	add	a5,a5,a4
1c008f12:	00204737          	lui	a4,0x204
1c008f16:	43d0                	lw	a2,4(a5)
1c008f18:	ee01                	bnez	a2,1c008f30 <__rt_cluster_push_fc_event+0x48>
1c008f1a:	c3c8                	sw	a0,4(a5)
1c008f1c:	4709                	li	a4,2
1c008f1e:	1a10a7b7          	lui	a5,0x1a10a
1c008f22:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1097f0>
1c008f26:	002047b7          	lui	a5,0x204
1c008f2a:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f40e0>
1c008f2e:	8082                	ret
1c008f30:	c714                	sw	a3,8(a4)
1c008f32:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c008f36:	c354                	sw	a3,4(a4)
1c008f38:	bff9                	j	1c008f16 <__rt_cluster_push_fc_event+0x2e>

1c008f3a <__rt_cluster_new>:
1c008f3a:	1c0095b7          	lui	a1,0x1c009
1c008f3e:	1141                	addi	sp,sp,-16
1c008f40:	4601                	li	a2,0
1c008f42:	d5658593          	addi	a1,a1,-682 # 1c008d56 <__rt_cluster_init>
1c008f46:	4501                	li	a0,0
1c008f48:	c606                	sw	ra,12(sp)
1c008f4a:	2b6d                	jal	1c009504 <__rt_cbsys_add>
1c008f4c:	c105                	beqz	a0,1c008f6c <__rt_cluster_new+0x32>
1c008f4e:	f1402673          	csrr	a2,mhartid
1c008f52:	1c000537          	lui	a0,0x1c000
1c008f56:	40565593          	srai	a1,a2,0x5
1c008f5a:	03f5f593          	andi	a1,a1,63
1c008f5e:	8a7d                	andi	a2,a2,31
1c008f60:	46850513          	addi	a0,a0,1128 # 1c000468 <__DTOR_END__+0x17c>
1c008f64:	0c3010ef          	jal	ra,1c00a826 <printf>
1c008f68:	04b010ef          	jal	ra,1c00a7b2 <abort>
1c008f6c:	40b2                	lw	ra,12(sp)
1c008f6e:	0141                	addi	sp,sp,16
1c008f70:	8082                	ret

1c008f72 <__rt_cluster_pulpos_emu_init>:
1c008f72:	1141                	addi	sp,sp,-16
1c008f74:	45b1                	li	a1,12
1c008f76:	4501                	li	a0,0
1c008f78:	c606                	sw	ra,12(sp)
1c008f7a:	3629                	jal	1c008a84 <rt_alloc>
1c008f7c:	1c0027b7          	lui	a5,0x1c002
1c008f80:	8ca7ac23          	sw	a0,-1832(a5) # 1c0018d8 <__rt_fc_cluster_device>
1c008f84:	e105                	bnez	a0,1c008fa4 <__rt_cluster_pulpos_emu_init+0x32>
1c008f86:	f1402673          	csrr	a2,mhartid
1c008f8a:	1c000537          	lui	a0,0x1c000
1c008f8e:	40565593          	srai	a1,a2,0x5
1c008f92:	03f5f593          	andi	a1,a1,63
1c008f96:	8a7d                	andi	a2,a2,31
1c008f98:	4b050513          	addi	a0,a0,1200 # 1c0004b0 <__DTOR_END__+0x1c4>
1c008f9c:	08b010ef          	jal	ra,1c00a826 <printf>
1c008fa0:	013010ef          	jal	ra,1c00a7b2 <abort>
1c008fa4:	40b2                	lw	ra,12(sp)
1c008fa6:	0141                	addi	sp,sp,16
1c008fa8:	8082                	ret

1c008faa <rt_cluster_call>:
1c008faa:	7139                	addi	sp,sp,-64
1c008fac:	d84a                	sw	s2,48(sp)
1c008fae:	4906                	lw	s2,64(sp)
1c008fb0:	dc22                	sw	s0,56(sp)
1c008fb2:	842e                	mv	s0,a1
1c008fb4:	de06                	sw	ra,60(sp)
1c008fb6:	da26                	sw	s1,52(sp)
1c008fb8:	d64e                	sw	s3,44(sp)
1c008fba:	300479f3          	csrrci	s3,mstatus,8
1c008fbe:	84ca                	mv	s1,s2
1c008fc0:	02091163          	bnez	s2,1c008fe2 <rt_cluster_call+0x38>
1c008fc4:	ce32                	sw	a2,28(sp)
1c008fc6:	cc36                	sw	a3,24(sp)
1c008fc8:	ca3a                	sw	a4,20(sp)
1c008fca:	c83e                	sw	a5,16(sp)
1c008fcc:	c642                	sw	a6,12(sp)
1c008fce:	c446                	sw	a7,8(sp)
1c008fd0:	1ed000ef          	jal	ra,1c0099bc <__rt_wait_event_prepare_blocking>
1c008fd4:	48a2                	lw	a7,8(sp)
1c008fd6:	4832                	lw	a6,12(sp)
1c008fd8:	47c2                	lw	a5,16(sp)
1c008fda:	4752                	lw	a4,20(sp)
1c008fdc:	46e2                	lw	a3,24(sp)
1c008fde:	4672                	lw	a2,28(sp)
1c008fe0:	84aa                	mv	s1,a0
1c008fe2:	4531                	li	a0,12
1c008fe4:	02a40433          	mul	s0,s0,a0
1c008fe8:	1c0025b7          	lui	a1,0x1c002
1c008fec:	81058313          	addi	t1,a1,-2032 # 1c001810 <__rt_pulpos_emu_global_cluster_task>
1c008ff0:	00f32623          	sw	a5,12(t1)
1c008ff4:	1c0027b7          	lui	a5,0x1c002
1c008ff8:	8d87a503          	lw	a0,-1832(a5) # 1c0018d8 <__rt_fc_cluster_device>
1c008ffc:	00c32023          	sw	a2,0(t1)
1c009000:	81058593          	addi	a1,a1,-2032
1c009004:	8626                	mv	a2,s1
1c009006:	00d32223          	sw	a3,4(t1)
1c00900a:	9522                	add	a0,a0,s0
1c00900c:	00e32423          	sw	a4,8(t1)
1c009010:	01032823          	sw	a6,16(t1)
1c009014:	01132a23          	sw	a7,20(t1)
1c009018:	2041                	jal	1c009098 <pi_cluster_send_task_to_cl_async>
1c00901a:	842a                	mv	s0,a0
1c00901c:	cd01                	beqz	a0,1c009034 <rt_cluster_call+0x8a>
1c00901e:	30099073          	csrw	mstatus,s3
1c009022:	547d                	li	s0,-1
1c009024:	8522                	mv	a0,s0
1c009026:	50f2                	lw	ra,60(sp)
1c009028:	5462                	lw	s0,56(sp)
1c00902a:	54d2                	lw	s1,52(sp)
1c00902c:	5942                	lw	s2,48(sp)
1c00902e:	59b2                	lw	s3,44(sp)
1c009030:	6121                	addi	sp,sp,64
1c009032:	8082                	ret
1c009034:	00091563          	bnez	s2,1c00903e <rt_cluster_call+0x94>
1c009038:	8526                	mv	a0,s1
1c00903a:	2d3000ef          	jal	ra,1c009b0c <__rt_wait_event>
1c00903e:	30099073          	csrw	mstatus,s3
1c009042:	b7cd                	j	1c009024 <rt_cluster_call+0x7a>

1c009044 <rt_cluster_mount>:
1c009044:	7139                	addi	sp,sp,-64
1c009046:	dc22                	sw	s0,56(sp)
1c009048:	da26                	sw	s1,52(sp)
1c00904a:	d84a                	sw	s2,48(sp)
1c00904c:	4431                	li	s0,12
1c00904e:	1c0024b7          	lui	s1,0x1c002
1c009052:	de06                	sw	ra,60(sp)
1c009054:	d64e                	sw	s3,44(sp)
1c009056:	8936                	mv	s2,a3
1c009058:	02858433          	mul	s0,a1,s0
1c00905c:	8d848493          	addi	s1,s1,-1832 # 1c0018d8 <__rt_fc_cluster_device>
1c009060:	c905                	beqz	a0,1c009090 <rt_cluster_mount+0x4c>
1c009062:	0068                	addi	a0,sp,12
1c009064:	89ae                	mv	s3,a1
1c009066:	33bd                	jal	1c008dd4 <pi_cluster_conf_init>
1c009068:	4088                	lw	a0,0(s1)
1c00906a:	006c                	addi	a1,sp,12
1c00906c:	9522                	add	a0,a0,s0
1c00906e:	2609                	jal	1c009370 <pi_open_from_conf>
1c009070:	4088                	lw	a0,0(s1)
1c009072:	c84e                	sw	s3,16(sp)
1c009074:	9522                	add	a0,a0,s0
1c009076:	3395                	jal	1c008dda <pi_cluster_open>
1c009078:	00090563          	beqz	s2,1c009082 <rt_cluster_mount+0x3e>
1c00907c:	854a                	mv	a0,s2
1c00907e:	20b000ef          	jal	ra,1c009a88 <rt_event_push>
1c009082:	50f2                	lw	ra,60(sp)
1c009084:	5462                	lw	s0,56(sp)
1c009086:	54d2                	lw	s1,52(sp)
1c009088:	5942                	lw	s2,48(sp)
1c00908a:	59b2                	lw	s3,44(sp)
1c00908c:	6121                	addi	sp,sp,64
1c00908e:	8082                	ret
1c009090:	4088                	lw	a0,0(s1)
1c009092:	9522                	add	a0,a0,s0
1c009094:	3505                	jal	1c008eb4 <pi_cluster_close>
1c009096:	b7cd                	j	1c009078 <rt_cluster_mount+0x34>

1c009098 <pi_cluster_send_task_to_cl_async>:
1c009098:	1101                	addi	sp,sp,-32
1c00909a:	ca26                	sw	s1,20(sp)
1c00909c:	4504                	lw	s1,8(a0)
1c00909e:	cc22                	sw	s0,24(sp)
1c0090a0:	c256                	sw	s5,4(sp)
1c0090a2:	842e                	mv	s0,a1
1c0090a4:	8ab2                	mv	s5,a2
1c0090a6:	ce06                	sw	ra,28(sp)
1c0090a8:	c84a                	sw	s2,16(sp)
1c0090aa:	c64e                	sw	s3,12(sp)
1c0090ac:	c452                	sw	s4,8(sp)
1c0090ae:	30047a73          	csrrci	s4,mstatus,8
1c0090b2:	00060823          	sb	zero,16(a2) # 1c080010 <__l2_shared_end+0x6ee6c>
1c0090b6:	4785                	li	a5,1
1c0090b8:	d1dc                	sw	a5,36(a1)
1c0090ba:	49dc                	lw	a5,20(a1)
1c0090bc:	0144a983          	lw	s3,20(s1)
1c0090c0:	e399                	bnez	a5,1c0090c6 <pi_cluster_send_task_to_cl_async+0x2e>
1c0090c2:	47a1                	li	a5,8
1c0090c4:	c9dc                	sw	a5,20(a1)
1c0090c6:	441c                	lw	a5,8(s0)
1c0090c8:	eb8d                	bnez	a5,1c0090fa <pi_cluster_send_task_to_cl_async+0x62>
1c0090ca:	445c                	lw	a5,12(s0)
1c0090cc:	e789                	bnez	a5,1c0090d6 <pi_cluster_send_task_to_cl_async+0x3e>
1c0090ce:	40000793          	li	a5,1024
1c0090d2:	c45c                	sw	a5,12(s0)
1c0090d4:	c81c                	sw	a5,16(s0)
1c0090d6:	4818                	lw	a4,16(s0)
1c0090d8:	445c                	lw	a5,12(s0)
1c0090da:	e311                	bnez	a4,1c0090de <pi_cluster_send_task_to_cl_async+0x46>
1c0090dc:	c81c                	sw	a5,16(s0)
1c0090de:	01442903          	lw	s2,20(s0)
1c0090e2:	4818                	lw	a4,16(s0)
1c0090e4:	448c                	lw	a1,8(s1)
1c0090e6:	197d                	addi	s2,s2,-1
1c0090e8:	02e90933          	mul	s2,s2,a4
1c0090ec:	993e                	add	s2,s2,a5
1c0090ee:	c9bd                	beqz	a1,1c009164 <pi_cluster_send_task_to_cl_async+0xcc>
1c0090f0:	44d0                	lw	a2,12(s1)
1c0090f2:	07261063          	bne	a2,s2,1c009152 <pi_cluster_send_task_to_cl_async+0xba>
1c0090f6:	449c                	lw	a5,8(s1)
1c0090f8:	c41c                	sw	a5,8(s0)
1c0090fa:	4858                	lw	a4,20(s0)
1c0090fc:	4785                	li	a5,1
1c0090fe:	01542c23          	sw	s5,24(s0)
1c009102:	00e797b3          	sll	a5,a5,a4
1c009106:	17fd                	addi	a5,a5,-1
1c009108:	d41c                	sw	a5,40(s0)
1c00910a:	02042023          	sw	zero,32(s0)
1c00910e:	0089a783          	lw	a5,8(s3)
1c009112:	cbbd                	beqz	a5,1c009188 <pi_cluster_send_task_to_cl_async+0xf0>
1c009114:	d380                	sw	s0,32(a5)
1c009116:	0089a423          	sw	s0,8(s3)
1c00911a:	0009a783          	lw	a5,0(s3)
1c00911e:	e399                	bnez	a5,1c009124 <pi_cluster_send_task_to_cl_async+0x8c>
1c009120:	0089a023          	sw	s0,0(s3)
1c009124:	509c                	lw	a5,32(s1)
1c009126:	00201737          	lui	a4,0x201
1c00912a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c00912e:	04078793          	addi	a5,a5,64
1c009132:	07da                	slli	a5,a5,0x16
1c009134:	97ba                	add	a5,a5,a4
1c009136:	0007a023          	sw	zero,0(a5)
1c00913a:	300a1073          	csrw	mstatus,s4
1c00913e:	4501                	li	a0,0
1c009140:	40f2                	lw	ra,28(sp)
1c009142:	4462                	lw	s0,24(sp)
1c009144:	44d2                	lw	s1,20(sp)
1c009146:	4942                	lw	s2,16(sp)
1c009148:	49b2                	lw	s3,12(sp)
1c00914a:	4a22                	lw	s4,8(sp)
1c00914c:	4a92                	lw	s5,4(sp)
1c00914e:	6105                	addi	sp,sp,32
1c009150:	8082                	ret
1c009152:	509c                	lw	a5,32(s1)
1c009154:	1c002737          	lui	a4,0x1c002
1c009158:	90472503          	lw	a0,-1788(a4) # 1c001904 <__rt_alloc_l1>
1c00915c:	078a                	slli	a5,a5,0x2
1c00915e:	953e                	add	a0,a0,a5
1c009160:	8dbff0ef          	jal	ra,1c008a3a <rt_user_free>
1c009164:	509c                	lw	a5,32(s1)
1c009166:	1c002737          	lui	a4,0x1c002
1c00916a:	90472503          	lw	a0,-1788(a4) # 1c001904 <__rt_alloc_l1>
1c00916e:	078a                	slli	a5,a5,0x2
1c009170:	0124a623          	sw	s2,12(s1)
1c009174:	85ca                	mv	a1,s2
1c009176:	953e                	add	a0,a0,a5
1c009178:	893ff0ef          	jal	ra,1c008a0a <rt_user_alloc>
1c00917c:	c488                	sw	a0,8(s1)
1c00917e:	fd25                	bnez	a0,1c0090f6 <pi_cluster_send_task_to_cl_async+0x5e>
1c009180:	300a1073          	csrw	mstatus,s4
1c009184:	557d                	li	a0,-1
1c009186:	bf6d                	j	1c009140 <pi_cluster_send_task_to_cl_async+0xa8>
1c009188:	0089a223          	sw	s0,4(s3)
1c00918c:	b769                	j	1c009116 <pi_cluster_send_task_to_cl_async+0x7e>

1c00918e <rt_perf_init>:
1c00918e:	00450793          	addi	a5,a0,4
1c009192:	04850513          	addi	a0,a0,72
1c009196:	0007a023          	sw	zero,0(a5)
1c00919a:	0791                	addi	a5,a5,4
1c00919c:	fea79de3          	bne	a5,a0,1c009196 <rt_perf_init+0x8>
1c0091a0:	8082                	ret

1c0091a2 <rt_perf_conf>:
1c0091a2:	c10c                	sw	a1,0(a0)
1c0091a4:	7a059073          	csrw	pcer,a1
1c0091a8:	8082                	ret

1c0091aa <cluster_start>:
1c0091aa:	002047b7          	lui	a5,0x204
1c0091ae:	00070737          	lui	a4,0x70
1c0091b2:	c798                	sw	a4,8(a5)
1c0091b4:	0ff00713          	li	a4,255
1c0091b8:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f40a4>
1c0091bc:	20e7a023          	sw	a4,512(a5)
1c0091c0:	20e7a623          	sw	a4,524(a5)
1c0091c4:	8082                	ret

1c0091c6 <__rt_init>:
1c0091c6:	1101                	addi	sp,sp,-32
1c0091c8:	ce06                	sw	ra,28(sp)
1c0091ca:	cc22                	sw	s0,24(sp)
1c0091cc:	23d5                	jal	1c0097b0 <__rt_bridge_set_available>
1c0091ce:	1c0017b7          	lui	a5,0x1c001
1c0091d2:	7ec7a703          	lw	a4,2028(a5) # 1c0017ec <__rt_platform>
1c0091d6:	478d                	li	a5,3
1c0091d8:	02f71263          	bne	a4,a5,1c0091fc <__rt_init+0x36>
1c0091dc:	7d005073          	csrwi	0x7d0,0
1c0091e0:	1c0007b7          	lui	a5,0x1c000
1c0091e4:	61078793          	addi	a5,a5,1552 # 1c000610 <.got>
1c0091e8:	7d179073          	csrw	0x7d1,a5
1c0091ec:	1c0017b7          	lui	a5,0x1c001
1c0091f0:	e1078793          	addi	a5,a5,-496 # 1c000e10 <stack>
1c0091f4:	7d279073          	csrw	0x7d2,a5
1c0091f8:	7d00d073          	csrwi	0x7d0,1
1c0091fc:	2c29                	jal	1c009416 <__rt_irq_init>
1c0091fe:	1a1067b7          	lui	a5,0x1a106
1c009202:	577d                	li	a4,-1
1c009204:	c3d8                	sw	a4,4(a5)
1c009206:	1c0085b7          	lui	a1,0x1c008
1c00920a:	c798                	sw	a4,8(a5)
1c00920c:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c009210:	4569                	li	a0,26
1c009212:	228d                	jal	1c009374 <rt_irq_set_handler>
1c009214:	f14027f3          	csrr	a5,mhartid
1c009218:	8795                	srai	a5,a5,0x5
1c00921a:	03f7f793          	andi	a5,a5,63
1c00921e:	477d                	li	a4,31
1c009220:	0ae79e63          	bne	a5,a4,1c0092dc <__rt_init+0x116>
1c009224:	1a10a7b7          	lui	a5,0x1a10a
1c009228:	04000737          	lui	a4,0x4000
1c00922c:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c009230:	46d000ef          	jal	ra,1c009e9c <__rt_pmu_init>
1c009234:	373000ef          	jal	ra,1c009da6 <__rt_freq_init>
1c009238:	f14027f3          	csrr	a5,mhartid
1c00923c:	8795                	srai	a5,a5,0x5
1c00923e:	03f7f793          	andi	a5,a5,63
1c009242:	477d                	li	a4,31
1c009244:	00e78763          	beq	a5,a4,1c009252 <__rt_init+0x8c>
1c009248:	002017b7          	lui	a5,0x201
1c00924c:	577d                	li	a4,-1
1c00924e:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f1420>
1c009252:	1c000437          	lui	s0,0x1c000
1c009256:	2605                	jal	1c009576 <__rt_utils_init>
1c009258:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c00925c:	8dfff0ef          	jal	ra,1c008b3a <__rt_allocs_init>
1c009260:	25cd                	jal	1c009942 <__rt_thread_sched_init>
1c009262:	0ed000ef          	jal	ra,1c009b4e <__rt_event_sched_init>
1c009266:	473000ef          	jal	ra,1c009ed8 <__rt_padframe_init>
1c00926a:	401c                	lw	a5,0(s0)
1c00926c:	efb5                	bnez	a5,1c0092e8 <__rt_init+0x122>
1c00926e:	30045073          	csrwi	mstatus,8
1c009272:	4501                	li	a0,0
1c009274:	2cc1                	jal	1c009544 <__rt_cbsys_exec>
1c009276:	e521                	bnez	a0,1c0092be <__rt_init+0xf8>
1c009278:	f14027f3          	csrr	a5,mhartid
1c00927c:	8795                	srai	a5,a5,0x5
1c00927e:	03f7f793          	andi	a5,a5,63
1c009282:	477d                	li	a4,31
1c009284:	0ae78763          	beq	a5,a4,1c009332 <__rt_init+0x16c>
1c009288:	4681                	li	a3,0
1c00928a:	4601                	li	a2,0
1c00928c:	4581                	li	a1,0
1c00928e:	4505                	li	a0,1
1c009290:	cfb9                	beqz	a5,1c0092ee <__rt_init+0x128>
1c009292:	3b4d                	jal	1c009044 <rt_cluster_mount>
1c009294:	6591                	lui	a1,0x4
1c009296:	450d                	li	a0,3
1c009298:	fecff0ef          	jal	ra,1c008a84 <rt_alloc>
1c00929c:	872a                	mv	a4,a0
1c00929e:	c105                	beqz	a0,1c0092be <__rt_init+0xf8>
1c0092a0:	6805                	lui	a6,0x1
1c0092a2:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0092a6:	1c009637          	lui	a2,0x1c009
1c0092aa:	c002                	sw	zero,0(sp)
1c0092ac:	48a1                	li	a7,8
1c0092ae:	87c2                	mv	a5,a6
1c0092b0:	4681                	li	a3,0
1c0092b2:	1aa60613          	addi	a2,a2,426 # 1c0091aa <cluster_start>
1c0092b6:	4581                	li	a1,0
1c0092b8:	4501                	li	a0,0
1c0092ba:	39c5                	jal	1c008faa <rt_cluster_call>
1c0092bc:	c93d                	beqz	a0,1c009332 <__rt_init+0x16c>
1c0092be:	f1402673          	csrr	a2,mhartid
1c0092c2:	1c000537          	lui	a0,0x1c000
1c0092c6:	40565593          	srai	a1,a2,0x5
1c0092ca:	03f5f593          	andi	a1,a1,63
1c0092ce:	8a7d                	andi	a2,a2,31
1c0092d0:	50450513          	addi	a0,a0,1284 # 1c000504 <__DTOR_END__+0x218>
1c0092d4:	552010ef          	jal	ra,1c00a826 <printf>
1c0092d8:	4da010ef          	jal	ra,1c00a7b2 <abort>
1c0092dc:	002047b7          	lui	a5,0x204
1c0092e0:	04000737          	lui	a4,0x4000
1c0092e4:	cbd8                	sw	a4,20(a5)
1c0092e6:	b7a9                	j	1c009230 <__rt_init+0x6a>
1c0092e8:	9782                	jalr	a5
1c0092ea:	0411                	addi	s0,s0,4
1c0092ec:	bfbd                	j	1c00926a <__rt_init+0xa4>
1c0092ee:	3b99                	jal	1c009044 <rt_cluster_mount>
1c0092f0:	6591                	lui	a1,0x4
1c0092f2:	80058593          	addi	a1,a1,-2048 # 3800 <__rt_hyper_pending_emu_stride+0x3558>
1c0092f6:	450d                	li	a0,3
1c0092f8:	f8cff0ef          	jal	ra,1c008a84 <rt_alloc>
1c0092fc:	d169                	beqz	a0,1c0092be <__rt_init+0xf8>
1c0092fe:	00204737          	lui	a4,0x204
1c009302:	0ff00793          	li	a5,255
1c009306:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f40a4>
1c00930a:	1c0107b7          	lui	a5,0x1c010
1c00930e:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c009312:	0017e793          	ori	a5,a5,1
1c009316:	08f72023          	sw	a5,128(a4)
1c00931a:	6785                	lui	a5,0x1
1c00931c:	4462                	lw	s0,24(sp)
1c00931e:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009322:	08f72023          	sw	a5,128(a4)
1c009326:	40f2                	lw	ra,28(sp)
1c009328:	08a72023          	sw	a0,128(a4)
1c00932c:	4501                	li	a0,0
1c00932e:	6105                	addi	sp,sp,32
1c009330:	bdad                	j	1c0091aa <cluster_start>
1c009332:	40f2                	lw	ra,28(sp)
1c009334:	4462                	lw	s0,24(sp)
1c009336:	6105                	addi	sp,sp,32
1c009338:	8082                	ret

1c00933a <__rt_deinit>:
1c00933a:	1c0017b7          	lui	a5,0x1c001
1c00933e:	7ec7a703          	lw	a4,2028(a5) # 1c0017ec <__rt_platform>
1c009342:	1141                	addi	sp,sp,-16
1c009344:	c606                	sw	ra,12(sp)
1c009346:	c422                	sw	s0,8(sp)
1c009348:	478d                	li	a5,3
1c00934a:	00f71463          	bne	a4,a5,1c009352 <__rt_deinit+0x18>
1c00934e:	7d005073          	csrwi	0x7d0,0
1c009352:	4505                	li	a0,1
1c009354:	1c000437          	lui	s0,0x1c000
1c009358:	22f5                	jal	1c009544 <__rt_cbsys_exec>
1c00935a:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c00935e:	401c                	lw	a5,0(s0)
1c009360:	e789                	bnez	a5,1c00936a <__rt_deinit+0x30>
1c009362:	40b2                	lw	ra,12(sp)
1c009364:	4422                	lw	s0,8(sp)
1c009366:	0141                	addi	sp,sp,16
1c009368:	8082                	ret
1c00936a:	9782                	jalr	a5
1c00936c:	0411                	addi	s0,s0,4
1c00936e:	bfc5                	j	1c00935e <__rt_deinit+0x24>

1c009370 <pi_open_from_conf>:
1c009370:	c14c                	sw	a1,4(a0)
1c009372:	8082                	ret

1c009374 <rt_irq_set_handler>:
1c009374:	f14027f3          	csrr	a5,mhartid
1c009378:	8795                	srai	a5,a5,0x5
1c00937a:	03f7f793          	andi	a5,a5,63
1c00937e:	477d                	li	a4,31
1c009380:	04e79063          	bne	a5,a4,1c0093c0 <rt_irq_set_handler+0x4c>
1c009384:	1a1047b7          	lui	a5,0x1a104
1c009388:	43dc                	lw	a5,4(a5)
1c00938a:	050a                	slli	a0,a0,0x2
1c00938c:	8d89                	sub	a1,a1,a0
1c00938e:	8d9d                	sub	a1,a1,a5
1c009390:	000ff737          	lui	a4,0xff
1c009394:	00f506b3          	add	a3,a0,a5
1c009398:	8f6d                	and	a4,a4,a1
1c00939a:	0145d793          	srli	a5,a1,0x14
1c00939e:	06f76713          	ori	a4,a4,111
1c0093a2:	07fe                	slli	a5,a5,0x1f
1c0093a4:	8fd9                	or	a5,a5,a4
1c0093a6:	7fe00637          	lui	a2,0x7fe00
1c0093aa:	01459713          	slli	a4,a1,0x14
1c0093ae:	8f71                	and	a4,a4,a2
1c0093b0:	8fd9                	or	a5,a5,a4
1c0093b2:	05a6                	slli	a1,a1,0x9
1c0093b4:	00100737          	lui	a4,0x100
1c0093b8:	8df9                	and	a1,a1,a4
1c0093ba:	8ddd                	or	a1,a1,a5
1c0093bc:	c28c                	sw	a1,0(a3)
1c0093be:	8082                	ret
1c0093c0:	002007b7          	lui	a5,0x200
1c0093c4:	43bc                	lw	a5,64(a5)
1c0093c6:	b7d1                	j	1c00938a <rt_irq_set_handler+0x16>

1c0093c8 <illegal_insn_handler_c>:
1c0093c8:	8082                	ret

1c0093ca <__rt_handle_illegal_instr>:
1c0093ca:	1c0017b7          	lui	a5,0x1c001
1c0093ce:	e147a703          	lw	a4,-492(a5) # 1c000e14 <__rt_debug_config>
1c0093d2:	1141                	addi	sp,sp,-16
1c0093d4:	c422                	sw	s0,8(sp)
1c0093d6:	c606                	sw	ra,12(sp)
1c0093d8:	8b05                	andi	a4,a4,1
1c0093da:	843e                	mv	s0,a5
1c0093dc:	c30d                	beqz	a4,1c0093fe <__rt_handle_illegal_instr+0x34>
1c0093de:	341026f3          	csrr	a3,mepc
1c0093e2:	f1402673          	csrr	a2,mhartid
1c0093e6:	1c000537          	lui	a0,0x1c000
1c0093ea:	4298                	lw	a4,0(a3)
1c0093ec:	40565593          	srai	a1,a2,0x5
1c0093f0:	03f5f593          	andi	a1,a1,63
1c0093f4:	8a7d                	andi	a2,a2,31
1c0093f6:	55c50513          	addi	a0,a0,1372 # 1c00055c <__DTOR_END__+0x270>
1c0093fa:	42c010ef          	jal	ra,1c00a826 <printf>
1c0093fe:	e1442783          	lw	a5,-492(s0)
1c009402:	8385                	srli	a5,a5,0x1
1c009404:	8b85                	andi	a5,a5,1
1c009406:	c399                	beqz	a5,1c00940c <__rt_handle_illegal_instr+0x42>
1c009408:	3aa010ef          	jal	ra,1c00a7b2 <abort>
1c00940c:	4422                	lw	s0,8(sp)
1c00940e:	40b2                	lw	ra,12(sp)
1c009410:	0141                	addi	sp,sp,16
1c009412:	fb7ff06f          	j	1c0093c8 <illegal_insn_handler_c>

1c009416 <__rt_irq_init>:
1c009416:	f14027f3          	csrr	a5,mhartid
1c00941a:	8795                	srai	a5,a5,0x5
1c00941c:	03f7f793          	andi	a5,a5,63
1c009420:	477d                	li	a4,31
1c009422:	02e79763          	bne	a5,a4,1c009450 <__rt_irq_init+0x3a>
1c009426:	1a10a7b7          	lui	a5,0x1a10a
1c00942a:	577d                	li	a4,-1
1c00942c:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1097e8>
1c009430:	f14027f3          	csrr	a5,mhartid
1c009434:	8795                	srai	a5,a5,0x5
1c009436:	1c008737          	lui	a4,0x1c008
1c00943a:	03f7f793          	andi	a5,a5,63
1c00943e:	46fd                	li	a3,31
1c009440:	00070713          	mv	a4,a4
1c009444:	00d79b63          	bne	a5,a3,1c00945a <__rt_irq_init+0x44>
1c009448:	1a1047b7          	lui	a5,0x1a104
1c00944c:	c3d8                	sw	a4,4(a5)
1c00944e:	8082                	ret
1c009450:	002047b7          	lui	a5,0x204
1c009454:	577d                	li	a4,-1
1c009456:	cb98                	sw	a4,16(a5)
1c009458:	bfe1                	j	1c009430 <__rt_irq_init+0x1a>
1c00945a:	002007b7          	lui	a5,0x200
1c00945e:	c3b8                	sw	a4,64(a5)
1c009460:	8082                	ret

1c009462 <__rt_fc_cluster_lock_req>:
1c009462:	1141                	addi	sp,sp,-16
1c009464:	c606                	sw	ra,12(sp)
1c009466:	c422                	sw	s0,8(sp)
1c009468:	c226                	sw	s1,4(sp)
1c00946a:	300474f3          	csrrci	s1,mstatus,8
1c00946e:	09654703          	lbu	a4,150(a0)
1c009472:	411c                	lw	a5,0(a0)
1c009474:	c729                	beqz	a4,1c0094be <__rt_fc_cluster_lock_req+0x5c>
1c009476:	4398                	lw	a4,0(a5)
1c009478:	c30d                	beqz	a4,1c00949a <__rt_fc_cluster_lock_req+0x38>
1c00947a:	43d8                	lw	a4,4(a5)
1c00947c:	cf09                	beqz	a4,1c009496 <__rt_fc_cluster_lock_req+0x34>
1c00947e:	4798                	lw	a4,8(a5)
1c009480:	c348                	sw	a0,4(a4)
1c009482:	c788                	sw	a0,8(a5)
1c009484:	00052223          	sw	zero,4(a0)
1c009488:	30049073          	csrw	mstatus,s1
1c00948c:	40b2                	lw	ra,12(sp)
1c00948e:	4422                	lw	s0,8(sp)
1c009490:	4492                	lw	s1,4(sp)
1c009492:	0141                	addi	sp,sp,16
1c009494:	8082                	ret
1c009496:	c3c8                	sw	a0,4(a5)
1c009498:	b7ed                	j	1c009482 <__rt_fc_cluster_lock_req+0x20>
1c00949a:	4705                	li	a4,1
1c00949c:	08e50a23          	sb	a4,148(a0)
1c0094a0:	4705                	li	a4,1
1c0094a2:	c398                	sw	a4,0(a5)
1c0094a4:	09554783          	lbu	a5,149(a0)
1c0094a8:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f0060>
1c0094ac:	00201737          	lui	a4,0x201
1c0094b0:	07da                	slli	a5,a5,0x16
1c0094b2:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c0094b6:	97ba                	add	a5,a5,a4
1c0094b8:	0007a023          	sw	zero,0(a5)
1c0094bc:	b7f1                	j	1c009488 <__rt_fc_cluster_lock_req+0x26>
1c0094be:	842a                	mv	s0,a0
1c0094c0:	47c8                	lw	a0,12(a5)
1c0094c2:	cd01                	beqz	a0,1c0094da <__rt_fc_cluster_lock_req+0x78>
1c0094c4:	0007a023          	sw	zero,0(a5)
1c0094c8:	0007a623          	sw	zero,12(a5)
1c0094cc:	2185                	jal	1c00992c <__rt_thread_wakeup>
1c0094ce:	4785                	li	a5,1
1c0094d0:	08f40a23          	sb	a5,148(s0)
1c0094d4:	09544783          	lbu	a5,149(s0)
1c0094d8:	bfc1                	j	1c0094a8 <__rt_fc_cluster_lock_req+0x46>
1c0094da:	43d8                	lw	a4,4(a5)
1c0094dc:	e701                	bnez	a4,1c0094e4 <__rt_fc_cluster_lock_req+0x82>
1c0094de:	0007a023          	sw	zero,0(a5)
1c0094e2:	b7f5                	j	1c0094ce <__rt_fc_cluster_lock_req+0x6c>
1c0094e4:	4354                	lw	a3,4(a4)
1c0094e6:	c3d4                	sw	a3,4(a5)
1c0094e8:	4785                	li	a5,1
1c0094ea:	08f70a23          	sb	a5,148(a4)
1c0094ee:	09574783          	lbu	a5,149(a4)
1c0094f2:	00201737          	lui	a4,0x201
1c0094f6:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c0094fa:	04078793          	addi	a5,a5,64
1c0094fe:	07da                	slli	a5,a5,0x16
1c009500:	97ba                	add	a5,a5,a4
1c009502:	bff1                	j	1c0094de <__rt_fc_cluster_lock_req+0x7c>

1c009504 <__rt_cbsys_add>:
1c009504:	1101                	addi	sp,sp,-32
1c009506:	cc22                	sw	s0,24(sp)
1c009508:	ca26                	sw	s1,20(sp)
1c00950a:	842a                	mv	s0,a0
1c00950c:	84ae                	mv	s1,a1
1c00950e:	4501                	li	a0,0
1c009510:	45b1                	li	a1,12
1c009512:	c632                	sw	a2,12(sp)
1c009514:	ce06                	sw	ra,28(sp)
1c009516:	d6eff0ef          	jal	ra,1c008a84 <rt_alloc>
1c00951a:	4632                	lw	a2,12(sp)
1c00951c:	c115                	beqz	a0,1c009540 <__rt_cbsys_add+0x3c>
1c00951e:	1c0017b7          	lui	a5,0x1c001
1c009522:	040a                	slli	s0,s0,0x2
1c009524:	e1878793          	addi	a5,a5,-488 # 1c000e18 <cbsys_first>
1c009528:	97a2                	add	a5,a5,s0
1c00952a:	4398                	lw	a4,0(a5)
1c00952c:	c104                	sw	s1,0(a0)
1c00952e:	c150                	sw	a2,4(a0)
1c009530:	c518                	sw	a4,8(a0)
1c009532:	c388                	sw	a0,0(a5)
1c009534:	4501                	li	a0,0
1c009536:	40f2                	lw	ra,28(sp)
1c009538:	4462                	lw	s0,24(sp)
1c00953a:	44d2                	lw	s1,20(sp)
1c00953c:	6105                	addi	sp,sp,32
1c00953e:	8082                	ret
1c009540:	557d                	li	a0,-1
1c009542:	bfd5                	j	1c009536 <__rt_cbsys_add+0x32>

1c009544 <__rt_cbsys_exec>:
1c009544:	00251793          	slli	a5,a0,0x2
1c009548:	1c001537          	lui	a0,0x1c001
1c00954c:	e1850513          	addi	a0,a0,-488 # 1c000e18 <cbsys_first>
1c009550:	1141                	addi	sp,sp,-16
1c009552:	953e                	add	a0,a0,a5
1c009554:	c422                	sw	s0,8(sp)
1c009556:	4100                	lw	s0,0(a0)
1c009558:	c606                	sw	ra,12(sp)
1c00955a:	e411                	bnez	s0,1c009566 <__rt_cbsys_exec+0x22>
1c00955c:	4501                	li	a0,0
1c00955e:	40b2                	lw	ra,12(sp)
1c009560:	4422                	lw	s0,8(sp)
1c009562:	0141                	addi	sp,sp,16
1c009564:	8082                	ret
1c009566:	401c                	lw	a5,0(s0)
1c009568:	4048                	lw	a0,4(s0)
1c00956a:	9782                	jalr	a5
1c00956c:	e119                	bnez	a0,1c009572 <__rt_cbsys_exec+0x2e>
1c00956e:	4400                	lw	s0,8(s0)
1c009570:	b7ed                	j	1c00955a <__rt_cbsys_exec+0x16>
1c009572:	557d                	li	a0,-1
1c009574:	b7ed                	j	1c00955e <__rt_cbsys_exec+0x1a>

1c009576 <__rt_utils_init>:
1c009576:	1c0017b7          	lui	a5,0x1c001
1c00957a:	e1878793          	addi	a5,a5,-488 # 1c000e18 <cbsys_first>
1c00957e:	0007a023          	sw	zero,0(a5)
1c009582:	0007a223          	sw	zero,4(a5)
1c009586:	0007a423          	sw	zero,8(a5)
1c00958a:	0007a623          	sw	zero,12(a5)
1c00958e:	0007a823          	sw	zero,16(a5)
1c009592:	0007aa23          	sw	zero,20(a5)
1c009596:	8082                	ret

1c009598 <__rt_fc_lock>:
1c009598:	1141                	addi	sp,sp,-16
1c00959a:	c422                	sw	s0,8(sp)
1c00959c:	842a                	mv	s0,a0
1c00959e:	c606                	sw	ra,12(sp)
1c0095a0:	c226                	sw	s1,4(sp)
1c0095a2:	c04a                	sw	s2,0(sp)
1c0095a4:	300474f3          	csrrci	s1,mstatus,8
1c0095a8:	401c                	lw	a5,0(s0)
1c0095aa:	eb99                	bnez	a5,1c0095c0 <__rt_fc_lock+0x28>
1c0095ac:	4785                	li	a5,1
1c0095ae:	c01c                	sw	a5,0(s0)
1c0095b0:	30049073          	csrw	mstatus,s1
1c0095b4:	40b2                	lw	ra,12(sp)
1c0095b6:	4422                	lw	s0,8(sp)
1c0095b8:	4492                	lw	s1,4(sp)
1c0095ba:	4902                	lw	s2,0(sp)
1c0095bc:	0141                	addi	sp,sp,16
1c0095be:	8082                	ret
1c0095c0:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c0095c4:	4585                	li	a1,1
1c0095c6:	e3ff7517          	auipc	a0,0xe3ff7
1c0095ca:	a6250513          	addi	a0,a0,-1438 # 28 <__rt_sched>
1c0095ce:	c45c                	sw	a5,12(s0)
1c0095d0:	29f1                	jal	1c009aac <__rt_event_execute>
1c0095d2:	bfd9                	j	1c0095a8 <__rt_fc_lock+0x10>

1c0095d4 <__rt_fc_unlock>:
1c0095d4:	300476f3          	csrrci	a3,mstatus,8
1c0095d8:	415c                	lw	a5,4(a0)
1c0095da:	e791                	bnez	a5,1c0095e6 <__rt_fc_unlock+0x12>
1c0095dc:	00052023          	sw	zero,0(a0)
1c0095e0:	30069073          	csrw	mstatus,a3
1c0095e4:	8082                	ret
1c0095e6:	43d8                	lw	a4,4(a5)
1c0095e8:	c158                	sw	a4,4(a0)
1c0095ea:	4705                	li	a4,1
1c0095ec:	08e78a23          	sb	a4,148(a5)
1c0095f0:	0957c783          	lbu	a5,149(a5)
1c0095f4:	00201737          	lui	a4,0x201
1c0095f8:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c0095fc:	04078793          	addi	a5,a5,64
1c009600:	07da                	slli	a5,a5,0x16
1c009602:	97ba                	add	a5,a5,a4
1c009604:	0007a023          	sw	zero,0(a5)
1c009608:	bfe1                	j	1c0095e0 <__rt_fc_unlock+0xc>

1c00960a <__rt_fc_cluster_lock>:
1c00960a:	f14027f3          	csrr	a5,mhartid
1c00960e:	8795                	srai	a5,a5,0x5
1c009610:	03f7f793          	andi	a5,a5,63
1c009614:	08f58aa3          	sb	a5,149(a1)
1c009618:	4785                	li	a5,1
1c00961a:	08f58b23          	sb	a5,150(a1)
1c00961e:	1c0097b7          	lui	a5,0x1c009
1c009622:	46278793          	addi	a5,a5,1122 # 1c009462 <__rt_fc_cluster_lock_req>
1c009626:	c188                	sw	a0,0(a1)
1c009628:	08058a23          	sb	zero,148(a1)
1c00962c:	0205a423          	sw	zero,40(a1)
1c009630:	0205a623          	sw	zero,44(a1)
1c009634:	c59c                	sw	a5,8(a1)
1c009636:	c5cc                	sw	a1,12(a1)
1c009638:	05a1                	addi	a1,a1,8
1c00963a:	0015e513          	ori	a0,a1,1
1c00963e:	8abff06f          	j	1c008ee8 <__rt_cluster_push_fc_event>

1c009642 <__rt_fc_cluster_unlock>:
1c009642:	f14027f3          	csrr	a5,mhartid
1c009646:	8795                	srai	a5,a5,0x5
1c009648:	03f7f793          	andi	a5,a5,63
1c00964c:	08f58aa3          	sb	a5,149(a1)
1c009650:	1c0097b7          	lui	a5,0x1c009
1c009654:	46278793          	addi	a5,a5,1122 # 1c009462 <__rt_fc_cluster_lock_req>
1c009658:	c188                	sw	a0,0(a1)
1c00965a:	08058a23          	sb	zero,148(a1)
1c00965e:	08058b23          	sb	zero,150(a1)
1c009662:	0205a423          	sw	zero,40(a1)
1c009666:	0205a623          	sw	zero,44(a1)
1c00966a:	c59c                	sw	a5,8(a1)
1c00966c:	c5cc                	sw	a1,12(a1)
1c00966e:	05a1                	addi	a1,a1,8
1c009670:	0015e513          	ori	a0,a1,1
1c009674:	875ff06f          	j	1c008ee8 <__rt_cluster_push_fc_event>

1c009678 <__rt_event_enqueue>:
1c009678:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c00967c:	00052c23          	sw	zero,24(a0)
1c009680:	c799                	beqz	a5,1c00968e <__rt_event_enqueue+0x16>
1c009682:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c009686:	cf88                	sw	a0,24(a5)
1c009688:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c00968c:	8082                	ret
1c00968e:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c009692:	bfdd                	j	1c009688 <__rt_event_enqueue+0x10>

1c009694 <__rt_bridge_check_bridge_req.part.5>:
1c009694:	1c001737          	lui	a4,0x1c001
1c009698:	72c70793          	addi	a5,a4,1836 # 1c00172c <__hal_debug_struct>
1c00969c:	0a47a783          	lw	a5,164(a5)
1c0096a0:	72c70713          	addi	a4,a4,1836
1c0096a4:	c789                	beqz	a5,1c0096ae <__rt_bridge_check_bridge_req.part.5+0x1a>
1c0096a6:	4f94                	lw	a3,24(a5)
1c0096a8:	e681                	bnez	a3,1c0096b0 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c0096aa:	0af72623          	sw	a5,172(a4)
1c0096ae:	8082                	ret
1c0096b0:	479c                	lw	a5,8(a5)
1c0096b2:	bfcd                	j	1c0096a4 <__rt_bridge_check_bridge_req.part.5+0x10>

1c0096b4 <__rt_bridge_wait>:
1c0096b4:	f14027f3          	csrr	a5,mhartid
1c0096b8:	8795                	srai	a5,a5,0x5
1c0096ba:	03f7f793          	andi	a5,a5,63
1c0096be:	477d                	li	a4,31
1c0096c0:	02e79a63          	bne	a5,a4,1c0096f4 <__rt_bridge_wait+0x40>
1c0096c4:	1a10a7b7          	lui	a5,0x1a10a
1c0096c8:	6711                	lui	a4,0x4
1c0096ca:	300476f3          	csrrci	a3,mstatus,8
1c0096ce:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1097ec>
1c0096d2:	01161593          	slli	a1,a2,0x11
1c0096d6:	0005cb63          	bltz	a1,1c0096ec <__rt_bridge_wait+0x38>
1c0096da:	80e7a223          	sw	a4,-2044(a5)
1c0096de:	10500073          	wfi
1c0096e2:	80e7a423          	sw	a4,-2040(a5)
1c0096e6:	30069073          	csrw	mstatus,a3
1c0096ea:	b7c5                	j	1c0096ca <__rt_bridge_wait+0x16>
1c0096ec:	80e7aa23          	sw	a4,-2028(a5)
1c0096f0:	30069073          	csrw	mstatus,a3
1c0096f4:	8082                	ret

1c0096f6 <__rt_bridge_handle_notif>:
1c0096f6:	1141                	addi	sp,sp,-16
1c0096f8:	c422                	sw	s0,8(sp)
1c0096fa:	1c001437          	lui	s0,0x1c001
1c0096fe:	72c40793          	addi	a5,s0,1836 # 1c00172c <__hal_debug_struct>
1c009702:	0a47a783          	lw	a5,164(a5)
1c009706:	c606                	sw	ra,12(sp)
1c009708:	c226                	sw	s1,4(sp)
1c00970a:	c04a                	sw	s2,0(sp)
1c00970c:	72c40413          	addi	s0,s0,1836
1c009710:	c399                	beqz	a5,1c009716 <__rt_bridge_handle_notif+0x20>
1c009712:	4bd8                	lw	a4,20(a5)
1c009714:	e30d                	bnez	a4,1c009736 <__rt_bridge_handle_notif+0x40>
1c009716:	0b442783          	lw	a5,180(s0)
1c00971a:	c789                	beqz	a5,1c009724 <__rt_bridge_handle_notif+0x2e>
1c00971c:	43a8                	lw	a0,64(a5)
1c00971e:	0a042a23          	sw	zero,180(s0)
1c009722:	3f99                	jal	1c009678 <__rt_event_enqueue>
1c009724:	0ac42783          	lw	a5,172(s0)
1c009728:	eb95                	bnez	a5,1c00975c <__rt_bridge_handle_notif+0x66>
1c00972a:	4422                	lw	s0,8(sp)
1c00972c:	40b2                	lw	ra,12(sp)
1c00972e:	4492                	lw	s1,4(sp)
1c009730:	4902                	lw	s2,0(sp)
1c009732:	0141                	addi	sp,sp,16
1c009734:	b785                	j	1c009694 <__rt_bridge_check_bridge_req.part.5>
1c009736:	4784                	lw	s1,8(a5)
1c009738:	4fd8                	lw	a4,28(a5)
1c00973a:	0a942223          	sw	s1,164(s0)
1c00973e:	cb01                	beqz	a4,1c00974e <__rt_bridge_handle_notif+0x58>
1c009740:	0b042703          	lw	a4,176(s0)
1c009744:	c798                	sw	a4,8(a5)
1c009746:	0af42823          	sw	a5,176(s0)
1c00974a:	87a6                	mv	a5,s1
1c00974c:	b7d1                	j	1c009710 <__rt_bridge_handle_notif+0x1a>
1c00974e:	43a8                	lw	a0,64(a5)
1c009750:	30047973          	csrrci	s2,mstatus,8
1c009754:	3715                	jal	1c009678 <__rt_event_enqueue>
1c009756:	30091073          	csrw	mstatus,s2
1c00975a:	bfc5                	j	1c00974a <__rt_bridge_handle_notif+0x54>
1c00975c:	40b2                	lw	ra,12(sp)
1c00975e:	4422                	lw	s0,8(sp)
1c009760:	4492                	lw	s1,4(sp)
1c009762:	4902                	lw	s2,0(sp)
1c009764:	0141                	addi	sp,sp,16
1c009766:	8082                	ret

1c009768 <__rt_bridge_check_connection>:
1c009768:	1c001737          	lui	a4,0x1c001
1c00976c:	72c70713          	addi	a4,a4,1836 # 1c00172c <__hal_debug_struct>
1c009770:	471c                	lw	a5,8(a4)
1c009772:	ef95                	bnez	a5,1c0097ae <__rt_bridge_check_connection+0x46>
1c009774:	1a1047b7          	lui	a5,0x1a104
1c009778:	5bfc                	lw	a5,116(a5)
1c00977a:	469d                	li	a3,7
1c00977c:	83a5                	srli	a5,a5,0x9
1c00977e:	8b9d                	andi	a5,a5,7
1c009780:	02d79763          	bne	a5,a3,1c0097ae <__rt_bridge_check_connection+0x46>
1c009784:	1141                	addi	sp,sp,-16
1c009786:	c422                	sw	s0,8(sp)
1c009788:	c226                	sw	s1,4(sp)
1c00978a:	c606                	sw	ra,12(sp)
1c00978c:	4785                	li	a5,1
1c00978e:	c71c                	sw	a5,8(a4)
1c009790:	1a1044b7          	lui	s1,0x1a104
1c009794:	441d                	li	s0,7
1c009796:	58fc                	lw	a5,116(s1)
1c009798:	83a5                	srli	a5,a5,0x9
1c00979a:	8b9d                	andi	a5,a5,7
1c00979c:	00878763          	beq	a5,s0,1c0097aa <__rt_bridge_check_connection+0x42>
1c0097a0:	40b2                	lw	ra,12(sp)
1c0097a2:	4422                	lw	s0,8(sp)
1c0097a4:	4492                	lw	s1,4(sp)
1c0097a6:	0141                	addi	sp,sp,16
1c0097a8:	8082                	ret
1c0097aa:	3729                	jal	1c0096b4 <__rt_bridge_wait>
1c0097ac:	b7ed                	j	1c009796 <__rt_bridge_check_connection+0x2e>
1c0097ae:	8082                	ret

1c0097b0 <__rt_bridge_set_available>:
1c0097b0:	1c0017b7          	lui	a5,0x1c001
1c0097b4:	72c78793          	addi	a5,a5,1836 # 1c00172c <__hal_debug_struct>
1c0097b8:	479c                	lw	a5,8(a5)
1c0097ba:	8082                	ret

1c0097bc <__rt_bridge_send_notif>:
1c0097bc:	1141                	addi	sp,sp,-16
1c0097be:	c606                	sw	ra,12(sp)
1c0097c0:	3765                	jal	1c009768 <__rt_bridge_check_connection>
1c0097c2:	40b2                	lw	ra,12(sp)
1c0097c4:	1c0017b7          	lui	a5,0x1c001
1c0097c8:	72c78793          	addi	a5,a5,1836 # 1c00172c <__hal_debug_struct>
1c0097cc:	479c                	lw	a5,8(a5)
1c0097ce:	0141                	addi	sp,sp,16
1c0097d0:	8082                	ret

1c0097d2 <__rt_bridge_clear_notif>:
1c0097d2:	1141                	addi	sp,sp,-16
1c0097d4:	c606                	sw	ra,12(sp)
1c0097d6:	3f49                	jal	1c009768 <__rt_bridge_check_connection>
1c0097d8:	1c0017b7          	lui	a5,0x1c001
1c0097dc:	72c78793          	addi	a5,a5,1836 # 1c00172c <__hal_debug_struct>
1c0097e0:	4798                	lw	a4,8(a5)
1c0097e2:	c311                	beqz	a4,1c0097e6 <__rt_bridge_clear_notif+0x14>
1c0097e4:	479c                	lw	a5,8(a5)
1c0097e6:	40b2                	lw	ra,12(sp)
1c0097e8:	0141                	addi	sp,sp,16
1c0097ea:	8082                	ret

1c0097ec <__rt_bridge_printf_flush>:
1c0097ec:	1141                	addi	sp,sp,-16
1c0097ee:	c422                	sw	s0,8(sp)
1c0097f0:	c606                	sw	ra,12(sp)
1c0097f2:	1c001437          	lui	s0,0x1c001
1c0097f6:	3f8d                	jal	1c009768 <__rt_bridge_check_connection>
1c0097f8:	72c40793          	addi	a5,s0,1836 # 1c00172c <__hal_debug_struct>
1c0097fc:	479c                	lw	a5,8(a5)
1c0097fe:	c385                	beqz	a5,1c00981e <__rt_bridge_printf_flush+0x32>
1c009800:	72c40413          	addi	s0,s0,1836
1c009804:	485c                	lw	a5,20(s0)
1c009806:	e399                	bnez	a5,1c00980c <__rt_bridge_printf_flush+0x20>
1c009808:	4c1c                	lw	a5,24(s0)
1c00980a:	cb91                	beqz	a5,1c00981e <__rt_bridge_printf_flush+0x32>
1c00980c:	3f45                	jal	1c0097bc <__rt_bridge_send_notif>
1c00980e:	485c                	lw	a5,20(s0)
1c009810:	e789                	bnez	a5,1c00981a <__rt_bridge_printf_flush+0x2e>
1c009812:	4422                	lw	s0,8(sp)
1c009814:	40b2                	lw	ra,12(sp)
1c009816:	0141                	addi	sp,sp,16
1c009818:	bf6d                	j	1c0097d2 <__rt_bridge_clear_notif>
1c00981a:	3d69                	jal	1c0096b4 <__rt_bridge_wait>
1c00981c:	bfcd                	j	1c00980e <__rt_bridge_printf_flush+0x22>
1c00981e:	40b2                	lw	ra,12(sp)
1c009820:	4422                	lw	s0,8(sp)
1c009822:	0141                	addi	sp,sp,16
1c009824:	8082                	ret

1c009826 <__rt_bridge_req_shutdown>:
1c009826:	1141                	addi	sp,sp,-16
1c009828:	c606                	sw	ra,12(sp)
1c00982a:	c422                	sw	s0,8(sp)
1c00982c:	c226                	sw	s1,4(sp)
1c00982e:	3f2d                	jal	1c009768 <__rt_bridge_check_connection>
1c009830:	1c0017b7          	lui	a5,0x1c001
1c009834:	72c78793          	addi	a5,a5,1836 # 1c00172c <__hal_debug_struct>
1c009838:	479c                	lw	a5,8(a5)
1c00983a:	cb95                	beqz	a5,1c00986e <__rt_bridge_req_shutdown+0x48>
1c00983c:	3f45                	jal	1c0097ec <__rt_bridge_printf_flush>
1c00983e:	1a1044b7          	lui	s1,0x1a104
1c009842:	441d                	li	s0,7
1c009844:	58fc                	lw	a5,116(s1)
1c009846:	83a5                	srli	a5,a5,0x9
1c009848:	8b9d                	andi	a5,a5,7
1c00984a:	02878763          	beq	a5,s0,1c009878 <__rt_bridge_req_shutdown+0x52>
1c00984e:	1a1044b7          	lui	s1,0x1a104
1c009852:	441d                	li	s0,7
1c009854:	58fc                	lw	a5,116(s1)
1c009856:	83a5                	srli	a5,a5,0x9
1c009858:	8b9d                	andi	a5,a5,7
1c00985a:	02879163          	bne	a5,s0,1c00987c <__rt_bridge_req_shutdown+0x56>
1c00985e:	1a1044b7          	lui	s1,0x1a104
1c009862:	441d                	li	s0,7
1c009864:	58fc                	lw	a5,116(s1)
1c009866:	83a5                	srli	a5,a5,0x9
1c009868:	8b9d                	andi	a5,a5,7
1c00986a:	00878b63          	beq	a5,s0,1c009880 <__rt_bridge_req_shutdown+0x5a>
1c00986e:	40b2                	lw	ra,12(sp)
1c009870:	4422                	lw	s0,8(sp)
1c009872:	4492                	lw	s1,4(sp)
1c009874:	0141                	addi	sp,sp,16
1c009876:	8082                	ret
1c009878:	3d35                	jal	1c0096b4 <__rt_bridge_wait>
1c00987a:	b7e9                	j	1c009844 <__rt_bridge_req_shutdown+0x1e>
1c00987c:	3d25                	jal	1c0096b4 <__rt_bridge_wait>
1c00987e:	bfd9                	j	1c009854 <__rt_bridge_req_shutdown+0x2e>
1c009880:	3d15                	jal	1c0096b4 <__rt_bridge_wait>
1c009882:	b7cd                	j	1c009864 <__rt_bridge_req_shutdown+0x3e>

1c009884 <__rt_bridge_init>:
1c009884:	1c0017b7          	lui	a5,0x1c001
1c009888:	1a10a737          	lui	a4,0x1a10a
1c00988c:	72c78793          	addi	a5,a5,1836 # 1c00172c <__hal_debug_struct>
1c009890:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1097f0>
1c009894:	0ae7ac23          	sw	a4,184(a5)
1c009898:	4741                	li	a4,16
1c00989a:	0a07a223          	sw	zero,164(a5)
1c00989e:	0a07a623          	sw	zero,172(a5)
1c0098a2:	0a07aa23          	sw	zero,180(a5)
1c0098a6:	0ae7ae23          	sw	a4,188(a5)
1c0098aa:	00400793          	li	a5,4
1c0098ae:	0007a823          	sw	zero,16(a5)
1c0098b2:	0007a023          	sw	zero,0(a5)
1c0098b6:	8082                	ret

1c0098b8 <__rt_thread_enqueue_ready>:
1c0098b8:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c0098bc:	02052c23          	sw	zero,56(a0)
1c0098c0:	01800793          	li	a5,24
1c0098c4:	e711                	bnez	a4,1c0098d0 <__rt_thread_enqueue_ready+0x18>
1c0098c6:	c388                	sw	a0,0(a5)
1c0098c8:	c3c8                	sw	a0,4(a5)
1c0098ca:	0c052a23          	sw	zero,212(a0)
1c0098ce:	8082                	ret
1c0098d0:	43d8                	lw	a4,4(a5)
1c0098d2:	df08                	sw	a0,56(a4)
1c0098d4:	bfd5                	j	1c0098c8 <__rt_thread_enqueue_ready+0x10>

1c0098d6 <__rt_thread_sleep>:
1c0098d6:	01800713          	li	a4,24
1c0098da:	4708                	lw	a0,8(a4)
1c0098dc:	01800793          	li	a5,24
1c0098e0:	438c                	lw	a1,0(a5)
1c0098e2:	c999                	beqz	a1,1c0098f8 <__rt_thread_sleep+0x22>
1c0098e4:	5d98                	lw	a4,56(a1)
1c0098e6:	c398                	sw	a4,0(a5)
1c0098e8:	4705                	li	a4,1
1c0098ea:	0ce5aa23          	sw	a4,212(a1)
1c0098ee:	00b50c63          	beq	a0,a1,1c009906 <__rt_thread_sleep+0x30>
1c0098f2:	c78c                	sw	a1,8(a5)
1c0098f4:	9d3fe06f          	j	1c0082c6 <__rt_thread_switch>
1c0098f8:	10500073          	wfi
1c0098fc:	30045073          	csrwi	mstatus,8
1c009900:	30047773          	csrrci	a4,mstatus,8
1c009904:	bff1                	j	1c0098e0 <__rt_thread_sleep+0xa>
1c009906:	8082                	ret

1c009908 <rt_thread_exit>:
1c009908:	300477f3          	csrrci	a5,mstatus,8
1c00990c:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009910:	4705                	li	a4,1
1c009912:	c3e8                	sw	a0,68(a5)
1c009914:	5fc8                	lw	a0,60(a5)
1c009916:	c3b8                	sw	a4,64(a5)
1c009918:	c909                	beqz	a0,1c00992a <rt_thread_exit+0x22>
1c00991a:	0d452783          	lw	a5,212(a0)
1c00991e:	c791                	beqz	a5,1c00992a <rt_thread_exit+0x22>
1c009920:	1141                	addi	sp,sp,-16
1c009922:	c606                	sw	ra,12(sp)
1c009924:	3f51                	jal	1c0098b8 <__rt_thread_enqueue_ready>
1c009926:	40b2                	lw	ra,12(sp)
1c009928:	0141                	addi	sp,sp,16
1c00992a:	b775                	j	1c0098d6 <__rt_thread_sleep>

1c00992c <__rt_thread_wakeup>:
1c00992c:	5d18                	lw	a4,56(a0)
1c00992e:	eb09                	bnez	a4,1c009940 <__rt_thread_wakeup+0x14>
1c009930:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c009934:	00a70663          	beq	a4,a0,1c009940 <__rt_thread_wakeup+0x14>
1c009938:	0d452783          	lw	a5,212(a0)
1c00993c:	c391                	beqz	a5,1c009940 <__rt_thread_wakeup+0x14>
1c00993e:	bfad                	j	1c0098b8 <__rt_thread_enqueue_ready>
1c009940:	8082                	ret

1c009942 <__rt_thread_sched_init>:
1c009942:	1141                	addi	sp,sp,-16
1c009944:	c422                	sw	s0,8(sp)
1c009946:	1c0087b7          	lui	a5,0x1c008
1c00994a:	1c001437          	lui	s0,0x1c001
1c00994e:	c226                	sw	s1,4(sp)
1c009950:	c04a                	sw	s2,0(sp)
1c009952:	c606                	sw	ra,12(sp)
1c009954:	e3040413          	addi	s0,s0,-464 # 1c000e30 <__rt_thread_main>
1c009958:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c00995c:	c01c                	sw	a5,0(s0)
1c00995e:	1c00a7b7          	lui	a5,0x1c00a
1c009962:	04840913          	addi	s2,s0,72
1c009966:	90878793          	addi	a5,a5,-1784 # 1c009908 <rt_thread_exit>
1c00996a:	01800493          	li	s1,24
1c00996e:	c45c                	sw	a5,12(s0)
1c009970:	854a                	mv	a0,s2
1c009972:	4785                	li	a5,1
1c009974:	e3ff6597          	auipc	a1,0xe3ff6
1c009978:	6b458593          	addi	a1,a1,1716 # 28 <__rt_sched>
1c00997c:	0cf42a23          	sw	a5,212(s0)
1c009980:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa103fe0>
1c009984:	02042a23          	sw	zero,52(s0)
1c009988:	00042223          	sw	zero,4(s0)
1c00998c:	00042423          	sw	zero,8(s0)
1c009990:	2829                	jal	1c0099aa <__rt_event_init>
1c009992:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009996:	c480                	sw	s0,8(s1)
1c009998:	40b2                	lw	ra,12(sp)
1c00999a:	d03c                	sw	a5,96(s0)
1c00999c:	4422                	lw	s0,8(sp)
1c00999e:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c0099a2:	4492                	lw	s1,4(sp)
1c0099a4:	4902                	lw	s2,0(sp)
1c0099a6:	0141                	addi	sp,sp,16
1c0099a8:	8082                	ret

1c0099aa <__rt_event_init>:
1c0099aa:	02052023          	sw	zero,32(a0)
1c0099ae:	02052223          	sw	zero,36(a0)
1c0099b2:	02052823          	sw	zero,48(a0)
1c0099b6:	00052023          	sw	zero,0(a0)
1c0099ba:	8082                	ret

1c0099bc <__rt_wait_event_prepare_blocking>:
1c0099bc:	02400793          	li	a5,36
1c0099c0:	4388                	lw	a0,0(a5)
1c0099c2:	4d18                	lw	a4,24(a0)
1c0099c4:	02052223          	sw	zero,36(a0)
1c0099c8:	c398                	sw	a4,0(a5)
1c0099ca:	4785                	li	a5,1
1c0099cc:	d11c                	sw	a5,32(a0)
1c0099ce:	00052023          	sw	zero,0(a0)
1c0099d2:	8082                	ret

1c0099d4 <rt_event_alloc>:
1c0099d4:	1141                	addi	sp,sp,-16
1c0099d6:	c422                	sw	s0,8(sp)
1c0099d8:	842e                	mv	s0,a1
1c0099da:	c606                	sw	ra,12(sp)
1c0099dc:	c226                	sw	s1,4(sp)
1c0099de:	300474f3          	csrrci	s1,mstatus,8
1c0099e2:	f14027f3          	csrr	a5,mhartid
1c0099e6:	8795                	srai	a5,a5,0x5
1c0099e8:	03f7f793          	andi	a5,a5,63
1c0099ec:	477d                	li	a4,31
1c0099ee:	00378513          	addi	a0,a5,3
1c0099f2:	00e79363          	bne	a5,a4,1c0099f8 <rt_event_alloc+0x24>
1c0099f6:	4501                	li	a0,0
1c0099f8:	08c00593          	li	a1,140
1c0099fc:	02b405b3          	mul	a1,s0,a1
1c009a00:	884ff0ef          	jal	ra,1c008a84 <rt_alloc>
1c009a04:	87aa                	mv	a5,a0
1c009a06:	557d                	li	a0,-1
1c009a08:	cf91                	beqz	a5,1c009a24 <rt_event_alloc+0x50>
1c009a0a:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009a0e:	4581                	li	a1,0
1c009a10:	4601                	li	a2,0
1c009a12:	02400713          	li	a4,36
1c009a16:	00864c63          	blt	a2,s0,1c009a2e <rt_event_alloc+0x5a>
1c009a1a:	c191                	beqz	a1,1c009a1e <rt_event_alloc+0x4a>
1c009a1c:	c314                	sw	a3,0(a4)
1c009a1e:	30049073          	csrw	mstatus,s1
1c009a22:	4501                	li	a0,0
1c009a24:	40b2                	lw	ra,12(sp)
1c009a26:	4422                	lw	s0,8(sp)
1c009a28:	4492                	lw	s1,4(sp)
1c009a2a:	0141                	addi	sp,sp,16
1c009a2c:	8082                	ret
1c009a2e:	cf94                	sw	a3,24(a5)
1c009a30:	0207a023          	sw	zero,32(a5)
1c009a34:	0207a223          	sw	zero,36(a5)
1c009a38:	0207a823          	sw	zero,48(a5)
1c009a3c:	0007a023          	sw	zero,0(a5)
1c009a40:	86be                	mv	a3,a5
1c009a42:	0605                	addi	a2,a2,1
1c009a44:	4585                	li	a1,1
1c009a46:	08c78793          	addi	a5,a5,140
1c009a4a:	b7f1                	j	1c009a16 <rt_event_alloc+0x42>

1c009a4c <rt_event_get>:
1c009a4c:	30047773          	csrrci	a4,mstatus,8
1c009a50:	02400793          	li	a5,36
1c009a54:	4388                	lw	a0,0(a5)
1c009a56:	c509                	beqz	a0,1c009a60 <rt_event_get+0x14>
1c009a58:	4d14                	lw	a3,24(a0)
1c009a5a:	c150                	sw	a2,4(a0)
1c009a5c:	c394                	sw	a3,0(a5)
1c009a5e:	c10c                	sw	a1,0(a0)
1c009a60:	30071073          	csrw	mstatus,a4
1c009a64:	8082                	ret

1c009a66 <rt_event_get_blocking>:
1c009a66:	30047773          	csrrci	a4,mstatus,8
1c009a6a:	02400793          	li	a5,36
1c009a6e:	4388                	lw	a0,0(a5)
1c009a70:	c909                	beqz	a0,1c009a82 <rt_event_get_blocking+0x1c>
1c009a72:	4d14                	lw	a3,24(a0)
1c009a74:	00052223          	sw	zero,4(a0)
1c009a78:	c394                	sw	a3,0(a5)
1c009a7a:	4785                	li	a5,1
1c009a7c:	00052023          	sw	zero,0(a0)
1c009a80:	d11c                	sw	a5,32(a0)
1c009a82:	30071073          	csrw	mstatus,a4
1c009a86:	8082                	ret

1c009a88 <rt_event_push>:
1c009a88:	30047773          	csrrci	a4,mstatus,8
1c009a8c:	02400693          	li	a3,36
1c009a90:	42d4                	lw	a3,4(a3)
1c009a92:	00052c23          	sw	zero,24(a0)
1c009a96:	02400793          	li	a5,36
1c009a9a:	e691                	bnez	a3,1c009aa6 <rt_event_push+0x1e>
1c009a9c:	c3c8                	sw	a0,4(a5)
1c009a9e:	c788                	sw	a0,8(a5)
1c009aa0:	30071073          	csrw	mstatus,a4
1c009aa4:	8082                	ret
1c009aa6:	4794                	lw	a3,8(a5)
1c009aa8:	ce88                	sw	a0,24(a3)
1c009aaa:	bfd5                	j	1c009a9e <rt_event_push+0x16>

1c009aac <__rt_event_execute>:
1c009aac:	1141                	addi	sp,sp,-16
1c009aae:	c422                	sw	s0,8(sp)
1c009ab0:	02400793          	li	a5,36
1c009ab4:	43dc                	lw	a5,4(a5)
1c009ab6:	c606                	sw	ra,12(sp)
1c009ab8:	c226                	sw	s1,4(sp)
1c009aba:	02400413          	li	s0,36
1c009abe:	eb91                	bnez	a5,1c009ad2 <__rt_event_execute+0x26>
1c009ac0:	c1a9                	beqz	a1,1c009b02 <__rt_event_execute+0x56>
1c009ac2:	10500073          	wfi
1c009ac6:	30045073          	csrwi	mstatus,8
1c009aca:	300477f3          	csrrci	a5,mstatus,8
1c009ace:	405c                	lw	a5,4(s0)
1c009ad0:	cb8d                	beqz	a5,1c009b02 <__rt_event_execute+0x56>
1c009ad2:	4485                	li	s1,1
1c009ad4:	4f98                	lw	a4,24(a5)
1c009ad6:	53d4                	lw	a3,36(a5)
1c009ad8:	00978823          	sb	s1,16(a5)
1c009adc:	c058                	sw	a4,4(s0)
1c009ade:	43c8                	lw	a0,4(a5)
1c009ae0:	4398                	lw	a4,0(a5)
1c009ae2:	e691                	bnez	a3,1c009aee <__rt_event_execute+0x42>
1c009ae4:	5394                	lw	a3,32(a5)
1c009ae6:	e681                	bnez	a3,1c009aee <__rt_event_execute+0x42>
1c009ae8:	4014                	lw	a3,0(s0)
1c009aea:	c01c                	sw	a5,0(s0)
1c009aec:	cf94                	sw	a3,24(a5)
1c009aee:	0207a023          	sw	zero,32(a5)
1c009af2:	c711                	beqz	a4,1c009afe <__rt_event_execute+0x52>
1c009af4:	30045073          	csrwi	mstatus,8
1c009af8:	9702                	jalr	a4
1c009afa:	300477f3          	csrrci	a5,mstatus,8
1c009afe:	405c                	lw	a5,4(s0)
1c009b00:	fbf1                	bnez	a5,1c009ad4 <__rt_event_execute+0x28>
1c009b02:	40b2                	lw	ra,12(sp)
1c009b04:	4422                	lw	s0,8(sp)
1c009b06:	4492                	lw	s1,4(sp)
1c009b08:	0141                	addi	sp,sp,16
1c009b0a:	8082                	ret

1c009b0c <__rt_wait_event>:
1c009b0c:	1141                	addi	sp,sp,-16
1c009b0e:	c422                	sw	s0,8(sp)
1c009b10:	c606                	sw	ra,12(sp)
1c009b12:	842a                	mv	s0,a0
1c009b14:	501c                	lw	a5,32(s0)
1c009b16:	ef81                	bnez	a5,1c009b2e <__rt_wait_event+0x22>
1c009b18:	581c                	lw	a5,48(s0)
1c009b1a:	eb91                	bnez	a5,1c009b2e <__rt_wait_event+0x22>
1c009b1c:	02400793          	li	a5,36
1c009b20:	4398                	lw	a4,0(a5)
1c009b22:	40b2                	lw	ra,12(sp)
1c009b24:	c380                	sw	s0,0(a5)
1c009b26:	cc18                	sw	a4,24(s0)
1c009b28:	4422                	lw	s0,8(sp)
1c009b2a:	0141                	addi	sp,sp,16
1c009b2c:	8082                	ret
1c009b2e:	4585                	li	a1,1
1c009b30:	4501                	li	a0,0
1c009b32:	3fad                	jal	1c009aac <__rt_event_execute>
1c009b34:	b7c5                	j	1c009b14 <__rt_wait_event+0x8>

1c009b36 <rt_event_wait>:
1c009b36:	1141                	addi	sp,sp,-16
1c009b38:	c606                	sw	ra,12(sp)
1c009b3a:	c422                	sw	s0,8(sp)
1c009b3c:	30047473          	csrrci	s0,mstatus,8
1c009b40:	37f1                	jal	1c009b0c <__rt_wait_event>
1c009b42:	30041073          	csrw	mstatus,s0
1c009b46:	40b2                	lw	ra,12(sp)
1c009b48:	4422                	lw	s0,8(sp)
1c009b4a:	0141                	addi	sp,sp,16
1c009b4c:	8082                	ret

1c009b4e <__rt_event_sched_init>:
1c009b4e:	02400513          	li	a0,36
1c009b52:	00052023          	sw	zero,0(a0)
1c009b56:	00052223          	sw	zero,4(a0)
1c009b5a:	4585                	li	a1,1
1c009b5c:	0511                	addi	a0,a0,4
1c009b5e:	bd9d                	j	1c0099d4 <rt_event_alloc>

1c009b60 <__rt_fll_set_freq>:
1c009b60:	1141                	addi	sp,sp,-16
1c009b62:	c422                	sw	s0,8(sp)
1c009b64:	c226                	sw	s1,4(sp)
1c009b66:	c606                	sw	ra,12(sp)
1c009b68:	842a                	mv	s0,a0
1c009b6a:	84ae                	mv	s1,a1
1c009b6c:	e111                	bnez	a0,1c009b70 <__rt_fll_set_freq+0x10>
1c009b6e:	3965                	jal	1c009826 <__rt_bridge_req_shutdown>
1c009b70:	8526                	mv	a0,s1
1c009b72:	983fe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009b76:	1579                	addi	a0,a0,-2
1c009b78:	00155793          	srli	a5,a0,0x1
1c009b7c:	e391                	bnez	a5,1c009b80 <__rt_fll_set_freq+0x20>
1c009b7e:	4785                	li	a5,1
1c009b80:	fff78713          	addi	a4,a5,-1
1c009b84:	4505                	li	a0,1
1c009b86:	00e51533          	sll	a0,a0,a4
1c009b8a:	00f494b3          	sll	s1,s1,a5
1c009b8e:	7761                	lui	a4,0xffff8
1c009b90:	8f65                	and	a4,a4,s1
1c009b92:	1c0026b7          	lui	a3,0x1c002
1c009b96:	953a                	add	a0,a0,a4
1c009b98:	94068693          	addi	a3,a3,-1728 # 1c001940 <__rt_fll_freq>
1c009b9c:	00241713          	slli	a4,s0,0x2
1c009ba0:	9736                	add	a4,a4,a3
1c009ba2:	00f55533          	srl	a0,a0,a5
1c009ba6:	c308                	sw	a0,0(a4)
1c009ba8:	1c002737          	lui	a4,0x1c002
1c009bac:	8dc70713          	addi	a4,a4,-1828 # 1c0018dc <__rt_fll_is_on>
1c009bb0:	9722                	add	a4,a4,s0
1c009bb2:	00074703          	lbu	a4,0(a4)
1c009bb6:	c715                	beqz	a4,1c009be2 <__rt_fll_set_freq+0x82>
1c009bb8:	1a100737          	lui	a4,0x1a100
1c009bbc:	0711                	addi	a4,a4,4
1c009bbe:	0412                	slli	s0,s0,0x4
1c009bc0:	943a                	add	s0,s0,a4
1c009bc2:	4018                	lw	a4,0(s0)
1c009bc4:	80bd                	srli	s1,s1,0xf
1c009bc6:	76c1                	lui	a3,0xffff0
1c009bc8:	04c2                	slli	s1,s1,0x10
1c009bca:	8f75                	and	a4,a4,a3
1c009bcc:	80c1                	srli	s1,s1,0x10
1c009bce:	0785                	addi	a5,a5,1
1c009bd0:	c40006b7          	lui	a3,0xc4000
1c009bd4:	8f45                	or	a4,a4,s1
1c009bd6:	8bbd                	andi	a5,a5,15
1c009bd8:	16fd                	addi	a3,a3,-1
1c009bda:	07ea                	slli	a5,a5,0x1a
1c009bdc:	8f75                	and	a4,a4,a3
1c009bde:	8fd9                	or	a5,a5,a4
1c009be0:	c01c                	sw	a5,0(s0)
1c009be2:	40b2                	lw	ra,12(sp)
1c009be4:	4422                	lw	s0,8(sp)
1c009be6:	4492                	lw	s1,4(sp)
1c009be8:	0141                	addi	sp,sp,16
1c009bea:	8082                	ret

1c009bec <__rt_fll_init>:
1c009bec:	1141                	addi	sp,sp,-16
1c009bee:	1a1005b7          	lui	a1,0x1a100
1c009bf2:	00451613          	slli	a2,a0,0x4
1c009bf6:	c226                	sw	s1,4(sp)
1c009bf8:	84aa                	mv	s1,a0
1c009bfa:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fffe4>
1c009bfe:	9532                	add	a0,a0,a2
1c009c00:	4114                	lw	a3,0(a0)
1c009c02:	c606                	sw	ra,12(sp)
1c009c04:	c422                	sw	s0,8(sp)
1c009c06:	87b6                	mv	a5,a3
1c009c08:	0406c963          	bltz	a3,1c009c5a <__rt_fll_init+0x6e>
1c009c0c:	00858793          	addi	a5,a1,8
1c009c10:	97b2                	add	a5,a5,a2
1c009c12:	4398                	lw	a4,0(a5)
1c009c14:	7841                	lui	a6,0xffff0
1c009c16:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009c1a:	01077733          	and	a4,a4,a6
1c009c1e:	6809                	lui	a6,0x2
1c009c20:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009c24:	01076733          	or	a4,a4,a6
1c009c28:	f0010837          	lui	a6,0xf0010
1c009c2c:	187d                	addi	a6,a6,-1
1c009c2e:	01077733          	and	a4,a4,a6
1c009c32:	00500837          	lui	a6,0x500
1c009c36:	01076733          	or	a4,a4,a6
1c009c3a:	05b1                	addi	a1,a1,12
1c009c3c:	c398                	sw	a4,0(a5)
1c009c3e:	962e                	add	a2,a2,a1
1c009c40:	421c                	lw	a5,0(a2)
1c009c42:	fc010737          	lui	a4,0xfc010
1c009c46:	177d                	addi	a4,a4,-1
1c009c48:	8ff9                	and	a5,a5,a4
1c009c4a:	014c0737          	lui	a4,0x14c0
1c009c4e:	8fd9                	or	a5,a5,a4
1c009c50:	c21c                	sw	a5,0(a2)
1c009c52:	c00007b7          	lui	a5,0xc0000
1c009c56:	8fd5                	or	a5,a5,a3
1c009c58:	c11c                	sw	a5,0(a0)
1c009c5a:	1c002637          	lui	a2,0x1c002
1c009c5e:	00249713          	slli	a4,s1,0x2
1c009c62:	94060613          	addi	a2,a2,-1728 # 1c001940 <__rt_fll_freq>
1c009c66:	9732                	add	a4,a4,a2
1c009c68:	4300                	lw	s0,0(a4)
1c009c6a:	c015                	beqz	s0,1c009c8e <__rt_fll_init+0xa2>
1c009c6c:	85a2                	mv	a1,s0
1c009c6e:	8526                	mv	a0,s1
1c009c70:	3dc5                	jal	1c009b60 <__rt_fll_set_freq>
1c009c72:	1c002537          	lui	a0,0x1c002
1c009c76:	8dc50513          	addi	a0,a0,-1828 # 1c0018dc <__rt_fll_is_on>
1c009c7a:	9526                	add	a0,a0,s1
1c009c7c:	4785                	li	a5,1
1c009c7e:	00f50023          	sb	a5,0(a0)
1c009c82:	40b2                	lw	ra,12(sp)
1c009c84:	8522                	mv	a0,s0
1c009c86:	4422                	lw	s0,8(sp)
1c009c88:	4492                	lw	s1,4(sp)
1c009c8a:	0141                	addi	sp,sp,16
1c009c8c:	8082                	ret
1c009c8e:	06c2                	slli	a3,a3,0x10
1c009c90:	83e9                	srli	a5,a5,0x1a
1c009c92:	82c1                	srli	a3,a3,0x10
1c009c94:	8bbd                	andi	a5,a5,15
1c009c96:	06be                	slli	a3,a3,0xf
1c009c98:	17fd                	addi	a5,a5,-1
1c009c9a:	00f6d433          	srl	s0,a3,a5
1c009c9e:	c300                	sw	s0,0(a4)
1c009ca0:	bfc9                	j	1c009c72 <__rt_fll_init+0x86>

1c009ca2 <__rt_fll_deinit>:
1c009ca2:	1c0027b7          	lui	a5,0x1c002
1c009ca6:	8dc78793          	addi	a5,a5,-1828 # 1c0018dc <__rt_fll_is_on>
1c009caa:	953e                	add	a0,a0,a5
1c009cac:	00050023          	sb	zero,0(a0)
1c009cb0:	8082                	ret

1c009cb2 <__rt_flls_constructor>:
1c009cb2:	1c0027b7          	lui	a5,0x1c002
1c009cb6:	9407a023          	sw	zero,-1728(a5) # 1c001940 <__rt_fll_freq>
1c009cba:	94078793          	addi	a5,a5,-1728
1c009cbe:	0007a223          	sw	zero,4(a5)
1c009cc2:	1c0027b7          	lui	a5,0x1c002
1c009cc6:	8c079e23          	sh	zero,-1828(a5) # 1c0018dc <__rt_fll_is_on>
1c009cca:	8082                	ret

1c009ccc <gcd>:
1c009ccc:	cd19                	beqz	a0,1c009cea <gcd+0x1e>
1c009cce:	cd81                	beqz	a1,1c009ce6 <gcd+0x1a>
1c009cd0:	00054463          	bltz	a0,1c009cd8 <gcd+0xc>
1c009cd4:	0005d563          	bgez	a1,1c009cde <gcd+0x12>
1c009cd8:	55fd                	li	a1,-1
1c009cda:	a031                	j	1c009ce6 <gcd+0x1a>
1c009cdc:	85be                	mv	a1,a5
1c009cde:	02b567b3          	rem	a5,a0,a1
1c009ce2:	852e                	mv	a0,a1
1c009ce4:	ffe5                	bnez	a5,1c009cdc <gcd+0x10>
1c009ce6:	852e                	mv	a0,a1
1c009ce8:	8082                	ret
1c009cea:	4581                	li	a1,0
1c009cec:	bfed                	j	1c009ce6 <gcd+0x1a>

1c009cee <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009cee:	1101                	addi	sp,sp,-32
1c009cf0:	1c0027b7          	lui	a5,0x1c002
1c009cf4:	c84a                	sw	s2,16(sp)
1c009cf6:	8e07a903          	lw	s2,-1824(a5) # 1c0018e0 <__rt_periph_lcm>
1c009cfa:	c452                	sw	s4,8(sp)
1c009cfc:	8a2e                	mv	s4,a1
1c009cfe:	85ca                	mv	a1,s2
1c009d00:	ce06                	sw	ra,28(sp)
1c009d02:	cc22                	sw	s0,24(sp)
1c009d04:	ca26                	sw	s1,20(sp)
1c009d06:	842a                	mv	s0,a0
1c009d08:	c64e                	sw	s3,12(sp)
1c009d0a:	89aa                	mv	s3,a0
1c009d0c:	37c1                	jal	1c009ccc <gcd>
1c009d0e:	02a44533          	div	a0,s0,a0
1c009d12:	03250933          	mul	s2,a0,s2
1c009d16:	4511                	li	a0,4
1c009d18:	82dff0ef          	jal	ra,1c009544 <__rt_cbsys_exec>
1c009d1c:	1c0027b7          	lui	a5,0x1c002
1c009d20:	9407a783          	lw	a5,-1728(a5) # 1c001940 <__rt_fll_freq>
1c009d24:	028954b3          	divu	s1,s2,s0
1c009d28:	0527f263          	bleu	s2,a5,1c009d6c <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009d2c:	1a1047b7          	lui	a5,0x1a104
1c009d30:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040b4>
1c009d34:	4705                	li	a4,1
1c009d36:	0ce7ae23          	sw	a4,220(a5)
1c009d3a:	85a2                	mv	a1,s0
1c009d3c:	4501                	li	a0,0
1c009d3e:	350d                	jal	1c009b60 <__rt_fll_set_freq>
1c009d40:	57fd                	li	a5,-1
1c009d42:	00fa0963          	beq	s4,a5,1c009d54 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009d46:	c099                	beqz	s1,1c009d4c <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009d48:	029459b3          	divu	s3,s0,s1
1c009d4c:	1c0027b7          	lui	a5,0x1c002
1c009d50:	9537a423          	sw	s3,-1720(a5) # 1c001948 <__rt_freq_domains>
1c009d54:	4515                	li	a0,5
1c009d56:	feeff0ef          	jal	ra,1c009544 <__rt_cbsys_exec>
1c009d5a:	40f2                	lw	ra,28(sp)
1c009d5c:	4462                	lw	s0,24(sp)
1c009d5e:	44d2                	lw	s1,20(sp)
1c009d60:	4942                	lw	s2,16(sp)
1c009d62:	49b2                	lw	s3,12(sp)
1c009d64:	4a22                	lw	s4,8(sp)
1c009d66:	4501                	li	a0,0
1c009d68:	6105                	addi	sp,sp,32
1c009d6a:	8082                	ret
1c009d6c:	85a2                	mv	a1,s0
1c009d6e:	4501                	li	a0,0
1c009d70:	3bc5                	jal	1c009b60 <__rt_fll_set_freq>
1c009d72:	1a1047b7          	lui	a5,0x1a104
1c009d76:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040b4>
1c009d7a:	4705                	li	a4,1
1c009d7c:	0ce7ae23          	sw	a4,220(a5)
1c009d80:	b7c1                	j	1c009d40 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009d82 <rt_freq_set_and_get>:
1c009d82:	1141                	addi	sp,sp,-16
1c009d84:	852e                	mv	a0,a1
1c009d86:	c606                	sw	ra,12(sp)
1c009d88:	c422                	sw	s0,8(sp)
1c009d8a:	30047473          	csrrci	s0,mstatus,8
1c009d8e:	4581                	li	a1,0
1c009d90:	3fb9                	jal	1c009cee <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009d92:	30041073          	csrw	mstatus,s0
1c009d96:	40b2                	lw	ra,12(sp)
1c009d98:	4422                	lw	s0,8(sp)
1c009d9a:	00a03533          	snez	a0,a0
1c009d9e:	40a00533          	neg	a0,a0
1c009da2:	0141                	addi	sp,sp,16
1c009da4:	8082                	ret

1c009da6 <__rt_freq_init>:
1c009da6:	1141                	addi	sp,sp,-16
1c009da8:	c422                	sw	s0,8(sp)
1c009daa:	c606                	sw	ra,12(sp)
1c009dac:	3719                	jal	1c009cb2 <__rt_flls_constructor>
1c009dae:	1c0017b7          	lui	a5,0x1c001
1c009db2:	7ec7a703          	lw	a4,2028(a5) # 1c0017ec <__rt_platform>
1c009db6:	4785                	li	a5,1
1c009db8:	1c002437          	lui	s0,0x1c002
1c009dbc:	02f70663          	beq	a4,a5,1c009de8 <__rt_freq_init+0x42>
1c009dc0:	4501                	li	a0,0
1c009dc2:	352d                	jal	1c009bec <__rt_fll_init>
1c009dc4:	94a42423          	sw	a0,-1720(s0) # 1c001948 <__rt_freq_domains>
1c009dc8:	1a1047b7          	lui	a5,0x1a104
1c009dcc:	4709                	li	a4,2
1c009dce:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1040b0>
1c009dd2:	4705                	li	a4,1
1c009dd4:	0ce7ac23          	sw	a4,216(a5)
1c009dd8:	40b2                	lw	ra,12(sp)
1c009dda:	4422                	lw	s0,8(sp)
1c009ddc:	0ce7ae23          	sw	a4,220(a5)
1c009de0:	0ce7aa23          	sw	a4,212(a5)
1c009de4:	0141                	addi	sp,sp,16
1c009de6:	8082                	ret
1c009de8:	026267b7          	lui	a5,0x2626
1c009dec:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2615a20>
1c009df0:	94f42423          	sw	a5,-1720(s0)
1c009df4:	bfd1                	j	1c009dc8 <__rt_freq_init+0x22>

1c009df6 <hal_itc_wait_for_event_noirq>:
1c009df6:	1a10a7b7          	lui	a5,0x1a10a
1c009dfa:	300476f3          	csrrci	a3,mstatus,8
1c009dfe:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1097ec>
1c009e02:	8f69                	and	a4,a4,a0
1c009e04:	eb11                	bnez	a4,1c009e18 <hal_itc_wait_for_event_noirq+0x22>
1c009e06:	80a7a223          	sw	a0,-2044(a5)
1c009e0a:	10500073          	wfi
1c009e0e:	80a7a423          	sw	a0,-2040(a5)
1c009e12:	30069073          	csrw	mstatus,a3
1c009e16:	b7d5                	j	1c009dfa <hal_itc_wait_for_event_noirq+0x4>
1c009e18:	80a7aa23          	sw	a0,-2028(a5)
1c009e1c:	30069073          	csrw	mstatus,a3
1c009e20:	8082                	ret

1c009e22 <__rt_pmu_cluster_power_down>:
1c009e22:	1a1047b7          	lui	a5,0x1a104
1c009e26:	5bbc                	lw	a5,112(a5)
1c009e28:	01079713          	slli	a4,a5,0x10
1c009e2c:	02074c63          	bltz	a4,1c009e64 <__rt_pmu_cluster_power_down+0x42>
1c009e30:	1141                	addi	sp,sp,-16
1c009e32:	c422                	sw	s0,8(sp)
1c009e34:	c606                	sw	ra,12(sp)
1c009e36:	c226                	sw	s1,4(sp)
1c009e38:	1a104437          	lui	s0,0x1a104
1c009e3c:	547c                	lw	a5,108(s0)
1c009e3e:	e385                	bnez	a5,1c009e5e <__rt_pmu_cluster_power_down+0x3c>
1c009e40:	4485                	li	s1,1
1c009e42:	c444                	sw	s1,12(s0)
1c009e44:	478d                	li	a5,3
1c009e46:	d83c                	sw	a5,112(s0)
1c009e48:	00800537          	lui	a0,0x800
1c009e4c:	376d                	jal	1c009df6 <hal_itc_wait_for_event_noirq>
1c009e4e:	d824                	sw	s1,112(s0)
1c009e50:	4422                	lw	s0,8(sp)
1c009e52:	40b2                	lw	ra,12(sp)
1c009e54:	4492                	lw	s1,4(sp)
1c009e56:	00400537          	lui	a0,0x400
1c009e5a:	0141                	addi	sp,sp,16
1c009e5c:	bf69                	j	1c009df6 <hal_itc_wait_for_event_noirq>
1c009e5e:	4505                	li	a0,1
1c009e60:	2a11                	jal	1c009f74 <rt_time_wait_us>
1c009e62:	bfe9                	j	1c009e3c <__rt_pmu_cluster_power_down+0x1a>
1c009e64:	8082                	ret

1c009e66 <__rt_pmu_cluster_power_up>:
1c009e66:	1141                	addi	sp,sp,-16
1c009e68:	c606                	sw	ra,12(sp)
1c009e6a:	c422                	sw	s0,8(sp)
1c009e6c:	478d                	li	a5,3
1c009e6e:	1a104437          	lui	s0,0x1a104
1c009e72:	d83c                	sw	a5,112(s0)
1c009e74:	00400537          	lui	a0,0x400
1c009e78:	3fbd                	jal	1c009df6 <hal_itc_wait_for_event_noirq>
1c009e7a:	02700793          	li	a5,39
1c009e7e:	d83c                	sw	a5,112(s0)
1c009e80:	00800537          	lui	a0,0x800
1c009e84:	3f8d                	jal	1c009df6 <hal_itc_wait_for_event_noirq>
1c009e86:	6791                	lui	a5,0x4
1c009e88:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa103fec>
1c009e8c:	02778793          	addi	a5,a5,39 # 4027 <__rt_hyper_pending_emu_stride+0x3d7f>
1c009e90:	d83c                	sw	a5,112(s0)
1c009e92:	40b2                	lw	ra,12(sp)
1c009e94:	4422                	lw	s0,8(sp)
1c009e96:	4505                	li	a0,1
1c009e98:	0141                	addi	sp,sp,16
1c009e9a:	8082                	ret

1c009e9c <__rt_pmu_init>:
1c009e9c:	1a1077b7          	lui	a5,0x1a107
1c009ea0:	4741                	li	a4,16
1c009ea2:	cb98                	sw	a4,16(a5)
1c009ea4:	1a10a7b7          	lui	a5,0x1a10a
1c009ea8:	02000737          	lui	a4,0x2000
1c009eac:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa1097f4>
1c009eb0:	4709                	li	a4,2
1c009eb2:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c009eb6:	8082                	ret

1c009eb8 <rt_padframe_set>:
1c009eb8:	300476f3          	csrrci	a3,mstatus,8
1c009ebc:	4158                	lw	a4,4(a0)
1c009ebe:	1a1047b7          	lui	a5,0x1a104
1c009ec2:	4310                	lw	a2,0(a4)
1c009ec4:	cb90                	sw	a2,16(a5)
1c009ec6:	4350                	lw	a2,4(a4)
1c009ec8:	cbd0                	sw	a2,20(a5)
1c009eca:	4710                	lw	a2,8(a4)
1c009ecc:	cf90                	sw	a2,24(a5)
1c009ece:	4758                	lw	a4,12(a4)
1c009ed0:	cfd8                	sw	a4,28(a5)
1c009ed2:	30069073          	csrw	mstatus,a3
1c009ed6:	8082                	ret

1c009ed8 <__rt_padframe_init>:
1c009ed8:	1c001537          	lui	a0,0x1c001
1c009edc:	f1c50513          	addi	a0,a0,-228 # 1c000f1c <__rt_padframe_profiles>
1c009ee0:	bfe1                	j	1c009eb8 <rt_padframe_set>

1c009ee2 <__rt_time_poweroff>:
1c009ee2:	1a10b7b7          	lui	a5,0x1a10b
1c009ee6:	47d8                	lw	a4,12(a5)
1c009ee8:	1c0027b7          	lui	a5,0x1c002
1c009eec:	4501                	li	a0,0
1c009eee:	8ee7a223          	sw	a4,-1820(a5) # 1c0018e4 <timer_count>
1c009ef2:	8082                	ret

1c009ef4 <__rt_time_poweron>:
1c009ef4:	1c0027b7          	lui	a5,0x1c002
1c009ef8:	8e47a703          	lw	a4,-1820(a5) # 1c0018e4 <timer_count>
1c009efc:	1a10b7b7          	lui	a5,0x1a10b
1c009f00:	4501                	li	a0,0
1c009f02:	c7d8                	sw	a4,12(a5)
1c009f04:	8082                	ret

1c009f06 <rt_event_push_delayed>:
1c009f06:	30047373          	csrrci	t1,mstatus,8
1c009f0a:	1a10b6b7          	lui	a3,0x1a10b
1c009f0e:	46d0                	lw	a2,12(a3)
1c009f10:	1c002737          	lui	a4,0x1c002
1c009f14:	95072783          	lw	a5,-1712(a4) # 1c001950 <first_delayed>
1c009f18:	86ba                	mv	a3,a4
1c009f1a:	0005d363          	bgez	a1,1c009f20 <rt_event_push_delayed+0x1a>
1c009f1e:	4581                	li	a1,0
1c009f20:	4779                	li	a4,30
1c009f22:	02e5c5b3          	div	a1,a1,a4
1c009f26:	80000737          	lui	a4,0x80000
1c009f2a:	fff74713          	not	a4,a4
1c009f2e:	00e67833          	and	a6,a2,a4
1c009f32:	0585                	addi	a1,a1,1
1c009f34:	962e                	add	a2,a2,a1
1c009f36:	d950                	sw	a2,52(a0)
1c009f38:	982e                	add	a6,a6,a1
1c009f3a:	4601                	li	a2,0
1c009f3c:	c799                	beqz	a5,1c009f4a <rt_event_push_delayed+0x44>
1c009f3e:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa10b014>
1c009f42:	00e8f8b3          	and	a7,a7,a4
1c009f46:	0108e863          	bltu	a7,a6,1c009f56 <rt_event_push_delayed+0x50>
1c009f4a:	ca09                	beqz	a2,1c009f5c <rt_event_push_delayed+0x56>
1c009f4c:	ce08                	sw	a0,24(a2)
1c009f4e:	cd1c                	sw	a5,24(a0)
1c009f50:	30031073          	csrw	mstatus,t1
1c009f54:	8082                	ret
1c009f56:	863e                	mv	a2,a5
1c009f58:	4f9c                	lw	a5,24(a5)
1c009f5a:	b7cd                	j	1c009f3c <rt_event_push_delayed+0x36>
1c009f5c:	cd1c                	sw	a5,24(a0)
1c009f5e:	1a10b7b7          	lui	a5,0x1a10b
1c009f62:	47d8                	lw	a4,12(a5)
1c009f64:	94a6a823          	sw	a0,-1712(a3) # 1a10a950 <__l1_end+0xa10a930>
1c009f68:	95ba                	add	a1,a1,a4
1c009f6a:	cbcc                	sw	a1,20(a5)
1c009f6c:	08500713          	li	a4,133
1c009f70:	c3d8                	sw	a4,4(a5)
1c009f72:	bff9                	j	1c009f50 <rt_event_push_delayed+0x4a>

1c009f74 <rt_time_wait_us>:
1c009f74:	1101                	addi	sp,sp,-32
1c009f76:	85aa                	mv	a1,a0
1c009f78:	4501                	li	a0,0
1c009f7a:	ce06                	sw	ra,28(sp)
1c009f7c:	cc22                	sw	s0,24(sp)
1c009f7e:	c62e                	sw	a1,12(sp)
1c009f80:	34dd                	jal	1c009a66 <rt_event_get_blocking>
1c009f82:	45b2                	lw	a1,12(sp)
1c009f84:	842a                	mv	s0,a0
1c009f86:	3741                	jal	1c009f06 <rt_event_push_delayed>
1c009f88:	8522                	mv	a0,s0
1c009f8a:	4462                	lw	s0,24(sp)
1c009f8c:	40f2                	lw	ra,28(sp)
1c009f8e:	6105                	addi	sp,sp,32
1c009f90:	b65d                	j	1c009b36 <rt_event_wait>

1c009f92 <__rt_time_init>:
1c009f92:	1141                	addi	sp,sp,-16
1c009f94:	1c0027b7          	lui	a5,0x1c002
1c009f98:	9407a823          	sw	zero,-1712(a5) # 1c001950 <first_delayed>
1c009f9c:	08300713          	li	a4,131
1c009fa0:	1a10b7b7          	lui	a5,0x1a10b
1c009fa4:	c606                	sw	ra,12(sp)
1c009fa6:	c422                	sw	s0,8(sp)
1c009fa8:	1c00a5b7          	lui	a1,0x1c00a
1c009fac:	c3d8                	sw	a4,4(a5)
1c009fae:	02a58593          	addi	a1,a1,42 # 1c00a02a <__rt_timer_handler>
1c009fb2:	452d                	li	a0,11
1c009fb4:	bc0ff0ef          	jal	ra,1c009374 <rt_irq_set_handler>
1c009fb8:	f14027f3          	csrr	a5,mhartid
1c009fbc:	8795                	srai	a5,a5,0x5
1c009fbe:	6705                	lui	a4,0x1
1c009fc0:	03f7f793          	andi	a5,a5,63
1c009fc4:	46fd                	li	a3,31
1c009fc6:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009fca:	04d79863          	bne	a5,a3,1c00a01a <__rt_time_init+0x88>
1c009fce:	1a10a7b7          	lui	a5,0x1a10a
1c009fd2:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c009fd6:	1c00a5b7          	lui	a1,0x1c00a
1c009fda:	4601                	li	a2,0
1c009fdc:	ee258593          	addi	a1,a1,-286 # 1c009ee2 <__rt_time_poweroff>
1c009fe0:	4509                	li	a0,2
1c009fe2:	d22ff0ef          	jal	ra,1c009504 <__rt_cbsys_add>
1c009fe6:	1c00a5b7          	lui	a1,0x1c00a
1c009fea:	842a                	mv	s0,a0
1c009fec:	4601                	li	a2,0
1c009fee:	ef458593          	addi	a1,a1,-268 # 1c009ef4 <__rt_time_poweron>
1c009ff2:	450d                	li	a0,3
1c009ff4:	d10ff0ef          	jal	ra,1c009504 <__rt_cbsys_add>
1c009ff8:	8d41                	or	a0,a0,s0
1c009ffa:	c505                	beqz	a0,1c00a022 <__rt_time_init+0x90>
1c009ffc:	f1402673          	csrr	a2,mhartid
1c00a000:	1c000537          	lui	a0,0x1c000
1c00a004:	40565593          	srai	a1,a2,0x5
1c00a008:	03f5f593          	andi	a1,a1,63
1c00a00c:	8a7d                	andi	a2,a2,31
1c00a00e:	46850513          	addi	a0,a0,1128 # 1c000468 <__DTOR_END__+0x17c>
1c00a012:	015000ef          	jal	ra,1c00a826 <printf>
1c00a016:	79c000ef          	jal	ra,1c00a7b2 <abort>
1c00a01a:	002047b7          	lui	a5,0x204
1c00a01e:	cbd8                	sw	a4,20(a5)
1c00a020:	bf5d                	j	1c009fd6 <__rt_time_init+0x44>
1c00a022:	40b2                	lw	ra,12(sp)
1c00a024:	4422                	lw	s0,8(sp)
1c00a026:	0141                	addi	sp,sp,16
1c00a028:	8082                	ret

1c00a02a <__rt_timer_handler>:
1c00a02a:	7179                	addi	sp,sp,-48
1c00a02c:	ce36                	sw	a3,28(sp)
1c00a02e:	cc3a                	sw	a4,24(sp)
1c00a030:	1a10b6b7          	lui	a3,0x1a10b
1c00a034:	1c002737          	lui	a4,0x1c002
1c00a038:	d61a                	sw	t1,44(sp)
1c00a03a:	d032                	sw	a2,32(sp)
1c00a03c:	ca3e                	sw	a5,20(sp)
1c00a03e:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa10afec>
1c00a042:	95072783          	lw	a5,-1712(a4) # 1c001950 <first_delayed>
1c00a046:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a04a:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a04e:	c842                	sw	a6,16(sp)
1c00a050:	80000837          	lui	a6,0x80000
1c00a054:	d42a                	sw	a0,40(sp)
1c00a056:	d22e                	sw	a1,36(sp)
1c00a058:	c646                	sw	a7,12(sp)
1c00a05a:	c472                	sw	t3,8(sp)
1c00a05c:	4581                	li	a1,0
1c00a05e:	4501                	li	a0,0
1c00a060:	ffe84813          	xori	a6,a6,-2
1c00a064:	efb9                	bnez	a5,1c00a0c2 <__rt_timer_handler+0x98>
1c00a066:	c119                	beqz	a0,1c00a06c <__rt_timer_handler+0x42>
1c00a068:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a06c:	c199                	beqz	a1,1c00a072 <__rt_timer_handler+0x48>
1c00a06e:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a072:	94072823          	sw	zero,-1712(a4)
1c00a076:	1a10b7b7          	lui	a5,0x1a10b
1c00a07a:	08100713          	li	a4,129
1c00a07e:	c3d8                	sw	a4,4(a5)
1c00a080:	6785                	lui	a5,0x1
1c00a082:	1a10a737          	lui	a4,0x1a10a
1c00a086:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a08a:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa1097f4>
1c00a08e:	5332                	lw	t1,44(sp)
1c00a090:	5522                	lw	a0,40(sp)
1c00a092:	5592                	lw	a1,36(sp)
1c00a094:	5602                	lw	a2,32(sp)
1c00a096:	46f2                	lw	a3,28(sp)
1c00a098:	4762                	lw	a4,24(sp)
1c00a09a:	47d2                	lw	a5,20(sp)
1c00a09c:	4842                	lw	a6,16(sp)
1c00a09e:	48b2                	lw	a7,12(sp)
1c00a0a0:	4e22                	lw	t3,8(sp)
1c00a0a2:	6145                	addi	sp,sp,48
1c00a0a4:	30200073          	mret
1c00a0a8:	0187a883          	lw	a7,24(a5)
1c00a0ac:	0007ac23          	sw	zero,24(a5)
1c00a0b0:	c611                	beqz	a2,1c00a0bc <__rt_timer_handler+0x92>
1c00a0b2:	ce9c                	sw	a5,24(a3)
1c00a0b4:	86be                	mv	a3,a5
1c00a0b6:	4585                	li	a1,1
1c00a0b8:	87c6                	mv	a5,a7
1c00a0ba:	b76d                	j	1c00a064 <__rt_timer_handler+0x3a>
1c00a0bc:	863e                	mv	a2,a5
1c00a0be:	4505                	li	a0,1
1c00a0c0:	bfd5                	j	1c00a0b4 <__rt_timer_handler+0x8a>
1c00a0c2:	0347a883          	lw	a7,52(a5)
1c00a0c6:	41130e33          	sub	t3,t1,a7
1c00a0ca:	fdc87fe3          	bleu	t3,a6,1c00a0a8 <__rt_timer_handler+0x7e>
1c00a0ce:	c119                	beqz	a0,1c00a0d4 <__rt_timer_handler+0xaa>
1c00a0d0:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a0d4:	c199                	beqz	a1,1c00a0da <__rt_timer_handler+0xb0>
1c00a0d6:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a0da:	94f72823          	sw	a5,-1712(a4)
1c00a0de:	1a10b737          	lui	a4,0x1a10b
1c00a0e2:	475c                	lw	a5,12(a4)
1c00a0e4:	406787b3          	sub	a5,a5,t1
1c00a0e8:	97c6                	add	a5,a5,a7
1c00a0ea:	cb5c                	sw	a5,20(a4)
1c00a0ec:	08500793          	li	a5,133
1c00a0f0:	c35c                	sw	a5,4(a4)
1c00a0f2:	bf71                	j	1c00a08e <__rt_timer_handler+0x64>

1c00a0f4 <rt_periph_copy>:
1c00a0f4:	7179                	addi	sp,sp,-48
1c00a0f6:	d422                	sw	s0,40(sp)
1c00a0f8:	842a                	mv	s0,a0
1c00a0fa:	d606                	sw	ra,44(sp)
1c00a0fc:	d226                	sw	s1,36(sp)
1c00a0fe:	d04a                	sw	s2,32(sp)
1c00a100:	30047973          	csrrci	s2,mstatus,8
1c00a104:	4015d493          	srai	s1,a1,0x1
1c00a108:	1a102537          	lui	a0,0x1a102
1c00a10c:	049e                	slli	s1,s1,0x7
1c00a10e:	94aa                	add	s1,s1,a0
1c00a110:	00459513          	slli	a0,a1,0x4
1c00a114:	8941                	andi	a0,a0,16
1c00a116:	94aa                	add	s1,s1,a0
1c00a118:	853e                	mv	a0,a5
1c00a11a:	ef89                	bnez	a5,1c00a134 <rt_periph_copy+0x40>
1c00a11c:	ce2e                	sw	a1,28(sp)
1c00a11e:	cc32                	sw	a2,24(sp)
1c00a120:	ca36                	sw	a3,20(sp)
1c00a122:	c83a                	sw	a4,16(sp)
1c00a124:	c63e                	sw	a5,12(sp)
1c00a126:	897ff0ef          	jal	ra,1c0099bc <__rt_wait_event_prepare_blocking>
1c00a12a:	47b2                	lw	a5,12(sp)
1c00a12c:	4742                	lw	a4,16(sp)
1c00a12e:	46d2                	lw	a3,20(sp)
1c00a130:	4662                	lw	a2,24(sp)
1c00a132:	45f2                	lw	a1,28(sp)
1c00a134:	e419                	bnez	s0,1c00a142 <rt_periph_copy+0x4e>
1c00a136:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa102014>
1c00a13a:	04052023          	sw	zero,64(a0)
1c00a13e:	04052823          	sw	zero,80(a0)
1c00a142:	00c42803          	lw	a6,12(s0)
1c00a146:	c054                	sw	a3,4(s0)
1c00a148:	cc08                	sw	a0,24(s0)
1c00a14a:	00f87813          	andi	a6,a6,15
1c00a14e:	4891                	li	a7,4
1c00a150:	01076713          	ori	a4,a4,16
1c00a154:	0708ec63          	bltu	a7,a6,1c00a1cc <rt_periph_copy+0xd8>
1c00a158:	04000893          	li	a7,64
1c00a15c:	0596                	slli	a1,a1,0x5
1c00a15e:	98ae                	add	a7,a7,a1
1c00a160:	0008a303          	lw	t1,0(a7)
1c00a164:	00042a23          	sw	zero,20(s0)
1c00a168:	04000813          	li	a6,64
1c00a16c:	02031663          	bnez	t1,1c00a198 <rt_periph_copy+0xa4>
1c00a170:	0088a023          	sw	s0,0(a7)
1c00a174:	00b808b3          	add	a7,a6,a1
1c00a178:	0088a303          	lw	t1,8(a7)
1c00a17c:	0088a223          	sw	s0,4(a7)
1c00a180:	02031163          	bnez	t1,1c00a1a2 <rt_periph_copy+0xae>
1c00a184:	0084a883          	lw	a7,8(s1)
1c00a188:	0208f893          	andi	a7,a7,32
1c00a18c:	00089b63          	bnez	a7,1c00a1a2 <rt_periph_copy+0xae>
1c00a190:	c090                	sw	a2,0(s1)
1c00a192:	c0d4                	sw	a3,4(s1)
1c00a194:	c498                	sw	a4,8(s1)
1c00a196:	a005                	j	1c00a1b6 <rt_periph_copy+0xc2>
1c00a198:	0048a883          	lw	a7,4(a7)
1c00a19c:	0088aa23          	sw	s0,20(a7)
1c00a1a0:	bfd1                	j	1c00a174 <rt_periph_copy+0x80>
1c00a1a2:	00042823          	sw	zero,16(s0)
1c00a1a6:	c010                	sw	a2,0(s0)
1c00a1a8:	c054                	sw	a3,4(s0)
1c00a1aa:	c418                	sw	a4,8(s0)
1c00a1ac:	00031563          	bnez	t1,1c00a1b6 <rt_periph_copy+0xc2>
1c00a1b0:	982e                	add	a6,a6,a1
1c00a1b2:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a1b6:	e399                	bnez	a5,1c00a1bc <rt_periph_copy+0xc8>
1c00a1b8:	955ff0ef          	jal	ra,1c009b0c <__rt_wait_event>
1c00a1bc:	30091073          	csrw	mstatus,s2
1c00a1c0:	50b2                	lw	ra,44(sp)
1c00a1c2:	5422                	lw	s0,40(sp)
1c00a1c4:	5492                	lw	s1,36(sp)
1c00a1c6:	5902                	lw	s2,32(sp)
1c00a1c8:	6145                	addi	sp,sp,48
1c00a1ca:	8082                	ret
1c00a1cc:	4899                	li	a7,6
1c00a1ce:	ff1814e3          	bne	a6,a7,1c00a1b6 <rt_periph_copy+0xc2>
1c00a1d2:	04000893          	li	a7,64
1c00a1d6:	0596                	slli	a1,a1,0x5
1c00a1d8:	98ae                	add	a7,a7,a1
1c00a1da:	0008a303          	lw	t1,0(a7)
1c00a1de:	00042a23          	sw	zero,20(s0)
1c00a1e2:	04000813          	li	a6,64
1c00a1e6:	00031f63          	bnez	t1,1c00a204 <rt_periph_copy+0x110>
1c00a1ea:	0088a023          	sw	s0,0(a7)
1c00a1ee:	95c2                	add	a1,a1,a6
1c00a1f0:	c1c0                	sw	s0,4(a1)
1c00a1f2:	00031e63          	bnez	t1,1c00a20e <rt_periph_copy+0x11a>
1c00a1f6:	02442803          	lw	a6,36(s0)
1c00a1fa:	1a1025b7          	lui	a1,0x1a102
1c00a1fe:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa102100>
1c00a202:	b779                	j	1c00a190 <rt_periph_copy+0x9c>
1c00a204:	0048a883          	lw	a7,4(a7)
1c00a208:	0088aa23          	sw	s0,20(a7)
1c00a20c:	b7cd                	j	1c00a1ee <rt_periph_copy+0xfa>
1c00a20e:	c418                	sw	a4,8(s0)
1c00a210:	4598                	lw	a4,8(a1)
1c00a212:	c010                	sw	a2,0(s0)
1c00a214:	c054                	sw	a3,4(s0)
1c00a216:	00042823          	sw	zero,16(s0)
1c00a21a:	ff51                	bnez	a4,1c00a1b6 <rt_periph_copy+0xc2>
1c00a21c:	c580                	sw	s0,8(a1)
1c00a21e:	bf61                	j	1c00a1b6 <rt_periph_copy+0xc2>

1c00a220 <__rt_periph_init>:
1c00a220:	1c0085b7          	lui	a1,0x1c008
1c00a224:	04000693          	li	a3,64
1c00a228:	4601                	li	a2,0
1c00a22a:	04000793          	li	a5,64
1c00a22e:	1a1028b7          	lui	a7,0x1a102
1c00a232:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a236:	4841                	li	a6,16
1c00a238:	40165713          	srai	a4,a2,0x1
1c00a23c:	00461513          	slli	a0,a2,0x4
1c00a240:	071e                	slli	a4,a4,0x7
1c00a242:	9746                	add	a4,a4,a7
1c00a244:	8941                	andi	a0,a0,16
1c00a246:	972a                	add	a4,a4,a0
1c00a248:	0006a023          	sw	zero,0(a3)
1c00a24c:	0006a423          	sw	zero,8(a3)
1c00a250:	c6d8                	sw	a4,12(a3)
1c00a252:	cecc                	sw	a1,28(a3)
1c00a254:	0605                	addi	a2,a2,1
1c00a256:	02068693          	addi	a3,a3,32
1c00a25a:	fd061fe3          	bne	a2,a6,1c00a238 <__rt_periph_init+0x18>
1c00a25e:	1c008737          	lui	a4,0x1c008
1c00a262:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a266:	2007a023          	sw	zero,512(a5)
1c00a26a:	20e7a423          	sw	a4,520(a5)
1c00a26e:	20e7a623          	sw	a4,524(a5)
1c00a272:	20e7a823          	sw	a4,528(a5)
1c00a276:	20e7aa23          	sw	a4,532(a5)
1c00a27a:	20e7ac23          	sw	a4,536(a5)
1c00a27e:	20e7ae23          	sw	a4,540(a5)
1c00a282:	22e7a023          	sw	a4,544(a5)
1c00a286:	22e7a223          	sw	a4,548(a5)
1c00a28a:	2007a223          	sw	zero,516(a5)
1c00a28e:	8082                	ret

1c00a290 <__rt_i2c_init>:
1c00a290:	1c0117b7          	lui	a5,0x1c011
1c00a294:	16878793          	addi	a5,a5,360 # 1c011168 <__rt_i2c>
1c00a298:	00078223          	sb	zero,4(a5)
1c00a29c:	00078a23          	sb	zero,20(a5)
1c00a2a0:	8082                	ret

1c00a2a2 <__rt_hyper_init>:
1c00a2a2:	1c002737          	lui	a4,0x1c002
1c00a2a6:	26800793          	li	a5,616
1c00a2aa:	8e072423          	sw	zero,-1816(a4) # 1c0018e8 <__pi_hyper_cluster_reqs_first>
1c00a2ae:	577d                	li	a4,-1
1c00a2b0:	0007aa23          	sw	zero,20(a5)
1c00a2b4:	0207a823          	sw	zero,48(a5)
1c00a2b8:	cf98                	sw	a4,24(a5)
1c00a2ba:	8082                	ret

1c00a2bc <__rt_spim_init>:
1c00a2bc:	1c0027b7          	lui	a5,0x1c002
1c00a2c0:	8e07a623          	sw	zero,-1812(a5) # 1c0018ec <__rt_spim_open_count>
1c00a2c4:	8082                	ret

1c00a2c6 <rt_is_fc>:
1c00a2c6:	f1402573          	csrr	a0,mhartid
1c00a2ca:	8515                	srai	a0,a0,0x5
1c00a2cc:	03f57513          	andi	a0,a0,63
1c00a2d0:	1505                	addi	a0,a0,-31
1c00a2d2:	00153513          	seqz	a0,a0
1c00a2d6:	8082                	ret

1c00a2d8 <__rt_io_end_of_flush>:
1c00a2d8:	1c0027b7          	lui	a5,0x1c002
1c00a2dc:	8e07aa23          	sw	zero,-1804(a5) # 1c0018f4 <__rt_io_pending_flush>
1c00a2e0:	00052c23          	sw	zero,24(a0)
1c00a2e4:	8082                	ret

1c00a2e6 <__rt_io_uart_wait_req>:
1c00a2e6:	1141                	addi	sp,sp,-16
1c00a2e8:	c226                	sw	s1,4(sp)
1c00a2ea:	84aa                	mv	s1,a0
1c00a2ec:	c606                	sw	ra,12(sp)
1c00a2ee:	c422                	sw	s0,8(sp)
1c00a2f0:	c04a                	sw	s2,0(sp)
1c00a2f2:	30047973          	csrrci	s2,mstatus,8
1c00a2f6:	1c002437          	lui	s0,0x1c002
1c00a2fa:	8f040413          	addi	s0,s0,-1808 # 1c0018f0 <__rt_io_event_current>
1c00a2fe:	4008                	lw	a0,0(s0)
1c00a300:	c509                	beqz	a0,1c00a30a <__rt_io_uart_wait_req+0x24>
1c00a302:	835ff0ef          	jal	ra,1c009b36 <rt_event_wait>
1c00a306:	00042023          	sw	zero,0(s0)
1c00a30a:	4785                	li	a5,1
1c00a30c:	08f48623          	sb	a5,140(s1)
1c00a310:	08d4c783          	lbu	a5,141(s1)
1c00a314:	00201737          	lui	a4,0x201
1c00a318:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c00a31c:	04078793          	addi	a5,a5,64
1c00a320:	07da                	slli	a5,a5,0x16
1c00a322:	97ba                	add	a5,a5,a4
1c00a324:	0007a023          	sw	zero,0(a5)
1c00a328:	30091073          	csrw	mstatus,s2
1c00a32c:	40b2                	lw	ra,12(sp)
1c00a32e:	4422                	lw	s0,8(sp)
1c00a330:	4492                	lw	s1,4(sp)
1c00a332:	4902                	lw	s2,0(sp)
1c00a334:	0141                	addi	sp,sp,16
1c00a336:	8082                	ret

1c00a338 <__rt_io_start>:
1c00a338:	1101                	addi	sp,sp,-32
1c00a33a:	0028                	addi	a0,sp,8
1c00a33c:	ce06                	sw	ra,28(sp)
1c00a33e:	cc22                	sw	s0,24(sp)
1c00a340:	7e1000ef          	jal	ra,1c00b320 <rt_uart_conf_init>
1c00a344:	4585                	li	a1,1
1c00a346:	4501                	li	a0,0
1c00a348:	e8cff0ef          	jal	ra,1c0099d4 <rt_event_alloc>
1c00a34c:	547d                	li	s0,-1
1c00a34e:	ed1d                	bnez	a0,1c00a38c <__rt_io_start+0x54>
1c00a350:	1c0017b7          	lui	a5,0x1c001
1c00a354:	7f07a783          	lw	a5,2032(a5) # 1c0017f0 <__rt_iodev_uart_baudrate>
1c00a358:	842a                	mv	s0,a0
1c00a35a:	1c002537          	lui	a0,0x1c002
1c00a35e:	e3ff6597          	auipc	a1,0xe3ff6
1c00a362:	cca58593          	addi	a1,a1,-822 # 28 <__rt_sched>
1c00a366:	83c50513          	addi	a0,a0,-1988 # 1c00183c <__rt_io_event>
1c00a36a:	c43e                	sw	a5,8(sp)
1c00a36c:	e3eff0ef          	jal	ra,1c0099aa <__rt_event_init>
1c00a370:	1c0027b7          	lui	a5,0x1c002
1c00a374:	9007a503          	lw	a0,-1792(a5) # 1c001900 <__rt_iodev_uart_channel>
1c00a378:	4681                	li	a3,0
1c00a37a:	4601                	li	a2,0
1c00a37c:	002c                	addi	a1,sp,8
1c00a37e:	050d                	addi	a0,a0,3
1c00a380:	7b1000ef          	jal	ra,1c00b330 <__rt_uart_open>
1c00a384:	1c0027b7          	lui	a5,0x1c002
1c00a388:	8ea7ac23          	sw	a0,-1800(a5) # 1c0018f8 <_rt_io_uart>
1c00a38c:	8522                	mv	a0,s0
1c00a38e:	40f2                	lw	ra,28(sp)
1c00a390:	4462                	lw	s0,24(sp)
1c00a392:	6105                	addi	sp,sp,32
1c00a394:	8082                	ret

1c00a396 <rt_event_execute.isra.2.constprop.11>:
1c00a396:	1141                	addi	sp,sp,-16
1c00a398:	c606                	sw	ra,12(sp)
1c00a39a:	c422                	sw	s0,8(sp)
1c00a39c:	30047473          	csrrci	s0,mstatus,8
1c00a3a0:	4585                	li	a1,1
1c00a3a2:	e3ff6517          	auipc	a0,0xe3ff6
1c00a3a6:	c8650513          	addi	a0,a0,-890 # 28 <__rt_sched>
1c00a3aa:	f02ff0ef          	jal	ra,1c009aac <__rt_event_execute>
1c00a3ae:	30041073          	csrw	mstatus,s0
1c00a3b2:	40b2                	lw	ra,12(sp)
1c00a3b4:	4422                	lw	s0,8(sp)
1c00a3b6:	0141                	addi	sp,sp,16
1c00a3b8:	8082                	ret

1c00a3ba <__rt_io_lock>:
1c00a3ba:	1c0017b7          	lui	a5,0x1c001
1c00a3be:	73c7a783          	lw	a5,1852(a5) # 1c00173c <__hal_debug_struct+0x10>
1c00a3c2:	c791                	beqz	a5,1c00a3ce <__rt_io_lock+0x14>
1c00a3c4:	1c0027b7          	lui	a5,0x1c002
1c00a3c8:	8f87a783          	lw	a5,-1800(a5) # 1c0018f8 <_rt_io_uart>
1c00a3cc:	c3a1                	beqz	a5,1c00a40c <__rt_io_lock+0x52>
1c00a3ce:	7171                	addi	sp,sp,-176
1c00a3d0:	d706                	sw	ra,172(sp)
1c00a3d2:	3dd5                	jal	1c00a2c6 <rt_is_fc>
1c00a3d4:	1c0017b7          	lui	a5,0x1c001
1c00a3d8:	c901                	beqz	a0,1c00a3e8 <__rt_io_lock+0x2e>
1c00a3da:	f0c78513          	addi	a0,a5,-244 # 1c000f0c <__rt_io_fc_lock>
1c00a3de:	9baff0ef          	jal	ra,1c009598 <__rt_fc_lock>
1c00a3e2:	50ba                	lw	ra,172(sp)
1c00a3e4:	614d                	addi	sp,sp,176
1c00a3e6:	8082                	ret
1c00a3e8:	002c                	addi	a1,sp,8
1c00a3ea:	f0c78513          	addi	a0,a5,-244
1c00a3ee:	a1cff0ef          	jal	ra,1c00960a <__rt_fc_cluster_lock>
1c00a3f2:	4689                	li	a3,2
1c00a3f4:	00204737          	lui	a4,0x204
1c00a3f8:	09c14783          	lbu	a5,156(sp)
1c00a3fc:	0ff7f793          	andi	a5,a5,255
1c00a400:	f3ed                	bnez	a5,1c00a3e2 <__rt_io_lock+0x28>
1c00a402:	c714                	sw	a3,8(a4)
1c00a404:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a408:	c354                	sw	a3,4(a4)
1c00a40a:	b7fd                	j	1c00a3f8 <__rt_io_lock+0x3e>
1c00a40c:	8082                	ret

1c00a40e <__rt_io_unlock>:
1c00a40e:	1c0017b7          	lui	a5,0x1c001
1c00a412:	73c7a783          	lw	a5,1852(a5) # 1c00173c <__hal_debug_struct+0x10>
1c00a416:	c791                	beqz	a5,1c00a422 <__rt_io_unlock+0x14>
1c00a418:	1c0027b7          	lui	a5,0x1c002
1c00a41c:	8f87a783          	lw	a5,-1800(a5) # 1c0018f8 <_rt_io_uart>
1c00a420:	c3a1                	beqz	a5,1c00a460 <__rt_io_unlock+0x52>
1c00a422:	7171                	addi	sp,sp,-176
1c00a424:	d706                	sw	ra,172(sp)
1c00a426:	3545                	jal	1c00a2c6 <rt_is_fc>
1c00a428:	1c0017b7          	lui	a5,0x1c001
1c00a42c:	c901                	beqz	a0,1c00a43c <__rt_io_unlock+0x2e>
1c00a42e:	f0c78513          	addi	a0,a5,-244 # 1c000f0c <__rt_io_fc_lock>
1c00a432:	9a2ff0ef          	jal	ra,1c0095d4 <__rt_fc_unlock>
1c00a436:	50ba                	lw	ra,172(sp)
1c00a438:	614d                	addi	sp,sp,176
1c00a43a:	8082                	ret
1c00a43c:	002c                	addi	a1,sp,8
1c00a43e:	f0c78513          	addi	a0,a5,-244
1c00a442:	a00ff0ef          	jal	ra,1c009642 <__rt_fc_cluster_unlock>
1c00a446:	4689                	li	a3,2
1c00a448:	00204737          	lui	a4,0x204
1c00a44c:	09c14783          	lbu	a5,156(sp)
1c00a450:	0ff7f793          	andi	a5,a5,255
1c00a454:	f3ed                	bnez	a5,1c00a436 <__rt_io_unlock+0x28>
1c00a456:	c714                	sw	a3,8(a4)
1c00a458:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a45c:	c354                	sw	a3,4(a4)
1c00a45e:	b7fd                	j	1c00a44c <__rt_io_unlock+0x3e>
1c00a460:	8082                	ret

1c00a462 <__rt_io_uart_wait_pending>:
1c00a462:	7135                	addi	sp,sp,-160
1c00a464:	cd22                	sw	s0,152(sp)
1c00a466:	cf06                	sw	ra,156(sp)
1c00a468:	cb26                	sw	s1,148(sp)
1c00a46a:	1c002437          	lui	s0,0x1c002
1c00a46e:	8f442783          	lw	a5,-1804(s0) # 1c0018f4 <__rt_io_pending_flush>
1c00a472:	e39d                	bnez	a5,1c00a498 <__rt_io_uart_wait_pending+0x36>
1c00a474:	1c002437          	lui	s0,0x1c002
1c00a478:	8f040413          	addi	s0,s0,-1808 # 1c0018f0 <__rt_io_event_current>
1c00a47c:	4004                	lw	s1,0(s0)
1c00a47e:	c881                	beqz	s1,1c00a48e <__rt_io_uart_wait_pending+0x2c>
1c00a480:	3599                	jal	1c00a2c6 <rt_is_fc>
1c00a482:	cd19                	beqz	a0,1c00a4a0 <__rt_io_uart_wait_pending+0x3e>
1c00a484:	8526                	mv	a0,s1
1c00a486:	eb0ff0ef          	jal	ra,1c009b36 <rt_event_wait>
1c00a48a:	00042023          	sw	zero,0(s0)
1c00a48e:	40fa                	lw	ra,156(sp)
1c00a490:	446a                	lw	s0,152(sp)
1c00a492:	44da                	lw	s1,148(sp)
1c00a494:	610d                	addi	sp,sp,160
1c00a496:	8082                	ret
1c00a498:	3f9d                	jal	1c00a40e <__rt_io_unlock>
1c00a49a:	3df5                	jal	1c00a396 <rt_event_execute.isra.2.constprop.11>
1c00a49c:	3f39                	jal	1c00a3ba <__rt_io_lock>
1c00a49e:	bfc1                	j	1c00a46e <__rt_io_uart_wait_pending+0xc>
1c00a4a0:	f14027f3          	csrr	a5,mhartid
1c00a4a4:	8795                	srai	a5,a5,0x5
1c00a4a6:	03f7f793          	andi	a5,a5,63
1c00a4aa:	08f106a3          	sb	a5,141(sp)
1c00a4ae:	1c00a7b7          	lui	a5,0x1c00a
1c00a4b2:	2e678793          	addi	a5,a5,742 # 1c00a2e6 <__rt_io_uart_wait_req>
1c00a4b6:	c03e                	sw	a5,0(sp)
1c00a4b8:	00010793          	mv	a5,sp
1c00a4bc:	4705                	li	a4,1
1c00a4be:	c23e                	sw	a5,4(sp)
1c00a4c0:	850a                	mv	a0,sp
1c00a4c2:	1c0027b7          	lui	a5,0x1c002
1c00a4c6:	84e7ae23          	sw	a4,-1956(a5) # 1c00185c <__rt_io_event+0x20>
1c00a4ca:	08010623          	sb	zero,140(sp)
1c00a4ce:	d002                	sw	zero,32(sp)
1c00a4d0:	d202                	sw	zero,36(sp)
1c00a4d2:	a17fe0ef          	jal	ra,1c008ee8 <__rt_cluster_push_fc_event>
1c00a4d6:	4689                	li	a3,2
1c00a4d8:	00204737          	lui	a4,0x204
1c00a4dc:	08c14783          	lbu	a5,140(sp)
1c00a4e0:	0ff7f793          	andi	a5,a5,255
1c00a4e4:	f7cd                	bnez	a5,1c00a48e <__rt_io_uart_wait_pending+0x2c>
1c00a4e6:	c714                	sw	a3,8(a4)
1c00a4e8:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a4ec:	c354                	sw	a3,4(a4)
1c00a4ee:	b7fd                	j	1c00a4dc <__rt_io_uart_wait_pending+0x7a>

1c00a4f0 <__rt_io_stop>:
1c00a4f0:	1141                	addi	sp,sp,-16
1c00a4f2:	c422                	sw	s0,8(sp)
1c00a4f4:	1c002437          	lui	s0,0x1c002
1c00a4f8:	c606                	sw	ra,12(sp)
1c00a4fa:	8f840413          	addi	s0,s0,-1800 # 1c0018f8 <_rt_io_uart>
1c00a4fe:	3795                	jal	1c00a462 <__rt_io_uart_wait_pending>
1c00a500:	4008                	lw	a0,0(s0)
1c00a502:	4581                	li	a1,0
1c00a504:	6b5000ef          	jal	ra,1c00b3b8 <rt_uart_close>
1c00a508:	40b2                	lw	ra,12(sp)
1c00a50a:	00042023          	sw	zero,0(s0)
1c00a50e:	4422                	lw	s0,8(sp)
1c00a510:	4501                	li	a0,0
1c00a512:	0141                	addi	sp,sp,16
1c00a514:	8082                	ret

1c00a516 <__rt_io_uart_flush.constprop.10>:
1c00a516:	7131                	addi	sp,sp,-192
1c00a518:	dd22                	sw	s0,184(sp)
1c00a51a:	df06                	sw	ra,188(sp)
1c00a51c:	db26                	sw	s1,180(sp)
1c00a51e:	d94a                	sw	s2,176(sp)
1c00a520:	d74e                	sw	s3,172(sp)
1c00a522:	d552                	sw	s4,168(sp)
1c00a524:	d356                	sw	s5,164(sp)
1c00a526:	1c002437          	lui	s0,0x1c002
1c00a52a:	8f442783          	lw	a5,-1804(s0) # 1c0018f4 <__rt_io_pending_flush>
1c00a52e:	8f440a13          	addi	s4,s0,-1804
1c00a532:	e7bd                	bnez	a5,1c00a5a0 <__rt_io_uart_flush.constprop.10+0x8a>
1c00a534:	1c0014b7          	lui	s1,0x1c001
1c00a538:	72c48793          	addi	a5,s1,1836 # 1c00172c <__hal_debug_struct>
1c00a53c:	4f80                	lw	s0,24(a5)
1c00a53e:	72c48a93          	addi	s5,s1,1836
1c00a542:	c431                	beqz	s0,1c00a58e <__rt_io_uart_flush.constprop.10+0x78>
1c00a544:	3349                	jal	1c00a2c6 <rt_is_fc>
1c00a546:	1c0027b7          	lui	a5,0x1c002
1c00a54a:	8f87a903          	lw	s2,-1800(a5) # 1c0018f8 <_rt_io_uart>
1c00a54e:	1c0019b7          	lui	s3,0x1c001
1c00a552:	cd29                	beqz	a0,1c00a5ac <__rt_io_uart_flush.constprop.10+0x96>
1c00a554:	1c00a5b7          	lui	a1,0x1c00a
1c00a558:	4785                	li	a5,1
1c00a55a:	72c48613          	addi	a2,s1,1836
1c00a55e:	2d858593          	addi	a1,a1,728 # 1c00a2d8 <__rt_io_end_of_flush>
1c00a562:	4501                	li	a0,0
1c00a564:	00fa2023          	sw	a5,0(s4)
1c00a568:	ce4ff0ef          	jal	ra,1c009a4c <rt_event_get>
1c00a56c:	00492583          	lw	a1,4(s2)
1c00a570:	87aa                	mv	a5,a0
1c00a572:	4701                	li	a4,0
1c00a574:	0586                	slli	a1,a1,0x1
1c00a576:	86a2                	mv	a3,s0
1c00a578:	74898613          	addi	a2,s3,1864 # 1c001748 <__hal_debug_struct+0x1c>
1c00a57c:	0585                	addi	a1,a1,1
1c00a57e:	4501                	li	a0,0
1c00a580:	b75ff0ef          	jal	ra,1c00a0f4 <rt_periph_copy>
1c00a584:	3569                	jal	1c00a40e <__rt_io_unlock>
1c00a586:	000a2783          	lw	a5,0(s4)
1c00a58a:	ef99                	bnez	a5,1c00a5a8 <__rt_io_uart_flush.constprop.10+0x92>
1c00a58c:	353d                	jal	1c00a3ba <__rt_io_lock>
1c00a58e:	50fa                	lw	ra,188(sp)
1c00a590:	546a                	lw	s0,184(sp)
1c00a592:	54da                	lw	s1,180(sp)
1c00a594:	594a                	lw	s2,176(sp)
1c00a596:	59ba                	lw	s3,172(sp)
1c00a598:	5a2a                	lw	s4,168(sp)
1c00a59a:	5a9a                	lw	s5,164(sp)
1c00a59c:	6129                	addi	sp,sp,192
1c00a59e:	8082                	ret
1c00a5a0:	35bd                	jal	1c00a40e <__rt_io_unlock>
1c00a5a2:	3bd5                	jal	1c00a396 <rt_event_execute.isra.2.constprop.11>
1c00a5a4:	3d19                	jal	1c00a3ba <__rt_io_lock>
1c00a5a6:	b751                	j	1c00a52a <__rt_io_uart_flush.constprop.10+0x14>
1c00a5a8:	33fd                	jal	1c00a396 <rt_event_execute.isra.2.constprop.11>
1c00a5aa:	bff1                	j	1c00a586 <__rt_io_uart_flush.constprop.10+0x70>
1c00a5ac:	0054                	addi	a3,sp,4
1c00a5ae:	8622                	mv	a2,s0
1c00a5b0:	74898593          	addi	a1,s3,1864
1c00a5b4:	854a                	mv	a0,s2
1c00a5b6:	64d000ef          	jal	ra,1c00b402 <rt_uart_cluster_write>
1c00a5ba:	4689                	li	a3,2
1c00a5bc:	00204737          	lui	a4,0x204
1c00a5c0:	09c14783          	lbu	a5,156(sp)
1c00a5c4:	0ff7f793          	andi	a5,a5,255
1c00a5c8:	c781                	beqz	a5,1c00a5d0 <__rt_io_uart_flush.constprop.10+0xba>
1c00a5ca:	000aac23          	sw	zero,24(s5)
1c00a5ce:	b7c1                	j	1c00a58e <__rt_io_uart_flush.constprop.10+0x78>
1c00a5d0:	c714                	sw	a3,8(a4)
1c00a5d2:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a5d6:	c354                	sw	a3,4(a4)
1c00a5d8:	b7e5                	j	1c00a5c0 <__rt_io_uart_flush.constprop.10+0xaa>

1c00a5da <memset>:
1c00a5da:	962a                	add	a2,a2,a0
1c00a5dc:	87aa                	mv	a5,a0
1c00a5de:	00c79363          	bne	a5,a2,1c00a5e4 <memset+0xa>
1c00a5e2:	8082                	ret
1c00a5e4:	0785                	addi	a5,a5,1
1c00a5e6:	feb78fa3          	sb	a1,-1(a5)
1c00a5ea:	bfd5                	j	1c00a5de <memset+0x4>

1c00a5ec <memcpy>:
1c00a5ec:	962a                	add	a2,a2,a0
1c00a5ee:	87aa                	mv	a5,a0
1c00a5f0:	00c79363          	bne	a5,a2,1c00a5f6 <memcpy+0xa>
1c00a5f4:	8082                	ret
1c00a5f6:	0585                	addi	a1,a1,1
1c00a5f8:	fff5c703          	lbu	a4,-1(a1)
1c00a5fc:	0785                	addi	a5,a5,1
1c00a5fe:	fee78fa3          	sb	a4,-1(a5)
1c00a602:	b7fd                	j	1c00a5f0 <memcpy+0x4>

1c00a604 <memmove>:
1c00a604:	40b507b3          	sub	a5,a0,a1
1c00a608:	00c7e763          	bltu	a5,a2,1c00a616 <memmove+0x12>
1c00a60c:	962e                	add	a2,a2,a1
1c00a60e:	87aa                	mv	a5,a0
1c00a610:	00c59e63          	bne	a1,a2,1c00a62c <memmove+0x28>
1c00a614:	8082                	ret
1c00a616:	167d                	addi	a2,a2,-1
1c00a618:	00c587b3          	add	a5,a1,a2
1c00a61c:	0007c703          	lbu	a4,0(a5)
1c00a620:	00c507b3          	add	a5,a0,a2
1c00a624:	00e78023          	sb	a4,0(a5)
1c00a628:	f67d                	bnez	a2,1c00a616 <memmove+0x12>
1c00a62a:	8082                	ret
1c00a62c:	0005c703          	lbu	a4,0(a1)
1c00a630:	0785                	addi	a5,a5,1
1c00a632:	0585                	addi	a1,a1,1
1c00a634:	fee78fa3          	sb	a4,-1(a5)
1c00a638:	bfe1                	j	1c00a610 <memmove+0xc>

1c00a63a <strchr>:
1c00a63a:	0ff5f593          	andi	a1,a1,255
1c00a63e:	00054783          	lbu	a5,0(a0)
1c00a642:	00b78563          	beq	a5,a1,1c00a64c <strchr+0x12>
1c00a646:	e781                	bnez	a5,1c00a64e <strchr+0x14>
1c00a648:	c191                	beqz	a1,1c00a64c <strchr+0x12>
1c00a64a:	4501                	li	a0,0
1c00a64c:	8082                	ret
1c00a64e:	0505                	addi	a0,a0,1
1c00a650:	b7fd                	j	1c00a63e <strchr+0x4>

1c00a652 <__rt_putc_debug_bridge>:
1c00a652:	1141                	addi	sp,sp,-16
1c00a654:	c422                	sw	s0,8(sp)
1c00a656:	1c001437          	lui	s0,0x1c001
1c00a65a:	c226                	sw	s1,4(sp)
1c00a65c:	c606                	sw	ra,12(sp)
1c00a65e:	84aa                	mv	s1,a0
1c00a660:	72c40413          	addi	s0,s0,1836 # 1c00172c <__hal_debug_struct>
1c00a664:	485c                	lw	a5,20(s0)
1c00a666:	c791                	beqz	a5,1c00a672 <__rt_putc_debug_bridge+0x20>
1c00a668:	06400513          	li	a0,100
1c00a66c:	909ff0ef          	jal	ra,1c009f74 <rt_time_wait_us>
1c00a670:	bfd5                	j	1c00a664 <__rt_putc_debug_bridge+0x12>
1c00a672:	4c1c                	lw	a5,24(s0)
1c00a674:	00178713          	addi	a4,a5,1
1c00a678:	97a2                	add	a5,a5,s0
1c00a67a:	00978e23          	sb	s1,28(a5)
1c00a67e:	cc18                	sw	a4,24(s0)
1c00a680:	4c14                	lw	a3,24(s0)
1c00a682:	08000793          	li	a5,128
1c00a686:	00f68563          	beq	a3,a5,1c00a690 <__rt_putc_debug_bridge+0x3e>
1c00a68a:	47a9                	li	a5,10
1c00a68c:	00f49663          	bne	s1,a5,1c00a698 <__rt_putc_debug_bridge+0x46>
1c00a690:	c701                	beqz	a4,1c00a698 <__rt_putc_debug_bridge+0x46>
1c00a692:	c858                	sw	a4,20(s0)
1c00a694:	00042c23          	sw	zero,24(s0)
1c00a698:	4c1c                	lw	a5,24(s0)
1c00a69a:	e799                	bnez	a5,1c00a6a8 <__rt_putc_debug_bridge+0x56>
1c00a69c:	4422                	lw	s0,8(sp)
1c00a69e:	40b2                	lw	ra,12(sp)
1c00a6a0:	4492                	lw	s1,4(sp)
1c00a6a2:	0141                	addi	sp,sp,16
1c00a6a4:	948ff06f          	j	1c0097ec <__rt_bridge_printf_flush>
1c00a6a8:	40b2                	lw	ra,12(sp)
1c00a6aa:	4422                	lw	s0,8(sp)
1c00a6ac:	4492                	lw	s1,4(sp)
1c00a6ae:	0141                	addi	sp,sp,16
1c00a6b0:	8082                	ret

1c00a6b2 <__rt_putc_uart>:
1c00a6b2:	1101                	addi	sp,sp,-32
1c00a6b4:	c62a                	sw	a0,12(sp)
1c00a6b6:	ce06                	sw	ra,28(sp)
1c00a6b8:	336d                	jal	1c00a462 <__rt_io_uart_wait_pending>
1c00a6ba:	1c0017b7          	lui	a5,0x1c001
1c00a6be:	72c78793          	addi	a5,a5,1836 # 1c00172c <__hal_debug_struct>
1c00a6c2:	4f94                	lw	a3,24(a5)
1c00a6c4:	4532                	lw	a0,12(sp)
1c00a6c6:	00168713          	addi	a4,a3,1
1c00a6ca:	cf98                	sw	a4,24(a5)
1c00a6cc:	97b6                	add	a5,a5,a3
1c00a6ce:	00a78e23          	sb	a0,28(a5)
1c00a6d2:	08000793          	li	a5,128
1c00a6d6:	00f70563          	beq	a4,a5,1c00a6e0 <__rt_putc_uart+0x2e>
1c00a6da:	47a9                	li	a5,10
1c00a6dc:	00f51563          	bne	a0,a5,1c00a6e6 <__rt_putc_uart+0x34>
1c00a6e0:	40f2                	lw	ra,28(sp)
1c00a6e2:	6105                	addi	sp,sp,32
1c00a6e4:	bd0d                	j	1c00a516 <__rt_io_uart_flush.constprop.10>
1c00a6e6:	40f2                	lw	ra,28(sp)
1c00a6e8:	6105                	addi	sp,sp,32
1c00a6ea:	8082                	ret

1c00a6ec <tfp_putc.isra.8>:
1c00a6ec:	1c0027b7          	lui	a5,0x1c002
1c00a6f0:	8f87a783          	lw	a5,-1800(a5) # 1c0018f8 <_rt_io_uart>
1c00a6f4:	c391                	beqz	a5,1c00a6f8 <tfp_putc.isra.8+0xc>
1c00a6f6:	bf75                	j	1c00a6b2 <__rt_putc_uart>
1c00a6f8:	1c0017b7          	lui	a5,0x1c001
1c00a6fc:	73c7a783          	lw	a5,1852(a5) # 1c00173c <__hal_debug_struct+0x10>
1c00a700:	c395                	beqz	a5,1c00a724 <tfp_putc.isra.8+0x38>
1c00a702:	6689                	lui	a3,0x2
1c00a704:	f14027f3          	csrr	a5,mhartid
1c00a708:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a70c:	00379713          	slli	a4,a5,0x3
1c00a710:	078a                	slli	a5,a5,0x2
1c00a712:	0ff77713          	andi	a4,a4,255
1c00a716:	8ff5                	and	a5,a5,a3
1c00a718:	97ba                	add	a5,a5,a4
1c00a71a:	1a10f737          	lui	a4,0x1a10f
1c00a71e:	97ba                	add	a5,a5,a4
1c00a720:	c388                	sw	a0,0(a5)
1c00a722:	8082                	ret
1c00a724:	b73d                	j	1c00a652 <__rt_putc_debug_bridge>

1c00a726 <puts>:
1c00a726:	1141                	addi	sp,sp,-16
1c00a728:	c422                	sw	s0,8(sp)
1c00a72a:	c606                	sw	ra,12(sp)
1c00a72c:	842a                	mv	s0,a0
1c00a72e:	3171                	jal	1c00a3ba <__rt_io_lock>
1c00a730:	00044503          	lbu	a0,0(s0)
1c00a734:	c501                	beqz	a0,1c00a73c <puts+0x16>
1c00a736:	3f5d                	jal	1c00a6ec <tfp_putc.isra.8>
1c00a738:	0405                	addi	s0,s0,1
1c00a73a:	bfdd                	j	1c00a730 <puts+0xa>
1c00a73c:	4529                	li	a0,10
1c00a73e:	377d                	jal	1c00a6ec <tfp_putc.isra.8>
1c00a740:	31f9                	jal	1c00a40e <__rt_io_unlock>
1c00a742:	40b2                	lw	ra,12(sp)
1c00a744:	4422                	lw	s0,8(sp)
1c00a746:	4501                	li	a0,0
1c00a748:	0141                	addi	sp,sp,16
1c00a74a:	8082                	ret

1c00a74c <fputc_locked>:
1c00a74c:	1141                	addi	sp,sp,-16
1c00a74e:	c422                	sw	s0,8(sp)
1c00a750:	842a                	mv	s0,a0
1c00a752:	0ff57513          	andi	a0,a0,255
1c00a756:	c606                	sw	ra,12(sp)
1c00a758:	3f51                	jal	1c00a6ec <tfp_putc.isra.8>
1c00a75a:	8522                	mv	a0,s0
1c00a75c:	40b2                	lw	ra,12(sp)
1c00a75e:	4422                	lw	s0,8(sp)
1c00a760:	0141                	addi	sp,sp,16
1c00a762:	8082                	ret

1c00a764 <_prf_locked>:
1c00a764:	1101                	addi	sp,sp,-32
1c00a766:	ce06                	sw	ra,28(sp)
1c00a768:	c02a                	sw	a0,0(sp)
1c00a76a:	c62e                	sw	a1,12(sp)
1c00a76c:	c432                	sw	a2,8(sp)
1c00a76e:	c236                	sw	a3,4(sp)
1c00a770:	31a9                	jal	1c00a3ba <__rt_io_lock>
1c00a772:	4692                	lw	a3,4(sp)
1c00a774:	4622                	lw	a2,8(sp)
1c00a776:	45b2                	lw	a1,12(sp)
1c00a778:	4502                	lw	a0,0(sp)
1c00a77a:	2ae9                	jal	1c00a954 <_prf>
1c00a77c:	c02a                	sw	a0,0(sp)
1c00a77e:	3941                	jal	1c00a40e <__rt_io_unlock>
1c00a780:	40f2                	lw	ra,28(sp)
1c00a782:	4502                	lw	a0,0(sp)
1c00a784:	6105                	addi	sp,sp,32
1c00a786:	8082                	ret

1c00a788 <exit>:
1c00a788:	1141                	addi	sp,sp,-16
1c00a78a:	c606                	sw	ra,12(sp)
1c00a78c:	c422                	sw	s0,8(sp)
1c00a78e:	842a                	mv	s0,a0
1c00a790:	85cff0ef          	jal	ra,1c0097ec <__rt_bridge_printf_flush>
1c00a794:	80000537          	lui	a0,0x80000
1c00a798:	1c0017b7          	lui	a5,0x1c001
1c00a79c:	8c49                	or	s0,s0,a0
1c00a79e:	72c78793          	addi	a5,a5,1836 # 1c00172c <__hal_debug_struct>
1c00a7a2:	c7c0                	sw	s0,12(a5)
1c00a7a4:	818ff0ef          	jal	ra,1c0097bc <__rt_bridge_send_notif>
1c00a7a8:	1a1047b7          	lui	a5,0x1a104
1c00a7ac:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa104080>
1c00a7b0:	a001                	j	1c00a7b0 <exit+0x28>

1c00a7b2 <abort>:
1c00a7b2:	1141                	addi	sp,sp,-16
1c00a7b4:	557d                	li	a0,-1
1c00a7b6:	c606                	sw	ra,12(sp)
1c00a7b8:	3fc1                	jal	1c00a788 <exit>

1c00a7ba <__rt_io_init>:
1c00a7ba:	1c0017b7          	lui	a5,0x1c001
1c00a7be:	f0c78793          	addi	a5,a5,-244 # 1c000f0c <__rt_io_fc_lock>
1c00a7c2:	0007a223          	sw	zero,4(a5)
1c00a7c6:	0007a023          	sw	zero,0(a5)
1c00a7ca:	0007a623          	sw	zero,12(a5)
1c00a7ce:	1c0027b7          	lui	a5,0x1c002
1c00a7d2:	8e07ac23          	sw	zero,-1800(a5) # 1c0018f8 <_rt_io_uart>
1c00a7d6:	1c0027b7          	lui	a5,0x1c002
1c00a7da:	8e07a823          	sw	zero,-1808(a5) # 1c0018f0 <__rt_io_event_current>
1c00a7de:	1c0027b7          	lui	a5,0x1c002
1c00a7e2:	8fc7a703          	lw	a4,-1796(a5) # 1c0018fc <__rt_iodev>
1c00a7e6:	4785                	li	a5,1
1c00a7e8:	02f71e63          	bne	a4,a5,1c00a824 <__rt_io_init+0x6a>
1c00a7ec:	1c00a5b7          	lui	a1,0x1c00a
1c00a7f0:	1141                	addi	sp,sp,-16
1c00a7f2:	4601                	li	a2,0
1c00a7f4:	33858593          	addi	a1,a1,824 # 1c00a338 <__rt_io_start>
1c00a7f8:	4501                	li	a0,0
1c00a7fa:	c606                	sw	ra,12(sp)
1c00a7fc:	d09fe0ef          	jal	ra,1c009504 <__rt_cbsys_add>
1c00a800:	1c00a5b7          	lui	a1,0x1c00a
1c00a804:	4f058593          	addi	a1,a1,1264 # 1c00a4f0 <__rt_io_stop>
1c00a808:	4601                	li	a2,0
1c00a80a:	4505                	li	a0,1
1c00a80c:	cf9fe0ef          	jal	ra,1c009504 <__rt_cbsys_add>
1c00a810:	40b2                	lw	ra,12(sp)
1c00a812:	1c0027b7          	lui	a5,0x1c002
1c00a816:	8e07aa23          	sw	zero,-1804(a5) # 1c0018f4 <__rt_io_pending_flush>
1c00a81a:	4585                	li	a1,1
1c00a81c:	4501                	li	a0,0
1c00a81e:	0141                	addi	sp,sp,16
1c00a820:	9b4ff06f          	j	1c0099d4 <rt_event_alloc>
1c00a824:	8082                	ret

1c00a826 <printf>:
1c00a826:	7139                	addi	sp,sp,-64
1c00a828:	d432                	sw	a2,40(sp)
1c00a82a:	862a                	mv	a2,a0
1c00a82c:	1c00a537          	lui	a0,0x1c00a
1c00a830:	d22e                	sw	a1,36(sp)
1c00a832:	d636                	sw	a3,44(sp)
1c00a834:	4589                	li	a1,2
1c00a836:	1054                	addi	a3,sp,36
1c00a838:	74c50513          	addi	a0,a0,1868 # 1c00a74c <fputc_locked>
1c00a83c:	ce06                	sw	ra,28(sp)
1c00a83e:	d83a                	sw	a4,48(sp)
1c00a840:	da3e                	sw	a5,52(sp)
1c00a842:	dc42                	sw	a6,56(sp)
1c00a844:	de46                	sw	a7,60(sp)
1c00a846:	c636                	sw	a3,12(sp)
1c00a848:	3f31                	jal	1c00a764 <_prf_locked>
1c00a84a:	40f2                	lw	ra,28(sp)
1c00a84c:	6121                	addi	sp,sp,64
1c00a84e:	8082                	ret

1c00a850 <_to_x>:
1c00a850:	872a                	mv	a4,a0
1c00a852:	87aa                	mv	a5,a0
1c00a854:	4325                	li	t1,9
1c00a856:	02c5f8b3          	remu	a7,a1,a2
1c00a85a:	02700513          	li	a0,39
1c00a85e:	02c5d5b3          	divu	a1,a1,a2
1c00a862:	0ff8f813          	andi	a6,a7,255
1c00a866:	01136363          	bltu	t1,a7,1c00a86c <_to_x+0x1c>
1c00a86a:	4501                	li	a0,0
1c00a86c:	03080813          	addi	a6,a6,48
1c00a870:	0785                	addi	a5,a5,1
1c00a872:	9542                	add	a0,a0,a6
1c00a874:	fea78fa3          	sb	a0,-1(a5)
1c00a878:	fdf9                	bnez	a1,1c00a856 <_to_x+0x6>
1c00a87a:	03000613          	li	a2,48
1c00a87e:	40e78533          	sub	a0,a5,a4
1c00a882:	00d54863          	blt	a0,a3,1c00a892 <_to_x+0x42>
1c00a886:	00078023          	sb	zero,0(a5)
1c00a88a:	17fd                	addi	a5,a5,-1
1c00a88c:	00f76763          	bltu	a4,a5,1c00a89a <_to_x+0x4a>
1c00a890:	8082                	ret
1c00a892:	0785                	addi	a5,a5,1
1c00a894:	fec78fa3          	sb	a2,-1(a5)
1c00a898:	b7dd                	j	1c00a87e <_to_x+0x2e>
1c00a89a:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10efe0>
1c00a89e:	0007c683          	lbu	a3,0(a5)
1c00a8a2:	0705                	addi	a4,a4,1
1c00a8a4:	00c78023          	sb	a2,0(a5)
1c00a8a8:	fed70fa3          	sb	a3,-1(a4)
1c00a8ac:	17fd                	addi	a5,a5,-1
1c00a8ae:	bff9                	j	1c00a88c <_to_x+0x3c>

1c00a8b0 <_rlrshift>:
1c00a8b0:	411c                	lw	a5,0(a0)
1c00a8b2:	4154                	lw	a3,4(a0)
1c00a8b4:	0017f713          	andi	a4,a5,1
1c00a8b8:	01f69613          	slli	a2,a3,0x1f
1c00a8bc:	8385                	srli	a5,a5,0x1
1c00a8be:	8fd1                	or	a5,a5,a2
1c00a8c0:	97ba                	add	a5,a5,a4
1c00a8c2:	8285                	srli	a3,a3,0x1
1c00a8c4:	00e7b733          	sltu	a4,a5,a4
1c00a8c8:	9736                	add	a4,a4,a3
1c00a8ca:	c11c                	sw	a5,0(a0)
1c00a8cc:	c158                	sw	a4,4(a0)
1c00a8ce:	8082                	ret

1c00a8d0 <_ldiv5>:
1c00a8d0:	4118                	lw	a4,0(a0)
1c00a8d2:	4154                	lw	a3,4(a0)
1c00a8d4:	4615                	li	a2,5
1c00a8d6:	00270793          	addi	a5,a4,2
1c00a8da:	00e7b733          	sltu	a4,a5,a4
1c00a8de:	9736                	add	a4,a4,a3
1c00a8e0:	02c755b3          	divu	a1,a4,a2
1c00a8e4:	02b606b3          	mul	a3,a2,a1
1c00a8e8:	8f15                	sub	a4,a4,a3
1c00a8ea:	01d71693          	slli	a3,a4,0x1d
1c00a8ee:	0037d713          	srli	a4,a5,0x3
1c00a8f2:	8f55                	or	a4,a4,a3
1c00a8f4:	02c75733          	divu	a4,a4,a2
1c00a8f8:	01d75693          	srli	a3,a4,0x1d
1c00a8fc:	070e                	slli	a4,a4,0x3
1c00a8fe:	95b6                	add	a1,a1,a3
1c00a900:	02e606b3          	mul	a3,a2,a4
1c00a904:	8f95                	sub	a5,a5,a3
1c00a906:	02c7d7b3          	divu	a5,a5,a2
1c00a90a:	973e                	add	a4,a4,a5
1c00a90c:	00f737b3          	sltu	a5,a4,a5
1c00a910:	97ae                	add	a5,a5,a1
1c00a912:	c118                	sw	a4,0(a0)
1c00a914:	c15c                	sw	a5,4(a0)
1c00a916:	8082                	ret

1c00a918 <_get_digit>:
1c00a918:	419c                	lw	a5,0(a1)
1c00a91a:	03000713          	li	a4,48
1c00a91e:	02f05863          	blez	a5,1c00a94e <_get_digit+0x36>
1c00a922:	17fd                	addi	a5,a5,-1
1c00a924:	4114                	lw	a3,0(a0)
1c00a926:	c19c                	sw	a5,0(a1)
1c00a928:	415c                	lw	a5,4(a0)
1c00a92a:	4729                	li	a4,10
1c00a92c:	02d70633          	mul	a2,a4,a3
1c00a930:	02f707b3          	mul	a5,a4,a5
1c00a934:	c110                	sw	a2,0(a0)
1c00a936:	02d73733          	mulhu	a4,a4,a3
1c00a93a:	100006b7          	lui	a3,0x10000
1c00a93e:	16fd                	addi	a3,a3,-1
1c00a940:	97ba                	add	a5,a5,a4
1c00a942:	01c7d713          	srli	a4,a5,0x1c
1c00a946:	8ff5                	and	a5,a5,a3
1c00a948:	03070713          	addi	a4,a4,48
1c00a94c:	c15c                	sw	a5,4(a0)
1c00a94e:	0ff77513          	andi	a0,a4,255
1c00a952:	8082                	ret

1c00a954 <_prf>:
1c00a954:	714d                	addi	sp,sp,-336
1c00a956:	14912223          	sw	s1,324(sp)
1c00a95a:	13312e23          	sw	s3,316(sp)
1c00a95e:	13812423          	sw	s8,296(sp)
1c00a962:	14112623          	sw	ra,332(sp)
1c00a966:	14812423          	sw	s0,328(sp)
1c00a96a:	15212023          	sw	s2,320(sp)
1c00a96e:	13412c23          	sw	s4,312(sp)
1c00a972:	13512a23          	sw	s5,308(sp)
1c00a976:	13612823          	sw	s6,304(sp)
1c00a97a:	13712623          	sw	s7,300(sp)
1c00a97e:	13912223          	sw	s9,292(sp)
1c00a982:	13a12023          	sw	s10,288(sp)
1c00a986:	11b12e23          	sw	s11,284(sp)
1c00a98a:	cc2a                	sw	a0,24(sp)
1c00a98c:	ce2e                	sw	a1,28(sp)
1c00a98e:	84b2                	mv	s1,a2
1c00a990:	8c36                	mv	s8,a3
1c00a992:	4981                	li	s3,0
1c00a994:	0004c503          	lbu	a0,0(s1)
1c00a998:	00148b93          	addi	s7,s1,1
1c00a99c:	cd01                	beqz	a0,1c00a9b4 <_prf+0x60>
1c00a99e:	02500793          	li	a5,37
1c00a9a2:	14f50a63          	beq	a0,a5,1c00aaf6 <_prf+0x1a2>
1c00a9a6:	45f2                	lw	a1,28(sp)
1c00a9a8:	4762                	lw	a4,24(sp)
1c00a9aa:	9702                	jalr	a4
1c00a9ac:	57fd                	li	a5,-1
1c00a9ae:	04f51063          	bne	a0,a5,1c00a9ee <_prf+0x9a>
1c00a9b2:	59fd                	li	s3,-1
1c00a9b4:	14c12083          	lw	ra,332(sp)
1c00a9b8:	14812403          	lw	s0,328(sp)
1c00a9bc:	854e                	mv	a0,s3
1c00a9be:	14412483          	lw	s1,324(sp)
1c00a9c2:	14012903          	lw	s2,320(sp)
1c00a9c6:	13c12983          	lw	s3,316(sp)
1c00a9ca:	13812a03          	lw	s4,312(sp)
1c00a9ce:	13412a83          	lw	s5,308(sp)
1c00a9d2:	13012b03          	lw	s6,304(sp)
1c00a9d6:	12c12b83          	lw	s7,300(sp)
1c00a9da:	12812c03          	lw	s8,296(sp)
1c00a9de:	12412c83          	lw	s9,292(sp)
1c00a9e2:	12012d03          	lw	s10,288(sp)
1c00a9e6:	11c12d83          	lw	s11,284(sp)
1c00a9ea:	6171                	addi	sp,sp,336
1c00a9ec:	8082                	ret
1c00a9ee:	0985                	addi	s3,s3,1
1c00a9f0:	8a62                	mv	s4,s8
1c00a9f2:	84de                	mv	s1,s7
1c00a9f4:	8c52                	mv	s8,s4
1c00a9f6:	bf79                	j	1c00a994 <_prf+0x40>
1c00a9f8:	0f2a8663          	beq	s5,s2,1c00aae4 <_prf+0x190>
1c00a9fc:	0d596963          	bltu	s2,s5,1c00aace <_prf+0x17a>
1c00aa00:	fa0a8ae3          	beqz	s5,1c00a9b4 <_prf+0x60>
1c00aa04:	0dba8e63          	beq	s5,s11,1c00aae0 <_prf+0x18c>
1c00aa08:	8ba6                	mv	s7,s1
1c00aa0a:	001b8493          	addi	s1,s7,1
1c00aa0e:	fff4ca83          	lbu	s5,-1(s1)
1c00aa12:	1c0007b7          	lui	a5,0x1c000
1c00aa16:	5b878513          	addi	a0,a5,1464 # 1c0005b8 <__DTOR_END__+0x2cc>
1c00aa1a:	85d6                	mv	a1,s5
1c00aa1c:	c1fff0ef          	jal	ra,1c00a63a <strchr>
1c00aa20:	fd61                	bnez	a0,1c00a9f8 <_prf+0xa4>
1c00aa22:	02a00693          	li	a3,42
1c00aa26:	0eda9a63          	bne	s5,a3,1c00ab1a <_prf+0x1c6>
1c00aa2a:	000c2903          	lw	s2,0(s8)
1c00aa2e:	004c0693          	addi	a3,s8,4
1c00aa32:	00095663          	bgez	s2,1c00aa3e <_prf+0xea>
1c00aa36:	4705                	li	a4,1
1c00aa38:	41200933          	neg	s2,s2
1c00aa3c:	c63a                	sw	a4,12(sp)
1c00aa3e:	0004ca83          	lbu	s5,0(s1)
1c00aa42:	8c36                	mv	s8,a3
1c00aa44:	002b8493          	addi	s1,s7,2
1c00aa48:	0c800713          	li	a4,200
1c00aa4c:	01277463          	bleu	s2,a4,1c00aa54 <_prf+0x100>
1c00aa50:	0c800913          	li	s2,200
1c00aa54:	02e00693          	li	a3,46
1c00aa58:	5d7d                	li	s10,-1
1c00aa5a:	02da9463          	bne	s5,a3,1c00aa82 <_prf+0x12e>
1c00aa5e:	0004c703          	lbu	a4,0(s1)
1c00aa62:	02a00793          	li	a5,42
1c00aa66:	10f71063          	bne	a4,a5,1c00ab66 <_prf+0x212>
1c00aa6a:	000c2d03          	lw	s10,0(s8)
1c00aa6e:	0485                	addi	s1,s1,1
1c00aa70:	0c11                	addi	s8,s8,4
1c00aa72:	0c800793          	li	a5,200
1c00aa76:	01a7d363          	ble	s10,a5,1c00aa7c <_prf+0x128>
1c00aa7a:	5d7d                	li	s10,-1
1c00aa7c:	0004ca83          	lbu	s5,0(s1)
1c00aa80:	0485                	addi	s1,s1,1
1c00aa82:	1c0007b7          	lui	a5,0x1c000
1c00aa86:	85d6                	mv	a1,s5
1c00aa88:	5c078513          	addi	a0,a5,1472 # 1c0005c0 <__DTOR_END__+0x2d4>
1c00aa8c:	bafff0ef          	jal	ra,1c00a63a <strchr>
1c00aa90:	c501                	beqz	a0,1c00aa98 <_prf+0x144>
1c00aa92:	0004ca83          	lbu	s5,0(s1)
1c00aa96:	0485                	addi	s1,s1,1
1c00aa98:	06700693          	li	a3,103
1c00aa9c:	1356c263          	blt	a3,s5,1c00abc0 <_prf+0x26c>
1c00aaa0:	06500693          	li	a3,101
1c00aaa4:	1edadd63          	ble	a3,s5,1c00ac9e <_prf+0x34a>
1c00aaa8:	04700693          	li	a3,71
1c00aaac:	0d56c163          	blt	a3,s5,1c00ab6e <_prf+0x21a>
1c00aab0:	04500693          	li	a3,69
1c00aab4:	1edad563          	ble	a3,s5,1c00ac9e <_prf+0x34a>
1c00aab8:	ee0a8ee3          	beqz	s5,1c00a9b4 <_prf+0x60>
1c00aabc:	02500713          	li	a4,37
1c00aac0:	68ea8263          	beq	s5,a4,1c00b144 <_prf+0x7f0>
1c00aac4:	0c800713          	li	a4,200
1c00aac8:	69575763          	ble	s5,a4,1c00b156 <_prf+0x802>
1c00aacc:	b5dd                	j	1c00a9b2 <_prf+0x5e>
1c00aace:	034a8163          	beq	s5,s4,1c00aaf0 <_prf+0x19c>
1c00aad2:	016a8b63          	beq	s5,s6,1c00aae8 <_prf+0x194>
1c00aad6:	f3aa99e3          	bne	s5,s10,1c00aa08 <_prf+0xb4>
1c00aada:	4785                	li	a5,1
1c00aadc:	ca3e                	sw	a5,20(sp)
1c00aade:	b72d                	j	1c00aa08 <_prf+0xb4>
1c00aae0:	4405                	li	s0,1
1c00aae2:	b71d                	j	1c00aa08 <_prf+0xb4>
1c00aae4:	4c85                	li	s9,1
1c00aae6:	b70d                	j	1c00aa08 <_prf+0xb4>
1c00aae8:	03000713          	li	a4,48
1c00aaec:	c83a                	sw	a4,16(sp)
1c00aaee:	bf29                	j	1c00aa08 <_prf+0xb4>
1c00aaf0:	4785                	li	a5,1
1c00aaf2:	c63e                	sw	a5,12(sp)
1c00aaf4:	bf11                	j	1c00aa08 <_prf+0xb4>
1c00aaf6:	02000713          	li	a4,32
1c00aafa:	c83a                	sw	a4,16(sp)
1c00aafc:	4401                	li	s0,0
1c00aafe:	ca02                	sw	zero,20(sp)
1c00ab00:	c602                	sw	zero,12(sp)
1c00ab02:	4c81                	li	s9,0
1c00ab04:	02300913          	li	s2,35
1c00ab08:	02d00a13          	li	s4,45
1c00ab0c:	03000b13          	li	s6,48
1c00ab10:	02b00d13          	li	s10,43
1c00ab14:	02000d93          	li	s11,32
1c00ab18:	bdcd                	j	1c00aa0a <_prf+0xb6>
1c00ab1a:	fd0a8693          	addi	a3,s5,-48
1c00ab1e:	4625                	li	a2,9
1c00ab20:	4901                	li	s2,0
1c00ab22:	45a9                	li	a1,10
1c00ab24:	f2d662e3          	bltu	a2,a3,1c00aa48 <_prf+0xf4>
1c00ab28:	000bc683          	lbu	a3,0(s7)
1c00ab2c:	001b8493          	addi	s1,s7,1
1c00ab30:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xffefff0>
1c00ab34:	8ab6                	mv	s5,a3
1c00ab36:	f0e669e3          	bltu	a2,a4,1c00aa48 <_prf+0xf4>
1c00ab3a:	02b90933          	mul	s2,s2,a1
1c00ab3e:	8ba6                	mv	s7,s1
1c00ab40:	9936                	add	s2,s2,a3
1c00ab42:	fd090913          	addi	s2,s2,-48
1c00ab46:	b7cd                	j	1c00ab28 <_prf+0x1d4>
1c00ab48:	02ad0733          	mul	a4,s10,a0
1c00ab4c:	84ae                	mv	s1,a1
1c00ab4e:	973e                	add	a4,a4,a5
1c00ab50:	fd070d13          	addi	s10,a4,-48
1c00ab54:	0004c783          	lbu	a5,0(s1)
1c00ab58:	00148593          	addi	a1,s1,1
1c00ab5c:	fd078613          	addi	a2,a5,-48
1c00ab60:	fec6f4e3          	bleu	a2,a3,1c00ab48 <_prf+0x1f4>
1c00ab64:	b739                	j	1c00aa72 <_prf+0x11e>
1c00ab66:	4d01                	li	s10,0
1c00ab68:	46a5                	li	a3,9
1c00ab6a:	4529                	li	a0,10
1c00ab6c:	b7e5                	j	1c00ab54 <_prf+0x200>
1c00ab6e:	06300693          	li	a3,99
1c00ab72:	0cda8b63          	beq	s5,a3,1c00ac48 <_prf+0x2f4>
1c00ab76:	0756c563          	blt	a3,s5,1c00abe0 <_prf+0x28c>
1c00ab7a:	05800693          	li	a3,88
1c00ab7e:	f4da93e3          	bne	s5,a3,1c00aac4 <_prf+0x170>
1c00ab82:	04410b93          	addi	s7,sp,68
1c00ab86:	004c0a13          	addi	s4,s8,4
1c00ab8a:	000c2583          	lw	a1,0(s8)
1c00ab8e:	845e                	mv	s0,s7
1c00ab90:	000c8963          	beqz	s9,1c00aba2 <_prf+0x24e>
1c00ab94:	76e1                	lui	a3,0xffff8
1c00ab96:	8306c693          	xori	a3,a3,-2000
1c00ab9a:	04d11223          	sh	a3,68(sp)
1c00ab9e:	04610413          	addi	s0,sp,70
1c00aba2:	86ea                	mv	a3,s10
1c00aba4:	4641                	li	a2,16
1c00aba6:	8522                	mv	a0,s0
1c00aba8:	3165                	jal	1c00a850 <_to_x>
1c00abaa:	05800693          	li	a3,88
1c00abae:	58da8863          	beq	s5,a3,1c00b13e <_prf+0x7ea>
1c00abb2:	41740433          	sub	s0,s0,s7
1c00abb6:	9522                	add	a0,a0,s0
1c00abb8:	01903433          	snez	s0,s9
1c00abbc:	0406                	slli	s0,s0,0x1
1c00abbe:	a8c9                	j	1c00ac90 <_prf+0x33c>
1c00abc0:	07000693          	li	a3,112
1c00abc4:	50da8163          	beq	s5,a3,1c00b0c6 <_prf+0x772>
1c00abc8:	0556c163          	blt	a3,s5,1c00ac0a <_prf+0x2b6>
1c00abcc:	06e00693          	li	a3,110
1c00abd0:	46da8b63          	beq	s5,a3,1c00b046 <_prf+0x6f2>
1c00abd4:	4956c063          	blt	a3,s5,1c00b054 <_prf+0x700>
1c00abd8:	06900693          	li	a3,105
1c00abdc:	eeda94e3          	bne	s5,a3,1c00aac4 <_prf+0x170>
1c00abe0:	000c2a83          	lw	s5,0(s8)
1c00abe4:	004c0a13          	addi	s4,s8,4
1c00abe8:	04410b13          	addi	s6,sp,68
1c00abec:	060ad963          	bgez	s5,1c00ac5e <_prf+0x30a>
1c00abf0:	02d00693          	li	a3,45
1c00abf4:	04d10223          	sb	a3,68(sp)
1c00abf8:	800006b7          	lui	a3,0x80000
1c00abfc:	415005b3          	neg	a1,s5
1c00ac00:	06da9963          	bne	s5,a3,1c00ac72 <_prf+0x31e>
1c00ac04:	800005b7          	lui	a1,0x80000
1c00ac08:	a0ad                	j	1c00ac72 <_prf+0x31e>
1c00ac0a:	07500693          	li	a3,117
1c00ac0e:	50da8063          	beq	s5,a3,1c00b10e <_prf+0x7ba>
1c00ac12:	07800693          	li	a3,120
1c00ac16:	f6da86e3          	beq	s5,a3,1c00ab82 <_prf+0x22e>
1c00ac1a:	07300693          	li	a3,115
1c00ac1e:	eada93e3          	bne	s5,a3,1c00aac4 <_prf+0x170>
1c00ac22:	000c2583          	lw	a1,0(s8)
1c00ac26:	004c0a13          	addi	s4,s8,4
1c00ac2a:	4c81                	li	s9,0
1c00ac2c:	0c800793          	li	a5,200
1c00ac30:	019586b3          	add	a3,a1,s9
1c00ac34:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00ac38:	4a068f63          	beqz	a3,1c00b0f6 <_prf+0x7a2>
1c00ac3c:	0c85                	addi	s9,s9,1
1c00ac3e:	fefc99e3          	bne	s9,a5,1c00ac30 <_prf+0x2dc>
1c00ac42:	4a0d5c63          	bgez	s10,1c00b0fa <_prf+0x7a6>
1c00ac46:	a97d                	j	1c00b104 <_prf+0x7b0>
1c00ac48:	000c2783          	lw	a5,0(s8)
1c00ac4c:	004c0a13          	addi	s4,s8,4
1c00ac50:	040102a3          	sb	zero,69(sp)
1c00ac54:	04f10223          	sb	a5,68(sp)
1c00ac58:	4c85                	li	s9,1
1c00ac5a:	4401                	li	s0,0
1c00ac5c:	a105                	j	1c00b07c <_prf+0x728>
1c00ac5e:	4752                	lw	a4,20(sp)
1c00ac60:	02b00693          	li	a3,43
1c00ac64:	e701                	bnez	a4,1c00ac6c <_prf+0x318>
1c00ac66:	c41d                	beqz	s0,1c00ac94 <_prf+0x340>
1c00ac68:	02000693          	li	a3,32
1c00ac6c:	04d10223          	sb	a3,68(sp)
1c00ac70:	85d6                	mv	a1,s5
1c00ac72:	04510c13          	addi	s8,sp,69
1c00ac76:	86ea                	mv	a3,s10
1c00ac78:	4629                	li	a2,10
1c00ac7a:	8562                	mv	a0,s8
1c00ac7c:	bd5ff0ef          	jal	ra,1c00a850 <_to_x>
1c00ac80:	47d2                	lw	a5,20(sp)
1c00ac82:	9562                	add	a0,a0,s8
1c00ac84:	41650533          	sub	a0,a0,s6
1c00ac88:	eb89                	bnez	a5,1c00ac9a <_prf+0x346>
1c00ac8a:	e019                	bnez	s0,1c00ac90 <_prf+0x33c>
1c00ac8c:	01fad413          	srli	s0,s5,0x1f
1c00ac90:	57fd                	li	a5,-1
1c00ac92:	a9a1                	j	1c00b0ea <_prf+0x796>
1c00ac94:	85d6                	mv	a1,s5
1c00ac96:	8c5a                	mv	s8,s6
1c00ac98:	bff9                	j	1c00ac76 <_prf+0x322>
1c00ac9a:	4452                	lw	s0,20(sp)
1c00ac9c:	bfd5                	j	1c00ac90 <_prf+0x33c>
1c00ac9e:	0c1d                	addi	s8,s8,7
1c00aca0:	ff8c7c13          	andi	s8,s8,-8
1c00aca4:	000c2883          	lw	a7,0(s8)
1c00aca8:	004c2303          	lw	t1,4(s8)
1c00acac:	80000737          	lui	a4,0x80000
1c00acb0:	0158d593          	srli	a1,a7,0x15
1c00acb4:	00b31693          	slli	a3,t1,0xb
1c00acb8:	8ecd                	or	a3,a3,a1
1c00acba:	fff74713          	not	a4,a4
1c00acbe:	01435613          	srli	a2,t1,0x14
1c00acc2:	08ae                	slli	a7,a7,0xb
1c00acc4:	8ef9                	and	a3,a3,a4
1c00acc6:	7ff67613          	andi	a2,a2,2047
1c00acca:	d846                	sw	a7,48(sp)
1c00accc:	da36                	sw	a3,52(sp)
1c00acce:	7ff00593          	li	a1,2047
1c00acd2:	008c0a13          	addi	s4,s8,8
1c00acd6:	08b61d63          	bne	a2,a1,1c00ad70 <_prf+0x41c>
1c00acda:	00d0                	addi	a2,sp,68
1c00acdc:	8732                	mv	a4,a2
1c00acde:	00035863          	bgez	t1,1c00acee <_prf+0x39a>
1c00ace2:	02d00713          	li	a4,45
1c00ace6:	04e10223          	sb	a4,68(sp)
1c00acea:	04510713          	addi	a4,sp,69
1c00acee:	00d8e6b3          	or	a3,a7,a3
1c00acf2:	fbfa8793          	addi	a5,s5,-65
1c00acf6:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00acfa:	eaa1                	bnez	a3,1c00ad4a <_prf+0x3f6>
1c00acfc:	46e5                	li	a3,25
1c00acfe:	02f6ee63          	bltu	a3,a5,1c00ad3a <_prf+0x3e6>
1c00ad02:	6795                	lui	a5,0x5
1c00ad04:	e4978793          	addi	a5,a5,-439 # 4e49 <__rt_hyper_pending_emu_stride+0x4ba1>
1c00ad08:	00f71023          	sh	a5,0(a4)
1c00ad0c:	04600793          	li	a5,70
1c00ad10:	00f70123          	sb	a5,2(a4)
1c00ad14:	000701a3          	sb	zero,3(a4)
1c00ad18:	8d11                	sub	a0,a0,a2
1c00ad1a:	47d2                	lw	a5,20(sp)
1c00ad1c:	48079f63          	bnez	a5,1c00b1ba <_prf+0x866>
1c00ad20:	e419                	bnez	s0,1c00ad2e <_prf+0x3da>
1c00ad22:	04414403          	lbu	s0,68(sp)
1c00ad26:	fd340413          	addi	s0,s0,-45
1c00ad2a:	00143413          	seqz	s0,s0
1c00ad2e:	0c800793          	li	a5,200
1c00ad32:	c8a7c0e3          	blt	a5,a0,1c00a9b2 <_prf+0x5e>
1c00ad36:	8caa                	mv	s9,a0
1c00ad38:	a691                	j	1c00b07c <_prf+0x728>
1c00ad3a:	679d                	lui	a5,0x7
1c00ad3c:	e6978793          	addi	a5,a5,-407 # 6e69 <__rt_hyper_pending_emu_stride+0x6bc1>
1c00ad40:	00f71023          	sh	a5,0(a4)
1c00ad44:	06600793          	li	a5,102
1c00ad48:	b7e1                	j	1c00ad10 <_prf+0x3bc>
1c00ad4a:	46e5                	li	a3,25
1c00ad4c:	00f6ea63          	bltu	a3,a5,1c00ad60 <_prf+0x40c>
1c00ad50:	6791                	lui	a5,0x4
1c00ad52:	14e78793          	addi	a5,a5,334 # 414e <__rt_hyper_pending_emu_stride+0x3ea6>
1c00ad56:	00f71023          	sh	a5,0(a4)
1c00ad5a:	04e00793          	li	a5,78
1c00ad5e:	bf4d                	j	1c00ad10 <_prf+0x3bc>
1c00ad60:	6799                	lui	a5,0x6
1c00ad62:	16e78793          	addi	a5,a5,366 # 616e <__rt_hyper_pending_emu_stride+0x5ec6>
1c00ad66:	00f71023          	sh	a5,0(a4)
1c00ad6a:	06e00793          	li	a5,110
1c00ad6e:	b74d                	j	1c00ad10 <_prf+0x3bc>
1c00ad70:	04600593          	li	a1,70
1c00ad74:	00ba9463          	bne	s5,a1,1c00ad7c <_prf+0x428>
1c00ad78:	06600a93          	li	s5,102
1c00ad7c:	011665b3          	or	a1,a2,a7
1c00ad80:	8dd5                	or	a1,a1,a3
1c00ad82:	c9c9                	beqz	a1,1c00ae14 <_prf+0x4c0>
1c00ad84:	800007b7          	lui	a5,0x80000
1c00ad88:	8edd                	or	a3,a3,a5
1c00ad8a:	da36                	sw	a3,52(sp)
1c00ad8c:	d846                	sw	a7,48(sp)
1c00ad8e:	c0260c13          	addi	s8,a2,-1022
1c00ad92:	02d00693          	li	a3,45
1c00ad96:	00034b63          	bltz	t1,1c00adac <_prf+0x458>
1c00ad9a:	4752                	lw	a4,20(sp)
1c00ad9c:	02b00693          	li	a3,43
1c00ada0:	e711                	bnez	a4,1c00adac <_prf+0x458>
1c00ada2:	04410b13          	addi	s6,sp,68
1c00ada6:	c419                	beqz	s0,1c00adb4 <_prf+0x460>
1c00ada8:	02000693          	li	a3,32
1c00adac:	04d10223          	sb	a3,68(sp)
1c00adb0:	04510b13          	addi	s6,sp,69
1c00adb4:	4b81                	li	s7,0
1c00adb6:	55f9                	li	a1,-2
1c00adb8:	06bc4363          	blt	s8,a1,1c00ae1e <_prf+0x4ca>
1c00adbc:	0b804a63          	bgtz	s8,1c00ae70 <_prf+0x51c>
1c00adc0:	4d91                	li	s11,4
1c00adc2:	1808                	addi	a0,sp,48
1c00adc4:	0c05                	addi	s8,s8,1
1c00adc6:	aebff0ef          	jal	ra,1c00a8b0 <_rlrshift>
1c00adca:	ffbc1ce3          	bne	s8,s11,1c00adc2 <_prf+0x46e>
1c00adce:	000d5363          	bgez	s10,1c00add4 <_prf+0x480>
1c00add2:	4d19                	li	s10,6
1c00add4:	fdfaf593          	andi	a1,s5,-33
1c00add8:	04700513          	li	a0,71
1c00addc:	0ca59663          	bne	a1,a0,1c00aea8 <_prf+0x554>
1c00ade0:	4c01                	li	s8,0
1c00ade2:	000c9463          	bnez	s9,1c00adea <_prf+0x496>
1c00ade6:	01a03c33          	snez	s8,s10
1c00adea:	55f5                	li	a1,-3
1c00adec:	00bbc663          	blt	s7,a1,1c00adf8 <_prf+0x4a4>
1c00adf0:	001d0593          	addi	a1,s10,1
1c00adf4:	0b75df63          	ble	s7,a1,1c00aeb2 <_prf+0x55e>
1c00adf8:	06700593          	li	a1,103
1c00adfc:	14ba8c63          	beq	s5,a1,1c00af54 <_prf+0x600>
1c00ae00:	04500a93          	li	s5,69
1c00ae04:	001d0593          	addi	a1,s10,1
1c00ae08:	4541                	li	a0,16
1c00ae0a:	d62a                	sw	a0,44(sp)
1c00ae0c:	0ab55c63          	ble	a1,a0,1c00aec4 <_prf+0x570>
1c00ae10:	45c1                	li	a1,16
1c00ae12:	a84d                	j	1c00aec4 <_prf+0x570>
1c00ae14:	4c01                	li	s8,0
1c00ae16:	b751                	j	1c00ad9a <_prf+0x446>
1c00ae18:	1808                	addi	a0,sp,48
1c00ae1a:	a97ff0ef          	jal	ra,1c00a8b0 <_rlrshift>
1c00ae1e:	55d2                	lw	a1,52(sp)
1c00ae20:	333337b7          	lui	a5,0x33333
1c00ae24:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732218e>
1c00ae28:	5342                	lw	t1,48(sp)
1c00ae2a:	0c05                	addi	s8,s8,1
1c00ae2c:	feb7e6e3          	bltu	a5,a1,1c00ae18 <_prf+0x4c4>
1c00ae30:	4895                	li	a7,5
1c00ae32:	02b88533          	mul	a0,a7,a1
1c00ae36:	1bfd                	addi	s7,s7,-1
1c00ae38:	0268b5b3          	mulhu	a1,a7,t1
1c00ae3c:	026888b3          	mul	a7,a7,t1
1c00ae40:	95aa                	add	a1,a1,a0
1c00ae42:	da2e                	sw	a1,52(sp)
1c00ae44:	4501                	li	a0,0
1c00ae46:	d846                	sw	a7,48(sp)
1c00ae48:	800006b7          	lui	a3,0x80000
1c00ae4c:	fff6c693          	not	a3,a3
1c00ae50:	00b6f663          	bleu	a1,a3,1c00ae5c <_prf+0x508>
1c00ae54:	d12d                	beqz	a0,1c00adb6 <_prf+0x462>
1c00ae56:	d846                	sw	a7,48(sp)
1c00ae58:	da2e                	sw	a1,52(sp)
1c00ae5a:	bfb1                	j	1c00adb6 <_prf+0x462>
1c00ae5c:	01f8d313          	srli	t1,a7,0x1f
1c00ae60:	00159513          	slli	a0,a1,0x1
1c00ae64:	00a365b3          	or	a1,t1,a0
1c00ae68:	0886                	slli	a7,a7,0x1
1c00ae6a:	1c7d                	addi	s8,s8,-1
1c00ae6c:	4505                	li	a0,1
1c00ae6e:	bfe9                	j	1c00ae48 <_prf+0x4f4>
1c00ae70:	1808                	addi	a0,sp,48
1c00ae72:	a5fff0ef          	jal	ra,1c00a8d0 <_ldiv5>
1c00ae76:	58c2                	lw	a7,48(sp)
1c00ae78:	55d2                	lw	a1,52(sp)
1c00ae7a:	1c7d                	addi	s8,s8,-1
1c00ae7c:	0b85                	addi	s7,s7,1
1c00ae7e:	4501                	li	a0,0
1c00ae80:	80000737          	lui	a4,0x80000
1c00ae84:	fff74713          	not	a4,a4
1c00ae88:	00b77663          	bleu	a1,a4,1c00ae94 <_prf+0x540>
1c00ae8c:	d905                	beqz	a0,1c00adbc <_prf+0x468>
1c00ae8e:	d846                	sw	a7,48(sp)
1c00ae90:	da2e                	sw	a1,52(sp)
1c00ae92:	b72d                	j	1c00adbc <_prf+0x468>
1c00ae94:	01f8d313          	srli	t1,a7,0x1f
1c00ae98:	00159513          	slli	a0,a1,0x1
1c00ae9c:	00a365b3          	or	a1,t1,a0
1c00aea0:	0886                	slli	a7,a7,0x1
1c00aea2:	1c7d                	addi	s8,s8,-1
1c00aea4:	4505                	li	a0,1
1c00aea6:	bfe9                	j	1c00ae80 <_prf+0x52c>
1c00aea8:	06600593          	li	a1,102
1c00aeac:	4c01                	li	s8,0
1c00aeae:	f4ba9be3          	bne	s5,a1,1c00ae04 <_prf+0x4b0>
1c00aeb2:	01ab85b3          	add	a1,s7,s10
1c00aeb6:	06600a93          	li	s5,102
1c00aeba:	f405d7e3          	bgez	a1,1c00ae08 <_prf+0x4b4>
1c00aebe:	45c1                	li	a1,16
1c00aec0:	d62e                	sw	a1,44(sp)
1c00aec2:	4581                	li	a1,0
1c00aec4:	4301                	li	t1,0
1c00aec6:	080003b7          	lui	t2,0x8000
1c00aeca:	dc1a                	sw	t1,56(sp)
1c00aecc:	de1e                	sw	t2,60(sp)
1c00aece:	5dfd                	li	s11,-1
1c00aed0:	15fd                	addi	a1,a1,-1
1c00aed2:	09b59463          	bne	a1,s11,1c00af5a <_prf+0x606>
1c00aed6:	55c2                	lw	a1,48(sp)
1c00aed8:	5562                	lw	a0,56(sp)
1c00aeda:	58d2                	lw	a7,52(sp)
1c00aedc:	5372                	lw	t1,60(sp)
1c00aede:	952e                	add	a0,a0,a1
1c00aee0:	00b535b3          	sltu	a1,a0,a1
1c00aee4:	989a                	add	a7,a7,t1
1c00aee6:	95c6                	add	a1,a1,a7
1c00aee8:	d82a                	sw	a0,48(sp)
1c00aeea:	f0000537          	lui	a0,0xf0000
1c00aeee:	da2e                	sw	a1,52(sp)
1c00aef0:	8de9                	and	a1,a1,a0
1c00aef2:	c981                	beqz	a1,1c00af02 <_prf+0x5ae>
1c00aef4:	1808                	addi	a0,sp,48
1c00aef6:	9dbff0ef          	jal	ra,1c00a8d0 <_ldiv5>
1c00aefa:	1808                	addi	a0,sp,48
1c00aefc:	9b5ff0ef          	jal	ra,1c00a8b0 <_rlrshift>
1c00af00:	0b85                	addi	s7,s7,1
1c00af02:	06600593          	li	a1,102
1c00af06:	001b0d93          	addi	s11,s6,1
1c00af0a:	08ba9663          	bne	s5,a1,1c00af96 <_prf+0x642>
1c00af0e:	05705f63          	blez	s7,1c00af6c <_prf+0x618>
1c00af12:	017b0db3          	add	s11,s6,s7
1c00af16:	106c                	addi	a1,sp,44
1c00af18:	1808                	addi	a0,sp,48
1c00af1a:	0b05                	addi	s6,s6,1
1c00af1c:	9fdff0ef          	jal	ra,1c00a918 <_get_digit>
1c00af20:	feab0fa3          	sb	a0,-1(s6)
1c00af24:	ffbb19e3          	bne	s6,s11,1c00af16 <_prf+0x5c2>
1c00af28:	4b81                	li	s7,0
1c00af2a:	000c9463          	bnez	s9,1c00af32 <_prf+0x5de>
1c00af2e:	020d0063          	beqz	s10,1c00af4e <_prf+0x5fa>
1c00af32:	02e00613          	li	a2,46
1c00af36:	00cd8023          	sb	a2,0(s11)
1c00af3a:	8b6e                	mv	s6,s11
1c00af3c:	01ad8cb3          	add	s9,s11,s10
1c00af40:	03000313          	li	t1,48
1c00af44:	036c9963          	bne	s9,s6,1c00af76 <_prf+0x622>
1c00af48:	001d0713          	addi	a4,s10,1
1c00af4c:	9dba                	add	s11,s11,a4
1c00af4e:	060c1e63          	bnez	s8,1c00afca <_prf+0x676>
1c00af52:	a8d1                	j	1c00b026 <_prf+0x6d2>
1c00af54:	06500a93          	li	s5,101
1c00af58:	b575                	j	1c00ae04 <_prf+0x4b0>
1c00af5a:	1828                	addi	a0,sp,56
1c00af5c:	c42e                	sw	a1,8(sp)
1c00af5e:	973ff0ef          	jal	ra,1c00a8d0 <_ldiv5>
1c00af62:	1828                	addi	a0,sp,56
1c00af64:	94dff0ef          	jal	ra,1c00a8b0 <_rlrshift>
1c00af68:	45a2                	lw	a1,8(sp)
1c00af6a:	b79d                	j	1c00aed0 <_prf+0x57c>
1c00af6c:	03000593          	li	a1,48
1c00af70:	00bb0023          	sb	a1,0(s6)
1c00af74:	bf5d                	j	1c00af2a <_prf+0x5d6>
1c00af76:	000b8763          	beqz	s7,1c00af84 <_prf+0x630>
1c00af7a:	006b00a3          	sb	t1,1(s6)
1c00af7e:	0b85                	addi	s7,s7,1
1c00af80:	0b05                	addi	s6,s6,1
1c00af82:	b7c9                	j	1c00af44 <_prf+0x5f0>
1c00af84:	106c                	addi	a1,sp,44
1c00af86:	1808                	addi	a0,sp,48
1c00af88:	c41a                	sw	t1,8(sp)
1c00af8a:	98fff0ef          	jal	ra,1c00a918 <_get_digit>
1c00af8e:	00ab00a3          	sb	a0,1(s6)
1c00af92:	4322                	lw	t1,8(sp)
1c00af94:	b7f5                	j	1c00af80 <_prf+0x62c>
1c00af96:	106c                	addi	a1,sp,44
1c00af98:	1808                	addi	a0,sp,48
1c00af9a:	97fff0ef          	jal	ra,1c00a918 <_get_digit>
1c00af9e:	00ab0023          	sb	a0,0(s6)
1c00afa2:	03000593          	li	a1,48
1c00afa6:	00b50363          	beq	a0,a1,1c00afac <_prf+0x658>
1c00afaa:	1bfd                	addi	s7,s7,-1
1c00afac:	000c9463          	bnez	s9,1c00afb4 <_prf+0x660>
1c00afb0:	000d0b63          	beqz	s10,1c00afc6 <_prf+0x672>
1c00afb4:	002b0d93          	addi	s11,s6,2
1c00afb8:	02e00593          	li	a1,46
1c00afbc:	00bb00a3          	sb	a1,1(s6)
1c00afc0:	9d6e                	add	s10,s10,s11
1c00afc2:	07bd1863          	bne	s10,s11,1c00b032 <_prf+0x6de>
1c00afc6:	000c0f63          	beqz	s8,1c00afe4 <_prf+0x690>
1c00afca:	03000593          	li	a1,48
1c00afce:	fffdc603          	lbu	a2,-1(s11)
1c00afd2:	fffd8713          	addi	a4,s11,-1
1c00afd6:	06b60663          	beq	a2,a1,1c00b042 <_prf+0x6ee>
1c00afda:	02e00593          	li	a1,46
1c00afde:	00b61363          	bne	a2,a1,1c00afe4 <_prf+0x690>
1c00afe2:	8dba                	mv	s11,a4
1c00afe4:	fdfaf713          	andi	a4,s5,-33
1c00afe8:	04500613          	li	a2,69
1c00afec:	02c71d63          	bne	a4,a2,1c00b026 <_prf+0x6d2>
1c00aff0:	87d6                	mv	a5,s5
1c00aff2:	00fd8023          	sb	a5,0(s11)
1c00aff6:	02b00793          	li	a5,43
1c00affa:	000bd663          	bgez	s7,1c00b006 <_prf+0x6b2>
1c00affe:	41700bb3          	neg	s7,s7
1c00b002:	02d00793          	li	a5,45
1c00b006:	00fd80a3          	sb	a5,1(s11)
1c00b00a:	47a9                	li	a5,10
1c00b00c:	02fbc733          	div	a4,s7,a5
1c00b010:	0d91                	addi	s11,s11,4
1c00b012:	02fbe6b3          	rem	a3,s7,a5
1c00b016:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b01a:	feed8f23          	sb	a4,-2(s11)
1c00b01e:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b022:	fedd8fa3          	sb	a3,-1(s11)
1c00b026:	00c8                	addi	a0,sp,68
1c00b028:	000d8023          	sb	zero,0(s11)
1c00b02c:	40ad8533          	sub	a0,s11,a0
1c00b030:	b1ed                	j	1c00ad1a <_prf+0x3c6>
1c00b032:	106c                	addi	a1,sp,44
1c00b034:	1808                	addi	a0,sp,48
1c00b036:	0d85                	addi	s11,s11,1
1c00b038:	8e1ff0ef          	jal	ra,1c00a918 <_get_digit>
1c00b03c:	fead8fa3          	sb	a0,-1(s11)
1c00b040:	b749                	j	1c00afc2 <_prf+0x66e>
1c00b042:	8dba                	mv	s11,a4
1c00b044:	b769                	j	1c00afce <_prf+0x67a>
1c00b046:	000c2783          	lw	a5,0(s8)
1c00b04a:	004c0a13          	addi	s4,s8,4
1c00b04e:	0137a023          	sw	s3,0(a5)
1c00b052:	b24d                	j	1c00a9f4 <_prf+0xa0>
1c00b054:	004c0a13          	addi	s4,s8,4
1c00b058:	000c2583          	lw	a1,0(s8)
1c00b05c:	00dc                	addi	a5,sp,68
1c00b05e:	040c8463          	beqz	s9,1c00b0a6 <_prf+0x752>
1c00b062:	03000693          	li	a3,48
1c00b066:	04d10223          	sb	a3,68(sp)
1c00b06a:	04510513          	addi	a0,sp,69
1c00b06e:	ed8d                	bnez	a1,1c00b0a8 <_prf+0x754>
1c00b070:	040102a3          	sb	zero,69(sp)
1c00b074:	57fd                	li	a5,-1
1c00b076:	4401                	li	s0,0
1c00b078:	0efd1163          	bne	s10,a5,1c00b15a <_prf+0x806>
1c00b07c:	0f2cc363          	blt	s9,s2,1c00b162 <_prf+0x80e>
1c00b080:	8966                	mv	s2,s9
1c00b082:	00c0                	addi	s0,sp,68
1c00b084:	40898ab3          	sub	s5,s3,s0
1c00b088:	5b7d                	li	s6,-1
1c00b08a:	015409b3          	add	s3,s0,s5
1c00b08e:	960903e3          	beqz	s2,1c00a9f4 <_prf+0xa0>
1c00b092:	45f2                	lw	a1,28(sp)
1c00b094:	00044503          	lbu	a0,0(s0)
1c00b098:	47e2                	lw	a5,24(sp)
1c00b09a:	9782                	jalr	a5
1c00b09c:	91650be3          	beq	a0,s6,1c00a9b2 <_prf+0x5e>
1c00b0a0:	197d                	addi	s2,s2,-1
1c00b0a2:	0405                	addi	s0,s0,1
1c00b0a4:	b7dd                	j	1c00b08a <_prf+0x736>
1c00b0a6:	853e                	mv	a0,a5
1c00b0a8:	86ea                	mv	a3,s10
1c00b0aa:	4621                	li	a2,8
1c00b0ac:	40f50433          	sub	s0,a0,a5
1c00b0b0:	fa0ff0ef          	jal	ra,1c00a850 <_to_x>
1c00b0b4:	9522                	add	a0,a0,s0
1c00b0b6:	57fd                	li	a5,-1
1c00b0b8:	4401                	li	s0,0
1c00b0ba:	c6fd0ae3          	beq	s10,a5,1c00ad2e <_prf+0x3da>
1c00b0be:	02000793          	li	a5,32
1c00b0c2:	c83e                	sw	a5,16(sp)
1c00b0c4:	b1ad                	j	1c00ad2e <_prf+0x3da>
1c00b0c6:	000c2583          	lw	a1,0(s8)
1c00b0ca:	77e1                	lui	a5,0xffff8
1c00b0cc:	8307c793          	xori	a5,a5,-2000
1c00b0d0:	46a1                	li	a3,8
1c00b0d2:	4641                	li	a2,16
1c00b0d4:	04610513          	addi	a0,sp,70
1c00b0d8:	04f11223          	sh	a5,68(sp)
1c00b0dc:	f74ff0ef          	jal	ra,1c00a850 <_to_x>
1c00b0e0:	004c0a13          	addi	s4,s8,4
1c00b0e4:	0509                	addi	a0,a0,2
1c00b0e6:	57fd                	li	a5,-1
1c00b0e8:	4401                	li	s0,0
1c00b0ea:	c4fd02e3          	beq	s10,a5,1c00ad2e <_prf+0x3da>
1c00b0ee:	02000713          	li	a4,32
1c00b0f2:	c83a                	sw	a4,16(sp)
1c00b0f4:	b92d                	j	1c00ad2e <_prf+0x3da>
1c00b0f6:	000d4563          	bltz	s10,1c00b100 <_prf+0x7ac>
1c00b0fa:	019d5363          	ble	s9,s10,1c00b100 <_prf+0x7ac>
1c00b0fe:	8cea                	mv	s9,s10
1c00b100:	8e0c8ae3          	beqz	s9,1c00a9f4 <_prf+0xa0>
1c00b104:	8666                	mv	a2,s9
1c00b106:	00c8                	addi	a0,sp,68
1c00b108:	ce4ff0ef          	jal	ra,1c00a5ec <memcpy>
1c00b10c:	b6b9                	j	1c00ac5a <_prf+0x306>
1c00b10e:	000c2583          	lw	a1,0(s8)
1c00b112:	86ea                	mv	a3,s10
1c00b114:	4629                	li	a2,10
1c00b116:	00c8                	addi	a0,sp,68
1c00b118:	004c0a13          	addi	s4,s8,4
1c00b11c:	f34ff0ef          	jal	ra,1c00a850 <_to_x>
1c00b120:	bf59                	j	1c00b0b6 <_prf+0x762>
1c00b122:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b126:	0ff67613          	andi	a2,a2,255
1c00b12a:	00c5e563          	bltu	a1,a2,1c00b134 <_prf+0x7e0>
1c00b12e:	1781                	addi	a5,a5,-32
1c00b130:	00f68023          	sb	a5,0(a3)
1c00b134:	0685                	addi	a3,a3,1
1c00b136:	0006c783          	lbu	a5,0(a3)
1c00b13a:	f7e5                	bnez	a5,1c00b122 <_prf+0x7ce>
1c00b13c:	bc9d                	j	1c00abb2 <_prf+0x25e>
1c00b13e:	86de                	mv	a3,s7
1c00b140:	45e5                	li	a1,25
1c00b142:	bfd5                	j	1c00b136 <_prf+0x7e2>
1c00b144:	45f2                	lw	a1,28(sp)
1c00b146:	4762                	lw	a4,24(sp)
1c00b148:	02500513          	li	a0,37
1c00b14c:	9702                	jalr	a4
1c00b14e:	57fd                	li	a5,-1
1c00b150:	86f501e3          	beq	a0,a5,1c00a9b2 <_prf+0x5e>
1c00b154:	0985                	addi	s3,s3,1
1c00b156:	8a62                	mv	s4,s8
1c00b158:	b871                	j	1c00a9f4 <_prf+0xa0>
1c00b15a:	02000793          	li	a5,32
1c00b15e:	c83e                	sw	a5,16(sp)
1c00b160:	bf31                	j	1c00b07c <_prf+0x728>
1c00b162:	4732                	lw	a4,12(sp)
1c00b164:	cf01                	beqz	a4,1c00b17c <_prf+0x828>
1c00b166:	02000713          	li	a4,32
1c00b16a:	00d4                	addi	a3,sp,68
1c00b16c:	019687b3          	add	a5,a3,s9
1c00b170:	00e78023          	sb	a4,0(a5)
1c00b174:	0c85                	addi	s9,s9,1
1c00b176:	ff991ae3          	bne	s2,s9,1c00b16a <_prf+0x816>
1c00b17a:	b721                	j	1c00b082 <_prf+0x72e>
1c00b17c:	00cc                	addi	a1,sp,68
1c00b17e:	41990bb3          	sub	s7,s2,s9
1c00b182:	001c8613          	addi	a2,s9,1
1c00b186:	01758533          	add	a0,a1,s7
1c00b18a:	c7aff0ef          	jal	ra,1c00a604 <memmove>
1c00b18e:	4742                	lw	a4,16(sp)
1c00b190:	02000793          	li	a5,32
1c00b194:	00f70363          	beq	a4,a5,1c00b19a <_prf+0x846>
1c00b198:	c622                	sw	s0,12(sp)
1c00b19a:	47b2                	lw	a5,12(sp)
1c00b19c:	9bbe                	add	s7,s7,a5
1c00b19e:	4732                	lw	a4,12(sp)
1c00b1a0:	ef7751e3          	ble	s7,a4,1c00b082 <_prf+0x72e>
1c00b1a4:	4732                	lw	a4,12(sp)
1c00b1a6:	00d4                	addi	a3,sp,68
1c00b1a8:	00e687b3          	add	a5,a3,a4
1c00b1ac:	4742                	lw	a4,16(sp)
1c00b1ae:	00e78023          	sb	a4,0(a5)
1c00b1b2:	47b2                	lw	a5,12(sp)
1c00b1b4:	0785                	addi	a5,a5,1
1c00b1b6:	c63e                	sw	a5,12(sp)
1c00b1b8:	b7dd                	j	1c00b19e <_prf+0x84a>
1c00b1ba:	4452                	lw	s0,20(sp)
1c00b1bc:	be8d                	j	1c00ad2e <_prf+0x3da>

1c00b1be <__rt_uart_cluster_req_done>:
1c00b1be:	300476f3          	csrrci	a3,mstatus,8
1c00b1c2:	4785                	li	a5,1
1c00b1c4:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b1c8:	09954783          	lbu	a5,153(a0)
1c00b1cc:	00201737          	lui	a4,0x201
1c00b1d0:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c00b1d4:	04078793          	addi	a5,a5,64
1c00b1d8:	07da                	slli	a5,a5,0x16
1c00b1da:	97ba                	add	a5,a5,a4
1c00b1dc:	0007a023          	sw	zero,0(a5)
1c00b1e0:	30069073          	csrw	mstatus,a3
1c00b1e4:	8082                	ret

1c00b1e6 <__rt_uart_setup.isra.6>:
1c00b1e6:	1c002737          	lui	a4,0x1c002
1c00b1ea:	94872703          	lw	a4,-1720(a4) # 1c001948 <__rt_freq_domains>
1c00b1ee:	00155793          	srli	a5,a0,0x1
1c00b1f2:	97ba                	add	a5,a5,a4
1c00b1f4:	02a7d7b3          	divu	a5,a5,a0
1c00b1f8:	1a102737          	lui	a4,0x1a102
1c00b1fc:	17fd                	addi	a5,a5,-1
1c00b1fe:	07c2                	slli	a5,a5,0x10
1c00b200:	3067e793          	ori	a5,a5,774
1c00b204:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102184>
1c00b208:	8082                	ret

1c00b20a <__rt_uart_setfreq_after>:
1c00b20a:	1c0027b7          	lui	a5,0x1c002
1c00b20e:	8c878793          	addi	a5,a5,-1848 # 1c0018c8 <__rt_uart>
1c00b212:	4398                	lw	a4,0(a5)
1c00b214:	cb09                	beqz	a4,1c00b226 <__rt_uart_setfreq_after+0x1c>
1c00b216:	4788                	lw	a0,8(a5)
1c00b218:	1141                	addi	sp,sp,-16
1c00b21a:	c606                	sw	ra,12(sp)
1c00b21c:	37e9                	jal	1c00b1e6 <__rt_uart_setup.isra.6>
1c00b21e:	40b2                	lw	ra,12(sp)
1c00b220:	4501                	li	a0,0
1c00b222:	0141                	addi	sp,sp,16
1c00b224:	8082                	ret
1c00b226:	4501                	li	a0,0
1c00b228:	8082                	ret

1c00b22a <__rt_uart_cluster_req>:
1c00b22a:	1141                	addi	sp,sp,-16
1c00b22c:	c606                	sw	ra,12(sp)
1c00b22e:	c422                	sw	s0,8(sp)
1c00b230:	30047473          	csrrci	s0,mstatus,8
1c00b234:	1c00b7b7          	lui	a5,0x1c00b
1c00b238:	1be78793          	addi	a5,a5,446 # 1c00b1be <__rt_uart_cluster_req_done>
1c00b23c:	c55c                	sw	a5,12(a0)
1c00b23e:	4785                	li	a5,1
1c00b240:	d55c                	sw	a5,44(a0)
1c00b242:	411c                	lw	a5,0(a0)
1c00b244:	02052823          	sw	zero,48(a0)
1c00b248:	c908                	sw	a0,16(a0)
1c00b24a:	43cc                	lw	a1,4(a5)
1c00b24c:	4514                	lw	a3,8(a0)
1c00b24e:	4150                	lw	a2,4(a0)
1c00b250:	0586                	slli	a1,a1,0x1
1c00b252:	00c50793          	addi	a5,a0,12
1c00b256:	4701                	li	a4,0
1c00b258:	0585                	addi	a1,a1,1
1c00b25a:	4501                	li	a0,0
1c00b25c:	e99fe0ef          	jal	ra,1c00a0f4 <rt_periph_copy>
1c00b260:	30041073          	csrw	mstatus,s0
1c00b264:	40b2                	lw	ra,12(sp)
1c00b266:	4422                	lw	s0,8(sp)
1c00b268:	0141                	addi	sp,sp,16
1c00b26a:	8082                	ret

1c00b26c <__rt_uart_wait_tx_done.isra.5>:
1c00b26c:	1a102737          	lui	a4,0x1a102
1c00b270:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa102178>
1c00b274:	8bc1                	andi	a5,a5,16
1c00b276:	e7b9                	bnez	a5,1c00b2c4 <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b278:	1a102737          	lui	a4,0x1a102
1c00b27c:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa102180>
1c00b280:	8b85                	andi	a5,a5,1
1c00b282:	ffed                	bnez	a5,1c00b27c <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b284:	f14027f3          	csrr	a5,mhartid
1c00b288:	8795                	srai	a5,a5,0x5
1c00b28a:	1a10a637          	lui	a2,0x1a10a
1c00b28e:	03f7f793          	andi	a5,a5,63
1c00b292:	03200693          	li	a3,50
1c00b296:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa1097f4>
1c00b29a:	6711                	lui	a4,0x4
1c00b29c:	6311                	lui	t1,0x4
1c00b29e:	45fd                	li	a1,31
1c00b2a0:	00204537          	lui	a0,0x204
1c00b2a4:	88be                	mv	a7,a5
1c00b2a6:	00682023          	sw	t1,0(a6)
1c00b2aa:	02b79063          	bne	a5,a1,1c00b2ca <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b2ae:	80e62223          	sw	a4,-2044(a2)
1c00b2b2:	10500073          	wfi
1c00b2b6:	00b89c63          	bne	a7,a1,1c00b2ce <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b2ba:	80e62423          	sw	a4,-2040(a2)
1c00b2be:	16fd                	addi	a3,a3,-1
1c00b2c0:	f2fd                	bnez	a3,1c00b2a6 <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b2c2:	8082                	ret
1c00b2c4:	10500073          	wfi
1c00b2c8:	b765                	j	1c00b270 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b2ca:	c958                	sw	a4,20(a0)
1c00b2cc:	b7dd                	j	1c00b2b2 <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b2ce:	c918                	sw	a4,16(a0)
1c00b2d0:	b7fd                	j	1c00b2be <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b2d2 <__rt_uart_setfreq_before>:
1c00b2d2:	1c0027b7          	lui	a5,0x1c002
1c00b2d6:	8c87a783          	lw	a5,-1848(a5) # 1c0018c8 <__rt_uart>
1c00b2da:	cf99                	beqz	a5,1c00b2f8 <__rt_uart_setfreq_before+0x26>
1c00b2dc:	1141                	addi	sp,sp,-16
1c00b2de:	c606                	sw	ra,12(sp)
1c00b2e0:	3771                	jal	1c00b26c <__rt_uart_wait_tx_done.isra.5>
1c00b2e2:	40b2                	lw	ra,12(sp)
1c00b2e4:	005007b7          	lui	a5,0x500
1c00b2e8:	1a102737          	lui	a4,0x1a102
1c00b2ec:	0799                	addi	a5,a5,6
1c00b2ee:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102184>
1c00b2f2:	4501                	li	a0,0
1c00b2f4:	0141                	addi	sp,sp,16
1c00b2f6:	8082                	ret
1c00b2f8:	4501                	li	a0,0
1c00b2fa:	8082                	ret

1c00b2fc <soc_eu_fcEventMask_setEvent>:
1c00b2fc:	47fd                	li	a5,31
1c00b2fe:	4721                	li	a4,8
1c00b300:	00a7d463          	ble	a0,a5,1c00b308 <soc_eu_fcEventMask_setEvent+0xc>
1c00b304:	1501                	addi	a0,a0,-32
1c00b306:	4711                	li	a4,4
1c00b308:	1a1067b7          	lui	a5,0x1a106
1c00b30c:	973e                	add	a4,a4,a5
1c00b30e:	4314                	lw	a3,0(a4)
1c00b310:	4785                	li	a5,1
1c00b312:	00a79533          	sll	a0,a5,a0
1c00b316:	fff54513          	not	a0,a0
1c00b31a:	8d75                	and	a0,a0,a3
1c00b31c:	c308                	sw	a0,0(a4)
1c00b31e:	8082                	ret

1c00b320 <rt_uart_conf_init>:
1c00b320:	000997b7          	lui	a5,0x99
1c00b324:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x88988>
1c00b328:	c11c                	sw	a5,0(a0)
1c00b32a:	57fd                	li	a5,-1
1c00b32c:	c15c                	sw	a5,4(a0)
1c00b32e:	8082                	ret

1c00b330 <__rt_uart_open>:
1c00b330:	1141                	addi	sp,sp,-16
1c00b332:	c606                	sw	ra,12(sp)
1c00b334:	c422                	sw	s0,8(sp)
1c00b336:	c226                	sw	s1,4(sp)
1c00b338:	c04a                	sw	s2,0(sp)
1c00b33a:	30047973          	csrrci	s2,mstatus,8
1c00b33e:	cd8d                	beqz	a1,1c00b378 <__rt_uart_open+0x48>
1c00b340:	4194                	lw	a3,0(a1)
1c00b342:	1c0027b7          	lui	a5,0x1c002
1c00b346:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f401d>
1c00b34a:	8c878413          	addi	s0,a5,-1848 # 1c0018c8 <__rt_uart>
1c00b34e:	0712                	slli	a4,a4,0x4
1c00b350:	943a                	add	s0,s0,a4
1c00b352:	4010                	lw	a2,0(s0)
1c00b354:	8c878793          	addi	a5,a5,-1848
1c00b358:	c60d                	beqz	a2,1c00b382 <__rt_uart_open+0x52>
1c00b35a:	c589                	beqz	a1,1c00b364 <__rt_uart_open+0x34>
1c00b35c:	418c                	lw	a1,0(a1)
1c00b35e:	4414                	lw	a3,8(s0)
1c00b360:	04d59a63          	bne	a1,a3,1c00b3b4 <__rt_uart_open+0x84>
1c00b364:	97ba                	add	a5,a5,a4
1c00b366:	0605                	addi	a2,a2,1
1c00b368:	c390                	sw	a2,0(a5)
1c00b36a:	8522                	mv	a0,s0
1c00b36c:	40b2                	lw	ra,12(sp)
1c00b36e:	4422                	lw	s0,8(sp)
1c00b370:	4492                	lw	s1,4(sp)
1c00b372:	4902                	lw	s2,0(sp)
1c00b374:	0141                	addi	sp,sp,16
1c00b376:	8082                	ret
1c00b378:	000996b7          	lui	a3,0x99
1c00b37c:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x88988>
1c00b380:	b7c9                	j	1c00b342 <__rt_uart_open+0x12>
1c00b382:	4785                	li	a5,1
1c00b384:	1a102737          	lui	a4,0x1a102
1c00b388:	c01c                	sw	a5,0(s0)
1c00b38a:	c048                	sw	a0,4(s0)
1c00b38c:	c414                	sw	a3,8(s0)
1c00b38e:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa102760>
1c00b392:	00a797b3          	sll	a5,a5,a0
1c00b396:	00151493          	slli	s1,a0,0x1
1c00b39a:	8fd5                	or	a5,a5,a3
1c00b39c:	78f72023          	sw	a5,1920(a4)
1c00b3a0:	8526                	mv	a0,s1
1c00b3a2:	3fa9                	jal	1c00b2fc <soc_eu_fcEventMask_setEvent>
1c00b3a4:	00148513          	addi	a0,s1,1
1c00b3a8:	3f91                	jal	1c00b2fc <soc_eu_fcEventMask_setEvent>
1c00b3aa:	4408                	lw	a0,8(s0)
1c00b3ac:	3d2d                	jal	1c00b1e6 <__rt_uart_setup.isra.6>
1c00b3ae:	30091073          	csrw	mstatus,s2
1c00b3b2:	bf65                	j	1c00b36a <__rt_uart_open+0x3a>
1c00b3b4:	4401                	li	s0,0
1c00b3b6:	bf55                	j	1c00b36a <__rt_uart_open+0x3a>

1c00b3b8 <rt_uart_close>:
1c00b3b8:	1141                	addi	sp,sp,-16
1c00b3ba:	c606                	sw	ra,12(sp)
1c00b3bc:	c422                	sw	s0,8(sp)
1c00b3be:	c226                	sw	s1,4(sp)
1c00b3c0:	300474f3          	csrrci	s1,mstatus,8
1c00b3c4:	411c                	lw	a5,0(a0)
1c00b3c6:	17fd                	addi	a5,a5,-1
1c00b3c8:	c11c                	sw	a5,0(a0)
1c00b3ca:	e78d                	bnez	a5,1c00b3f4 <rt_uart_close+0x3c>
1c00b3cc:	842a                	mv	s0,a0
1c00b3ce:	3d79                	jal	1c00b26c <__rt_uart_wait_tx_done.isra.5>
1c00b3d0:	005007b7          	lui	a5,0x500
1c00b3d4:	1a102737          	lui	a4,0x1a102
1c00b3d8:	0799                	addi	a5,a5,6
1c00b3da:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102184>
1c00b3de:	4050                	lw	a2,4(s0)
1c00b3e0:	78072683          	lw	a3,1920(a4)
1c00b3e4:	4785                	li	a5,1
1c00b3e6:	00c797b3          	sll	a5,a5,a2
1c00b3ea:	fff7c793          	not	a5,a5
1c00b3ee:	8ff5                	and	a5,a5,a3
1c00b3f0:	78f72023          	sw	a5,1920(a4)
1c00b3f4:	30049073          	csrw	mstatus,s1
1c00b3f8:	40b2                	lw	ra,12(sp)
1c00b3fa:	4422                	lw	s0,8(sp)
1c00b3fc:	4492                	lw	s1,4(sp)
1c00b3fe:	0141                	addi	sp,sp,16
1c00b400:	8082                	ret

1c00b402 <rt_uart_cluster_write>:
1c00b402:	f14027f3          	csrr	a5,mhartid
1c00b406:	8795                	srai	a5,a5,0x5
1c00b408:	03f7f793          	andi	a5,a5,63
1c00b40c:	08f68ca3          	sb	a5,153(a3)
1c00b410:	1c00b7b7          	lui	a5,0x1c00b
1c00b414:	22a78793          	addi	a5,a5,554 # 1c00b22a <__rt_uart_cluster_req>
1c00b418:	c6dc                	sw	a5,12(a3)
1c00b41a:	4785                	li	a5,1
1c00b41c:	c288                	sw	a0,0(a3)
1c00b41e:	c2cc                	sw	a1,4(a3)
1c00b420:	c690                	sw	a2,8(a3)
1c00b422:	08068c23          	sb	zero,152(a3)
1c00b426:	0206a823          	sw	zero,48(a3)
1c00b42a:	ca94                	sw	a3,16(a3)
1c00b42c:	d6dc                	sw	a5,44(a3)
1c00b42e:	00c68513          	addi	a0,a3,12
1c00b432:	ab7fd06f          	j	1c008ee8 <__rt_cluster_push_fc_event>

1c00b436 <__rt_uart_init>:
1c00b436:	1c00b5b7          	lui	a1,0x1c00b
1c00b43a:	1141                	addi	sp,sp,-16
1c00b43c:	4601                	li	a2,0
1c00b43e:	2d258593          	addi	a1,a1,722 # 1c00b2d2 <__rt_uart_setfreq_before>
1c00b442:	4511                	li	a0,4
1c00b444:	c606                	sw	ra,12(sp)
1c00b446:	c422                	sw	s0,8(sp)
1c00b448:	8bcfe0ef          	jal	ra,1c009504 <__rt_cbsys_add>
1c00b44c:	1c00b5b7          	lui	a1,0x1c00b
1c00b450:	842a                	mv	s0,a0
1c00b452:	4601                	li	a2,0
1c00b454:	20a58593          	addi	a1,a1,522 # 1c00b20a <__rt_uart_setfreq_after>
1c00b458:	4515                	li	a0,5
1c00b45a:	8aafe0ef          	jal	ra,1c009504 <__rt_cbsys_add>
1c00b45e:	1c0027b7          	lui	a5,0x1c002
1c00b462:	8c07a423          	sw	zero,-1848(a5) # 1c0018c8 <__rt_uart>
1c00b466:	8d41                	or	a0,a0,s0
1c00b468:	c105                	beqz	a0,1c00b488 <__rt_uart_init+0x52>
1c00b46a:	f1402673          	csrr	a2,mhartid
1c00b46e:	1c000537          	lui	a0,0x1c000
1c00b472:	40565593          	srai	a1,a2,0x5
1c00b476:	03f5f593          	andi	a1,a1,63
1c00b47a:	8a7d                	andi	a2,a2,31
1c00b47c:	5c850513          	addi	a0,a0,1480 # 1c0005c8 <__DTOR_END__+0x2dc>
1c00b480:	ba6ff0ef          	jal	ra,1c00a826 <printf>
1c00b484:	b2eff0ef          	jal	ra,1c00a7b2 <abort>
1c00b488:	40b2                	lw	ra,12(sp)
1c00b48a:	4422                	lw	s0,8(sp)
1c00b48c:	0141                	addi	sp,sp,16
1c00b48e:	8082                	ret

Disassembly of section .text.cluster:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x1f4020>
1c010016:	0e059863          	bnez	a1,1c010106 <__rt_slave_start>
1c01001a:	e3ff0417          	auipc	s0,0xe3ff0
1c01001e:	fea40413          	addi	s0,s0,-22 # 4 <__rt_bridge_flash_handle>
1c010022:	002049b7          	lui	s3,0x204
1c010026:	4a09                	li	s4,2
1c010028:	00000a97          	auipc	s5,0x0
1c01002c:	034a8a93          	addi	s5,s5,52 # 1c01005c <__rt_master_event>
1c010030:	ffff2b97          	auipc	s7,0xffff2
1c010034:	8e8b8b93          	addi	s7,s7,-1816 # 1c001918 <__rt_fc_cluster_data>
1c010038:	02800393          	li	t2,40
1c01003c:	02a383b3          	mul	t2,t2,a0
1c010040:	9b9e                	add	s7,s7,t2
1c010042:	0b91                	addi	s7,s7,4
1c010044:	1a10acb7          	lui	s9,0x1a10a
1c010048:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_end+0xa1097f0>
1c01004c:	4c09                	li	s8,2
1c01004e:	00000d17          	auipc	s10,0x0
1c010052:	0f6d0d13          	addi	s10,s10,246 # 1c010144 <__rt_set_slave_stack>
1c010056:	001d6d13          	ori	s10,s10,1
1c01005a:	a819                	j	1c010070 <__rt_master_loop>

1c01005c <__rt_master_event>:
1c01005c:	000b0a63          	beqz	s6,1c010070 <__rt_master_loop>

1c010060 <__rt_push_event_to_fc_retry>:
1c010060:	000ba283          	lw	t0,0(s7)
1c010064:	08029a63          	bnez	t0,1c0100f8 <__rt_push_event_to_fc_wait>
1c010068:	016ba023          	sw	s6,0(s7)
1c01006c:	018ca023          	sw	s8,0(s9)

1c010070 <__rt_master_loop>:
1c010070:	00042e03          	lw	t3,0(s0)
1c010074:	060e0b63          	beqz	t3,1c0100ea <__rt_master_sleep>

1c010078 <__rt_master_loop_update_next>:
1c010078:	020e2e83          	lw	t4,32(t3)
1c01007c:	020e2223          	sw	zero,36(t3)
1c010080:	01d42023          	sw	t4,0(s0)
1c010084:	020e2f03          	lw	t5,32(t3)
1c010088:	ffee98e3          	bne	t4,t5,1c010078 <__rt_master_loop_update_next>
1c01008c:	7d005073          	csrwi	0x7d0,0
1c010090:	004e2503          	lw	a0,4(t3)
1c010094:	000e2283          	lw	t0,0(t3)
1c010098:	008e2103          	lw	sp,8(t3)
1c01009c:	00ce2303          	lw	t1,12(t3)
1c0100a0:	010e2383          	lw	t2,16(t3)
1c0100a4:	028e2f03          	lw	t5,40(t3)
1c0100a8:	018e2b03          	lw	s6,24(t3)
1c0100ac:	014e2f83          	lw	t6,20(t3)
1c0100b0:	80d6                	mv	ra,s5
1c0100b2:	911a                	add	sp,sp,t1
1c0100b4:	01f02823          	sw	t6,16(zero) # 10 <__rt_bridge_flash_cs>
1c0100b8:	00030a63          	beqz	t1,1c0100cc <__rt_no_stack_check>
1c0100bc:	40610eb3          	sub	t4,sp,t1
1c0100c0:	7d1e9073          	csrw	0x7d1,t4
1c0100c4:	7d211073          	csrw	0x7d2,sp
1c0100c8:	7d00d073          	csrwi	0x7d0,1

1c0100cc <__rt_no_stack_check>:
1c0100cc:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1f40a4>
1c0100d0:	21e9a023          	sw	t5,512(s3)
1c0100d4:	21e9a623          	sw	t5,524(s3)

1c0100d8 <__rt_master_no_slave_barrier>:
1c0100d8:	000f2863          	p.beqimm	t5,0,1c0100e8 <__rt_master_loop_no_slave>
1c0100dc:	09a9a023          	sw	s10,128(s3)
1c0100e0:	0879a023          	sw	t2,128(s3)
1c0100e4:	0829a023          	sw	sp,128(s3)

1c0100e8 <__rt_master_loop_no_slave>:
1c0100e8:	8282                	jr	t0

1c0100ea <__rt_master_sleep>:
1c0100ea:	0149a423          	sw	s4,8(s3)
1c0100ee:	03c9e003          	p.elw	zero,60(s3)
1c0100f2:	0149a223          	sw	s4,4(s3)
1c0100f6:	bfad                	j	1c010070 <__rt_master_loop>

1c0100f8 <__rt_push_event_to_fc_wait>:
1c0100f8:	0149a423          	sw	s4,8(s3)
1c0100fc:	03c9e003          	p.elw	zero,60(s3)
1c010100:	0149a223          	sw	s4,4(s3)
1c010104:	bfb1                	j	1c010060 <__rt_push_event_to_fc_retry>

1c010106 <__rt_slave_start>:
1c010106:	00204937          	lui	s2,0x204
1c01010a:	f14029f3          	csrr	s3,mhartid
1c01010e:	01f9f993          	andi	s3,s3,31
1c010112:	00000a17          	auipc	s4,0x0
1c010116:	012a0a13          	addi	s4,s4,18 # 1c010124 <__rt_fork_return>
1c01011a:	00000a97          	auipc	s5,0x0
1c01011e:	00ea8a93          	addi	s5,s5,14 # 1c010128 <__rt_wait_for_dispatch>
1c010122:	a019                	j	1c010128 <__rt_wait_for_dispatch>

1c010124 <__rt_fork_return>:
1c010124:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x1f423c>

1c010128 <__rt_wait_for_dispatch>:
1c010128:	08096283          	p.elw	t0,128(s2)
1c01012c:	08096503          	p.elw	a0,128(s2)
1c010130:	0012f313          	andi	t1,t0,1
1c010134:	00031563          	bnez	t1,1c01013e <__rt_other_entry>

1c010138 <__rt_fork_entry>:
1c010138:	000a00b3          	add	ra,s4,zero
1c01013c:	8282                	jr	t0

1c01013e <__rt_other_entry>:
1c01013e:	000a80b3          	add	ra,s5,zero
1c010142:	8282                	jr	t0

1c010144 <__rt_set_slave_stack>:
1c010144:	7d005073          	csrwi	0x7d0,0
1c010148:	08096283          	p.elw	t0,128(s2)
1c01014c:	02a98eb3          	mul	t4,s3,a0
1c010150:	005e8133          	add	sp,t4,t0
1c010154:	c909                	beqz	a0,1c010166 <__rt_no_stack_check_end>
1c010156:	40a10eb3          	sub	t4,sp,a0
1c01015a:	7d1e9073          	csrw	0x7d1,t4
1c01015e:	7d211073          	csrw	0x7d2,sp
1c010162:	7d00d073          	csrwi	0x7d0,1

1c010166 <__rt_no_stack_check_end>:
1c010166:	8082                	ret
