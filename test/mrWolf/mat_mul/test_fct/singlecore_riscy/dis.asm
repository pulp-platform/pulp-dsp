/home/arnold/pulp-sdk/pkg/pulp_riscv_gcc/1.0.13/bin/riscv32-unknown-elf-objdump -Mmarch=rv32imfcxpulpv2 /home/arnold/PULP-DSP/test/mrWolf/mat_mul/test_fct/singlecore_riscy/build/wolfe/test/test -d

/home/arnold/PULP-DSP/test/mrWolf/mat_mul/test_fct/singlecore_riscy/build/wolfe/test/test:     file format elf32-littleriscv


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
1c008090:	0fec                	addi	a1,sp,988
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
1c0080bc:	00028293          	mv	t0,t0
1c0080c0:	ffff9317          	auipc	t1,0xffff9
1c0080c4:	15430313          	addi	t1,t1,340 # 1c001214 <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0) # 1c0010b8 <_bss_start>
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	dfe10113          	addi	sp,sp,-514 # 1c000ed0 <stack>
1c0080da:	28e010ef          	jal	ra,1c009368 <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00001397          	auipc	t2,0x1
1c0080ea:	a6e38393          	addi	t2,t2,-1426 # 1c008b54 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	3e8010ef          	jal	ra,1c0094dc <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	033020ef          	jal	ra,1c00a92c <exit>

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
1c00815e:	73e60613          	addi	a2,a2,1854 # 1c009898 <__rt_bridge_handle_notif>
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
1c008198:	04448493          	addi	s1,s1,68 # 1c0011d8 <__rt_fc_cluster_data>

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
1c0081fa:	fe248493          	addi	s1,s1,-30 # 1c0011d8 <__rt_fc_cluster_data>
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
1c00825e:	31250513          	addi	a0,a0,786 # 1c00956c <__rt_handle_illegal_instr>
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
1c008340:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_end+0xa107fec>
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
1c008518:	0007c503          	lbu	a0,0(a5) # 10000 <__l1_heap_size+0x1814>
1c00851c:	40a70533          	sub	a0,a4,a0
1c008520:	8082                	ret
1c008522:	01000737          	lui	a4,0x1000
1c008526:	47c1                	li	a5,16
1c008528:	fce56ee3          	bltu	a0,a4,1c008504 <__clzsi2+0x10>
1c00852c:	47e1                	li	a5,24
1c00852e:	bfd9                	j	1c008504 <__clzsi2+0x10>

1c008530 <cluster_entry>:
1c008530:	7159                	addi	sp,sp,-112
1c008532:	d4a2                	sw	s0,104(sp)
1c008534:	f1402673          	csrr	a2,mhartid
1c008538:	40565413          	srai	s0,a2,0x5
1c00853c:	f2643433          	p.bclr	s0,s0,25,6
1c008540:	1c000537          	lui	a0,0x1c000
1c008544:	85a2                	mv	a1,s0
1c008546:	f4563633          	p.bclr	a2,a2,26,5
1c00854a:	3ec50513          	addi	a0,a0,1004 # 1c0003ec <__DTOR_END__+0x100>
1c00854e:	d686                	sw	ra,108(sp)
1c008550:	d2a6                	sw	s1,100(sp)
1c008552:	d0ca                	sw	s2,96(sp)
1c008554:	cece                	sw	s3,92(sp)
1c008556:	ccd2                	sw	s4,88(sp)
1c008558:	cad6                	sw	s5,84(sp)
1c00855a:	470020ef          	jal	ra,1c00a9ca <printf>
1c00855e:	0028                	addi	a0,sp,8
1c008560:	5d1000ef          	jal	ra,1c009330 <rt_perf_init>
1c008564:	6585                	lui	a1,0x1
1c008566:	450d                	li	a0,3
1c008568:	2d75                	jal	1c008c24 <rt_alloc>
1c00856a:	1a050b63          	beqz	a0,1c008720 <cluster_entry+0x1f0>
1c00856e:	84aa                	mv	s1,a0
1c008570:	1c000537          	lui	a0,0x1c000
1c008574:	42450513          	addi	a0,a0,1060 # 1c000424 <__DTOR_END__+0x138>
1c008578:	352020ef          	jal	ra,1c00a8ca <puts>
1c00857c:	65e1                	lui	a1,0x18
1c00857e:	05d9                	addi	a1,a1,22
1c008580:	0028                	addi	a0,sp,8
1c008582:	5c3000ef          	jal	ra,1c009344 <rt_perf_conf>
1c008586:	47fd                	li	a5,31
1c008588:	14f40863          	beq	s0,a5,1c0086d8 <cluster_entry+0x1a8>
1c00858c:	102007b7          	lui	a5,0x10200
1c008590:	4705                	li	a4,1
1c008592:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1febec>
1c008596:	02e7a023          	sw	a4,32(a5)
1c00859a:	4781                	li	a5,0
1c00859c:	79f79073          	csrw	pccr31,a5
1c0085a0:	f14027f3          	csrr	a5,mhartid
1c0085a4:	477d                	li	a4,31
1c0085a6:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085aa:	14e78663          	beq	a5,a4,1c0086f6 <cluster_entry+0x1c6>
1c0085ae:	102007b7          	lui	a5,0x10200
1c0085b2:	4705                	li	a4,1
1c0085b4:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1febec>
1c0085b8:	00e7ac23          	sw	a4,24(a5)
1c0085bc:	478d                	li	a5,3
1c0085be:	7a179073          	csrw	pcmr,a5
1c0085c2:	100005b7          	lui	a1,0x10000
1c0085c6:	01458513          	addi	a0,a1,20 # 10000014 <m_b>
1c0085ca:	87a6                	mv	a5,s1
1c0085cc:	02000713          	li	a4,32
1c0085d0:	02000693          	li	a3,32
1c0085d4:	02000613          	li	a2,32
1c0085d8:	01458593          	addi	a1,a1,20
1c0085dc:	40050513          	addi	a0,a0,1024
1c0085e0:	2ab9                	jal	1c00873e <plp_mat_mult_i8v_xpulpv2>
1c0085e2:	477d                	li	a4,31
1c0085e4:	f14027f3          	csrr	a5,mhartid
1c0085e8:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085ec:	14e78163          	beq	a5,a4,1c00872e <cluster_entry+0x1fe>
1c0085f0:	102007b7          	lui	a5,0x10200
1c0085f4:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1febec>
1c0085f8:	0007a023          	sw	zero,0(a5)
1c0085fc:	4781                	li	a5,0
1c0085fe:	7a179073          	csrw	pcmr,a5
1c008602:	10001937          	lui	s2,0x10001
1c008606:	81490913          	addi	s2,s2,-2028 # 10000814 <m_c>
1c00860a:	4a81                	li	s5,0
1c00860c:	4401                	li	s0,0
1c00860e:	1c000a37          	lui	s4,0x1c000
1c008612:	40000993          	li	s3,1024
1c008616:	0044a80b          	p.lw	a6,4(s1!)
1c00861a:	0049270b          	p.lw	a4,4(s2!)
1c00861e:	85a2                	mv	a1,s0
1c008620:	8642                	mv	a2,a6
1c008622:	0405                	addi	s0,s0,1
1c008624:	86ba                	mv	a3,a4
1c008626:	43ca0513          	addi	a0,s4,1084 # 1c00043c <__DTOR_END__+0x150>
1c00862a:	00e80563          	beq	a6,a4,1c008634 <cluster_entry+0x104>
1c00862e:	39c020ef          	jal	ra,1c00a9ca <printf>
1c008632:	0a85                	addi	s5,s5,1
1c008634:	ff3411e3          	bne	s0,s3,1c008616 <cluster_entry+0xe6>
1c008638:	0c0a8d63          	beqz	s5,1c008712 <cluster_entry+0x1e2>
1c00863c:	1c000537          	lui	a0,0x1c000
1c008640:	85d6                	mv	a1,s5
1c008642:	48850513          	addi	a0,a0,1160 # 1c000488 <__DTOR_END__+0x19c>
1c008646:	384020ef          	jal	ra,1c00a9ca <printf>
1c00864a:	f14027f3          	csrr	a5,mhartid
1c00864e:	477d                	li	a4,31
1c008650:	ca5797b3          	p.extractu	a5,a5,5,5
1c008654:	0ae78a63          	beq	a5,a4,1c008708 <cluster_entry+0x1d8>
1c008658:	102005b7          	lui	a1,0x10200
1c00865c:	40058593          	addi	a1,a1,1024 # 10200400 <__l1_end+0x1febec>
1c008660:	0085a583          	lw	a1,8(a1)
1c008664:	781029f3          	csrr	s3,pccr1
1c008668:	78202973          	csrr	s2,pccr2
1c00866c:	78f024f3          	csrr	s1,pccr15
1c008670:	78402473          	csrr	s0,pccr4
1c008674:	1c000537          	lui	a0,0x1c000
1c008678:	49c50513          	addi	a0,a0,1180 # 1c00049c <__DTOR_END__+0x1b0>
1c00867c:	34e020ef          	jal	ra,1c00a9ca <printf>
1c008680:	1c000537          	lui	a0,0x1c000
1c008684:	85ce                	mv	a1,s3
1c008686:	4b050513          	addi	a0,a0,1200 # 1c0004b0 <__DTOR_END__+0x1c4>
1c00868a:	340020ef          	jal	ra,1c00a9ca <printf>
1c00868e:	1c000537          	lui	a0,0x1c000
1c008692:	85ca                	mv	a1,s2
1c008694:	4c450513          	addi	a0,a0,1220 # 1c0004c4 <__DTOR_END__+0x1d8>
1c008698:	332020ef          	jal	ra,1c00a9ca <printf>
1c00869c:	1c000537          	lui	a0,0x1c000
1c0086a0:	85a6                	mv	a1,s1
1c0086a2:	4d450513          	addi	a0,a0,1236 # 1c0004d4 <__DTOR_END__+0x1e8>
1c0086a6:	324020ef          	jal	ra,1c00a9ca <printf>
1c0086aa:	1c000537          	lui	a0,0x1c000
1c0086ae:	85a2                	mv	a1,s0
1c0086b0:	4e450513          	addi	a0,a0,1252 # 1c0004e4 <__DTOR_END__+0x1f8>
1c0086b4:	316020ef          	jal	ra,1c00a9ca <printf>
1c0086b8:	1c000537          	lui	a0,0x1c000
1c0086bc:	65c1                	lui	a1,0x10
1c0086be:	4f050513          	addi	a0,a0,1264 # 1c0004f0 <__DTOR_END__+0x204>
1c0086c2:	308020ef          	jal	ra,1c00a9ca <printf>
1c0086c6:	50b6                	lw	ra,108(sp)
1c0086c8:	5426                	lw	s0,104(sp)
1c0086ca:	5496                	lw	s1,100(sp)
1c0086cc:	5906                	lw	s2,96(sp)
1c0086ce:	49f6                	lw	s3,92(sp)
1c0086d0:	4a66                	lw	s4,88(sp)
1c0086d2:	4ad6                	lw	s5,84(sp)
1c0086d4:	6165                	addi	sp,sp,112
1c0086d6:	8082                	ret
1c0086d8:	4785                	li	a5,1
1c0086da:	1a10b737          	lui	a4,0x1a10b
1c0086de:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa10980c>
1c0086e2:	4781                	li	a5,0
1c0086e4:	79f79073          	csrw	pccr31,a5
1c0086e8:	f14027f3          	csrr	a5,mhartid
1c0086ec:	477d                	li	a4,31
1c0086ee:	ca5797b3          	p.extractu	a5,a5,5,5
1c0086f2:	eae79ee3          	bne	a5,a4,1c0085ae <cluster_entry+0x7e>
1c0086f6:	4785                	li	a5,1
1c0086f8:	1a10b737          	lui	a4,0x1a10b
1c0086fc:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa109804>
1c008700:	478d                	li	a5,3
1c008702:	7a179073          	csrw	pcmr,a5
1c008706:	bd75                	j	1c0085c2 <cluster_entry+0x92>
1c008708:	1a10b5b7          	lui	a1,0x1a10b
1c00870c:	0085a583          	lw	a1,8(a1) # 1a10b008 <__l1_end+0xa1097f4>
1c008710:	bf91                	j	1c008664 <cluster_entry+0x134>
1c008712:	1c000537          	lui	a0,0x1c000
1c008716:	47450513          	addi	a0,a0,1140 # 1c000474 <__DTOR_END__+0x188>
1c00871a:	1b0020ef          	jal	ra,1c00a8ca <puts>
1c00871e:	b735                	j	1c00864a <cluster_entry+0x11a>
1c008720:	1c000537          	lui	a0,0x1c000
1c008724:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c008728:	1a2020ef          	jal	ra,1c00a8ca <puts>
1c00872c:	bf39                	j	1c00864a <cluster_entry+0x11a>
1c00872e:	1a10b7b7          	lui	a5,0x1a10b
1c008732:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa1097ec>
1c008736:	4781                	li	a5,0
1c008738:	7a179073          	csrw	pcmr,a5
1c00873c:	b5d9                	j	1c008602 <cluster_entry+0xd2>

1c00873e <plp_mat_mult_i8v_xpulpv2>:
1c00873e:	7175                	addi	sp,sp,-144
1c008740:	00165293          	srli	t0,a2,0x1
1c008744:	c722                	sw	s0,140(sp)
1c008746:	c526                	sw	s1,136(sp)
1c008748:	c34a                	sw	s2,132(sp)
1c00874a:	c14e                	sw	s3,128(sp)
1c00874c:	ded2                	sw	s4,124(sp)
1c00874e:	dcd6                	sw	s5,120(sp)
1c008750:	dada                	sw	s6,116(sp)
1c008752:	d8de                	sw	s7,112(sp)
1c008754:	d6e2                	sw	s8,108(sp)
1c008756:	d4e6                	sw	s9,104(sp)
1c008758:	d2ea                	sw	s10,100(sp)
1c00875a:	d0ee                	sw	s11,96(sp)
1c00875c:	c8b2                	sw	a2,80(sp)
1c00875e:	dc16                	sw	t0,56(sp)
1c008760:	de2a                	sw	a0,60(sp)
1c008762:	da2e                	sw	a1,52(sp)
1c008764:	d036                	sw	a3,32(sp)
1c008766:	ca3a                	sw	a4,20(sp)
1c008768:	ccbe                	sw	a5,88(sp)
1c00876a:	3c028b63          	beqz	t0,1c008b40 <plp_mat_mult_i8v_xpulpv2+0x402>
1c00876e:	00275313          	srli	t1,a4,0x2
1c008772:	863e                	mv	a2,a5
1c008774:	00231793          	slli	a5,t1,0x2
1c008778:	97ae                	add	a5,a5,a1
1c00877a:	cebe                	sw	a5,92(sp)
1c00877c:	1c0007b7          	lui	a5,0x1c000
1c008780:	5007ad03          	lw	s10,1280(a5) # 1c000500 <__DTOR_END__+0x214>
1c008784:	1c0007b7          	lui	a5,0x1c000
1c008788:	0026d393          	srli	t2,a3,0x2
1c00878c:	5047ac83          	lw	s9,1284(a5) # 1c000504 <__DTOR_END__+0x218>
1c008790:	1c0007b7          	lui	a5,0x1c000
1c008794:	84ba                	mv	s1,a4
1c008796:	89b6                	mv	s3,a3
1c008798:	82ba                	mv	t0,a4
1c00879a:	5087ac03          	lw	s8,1288(a5) # 1c000508 <__DTOR_END__+0x21c>
1c00879e:	00239713          	slli	a4,t2,0x2
1c0087a2:	048e                	slli	s1,s1,0x3
1c0087a4:	0686                	slli	a3,a3,0x1
1c0087a6:	99aa                	add	s3,s3,a0
1c0087a8:	972a                	add	a4,a4,a0
1c0087aa:	c69a                	sw	t1,76(sp)
1c0087ac:	d41e                	sw	t2,40(sp)
1c0087ae:	caa6                	sw	s1,84(sp)
1c0087b0:	c0b2                	sw	a2,64(sp)
1c0087b2:	c2b6                	sw	a3,68(sp)
1c0087b4:	d22a                	sw	a0,36(sp)
1c0087b6:	d84e                	sw	s3,48(sp)
1c0087b8:	d63a                	sw	a4,44(sp)
1c0087ba:	00229d93          	slli	s11,t0,0x2
1c0087be:	c482                	sw	zero,72(sp)
1c0087c0:	42b6                	lw	t0,76(sp)
1c0087c2:	1e028963          	beqz	t0,1c0089b4 <plp_mat_mult_i8v_xpulpv2+0x276>
1c0087c6:	53d2                	lw	t2,52(sp)
1c0087c8:	4376                	lw	t1,92(sp)
1c0087ca:	4486                	lw	s1,64(sp)
1c0087cc:	4606                	lw	a2,64(sp)
1c0087ce:	407307b3          	sub	a5,t1,t2
1c0087d2:	17f1                	addi	a5,a5,-4
1c0087d4:	8389                	srli	a5,a5,0x2
1c0087d6:	94ee                	add	s1,s1,s11
1c0087d8:	0785                	addi	a5,a5,1
1c0087da:	c626                	sw	s1,12(sp)
1c0087dc:	cc1e                	sw	t2,24(sp)
1c0087de:	c832                	sw	a2,16(sp)
1c0087e0:	ce3e                	sw	a5,28(sp)
1c0087e2:	59a2                	lw	s3,40(sp)
1c0087e4:	1a098e63          	beqz	s3,1c0089a0 <plp_mat_mult_i8v_xpulpv2+0x262>
1c0087e8:	5392                	lw	t2,36(sp)
1c0087ea:	5332                	lw	t1,44(sp)
1c0087ec:	44d2                	lw	s1,20(sp)
1c0087ee:	4662                	lw	a2,24(sp)
1c0087f0:	40730533          	sub	a0,t1,t2
1c0087f4:	1571                	addi	a0,a0,-4
1c0087f6:	00c489b3          	add	s3,s1,a2
1c0087fa:	5ac2                	lw	s5,48(sp)
1c0087fc:	01348933          	add	s2,s1,s3
1c008800:	8109                	srli	a0,a0,0x2
1c008802:	00990bb3          	add	s7,s2,s1
1c008806:	8a1e                	mv	s4,t2
1c008808:	8b32                	mv	s6,a2
1c00880a:	4481                	li	s1,0
1c00880c:	4401                	li	s0,0
1c00880e:	4381                	li	t2,0
1c008810:	4281                	li	t0,0
1c008812:	4f81                	li	t6,0
1c008814:	4f01                	li	t5,0
1c008816:	4e81                	li	t4,0
1c008818:	4e01                	li	t3,0
1c00881a:	0505                	addi	a0,a0,1
1c00881c:	036540fb          	lp.setup	x1,a0,1c008888 <plp_mat_mult_i8v_xpulpv2+0x14a>
1c008820:	21bb768b          	p.lw	a3,s11(s6!)
1c008824:	21b9f30b          	p.lw	t1,s11(s3!)
1c008828:	21b9758b          	p.lw	a1,s11(s2!)
1c00882c:	8636                	mv	a2,a3
1c00882e:	c9a31657          	pv.shuffle2.b	a2,t1,s10
1c008832:	c99316d7          	pv.shuffle2.b	a3,t1,s9
1c008836:	1c000337          	lui	t1,0x1c000
1c00883a:	21bbf88b          	p.lw	a7,s11(s7!)
1c00883e:	50c30313          	addi	t1,t1,1292 # 1c00050c <__DTOR_END__+0x220>
1c008842:	00032303          	lw	t1,0(t1)
1c008846:	882e                	mv	a6,a1
1c008848:	004a270b          	p.lw	a4,4(s4!)
1c00884c:	004aa78b          	p.lw	a5,4(s5!)
1c008850:	c9a89857          	pv.shuffle2.b	a6,a7,s10
1c008854:	c99895d7          	pv.shuffle2.b	a1,a7,s9
1c008858:	88b2                	mv	a7,a2
1c00885a:	c98818d7          	pv.shuffle2.b	a7,a6,s8
1c00885e:	c8681657          	pv.shuffle2.b	a2,a6,t1
1c008862:	8836                	mv	a6,a3
1c008864:	c9859857          	pv.shuffle2.b	a6,a1,s8
1c008868:	c86596d7          	pv.shuffle2.b	a3,a1,t1
1c00886c:	b9171e57          	pv.sdotsp.b	t3,a4,a7
1c008870:	b8c71ed7          	pv.sdotsp.b	t4,a4,a2
1c008874:	b9071f57          	pv.sdotsp.b	t5,a4,a6
1c008878:	b8d71fd7          	pv.sdotsp.b	t6,a4,a3
1c00887c:	b91792d7          	pv.sdotsp.b	t0,a5,a7
1c008880:	b8c793d7          	pv.sdotsp.b	t2,a5,a2
1c008884:	b9079457          	pv.sdotsp.b	s0,a5,a6
1c008888:	b8d794d7          	pv.sdotsp.b	s1,a5,a3
1c00888c:	5822                	lw	a6,40(sp)
1c00888e:	4642                	lw	a2,16(sp)
1c008890:	46b2                	lw	a3,12(sp)
1c008892:	4762                	lw	a4,24(sp)
1c008894:	47f2                	lw	a5,28(sp)
1c008896:	01c62023          	sw	t3,0(a2) # 90000000 <pulp__FC+0x90000001>
1c00889a:	01d62223          	sw	t4,4(a2)
1c00889e:	01e62423          	sw	t5,8(a2)
1c0088a2:	01f62623          	sw	t6,12(a2)
1c0088a6:	0056a023          	sw	t0,0(a3)
1c0088aa:	0076a223          	sw	t2,4(a3)
1c0088ae:	c680                	sw	s0,8(a3)
1c0088b0:	c6c4                	sw	s1,12(a3)
1c0088b2:	0641                	addi	a2,a2,16
1c0088b4:	06c1                	addi	a3,a3,16
1c0088b6:	0711                	addi	a4,a4,4
1c0088b8:	17fd                	addi	a5,a5,-1
1c0088ba:	c832                	sw	a2,16(sp)
1c0088bc:	c636                	sw	a3,12(sp)
1c0088be:	cc3a                	sw	a4,24(sp)
1c0088c0:	ce3e                	sw	a5,28(sp)
1c0088c2:	f385                	bnez	a5,1c0087e2 <plp_mat_mult_i8v_xpulpv2+0xa4>
1c0088c4:	4536                	lw	a0,76(sp)
1c0088c6:	4616                	lw	a2,68(sp)
1c0088c8:	42a6                	lw	t0,72(sp)
1c0088ca:	4306                	lw	t1,64(sp)
1c0088cc:	5492                	lw	s1,36(sp)
1c0088ce:	56c2                	lw	a3,48(sp)
1c0088d0:	5732                	lw	a4,44(sp)
1c0088d2:	43d6                	lw	t2,84(sp)
1c0088d4:	59e2                	lw	s3,56(sp)
1c0088d6:	0285                	addi	t0,t0,1
1c0088d8:	931e                	add	t1,t1,t2
1c0088da:	94b2                	add	s1,s1,a2
1c0088dc:	96b2                	add	a3,a3,a2
1c0088de:	9732                	add	a4,a4,a2
1c0088e0:	c496                	sw	t0,72(sp)
1c0088e2:	c09a                	sw	t1,64(sp)
1c0088e4:	d226                	sw	s1,36(sp)
1c0088e6:	d836                	sw	a3,48(sp)
1c0088e8:	d63a                	sw	a4,44(sp)
1c0088ea:	ec599be3          	bne	s3,t0,1c0087c0 <plp_mat_mult_i8v_xpulpv2+0x82>
1c0088ee:	42c6                	lw	t0,80(sp)
1c0088f0:	0986                	slli	s3,s3,0x1
1c0088f2:	dc4e                	sw	s3,56(sp)
1c0088f4:	080a                	slli	a6,a6,0x2
1c0088f6:	050a                	slli	a0,a0,0x2
1c0088f8:	0d328063          	beq	t0,s3,1c0089b8 <plp_mat_mult_i8v_xpulpv2+0x27a>
1c0088fc:	e961                	bnez	a0,1c0089cc <plp_mat_mult_i8v_xpulpv2+0x28e>
1c0088fe:	5662                	lw	a2,56(sp)
1c008900:	49c6                	lw	s3,80(sp)
1c008902:	09367163          	bleu	s3,a2,1c008984 <plp_mat_mult_i8v_xpulpv2+0x246>
1c008906:	5302                	lw	t1,32(sp)
1c008908:	52f2                	lw	t0,60(sp)
1c00890a:	43d2                	lw	t2,20(sp)
1c00890c:	00628fb3          	add	t6,t0,t1
1c008910:	8e7e                	mv	t3,t6
1c008912:	02760f33          	mul	t5,a2,t2
1c008916:	42660e33          	p.mac	t3,a2,t1
1c00891a:	42d2                	lw	t0,20(sp)
1c00891c:	04557a63          	bleu	t0,a0,1c008970 <plp_mat_mult_i8v_xpulpv2+0x232>
1c008920:	43e6                	lw	t2,88(sp)
1c008922:	01e50333          	add	t1,a0,t5
1c008926:	030a                	slli	t1,t1,0x2
1c008928:	41fe0eb3          	sub	t4,t3,t6
1c00892c:	931e                	add	t1,t1,t2
1c00892e:	40a288b3          	sub	a7,t0,a0
1c008932:	01e8c07b          	lp.setup	x0,a7,1c00896e <plp_mat_mult_i8v_xpulpv2+0x230>
1c008936:	5382                	lw	t2,32(sp)
1c008938:	4681                	li	a3,0
1c00893a:	02787863          	bleu	t2,a6,1c00896a <plp_mat_mult_i8v_xpulpv2+0x22c>
1c00893e:	44d2                	lw	s1,20(sp)
1c008940:	872a                	mv	a4,a0
1c008942:	5672                	lw	a2,60(sp)
1c008944:	43048733          	p.mac	a4,s1,a6
1c008948:	59d2                	lw	s3,52(sp)
1c00894a:	9876                	add	a6,a6,t4
1c00894c:	9832                	add	a6,a6,a2
1c00894e:	4681                	li	a3,0
1c008950:	410e07b3          	sub	a5,t3,a6
1c008954:	82a6                	mv	t0,s1
1c008956:	974e                	add	a4,a4,s3
1c008958:	0067c0fb          	lp.setup	x1,a5,1c008964 <plp_mat_mult_i8v_xpulpv2+0x226>
1c00895c:	0018060b          	p.lb	a2,1(a6!)
1c008960:	0057758b          	p.lb	a1,t0(a4!)
1c008964:	42c586b3          	p.mac	a3,a1,a2
1c008968:	5802                	lw	a6,32(sp)
1c00896a:	00d3222b          	p.sw	a3,4(t1!)
1c00896e:	0505                	addi	a0,a0,1
1c008970:	54e2                	lw	s1,56(sp)
1c008972:	4652                	lw	a2,20(sp)
1c008974:	5682                	lw	a3,32(sp)
1c008976:	49c6                	lw	s3,80(sp)
1c008978:	0485                	addi	s1,s1,1
1c00897a:	dc26                	sw	s1,56(sp)
1c00897c:	9f32                	add	t5,t5,a2
1c00897e:	9e36                	add	t3,t3,a3
1c008980:	f8999de3          	bne	s3,s1,1c00891a <plp_mat_mult_i8v_xpulpv2+0x1dc>
1c008984:	443a                	lw	s0,140(sp)
1c008986:	44aa                	lw	s1,136(sp)
1c008988:	491a                	lw	s2,132(sp)
1c00898a:	498a                	lw	s3,128(sp)
1c00898c:	5a76                	lw	s4,124(sp)
1c00898e:	5ae6                	lw	s5,120(sp)
1c008990:	5b56                	lw	s6,116(sp)
1c008992:	5bc6                	lw	s7,112(sp)
1c008994:	5c36                	lw	s8,108(sp)
1c008996:	5ca6                	lw	s9,104(sp)
1c008998:	5d16                	lw	s10,100(sp)
1c00899a:	5d86                	lw	s11,96(sp)
1c00899c:	6149                	addi	sp,sp,144
1c00899e:	8082                	ret
1c0089a0:	4801                	li	a6,0
1c0089a2:	4481                	li	s1,0
1c0089a4:	4401                	li	s0,0
1c0089a6:	4381                	li	t2,0
1c0089a8:	4281                	li	t0,0
1c0089aa:	4f81                	li	t6,0
1c0089ac:	4f01                	li	t5,0
1c0089ae:	4e81                	li	t4,0
1c0089b0:	4e01                	li	t3,0
1c0089b2:	bdf1                	j	1c00888e <plp_mat_mult_i8v_xpulpv2+0x150>
1c0089b4:	4501                	li	a0,0
1c0089b6:	bf01                	j	1c0088c6 <plp_mat_mult_i8v_xpulpv2+0x188>
1c0089b8:	5302                	lw	t1,32(sp)
1c0089ba:	f46811e3          	bne	a6,t1,1c0088fc <plp_mat_mult_i8v_xpulpv2+0x1be>
1c0089be:	44d2                	lw	s1,20(sp)
1c0089c0:	fca482e3          	beq	s1,a0,1c008984 <plp_mat_mult_i8v_xpulpv2+0x246>
1c0089c4:	5362                	lw	t1,56(sp)
1c0089c6:	fa030fe3          	beqz	t1,1c008984 <plp_mat_mult_i8v_xpulpv2+0x246>
1c0089ca:	bf0d                	j	1c0088fc <plp_mat_mult_i8v_xpulpv2+0x1be>
1c0089cc:	f20809e3          	beqz	a6,1c0088fe <plp_mat_mult_i8v_xpulpv2+0x1c0>
1c0089d0:	5482                	lw	s1,32(sp)
1c0089d2:	08980263          	beq	a6,s1,1c008a56 <plp_mat_mult_i8v_xpulpv2+0x318>
1c0089d6:	59f2                	lw	s3,60(sp)
1c0089d8:	4652                	lw	a2,20(sp)
1c0089da:	46e6                	lw	a3,88(sp)
1c0089dc:	00998fb3          	add	t6,s3,s1
1c0089e0:	54d2                	lw	s1,52(sp)
1c0089e2:	00251293          	slli	t0,a0,0x2
1c0089e6:	40a00433          	neg	s0,a0
1c0089ea:	42c804b3          	p.mac	s1,a6,a2
1c0089ee:	00261913          	slli	s2,a2,0x2
1c0089f2:	92b6                	add	t0,t0,a3
1c0089f4:	01098f33          	add	t5,s3,a6
1c0089f8:	040a                	slli	s0,s0,0x2
1c0089fa:	4381                	li	t2,0
1c0089fc:	00540e33          	add	t3,s0,t0
1c008a00:	41c28333          	sub	t1,t0,t3
1c008a04:	1371                	addi	t1,t1,-4
1c008a06:	00235313          	srli	t1,t1,0x2
1c008a0a:	8ea6                	mv	t4,s1
1c008a0c:	0305                	addi	t1,t1,1
1c008a0e:	01a3407b          	lp.setup	x0,t1,1c008a42 <plp_mat_mult_i8v_xpulpv2+0x304>
1c008a12:	5602                	lw	a2,32(sp)
1c008a14:	4781                	li	a5,0
1c008a16:	02c87263          	bleu	a2,a6,1c008a3a <plp_mat_mult_i8v_xpulpv2+0x2fc>
1c008a1a:	8676                	mv	a2,t4
1c008a1c:	86fa                	mv	a3,t5
1c008a1e:	4781                	li	a5,0
1c008a20:	41ef8733          	sub	a4,t6,t5
1c008a24:	00a740fb          	lp.setup	x1,a4,1c008a38 <plp_mat_mult_i8v_xpulpv2+0x2fa>
1c008a28:	49d2                	lw	s3,20(sp)
1c008a2a:	0016858b          	p.lb	a1,1(a3!)
1c008a2e:	0136788b          	p.lb	a7,s3(a2!)
1c008a32:	89be                	mv	s3,a5
1c008a34:	42b889b3          	p.mac	s3,a7,a1
1c008a38:	97ce                	add	a5,a5,s3
1c008a3a:	000e2703          	lw	a4,0(t3)
1c008a3e:	0e85                	addi	t4,t4,1
1c008a40:	97ba                	add	a5,a5,a4
1c008a42:	00fe222b          	p.sw	a5,4(t3!)
1c008a46:	5682                	lw	a3,32(sp)
1c008a48:	59e2                	lw	s3,56(sp)
1c008a4a:	0385                	addi	t2,t2,1
1c008a4c:	92ca                	add	t0,t0,s2
1c008a4e:	9f36                	add	t5,t5,a3
1c008a50:	9fb6                	add	t6,t6,a3
1c008a52:	fb33e5e3          	bltu	t2,s3,1c0089fc <plp_mat_mult_i8v_xpulpv2+0x2be>
1c008a56:	42d2                	lw	t0,20(sp)
1c008a58:	06550663          	beq	a0,t0,1c008ac4 <plp_mat_mult_i8v_xpulpv2+0x386>
1c008a5c:	06557463          	bleu	t0,a0,1c008ac4 <plp_mat_mult_i8v_xpulpv2+0x386>
1c008a60:	43e6                	lw	t2,88(sp)
1c008a62:	5652                	lw	a2,52(sp)
1c008a64:	5482                	lw	s1,32(sp)
1c008a66:	5e72                	lw	t3,60(sp)
1c008a68:	8316                	mv	t1,t0
1c008a6a:	00251293          	slli	t0,a0,0x2
1c008a6e:	929e                	add	t0,t0,t2
1c008a70:	00231413          	slli	s0,t1,0x2
1c008a74:	01c48fb3          	add	t6,s1,t3
1c008a78:	4381                	li	t2,0
1c008a7a:	9532                	add	a0,a0,a2
1c008a7c:	00660eb3          	add	t4,a2,t1
1c008a80:	832a                	mv	t1,a0
1c008a82:	8f16                	mv	t5,t0
1c008a84:	40ae88b3          	sub	a7,t4,a0
1c008a88:	0158c07b          	lp.setup	x0,a7,1c008ab2 <plp_mat_mult_i8v_xpulpv2+0x374>
1c008a8c:	5602                	lw	a2,32(sp)
1c008a8e:	4701                	li	a4,0
1c008a90:	ce19                	beqz	a2,1c008aae <plp_mat_mult_i8v_xpulpv2+0x370>
1c008a92:	44d2                	lw	s1,20(sp)
1c008a94:	861a                	mv	a2,t1
1c008a96:	86f2                	mv	a3,t3
1c008a98:	4701                	li	a4,0
1c008a9a:	41cf87b3          	sub	a5,t6,t3
1c008a9e:	0067c0fb          	lp.setup	x1,a5,1c008aaa <plp_mat_mult_i8v_xpulpv2+0x36c>
1c008aa2:	0016858b          	p.lb	a1,1(a3!)
1c008aa6:	0096780b          	p.lb	a6,s1(a2!)
1c008aaa:	42b80733          	p.mac	a4,a6,a1
1c008aae:	00ef222b          	p.sw	a4,4(t5!)
1c008ab2:	0305                	addi	t1,t1,1
1c008ab4:	5682                	lw	a3,32(sp)
1c008ab6:	59e2                	lw	s3,56(sp)
1c008ab8:	0385                	addi	t2,t2,1
1c008aba:	92a2                	add	t0,t0,s0
1c008abc:	9e36                	add	t3,t3,a3
1c008abe:	9fb6                	add	t6,t6,a3
1c008ac0:	fd33e0e3          	bltu	t2,s3,1c008a80 <plp_mat_mult_i8v_xpulpv2+0x342>
1c008ac4:	42c6                	lw	t0,80(sp)
1c008ac6:	5362                	lw	t1,56(sp)
1c008ac8:	ea537ee3          	bleu	t0,t1,1c008984 <plp_mat_mult_i8v_xpulpv2+0x246>
1c008acc:	43d2                	lw	t2,20(sp)
1c008ace:	ea038be3          	beqz	t2,1c008984 <plp_mat_mult_i8v_xpulpv2+0x246>
1c008ad2:	5482                	lw	s1,32(sp)
1c008ad4:	4fe6                	lw	t6,88(sp)
1c008ad6:	00239293          	slli	t0,t2,0x2
1c008ada:	026487b3          	mul	a5,s1,t1
1c008ade:	5672                	lw	a2,60(sp)
1c008ae0:	59d2                	lw	s3,52(sp)
1c008ae2:	00960f33          	add	t5,a2,s1
1c008ae6:	00798eb3          	add	t4,s3,t2
1c008aea:	42530fb3          	p.mac	t6,t1,t0
1c008aee:	00f60e33          	add	t3,a2,a5
1c008af2:	9f3e                	add	t5,t5,a5
1c008af4:	58d2                	lw	a7,52(sp)
1c008af6:	837e                	mv	t1,t6
1c008af8:	411e8833          	sub	a6,t4,a7
1c008afc:	0168407b          	lp.setup	x0,a6,1c008b28 <plp_mat_mult_i8v_xpulpv2+0x3ea>
1c008b00:	5382                	lw	t2,32(sp)
1c008b02:	4701                	li	a4,0
1c008b04:	02038063          	beqz	t2,1c008b24 <plp_mat_mult_i8v_xpulpv2+0x3e6>
1c008b08:	49d2                	lw	s3,20(sp)
1c008b0a:	8646                	mv	a2,a7
1c008b0c:	86f2                	mv	a3,t3
1c008b0e:	4701                	li	a4,0
1c008b10:	41cf07b3          	sub	a5,t5,t3
1c008b14:	0067c0fb          	lp.setup	x1,a5,1c008b20 <plp_mat_mult_i8v_xpulpv2+0x3e2>
1c008b18:	0016858b          	p.lb	a1,1(a3!)
1c008b1c:	0136750b          	p.lb	a0,s3(a2!)
1c008b20:	42b50733          	p.mac	a4,a0,a1
1c008b24:	00e3222b          	p.sw	a4,4(t1!)
1c008b28:	0885                	addi	a7,a7,1
1c008b2a:	54e2                	lw	s1,56(sp)
1c008b2c:	5602                	lw	a2,32(sp)
1c008b2e:	49c6                	lw	s3,80(sp)
1c008b30:	0485                	addi	s1,s1,1
1c008b32:	dc26                	sw	s1,56(sp)
1c008b34:	9f96                	add	t6,t6,t0
1c008b36:	9e32                	add	t3,t3,a2
1c008b38:	9f32                	add	t5,t5,a2
1c008b3a:	fa999de3          	bne	s3,s1,1c008af4 <plp_mat_mult_i8v_xpulpv2+0x3b6>
1c008b3e:	b599                	j	1c008984 <plp_mat_mult_i8v_xpulpv2+0x246>
1c008b40:	82b2                	mv	t0,a2
1c008b42:	4801                	li	a6,0
1c008b44:	4501                	li	a0,0
1c008b46:	da061ce3          	bnez	a2,1c0088fe <plp_mat_mult_i8v_xpulpv2+0x1c0>
1c008b4a:	e3069de3          	bne	a3,a6,1c008984 <plp_mat_mult_i8v_xpulpv2+0x246>
1c008b4e:	dc16                	sw	t0,56(sp)
1c008b50:	84ba                	mv	s1,a4
1c008b52:	b5bd                	j	1c0089c0 <plp_mat_mult_i8v_xpulpv2+0x282>

1c008b54 <main>:
1c008b54:	1101                	addi	sp,sp,-32
1c008b56:	4681                	li	a3,0
1c008b58:	4601                	li	a2,0
1c008b5a:	4581                	li	a1,0
1c008b5c:	4505                	li	a0,1
1c008b5e:	ce06                	sw	ra,28(sp)
1c008b60:	2559                	jal	1c0091e6 <rt_cluster_mount>
1c008b62:	1c008637          	lui	a2,0x1c008
1c008b66:	4881                	li	a7,0
1c008b68:	4801                	li	a6,0
1c008b6a:	4781                	li	a5,0
1c008b6c:	4701                	li	a4,0
1c008b6e:	4681                	li	a3,0
1c008b70:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c008b74:	4581                	li	a1,0
1c008b76:	c002                	sw	zero,0(sp)
1c008b78:	4501                	li	a0,0
1c008b7a:	2bc9                	jal	1c00914c <rt_cluster_call>
1c008b7c:	4501                	li	a0,0
1c008b7e:	4681                	li	a3,0
1c008b80:	4601                	li	a2,0
1c008b82:	4581                	li	a1,0
1c008b84:	258d                	jal	1c0091e6 <rt_cluster_mount>
1c008b86:	40f2                	lw	ra,28(sp)
1c008b88:	4501                	li	a0,0
1c008b8a:	6105                	addi	sp,sp,32
1c008b8c:	8082                	ret

1c008b8e <rt_user_alloc_init>:
1c008b8e:	00758793          	addi	a5,a1,7
1c008b92:	9be1                	andi	a5,a5,-8
1c008b94:	40b785b3          	sub	a1,a5,a1
1c008b98:	c11c                	sw	a5,0(a0)
1c008b9a:	8e0d                	sub	a2,a2,a1
1c008b9c:	00c05663          	blez	a2,1c008ba8 <rt_user_alloc_init+0x1a>
1c008ba0:	9a61                	andi	a2,a2,-8
1c008ba2:	c390                	sw	a2,0(a5)
1c008ba4:	0007a223          	sw	zero,4(a5)
1c008ba8:	8082                	ret

1c008baa <rt_user_alloc>:
1c008baa:	411c                	lw	a5,0(a0)
1c008bac:	059d                	addi	a1,a1,7
1c008bae:	99e1                	andi	a1,a1,-8
1c008bb0:	4681                	li	a3,0
1c008bb2:	cb89                	beqz	a5,1c008bc4 <rt_user_alloc+0x1a>
1c008bb4:	4398                	lw	a4,0(a5)
1c008bb6:	00b74963          	blt	a4,a1,1c008bc8 <rt_user_alloc+0x1e>
1c008bba:	00b71c63          	bne	a4,a1,1c008bd2 <rt_user_alloc+0x28>
1c008bbe:	43d8                	lw	a4,4(a5)
1c008bc0:	c699                	beqz	a3,1c008bce <rt_user_alloc+0x24>
1c008bc2:	c2d8                	sw	a4,4(a3)
1c008bc4:	853e                	mv	a0,a5
1c008bc6:	8082                	ret
1c008bc8:	86be                	mv	a3,a5
1c008bca:	43dc                	lw	a5,4(a5)
1c008bcc:	b7dd                	j	1c008bb2 <rt_user_alloc+0x8>
1c008bce:	c118                	sw	a4,0(a0)
1c008bd0:	bfd5                	j	1c008bc4 <rt_user_alloc+0x1a>
1c008bd2:	8f0d                	sub	a4,a4,a1
1c008bd4:	c398                	sw	a4,0(a5)
1c008bd6:	97ba                	add	a5,a5,a4
1c008bd8:	b7f5                	j	1c008bc4 <rt_user_alloc+0x1a>

1c008bda <rt_user_free>:
1c008bda:	411c                	lw	a5,0(a0)
1c008bdc:	061d                	addi	a2,a2,7
1c008bde:	9a61                	andi	a2,a2,-8
1c008be0:	4701                	li	a4,0
1c008be2:	c399                	beqz	a5,1c008be8 <rt_user_free+0xe>
1c008be4:	02b7e763          	bltu	a5,a1,1c008c12 <rt_user_free+0x38>
1c008be8:	00c586b3          	add	a3,a1,a2
1c008bec:	02d79663          	bne	a5,a3,1c008c18 <rt_user_free+0x3e>
1c008bf0:	4394                	lw	a3,0(a5)
1c008bf2:	43dc                	lw	a5,4(a5)
1c008bf4:	9636                	add	a2,a2,a3
1c008bf6:	c190                	sw	a2,0(a1)
1c008bf8:	c1dc                	sw	a5,4(a1)
1c008bfa:	c31d                	beqz	a4,1c008c20 <rt_user_free+0x46>
1c008bfc:	4314                	lw	a3,0(a4)
1c008bfe:	00d707b3          	add	a5,a4,a3
1c008c02:	00f59d63          	bne	a1,a5,1c008c1c <rt_user_free+0x42>
1c008c06:	419c                	lw	a5,0(a1)
1c008c08:	97b6                	add	a5,a5,a3
1c008c0a:	c31c                	sw	a5,0(a4)
1c008c0c:	41dc                	lw	a5,4(a1)
1c008c0e:	c35c                	sw	a5,4(a4)
1c008c10:	8082                	ret
1c008c12:	873e                	mv	a4,a5
1c008c14:	43dc                	lw	a5,4(a5)
1c008c16:	b7f1                	j	1c008be2 <rt_user_free+0x8>
1c008c18:	c190                	sw	a2,0(a1)
1c008c1a:	bff9                	j	1c008bf8 <rt_user_free+0x1e>
1c008c1c:	c34c                	sw	a1,4(a4)
1c008c1e:	8082                	ret
1c008c20:	c10c                	sw	a1,0(a0)
1c008c22:	8082                	ret

1c008c24 <rt_alloc>:
1c008c24:	1101                	addi	sp,sp,-32
1c008c26:	cc22                	sw	s0,24(sp)
1c008c28:	ce06                	sw	ra,28(sp)
1c008c2a:	ca26                	sw	s1,20(sp)
1c008c2c:	c84a                	sw	s2,16(sp)
1c008c2e:	c64e                	sw	s3,12(sp)
1c008c30:	c452                	sw	s4,8(sp)
1c008c32:	4789                	li	a5,2
1c008c34:	842a                	mv	s0,a0
1c008c36:	02a7ed63          	bltu	a5,a0,1c008c70 <rt_alloc+0x4c>
1c008c3a:	1c001937          	lui	s2,0x1c001
1c008c3e:	89ae                	mv	s3,a1
1c008c40:	448d                	li	s1,3
1c008c42:	1c890913          	addi	s2,s2,456 # 1c0011c8 <__rt_alloc_l2>
1c008c46:	4a0d                	li	s4,3
1c008c48:	00241513          	slli	a0,s0,0x2
1c008c4c:	85ce                	mv	a1,s3
1c008c4e:	954a                	add	a0,a0,s2
1c008c50:	3fa9                	jal	1c008baa <rt_user_alloc>
1c008c52:	e519                	bnez	a0,1c008c60 <rt_alloc+0x3c>
1c008c54:	0405                	addi	s0,s0,1
1c008c56:	01441363          	bne	s0,s4,1c008c5c <rt_alloc+0x38>
1c008c5a:	4401                	li	s0,0
1c008c5c:	14fd                	addi	s1,s1,-1
1c008c5e:	f4ed                	bnez	s1,1c008c48 <rt_alloc+0x24>
1c008c60:	40f2                	lw	ra,28(sp)
1c008c62:	4462                	lw	s0,24(sp)
1c008c64:	44d2                	lw	s1,20(sp)
1c008c66:	4942                	lw	s2,16(sp)
1c008c68:	49b2                	lw	s3,12(sp)
1c008c6a:	4a22                	lw	s4,8(sp)
1c008c6c:	6105                	addi	sp,sp,32
1c008c6e:	8082                	ret
1c008c70:	1c0017b7          	lui	a5,0x1c001
1c008c74:	ffd50413          	addi	s0,a0,-3
1c008c78:	1c47a503          	lw	a0,452(a5) # 1c0011c4 <__rt_alloc_l1>
1c008c7c:	040a                	slli	s0,s0,0x2
1c008c7e:	40f2                	lw	ra,28(sp)
1c008c80:	9522                	add	a0,a0,s0
1c008c82:	4462                	lw	s0,24(sp)
1c008c84:	44d2                	lw	s1,20(sp)
1c008c86:	4942                	lw	s2,16(sp)
1c008c88:	49b2                	lw	s3,12(sp)
1c008c8a:	4a22                	lw	s4,8(sp)
1c008c8c:	6105                	addi	sp,sp,32
1c008c8e:	bf31                	j	1c008baa <rt_user_alloc>

1c008c90 <__rt_alloc_init_l1>:
1c008c90:	1c0017b7          	lui	a5,0x1c001
1c008c94:	1c47a703          	lw	a4,452(a5) # 1c0011c4 <__rt_alloc_l1>
1c008c98:	100027b7          	lui	a5,0x10002
1c008c9c:	01651593          	slli	a1,a0,0x16
1c008ca0:	6639                	lui	a2,0xe
1c008ca2:	050a                	slli	a0,a0,0x2
1c008ca4:	81478793          	addi	a5,a5,-2028 # 10001814 <__l1_end>
1c008ca8:	7ec60613          	addi	a2,a2,2028 # e7ec <__l1_heap_size>
1c008cac:	95be                	add	a1,a1,a5
1c008cae:	953a                	add	a0,a0,a4
1c008cb0:	bdf9                	j	1c008b8e <rt_user_alloc_init>

1c008cb2 <__rt_alloc_init_l1_for_fc>:
1c008cb2:	100025b7          	lui	a1,0x10002
1c008cb6:	01651793          	slli	a5,a0,0x16
1c008cba:	81458593          	addi	a1,a1,-2028 # 10001814 <__l1_end>
1c008cbe:	00b78733          	add	a4,a5,a1
1c008cc2:	050a                	slli	a0,a0,0x2
1c008cc4:	0791                	addi	a5,a5,4
1c008cc6:	6639                	lui	a2,0xe
1c008cc8:	1c0016b7          	lui	a3,0x1c001
1c008ccc:	7e860613          	addi	a2,a2,2024 # e7e8 <_l1_preload_size+0xcfd8>
1c008cd0:	95be                	add	a1,a1,a5
1c008cd2:	953a                	add	a0,a0,a4
1c008cd4:	1ce6a223          	sw	a4,452(a3) # 1c0011c4 <__rt_alloc_l1>
1c008cd8:	bd5d                	j	1c008b8e <rt_user_alloc_init>

1c008cda <__rt_allocs_init>:
1c008cda:	1141                	addi	sp,sp,-16
1c008cdc:	1c0015b7          	lui	a1,0x1c001
1c008ce0:	c606                	sw	ra,12(sp)
1c008ce2:	21458793          	addi	a5,a1,532 # 1c001214 <__l2_priv0_end>
1c008ce6:	1c008637          	lui	a2,0x1c008
1c008cea:	06c7ca63          	blt	a5,a2,1c008d5e <__rt_allocs_init+0x84>
1c008cee:	4581                	li	a1,0
1c008cf0:	4601                	li	a2,0
1c008cf2:	1c001537          	lui	a0,0x1c001
1c008cf6:	1c850513          	addi	a0,a0,456 # 1c0011c8 <__rt_alloc_l2>
1c008cfa:	3d51                	jal	1c008b8e <rt_user_alloc_init>
1c008cfc:	1c00b5b7          	lui	a1,0x1c00b
1c008d00:	63458793          	addi	a5,a1,1588 # 1c00b634 <__l2_priv1_end>
1c008d04:	1c010637          	lui	a2,0x1c010
1c008d08:	04c7cf63          	blt	a5,a2,1c008d66 <__rt_allocs_init+0x8c>
1c008d0c:	4581                	li	a1,0
1c008d0e:	4601                	li	a2,0
1c008d10:	1c001537          	lui	a0,0x1c001
1c008d14:	1cc50513          	addi	a0,a0,460 # 1c0011cc <__rt_alloc_l2+0x4>
1c008d18:	3d9d                	jal	1c008b8e <rt_user_alloc_init>
1c008d1a:	1c0125b7          	lui	a1,0x1c012
1c008d1e:	99858793          	addi	a5,a1,-1640 # 1c011998 <__l2_shared_end>
1c008d22:	1c080637          	lui	a2,0x1c080
1c008d26:	1c001537          	lui	a0,0x1c001
1c008d2a:	8e1d                	sub	a2,a2,a5
1c008d2c:	99858593          	addi	a1,a1,-1640
1c008d30:	1d050513          	addi	a0,a0,464 # 1c0011d0 <__rt_alloc_l2+0x8>
1c008d34:	3da9                	jal	1c008b8e <rt_user_alloc_init>
1c008d36:	f14027f3          	csrr	a5,mhartid
1c008d3a:	8795                	srai	a5,a5,0x5
1c008d3c:	03f7f793          	andi	a5,a5,63
1c008d40:	e789                	bnez	a5,1c008d4a <__rt_allocs_init+0x70>
1c008d42:	40b2                	lw	ra,12(sp)
1c008d44:	4501                	li	a0,0
1c008d46:	0141                	addi	sp,sp,16
1c008d48:	b7ad                	j	1c008cb2 <__rt_alloc_init_l1_for_fc>
1c008d4a:	4591                	li	a1,4
1c008d4c:	4501                	li	a0,0
1c008d4e:	3dd9                	jal	1c008c24 <rt_alloc>
1c008d50:	40b2                	lw	ra,12(sp)
1c008d52:	1c0017b7          	lui	a5,0x1c001
1c008d56:	1ca7a223          	sw	a0,452(a5) # 1c0011c4 <__rt_alloc_l1>
1c008d5a:	0141                	addi	sp,sp,16
1c008d5c:	8082                	ret
1c008d5e:	8e1d                	sub	a2,a2,a5
1c008d60:	21458593          	addi	a1,a1,532
1c008d64:	b779                	j	1c008cf2 <__rt_allocs_init+0x18>
1c008d66:	8e1d                	sub	a2,a2,a5
1c008d68:	63458593          	addi	a1,a1,1588
1c008d6c:	b755                	j	1c008d10 <__rt_allocs_init+0x36>

1c008d6e <__rt_init_cluster_data>:
1c008d6e:	04050793          	addi	a5,a0,64
1c008d72:	01679693          	slli	a3,a5,0x16
1c008d76:	6705                	lui	a4,0x1
1c008d78:	177d                	addi	a4,a4,-1
1c008d7a:	00400793          	li	a5,4
1c008d7e:	8ff9                	and	a5,a5,a4
1c008d80:	1c010737          	lui	a4,0x1c010
1c008d84:	97b6                	add	a5,a5,a3
1c008d86:	6609                	lui	a2,0x2
1c008d88:	18870713          	addi	a4,a4,392 # 1c010188 <_l1_preload_start_inL2>
1c008d8c:	81060613          	addi	a2,a2,-2032 # 1810 <_l1_preload_size>
1c008d90:	8f99                	sub	a5,a5,a4
1c008d92:	00f705b3          	add	a1,a4,a5
1c008d96:	02c04b63          	bgtz	a2,1c008dcc <__rt_init_cluster_data+0x5e>
1c008d9a:	02800713          	li	a4,40
1c008d9e:	02e50733          	mul	a4,a0,a4
1c008da2:	1c0017b7          	lui	a5,0x1c001
1c008da6:	1d878513          	addi	a0,a5,472 # 1c0011d8 <__rt_fc_cluster_data>
1c008daa:	002017b7          	lui	a5,0x201
1c008dae:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c008db2:	97b6                	add	a5,a5,a3
1c008db4:	953a                	add	a0,a0,a4
1c008db6:	c91c                	sw	a5,16(a0)
1c008db8:	6705                	lui	a4,0x1
1c008dba:	00400793          	li	a5,4
1c008dbe:	177d                	addi	a4,a4,-1
1c008dc0:	8ff9                	and	a5,a5,a4
1c008dc2:	97b6                	add	a5,a5,a3
1c008dc4:	00052423          	sw	zero,8(a0)
1c008dc8:	c95c                	sw	a5,20(a0)
1c008dca:	8082                	ret
1c008dcc:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008dd0:	1671                	addi	a2,a2,-4
1c008dd2:	0711                	addi	a4,a4,4
1c008dd4:	0105a023          	sw	a6,0(a1)
1c008dd8:	bf6d                	j	1c008d92 <__rt_init_cluster_data+0x24>

1c008dda <__rt_cluster_mount_step>:
1c008dda:	7179                	addi	sp,sp,-48
1c008ddc:	d04a                	sw	s2,32(sp)
1c008dde:	ce4e                	sw	s3,28(sp)
1c008de0:	6785                	lui	a5,0x1
1c008de2:	1c0089b7          	lui	s3,0x1c008
1c008de6:	00400913          	li	s2,4
1c008dea:	17fd                	addi	a5,a5,-1
1c008dec:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008df0:	d422                	sw	s0,40(sp)
1c008df2:	d606                	sw	ra,44(sp)
1c008df4:	d226                	sw	s1,36(sp)
1c008df6:	cc52                	sw	s4,24(sp)
1c008df8:	842a                	mv	s0,a0
1c008dfa:	00f97933          	and	s2,s2,a5
1c008dfe:	f009f993          	andi	s3,s3,-256
1c008e02:	4c5c                	lw	a5,28(s0)
1c008e04:	4705                	li	a4,1
1c008e06:	02e78d63          	beq	a5,a4,1c008e40 <__rt_cluster_mount_step+0x66>
1c008e0a:	4709                	li	a4,2
1c008e0c:	0ae78d63          	beq	a5,a4,1c008ec6 <__rt_cluster_mount_step+0xec>
1c008e10:	e7dd                	bnez	a5,1c008ebe <__rt_cluster_mount_step+0xe4>
1c008e12:	5018                	lw	a4,32(s0)
1c008e14:	00042c23          	sw	zero,24(s0)
1c008e18:	eb01                	bnez	a4,1c008e28 <__rt_cluster_mount_step+0x4e>
1c008e1a:	5048                	lw	a0,36(s0)
1c008e1c:	006c                	addi	a1,sp,12
1c008e1e:	c602                	sw	zero,12(sp)
1c008e20:	1e8010ef          	jal	ra,1c00a008 <__rt_pmu_cluster_power_up>
1c008e24:	47b2                	lw	a5,12(sp)
1c008e26:	cc08                	sw	a0,24(s0)
1c008e28:	4c58                	lw	a4,28(s0)
1c008e2a:	0705                	addi	a4,a4,1
1c008e2c:	cc58                	sw	a4,28(s0)
1c008e2e:	dbf1                	beqz	a5,1c008e02 <__rt_cluster_mount_step+0x28>
1c008e30:	50b2                	lw	ra,44(sp)
1c008e32:	5422                	lw	s0,40(sp)
1c008e34:	5492                	lw	s1,36(sp)
1c008e36:	5902                	lw	s2,32(sp)
1c008e38:	49f2                	lw	s3,28(sp)
1c008e3a:	4a62                	lw	s4,24(sp)
1c008e3c:	6145                	addi	sp,sp,48
1c008e3e:	8082                	ret
1c008e40:	02042a03          	lw	s4,32(s0)
1c008e44:	040a0493          	addi	s1,s4,64
1c008e48:	04da                	slli	s1,s1,0x16
1c008e4a:	00990733          	add	a4,s2,s1
1c008e4e:	00072223          	sw	zero,4(a4)
1c008e52:	00072423          	sw	zero,8(a4)
1c008e56:	00072023          	sw	zero,0(a4)
1c008e5a:	1c001737          	lui	a4,0x1c001
1c008e5e:	0ac72703          	lw	a4,172(a4) # 1c0010ac <__rt_platform>
1c008e62:	00f70f63          	beq	a4,a5,1c008e80 <__rt_cluster_mount_step+0xa6>
1c008e66:	4505                	li	a0,1
1c008e68:	727000ef          	jal	ra,1c009d8e <__rt_fll_init>
1c008e6c:	1c0017b7          	lui	a5,0x1c001
1c008e70:	20878793          	addi	a5,a5,520 # 1c001208 <__rt_freq_domains>
1c008e74:	43cc                	lw	a1,4(a5)
1c008e76:	c5b1                	beqz	a1,1c008ec2 <__rt_cluster_mount_step+0xe8>
1c008e78:	4601                	li	a2,0
1c008e7a:	4505                	li	a0,1
1c008e7c:	0a8010ef          	jal	ra,1c009f24 <rt_freq_set_and_get>
1c008e80:	8552                	mv	a0,s4
1c008e82:	35f5                	jal	1c008d6e <__rt_init_cluster_data>
1c008e84:	8552                	mv	a0,s4
1c008e86:	3529                	jal	1c008c90 <__rt_alloc_init_l1>
1c008e88:	002017b7          	lui	a5,0x201
1c008e8c:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f2c14>
1c008e90:	97a6                	add	a5,a5,s1
1c008e92:	577d                	li	a4,-1
1c008e94:	c398                	sw	a4,0(a5)
1c008e96:	002007b7          	lui	a5,0x200
1c008e9a:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f1854>
1c008e9e:	06078793          	addi	a5,a5,96
1c008ea2:	9726                	add	a4,a4,s1
1c008ea4:	97a6                	add	a5,a5,s1
1c008ea6:	01372023          	sw	s3,0(a4)
1c008eaa:	0711                	addi	a4,a4,4
1c008eac:	fef71de3          	bne	a4,a5,1c008ea6 <__rt_cluster_mount_step+0xcc>
1c008eb0:	002007b7          	lui	a5,0x200
1c008eb4:	07a1                	addi	a5,a5,8
1c008eb6:	94be                	add	s1,s1,a5
1c008eb8:	0ff00793          	li	a5,255
1c008ebc:	c09c                	sw	a5,0(s1)
1c008ebe:	4781                	li	a5,0
1c008ec0:	b7a5                	j	1c008e28 <__rt_cluster_mount_step+0x4e>
1c008ec2:	c3c8                	sw	a0,4(a5)
1c008ec4:	bf75                	j	1c008e80 <__rt_cluster_mount_step+0xa6>
1c008ec6:	505c                	lw	a5,36(s0)
1c008ec8:	5b98                	lw	a4,48(a5)
1c008eca:	d398                	sw	a4,32(a5)
1c008ecc:	5798                	lw	a4,40(a5)
1c008ece:	c398                	sw	a4,0(a5)
1c008ed0:	57d8                	lw	a4,44(a5)
1c008ed2:	c3d8                	sw	a4,4(a5)
1c008ed4:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f1844>
1c008ed8:	505c                	lw	a5,36(s0)
1c008eda:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008ede:	0007ac23          	sw	zero,24(a5)
1c008ee2:	cb01                	beqz	a4,1c008ef2 <__rt_cluster_mount_step+0x118>
1c008ee4:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008ee8:	cf1c                	sw	a5,24(a4)
1c008eea:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008eee:	4785                	li	a5,1
1c008ef0:	bf25                	j	1c008e28 <__rt_cluster_mount_step+0x4e>
1c008ef2:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008ef6:	bfd5                	j	1c008eea <__rt_cluster_mount_step+0x110>

1c008ef8 <__rt_cluster_init>:
1c008ef8:	1c001537          	lui	a0,0x1c001
1c008efc:	1141                	addi	sp,sp,-16
1c008efe:	02800613          	li	a2,40
1c008f02:	4581                	li	a1,0
1c008f04:	1d850513          	addi	a0,a0,472 # 1c0011d8 <__rt_fc_cluster_data>
1c008f08:	c606                	sw	ra,12(sp)
1c008f0a:	075010ef          	jal	ra,1c00a77e <memset>
1c008f0e:	1c0085b7          	lui	a1,0x1c008
1c008f12:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008f16:	4505                	li	a0,1
1c008f18:	2bfd                	jal	1c009516 <rt_irq_set_handler>
1c008f1a:	f14027f3          	csrr	a5,mhartid
1c008f1e:	8795                	srai	a5,a5,0x5
1c008f20:	03f7f793          	andi	a5,a5,63
1c008f24:	477d                	li	a4,31
1c008f26:	02e79e63          	bne	a5,a4,1c008f62 <__rt_cluster_init+0x6a>
1c008f2a:	1a10a7b7          	lui	a5,0x1a10a
1c008f2e:	4709                	li	a4,2
1c008f30:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c008f34:	1c0085b7          	lui	a1,0x1c008
1c008f38:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008f3c:	4511                	li	a0,4
1c008f3e:	2be1                	jal	1c009516 <rt_irq_set_handler>
1c008f40:	f14027f3          	csrr	a5,mhartid
1c008f44:	8795                	srai	a5,a5,0x5
1c008f46:	03f7f793          	andi	a5,a5,63
1c008f4a:	477d                	li	a4,31
1c008f4c:	02e79063          	bne	a5,a4,1c008f6c <__rt_cluster_init+0x74>
1c008f50:	1a10a7b7          	lui	a5,0x1a10a
1c008f54:	4741                	li	a4,16
1c008f56:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c008f5a:	40b2                	lw	ra,12(sp)
1c008f5c:	4501                	li	a0,0
1c008f5e:	0141                	addi	sp,sp,16
1c008f60:	8082                	ret
1c008f62:	002047b7          	lui	a5,0x204
1c008f66:	4709                	li	a4,2
1c008f68:	cbd8                	sw	a4,20(a5)
1c008f6a:	b7e9                	j	1c008f34 <__rt_cluster_init+0x3c>
1c008f6c:	002047b7          	lui	a5,0x204
1c008f70:	4741                	li	a4,16
1c008f72:	cbd8                	sw	a4,20(a5)
1c008f74:	b7dd                	j	1c008f5a <__rt_cluster_init+0x62>

1c008f76 <pi_cluster_conf_init>:
1c008f76:	00052223          	sw	zero,4(a0)
1c008f7a:	8082                	ret

1c008f7c <pi_cluster_open>:
1c008f7c:	1101                	addi	sp,sp,-32
1c008f7e:	ce06                	sw	ra,28(sp)
1c008f80:	cc22                	sw	s0,24(sp)
1c008f82:	ca26                	sw	s1,20(sp)
1c008f84:	c84a                	sw	s2,16(sp)
1c008f86:	c64e                	sw	s3,12(sp)
1c008f88:	30047973          	csrrci	s2,mstatus,8
1c008f8c:	00452983          	lw	s3,4(a0)
1c008f90:	02800793          	li	a5,40
1c008f94:	0049a483          	lw	s1,4(s3)
1c008f98:	02f484b3          	mul	s1,s1,a5
1c008f9c:	1c0017b7          	lui	a5,0x1c001
1c008fa0:	1d878793          	addi	a5,a5,472 # 1c0011d8 <__rt_fc_cluster_data>
1c008fa4:	94be                	add	s1,s1,a5
1c008fa6:	c504                	sw	s1,8(a0)
1c008fa8:	3b7000ef          	jal	ra,1c009b5e <__rt_wait_event_prepare_blocking>
1c008fac:	f14027f3          	csrr	a5,mhartid
1c008fb0:	8795                	srai	a5,a5,0x5
1c008fb2:	03f7f793          	andi	a5,a5,63
1c008fb6:	477d                	li	a4,31
1c008fb8:	842a                	mv	s0,a0
1c008fba:	04e79463          	bne	a5,a4,1c009002 <pi_cluster_open+0x86>
1c008fbe:	511c                	lw	a5,32(a0)
1c008fc0:	0004ae23          	sw	zero,28(s1)
1c008fc4:	d0c8                	sw	a0,36(s1)
1c008fc6:	d91c                	sw	a5,48(a0)
1c008fc8:	411c                	lw	a5,0(a0)
1c008fca:	02052223          	sw	zero,36(a0)
1c008fce:	d51c                	sw	a5,40(a0)
1c008fd0:	415c                	lw	a5,4(a0)
1c008fd2:	c144                	sw	s1,4(a0)
1c008fd4:	d55c                	sw	a5,44(a0)
1c008fd6:	1c0097b7          	lui	a5,0x1c009
1c008fda:	dda78793          	addi	a5,a5,-550 # 1c008dda <__rt_cluster_mount_step>
1c008fde:	c11c                	sw	a5,0(a0)
1c008fe0:	4785                	li	a5,1
1c008fe2:	d11c                	sw	a5,32(a0)
1c008fe4:	8526                	mv	a0,s1
1c008fe6:	3bd5                	jal	1c008dda <__rt_cluster_mount_step>
1c008fe8:	8522                	mv	a0,s0
1c008fea:	4c5000ef          	jal	ra,1c009cae <__rt_wait_event>
1c008fee:	30091073          	csrw	mstatus,s2
1c008ff2:	40f2                	lw	ra,28(sp)
1c008ff4:	4462                	lw	s0,24(sp)
1c008ff6:	44d2                	lw	s1,20(sp)
1c008ff8:	4942                	lw	s2,16(sp)
1c008ffa:	49b2                	lw	s3,12(sp)
1c008ffc:	4501                	li	a0,0
1c008ffe:	6105                	addi	sp,sp,32
1c009000:	8082                	ret
1c009002:	0049a483          	lw	s1,4(s3)
1c009006:	8526                	mv	a0,s1
1c009008:	339d                	jal	1c008d6e <__rt_init_cluster_data>
1c00900a:	04048513          	addi	a0,s1,64
1c00900e:	002017b7          	lui	a5,0x201
1c009012:	055a                	slli	a0,a0,0x16
1c009014:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f2c14>
1c009018:	97aa                	add	a5,a5,a0
1c00901a:	577d                	li	a4,-1
1c00901c:	c398                	sw	a4,0(a5)
1c00901e:	1c0086b7          	lui	a3,0x1c008
1c009022:	002007b7          	lui	a5,0x200
1c009026:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f1858>
1c00902a:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c00902e:	06078793          	addi	a5,a5,96
1c009032:	972a                	add	a4,a4,a0
1c009034:	97aa                	add	a5,a5,a0
1c009036:	f006f693          	andi	a3,a3,-256
1c00903a:	c314                	sw	a3,0(a4)
1c00903c:	0711                	addi	a4,a4,4
1c00903e:	fef71ee3          	bne	a4,a5,1c00903a <pi_cluster_open+0xbe>
1c009042:	002007b7          	lui	a5,0x200
1c009046:	07a1                	addi	a5,a5,8
1c009048:	953e                	add	a0,a0,a5
1c00904a:	57fd                	li	a5,-1
1c00904c:	c11c                	sw	a5,0(a0)
1c00904e:	8522                	mv	a0,s0
1c009050:	3db000ef          	jal	ra,1c009c2a <rt_event_push>
1c009054:	bf51                	j	1c008fe8 <pi_cluster_open+0x6c>

1c009056 <pi_cluster_close>:
1c009056:	451c                	lw	a5,8(a0)
1c009058:	1101                	addi	sp,sp,-32
1c00905a:	cc22                	sw	s0,24(sp)
1c00905c:	5380                	lw	s0,32(a5)
1c00905e:	1c0017b7          	lui	a5,0x1c001
1c009062:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c009066:	ce06                	sw	ra,28(sp)
1c009068:	4785                	li	a5,1
1c00906a:	00f70563          	beq	a4,a5,1c009074 <pi_cluster_close+0x1e>
1c00906e:	4505                	li	a0,1
1c009070:	5d5000ef          	jal	ra,1c009e44 <__rt_fll_deinit>
1c009074:	c602                	sw	zero,12(sp)
1c009076:	e409                	bnez	s0,1c009080 <pi_cluster_close+0x2a>
1c009078:	006c                	addi	a1,sp,12
1c00907a:	4501                	li	a0,0
1c00907c:	749000ef          	jal	ra,1c009fc4 <__rt_pmu_cluster_power_down>
1c009080:	40f2                	lw	ra,28(sp)
1c009082:	4462                	lw	s0,24(sp)
1c009084:	4501                	li	a0,0
1c009086:	6105                	addi	sp,sp,32
1c009088:	8082                	ret

1c00908a <__rt_cluster_push_fc_event>:
1c00908a:	002047b7          	lui	a5,0x204
1c00908e:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f58d4>
1c009092:	0007e703          	p.elw	a4,0(a5)
1c009096:	f14027f3          	csrr	a5,mhartid
1c00909a:	8795                	srai	a5,a5,0x5
1c00909c:	02800693          	li	a3,40
1c0090a0:	03f7f793          	andi	a5,a5,63
1c0090a4:	02d787b3          	mul	a5,a5,a3
1c0090a8:	1c001737          	lui	a4,0x1c001
1c0090ac:	1d870713          	addi	a4,a4,472 # 1c0011d8 <__rt_fc_cluster_data>
1c0090b0:	4689                	li	a3,2
1c0090b2:	97ba                	add	a5,a5,a4
1c0090b4:	00204737          	lui	a4,0x204
1c0090b8:	43d0                	lw	a2,4(a5)
1c0090ba:	ee01                	bnez	a2,1c0090d2 <__rt_cluster_push_fc_event+0x48>
1c0090bc:	c3c8                	sw	a0,4(a5)
1c0090be:	4709                	li	a4,2
1c0090c0:	1a10a7b7          	lui	a5,0x1a10a
1c0090c4:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa107ffc>
1c0090c8:	002047b7          	lui	a5,0x204
1c0090cc:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f58d4>
1c0090d0:	8082                	ret
1c0090d2:	c714                	sw	a3,8(a4)
1c0090d4:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c0090d8:	c354                	sw	a3,4(a4)
1c0090da:	bff9                	j	1c0090b8 <__rt_cluster_push_fc_event+0x2e>

1c0090dc <__rt_cluster_new>:
1c0090dc:	1c0095b7          	lui	a1,0x1c009
1c0090e0:	1141                	addi	sp,sp,-16
1c0090e2:	4601                	li	a2,0
1c0090e4:	ef858593          	addi	a1,a1,-264 # 1c008ef8 <__rt_cluster_init>
1c0090e8:	4501                	li	a0,0
1c0090ea:	c606                	sw	ra,12(sp)
1c0090ec:	2b6d                	jal	1c0096a6 <__rt_cbsys_add>
1c0090ee:	c105                	beqz	a0,1c00910e <__rt_cluster_new+0x32>
1c0090f0:	f1402673          	csrr	a2,mhartid
1c0090f4:	1c000537          	lui	a0,0x1c000
1c0090f8:	40565593          	srai	a1,a2,0x5
1c0090fc:	03f5f593          	andi	a1,a1,63
1c009100:	8a7d                	andi	a2,a2,31
1c009102:	52050513          	addi	a0,a0,1312 # 1c000520 <__DTOR_END__+0x234>
1c009106:	0c5010ef          	jal	ra,1c00a9ca <printf>
1c00910a:	04d010ef          	jal	ra,1c00a956 <abort>
1c00910e:	40b2                	lw	ra,12(sp)
1c009110:	0141                	addi	sp,sp,16
1c009112:	8082                	ret

1c009114 <__rt_cluster_pulpos_emu_init>:
1c009114:	1141                	addi	sp,sp,-16
1c009116:	45b1                	li	a1,12
1c009118:	4501                	li	a0,0
1c00911a:	c606                	sw	ra,12(sp)
1c00911c:	3621                	jal	1c008c24 <rt_alloc>
1c00911e:	1c0017b7          	lui	a5,0x1c001
1c009122:	18a7ac23          	sw	a0,408(a5) # 1c001198 <__rt_fc_cluster_device>
1c009126:	e105                	bnez	a0,1c009146 <__rt_cluster_pulpos_emu_init+0x32>
1c009128:	f1402673          	csrr	a2,mhartid
1c00912c:	1c000537          	lui	a0,0x1c000
1c009130:	40565593          	srai	a1,a2,0x5
1c009134:	03f5f593          	andi	a1,a1,63
1c009138:	8a7d                	andi	a2,a2,31
1c00913a:	56850513          	addi	a0,a0,1384 # 1c000568 <__DTOR_END__+0x27c>
1c00913e:	08d010ef          	jal	ra,1c00a9ca <printf>
1c009142:	015010ef          	jal	ra,1c00a956 <abort>
1c009146:	40b2                	lw	ra,12(sp)
1c009148:	0141                	addi	sp,sp,16
1c00914a:	8082                	ret

1c00914c <rt_cluster_call>:
1c00914c:	7139                	addi	sp,sp,-64
1c00914e:	d84a                	sw	s2,48(sp)
1c009150:	4906                	lw	s2,64(sp)
1c009152:	dc22                	sw	s0,56(sp)
1c009154:	842e                	mv	s0,a1
1c009156:	de06                	sw	ra,60(sp)
1c009158:	da26                	sw	s1,52(sp)
1c00915a:	d64e                	sw	s3,44(sp)
1c00915c:	300479f3          	csrrci	s3,mstatus,8
1c009160:	84ca                	mv	s1,s2
1c009162:	02091163          	bnez	s2,1c009184 <rt_cluster_call+0x38>
1c009166:	ce32                	sw	a2,28(sp)
1c009168:	cc36                	sw	a3,24(sp)
1c00916a:	ca3a                	sw	a4,20(sp)
1c00916c:	c83e                	sw	a5,16(sp)
1c00916e:	c642                	sw	a6,12(sp)
1c009170:	c446                	sw	a7,8(sp)
1c009172:	1ed000ef          	jal	ra,1c009b5e <__rt_wait_event_prepare_blocking>
1c009176:	48a2                	lw	a7,8(sp)
1c009178:	4832                	lw	a6,12(sp)
1c00917a:	47c2                	lw	a5,16(sp)
1c00917c:	4752                	lw	a4,20(sp)
1c00917e:	46e2                	lw	a3,24(sp)
1c009180:	4672                	lw	a2,28(sp)
1c009182:	84aa                	mv	s1,a0
1c009184:	4531                	li	a0,12
1c009186:	02a40433          	mul	s0,s0,a0
1c00918a:	1c0015b7          	lui	a1,0x1c001
1c00918e:	0d058313          	addi	t1,a1,208 # 1c0010d0 <__rt_pulpos_emu_global_cluster_task>
1c009192:	00f32623          	sw	a5,12(t1)
1c009196:	1c0017b7          	lui	a5,0x1c001
1c00919a:	1987a503          	lw	a0,408(a5) # 1c001198 <__rt_fc_cluster_device>
1c00919e:	00c32023          	sw	a2,0(t1)
1c0091a2:	0d058593          	addi	a1,a1,208
1c0091a6:	8626                	mv	a2,s1
1c0091a8:	00d32223          	sw	a3,4(t1)
1c0091ac:	9522                	add	a0,a0,s0
1c0091ae:	00e32423          	sw	a4,8(t1)
1c0091b2:	01032823          	sw	a6,16(t1)
1c0091b6:	01132a23          	sw	a7,20(t1)
1c0091ba:	2041                	jal	1c00923a <pi_cluster_send_task_to_cl_async>
1c0091bc:	842a                	mv	s0,a0
1c0091be:	cd01                	beqz	a0,1c0091d6 <rt_cluster_call+0x8a>
1c0091c0:	30099073          	csrw	mstatus,s3
1c0091c4:	547d                	li	s0,-1
1c0091c6:	8522                	mv	a0,s0
1c0091c8:	50f2                	lw	ra,60(sp)
1c0091ca:	5462                	lw	s0,56(sp)
1c0091cc:	54d2                	lw	s1,52(sp)
1c0091ce:	5942                	lw	s2,48(sp)
1c0091d0:	59b2                	lw	s3,44(sp)
1c0091d2:	6121                	addi	sp,sp,64
1c0091d4:	8082                	ret
1c0091d6:	00091563          	bnez	s2,1c0091e0 <rt_cluster_call+0x94>
1c0091da:	8526                	mv	a0,s1
1c0091dc:	2d3000ef          	jal	ra,1c009cae <__rt_wait_event>
1c0091e0:	30099073          	csrw	mstatus,s3
1c0091e4:	b7cd                	j	1c0091c6 <rt_cluster_call+0x7a>

1c0091e6 <rt_cluster_mount>:
1c0091e6:	7139                	addi	sp,sp,-64
1c0091e8:	dc22                	sw	s0,56(sp)
1c0091ea:	da26                	sw	s1,52(sp)
1c0091ec:	d84a                	sw	s2,48(sp)
1c0091ee:	4431                	li	s0,12
1c0091f0:	1c0014b7          	lui	s1,0x1c001
1c0091f4:	de06                	sw	ra,60(sp)
1c0091f6:	d64e                	sw	s3,44(sp)
1c0091f8:	8936                	mv	s2,a3
1c0091fa:	02858433          	mul	s0,a1,s0
1c0091fe:	19848493          	addi	s1,s1,408 # 1c001198 <__rt_fc_cluster_device>
1c009202:	c905                	beqz	a0,1c009232 <rt_cluster_mount+0x4c>
1c009204:	0068                	addi	a0,sp,12
1c009206:	89ae                	mv	s3,a1
1c009208:	33bd                	jal	1c008f76 <pi_cluster_conf_init>
1c00920a:	4088                	lw	a0,0(s1)
1c00920c:	006c                	addi	a1,sp,12
1c00920e:	9522                	add	a0,a0,s0
1c009210:	2609                	jal	1c009512 <pi_open_from_conf>
1c009212:	4088                	lw	a0,0(s1)
1c009214:	c84e                	sw	s3,16(sp)
1c009216:	9522                	add	a0,a0,s0
1c009218:	3395                	jal	1c008f7c <pi_cluster_open>
1c00921a:	00090563          	beqz	s2,1c009224 <rt_cluster_mount+0x3e>
1c00921e:	854a                	mv	a0,s2
1c009220:	20b000ef          	jal	ra,1c009c2a <rt_event_push>
1c009224:	50f2                	lw	ra,60(sp)
1c009226:	5462                	lw	s0,56(sp)
1c009228:	54d2                	lw	s1,52(sp)
1c00922a:	5942                	lw	s2,48(sp)
1c00922c:	59b2                	lw	s3,44(sp)
1c00922e:	6121                	addi	sp,sp,64
1c009230:	8082                	ret
1c009232:	4088                	lw	a0,0(s1)
1c009234:	9522                	add	a0,a0,s0
1c009236:	3505                	jal	1c009056 <pi_cluster_close>
1c009238:	b7cd                	j	1c00921a <rt_cluster_mount+0x34>

1c00923a <pi_cluster_send_task_to_cl_async>:
1c00923a:	1101                	addi	sp,sp,-32
1c00923c:	ca26                	sw	s1,20(sp)
1c00923e:	4504                	lw	s1,8(a0)
1c009240:	cc22                	sw	s0,24(sp)
1c009242:	c256                	sw	s5,4(sp)
1c009244:	842e                	mv	s0,a1
1c009246:	8ab2                	mv	s5,a2
1c009248:	ce06                	sw	ra,28(sp)
1c00924a:	c84a                	sw	s2,16(sp)
1c00924c:	c64e                	sw	s3,12(sp)
1c00924e:	c452                	sw	s4,8(sp)
1c009250:	30047a73          	csrrci	s4,mstatus,8
1c009254:	00060823          	sb	zero,16(a2)
1c009258:	4785                	li	a5,1
1c00925a:	d1dc                	sw	a5,36(a1)
1c00925c:	49dc                	lw	a5,20(a1)
1c00925e:	0144a983          	lw	s3,20(s1)
1c009262:	e399                	bnez	a5,1c009268 <pi_cluster_send_task_to_cl_async+0x2e>
1c009264:	47a1                	li	a5,8
1c009266:	c9dc                	sw	a5,20(a1)
1c009268:	441c                	lw	a5,8(s0)
1c00926a:	eb8d                	bnez	a5,1c00929c <pi_cluster_send_task_to_cl_async+0x62>
1c00926c:	445c                	lw	a5,12(s0)
1c00926e:	e789                	bnez	a5,1c009278 <pi_cluster_send_task_to_cl_async+0x3e>
1c009270:	40000793          	li	a5,1024
1c009274:	c45c                	sw	a5,12(s0)
1c009276:	c81c                	sw	a5,16(s0)
1c009278:	4818                	lw	a4,16(s0)
1c00927a:	445c                	lw	a5,12(s0)
1c00927c:	e311                	bnez	a4,1c009280 <pi_cluster_send_task_to_cl_async+0x46>
1c00927e:	c81c                	sw	a5,16(s0)
1c009280:	01442903          	lw	s2,20(s0)
1c009284:	4818                	lw	a4,16(s0)
1c009286:	448c                	lw	a1,8(s1)
1c009288:	197d                	addi	s2,s2,-1
1c00928a:	02e90933          	mul	s2,s2,a4
1c00928e:	993e                	add	s2,s2,a5
1c009290:	c9bd                	beqz	a1,1c009306 <pi_cluster_send_task_to_cl_async+0xcc>
1c009292:	44d0                	lw	a2,12(s1)
1c009294:	07261063          	bne	a2,s2,1c0092f4 <pi_cluster_send_task_to_cl_async+0xba>
1c009298:	449c                	lw	a5,8(s1)
1c00929a:	c41c                	sw	a5,8(s0)
1c00929c:	4858                	lw	a4,20(s0)
1c00929e:	4785                	li	a5,1
1c0092a0:	01542c23          	sw	s5,24(s0)
1c0092a4:	00e797b3          	sll	a5,a5,a4
1c0092a8:	17fd                	addi	a5,a5,-1
1c0092aa:	d41c                	sw	a5,40(s0)
1c0092ac:	02042023          	sw	zero,32(s0)
1c0092b0:	0089a783          	lw	a5,8(s3)
1c0092b4:	cbbd                	beqz	a5,1c00932a <pi_cluster_send_task_to_cl_async+0xf0>
1c0092b6:	d380                	sw	s0,32(a5)
1c0092b8:	0089a423          	sw	s0,8(s3)
1c0092bc:	0009a783          	lw	a5,0(s3)
1c0092c0:	e399                	bnez	a5,1c0092c6 <pi_cluster_send_task_to_cl_async+0x8c>
1c0092c2:	0089a023          	sw	s0,0(s3)
1c0092c6:	509c                	lw	a5,32(s1)
1c0092c8:	00201737          	lui	a4,0x201
1c0092cc:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c0092d0:	04078793          	addi	a5,a5,64
1c0092d4:	07da                	slli	a5,a5,0x16
1c0092d6:	97ba                	add	a5,a5,a4
1c0092d8:	0007a023          	sw	zero,0(a5)
1c0092dc:	300a1073          	csrw	mstatus,s4
1c0092e0:	4501                	li	a0,0
1c0092e2:	40f2                	lw	ra,28(sp)
1c0092e4:	4462                	lw	s0,24(sp)
1c0092e6:	44d2                	lw	s1,20(sp)
1c0092e8:	4942                	lw	s2,16(sp)
1c0092ea:	49b2                	lw	s3,12(sp)
1c0092ec:	4a22                	lw	s4,8(sp)
1c0092ee:	4a92                	lw	s5,4(sp)
1c0092f0:	6105                	addi	sp,sp,32
1c0092f2:	8082                	ret
1c0092f4:	509c                	lw	a5,32(s1)
1c0092f6:	1c001737          	lui	a4,0x1c001
1c0092fa:	1c472503          	lw	a0,452(a4) # 1c0011c4 <__rt_alloc_l1>
1c0092fe:	078a                	slli	a5,a5,0x2
1c009300:	953e                	add	a0,a0,a5
1c009302:	8d9ff0ef          	jal	ra,1c008bda <rt_user_free>
1c009306:	509c                	lw	a5,32(s1)
1c009308:	1c001737          	lui	a4,0x1c001
1c00930c:	1c472503          	lw	a0,452(a4) # 1c0011c4 <__rt_alloc_l1>
1c009310:	078a                	slli	a5,a5,0x2
1c009312:	0124a623          	sw	s2,12(s1)
1c009316:	85ca                	mv	a1,s2
1c009318:	953e                	add	a0,a0,a5
1c00931a:	891ff0ef          	jal	ra,1c008baa <rt_user_alloc>
1c00931e:	c488                	sw	a0,8(s1)
1c009320:	fd25                	bnez	a0,1c009298 <pi_cluster_send_task_to_cl_async+0x5e>
1c009322:	300a1073          	csrw	mstatus,s4
1c009326:	557d                	li	a0,-1
1c009328:	bf6d                	j	1c0092e2 <pi_cluster_send_task_to_cl_async+0xa8>
1c00932a:	0089a223          	sw	s0,4(s3)
1c00932e:	b769                	j	1c0092b8 <pi_cluster_send_task_to_cl_async+0x7e>

1c009330 <rt_perf_init>:
1c009330:	00450793          	addi	a5,a0,4
1c009334:	04850513          	addi	a0,a0,72
1c009338:	0007a023          	sw	zero,0(a5)
1c00933c:	0791                	addi	a5,a5,4
1c00933e:	fea79de3          	bne	a5,a0,1c009338 <rt_perf_init+0x8>
1c009342:	8082                	ret

1c009344 <rt_perf_conf>:
1c009344:	c10c                	sw	a1,0(a0)
1c009346:	7a059073          	csrw	pcer,a1
1c00934a:	8082                	ret

1c00934c <cluster_start>:
1c00934c:	002047b7          	lui	a5,0x204
1c009350:	00070737          	lui	a4,0x70
1c009354:	c798                	sw	a4,8(a5)
1c009356:	0ff00713          	li	a4,255
1c00935a:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f5898>
1c00935e:	20e7a023          	sw	a4,512(a5)
1c009362:	20e7a623          	sw	a4,524(a5)
1c009366:	8082                	ret

1c009368 <__rt_init>:
1c009368:	1101                	addi	sp,sp,-32
1c00936a:	ce06                	sw	ra,28(sp)
1c00936c:	cc22                	sw	s0,24(sp)
1c00936e:	23d5                	jal	1c009952 <__rt_bridge_set_available>
1c009370:	1c0017b7          	lui	a5,0x1c001
1c009374:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c009378:	478d                	li	a5,3
1c00937a:	02f71263          	bne	a4,a5,1c00939e <__rt_init+0x36>
1c00937e:	7d005073          	csrwi	0x7d0,0
1c009382:	1c0007b7          	lui	a5,0x1c000
1c009386:	6d078793          	addi	a5,a5,1744 # 1c0006d0 <stack_start>
1c00938a:	7d179073          	csrw	0x7d1,a5
1c00938e:	1c0017b7          	lui	a5,0x1c001
1c009392:	ed078793          	addi	a5,a5,-304 # 1c000ed0 <stack>
1c009396:	7d279073          	csrw	0x7d2,a5
1c00939a:	7d00d073          	csrwi	0x7d0,1
1c00939e:	2c29                	jal	1c0095b8 <__rt_irq_init>
1c0093a0:	1a1067b7          	lui	a5,0x1a106
1c0093a4:	577d                	li	a4,-1
1c0093a6:	c3d8                	sw	a4,4(a5)
1c0093a8:	1c0085b7          	lui	a1,0x1c008
1c0093ac:	c798                	sw	a4,8(a5)
1c0093ae:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c0093b2:	4569                	li	a0,26
1c0093b4:	228d                	jal	1c009516 <rt_irq_set_handler>
1c0093b6:	f14027f3          	csrr	a5,mhartid
1c0093ba:	8795                	srai	a5,a5,0x5
1c0093bc:	03f7f793          	andi	a5,a5,63
1c0093c0:	477d                	li	a4,31
1c0093c2:	0ae79e63          	bne	a5,a4,1c00947e <__rt_init+0x116>
1c0093c6:	1a10a7b7          	lui	a5,0x1a10a
1c0093ca:	04000737          	lui	a4,0x4000
1c0093ce:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c0093d2:	46d000ef          	jal	ra,1c00a03e <__rt_pmu_init>
1c0093d6:	373000ef          	jal	ra,1c009f48 <__rt_freq_init>
1c0093da:	f14027f3          	csrr	a5,mhartid
1c0093de:	8795                	srai	a5,a5,0x5
1c0093e0:	03f7f793          	andi	a5,a5,63
1c0093e4:	477d                	li	a4,31
1c0093e6:	00e78763          	beq	a5,a4,1c0093f4 <__rt_init+0x8c>
1c0093ea:	002017b7          	lui	a5,0x201
1c0093ee:	577d                	li	a4,-1
1c0093f0:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f2c14>
1c0093f4:	1c000437          	lui	s0,0x1c000
1c0093f8:	2605                	jal	1c009718 <__rt_utils_init>
1c0093fa:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c0093fe:	8ddff0ef          	jal	ra,1c008cda <__rt_allocs_init>
1c009402:	25cd                	jal	1c009ae4 <__rt_thread_sched_init>
1c009404:	0ed000ef          	jal	ra,1c009cf0 <__rt_event_sched_init>
1c009408:	473000ef          	jal	ra,1c00a07a <__rt_padframe_init>
1c00940c:	401c                	lw	a5,0(s0)
1c00940e:	efb5                	bnez	a5,1c00948a <__rt_init+0x122>
1c009410:	30045073          	csrwi	mstatus,8
1c009414:	4501                	li	a0,0
1c009416:	2cc1                	jal	1c0096e6 <__rt_cbsys_exec>
1c009418:	e521                	bnez	a0,1c009460 <__rt_init+0xf8>
1c00941a:	f14027f3          	csrr	a5,mhartid
1c00941e:	8795                	srai	a5,a5,0x5
1c009420:	03f7f793          	andi	a5,a5,63
1c009424:	477d                	li	a4,31
1c009426:	0ae78763          	beq	a5,a4,1c0094d4 <__rt_init+0x16c>
1c00942a:	4681                	li	a3,0
1c00942c:	4601                	li	a2,0
1c00942e:	4581                	li	a1,0
1c009430:	4505                	li	a0,1
1c009432:	cfb9                	beqz	a5,1c009490 <__rt_init+0x128>
1c009434:	3b4d                	jal	1c0091e6 <rt_cluster_mount>
1c009436:	6591                	lui	a1,0x4
1c009438:	450d                	li	a0,3
1c00943a:	feaff0ef          	jal	ra,1c008c24 <rt_alloc>
1c00943e:	872a                	mv	a4,a0
1c009440:	c105                	beqz	a0,1c009460 <__rt_init+0xf8>
1c009442:	6805                	lui	a6,0x1
1c009444:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009448:	1c009637          	lui	a2,0x1c009
1c00944c:	c002                	sw	zero,0(sp)
1c00944e:	48a1                	li	a7,8
1c009450:	87c2                	mv	a5,a6
1c009452:	4681                	li	a3,0
1c009454:	34c60613          	addi	a2,a2,844 # 1c00934c <cluster_start>
1c009458:	4581                	li	a1,0
1c00945a:	4501                	li	a0,0
1c00945c:	39c5                	jal	1c00914c <rt_cluster_call>
1c00945e:	c93d                	beqz	a0,1c0094d4 <__rt_init+0x16c>
1c009460:	f1402673          	csrr	a2,mhartid
1c009464:	1c000537          	lui	a0,0x1c000
1c009468:	40565593          	srai	a1,a2,0x5
1c00946c:	03f5f593          	andi	a1,a1,63
1c009470:	8a7d                	andi	a2,a2,31
1c009472:	5bc50513          	addi	a0,a0,1468 # 1c0005bc <__DTOR_END__+0x2d0>
1c009476:	554010ef          	jal	ra,1c00a9ca <printf>
1c00947a:	4dc010ef          	jal	ra,1c00a956 <abort>
1c00947e:	002047b7          	lui	a5,0x204
1c009482:	04000737          	lui	a4,0x4000
1c009486:	cbd8                	sw	a4,20(a5)
1c009488:	b7a9                	j	1c0093d2 <__rt_init+0x6a>
1c00948a:	9782                	jalr	a5
1c00948c:	0411                	addi	s0,s0,4
1c00948e:	bfbd                	j	1c00940c <__rt_init+0xa4>
1c009490:	3b99                	jal	1c0091e6 <rt_cluster_mount>
1c009492:	6591                	lui	a1,0x4
1c009494:	80058593          	addi	a1,a1,-2048 # 3800 <_l1_preload_size+0x1ff0>
1c009498:	450d                	li	a0,3
1c00949a:	f8aff0ef          	jal	ra,1c008c24 <rt_alloc>
1c00949e:	d169                	beqz	a0,1c009460 <__rt_init+0xf8>
1c0094a0:	00204737          	lui	a4,0x204
1c0094a4:	0ff00793          	li	a5,255
1c0094a8:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f5898>
1c0094ac:	1c0107b7          	lui	a5,0x1c010
1c0094b0:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c0094b4:	0017e793          	ori	a5,a5,1
1c0094b8:	08f72023          	sw	a5,128(a4)
1c0094bc:	6785                	lui	a5,0x1
1c0094be:	4462                	lw	s0,24(sp)
1c0094c0:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0094c4:	08f72023          	sw	a5,128(a4)
1c0094c8:	40f2                	lw	ra,28(sp)
1c0094ca:	08a72023          	sw	a0,128(a4)
1c0094ce:	4501                	li	a0,0
1c0094d0:	6105                	addi	sp,sp,32
1c0094d2:	bdad                	j	1c00934c <cluster_start>
1c0094d4:	40f2                	lw	ra,28(sp)
1c0094d6:	4462                	lw	s0,24(sp)
1c0094d8:	6105                	addi	sp,sp,32
1c0094da:	8082                	ret

1c0094dc <__rt_deinit>:
1c0094dc:	1c0017b7          	lui	a5,0x1c001
1c0094e0:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c0094e4:	1141                	addi	sp,sp,-16
1c0094e6:	c606                	sw	ra,12(sp)
1c0094e8:	c422                	sw	s0,8(sp)
1c0094ea:	478d                	li	a5,3
1c0094ec:	00f71463          	bne	a4,a5,1c0094f4 <__rt_deinit+0x18>
1c0094f0:	7d005073          	csrwi	0x7d0,0
1c0094f4:	4505                	li	a0,1
1c0094f6:	1c000437          	lui	s0,0x1c000
1c0094fa:	22f5                	jal	1c0096e6 <__rt_cbsys_exec>
1c0094fc:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c009500:	401c                	lw	a5,0(s0)
1c009502:	e789                	bnez	a5,1c00950c <__rt_deinit+0x30>
1c009504:	40b2                	lw	ra,12(sp)
1c009506:	4422                	lw	s0,8(sp)
1c009508:	0141                	addi	sp,sp,16
1c00950a:	8082                	ret
1c00950c:	9782                	jalr	a5
1c00950e:	0411                	addi	s0,s0,4
1c009510:	bfc5                	j	1c009500 <__rt_deinit+0x24>

1c009512 <pi_open_from_conf>:
1c009512:	c14c                	sw	a1,4(a0)
1c009514:	8082                	ret

1c009516 <rt_irq_set_handler>:
1c009516:	f14027f3          	csrr	a5,mhartid
1c00951a:	8795                	srai	a5,a5,0x5
1c00951c:	03f7f793          	andi	a5,a5,63
1c009520:	477d                	li	a4,31
1c009522:	04e79063          	bne	a5,a4,1c009562 <rt_irq_set_handler+0x4c>
1c009526:	1a1047b7          	lui	a5,0x1a104
1c00952a:	43dc                	lw	a5,4(a5)
1c00952c:	050a                	slli	a0,a0,0x2
1c00952e:	8d89                	sub	a1,a1,a0
1c009530:	8d9d                	sub	a1,a1,a5
1c009532:	000ff737          	lui	a4,0xff
1c009536:	00f506b3          	add	a3,a0,a5
1c00953a:	8f6d                	and	a4,a4,a1
1c00953c:	0145d793          	srli	a5,a1,0x14
1c009540:	06f76713          	ori	a4,a4,111
1c009544:	07fe                	slli	a5,a5,0x1f
1c009546:	8fd9                	or	a5,a5,a4
1c009548:	7fe00637          	lui	a2,0x7fe00
1c00954c:	01459713          	slli	a4,a1,0x14
1c009550:	8f71                	and	a4,a4,a2
1c009552:	8fd9                	or	a5,a5,a4
1c009554:	05a6                	slli	a1,a1,0x9
1c009556:	00100737          	lui	a4,0x100
1c00955a:	8df9                	and	a1,a1,a4
1c00955c:	8ddd                	or	a1,a1,a5
1c00955e:	c28c                	sw	a1,0(a3)
1c009560:	8082                	ret
1c009562:	002007b7          	lui	a5,0x200
1c009566:	43bc                	lw	a5,64(a5)
1c009568:	b7d1                	j	1c00952c <rt_irq_set_handler+0x16>

1c00956a <illegal_insn_handler_c>:
1c00956a:	8082                	ret

1c00956c <__rt_handle_illegal_instr>:
1c00956c:	1c0017b7          	lui	a5,0x1c001
1c009570:	ed47a703          	lw	a4,-300(a5) # 1c000ed4 <__rt_debug_config>
1c009574:	1141                	addi	sp,sp,-16
1c009576:	c422                	sw	s0,8(sp)
1c009578:	c606                	sw	ra,12(sp)
1c00957a:	8b05                	andi	a4,a4,1
1c00957c:	843e                	mv	s0,a5
1c00957e:	c30d                	beqz	a4,1c0095a0 <__rt_handle_illegal_instr+0x34>
1c009580:	341026f3          	csrr	a3,mepc
1c009584:	f1402673          	csrr	a2,mhartid
1c009588:	1c000537          	lui	a0,0x1c000
1c00958c:	4298                	lw	a4,0(a3)
1c00958e:	40565593          	srai	a1,a2,0x5
1c009592:	03f5f593          	andi	a1,a1,63
1c009596:	8a7d                	andi	a2,a2,31
1c009598:	61450513          	addi	a0,a0,1556 # 1c000614 <__DTOR_END__+0x328>
1c00959c:	42e010ef          	jal	ra,1c00a9ca <printf>
1c0095a0:	ed442783          	lw	a5,-300(s0)
1c0095a4:	8385                	srli	a5,a5,0x1
1c0095a6:	8b85                	andi	a5,a5,1
1c0095a8:	c399                	beqz	a5,1c0095ae <__rt_handle_illegal_instr+0x42>
1c0095aa:	3ac010ef          	jal	ra,1c00a956 <abort>
1c0095ae:	4422                	lw	s0,8(sp)
1c0095b0:	40b2                	lw	ra,12(sp)
1c0095b2:	0141                	addi	sp,sp,16
1c0095b4:	fb7ff06f          	j	1c00956a <illegal_insn_handler_c>

1c0095b8 <__rt_irq_init>:
1c0095b8:	f14027f3          	csrr	a5,mhartid
1c0095bc:	8795                	srai	a5,a5,0x5
1c0095be:	03f7f793          	andi	a5,a5,63
1c0095c2:	477d                	li	a4,31
1c0095c4:	02e79763          	bne	a5,a4,1c0095f2 <__rt_irq_init+0x3a>
1c0095c8:	1a10a7b7          	lui	a5,0x1a10a
1c0095cc:	577d                	li	a4,-1
1c0095ce:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa107ff4>
1c0095d2:	f14027f3          	csrr	a5,mhartid
1c0095d6:	8795                	srai	a5,a5,0x5
1c0095d8:	1c008737          	lui	a4,0x1c008
1c0095dc:	03f7f793          	andi	a5,a5,63
1c0095e0:	46fd                	li	a3,31
1c0095e2:	00070713          	mv	a4,a4
1c0095e6:	00d79b63          	bne	a5,a3,1c0095fc <__rt_irq_init+0x44>
1c0095ea:	1a1047b7          	lui	a5,0x1a104
1c0095ee:	c3d8                	sw	a4,4(a5)
1c0095f0:	8082                	ret
1c0095f2:	002047b7          	lui	a5,0x204
1c0095f6:	577d                	li	a4,-1
1c0095f8:	cb98                	sw	a4,16(a5)
1c0095fa:	bfe1                	j	1c0095d2 <__rt_irq_init+0x1a>
1c0095fc:	002007b7          	lui	a5,0x200
1c009600:	c3b8                	sw	a4,64(a5)
1c009602:	8082                	ret

1c009604 <__rt_fc_cluster_lock_req>:
1c009604:	1141                	addi	sp,sp,-16
1c009606:	c606                	sw	ra,12(sp)
1c009608:	c422                	sw	s0,8(sp)
1c00960a:	c226                	sw	s1,4(sp)
1c00960c:	300474f3          	csrrci	s1,mstatus,8
1c009610:	09654703          	lbu	a4,150(a0)
1c009614:	411c                	lw	a5,0(a0)
1c009616:	c729                	beqz	a4,1c009660 <__rt_fc_cluster_lock_req+0x5c>
1c009618:	4398                	lw	a4,0(a5)
1c00961a:	c30d                	beqz	a4,1c00963c <__rt_fc_cluster_lock_req+0x38>
1c00961c:	43d8                	lw	a4,4(a5)
1c00961e:	cf09                	beqz	a4,1c009638 <__rt_fc_cluster_lock_req+0x34>
1c009620:	4798                	lw	a4,8(a5)
1c009622:	c348                	sw	a0,4(a4)
1c009624:	c788                	sw	a0,8(a5)
1c009626:	00052223          	sw	zero,4(a0)
1c00962a:	30049073          	csrw	mstatus,s1
1c00962e:	40b2                	lw	ra,12(sp)
1c009630:	4422                	lw	s0,8(sp)
1c009632:	4492                	lw	s1,4(sp)
1c009634:	0141                	addi	sp,sp,16
1c009636:	8082                	ret
1c009638:	c3c8                	sw	a0,4(a5)
1c00963a:	b7ed                	j	1c009624 <__rt_fc_cluster_lock_req+0x20>
1c00963c:	4705                	li	a4,1
1c00963e:	08e50a23          	sb	a4,148(a0)
1c009642:	4705                	li	a4,1
1c009644:	c398                	sw	a4,0(a5)
1c009646:	09554783          	lbu	a5,149(a0)
1c00964a:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f1854>
1c00964e:	00201737          	lui	a4,0x201
1c009652:	07da                	slli	a5,a5,0x16
1c009654:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c009658:	97ba                	add	a5,a5,a4
1c00965a:	0007a023          	sw	zero,0(a5)
1c00965e:	b7f1                	j	1c00962a <__rt_fc_cluster_lock_req+0x26>
1c009660:	842a                	mv	s0,a0
1c009662:	47c8                	lw	a0,12(a5)
1c009664:	cd01                	beqz	a0,1c00967c <__rt_fc_cluster_lock_req+0x78>
1c009666:	0007a023          	sw	zero,0(a5)
1c00966a:	0007a623          	sw	zero,12(a5)
1c00966e:	2185                	jal	1c009ace <__rt_thread_wakeup>
1c009670:	4785                	li	a5,1
1c009672:	08f40a23          	sb	a5,148(s0)
1c009676:	09544783          	lbu	a5,149(s0)
1c00967a:	bfc1                	j	1c00964a <__rt_fc_cluster_lock_req+0x46>
1c00967c:	43d8                	lw	a4,4(a5)
1c00967e:	e701                	bnez	a4,1c009686 <__rt_fc_cluster_lock_req+0x82>
1c009680:	0007a023          	sw	zero,0(a5)
1c009684:	b7f5                	j	1c009670 <__rt_fc_cluster_lock_req+0x6c>
1c009686:	4354                	lw	a3,4(a4)
1c009688:	c3d4                	sw	a3,4(a5)
1c00968a:	4785                	li	a5,1
1c00968c:	08f70a23          	sb	a5,148(a4)
1c009690:	09574783          	lbu	a5,149(a4)
1c009694:	00201737          	lui	a4,0x201
1c009698:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c00969c:	04078793          	addi	a5,a5,64
1c0096a0:	07da                	slli	a5,a5,0x16
1c0096a2:	97ba                	add	a5,a5,a4
1c0096a4:	bff1                	j	1c009680 <__rt_fc_cluster_lock_req+0x7c>

1c0096a6 <__rt_cbsys_add>:
1c0096a6:	1101                	addi	sp,sp,-32
1c0096a8:	cc22                	sw	s0,24(sp)
1c0096aa:	ca26                	sw	s1,20(sp)
1c0096ac:	842a                	mv	s0,a0
1c0096ae:	84ae                	mv	s1,a1
1c0096b0:	4501                	li	a0,0
1c0096b2:	45b1                	li	a1,12
1c0096b4:	c632                	sw	a2,12(sp)
1c0096b6:	ce06                	sw	ra,28(sp)
1c0096b8:	d6cff0ef          	jal	ra,1c008c24 <rt_alloc>
1c0096bc:	4632                	lw	a2,12(sp)
1c0096be:	c115                	beqz	a0,1c0096e2 <__rt_cbsys_add+0x3c>
1c0096c0:	1c0017b7          	lui	a5,0x1c001
1c0096c4:	040a                	slli	s0,s0,0x2
1c0096c6:	ed878793          	addi	a5,a5,-296 # 1c000ed8 <cbsys_first>
1c0096ca:	97a2                	add	a5,a5,s0
1c0096cc:	4398                	lw	a4,0(a5)
1c0096ce:	c104                	sw	s1,0(a0)
1c0096d0:	c150                	sw	a2,4(a0)
1c0096d2:	c518                	sw	a4,8(a0)
1c0096d4:	c388                	sw	a0,0(a5)
1c0096d6:	4501                	li	a0,0
1c0096d8:	40f2                	lw	ra,28(sp)
1c0096da:	4462                	lw	s0,24(sp)
1c0096dc:	44d2                	lw	s1,20(sp)
1c0096de:	6105                	addi	sp,sp,32
1c0096e0:	8082                	ret
1c0096e2:	557d                	li	a0,-1
1c0096e4:	bfd5                	j	1c0096d8 <__rt_cbsys_add+0x32>

1c0096e6 <__rt_cbsys_exec>:
1c0096e6:	00251793          	slli	a5,a0,0x2
1c0096ea:	1c001537          	lui	a0,0x1c001
1c0096ee:	ed850513          	addi	a0,a0,-296 # 1c000ed8 <cbsys_first>
1c0096f2:	1141                	addi	sp,sp,-16
1c0096f4:	953e                	add	a0,a0,a5
1c0096f6:	c422                	sw	s0,8(sp)
1c0096f8:	4100                	lw	s0,0(a0)
1c0096fa:	c606                	sw	ra,12(sp)
1c0096fc:	e411                	bnez	s0,1c009708 <__rt_cbsys_exec+0x22>
1c0096fe:	4501                	li	a0,0
1c009700:	40b2                	lw	ra,12(sp)
1c009702:	4422                	lw	s0,8(sp)
1c009704:	0141                	addi	sp,sp,16
1c009706:	8082                	ret
1c009708:	401c                	lw	a5,0(s0)
1c00970a:	4048                	lw	a0,4(s0)
1c00970c:	9782                	jalr	a5
1c00970e:	e119                	bnez	a0,1c009714 <__rt_cbsys_exec+0x2e>
1c009710:	4400                	lw	s0,8(s0)
1c009712:	b7ed                	j	1c0096fc <__rt_cbsys_exec+0x16>
1c009714:	557d                	li	a0,-1
1c009716:	b7ed                	j	1c009700 <__rt_cbsys_exec+0x1a>

1c009718 <__rt_utils_init>:
1c009718:	1c0017b7          	lui	a5,0x1c001
1c00971c:	ed878793          	addi	a5,a5,-296 # 1c000ed8 <cbsys_first>
1c009720:	0007a023          	sw	zero,0(a5)
1c009724:	0007a223          	sw	zero,4(a5)
1c009728:	0007a423          	sw	zero,8(a5)
1c00972c:	0007a623          	sw	zero,12(a5)
1c009730:	0007a823          	sw	zero,16(a5)
1c009734:	0007aa23          	sw	zero,20(a5)
1c009738:	8082                	ret

1c00973a <__rt_fc_lock>:
1c00973a:	1141                	addi	sp,sp,-16
1c00973c:	c422                	sw	s0,8(sp)
1c00973e:	842a                	mv	s0,a0
1c009740:	c606                	sw	ra,12(sp)
1c009742:	c226                	sw	s1,4(sp)
1c009744:	c04a                	sw	s2,0(sp)
1c009746:	300474f3          	csrrci	s1,mstatus,8
1c00974a:	401c                	lw	a5,0(s0)
1c00974c:	eb99                	bnez	a5,1c009762 <__rt_fc_lock+0x28>
1c00974e:	4785                	li	a5,1
1c009750:	c01c                	sw	a5,0(s0)
1c009752:	30049073          	csrw	mstatus,s1
1c009756:	40b2                	lw	ra,12(sp)
1c009758:	4422                	lw	s0,8(sp)
1c00975a:	4492                	lw	s1,4(sp)
1c00975c:	4902                	lw	s2,0(sp)
1c00975e:	0141                	addi	sp,sp,16
1c009760:	8082                	ret
1c009762:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009766:	4585                	li	a1,1
1c009768:	e3ff7517          	auipc	a0,0xe3ff7
1c00976c:	8c050513          	addi	a0,a0,-1856 # 28 <__rt_sched>
1c009770:	c45c                	sw	a5,12(s0)
1c009772:	29f1                	jal	1c009c4e <__rt_event_execute>
1c009774:	bfd9                	j	1c00974a <__rt_fc_lock+0x10>

1c009776 <__rt_fc_unlock>:
1c009776:	300476f3          	csrrci	a3,mstatus,8
1c00977a:	415c                	lw	a5,4(a0)
1c00977c:	e791                	bnez	a5,1c009788 <__rt_fc_unlock+0x12>
1c00977e:	00052023          	sw	zero,0(a0)
1c009782:	30069073          	csrw	mstatus,a3
1c009786:	8082                	ret
1c009788:	43d8                	lw	a4,4(a5)
1c00978a:	c158                	sw	a4,4(a0)
1c00978c:	4705                	li	a4,1
1c00978e:	08e78a23          	sb	a4,148(a5)
1c009792:	0957c783          	lbu	a5,149(a5)
1c009796:	00201737          	lui	a4,0x201
1c00979a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c00979e:	04078793          	addi	a5,a5,64
1c0097a2:	07da                	slli	a5,a5,0x16
1c0097a4:	97ba                	add	a5,a5,a4
1c0097a6:	0007a023          	sw	zero,0(a5)
1c0097aa:	bfe1                	j	1c009782 <__rt_fc_unlock+0xc>

1c0097ac <__rt_fc_cluster_lock>:
1c0097ac:	f14027f3          	csrr	a5,mhartid
1c0097b0:	8795                	srai	a5,a5,0x5
1c0097b2:	03f7f793          	andi	a5,a5,63
1c0097b6:	08f58aa3          	sb	a5,149(a1)
1c0097ba:	4785                	li	a5,1
1c0097bc:	08f58b23          	sb	a5,150(a1)
1c0097c0:	1c0097b7          	lui	a5,0x1c009
1c0097c4:	60478793          	addi	a5,a5,1540 # 1c009604 <__rt_fc_cluster_lock_req>
1c0097c8:	c188                	sw	a0,0(a1)
1c0097ca:	08058a23          	sb	zero,148(a1)
1c0097ce:	0205a423          	sw	zero,40(a1)
1c0097d2:	0205a623          	sw	zero,44(a1)
1c0097d6:	c59c                	sw	a5,8(a1)
1c0097d8:	c5cc                	sw	a1,12(a1)
1c0097da:	05a1                	addi	a1,a1,8
1c0097dc:	0015e513          	ori	a0,a1,1
1c0097e0:	8abff06f          	j	1c00908a <__rt_cluster_push_fc_event>

1c0097e4 <__rt_fc_cluster_unlock>:
1c0097e4:	f14027f3          	csrr	a5,mhartid
1c0097e8:	8795                	srai	a5,a5,0x5
1c0097ea:	03f7f793          	andi	a5,a5,63
1c0097ee:	08f58aa3          	sb	a5,149(a1)
1c0097f2:	1c0097b7          	lui	a5,0x1c009
1c0097f6:	60478793          	addi	a5,a5,1540 # 1c009604 <__rt_fc_cluster_lock_req>
1c0097fa:	c188                	sw	a0,0(a1)
1c0097fc:	08058a23          	sb	zero,148(a1)
1c009800:	08058b23          	sb	zero,150(a1)
1c009804:	0205a423          	sw	zero,40(a1)
1c009808:	0205a623          	sw	zero,44(a1)
1c00980c:	c59c                	sw	a5,8(a1)
1c00980e:	c5cc                	sw	a1,12(a1)
1c009810:	05a1                	addi	a1,a1,8
1c009812:	0015e513          	ori	a0,a1,1
1c009816:	875ff06f          	j	1c00908a <__rt_cluster_push_fc_event>

1c00981a <__rt_event_enqueue>:
1c00981a:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c00981e:	00052c23          	sw	zero,24(a0)
1c009822:	c799                	beqz	a5,1c009830 <__rt_event_enqueue+0x16>
1c009824:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c009828:	cf88                	sw	a0,24(a5)
1c00982a:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c00982e:	8082                	ret
1c009830:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c009834:	bfdd                	j	1c00982a <__rt_event_enqueue+0x10>

1c009836 <__rt_bridge_check_bridge_req.part.5>:
1c009836:	1c001737          	lui	a4,0x1c001
1c00983a:	fec70793          	addi	a5,a4,-20 # 1c000fec <__hal_debug_struct>
1c00983e:	0a47a783          	lw	a5,164(a5)
1c009842:	fec70713          	addi	a4,a4,-20
1c009846:	c789                	beqz	a5,1c009850 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c009848:	4f94                	lw	a3,24(a5)
1c00984a:	e681                	bnez	a3,1c009852 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c00984c:	0af72623          	sw	a5,172(a4)
1c009850:	8082                	ret
1c009852:	479c                	lw	a5,8(a5)
1c009854:	bfcd                	j	1c009846 <__rt_bridge_check_bridge_req.part.5+0x10>

1c009856 <__rt_bridge_wait>:
1c009856:	f14027f3          	csrr	a5,mhartid
1c00985a:	8795                	srai	a5,a5,0x5
1c00985c:	03f7f793          	andi	a5,a5,63
1c009860:	477d                	li	a4,31
1c009862:	02e79a63          	bne	a5,a4,1c009896 <__rt_bridge_wait+0x40>
1c009866:	1a10a7b7          	lui	a5,0x1a10a
1c00986a:	6711                	lui	a4,0x4
1c00986c:	300476f3          	csrrci	a3,mstatus,8
1c009870:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa107ff8>
1c009874:	01161593          	slli	a1,a2,0x11
1c009878:	0005cb63          	bltz	a1,1c00988e <__rt_bridge_wait+0x38>
1c00987c:	80e7a223          	sw	a4,-2044(a5)
1c009880:	10500073          	wfi
1c009884:	80e7a423          	sw	a4,-2040(a5)
1c009888:	30069073          	csrw	mstatus,a3
1c00988c:	b7c5                	j	1c00986c <__rt_bridge_wait+0x16>
1c00988e:	80e7aa23          	sw	a4,-2028(a5)
1c009892:	30069073          	csrw	mstatus,a3
1c009896:	8082                	ret

1c009898 <__rt_bridge_handle_notif>:
1c009898:	1141                	addi	sp,sp,-16
1c00989a:	c422                	sw	s0,8(sp)
1c00989c:	1c001437          	lui	s0,0x1c001
1c0098a0:	fec40793          	addi	a5,s0,-20 # 1c000fec <__hal_debug_struct>
1c0098a4:	0a47a783          	lw	a5,164(a5)
1c0098a8:	c606                	sw	ra,12(sp)
1c0098aa:	c226                	sw	s1,4(sp)
1c0098ac:	c04a                	sw	s2,0(sp)
1c0098ae:	fec40413          	addi	s0,s0,-20
1c0098b2:	c399                	beqz	a5,1c0098b8 <__rt_bridge_handle_notif+0x20>
1c0098b4:	4bd8                	lw	a4,20(a5)
1c0098b6:	e30d                	bnez	a4,1c0098d8 <__rt_bridge_handle_notif+0x40>
1c0098b8:	0b442783          	lw	a5,180(s0)
1c0098bc:	c789                	beqz	a5,1c0098c6 <__rt_bridge_handle_notif+0x2e>
1c0098be:	43a8                	lw	a0,64(a5)
1c0098c0:	0a042a23          	sw	zero,180(s0)
1c0098c4:	3f99                	jal	1c00981a <__rt_event_enqueue>
1c0098c6:	0ac42783          	lw	a5,172(s0)
1c0098ca:	eb95                	bnez	a5,1c0098fe <__rt_bridge_handle_notif+0x66>
1c0098cc:	4422                	lw	s0,8(sp)
1c0098ce:	40b2                	lw	ra,12(sp)
1c0098d0:	4492                	lw	s1,4(sp)
1c0098d2:	4902                	lw	s2,0(sp)
1c0098d4:	0141                	addi	sp,sp,16
1c0098d6:	b785                	j	1c009836 <__rt_bridge_check_bridge_req.part.5>
1c0098d8:	4784                	lw	s1,8(a5)
1c0098da:	4fd8                	lw	a4,28(a5)
1c0098dc:	0a942223          	sw	s1,164(s0)
1c0098e0:	cb01                	beqz	a4,1c0098f0 <__rt_bridge_handle_notif+0x58>
1c0098e2:	0b042703          	lw	a4,176(s0)
1c0098e6:	c798                	sw	a4,8(a5)
1c0098e8:	0af42823          	sw	a5,176(s0)
1c0098ec:	87a6                	mv	a5,s1
1c0098ee:	b7d1                	j	1c0098b2 <__rt_bridge_handle_notif+0x1a>
1c0098f0:	43a8                	lw	a0,64(a5)
1c0098f2:	30047973          	csrrci	s2,mstatus,8
1c0098f6:	3715                	jal	1c00981a <__rt_event_enqueue>
1c0098f8:	30091073          	csrw	mstatus,s2
1c0098fc:	bfc5                	j	1c0098ec <__rt_bridge_handle_notif+0x54>
1c0098fe:	40b2                	lw	ra,12(sp)
1c009900:	4422                	lw	s0,8(sp)
1c009902:	4492                	lw	s1,4(sp)
1c009904:	4902                	lw	s2,0(sp)
1c009906:	0141                	addi	sp,sp,16
1c009908:	8082                	ret

1c00990a <__rt_bridge_check_connection>:
1c00990a:	1c001737          	lui	a4,0x1c001
1c00990e:	fec70713          	addi	a4,a4,-20 # 1c000fec <__hal_debug_struct>
1c009912:	471c                	lw	a5,8(a4)
1c009914:	ef95                	bnez	a5,1c009950 <__rt_bridge_check_connection+0x46>
1c009916:	1a1047b7          	lui	a5,0x1a104
1c00991a:	5bfc                	lw	a5,116(a5)
1c00991c:	469d                	li	a3,7
1c00991e:	83a5                	srli	a5,a5,0x9
1c009920:	8b9d                	andi	a5,a5,7
1c009922:	02d79763          	bne	a5,a3,1c009950 <__rt_bridge_check_connection+0x46>
1c009926:	1141                	addi	sp,sp,-16
1c009928:	c422                	sw	s0,8(sp)
1c00992a:	c226                	sw	s1,4(sp)
1c00992c:	c606                	sw	ra,12(sp)
1c00992e:	4785                	li	a5,1
1c009930:	c71c                	sw	a5,8(a4)
1c009932:	1a1044b7          	lui	s1,0x1a104
1c009936:	441d                	li	s0,7
1c009938:	58fc                	lw	a5,116(s1)
1c00993a:	83a5                	srli	a5,a5,0x9
1c00993c:	8b9d                	andi	a5,a5,7
1c00993e:	00878763          	beq	a5,s0,1c00994c <__rt_bridge_check_connection+0x42>
1c009942:	40b2                	lw	ra,12(sp)
1c009944:	4422                	lw	s0,8(sp)
1c009946:	4492                	lw	s1,4(sp)
1c009948:	0141                	addi	sp,sp,16
1c00994a:	8082                	ret
1c00994c:	3729                	jal	1c009856 <__rt_bridge_wait>
1c00994e:	b7ed                	j	1c009938 <__rt_bridge_check_connection+0x2e>
1c009950:	8082                	ret

1c009952 <__rt_bridge_set_available>:
1c009952:	1c0017b7          	lui	a5,0x1c001
1c009956:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c00995a:	479c                	lw	a5,8(a5)
1c00995c:	8082                	ret

1c00995e <__rt_bridge_send_notif>:
1c00995e:	1141                	addi	sp,sp,-16
1c009960:	c606                	sw	ra,12(sp)
1c009962:	3765                	jal	1c00990a <__rt_bridge_check_connection>
1c009964:	40b2                	lw	ra,12(sp)
1c009966:	1c0017b7          	lui	a5,0x1c001
1c00996a:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c00996e:	479c                	lw	a5,8(a5)
1c009970:	0141                	addi	sp,sp,16
1c009972:	8082                	ret

1c009974 <__rt_bridge_clear_notif>:
1c009974:	1141                	addi	sp,sp,-16
1c009976:	c606                	sw	ra,12(sp)
1c009978:	3f49                	jal	1c00990a <__rt_bridge_check_connection>
1c00997a:	1c0017b7          	lui	a5,0x1c001
1c00997e:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c009982:	4798                	lw	a4,8(a5)
1c009984:	c311                	beqz	a4,1c009988 <__rt_bridge_clear_notif+0x14>
1c009986:	479c                	lw	a5,8(a5)
1c009988:	40b2                	lw	ra,12(sp)
1c00998a:	0141                	addi	sp,sp,16
1c00998c:	8082                	ret

1c00998e <__rt_bridge_printf_flush>:
1c00998e:	1141                	addi	sp,sp,-16
1c009990:	c422                	sw	s0,8(sp)
1c009992:	c606                	sw	ra,12(sp)
1c009994:	1c001437          	lui	s0,0x1c001
1c009998:	3f8d                	jal	1c00990a <__rt_bridge_check_connection>
1c00999a:	fec40793          	addi	a5,s0,-20 # 1c000fec <__hal_debug_struct>
1c00999e:	479c                	lw	a5,8(a5)
1c0099a0:	c385                	beqz	a5,1c0099c0 <__rt_bridge_printf_flush+0x32>
1c0099a2:	fec40413          	addi	s0,s0,-20
1c0099a6:	485c                	lw	a5,20(s0)
1c0099a8:	e399                	bnez	a5,1c0099ae <__rt_bridge_printf_flush+0x20>
1c0099aa:	4c1c                	lw	a5,24(s0)
1c0099ac:	cb91                	beqz	a5,1c0099c0 <__rt_bridge_printf_flush+0x32>
1c0099ae:	3f45                	jal	1c00995e <__rt_bridge_send_notif>
1c0099b0:	485c                	lw	a5,20(s0)
1c0099b2:	e789                	bnez	a5,1c0099bc <__rt_bridge_printf_flush+0x2e>
1c0099b4:	4422                	lw	s0,8(sp)
1c0099b6:	40b2                	lw	ra,12(sp)
1c0099b8:	0141                	addi	sp,sp,16
1c0099ba:	bf6d                	j	1c009974 <__rt_bridge_clear_notif>
1c0099bc:	3d69                	jal	1c009856 <__rt_bridge_wait>
1c0099be:	bfcd                	j	1c0099b0 <__rt_bridge_printf_flush+0x22>
1c0099c0:	40b2                	lw	ra,12(sp)
1c0099c2:	4422                	lw	s0,8(sp)
1c0099c4:	0141                	addi	sp,sp,16
1c0099c6:	8082                	ret

1c0099c8 <__rt_bridge_req_shutdown>:
1c0099c8:	1141                	addi	sp,sp,-16
1c0099ca:	c606                	sw	ra,12(sp)
1c0099cc:	c422                	sw	s0,8(sp)
1c0099ce:	c226                	sw	s1,4(sp)
1c0099d0:	3f2d                	jal	1c00990a <__rt_bridge_check_connection>
1c0099d2:	1c0017b7          	lui	a5,0x1c001
1c0099d6:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c0099da:	479c                	lw	a5,8(a5)
1c0099dc:	cb95                	beqz	a5,1c009a10 <__rt_bridge_req_shutdown+0x48>
1c0099de:	3f45                	jal	1c00998e <__rt_bridge_printf_flush>
1c0099e0:	1a1044b7          	lui	s1,0x1a104
1c0099e4:	441d                	li	s0,7
1c0099e6:	58fc                	lw	a5,116(s1)
1c0099e8:	83a5                	srli	a5,a5,0x9
1c0099ea:	8b9d                	andi	a5,a5,7
1c0099ec:	02878763          	beq	a5,s0,1c009a1a <__rt_bridge_req_shutdown+0x52>
1c0099f0:	1a1044b7          	lui	s1,0x1a104
1c0099f4:	441d                	li	s0,7
1c0099f6:	58fc                	lw	a5,116(s1)
1c0099f8:	83a5                	srli	a5,a5,0x9
1c0099fa:	8b9d                	andi	a5,a5,7
1c0099fc:	02879163          	bne	a5,s0,1c009a1e <__rt_bridge_req_shutdown+0x56>
1c009a00:	1a1044b7          	lui	s1,0x1a104
1c009a04:	441d                	li	s0,7
1c009a06:	58fc                	lw	a5,116(s1)
1c009a08:	83a5                	srli	a5,a5,0x9
1c009a0a:	8b9d                	andi	a5,a5,7
1c009a0c:	00878b63          	beq	a5,s0,1c009a22 <__rt_bridge_req_shutdown+0x5a>
1c009a10:	40b2                	lw	ra,12(sp)
1c009a12:	4422                	lw	s0,8(sp)
1c009a14:	4492                	lw	s1,4(sp)
1c009a16:	0141                	addi	sp,sp,16
1c009a18:	8082                	ret
1c009a1a:	3d35                	jal	1c009856 <__rt_bridge_wait>
1c009a1c:	b7e9                	j	1c0099e6 <__rt_bridge_req_shutdown+0x1e>
1c009a1e:	3d25                	jal	1c009856 <__rt_bridge_wait>
1c009a20:	bfd9                	j	1c0099f6 <__rt_bridge_req_shutdown+0x2e>
1c009a22:	3d15                	jal	1c009856 <__rt_bridge_wait>
1c009a24:	b7cd                	j	1c009a06 <__rt_bridge_req_shutdown+0x3e>

1c009a26 <__rt_bridge_init>:
1c009a26:	1c0017b7          	lui	a5,0x1c001
1c009a2a:	1a10a737          	lui	a4,0x1a10a
1c009a2e:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c009a32:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa107ffc>
1c009a36:	0ae7ac23          	sw	a4,184(a5)
1c009a3a:	4741                	li	a4,16
1c009a3c:	0a07a223          	sw	zero,164(a5)
1c009a40:	0a07a623          	sw	zero,172(a5)
1c009a44:	0a07aa23          	sw	zero,180(a5)
1c009a48:	0ae7ae23          	sw	a4,188(a5)
1c009a4c:	00400793          	li	a5,4
1c009a50:	0007a823          	sw	zero,16(a5)
1c009a54:	0007a023          	sw	zero,0(a5)
1c009a58:	8082                	ret

1c009a5a <__rt_thread_enqueue_ready>:
1c009a5a:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c009a5e:	02052c23          	sw	zero,56(a0)
1c009a62:	01800793          	li	a5,24
1c009a66:	e711                	bnez	a4,1c009a72 <__rt_thread_enqueue_ready+0x18>
1c009a68:	c388                	sw	a0,0(a5)
1c009a6a:	c3c8                	sw	a0,4(a5)
1c009a6c:	0c052a23          	sw	zero,212(a0)
1c009a70:	8082                	ret
1c009a72:	43d8                	lw	a4,4(a5)
1c009a74:	df08                	sw	a0,56(a4)
1c009a76:	bfd5                	j	1c009a6a <__rt_thread_enqueue_ready+0x10>

1c009a78 <__rt_thread_sleep>:
1c009a78:	01800713          	li	a4,24
1c009a7c:	4708                	lw	a0,8(a4)
1c009a7e:	01800793          	li	a5,24
1c009a82:	438c                	lw	a1,0(a5)
1c009a84:	c999                	beqz	a1,1c009a9a <__rt_thread_sleep+0x22>
1c009a86:	5d98                	lw	a4,56(a1)
1c009a88:	c398                	sw	a4,0(a5)
1c009a8a:	4705                	li	a4,1
1c009a8c:	0ce5aa23          	sw	a4,212(a1)
1c009a90:	00b50c63          	beq	a0,a1,1c009aa8 <__rt_thread_sleep+0x30>
1c009a94:	c78c                	sw	a1,8(a5)
1c009a96:	831fe06f          	j	1c0082c6 <__rt_thread_switch>
1c009a9a:	10500073          	wfi
1c009a9e:	30045073          	csrwi	mstatus,8
1c009aa2:	30047773          	csrrci	a4,mstatus,8
1c009aa6:	bff1                	j	1c009a82 <__rt_thread_sleep+0xa>
1c009aa8:	8082                	ret

1c009aaa <rt_thread_exit>:
1c009aaa:	300477f3          	csrrci	a5,mstatus,8
1c009aae:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009ab2:	4705                	li	a4,1
1c009ab4:	c3e8                	sw	a0,68(a5)
1c009ab6:	5fc8                	lw	a0,60(a5)
1c009ab8:	c3b8                	sw	a4,64(a5)
1c009aba:	c909                	beqz	a0,1c009acc <rt_thread_exit+0x22>
1c009abc:	0d452783          	lw	a5,212(a0)
1c009ac0:	c791                	beqz	a5,1c009acc <rt_thread_exit+0x22>
1c009ac2:	1141                	addi	sp,sp,-16
1c009ac4:	c606                	sw	ra,12(sp)
1c009ac6:	3f51                	jal	1c009a5a <__rt_thread_enqueue_ready>
1c009ac8:	40b2                	lw	ra,12(sp)
1c009aca:	0141                	addi	sp,sp,16
1c009acc:	b775                	j	1c009a78 <__rt_thread_sleep>

1c009ace <__rt_thread_wakeup>:
1c009ace:	5d18                	lw	a4,56(a0)
1c009ad0:	eb09                	bnez	a4,1c009ae2 <__rt_thread_wakeup+0x14>
1c009ad2:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c009ad6:	00a70663          	beq	a4,a0,1c009ae2 <__rt_thread_wakeup+0x14>
1c009ada:	0d452783          	lw	a5,212(a0)
1c009ade:	c391                	beqz	a5,1c009ae2 <__rt_thread_wakeup+0x14>
1c009ae0:	bfad                	j	1c009a5a <__rt_thread_enqueue_ready>
1c009ae2:	8082                	ret

1c009ae4 <__rt_thread_sched_init>:
1c009ae4:	1141                	addi	sp,sp,-16
1c009ae6:	c422                	sw	s0,8(sp)
1c009ae8:	1c0087b7          	lui	a5,0x1c008
1c009aec:	1c001437          	lui	s0,0x1c001
1c009af0:	c226                	sw	s1,4(sp)
1c009af2:	c04a                	sw	s2,0(sp)
1c009af4:	c606                	sw	ra,12(sp)
1c009af6:	ef040413          	addi	s0,s0,-272 # 1c000ef0 <__rt_thread_main>
1c009afa:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009afe:	c01c                	sw	a5,0(s0)
1c009b00:	1c00a7b7          	lui	a5,0x1c00a
1c009b04:	04840913          	addi	s2,s0,72
1c009b08:	aaa78793          	addi	a5,a5,-1366 # 1c009aaa <rt_thread_exit>
1c009b0c:	01800493          	li	s1,24
1c009b10:	c45c                	sw	a5,12(s0)
1c009b12:	854a                	mv	a0,s2
1c009b14:	4785                	li	a5,1
1c009b16:	e3ff6597          	auipc	a1,0xe3ff6
1c009b1a:	51258593          	addi	a1,a1,1298 # 28 <__rt_sched>
1c009b1e:	0cf42a23          	sw	a5,212(s0)
1c009b22:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa1027ec>
1c009b26:	02042a23          	sw	zero,52(s0)
1c009b2a:	00042223          	sw	zero,4(s0)
1c009b2e:	00042423          	sw	zero,8(s0)
1c009b32:	2829                	jal	1c009b4c <__rt_event_init>
1c009b34:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009b38:	c480                	sw	s0,8(s1)
1c009b3a:	40b2                	lw	ra,12(sp)
1c009b3c:	d03c                	sw	a5,96(s0)
1c009b3e:	4422                	lw	s0,8(sp)
1c009b40:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009b44:	4492                	lw	s1,4(sp)
1c009b46:	4902                	lw	s2,0(sp)
1c009b48:	0141                	addi	sp,sp,16
1c009b4a:	8082                	ret

1c009b4c <__rt_event_init>:
1c009b4c:	02052023          	sw	zero,32(a0)
1c009b50:	02052223          	sw	zero,36(a0)
1c009b54:	02052823          	sw	zero,48(a0)
1c009b58:	00052023          	sw	zero,0(a0)
1c009b5c:	8082                	ret

1c009b5e <__rt_wait_event_prepare_blocking>:
1c009b5e:	02400793          	li	a5,36
1c009b62:	4388                	lw	a0,0(a5)
1c009b64:	4d18                	lw	a4,24(a0)
1c009b66:	02052223          	sw	zero,36(a0)
1c009b6a:	c398                	sw	a4,0(a5)
1c009b6c:	4785                	li	a5,1
1c009b6e:	d11c                	sw	a5,32(a0)
1c009b70:	00052023          	sw	zero,0(a0)
1c009b74:	8082                	ret

1c009b76 <rt_event_alloc>:
1c009b76:	1141                	addi	sp,sp,-16
1c009b78:	c422                	sw	s0,8(sp)
1c009b7a:	842e                	mv	s0,a1
1c009b7c:	c606                	sw	ra,12(sp)
1c009b7e:	c226                	sw	s1,4(sp)
1c009b80:	300474f3          	csrrci	s1,mstatus,8
1c009b84:	f14027f3          	csrr	a5,mhartid
1c009b88:	8795                	srai	a5,a5,0x5
1c009b8a:	03f7f793          	andi	a5,a5,63
1c009b8e:	477d                	li	a4,31
1c009b90:	00378513          	addi	a0,a5,3
1c009b94:	00e79363          	bne	a5,a4,1c009b9a <rt_event_alloc+0x24>
1c009b98:	4501                	li	a0,0
1c009b9a:	08c00593          	li	a1,140
1c009b9e:	02b405b3          	mul	a1,s0,a1
1c009ba2:	882ff0ef          	jal	ra,1c008c24 <rt_alloc>
1c009ba6:	87aa                	mv	a5,a0
1c009ba8:	557d                	li	a0,-1
1c009baa:	cf91                	beqz	a5,1c009bc6 <rt_event_alloc+0x50>
1c009bac:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009bb0:	4581                	li	a1,0
1c009bb2:	4601                	li	a2,0
1c009bb4:	02400713          	li	a4,36
1c009bb8:	00864c63          	blt	a2,s0,1c009bd0 <rt_event_alloc+0x5a>
1c009bbc:	c191                	beqz	a1,1c009bc0 <rt_event_alloc+0x4a>
1c009bbe:	c314                	sw	a3,0(a4)
1c009bc0:	30049073          	csrw	mstatus,s1
1c009bc4:	4501                	li	a0,0
1c009bc6:	40b2                	lw	ra,12(sp)
1c009bc8:	4422                	lw	s0,8(sp)
1c009bca:	4492                	lw	s1,4(sp)
1c009bcc:	0141                	addi	sp,sp,16
1c009bce:	8082                	ret
1c009bd0:	cf94                	sw	a3,24(a5)
1c009bd2:	0207a023          	sw	zero,32(a5)
1c009bd6:	0207a223          	sw	zero,36(a5)
1c009bda:	0207a823          	sw	zero,48(a5)
1c009bde:	0007a023          	sw	zero,0(a5)
1c009be2:	86be                	mv	a3,a5
1c009be4:	0605                	addi	a2,a2,1
1c009be6:	4585                	li	a1,1
1c009be8:	08c78793          	addi	a5,a5,140
1c009bec:	b7f1                	j	1c009bb8 <rt_event_alloc+0x42>

1c009bee <rt_event_get>:
1c009bee:	30047773          	csrrci	a4,mstatus,8
1c009bf2:	02400793          	li	a5,36
1c009bf6:	4388                	lw	a0,0(a5)
1c009bf8:	c509                	beqz	a0,1c009c02 <rt_event_get+0x14>
1c009bfa:	4d14                	lw	a3,24(a0)
1c009bfc:	c150                	sw	a2,4(a0)
1c009bfe:	c394                	sw	a3,0(a5)
1c009c00:	c10c                	sw	a1,0(a0)
1c009c02:	30071073          	csrw	mstatus,a4
1c009c06:	8082                	ret

1c009c08 <rt_event_get_blocking>:
1c009c08:	30047773          	csrrci	a4,mstatus,8
1c009c0c:	02400793          	li	a5,36
1c009c10:	4388                	lw	a0,0(a5)
1c009c12:	c909                	beqz	a0,1c009c24 <rt_event_get_blocking+0x1c>
1c009c14:	4d14                	lw	a3,24(a0)
1c009c16:	00052223          	sw	zero,4(a0)
1c009c1a:	c394                	sw	a3,0(a5)
1c009c1c:	4785                	li	a5,1
1c009c1e:	00052023          	sw	zero,0(a0)
1c009c22:	d11c                	sw	a5,32(a0)
1c009c24:	30071073          	csrw	mstatus,a4
1c009c28:	8082                	ret

1c009c2a <rt_event_push>:
1c009c2a:	30047773          	csrrci	a4,mstatus,8
1c009c2e:	02400693          	li	a3,36
1c009c32:	42d4                	lw	a3,4(a3)
1c009c34:	00052c23          	sw	zero,24(a0)
1c009c38:	02400793          	li	a5,36
1c009c3c:	e691                	bnez	a3,1c009c48 <rt_event_push+0x1e>
1c009c3e:	c3c8                	sw	a0,4(a5)
1c009c40:	c788                	sw	a0,8(a5)
1c009c42:	30071073          	csrw	mstatus,a4
1c009c46:	8082                	ret
1c009c48:	4794                	lw	a3,8(a5)
1c009c4a:	ce88                	sw	a0,24(a3)
1c009c4c:	bfd5                	j	1c009c40 <rt_event_push+0x16>

1c009c4e <__rt_event_execute>:
1c009c4e:	1141                	addi	sp,sp,-16
1c009c50:	c422                	sw	s0,8(sp)
1c009c52:	02400793          	li	a5,36
1c009c56:	43dc                	lw	a5,4(a5)
1c009c58:	c606                	sw	ra,12(sp)
1c009c5a:	c226                	sw	s1,4(sp)
1c009c5c:	02400413          	li	s0,36
1c009c60:	eb91                	bnez	a5,1c009c74 <__rt_event_execute+0x26>
1c009c62:	c1a9                	beqz	a1,1c009ca4 <__rt_event_execute+0x56>
1c009c64:	10500073          	wfi
1c009c68:	30045073          	csrwi	mstatus,8
1c009c6c:	300477f3          	csrrci	a5,mstatus,8
1c009c70:	405c                	lw	a5,4(s0)
1c009c72:	cb8d                	beqz	a5,1c009ca4 <__rt_event_execute+0x56>
1c009c74:	4485                	li	s1,1
1c009c76:	4f98                	lw	a4,24(a5)
1c009c78:	53d4                	lw	a3,36(a5)
1c009c7a:	00978823          	sb	s1,16(a5)
1c009c7e:	c058                	sw	a4,4(s0)
1c009c80:	43c8                	lw	a0,4(a5)
1c009c82:	4398                	lw	a4,0(a5)
1c009c84:	e691                	bnez	a3,1c009c90 <__rt_event_execute+0x42>
1c009c86:	5394                	lw	a3,32(a5)
1c009c88:	e681                	bnez	a3,1c009c90 <__rt_event_execute+0x42>
1c009c8a:	4014                	lw	a3,0(s0)
1c009c8c:	c01c                	sw	a5,0(s0)
1c009c8e:	cf94                	sw	a3,24(a5)
1c009c90:	0207a023          	sw	zero,32(a5)
1c009c94:	c711                	beqz	a4,1c009ca0 <__rt_event_execute+0x52>
1c009c96:	30045073          	csrwi	mstatus,8
1c009c9a:	9702                	jalr	a4
1c009c9c:	300477f3          	csrrci	a5,mstatus,8
1c009ca0:	405c                	lw	a5,4(s0)
1c009ca2:	fbf1                	bnez	a5,1c009c76 <__rt_event_execute+0x28>
1c009ca4:	40b2                	lw	ra,12(sp)
1c009ca6:	4422                	lw	s0,8(sp)
1c009ca8:	4492                	lw	s1,4(sp)
1c009caa:	0141                	addi	sp,sp,16
1c009cac:	8082                	ret

1c009cae <__rt_wait_event>:
1c009cae:	1141                	addi	sp,sp,-16
1c009cb0:	c422                	sw	s0,8(sp)
1c009cb2:	c606                	sw	ra,12(sp)
1c009cb4:	842a                	mv	s0,a0
1c009cb6:	501c                	lw	a5,32(s0)
1c009cb8:	ef81                	bnez	a5,1c009cd0 <__rt_wait_event+0x22>
1c009cba:	581c                	lw	a5,48(s0)
1c009cbc:	eb91                	bnez	a5,1c009cd0 <__rt_wait_event+0x22>
1c009cbe:	02400793          	li	a5,36
1c009cc2:	4398                	lw	a4,0(a5)
1c009cc4:	40b2                	lw	ra,12(sp)
1c009cc6:	c380                	sw	s0,0(a5)
1c009cc8:	cc18                	sw	a4,24(s0)
1c009cca:	4422                	lw	s0,8(sp)
1c009ccc:	0141                	addi	sp,sp,16
1c009cce:	8082                	ret
1c009cd0:	4585                	li	a1,1
1c009cd2:	4501                	li	a0,0
1c009cd4:	3fad                	jal	1c009c4e <__rt_event_execute>
1c009cd6:	b7c5                	j	1c009cb6 <__rt_wait_event+0x8>

1c009cd8 <rt_event_wait>:
1c009cd8:	1141                	addi	sp,sp,-16
1c009cda:	c606                	sw	ra,12(sp)
1c009cdc:	c422                	sw	s0,8(sp)
1c009cde:	30047473          	csrrci	s0,mstatus,8
1c009ce2:	37f1                	jal	1c009cae <__rt_wait_event>
1c009ce4:	30041073          	csrw	mstatus,s0
1c009ce8:	40b2                	lw	ra,12(sp)
1c009cea:	4422                	lw	s0,8(sp)
1c009cec:	0141                	addi	sp,sp,16
1c009cee:	8082                	ret

1c009cf0 <__rt_event_sched_init>:
1c009cf0:	02400513          	li	a0,36
1c009cf4:	00052023          	sw	zero,0(a0)
1c009cf8:	00052223          	sw	zero,4(a0)
1c009cfc:	4585                	li	a1,1
1c009cfe:	0511                	addi	a0,a0,4
1c009d00:	bd9d                	j	1c009b76 <rt_event_alloc>

1c009d02 <__rt_fll_set_freq>:
1c009d02:	1141                	addi	sp,sp,-16
1c009d04:	c422                	sw	s0,8(sp)
1c009d06:	c226                	sw	s1,4(sp)
1c009d08:	c606                	sw	ra,12(sp)
1c009d0a:	842a                	mv	s0,a0
1c009d0c:	84ae                	mv	s1,a1
1c009d0e:	e111                	bnez	a0,1c009d12 <__rt_fll_set_freq+0x10>
1c009d10:	3965                	jal	1c0099c8 <__rt_bridge_req_shutdown>
1c009d12:	8526                	mv	a0,s1
1c009d14:	fe0fe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009d18:	1579                	addi	a0,a0,-2
1c009d1a:	00155793          	srli	a5,a0,0x1
1c009d1e:	e391                	bnez	a5,1c009d22 <__rt_fll_set_freq+0x20>
1c009d20:	4785                	li	a5,1
1c009d22:	fff78713          	addi	a4,a5,-1
1c009d26:	4505                	li	a0,1
1c009d28:	00e51533          	sll	a0,a0,a4
1c009d2c:	00f494b3          	sll	s1,s1,a5
1c009d30:	7761                	lui	a4,0xffff8
1c009d32:	8f65                	and	a4,a4,s1
1c009d34:	1c0016b7          	lui	a3,0x1c001
1c009d38:	953a                	add	a0,a0,a4
1c009d3a:	20068693          	addi	a3,a3,512 # 1c001200 <__rt_fll_freq>
1c009d3e:	00241713          	slli	a4,s0,0x2
1c009d42:	9736                	add	a4,a4,a3
1c009d44:	00f55533          	srl	a0,a0,a5
1c009d48:	c308                	sw	a0,0(a4)
1c009d4a:	1c001737          	lui	a4,0x1c001
1c009d4e:	19c70713          	addi	a4,a4,412 # 1c00119c <__rt_fll_is_on>
1c009d52:	9722                	add	a4,a4,s0
1c009d54:	00074703          	lbu	a4,0(a4)
1c009d58:	c715                	beqz	a4,1c009d84 <__rt_fll_set_freq+0x82>
1c009d5a:	1a100737          	lui	a4,0x1a100
1c009d5e:	0711                	addi	a4,a4,4
1c009d60:	0412                	slli	s0,s0,0x4
1c009d62:	943a                	add	s0,s0,a4
1c009d64:	4018                	lw	a4,0(s0)
1c009d66:	80bd                	srli	s1,s1,0xf
1c009d68:	76c1                	lui	a3,0xffff0
1c009d6a:	04c2                	slli	s1,s1,0x10
1c009d6c:	8f75                	and	a4,a4,a3
1c009d6e:	80c1                	srli	s1,s1,0x10
1c009d70:	0785                	addi	a5,a5,1
1c009d72:	c40006b7          	lui	a3,0xc4000
1c009d76:	8f45                	or	a4,a4,s1
1c009d78:	8bbd                	andi	a5,a5,15
1c009d7a:	16fd                	addi	a3,a3,-1
1c009d7c:	07ea                	slli	a5,a5,0x1a
1c009d7e:	8f75                	and	a4,a4,a3
1c009d80:	8fd9                	or	a5,a5,a4
1c009d82:	c01c                	sw	a5,0(s0)
1c009d84:	40b2                	lw	ra,12(sp)
1c009d86:	4422                	lw	s0,8(sp)
1c009d88:	4492                	lw	s1,4(sp)
1c009d8a:	0141                	addi	sp,sp,16
1c009d8c:	8082                	ret

1c009d8e <__rt_fll_init>:
1c009d8e:	1141                	addi	sp,sp,-16
1c009d90:	1a1005b7          	lui	a1,0x1a100
1c009d94:	00451613          	slli	a2,a0,0x4
1c009d98:	c226                	sw	s1,4(sp)
1c009d9a:	84aa                	mv	s1,a0
1c009d9c:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fe7f0>
1c009da0:	9532                	add	a0,a0,a2
1c009da2:	4114                	lw	a3,0(a0)
1c009da4:	c606                	sw	ra,12(sp)
1c009da6:	c422                	sw	s0,8(sp)
1c009da8:	87b6                	mv	a5,a3
1c009daa:	0406c963          	bltz	a3,1c009dfc <__rt_fll_init+0x6e>
1c009dae:	00858793          	addi	a5,a1,8
1c009db2:	97b2                	add	a5,a5,a2
1c009db4:	4398                	lw	a4,0(a5)
1c009db6:	7841                	lui	a6,0xffff0
1c009db8:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009dbc:	01077733          	and	a4,a4,a6
1c009dc0:	6809                	lui	a6,0x2
1c009dc2:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009dc6:	01076733          	or	a4,a4,a6
1c009dca:	f0010837          	lui	a6,0xf0010
1c009dce:	187d                	addi	a6,a6,-1
1c009dd0:	01077733          	and	a4,a4,a6
1c009dd4:	00500837          	lui	a6,0x500
1c009dd8:	01076733          	or	a4,a4,a6
1c009ddc:	05b1                	addi	a1,a1,12
1c009dde:	c398                	sw	a4,0(a5)
1c009de0:	962e                	add	a2,a2,a1
1c009de2:	421c                	lw	a5,0(a2)
1c009de4:	fc010737          	lui	a4,0xfc010
1c009de8:	177d                	addi	a4,a4,-1
1c009dea:	8ff9                	and	a5,a5,a4
1c009dec:	014c0737          	lui	a4,0x14c0
1c009df0:	8fd9                	or	a5,a5,a4
1c009df2:	c21c                	sw	a5,0(a2)
1c009df4:	c00007b7          	lui	a5,0xc0000
1c009df8:	8fd5                	or	a5,a5,a3
1c009dfa:	c11c                	sw	a5,0(a0)
1c009dfc:	1c001637          	lui	a2,0x1c001
1c009e00:	00249713          	slli	a4,s1,0x2
1c009e04:	20060613          	addi	a2,a2,512 # 1c001200 <__rt_fll_freq>
1c009e08:	9732                	add	a4,a4,a2
1c009e0a:	4300                	lw	s0,0(a4)
1c009e0c:	c015                	beqz	s0,1c009e30 <__rt_fll_init+0xa2>
1c009e0e:	85a2                	mv	a1,s0
1c009e10:	8526                	mv	a0,s1
1c009e12:	3dc5                	jal	1c009d02 <__rt_fll_set_freq>
1c009e14:	1c001537          	lui	a0,0x1c001
1c009e18:	19c50513          	addi	a0,a0,412 # 1c00119c <__rt_fll_is_on>
1c009e1c:	9526                	add	a0,a0,s1
1c009e1e:	4785                	li	a5,1
1c009e20:	00f50023          	sb	a5,0(a0)
1c009e24:	40b2                	lw	ra,12(sp)
1c009e26:	8522                	mv	a0,s0
1c009e28:	4422                	lw	s0,8(sp)
1c009e2a:	4492                	lw	s1,4(sp)
1c009e2c:	0141                	addi	sp,sp,16
1c009e2e:	8082                	ret
1c009e30:	06c2                	slli	a3,a3,0x10
1c009e32:	83e9                	srli	a5,a5,0x1a
1c009e34:	82c1                	srli	a3,a3,0x10
1c009e36:	8bbd                	andi	a5,a5,15
1c009e38:	06be                	slli	a3,a3,0xf
1c009e3a:	17fd                	addi	a5,a5,-1
1c009e3c:	00f6d433          	srl	s0,a3,a5
1c009e40:	c300                	sw	s0,0(a4)
1c009e42:	bfc9                	j	1c009e14 <__rt_fll_init+0x86>

1c009e44 <__rt_fll_deinit>:
1c009e44:	1c0017b7          	lui	a5,0x1c001
1c009e48:	19c78793          	addi	a5,a5,412 # 1c00119c <__rt_fll_is_on>
1c009e4c:	953e                	add	a0,a0,a5
1c009e4e:	00050023          	sb	zero,0(a0)
1c009e52:	8082                	ret

1c009e54 <__rt_flls_constructor>:
1c009e54:	1c0017b7          	lui	a5,0x1c001
1c009e58:	2007a023          	sw	zero,512(a5) # 1c001200 <__rt_fll_freq>
1c009e5c:	20078793          	addi	a5,a5,512
1c009e60:	0007a223          	sw	zero,4(a5)
1c009e64:	1c0017b7          	lui	a5,0x1c001
1c009e68:	18079e23          	sh	zero,412(a5) # 1c00119c <__rt_fll_is_on>
1c009e6c:	8082                	ret

1c009e6e <gcd>:
1c009e6e:	cd19                	beqz	a0,1c009e8c <gcd+0x1e>
1c009e70:	cd81                	beqz	a1,1c009e88 <gcd+0x1a>
1c009e72:	00054463          	bltz	a0,1c009e7a <gcd+0xc>
1c009e76:	0005d563          	bgez	a1,1c009e80 <gcd+0x12>
1c009e7a:	55fd                	li	a1,-1
1c009e7c:	a031                	j	1c009e88 <gcd+0x1a>
1c009e7e:	85be                	mv	a1,a5
1c009e80:	02b567b3          	rem	a5,a0,a1
1c009e84:	852e                	mv	a0,a1
1c009e86:	ffe5                	bnez	a5,1c009e7e <gcd+0x10>
1c009e88:	852e                	mv	a0,a1
1c009e8a:	8082                	ret
1c009e8c:	4581                	li	a1,0
1c009e8e:	bfed                	j	1c009e88 <gcd+0x1a>

1c009e90 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009e90:	1101                	addi	sp,sp,-32
1c009e92:	1c0017b7          	lui	a5,0x1c001
1c009e96:	c84a                	sw	s2,16(sp)
1c009e98:	1a07a903          	lw	s2,416(a5) # 1c0011a0 <__rt_periph_lcm>
1c009e9c:	c452                	sw	s4,8(sp)
1c009e9e:	8a2e                	mv	s4,a1
1c009ea0:	85ca                	mv	a1,s2
1c009ea2:	ce06                	sw	ra,28(sp)
1c009ea4:	cc22                	sw	s0,24(sp)
1c009ea6:	ca26                	sw	s1,20(sp)
1c009ea8:	842a                	mv	s0,a0
1c009eaa:	c64e                	sw	s3,12(sp)
1c009eac:	89aa                	mv	s3,a0
1c009eae:	37c1                	jal	1c009e6e <gcd>
1c009eb0:	02a44533          	div	a0,s0,a0
1c009eb4:	03250933          	mul	s2,a0,s2
1c009eb8:	4511                	li	a0,4
1c009eba:	82dff0ef          	jal	ra,1c0096e6 <__rt_cbsys_exec>
1c009ebe:	1c0017b7          	lui	a5,0x1c001
1c009ec2:	2007a783          	lw	a5,512(a5) # 1c001200 <__rt_fll_freq>
1c009ec6:	028954b3          	divu	s1,s2,s0
1c009eca:	0527f263          	bleu	s2,a5,1c009f0e <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009ece:	1a1047b7          	lui	a5,0x1a104
1c009ed2:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1028c0>
1c009ed6:	4705                	li	a4,1
1c009ed8:	0ce7ae23          	sw	a4,220(a5)
1c009edc:	85a2                	mv	a1,s0
1c009ede:	4501                	li	a0,0
1c009ee0:	350d                	jal	1c009d02 <__rt_fll_set_freq>
1c009ee2:	57fd                	li	a5,-1
1c009ee4:	00fa0963          	beq	s4,a5,1c009ef6 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009ee8:	c099                	beqz	s1,1c009eee <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009eea:	029459b3          	divu	s3,s0,s1
1c009eee:	1c0017b7          	lui	a5,0x1c001
1c009ef2:	2137a423          	sw	s3,520(a5) # 1c001208 <__rt_freq_domains>
1c009ef6:	4515                	li	a0,5
1c009ef8:	feeff0ef          	jal	ra,1c0096e6 <__rt_cbsys_exec>
1c009efc:	40f2                	lw	ra,28(sp)
1c009efe:	4462                	lw	s0,24(sp)
1c009f00:	44d2                	lw	s1,20(sp)
1c009f02:	4942                	lw	s2,16(sp)
1c009f04:	49b2                	lw	s3,12(sp)
1c009f06:	4a22                	lw	s4,8(sp)
1c009f08:	4501                	li	a0,0
1c009f0a:	6105                	addi	sp,sp,32
1c009f0c:	8082                	ret
1c009f0e:	85a2                	mv	a1,s0
1c009f10:	4501                	li	a0,0
1c009f12:	3bc5                	jal	1c009d02 <__rt_fll_set_freq>
1c009f14:	1a1047b7          	lui	a5,0x1a104
1c009f18:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1028c0>
1c009f1c:	4705                	li	a4,1
1c009f1e:	0ce7ae23          	sw	a4,220(a5)
1c009f22:	b7c1                	j	1c009ee2 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009f24 <rt_freq_set_and_get>:
1c009f24:	1141                	addi	sp,sp,-16
1c009f26:	852e                	mv	a0,a1
1c009f28:	c606                	sw	ra,12(sp)
1c009f2a:	c422                	sw	s0,8(sp)
1c009f2c:	30047473          	csrrci	s0,mstatus,8
1c009f30:	4581                	li	a1,0
1c009f32:	3fb9                	jal	1c009e90 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009f34:	30041073          	csrw	mstatus,s0
1c009f38:	40b2                	lw	ra,12(sp)
1c009f3a:	4422                	lw	s0,8(sp)
1c009f3c:	00a03533          	snez	a0,a0
1c009f40:	40a00533          	neg	a0,a0
1c009f44:	0141                	addi	sp,sp,16
1c009f46:	8082                	ret

1c009f48 <__rt_freq_init>:
1c009f48:	1141                	addi	sp,sp,-16
1c009f4a:	c422                	sw	s0,8(sp)
1c009f4c:	c606                	sw	ra,12(sp)
1c009f4e:	3719                	jal	1c009e54 <__rt_flls_constructor>
1c009f50:	1c0017b7          	lui	a5,0x1c001
1c009f54:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c009f58:	4785                	li	a5,1
1c009f5a:	1c001437          	lui	s0,0x1c001
1c009f5e:	02f70663          	beq	a4,a5,1c009f8a <__rt_freq_init+0x42>
1c009f62:	4501                	li	a0,0
1c009f64:	352d                	jal	1c009d8e <__rt_fll_init>
1c009f66:	20a42423          	sw	a0,520(s0) # 1c001208 <__rt_freq_domains>
1c009f6a:	1a1047b7          	lui	a5,0x1a104
1c009f6e:	4709                	li	a4,2
1c009f70:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1028bc>
1c009f74:	4705                	li	a4,1
1c009f76:	0ce7ac23          	sw	a4,216(a5)
1c009f7a:	40b2                	lw	ra,12(sp)
1c009f7c:	4422                	lw	s0,8(sp)
1c009f7e:	0ce7ae23          	sw	a4,220(a5)
1c009f82:	0ce7aa23          	sw	a4,212(a5)
1c009f86:	0141                	addi	sp,sp,16
1c009f88:	8082                	ret
1c009f8a:	026267b7          	lui	a5,0x2626
1c009f8e:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2617214>
1c009f92:	20f42423          	sw	a5,520(s0)
1c009f96:	bfd1                	j	1c009f6a <__rt_freq_init+0x22>

1c009f98 <hal_itc_wait_for_event_noirq>:
1c009f98:	1a10a7b7          	lui	a5,0x1a10a
1c009f9c:	300476f3          	csrrci	a3,mstatus,8
1c009fa0:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa107ff8>
1c009fa4:	8f69                	and	a4,a4,a0
1c009fa6:	eb11                	bnez	a4,1c009fba <hal_itc_wait_for_event_noirq+0x22>
1c009fa8:	80a7a223          	sw	a0,-2044(a5)
1c009fac:	10500073          	wfi
1c009fb0:	80a7a423          	sw	a0,-2040(a5)
1c009fb4:	30069073          	csrw	mstatus,a3
1c009fb8:	b7d5                	j	1c009f9c <hal_itc_wait_for_event_noirq+0x4>
1c009fba:	80a7aa23          	sw	a0,-2028(a5)
1c009fbe:	30069073          	csrw	mstatus,a3
1c009fc2:	8082                	ret

1c009fc4 <__rt_pmu_cluster_power_down>:
1c009fc4:	1a1047b7          	lui	a5,0x1a104
1c009fc8:	5bbc                	lw	a5,112(a5)
1c009fca:	01079713          	slli	a4,a5,0x10
1c009fce:	02074c63          	bltz	a4,1c00a006 <__rt_pmu_cluster_power_down+0x42>
1c009fd2:	1141                	addi	sp,sp,-16
1c009fd4:	c422                	sw	s0,8(sp)
1c009fd6:	c606                	sw	ra,12(sp)
1c009fd8:	c226                	sw	s1,4(sp)
1c009fda:	1a104437          	lui	s0,0x1a104
1c009fde:	547c                	lw	a5,108(s0)
1c009fe0:	e385                	bnez	a5,1c00a000 <__rt_pmu_cluster_power_down+0x3c>
1c009fe2:	4485                	li	s1,1
1c009fe4:	c444                	sw	s1,12(s0)
1c009fe6:	478d                	li	a5,3
1c009fe8:	d83c                	sw	a5,112(s0)
1c009fea:	00800537          	lui	a0,0x800
1c009fee:	376d                	jal	1c009f98 <hal_itc_wait_for_event_noirq>
1c009ff0:	d824                	sw	s1,112(s0)
1c009ff2:	4422                	lw	s0,8(sp)
1c009ff4:	40b2                	lw	ra,12(sp)
1c009ff6:	4492                	lw	s1,4(sp)
1c009ff8:	00400537          	lui	a0,0x400
1c009ffc:	0141                	addi	sp,sp,16
1c009ffe:	bf69                	j	1c009f98 <hal_itc_wait_for_event_noirq>
1c00a000:	4505                	li	a0,1
1c00a002:	2a11                	jal	1c00a116 <rt_time_wait_us>
1c00a004:	bfe9                	j	1c009fde <__rt_pmu_cluster_power_down+0x1a>
1c00a006:	8082                	ret

1c00a008 <__rt_pmu_cluster_power_up>:
1c00a008:	1141                	addi	sp,sp,-16
1c00a00a:	c606                	sw	ra,12(sp)
1c00a00c:	c422                	sw	s0,8(sp)
1c00a00e:	478d                	li	a5,3
1c00a010:	1a104437          	lui	s0,0x1a104
1c00a014:	d83c                	sw	a5,112(s0)
1c00a016:	00400537          	lui	a0,0x400
1c00a01a:	3fbd                	jal	1c009f98 <hal_itc_wait_for_event_noirq>
1c00a01c:	02700793          	li	a5,39
1c00a020:	d83c                	sw	a5,112(s0)
1c00a022:	00800537          	lui	a0,0x800
1c00a026:	3f8d                	jal	1c009f98 <hal_itc_wait_for_event_noirq>
1c00a028:	6791                	lui	a5,0x4
1c00a02a:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa1027f8>
1c00a02e:	02778793          	addi	a5,a5,39 # 4027 <_l1_preload_size+0x2817>
1c00a032:	d83c                	sw	a5,112(s0)
1c00a034:	40b2                	lw	ra,12(sp)
1c00a036:	4422                	lw	s0,8(sp)
1c00a038:	4505                	li	a0,1
1c00a03a:	0141                	addi	sp,sp,16
1c00a03c:	8082                	ret

1c00a03e <__rt_pmu_init>:
1c00a03e:	1a1077b7          	lui	a5,0x1a107
1c00a042:	4741                	li	a4,16
1c00a044:	cb98                	sw	a4,16(a5)
1c00a046:	1a10a7b7          	lui	a5,0x1a10a
1c00a04a:	02000737          	lui	a4,0x2000
1c00a04e:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa108000>
1c00a052:	4709                	li	a4,2
1c00a054:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c00a058:	8082                	ret

1c00a05a <rt_padframe_set>:
1c00a05a:	300476f3          	csrrci	a3,mstatus,8
1c00a05e:	4158                	lw	a4,4(a0)
1c00a060:	1a1047b7          	lui	a5,0x1a104
1c00a064:	4310                	lw	a2,0(a4)
1c00a066:	cb90                	sw	a2,16(a5)
1c00a068:	4350                	lw	a2,4(a4)
1c00a06a:	cbd0                	sw	a2,20(a5)
1c00a06c:	4710                	lw	a2,8(a4)
1c00a06e:	cf90                	sw	a2,24(a5)
1c00a070:	4758                	lw	a4,12(a4)
1c00a072:	cfd8                	sw	a4,28(a5)
1c00a074:	30069073          	csrw	mstatus,a3
1c00a078:	8082                	ret

1c00a07a <__rt_padframe_init>:
1c00a07a:	1c001537          	lui	a0,0x1c001
1c00a07e:	fdc50513          	addi	a0,a0,-36 # 1c000fdc <__rt_padframe_profiles>
1c00a082:	bfe1                	j	1c00a05a <rt_padframe_set>

1c00a084 <__rt_time_poweroff>:
1c00a084:	1a10b7b7          	lui	a5,0x1a10b
1c00a088:	47d8                	lw	a4,12(a5)
1c00a08a:	1c0017b7          	lui	a5,0x1c001
1c00a08e:	4501                	li	a0,0
1c00a090:	1ae7a223          	sw	a4,420(a5) # 1c0011a4 <timer_count>
1c00a094:	8082                	ret

1c00a096 <__rt_time_poweron>:
1c00a096:	1c0017b7          	lui	a5,0x1c001
1c00a09a:	1a47a703          	lw	a4,420(a5) # 1c0011a4 <timer_count>
1c00a09e:	1a10b7b7          	lui	a5,0x1a10b
1c00a0a2:	4501                	li	a0,0
1c00a0a4:	c7d8                	sw	a4,12(a5)
1c00a0a6:	8082                	ret

1c00a0a8 <rt_event_push_delayed>:
1c00a0a8:	30047373          	csrrci	t1,mstatus,8
1c00a0ac:	1a10b6b7          	lui	a3,0x1a10b
1c00a0b0:	46d0                	lw	a2,12(a3)
1c00a0b2:	1c001737          	lui	a4,0x1c001
1c00a0b6:	21072783          	lw	a5,528(a4) # 1c001210 <first_delayed>
1c00a0ba:	86ba                	mv	a3,a4
1c00a0bc:	0005d363          	bgez	a1,1c00a0c2 <rt_event_push_delayed+0x1a>
1c00a0c0:	4581                	li	a1,0
1c00a0c2:	4779                	li	a4,30
1c00a0c4:	02e5c5b3          	div	a1,a1,a4
1c00a0c8:	80000737          	lui	a4,0x80000
1c00a0cc:	fff74713          	not	a4,a4
1c00a0d0:	00e67833          	and	a6,a2,a4
1c00a0d4:	0585                	addi	a1,a1,1
1c00a0d6:	962e                	add	a2,a2,a1
1c00a0d8:	d950                	sw	a2,52(a0)
1c00a0da:	982e                	add	a6,a6,a1
1c00a0dc:	4601                	li	a2,0
1c00a0de:	c799                	beqz	a5,1c00a0ec <rt_event_push_delayed+0x44>
1c00a0e0:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa109820>
1c00a0e4:	00e8f8b3          	and	a7,a7,a4
1c00a0e8:	0108e863          	bltu	a7,a6,1c00a0f8 <rt_event_push_delayed+0x50>
1c00a0ec:	ca09                	beqz	a2,1c00a0fe <rt_event_push_delayed+0x56>
1c00a0ee:	ce08                	sw	a0,24(a2)
1c00a0f0:	cd1c                	sw	a5,24(a0)
1c00a0f2:	30031073          	csrw	mstatus,t1
1c00a0f6:	8082                	ret
1c00a0f8:	863e                	mv	a2,a5
1c00a0fa:	4f9c                	lw	a5,24(a5)
1c00a0fc:	b7cd                	j	1c00a0de <rt_event_push_delayed+0x36>
1c00a0fe:	cd1c                	sw	a5,24(a0)
1c00a100:	1a10b7b7          	lui	a5,0x1a10b
1c00a104:	47d8                	lw	a4,12(a5)
1c00a106:	20a6a823          	sw	a0,528(a3) # 1a10b210 <__l1_end+0xa1099fc>
1c00a10a:	95ba                	add	a1,a1,a4
1c00a10c:	cbcc                	sw	a1,20(a5)
1c00a10e:	08500713          	li	a4,133
1c00a112:	c3d8                	sw	a4,4(a5)
1c00a114:	bff9                	j	1c00a0f2 <rt_event_push_delayed+0x4a>

1c00a116 <rt_time_wait_us>:
1c00a116:	1101                	addi	sp,sp,-32
1c00a118:	85aa                	mv	a1,a0
1c00a11a:	4501                	li	a0,0
1c00a11c:	ce06                	sw	ra,28(sp)
1c00a11e:	cc22                	sw	s0,24(sp)
1c00a120:	c62e                	sw	a1,12(sp)
1c00a122:	ae7ff0ef          	jal	ra,1c009c08 <rt_event_get_blocking>
1c00a126:	45b2                	lw	a1,12(sp)
1c00a128:	842a                	mv	s0,a0
1c00a12a:	3fbd                	jal	1c00a0a8 <rt_event_push_delayed>
1c00a12c:	8522                	mv	a0,s0
1c00a12e:	4462                	lw	s0,24(sp)
1c00a130:	40f2                	lw	ra,28(sp)
1c00a132:	6105                	addi	sp,sp,32
1c00a134:	b655                	j	1c009cd8 <rt_event_wait>

1c00a136 <__rt_time_init>:
1c00a136:	1141                	addi	sp,sp,-16
1c00a138:	1c0017b7          	lui	a5,0x1c001
1c00a13c:	2007a823          	sw	zero,528(a5) # 1c001210 <first_delayed>
1c00a140:	08300713          	li	a4,131
1c00a144:	1a10b7b7          	lui	a5,0x1a10b
1c00a148:	c606                	sw	ra,12(sp)
1c00a14a:	c422                	sw	s0,8(sp)
1c00a14c:	1c00a5b7          	lui	a1,0x1c00a
1c00a150:	c3d8                	sw	a4,4(a5)
1c00a152:	1ce58593          	addi	a1,a1,462 # 1c00a1ce <__rt_timer_handler>
1c00a156:	452d                	li	a0,11
1c00a158:	bbeff0ef          	jal	ra,1c009516 <rt_irq_set_handler>
1c00a15c:	f14027f3          	csrr	a5,mhartid
1c00a160:	8795                	srai	a5,a5,0x5
1c00a162:	6705                	lui	a4,0x1
1c00a164:	03f7f793          	andi	a5,a5,63
1c00a168:	46fd                	li	a3,31
1c00a16a:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a16e:	04d79863          	bne	a5,a3,1c00a1be <__rt_time_init+0x88>
1c00a172:	1a10a7b7          	lui	a5,0x1a10a
1c00a176:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c00a17a:	1c00a5b7          	lui	a1,0x1c00a
1c00a17e:	4601                	li	a2,0
1c00a180:	08458593          	addi	a1,a1,132 # 1c00a084 <__rt_time_poweroff>
1c00a184:	4509                	li	a0,2
1c00a186:	d20ff0ef          	jal	ra,1c0096a6 <__rt_cbsys_add>
1c00a18a:	1c00a5b7          	lui	a1,0x1c00a
1c00a18e:	842a                	mv	s0,a0
1c00a190:	4601                	li	a2,0
1c00a192:	09658593          	addi	a1,a1,150 # 1c00a096 <__rt_time_poweron>
1c00a196:	450d                	li	a0,3
1c00a198:	d0eff0ef          	jal	ra,1c0096a6 <__rt_cbsys_add>
1c00a19c:	8d41                	or	a0,a0,s0
1c00a19e:	c505                	beqz	a0,1c00a1c6 <__rt_time_init+0x90>
1c00a1a0:	f1402673          	csrr	a2,mhartid
1c00a1a4:	1c000537          	lui	a0,0x1c000
1c00a1a8:	40565593          	srai	a1,a2,0x5
1c00a1ac:	03f5f593          	andi	a1,a1,63
1c00a1b0:	8a7d                	andi	a2,a2,31
1c00a1b2:	52050513          	addi	a0,a0,1312 # 1c000520 <__DTOR_END__+0x234>
1c00a1b6:	015000ef          	jal	ra,1c00a9ca <printf>
1c00a1ba:	79c000ef          	jal	ra,1c00a956 <abort>
1c00a1be:	002047b7          	lui	a5,0x204
1c00a1c2:	cbd8                	sw	a4,20(a5)
1c00a1c4:	bf5d                	j	1c00a17a <__rt_time_init+0x44>
1c00a1c6:	40b2                	lw	ra,12(sp)
1c00a1c8:	4422                	lw	s0,8(sp)
1c00a1ca:	0141                	addi	sp,sp,16
1c00a1cc:	8082                	ret

1c00a1ce <__rt_timer_handler>:
1c00a1ce:	7179                	addi	sp,sp,-48
1c00a1d0:	ce36                	sw	a3,28(sp)
1c00a1d2:	cc3a                	sw	a4,24(sp)
1c00a1d4:	1a10b6b7          	lui	a3,0x1a10b
1c00a1d8:	1c001737          	lui	a4,0x1c001
1c00a1dc:	d61a                	sw	t1,44(sp)
1c00a1de:	d032                	sw	a2,32(sp)
1c00a1e0:	ca3e                	sw	a5,20(sp)
1c00a1e2:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa1097f8>
1c00a1e6:	21072783          	lw	a5,528(a4) # 1c001210 <first_delayed>
1c00a1ea:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a1ee:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a1f2:	c842                	sw	a6,16(sp)
1c00a1f4:	80000837          	lui	a6,0x80000
1c00a1f8:	d42a                	sw	a0,40(sp)
1c00a1fa:	d22e                	sw	a1,36(sp)
1c00a1fc:	c646                	sw	a7,12(sp)
1c00a1fe:	c472                	sw	t3,8(sp)
1c00a200:	4581                	li	a1,0
1c00a202:	4501                	li	a0,0
1c00a204:	ffe84813          	xori	a6,a6,-2
1c00a208:	efb9                	bnez	a5,1c00a266 <__rt_timer_handler+0x98>
1c00a20a:	c119                	beqz	a0,1c00a210 <__rt_timer_handler+0x42>
1c00a20c:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a210:	c199                	beqz	a1,1c00a216 <__rt_timer_handler+0x48>
1c00a212:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a216:	20072823          	sw	zero,528(a4)
1c00a21a:	1a10b7b7          	lui	a5,0x1a10b
1c00a21e:	08100713          	li	a4,129
1c00a222:	c3d8                	sw	a4,4(a5)
1c00a224:	6785                	lui	a5,0x1
1c00a226:	1a10a737          	lui	a4,0x1a10a
1c00a22a:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a22e:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa108000>
1c00a232:	5332                	lw	t1,44(sp)
1c00a234:	5522                	lw	a0,40(sp)
1c00a236:	5592                	lw	a1,36(sp)
1c00a238:	5602                	lw	a2,32(sp)
1c00a23a:	46f2                	lw	a3,28(sp)
1c00a23c:	4762                	lw	a4,24(sp)
1c00a23e:	47d2                	lw	a5,20(sp)
1c00a240:	4842                	lw	a6,16(sp)
1c00a242:	48b2                	lw	a7,12(sp)
1c00a244:	4e22                	lw	t3,8(sp)
1c00a246:	6145                	addi	sp,sp,48
1c00a248:	30200073          	mret
1c00a24c:	0187a883          	lw	a7,24(a5)
1c00a250:	0007ac23          	sw	zero,24(a5)
1c00a254:	c611                	beqz	a2,1c00a260 <__rt_timer_handler+0x92>
1c00a256:	ce9c                	sw	a5,24(a3)
1c00a258:	86be                	mv	a3,a5
1c00a25a:	4585                	li	a1,1
1c00a25c:	87c6                	mv	a5,a7
1c00a25e:	b76d                	j	1c00a208 <__rt_timer_handler+0x3a>
1c00a260:	863e                	mv	a2,a5
1c00a262:	4505                	li	a0,1
1c00a264:	bfd5                	j	1c00a258 <__rt_timer_handler+0x8a>
1c00a266:	0347a883          	lw	a7,52(a5)
1c00a26a:	41130e33          	sub	t3,t1,a7
1c00a26e:	fdc87fe3          	bleu	t3,a6,1c00a24c <__rt_timer_handler+0x7e>
1c00a272:	c119                	beqz	a0,1c00a278 <__rt_timer_handler+0xaa>
1c00a274:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a278:	c199                	beqz	a1,1c00a27e <__rt_timer_handler+0xb0>
1c00a27a:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a27e:	20f72823          	sw	a5,528(a4)
1c00a282:	1a10b737          	lui	a4,0x1a10b
1c00a286:	475c                	lw	a5,12(a4)
1c00a288:	406787b3          	sub	a5,a5,t1
1c00a28c:	97c6                	add	a5,a5,a7
1c00a28e:	cb5c                	sw	a5,20(a4)
1c00a290:	08500793          	li	a5,133
1c00a294:	c35c                	sw	a5,4(a4)
1c00a296:	bf71                	j	1c00a232 <__rt_timer_handler+0x64>

1c00a298 <rt_periph_copy>:
1c00a298:	7179                	addi	sp,sp,-48
1c00a29a:	d422                	sw	s0,40(sp)
1c00a29c:	842a                	mv	s0,a0
1c00a29e:	d606                	sw	ra,44(sp)
1c00a2a0:	d226                	sw	s1,36(sp)
1c00a2a2:	d04a                	sw	s2,32(sp)
1c00a2a4:	30047973          	csrrci	s2,mstatus,8
1c00a2a8:	4015d493          	srai	s1,a1,0x1
1c00a2ac:	1a102537          	lui	a0,0x1a102
1c00a2b0:	049e                	slli	s1,s1,0x7
1c00a2b2:	94aa                	add	s1,s1,a0
1c00a2b4:	00459513          	slli	a0,a1,0x4
1c00a2b8:	8941                	andi	a0,a0,16
1c00a2ba:	94aa                	add	s1,s1,a0
1c00a2bc:	853e                	mv	a0,a5
1c00a2be:	ef89                	bnez	a5,1c00a2d8 <rt_periph_copy+0x40>
1c00a2c0:	ce2e                	sw	a1,28(sp)
1c00a2c2:	cc32                	sw	a2,24(sp)
1c00a2c4:	ca36                	sw	a3,20(sp)
1c00a2c6:	c83a                	sw	a4,16(sp)
1c00a2c8:	c63e                	sw	a5,12(sp)
1c00a2ca:	895ff0ef          	jal	ra,1c009b5e <__rt_wait_event_prepare_blocking>
1c00a2ce:	47b2                	lw	a5,12(sp)
1c00a2d0:	4742                	lw	a4,16(sp)
1c00a2d2:	46d2                	lw	a3,20(sp)
1c00a2d4:	4662                	lw	a2,24(sp)
1c00a2d6:	45f2                	lw	a1,28(sp)
1c00a2d8:	e419                	bnez	s0,1c00a2e6 <rt_periph_copy+0x4e>
1c00a2da:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa100820>
1c00a2de:	04052023          	sw	zero,64(a0)
1c00a2e2:	04052823          	sw	zero,80(a0)
1c00a2e6:	00c42803          	lw	a6,12(s0)
1c00a2ea:	c054                	sw	a3,4(s0)
1c00a2ec:	cc08                	sw	a0,24(s0)
1c00a2ee:	00f87813          	andi	a6,a6,15
1c00a2f2:	4891                	li	a7,4
1c00a2f4:	01076713          	ori	a4,a4,16
1c00a2f8:	0708ec63          	bltu	a7,a6,1c00a370 <rt_periph_copy+0xd8>
1c00a2fc:	04000893          	li	a7,64
1c00a300:	0596                	slli	a1,a1,0x5
1c00a302:	98ae                	add	a7,a7,a1
1c00a304:	0008a303          	lw	t1,0(a7)
1c00a308:	00042a23          	sw	zero,20(s0)
1c00a30c:	04000813          	li	a6,64
1c00a310:	02031663          	bnez	t1,1c00a33c <rt_periph_copy+0xa4>
1c00a314:	0088a023          	sw	s0,0(a7)
1c00a318:	00b808b3          	add	a7,a6,a1
1c00a31c:	0088a303          	lw	t1,8(a7)
1c00a320:	0088a223          	sw	s0,4(a7)
1c00a324:	02031163          	bnez	t1,1c00a346 <rt_periph_copy+0xae>
1c00a328:	0084a883          	lw	a7,8(s1)
1c00a32c:	0208f893          	andi	a7,a7,32
1c00a330:	00089b63          	bnez	a7,1c00a346 <rt_periph_copy+0xae>
1c00a334:	c090                	sw	a2,0(s1)
1c00a336:	c0d4                	sw	a3,4(s1)
1c00a338:	c498                	sw	a4,8(s1)
1c00a33a:	a005                	j	1c00a35a <rt_periph_copy+0xc2>
1c00a33c:	0048a883          	lw	a7,4(a7)
1c00a340:	0088aa23          	sw	s0,20(a7)
1c00a344:	bfd1                	j	1c00a318 <rt_periph_copy+0x80>
1c00a346:	00042823          	sw	zero,16(s0)
1c00a34a:	c010                	sw	a2,0(s0)
1c00a34c:	c054                	sw	a3,4(s0)
1c00a34e:	c418                	sw	a4,8(s0)
1c00a350:	00031563          	bnez	t1,1c00a35a <rt_periph_copy+0xc2>
1c00a354:	982e                	add	a6,a6,a1
1c00a356:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a35a:	e399                	bnez	a5,1c00a360 <rt_periph_copy+0xc8>
1c00a35c:	953ff0ef          	jal	ra,1c009cae <__rt_wait_event>
1c00a360:	30091073          	csrw	mstatus,s2
1c00a364:	50b2                	lw	ra,44(sp)
1c00a366:	5422                	lw	s0,40(sp)
1c00a368:	5492                	lw	s1,36(sp)
1c00a36a:	5902                	lw	s2,32(sp)
1c00a36c:	6145                	addi	sp,sp,48
1c00a36e:	8082                	ret
1c00a370:	4899                	li	a7,6
1c00a372:	ff1814e3          	bne	a6,a7,1c00a35a <rt_periph_copy+0xc2>
1c00a376:	04000893          	li	a7,64
1c00a37a:	0596                	slli	a1,a1,0x5
1c00a37c:	98ae                	add	a7,a7,a1
1c00a37e:	0008a303          	lw	t1,0(a7)
1c00a382:	00042a23          	sw	zero,20(s0)
1c00a386:	04000813          	li	a6,64
1c00a38a:	00031f63          	bnez	t1,1c00a3a8 <rt_periph_copy+0x110>
1c00a38e:	0088a023          	sw	s0,0(a7)
1c00a392:	95c2                	add	a1,a1,a6
1c00a394:	c1c0                	sw	s0,4(a1)
1c00a396:	00031e63          	bnez	t1,1c00a3b2 <rt_periph_copy+0x11a>
1c00a39a:	02442803          	lw	a6,36(s0)
1c00a39e:	1a1025b7          	lui	a1,0x1a102
1c00a3a2:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa10090c>
1c00a3a6:	b779                	j	1c00a334 <rt_periph_copy+0x9c>
1c00a3a8:	0048a883          	lw	a7,4(a7)
1c00a3ac:	0088aa23          	sw	s0,20(a7)
1c00a3b0:	b7cd                	j	1c00a392 <rt_periph_copy+0xfa>
1c00a3b2:	c418                	sw	a4,8(s0)
1c00a3b4:	4598                	lw	a4,8(a1)
1c00a3b6:	c010                	sw	a2,0(s0)
1c00a3b8:	c054                	sw	a3,4(s0)
1c00a3ba:	00042823          	sw	zero,16(s0)
1c00a3be:	ff51                	bnez	a4,1c00a35a <rt_periph_copy+0xc2>
1c00a3c0:	c580                	sw	s0,8(a1)
1c00a3c2:	bf61                	j	1c00a35a <rt_periph_copy+0xc2>

1c00a3c4 <__rt_periph_init>:
1c00a3c4:	1c0085b7          	lui	a1,0x1c008
1c00a3c8:	04000693          	li	a3,64
1c00a3cc:	4601                	li	a2,0
1c00a3ce:	04000793          	li	a5,64
1c00a3d2:	1a1028b7          	lui	a7,0x1a102
1c00a3d6:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a3da:	4841                	li	a6,16
1c00a3dc:	40165713          	srai	a4,a2,0x1
1c00a3e0:	00461513          	slli	a0,a2,0x4
1c00a3e4:	071e                	slli	a4,a4,0x7
1c00a3e6:	9746                	add	a4,a4,a7
1c00a3e8:	8941                	andi	a0,a0,16
1c00a3ea:	972a                	add	a4,a4,a0
1c00a3ec:	0006a023          	sw	zero,0(a3)
1c00a3f0:	0006a423          	sw	zero,8(a3)
1c00a3f4:	c6d8                	sw	a4,12(a3)
1c00a3f6:	cecc                	sw	a1,28(a3)
1c00a3f8:	0605                	addi	a2,a2,1
1c00a3fa:	02068693          	addi	a3,a3,32
1c00a3fe:	fd061fe3          	bne	a2,a6,1c00a3dc <__rt_periph_init+0x18>
1c00a402:	1c008737          	lui	a4,0x1c008
1c00a406:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a40a:	2007a023          	sw	zero,512(a5)
1c00a40e:	20e7a423          	sw	a4,520(a5)
1c00a412:	20e7a623          	sw	a4,524(a5)
1c00a416:	20e7a823          	sw	a4,528(a5)
1c00a41a:	20e7aa23          	sw	a4,532(a5)
1c00a41e:	20e7ac23          	sw	a4,536(a5)
1c00a422:	20e7ae23          	sw	a4,540(a5)
1c00a426:	22e7a023          	sw	a4,544(a5)
1c00a42a:	22e7a223          	sw	a4,548(a5)
1c00a42e:	2007a223          	sw	zero,516(a5)
1c00a432:	8082                	ret

1c00a434 <__rt_i2c_init>:
1c00a434:	1c0107b7          	lui	a5,0x1c010
1c00a438:	16878793          	addi	a5,a5,360 # 1c010168 <__cluster_text_end>
1c00a43c:	00078223          	sb	zero,4(a5)
1c00a440:	00078a23          	sb	zero,20(a5)
1c00a444:	8082                	ret

1c00a446 <__rt_hyper_init>:
1c00a446:	1c001737          	lui	a4,0x1c001
1c00a44a:	26800793          	li	a5,616
1c00a44e:	1a072423          	sw	zero,424(a4) # 1c0011a8 <__pi_hyper_cluster_reqs_first>
1c00a452:	577d                	li	a4,-1
1c00a454:	0007aa23          	sw	zero,20(a5)
1c00a458:	0207a823          	sw	zero,48(a5)
1c00a45c:	cf98                	sw	a4,24(a5)
1c00a45e:	8082                	ret

1c00a460 <__rt_spim_init>:
1c00a460:	1c0017b7          	lui	a5,0x1c001
1c00a464:	1a07a623          	sw	zero,428(a5) # 1c0011ac <__rt_spim_open_count>
1c00a468:	8082                	ret

1c00a46a <rt_is_fc>:
1c00a46a:	f1402573          	csrr	a0,mhartid
1c00a46e:	8515                	srai	a0,a0,0x5
1c00a470:	03f57513          	andi	a0,a0,63
1c00a474:	1505                	addi	a0,a0,-31
1c00a476:	00153513          	seqz	a0,a0
1c00a47a:	8082                	ret

1c00a47c <__rt_io_end_of_flush>:
1c00a47c:	1c0017b7          	lui	a5,0x1c001
1c00a480:	1a07aa23          	sw	zero,436(a5) # 1c0011b4 <__rt_io_pending_flush>
1c00a484:	00052c23          	sw	zero,24(a0)
1c00a488:	8082                	ret

1c00a48a <__rt_io_uart_wait_req>:
1c00a48a:	1141                	addi	sp,sp,-16
1c00a48c:	c226                	sw	s1,4(sp)
1c00a48e:	84aa                	mv	s1,a0
1c00a490:	c606                	sw	ra,12(sp)
1c00a492:	c422                	sw	s0,8(sp)
1c00a494:	c04a                	sw	s2,0(sp)
1c00a496:	30047973          	csrrci	s2,mstatus,8
1c00a49a:	1c001437          	lui	s0,0x1c001
1c00a49e:	1b040413          	addi	s0,s0,432 # 1c0011b0 <__rt_io_event_current>
1c00a4a2:	4008                	lw	a0,0(s0)
1c00a4a4:	c509                	beqz	a0,1c00a4ae <__rt_io_uart_wait_req+0x24>
1c00a4a6:	833ff0ef          	jal	ra,1c009cd8 <rt_event_wait>
1c00a4aa:	00042023          	sw	zero,0(s0)
1c00a4ae:	4785                	li	a5,1
1c00a4b0:	08f48623          	sb	a5,140(s1)
1c00a4b4:	08d4c783          	lbu	a5,141(s1)
1c00a4b8:	00201737          	lui	a4,0x201
1c00a4bc:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c00a4c0:	04078793          	addi	a5,a5,64
1c00a4c4:	07da                	slli	a5,a5,0x16
1c00a4c6:	97ba                	add	a5,a5,a4
1c00a4c8:	0007a023          	sw	zero,0(a5)
1c00a4cc:	30091073          	csrw	mstatus,s2
1c00a4d0:	40b2                	lw	ra,12(sp)
1c00a4d2:	4422                	lw	s0,8(sp)
1c00a4d4:	4492                	lw	s1,4(sp)
1c00a4d6:	4902                	lw	s2,0(sp)
1c00a4d8:	0141                	addi	sp,sp,16
1c00a4da:	8082                	ret

1c00a4dc <__rt_io_start>:
1c00a4dc:	1101                	addi	sp,sp,-32
1c00a4de:	0028                	addi	a0,sp,8
1c00a4e0:	ce06                	sw	ra,28(sp)
1c00a4e2:	cc22                	sw	s0,24(sp)
1c00a4e4:	7e1000ef          	jal	ra,1c00b4c4 <rt_uart_conf_init>
1c00a4e8:	4585                	li	a1,1
1c00a4ea:	4501                	li	a0,0
1c00a4ec:	e8aff0ef          	jal	ra,1c009b76 <rt_event_alloc>
1c00a4f0:	547d                	li	s0,-1
1c00a4f2:	ed1d                	bnez	a0,1c00a530 <__rt_io_start+0x54>
1c00a4f4:	1c0017b7          	lui	a5,0x1c001
1c00a4f8:	0b07a783          	lw	a5,176(a5) # 1c0010b0 <__rt_iodev_uart_baudrate>
1c00a4fc:	842a                	mv	s0,a0
1c00a4fe:	1c001537          	lui	a0,0x1c001
1c00a502:	e3ff6597          	auipc	a1,0xe3ff6
1c00a506:	b2658593          	addi	a1,a1,-1242 # 28 <__rt_sched>
1c00a50a:	0fc50513          	addi	a0,a0,252 # 1c0010fc <__rt_io_event>
1c00a50e:	c43e                	sw	a5,8(sp)
1c00a510:	e3cff0ef          	jal	ra,1c009b4c <__rt_event_init>
1c00a514:	1c0017b7          	lui	a5,0x1c001
1c00a518:	1c07a503          	lw	a0,448(a5) # 1c0011c0 <__rt_iodev_uart_channel>
1c00a51c:	4681                	li	a3,0
1c00a51e:	4601                	li	a2,0
1c00a520:	002c                	addi	a1,sp,8
1c00a522:	050d                	addi	a0,a0,3
1c00a524:	7b1000ef          	jal	ra,1c00b4d4 <__rt_uart_open>
1c00a528:	1c0017b7          	lui	a5,0x1c001
1c00a52c:	1aa7ac23          	sw	a0,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a530:	8522                	mv	a0,s0
1c00a532:	40f2                	lw	ra,28(sp)
1c00a534:	4462                	lw	s0,24(sp)
1c00a536:	6105                	addi	sp,sp,32
1c00a538:	8082                	ret

1c00a53a <rt_event_execute.isra.2.constprop.11>:
1c00a53a:	1141                	addi	sp,sp,-16
1c00a53c:	c606                	sw	ra,12(sp)
1c00a53e:	c422                	sw	s0,8(sp)
1c00a540:	30047473          	csrrci	s0,mstatus,8
1c00a544:	4585                	li	a1,1
1c00a546:	e3ff6517          	auipc	a0,0xe3ff6
1c00a54a:	ae250513          	addi	a0,a0,-1310 # 28 <__rt_sched>
1c00a54e:	f00ff0ef          	jal	ra,1c009c4e <__rt_event_execute>
1c00a552:	30041073          	csrw	mstatus,s0
1c00a556:	40b2                	lw	ra,12(sp)
1c00a558:	4422                	lw	s0,8(sp)
1c00a55a:	0141                	addi	sp,sp,16
1c00a55c:	8082                	ret

1c00a55e <__rt_io_lock>:
1c00a55e:	1c0017b7          	lui	a5,0x1c001
1c00a562:	ffc7a783          	lw	a5,-4(a5) # 1c000ffc <__hal_debug_struct+0x10>
1c00a566:	c791                	beqz	a5,1c00a572 <__rt_io_lock+0x14>
1c00a568:	1c0017b7          	lui	a5,0x1c001
1c00a56c:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a570:	c3a1                	beqz	a5,1c00a5b0 <__rt_io_lock+0x52>
1c00a572:	7171                	addi	sp,sp,-176
1c00a574:	d706                	sw	ra,172(sp)
1c00a576:	3dd5                	jal	1c00a46a <rt_is_fc>
1c00a578:	1c0017b7          	lui	a5,0x1c001
1c00a57c:	c901                	beqz	a0,1c00a58c <__rt_io_lock+0x2e>
1c00a57e:	fcc78513          	addi	a0,a5,-52 # 1c000fcc <__rt_io_fc_lock>
1c00a582:	9b8ff0ef          	jal	ra,1c00973a <__rt_fc_lock>
1c00a586:	50ba                	lw	ra,172(sp)
1c00a588:	614d                	addi	sp,sp,176
1c00a58a:	8082                	ret
1c00a58c:	002c                	addi	a1,sp,8
1c00a58e:	fcc78513          	addi	a0,a5,-52
1c00a592:	a1aff0ef          	jal	ra,1c0097ac <__rt_fc_cluster_lock>
1c00a596:	4689                	li	a3,2
1c00a598:	00204737          	lui	a4,0x204
1c00a59c:	09c14783          	lbu	a5,156(sp)
1c00a5a0:	0ff7f793          	andi	a5,a5,255
1c00a5a4:	f3ed                	bnez	a5,1c00a586 <__rt_io_lock+0x28>
1c00a5a6:	c714                	sw	a3,8(a4)
1c00a5a8:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a5ac:	c354                	sw	a3,4(a4)
1c00a5ae:	b7fd                	j	1c00a59c <__rt_io_lock+0x3e>
1c00a5b0:	8082                	ret

1c00a5b2 <__rt_io_unlock>:
1c00a5b2:	1c0017b7          	lui	a5,0x1c001
1c00a5b6:	ffc7a783          	lw	a5,-4(a5) # 1c000ffc <__hal_debug_struct+0x10>
1c00a5ba:	c791                	beqz	a5,1c00a5c6 <__rt_io_unlock+0x14>
1c00a5bc:	1c0017b7          	lui	a5,0x1c001
1c00a5c0:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a5c4:	c3a1                	beqz	a5,1c00a604 <__rt_io_unlock+0x52>
1c00a5c6:	7171                	addi	sp,sp,-176
1c00a5c8:	d706                	sw	ra,172(sp)
1c00a5ca:	3545                	jal	1c00a46a <rt_is_fc>
1c00a5cc:	1c0017b7          	lui	a5,0x1c001
1c00a5d0:	c901                	beqz	a0,1c00a5e0 <__rt_io_unlock+0x2e>
1c00a5d2:	fcc78513          	addi	a0,a5,-52 # 1c000fcc <__rt_io_fc_lock>
1c00a5d6:	9a0ff0ef          	jal	ra,1c009776 <__rt_fc_unlock>
1c00a5da:	50ba                	lw	ra,172(sp)
1c00a5dc:	614d                	addi	sp,sp,176
1c00a5de:	8082                	ret
1c00a5e0:	002c                	addi	a1,sp,8
1c00a5e2:	fcc78513          	addi	a0,a5,-52
1c00a5e6:	9feff0ef          	jal	ra,1c0097e4 <__rt_fc_cluster_unlock>
1c00a5ea:	4689                	li	a3,2
1c00a5ec:	00204737          	lui	a4,0x204
1c00a5f0:	09c14783          	lbu	a5,156(sp)
1c00a5f4:	0ff7f793          	andi	a5,a5,255
1c00a5f8:	f3ed                	bnez	a5,1c00a5da <__rt_io_unlock+0x28>
1c00a5fa:	c714                	sw	a3,8(a4)
1c00a5fc:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a600:	c354                	sw	a3,4(a4)
1c00a602:	b7fd                	j	1c00a5f0 <__rt_io_unlock+0x3e>
1c00a604:	8082                	ret

1c00a606 <__rt_io_uart_wait_pending>:
1c00a606:	7135                	addi	sp,sp,-160
1c00a608:	cd22                	sw	s0,152(sp)
1c00a60a:	cf06                	sw	ra,156(sp)
1c00a60c:	cb26                	sw	s1,148(sp)
1c00a60e:	1c001437          	lui	s0,0x1c001
1c00a612:	1b442783          	lw	a5,436(s0) # 1c0011b4 <__rt_io_pending_flush>
1c00a616:	e39d                	bnez	a5,1c00a63c <__rt_io_uart_wait_pending+0x36>
1c00a618:	1c001437          	lui	s0,0x1c001
1c00a61c:	1b040413          	addi	s0,s0,432 # 1c0011b0 <__rt_io_event_current>
1c00a620:	4004                	lw	s1,0(s0)
1c00a622:	c881                	beqz	s1,1c00a632 <__rt_io_uart_wait_pending+0x2c>
1c00a624:	3599                	jal	1c00a46a <rt_is_fc>
1c00a626:	cd19                	beqz	a0,1c00a644 <__rt_io_uart_wait_pending+0x3e>
1c00a628:	8526                	mv	a0,s1
1c00a62a:	eaeff0ef          	jal	ra,1c009cd8 <rt_event_wait>
1c00a62e:	00042023          	sw	zero,0(s0)
1c00a632:	40fa                	lw	ra,156(sp)
1c00a634:	446a                	lw	s0,152(sp)
1c00a636:	44da                	lw	s1,148(sp)
1c00a638:	610d                	addi	sp,sp,160
1c00a63a:	8082                	ret
1c00a63c:	3f9d                	jal	1c00a5b2 <__rt_io_unlock>
1c00a63e:	3df5                	jal	1c00a53a <rt_event_execute.isra.2.constprop.11>
1c00a640:	3f39                	jal	1c00a55e <__rt_io_lock>
1c00a642:	bfc1                	j	1c00a612 <__rt_io_uart_wait_pending+0xc>
1c00a644:	f14027f3          	csrr	a5,mhartid
1c00a648:	8795                	srai	a5,a5,0x5
1c00a64a:	03f7f793          	andi	a5,a5,63
1c00a64e:	08f106a3          	sb	a5,141(sp)
1c00a652:	1c00a7b7          	lui	a5,0x1c00a
1c00a656:	48a78793          	addi	a5,a5,1162 # 1c00a48a <__rt_io_uart_wait_req>
1c00a65a:	c03e                	sw	a5,0(sp)
1c00a65c:	00010793          	mv	a5,sp
1c00a660:	4705                	li	a4,1
1c00a662:	c23e                	sw	a5,4(sp)
1c00a664:	850a                	mv	a0,sp
1c00a666:	1c0017b7          	lui	a5,0x1c001
1c00a66a:	10e7ae23          	sw	a4,284(a5) # 1c00111c <__rt_io_event+0x20>
1c00a66e:	08010623          	sb	zero,140(sp)
1c00a672:	d002                	sw	zero,32(sp)
1c00a674:	d202                	sw	zero,36(sp)
1c00a676:	a15fe0ef          	jal	ra,1c00908a <__rt_cluster_push_fc_event>
1c00a67a:	4689                	li	a3,2
1c00a67c:	00204737          	lui	a4,0x204
1c00a680:	08c14783          	lbu	a5,140(sp)
1c00a684:	0ff7f793          	andi	a5,a5,255
1c00a688:	f7cd                	bnez	a5,1c00a632 <__rt_io_uart_wait_pending+0x2c>
1c00a68a:	c714                	sw	a3,8(a4)
1c00a68c:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a690:	c354                	sw	a3,4(a4)
1c00a692:	b7fd                	j	1c00a680 <__rt_io_uart_wait_pending+0x7a>

1c00a694 <__rt_io_stop>:
1c00a694:	1141                	addi	sp,sp,-16
1c00a696:	c422                	sw	s0,8(sp)
1c00a698:	1c001437          	lui	s0,0x1c001
1c00a69c:	c606                	sw	ra,12(sp)
1c00a69e:	1b840413          	addi	s0,s0,440 # 1c0011b8 <_rt_io_uart>
1c00a6a2:	3795                	jal	1c00a606 <__rt_io_uart_wait_pending>
1c00a6a4:	4008                	lw	a0,0(s0)
1c00a6a6:	4581                	li	a1,0
1c00a6a8:	6b5000ef          	jal	ra,1c00b55c <rt_uart_close>
1c00a6ac:	40b2                	lw	ra,12(sp)
1c00a6ae:	00042023          	sw	zero,0(s0)
1c00a6b2:	4422                	lw	s0,8(sp)
1c00a6b4:	4501                	li	a0,0
1c00a6b6:	0141                	addi	sp,sp,16
1c00a6b8:	8082                	ret

1c00a6ba <__rt_io_uart_flush.constprop.10>:
1c00a6ba:	7131                	addi	sp,sp,-192
1c00a6bc:	dd22                	sw	s0,184(sp)
1c00a6be:	df06                	sw	ra,188(sp)
1c00a6c0:	db26                	sw	s1,180(sp)
1c00a6c2:	d94a                	sw	s2,176(sp)
1c00a6c4:	d74e                	sw	s3,172(sp)
1c00a6c6:	d552                	sw	s4,168(sp)
1c00a6c8:	d356                	sw	s5,164(sp)
1c00a6ca:	1c001437          	lui	s0,0x1c001
1c00a6ce:	1b442783          	lw	a5,436(s0) # 1c0011b4 <__rt_io_pending_flush>
1c00a6d2:	1b440a13          	addi	s4,s0,436
1c00a6d6:	e7bd                	bnez	a5,1c00a744 <__rt_io_uart_flush.constprop.10+0x8a>
1c00a6d8:	1c0014b7          	lui	s1,0x1c001
1c00a6dc:	fec48793          	addi	a5,s1,-20 # 1c000fec <__hal_debug_struct>
1c00a6e0:	4f80                	lw	s0,24(a5)
1c00a6e2:	fec48a93          	addi	s5,s1,-20
1c00a6e6:	c431                	beqz	s0,1c00a732 <__rt_io_uart_flush.constprop.10+0x78>
1c00a6e8:	3349                	jal	1c00a46a <rt_is_fc>
1c00a6ea:	1c0017b7          	lui	a5,0x1c001
1c00a6ee:	1b87a903          	lw	s2,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a6f2:	1c0019b7          	lui	s3,0x1c001
1c00a6f6:	cd29                	beqz	a0,1c00a750 <__rt_io_uart_flush.constprop.10+0x96>
1c00a6f8:	1c00a5b7          	lui	a1,0x1c00a
1c00a6fc:	4785                	li	a5,1
1c00a6fe:	fec48613          	addi	a2,s1,-20
1c00a702:	47c58593          	addi	a1,a1,1148 # 1c00a47c <__rt_io_end_of_flush>
1c00a706:	4501                	li	a0,0
1c00a708:	00fa2023          	sw	a5,0(s4)
1c00a70c:	ce2ff0ef          	jal	ra,1c009bee <rt_event_get>
1c00a710:	00492583          	lw	a1,4(s2)
1c00a714:	87aa                	mv	a5,a0
1c00a716:	4701                	li	a4,0
1c00a718:	0586                	slli	a1,a1,0x1
1c00a71a:	86a2                	mv	a3,s0
1c00a71c:	00898613          	addi	a2,s3,8 # 1c001008 <__hal_debug_struct+0x1c>
1c00a720:	0585                	addi	a1,a1,1
1c00a722:	4501                	li	a0,0
1c00a724:	b75ff0ef          	jal	ra,1c00a298 <rt_periph_copy>
1c00a728:	3569                	jal	1c00a5b2 <__rt_io_unlock>
1c00a72a:	000a2783          	lw	a5,0(s4)
1c00a72e:	ef99                	bnez	a5,1c00a74c <__rt_io_uart_flush.constprop.10+0x92>
1c00a730:	353d                	jal	1c00a55e <__rt_io_lock>
1c00a732:	50fa                	lw	ra,188(sp)
1c00a734:	546a                	lw	s0,184(sp)
1c00a736:	54da                	lw	s1,180(sp)
1c00a738:	594a                	lw	s2,176(sp)
1c00a73a:	59ba                	lw	s3,172(sp)
1c00a73c:	5a2a                	lw	s4,168(sp)
1c00a73e:	5a9a                	lw	s5,164(sp)
1c00a740:	6129                	addi	sp,sp,192
1c00a742:	8082                	ret
1c00a744:	35bd                	jal	1c00a5b2 <__rt_io_unlock>
1c00a746:	3bd5                	jal	1c00a53a <rt_event_execute.isra.2.constprop.11>
1c00a748:	3d19                	jal	1c00a55e <__rt_io_lock>
1c00a74a:	b751                	j	1c00a6ce <__rt_io_uart_flush.constprop.10+0x14>
1c00a74c:	33fd                	jal	1c00a53a <rt_event_execute.isra.2.constprop.11>
1c00a74e:	bff1                	j	1c00a72a <__rt_io_uart_flush.constprop.10+0x70>
1c00a750:	0054                	addi	a3,sp,4
1c00a752:	8622                	mv	a2,s0
1c00a754:	00898593          	addi	a1,s3,8
1c00a758:	854a                	mv	a0,s2
1c00a75a:	64d000ef          	jal	ra,1c00b5a6 <rt_uart_cluster_write>
1c00a75e:	4689                	li	a3,2
1c00a760:	00204737          	lui	a4,0x204
1c00a764:	09c14783          	lbu	a5,156(sp)
1c00a768:	0ff7f793          	andi	a5,a5,255
1c00a76c:	c781                	beqz	a5,1c00a774 <__rt_io_uart_flush.constprop.10+0xba>
1c00a76e:	000aac23          	sw	zero,24(s5)
1c00a772:	b7c1                	j	1c00a732 <__rt_io_uart_flush.constprop.10+0x78>
1c00a774:	c714                	sw	a3,8(a4)
1c00a776:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a77a:	c354                	sw	a3,4(a4)
1c00a77c:	b7e5                	j	1c00a764 <__rt_io_uart_flush.constprop.10+0xaa>

1c00a77e <memset>:
1c00a77e:	962a                	add	a2,a2,a0
1c00a780:	87aa                	mv	a5,a0
1c00a782:	00c79363          	bne	a5,a2,1c00a788 <memset+0xa>
1c00a786:	8082                	ret
1c00a788:	0785                	addi	a5,a5,1
1c00a78a:	feb78fa3          	sb	a1,-1(a5)
1c00a78e:	bfd5                	j	1c00a782 <memset+0x4>

1c00a790 <memcpy>:
1c00a790:	962a                	add	a2,a2,a0
1c00a792:	87aa                	mv	a5,a0
1c00a794:	00c79363          	bne	a5,a2,1c00a79a <memcpy+0xa>
1c00a798:	8082                	ret
1c00a79a:	0585                	addi	a1,a1,1
1c00a79c:	fff5c703          	lbu	a4,-1(a1)
1c00a7a0:	0785                	addi	a5,a5,1
1c00a7a2:	fee78fa3          	sb	a4,-1(a5)
1c00a7a6:	b7fd                	j	1c00a794 <memcpy+0x4>

1c00a7a8 <memmove>:
1c00a7a8:	40b507b3          	sub	a5,a0,a1
1c00a7ac:	00c7e763          	bltu	a5,a2,1c00a7ba <memmove+0x12>
1c00a7b0:	962e                	add	a2,a2,a1
1c00a7b2:	87aa                	mv	a5,a0
1c00a7b4:	00c59e63          	bne	a1,a2,1c00a7d0 <memmove+0x28>
1c00a7b8:	8082                	ret
1c00a7ba:	167d                	addi	a2,a2,-1
1c00a7bc:	00c587b3          	add	a5,a1,a2
1c00a7c0:	0007c703          	lbu	a4,0(a5)
1c00a7c4:	00c507b3          	add	a5,a0,a2
1c00a7c8:	00e78023          	sb	a4,0(a5)
1c00a7cc:	f67d                	bnez	a2,1c00a7ba <memmove+0x12>
1c00a7ce:	8082                	ret
1c00a7d0:	0005c703          	lbu	a4,0(a1)
1c00a7d4:	0785                	addi	a5,a5,1
1c00a7d6:	0585                	addi	a1,a1,1
1c00a7d8:	fee78fa3          	sb	a4,-1(a5)
1c00a7dc:	bfe1                	j	1c00a7b4 <memmove+0xc>

1c00a7de <strchr>:
1c00a7de:	0ff5f593          	andi	a1,a1,255
1c00a7e2:	00054783          	lbu	a5,0(a0)
1c00a7e6:	00b78563          	beq	a5,a1,1c00a7f0 <strchr+0x12>
1c00a7ea:	e781                	bnez	a5,1c00a7f2 <strchr+0x14>
1c00a7ec:	c191                	beqz	a1,1c00a7f0 <strchr+0x12>
1c00a7ee:	4501                	li	a0,0
1c00a7f0:	8082                	ret
1c00a7f2:	0505                	addi	a0,a0,1
1c00a7f4:	b7fd                	j	1c00a7e2 <strchr+0x4>

1c00a7f6 <__rt_putc_debug_bridge>:
1c00a7f6:	1141                	addi	sp,sp,-16
1c00a7f8:	c422                	sw	s0,8(sp)
1c00a7fa:	1c001437          	lui	s0,0x1c001
1c00a7fe:	c226                	sw	s1,4(sp)
1c00a800:	c606                	sw	ra,12(sp)
1c00a802:	84aa                	mv	s1,a0
1c00a804:	fec40413          	addi	s0,s0,-20 # 1c000fec <__hal_debug_struct>
1c00a808:	485c                	lw	a5,20(s0)
1c00a80a:	c791                	beqz	a5,1c00a816 <__rt_putc_debug_bridge+0x20>
1c00a80c:	06400513          	li	a0,100
1c00a810:	907ff0ef          	jal	ra,1c00a116 <rt_time_wait_us>
1c00a814:	bfd5                	j	1c00a808 <__rt_putc_debug_bridge+0x12>
1c00a816:	4c1c                	lw	a5,24(s0)
1c00a818:	00178713          	addi	a4,a5,1
1c00a81c:	97a2                	add	a5,a5,s0
1c00a81e:	00978e23          	sb	s1,28(a5)
1c00a822:	cc18                	sw	a4,24(s0)
1c00a824:	4c14                	lw	a3,24(s0)
1c00a826:	08000793          	li	a5,128
1c00a82a:	00f68563          	beq	a3,a5,1c00a834 <__rt_putc_debug_bridge+0x3e>
1c00a82e:	47a9                	li	a5,10
1c00a830:	00f49663          	bne	s1,a5,1c00a83c <__rt_putc_debug_bridge+0x46>
1c00a834:	c701                	beqz	a4,1c00a83c <__rt_putc_debug_bridge+0x46>
1c00a836:	c858                	sw	a4,20(s0)
1c00a838:	00042c23          	sw	zero,24(s0)
1c00a83c:	4c1c                	lw	a5,24(s0)
1c00a83e:	e799                	bnez	a5,1c00a84c <__rt_putc_debug_bridge+0x56>
1c00a840:	4422                	lw	s0,8(sp)
1c00a842:	40b2                	lw	ra,12(sp)
1c00a844:	4492                	lw	s1,4(sp)
1c00a846:	0141                	addi	sp,sp,16
1c00a848:	946ff06f          	j	1c00998e <__rt_bridge_printf_flush>
1c00a84c:	40b2                	lw	ra,12(sp)
1c00a84e:	4422                	lw	s0,8(sp)
1c00a850:	4492                	lw	s1,4(sp)
1c00a852:	0141                	addi	sp,sp,16
1c00a854:	8082                	ret

1c00a856 <__rt_putc_uart>:
1c00a856:	1101                	addi	sp,sp,-32
1c00a858:	c62a                	sw	a0,12(sp)
1c00a85a:	ce06                	sw	ra,28(sp)
1c00a85c:	336d                	jal	1c00a606 <__rt_io_uart_wait_pending>
1c00a85e:	1c0017b7          	lui	a5,0x1c001
1c00a862:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c00a866:	4f94                	lw	a3,24(a5)
1c00a868:	4532                	lw	a0,12(sp)
1c00a86a:	00168713          	addi	a4,a3,1
1c00a86e:	cf98                	sw	a4,24(a5)
1c00a870:	97b6                	add	a5,a5,a3
1c00a872:	00a78e23          	sb	a0,28(a5)
1c00a876:	08000793          	li	a5,128
1c00a87a:	00f70563          	beq	a4,a5,1c00a884 <__rt_putc_uart+0x2e>
1c00a87e:	47a9                	li	a5,10
1c00a880:	00f51563          	bne	a0,a5,1c00a88a <__rt_putc_uart+0x34>
1c00a884:	40f2                	lw	ra,28(sp)
1c00a886:	6105                	addi	sp,sp,32
1c00a888:	bd0d                	j	1c00a6ba <__rt_io_uart_flush.constprop.10>
1c00a88a:	40f2                	lw	ra,28(sp)
1c00a88c:	6105                	addi	sp,sp,32
1c00a88e:	8082                	ret

1c00a890 <tfp_putc.isra.8>:
1c00a890:	1c0017b7          	lui	a5,0x1c001
1c00a894:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a898:	c391                	beqz	a5,1c00a89c <tfp_putc.isra.8+0xc>
1c00a89a:	bf75                	j	1c00a856 <__rt_putc_uart>
1c00a89c:	1c0017b7          	lui	a5,0x1c001
1c00a8a0:	ffc7a783          	lw	a5,-4(a5) # 1c000ffc <__hal_debug_struct+0x10>
1c00a8a4:	c395                	beqz	a5,1c00a8c8 <tfp_putc.isra.8+0x38>
1c00a8a6:	6689                	lui	a3,0x2
1c00a8a8:	f14027f3          	csrr	a5,mhartid
1c00a8ac:	f8068693          	addi	a3,a3,-128 # 1f80 <_l1_preload_size+0x770>
1c00a8b0:	00379713          	slli	a4,a5,0x3
1c00a8b4:	078a                	slli	a5,a5,0x2
1c00a8b6:	0ff77713          	andi	a4,a4,255
1c00a8ba:	8ff5                	and	a5,a5,a3
1c00a8bc:	97ba                	add	a5,a5,a4
1c00a8be:	1a10f737          	lui	a4,0x1a10f
1c00a8c2:	97ba                	add	a5,a5,a4
1c00a8c4:	c388                	sw	a0,0(a5)
1c00a8c6:	8082                	ret
1c00a8c8:	b73d                	j	1c00a7f6 <__rt_putc_debug_bridge>

1c00a8ca <puts>:
1c00a8ca:	1141                	addi	sp,sp,-16
1c00a8cc:	c422                	sw	s0,8(sp)
1c00a8ce:	c606                	sw	ra,12(sp)
1c00a8d0:	842a                	mv	s0,a0
1c00a8d2:	3171                	jal	1c00a55e <__rt_io_lock>
1c00a8d4:	00044503          	lbu	a0,0(s0)
1c00a8d8:	c501                	beqz	a0,1c00a8e0 <puts+0x16>
1c00a8da:	3f5d                	jal	1c00a890 <tfp_putc.isra.8>
1c00a8dc:	0405                	addi	s0,s0,1
1c00a8de:	bfdd                	j	1c00a8d4 <puts+0xa>
1c00a8e0:	4529                	li	a0,10
1c00a8e2:	377d                	jal	1c00a890 <tfp_putc.isra.8>
1c00a8e4:	31f9                	jal	1c00a5b2 <__rt_io_unlock>
1c00a8e6:	40b2                	lw	ra,12(sp)
1c00a8e8:	4422                	lw	s0,8(sp)
1c00a8ea:	4501                	li	a0,0
1c00a8ec:	0141                	addi	sp,sp,16
1c00a8ee:	8082                	ret

1c00a8f0 <fputc_locked>:
1c00a8f0:	1141                	addi	sp,sp,-16
1c00a8f2:	c422                	sw	s0,8(sp)
1c00a8f4:	842a                	mv	s0,a0
1c00a8f6:	0ff57513          	andi	a0,a0,255
1c00a8fa:	c606                	sw	ra,12(sp)
1c00a8fc:	3f51                	jal	1c00a890 <tfp_putc.isra.8>
1c00a8fe:	8522                	mv	a0,s0
1c00a900:	40b2                	lw	ra,12(sp)
1c00a902:	4422                	lw	s0,8(sp)
1c00a904:	0141                	addi	sp,sp,16
1c00a906:	8082                	ret

1c00a908 <_prf_locked>:
1c00a908:	1101                	addi	sp,sp,-32
1c00a90a:	ce06                	sw	ra,28(sp)
1c00a90c:	c02a                	sw	a0,0(sp)
1c00a90e:	c62e                	sw	a1,12(sp)
1c00a910:	c432                	sw	a2,8(sp)
1c00a912:	c236                	sw	a3,4(sp)
1c00a914:	31a9                	jal	1c00a55e <__rt_io_lock>
1c00a916:	4692                	lw	a3,4(sp)
1c00a918:	4622                	lw	a2,8(sp)
1c00a91a:	45b2                	lw	a1,12(sp)
1c00a91c:	4502                	lw	a0,0(sp)
1c00a91e:	2ae9                	jal	1c00aaf8 <_prf>
1c00a920:	c02a                	sw	a0,0(sp)
1c00a922:	3941                	jal	1c00a5b2 <__rt_io_unlock>
1c00a924:	40f2                	lw	ra,28(sp)
1c00a926:	4502                	lw	a0,0(sp)
1c00a928:	6105                	addi	sp,sp,32
1c00a92a:	8082                	ret

1c00a92c <exit>:
1c00a92c:	1141                	addi	sp,sp,-16
1c00a92e:	c606                	sw	ra,12(sp)
1c00a930:	c422                	sw	s0,8(sp)
1c00a932:	842a                	mv	s0,a0
1c00a934:	85aff0ef          	jal	ra,1c00998e <__rt_bridge_printf_flush>
1c00a938:	80000537          	lui	a0,0x80000
1c00a93c:	1c0017b7          	lui	a5,0x1c001
1c00a940:	8c49                	or	s0,s0,a0
1c00a942:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c00a946:	c7c0                	sw	s0,12(a5)
1c00a948:	816ff0ef          	jal	ra,1c00995e <__rt_bridge_send_notif>
1c00a94c:	1a1047b7          	lui	a5,0x1a104
1c00a950:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa10288c>
1c00a954:	a001                	j	1c00a954 <exit+0x28>

1c00a956 <abort>:
1c00a956:	1141                	addi	sp,sp,-16
1c00a958:	557d                	li	a0,-1
1c00a95a:	c606                	sw	ra,12(sp)
1c00a95c:	3fc1                	jal	1c00a92c <exit>

1c00a95e <__rt_io_init>:
1c00a95e:	1c0017b7          	lui	a5,0x1c001
1c00a962:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__rt_io_fc_lock>
1c00a966:	0007a223          	sw	zero,4(a5)
1c00a96a:	0007a023          	sw	zero,0(a5)
1c00a96e:	0007a623          	sw	zero,12(a5)
1c00a972:	1c0017b7          	lui	a5,0x1c001
1c00a976:	1a07ac23          	sw	zero,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a97a:	1c0017b7          	lui	a5,0x1c001
1c00a97e:	1a07a823          	sw	zero,432(a5) # 1c0011b0 <__rt_io_event_current>
1c00a982:	1c0017b7          	lui	a5,0x1c001
1c00a986:	1bc7a703          	lw	a4,444(a5) # 1c0011bc <__rt_iodev>
1c00a98a:	4785                	li	a5,1
1c00a98c:	02f71e63          	bne	a4,a5,1c00a9c8 <__rt_io_init+0x6a>
1c00a990:	1c00a5b7          	lui	a1,0x1c00a
1c00a994:	1141                	addi	sp,sp,-16
1c00a996:	4601                	li	a2,0
1c00a998:	4dc58593          	addi	a1,a1,1244 # 1c00a4dc <__rt_io_start>
1c00a99c:	4501                	li	a0,0
1c00a99e:	c606                	sw	ra,12(sp)
1c00a9a0:	d07fe0ef          	jal	ra,1c0096a6 <__rt_cbsys_add>
1c00a9a4:	1c00a5b7          	lui	a1,0x1c00a
1c00a9a8:	69458593          	addi	a1,a1,1684 # 1c00a694 <__rt_io_stop>
1c00a9ac:	4601                	li	a2,0
1c00a9ae:	4505                	li	a0,1
1c00a9b0:	cf7fe0ef          	jal	ra,1c0096a6 <__rt_cbsys_add>
1c00a9b4:	40b2                	lw	ra,12(sp)
1c00a9b6:	1c0017b7          	lui	a5,0x1c001
1c00a9ba:	1a07aa23          	sw	zero,436(a5) # 1c0011b4 <__rt_io_pending_flush>
1c00a9be:	4585                	li	a1,1
1c00a9c0:	4501                	li	a0,0
1c00a9c2:	0141                	addi	sp,sp,16
1c00a9c4:	9b2ff06f          	j	1c009b76 <rt_event_alloc>
1c00a9c8:	8082                	ret

1c00a9ca <printf>:
1c00a9ca:	7139                	addi	sp,sp,-64
1c00a9cc:	d432                	sw	a2,40(sp)
1c00a9ce:	862a                	mv	a2,a0
1c00a9d0:	1c00b537          	lui	a0,0x1c00b
1c00a9d4:	d22e                	sw	a1,36(sp)
1c00a9d6:	d636                	sw	a3,44(sp)
1c00a9d8:	4589                	li	a1,2
1c00a9da:	1054                	addi	a3,sp,36
1c00a9dc:	8f050513          	addi	a0,a0,-1808 # 1c00a8f0 <fputc_locked>
1c00a9e0:	ce06                	sw	ra,28(sp)
1c00a9e2:	d83a                	sw	a4,48(sp)
1c00a9e4:	da3e                	sw	a5,52(sp)
1c00a9e6:	dc42                	sw	a6,56(sp)
1c00a9e8:	de46                	sw	a7,60(sp)
1c00a9ea:	c636                	sw	a3,12(sp)
1c00a9ec:	3f31                	jal	1c00a908 <_prf_locked>
1c00a9ee:	40f2                	lw	ra,28(sp)
1c00a9f0:	6121                	addi	sp,sp,64
1c00a9f2:	8082                	ret

1c00a9f4 <_to_x>:
1c00a9f4:	872a                	mv	a4,a0
1c00a9f6:	87aa                	mv	a5,a0
1c00a9f8:	4325                	li	t1,9
1c00a9fa:	02c5f8b3          	remu	a7,a1,a2
1c00a9fe:	02700513          	li	a0,39
1c00aa02:	02c5d5b3          	divu	a1,a1,a2
1c00aa06:	0ff8f813          	andi	a6,a7,255
1c00aa0a:	01136363          	bltu	t1,a7,1c00aa10 <_to_x+0x1c>
1c00aa0e:	4501                	li	a0,0
1c00aa10:	03080813          	addi	a6,a6,48
1c00aa14:	0785                	addi	a5,a5,1
1c00aa16:	9542                	add	a0,a0,a6
1c00aa18:	fea78fa3          	sb	a0,-1(a5)
1c00aa1c:	fdf9                	bnez	a1,1c00a9fa <_to_x+0x6>
1c00aa1e:	03000613          	li	a2,48
1c00aa22:	40e78533          	sub	a0,a5,a4
1c00aa26:	00d54863          	blt	a0,a3,1c00aa36 <_to_x+0x42>
1c00aa2a:	00078023          	sb	zero,0(a5)
1c00aa2e:	17fd                	addi	a5,a5,-1
1c00aa30:	00f76763          	bltu	a4,a5,1c00aa3e <_to_x+0x4a>
1c00aa34:	8082                	ret
1c00aa36:	0785                	addi	a5,a5,1
1c00aa38:	fec78fa3          	sb	a2,-1(a5)
1c00aa3c:	b7dd                	j	1c00aa22 <_to_x+0x2e>
1c00aa3e:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10d7ec>
1c00aa42:	0007c683          	lbu	a3,0(a5)
1c00aa46:	0705                	addi	a4,a4,1
1c00aa48:	00c78023          	sb	a2,0(a5)
1c00aa4c:	fed70fa3          	sb	a3,-1(a4)
1c00aa50:	17fd                	addi	a5,a5,-1
1c00aa52:	bff9                	j	1c00aa30 <_to_x+0x3c>

1c00aa54 <_rlrshift>:
1c00aa54:	411c                	lw	a5,0(a0)
1c00aa56:	4154                	lw	a3,4(a0)
1c00aa58:	0017f713          	andi	a4,a5,1
1c00aa5c:	01f69613          	slli	a2,a3,0x1f
1c00aa60:	8385                	srli	a5,a5,0x1
1c00aa62:	8fd1                	or	a5,a5,a2
1c00aa64:	97ba                	add	a5,a5,a4
1c00aa66:	8285                	srli	a3,a3,0x1
1c00aa68:	00e7b733          	sltu	a4,a5,a4
1c00aa6c:	9736                	add	a4,a4,a3
1c00aa6e:	c11c                	sw	a5,0(a0)
1c00aa70:	c158                	sw	a4,4(a0)
1c00aa72:	8082                	ret

1c00aa74 <_ldiv5>:
1c00aa74:	4118                	lw	a4,0(a0)
1c00aa76:	4154                	lw	a3,4(a0)
1c00aa78:	4615                	li	a2,5
1c00aa7a:	00270793          	addi	a5,a4,2
1c00aa7e:	00e7b733          	sltu	a4,a5,a4
1c00aa82:	9736                	add	a4,a4,a3
1c00aa84:	02c755b3          	divu	a1,a4,a2
1c00aa88:	02b606b3          	mul	a3,a2,a1
1c00aa8c:	8f15                	sub	a4,a4,a3
1c00aa8e:	01d71693          	slli	a3,a4,0x1d
1c00aa92:	0037d713          	srli	a4,a5,0x3
1c00aa96:	8f55                	or	a4,a4,a3
1c00aa98:	02c75733          	divu	a4,a4,a2
1c00aa9c:	01d75693          	srli	a3,a4,0x1d
1c00aaa0:	070e                	slli	a4,a4,0x3
1c00aaa2:	95b6                	add	a1,a1,a3
1c00aaa4:	02e606b3          	mul	a3,a2,a4
1c00aaa8:	8f95                	sub	a5,a5,a3
1c00aaaa:	02c7d7b3          	divu	a5,a5,a2
1c00aaae:	973e                	add	a4,a4,a5
1c00aab0:	00f737b3          	sltu	a5,a4,a5
1c00aab4:	97ae                	add	a5,a5,a1
1c00aab6:	c118                	sw	a4,0(a0)
1c00aab8:	c15c                	sw	a5,4(a0)
1c00aaba:	8082                	ret

1c00aabc <_get_digit>:
1c00aabc:	419c                	lw	a5,0(a1)
1c00aabe:	03000713          	li	a4,48
1c00aac2:	02f05863          	blez	a5,1c00aaf2 <_get_digit+0x36>
1c00aac6:	17fd                	addi	a5,a5,-1
1c00aac8:	4114                	lw	a3,0(a0)
1c00aaca:	c19c                	sw	a5,0(a1)
1c00aacc:	415c                	lw	a5,4(a0)
1c00aace:	4729                	li	a4,10
1c00aad0:	02d70633          	mul	a2,a4,a3
1c00aad4:	02f707b3          	mul	a5,a4,a5
1c00aad8:	c110                	sw	a2,0(a0)
1c00aada:	02d73733          	mulhu	a4,a4,a3
1c00aade:	100006b7          	lui	a3,0x10000
1c00aae2:	16fd                	addi	a3,a3,-1
1c00aae4:	97ba                	add	a5,a5,a4
1c00aae6:	01c7d713          	srli	a4,a5,0x1c
1c00aaea:	8ff5                	and	a5,a5,a3
1c00aaec:	03070713          	addi	a4,a4,48
1c00aaf0:	c15c                	sw	a5,4(a0)
1c00aaf2:	0ff77513          	andi	a0,a4,255
1c00aaf6:	8082                	ret

1c00aaf8 <_prf>:
1c00aaf8:	714d                	addi	sp,sp,-336
1c00aafa:	14912223          	sw	s1,324(sp)
1c00aafe:	13312e23          	sw	s3,316(sp)
1c00ab02:	13812423          	sw	s8,296(sp)
1c00ab06:	14112623          	sw	ra,332(sp)
1c00ab0a:	14812423          	sw	s0,328(sp)
1c00ab0e:	15212023          	sw	s2,320(sp)
1c00ab12:	13412c23          	sw	s4,312(sp)
1c00ab16:	13512a23          	sw	s5,308(sp)
1c00ab1a:	13612823          	sw	s6,304(sp)
1c00ab1e:	13712623          	sw	s7,300(sp)
1c00ab22:	13912223          	sw	s9,292(sp)
1c00ab26:	13a12023          	sw	s10,288(sp)
1c00ab2a:	11b12e23          	sw	s11,284(sp)
1c00ab2e:	cc2a                	sw	a0,24(sp)
1c00ab30:	ce2e                	sw	a1,28(sp)
1c00ab32:	84b2                	mv	s1,a2
1c00ab34:	8c36                	mv	s8,a3
1c00ab36:	4981                	li	s3,0
1c00ab38:	0004c503          	lbu	a0,0(s1)
1c00ab3c:	00148b93          	addi	s7,s1,1
1c00ab40:	cd01                	beqz	a0,1c00ab58 <_prf+0x60>
1c00ab42:	02500793          	li	a5,37
1c00ab46:	14f50a63          	beq	a0,a5,1c00ac9a <_prf+0x1a2>
1c00ab4a:	45f2                	lw	a1,28(sp)
1c00ab4c:	4762                	lw	a4,24(sp)
1c00ab4e:	9702                	jalr	a4
1c00ab50:	57fd                	li	a5,-1
1c00ab52:	04f51063          	bne	a0,a5,1c00ab92 <_prf+0x9a>
1c00ab56:	59fd                	li	s3,-1
1c00ab58:	14c12083          	lw	ra,332(sp)
1c00ab5c:	14812403          	lw	s0,328(sp)
1c00ab60:	854e                	mv	a0,s3
1c00ab62:	14412483          	lw	s1,324(sp)
1c00ab66:	14012903          	lw	s2,320(sp)
1c00ab6a:	13c12983          	lw	s3,316(sp)
1c00ab6e:	13812a03          	lw	s4,312(sp)
1c00ab72:	13412a83          	lw	s5,308(sp)
1c00ab76:	13012b03          	lw	s6,304(sp)
1c00ab7a:	12c12b83          	lw	s7,300(sp)
1c00ab7e:	12812c03          	lw	s8,296(sp)
1c00ab82:	12412c83          	lw	s9,292(sp)
1c00ab86:	12012d03          	lw	s10,288(sp)
1c00ab8a:	11c12d83          	lw	s11,284(sp)
1c00ab8e:	6171                	addi	sp,sp,336
1c00ab90:	8082                	ret
1c00ab92:	0985                	addi	s3,s3,1
1c00ab94:	8a62                	mv	s4,s8
1c00ab96:	84de                	mv	s1,s7
1c00ab98:	8c52                	mv	s8,s4
1c00ab9a:	bf79                	j	1c00ab38 <_prf+0x40>
1c00ab9c:	0f2a8663          	beq	s5,s2,1c00ac88 <_prf+0x190>
1c00aba0:	0d596963          	bltu	s2,s5,1c00ac72 <_prf+0x17a>
1c00aba4:	fa0a8ae3          	beqz	s5,1c00ab58 <_prf+0x60>
1c00aba8:	0dba8e63          	beq	s5,s11,1c00ac84 <_prf+0x18c>
1c00abac:	8ba6                	mv	s7,s1
1c00abae:	001b8493          	addi	s1,s7,1
1c00abb2:	fff4ca83          	lbu	s5,-1(s1)
1c00abb6:	1c0007b7          	lui	a5,0x1c000
1c00abba:	67078513          	addi	a0,a5,1648 # 1c000670 <__DTOR_END__+0x384>
1c00abbe:	85d6                	mv	a1,s5
1c00abc0:	c1fff0ef          	jal	ra,1c00a7de <strchr>
1c00abc4:	fd61                	bnez	a0,1c00ab9c <_prf+0xa4>
1c00abc6:	02a00693          	li	a3,42
1c00abca:	0eda9a63          	bne	s5,a3,1c00acbe <_prf+0x1c6>
1c00abce:	000c2903          	lw	s2,0(s8)
1c00abd2:	004c0693          	addi	a3,s8,4
1c00abd6:	00095663          	bgez	s2,1c00abe2 <_prf+0xea>
1c00abda:	4705                	li	a4,1
1c00abdc:	41200933          	neg	s2,s2
1c00abe0:	c63a                	sw	a4,12(sp)
1c00abe2:	0004ca83          	lbu	s5,0(s1)
1c00abe6:	8c36                	mv	s8,a3
1c00abe8:	002b8493          	addi	s1,s7,2
1c00abec:	0c800713          	li	a4,200
1c00abf0:	01277463          	bleu	s2,a4,1c00abf8 <_prf+0x100>
1c00abf4:	0c800913          	li	s2,200
1c00abf8:	02e00693          	li	a3,46
1c00abfc:	5d7d                	li	s10,-1
1c00abfe:	02da9463          	bne	s5,a3,1c00ac26 <_prf+0x12e>
1c00ac02:	0004c703          	lbu	a4,0(s1)
1c00ac06:	02a00793          	li	a5,42
1c00ac0a:	10f71063          	bne	a4,a5,1c00ad0a <_prf+0x212>
1c00ac0e:	000c2d03          	lw	s10,0(s8)
1c00ac12:	0485                	addi	s1,s1,1
1c00ac14:	0c11                	addi	s8,s8,4
1c00ac16:	0c800793          	li	a5,200
1c00ac1a:	01a7d363          	ble	s10,a5,1c00ac20 <_prf+0x128>
1c00ac1e:	5d7d                	li	s10,-1
1c00ac20:	0004ca83          	lbu	s5,0(s1)
1c00ac24:	0485                	addi	s1,s1,1
1c00ac26:	1c0007b7          	lui	a5,0x1c000
1c00ac2a:	85d6                	mv	a1,s5
1c00ac2c:	67878513          	addi	a0,a5,1656 # 1c000678 <__DTOR_END__+0x38c>
1c00ac30:	bafff0ef          	jal	ra,1c00a7de <strchr>
1c00ac34:	c501                	beqz	a0,1c00ac3c <_prf+0x144>
1c00ac36:	0004ca83          	lbu	s5,0(s1)
1c00ac3a:	0485                	addi	s1,s1,1
1c00ac3c:	06700693          	li	a3,103
1c00ac40:	1356c263          	blt	a3,s5,1c00ad64 <_prf+0x26c>
1c00ac44:	06500693          	li	a3,101
1c00ac48:	1edadd63          	ble	a3,s5,1c00ae42 <_prf+0x34a>
1c00ac4c:	04700693          	li	a3,71
1c00ac50:	0d56c163          	blt	a3,s5,1c00ad12 <_prf+0x21a>
1c00ac54:	04500693          	li	a3,69
1c00ac58:	1edad563          	ble	a3,s5,1c00ae42 <_prf+0x34a>
1c00ac5c:	ee0a8ee3          	beqz	s5,1c00ab58 <_prf+0x60>
1c00ac60:	02500713          	li	a4,37
1c00ac64:	68ea8263          	beq	s5,a4,1c00b2e8 <_prf+0x7f0>
1c00ac68:	0c800713          	li	a4,200
1c00ac6c:	69575763          	ble	s5,a4,1c00b2fa <_prf+0x802>
1c00ac70:	b5dd                	j	1c00ab56 <_prf+0x5e>
1c00ac72:	034a8163          	beq	s5,s4,1c00ac94 <_prf+0x19c>
1c00ac76:	016a8b63          	beq	s5,s6,1c00ac8c <_prf+0x194>
1c00ac7a:	f3aa99e3          	bne	s5,s10,1c00abac <_prf+0xb4>
1c00ac7e:	4785                	li	a5,1
1c00ac80:	ca3e                	sw	a5,20(sp)
1c00ac82:	b72d                	j	1c00abac <_prf+0xb4>
1c00ac84:	4405                	li	s0,1
1c00ac86:	b71d                	j	1c00abac <_prf+0xb4>
1c00ac88:	4c85                	li	s9,1
1c00ac8a:	b70d                	j	1c00abac <_prf+0xb4>
1c00ac8c:	03000713          	li	a4,48
1c00ac90:	c83a                	sw	a4,16(sp)
1c00ac92:	bf29                	j	1c00abac <_prf+0xb4>
1c00ac94:	4785                	li	a5,1
1c00ac96:	c63e                	sw	a5,12(sp)
1c00ac98:	bf11                	j	1c00abac <_prf+0xb4>
1c00ac9a:	02000713          	li	a4,32
1c00ac9e:	c83a                	sw	a4,16(sp)
1c00aca0:	4401                	li	s0,0
1c00aca2:	ca02                	sw	zero,20(sp)
1c00aca4:	c602                	sw	zero,12(sp)
1c00aca6:	4c81                	li	s9,0
1c00aca8:	02300913          	li	s2,35
1c00acac:	02d00a13          	li	s4,45
1c00acb0:	03000b13          	li	s6,48
1c00acb4:	02b00d13          	li	s10,43
1c00acb8:	02000d93          	li	s11,32
1c00acbc:	bdcd                	j	1c00abae <_prf+0xb6>
1c00acbe:	fd0a8693          	addi	a3,s5,-48
1c00acc2:	4625                	li	a2,9
1c00acc4:	4901                	li	s2,0
1c00acc6:	45a9                	li	a1,10
1c00acc8:	f2d662e3          	bltu	a2,a3,1c00abec <_prf+0xf4>
1c00accc:	000bc683          	lbu	a3,0(s7)
1c00acd0:	001b8493          	addi	s1,s7,1
1c00acd4:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xfff17e4>
1c00acd8:	8ab6                	mv	s5,a3
1c00acda:	f0e669e3          	bltu	a2,a4,1c00abec <_prf+0xf4>
1c00acde:	02b90933          	mul	s2,s2,a1
1c00ace2:	8ba6                	mv	s7,s1
1c00ace4:	9936                	add	s2,s2,a3
1c00ace6:	fd090913          	addi	s2,s2,-48
1c00acea:	b7cd                	j	1c00accc <_prf+0x1d4>
1c00acec:	02ad0733          	mul	a4,s10,a0
1c00acf0:	84ae                	mv	s1,a1
1c00acf2:	973e                	add	a4,a4,a5
1c00acf4:	fd070d13          	addi	s10,a4,-48
1c00acf8:	0004c783          	lbu	a5,0(s1)
1c00acfc:	00148593          	addi	a1,s1,1
1c00ad00:	fd078613          	addi	a2,a5,-48
1c00ad04:	fec6f4e3          	bleu	a2,a3,1c00acec <_prf+0x1f4>
1c00ad08:	b739                	j	1c00ac16 <_prf+0x11e>
1c00ad0a:	4d01                	li	s10,0
1c00ad0c:	46a5                	li	a3,9
1c00ad0e:	4529                	li	a0,10
1c00ad10:	b7e5                	j	1c00acf8 <_prf+0x200>
1c00ad12:	06300693          	li	a3,99
1c00ad16:	0cda8b63          	beq	s5,a3,1c00adec <_prf+0x2f4>
1c00ad1a:	0756c563          	blt	a3,s5,1c00ad84 <_prf+0x28c>
1c00ad1e:	05800693          	li	a3,88
1c00ad22:	f4da93e3          	bne	s5,a3,1c00ac68 <_prf+0x170>
1c00ad26:	04410b93          	addi	s7,sp,68
1c00ad2a:	004c0a13          	addi	s4,s8,4
1c00ad2e:	000c2583          	lw	a1,0(s8)
1c00ad32:	845e                	mv	s0,s7
1c00ad34:	000c8963          	beqz	s9,1c00ad46 <_prf+0x24e>
1c00ad38:	76e1                	lui	a3,0xffff8
1c00ad3a:	8306c693          	xori	a3,a3,-2000
1c00ad3e:	04d11223          	sh	a3,68(sp)
1c00ad42:	04610413          	addi	s0,sp,70
1c00ad46:	86ea                	mv	a3,s10
1c00ad48:	4641                	li	a2,16
1c00ad4a:	8522                	mv	a0,s0
1c00ad4c:	3165                	jal	1c00a9f4 <_to_x>
1c00ad4e:	05800693          	li	a3,88
1c00ad52:	58da8863          	beq	s5,a3,1c00b2e2 <_prf+0x7ea>
1c00ad56:	41740433          	sub	s0,s0,s7
1c00ad5a:	9522                	add	a0,a0,s0
1c00ad5c:	01903433          	snez	s0,s9
1c00ad60:	0406                	slli	s0,s0,0x1
1c00ad62:	a8c9                	j	1c00ae34 <_prf+0x33c>
1c00ad64:	07000693          	li	a3,112
1c00ad68:	50da8163          	beq	s5,a3,1c00b26a <_prf+0x772>
1c00ad6c:	0556c163          	blt	a3,s5,1c00adae <_prf+0x2b6>
1c00ad70:	06e00693          	li	a3,110
1c00ad74:	46da8b63          	beq	s5,a3,1c00b1ea <_prf+0x6f2>
1c00ad78:	4956c063          	blt	a3,s5,1c00b1f8 <_prf+0x700>
1c00ad7c:	06900693          	li	a3,105
1c00ad80:	eeda94e3          	bne	s5,a3,1c00ac68 <_prf+0x170>
1c00ad84:	000c2a83          	lw	s5,0(s8)
1c00ad88:	004c0a13          	addi	s4,s8,4
1c00ad8c:	04410b13          	addi	s6,sp,68
1c00ad90:	060ad963          	bgez	s5,1c00ae02 <_prf+0x30a>
1c00ad94:	02d00693          	li	a3,45
1c00ad98:	04d10223          	sb	a3,68(sp)
1c00ad9c:	800006b7          	lui	a3,0x80000
1c00ada0:	415005b3          	neg	a1,s5
1c00ada4:	06da9963          	bne	s5,a3,1c00ae16 <_prf+0x31e>
1c00ada8:	800005b7          	lui	a1,0x80000
1c00adac:	a0ad                	j	1c00ae16 <_prf+0x31e>
1c00adae:	07500693          	li	a3,117
1c00adb2:	50da8063          	beq	s5,a3,1c00b2b2 <_prf+0x7ba>
1c00adb6:	07800693          	li	a3,120
1c00adba:	f6da86e3          	beq	s5,a3,1c00ad26 <_prf+0x22e>
1c00adbe:	07300693          	li	a3,115
1c00adc2:	eada93e3          	bne	s5,a3,1c00ac68 <_prf+0x170>
1c00adc6:	000c2583          	lw	a1,0(s8)
1c00adca:	004c0a13          	addi	s4,s8,4
1c00adce:	4c81                	li	s9,0
1c00add0:	0c800793          	li	a5,200
1c00add4:	019586b3          	add	a3,a1,s9
1c00add8:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00addc:	4a068f63          	beqz	a3,1c00b29a <_prf+0x7a2>
1c00ade0:	0c85                	addi	s9,s9,1
1c00ade2:	fefc99e3          	bne	s9,a5,1c00add4 <_prf+0x2dc>
1c00ade6:	4a0d5c63          	bgez	s10,1c00b29e <_prf+0x7a6>
1c00adea:	a97d                	j	1c00b2a8 <_prf+0x7b0>
1c00adec:	000c2783          	lw	a5,0(s8)
1c00adf0:	004c0a13          	addi	s4,s8,4
1c00adf4:	040102a3          	sb	zero,69(sp)
1c00adf8:	04f10223          	sb	a5,68(sp)
1c00adfc:	4c85                	li	s9,1
1c00adfe:	4401                	li	s0,0
1c00ae00:	a105                	j	1c00b220 <_prf+0x728>
1c00ae02:	4752                	lw	a4,20(sp)
1c00ae04:	02b00693          	li	a3,43
1c00ae08:	e701                	bnez	a4,1c00ae10 <_prf+0x318>
1c00ae0a:	c41d                	beqz	s0,1c00ae38 <_prf+0x340>
1c00ae0c:	02000693          	li	a3,32
1c00ae10:	04d10223          	sb	a3,68(sp)
1c00ae14:	85d6                	mv	a1,s5
1c00ae16:	04510c13          	addi	s8,sp,69
1c00ae1a:	86ea                	mv	a3,s10
1c00ae1c:	4629                	li	a2,10
1c00ae1e:	8562                	mv	a0,s8
1c00ae20:	bd5ff0ef          	jal	ra,1c00a9f4 <_to_x>
1c00ae24:	47d2                	lw	a5,20(sp)
1c00ae26:	9562                	add	a0,a0,s8
1c00ae28:	41650533          	sub	a0,a0,s6
1c00ae2c:	eb89                	bnez	a5,1c00ae3e <_prf+0x346>
1c00ae2e:	e019                	bnez	s0,1c00ae34 <_prf+0x33c>
1c00ae30:	01fad413          	srli	s0,s5,0x1f
1c00ae34:	57fd                	li	a5,-1
1c00ae36:	a9a1                	j	1c00b28e <_prf+0x796>
1c00ae38:	85d6                	mv	a1,s5
1c00ae3a:	8c5a                	mv	s8,s6
1c00ae3c:	bff9                	j	1c00ae1a <_prf+0x322>
1c00ae3e:	4452                	lw	s0,20(sp)
1c00ae40:	bfd5                	j	1c00ae34 <_prf+0x33c>
1c00ae42:	0c1d                	addi	s8,s8,7
1c00ae44:	ff8c7c13          	andi	s8,s8,-8
1c00ae48:	000c2883          	lw	a7,0(s8)
1c00ae4c:	004c2303          	lw	t1,4(s8)
1c00ae50:	80000737          	lui	a4,0x80000
1c00ae54:	0158d593          	srli	a1,a7,0x15
1c00ae58:	00b31693          	slli	a3,t1,0xb
1c00ae5c:	8ecd                	or	a3,a3,a1
1c00ae5e:	fff74713          	not	a4,a4
1c00ae62:	01435613          	srli	a2,t1,0x14
1c00ae66:	08ae                	slli	a7,a7,0xb
1c00ae68:	8ef9                	and	a3,a3,a4
1c00ae6a:	7ff67613          	andi	a2,a2,2047
1c00ae6e:	d846                	sw	a7,48(sp)
1c00ae70:	da36                	sw	a3,52(sp)
1c00ae72:	7ff00593          	li	a1,2047
1c00ae76:	008c0a13          	addi	s4,s8,8
1c00ae7a:	08b61d63          	bne	a2,a1,1c00af14 <_prf+0x41c>
1c00ae7e:	00d0                	addi	a2,sp,68
1c00ae80:	8732                	mv	a4,a2
1c00ae82:	00035863          	bgez	t1,1c00ae92 <_prf+0x39a>
1c00ae86:	02d00713          	li	a4,45
1c00ae8a:	04e10223          	sb	a4,68(sp)
1c00ae8e:	04510713          	addi	a4,sp,69
1c00ae92:	00d8e6b3          	or	a3,a7,a3
1c00ae96:	fbfa8793          	addi	a5,s5,-65
1c00ae9a:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00ae9e:	eaa1                	bnez	a3,1c00aeee <_prf+0x3f6>
1c00aea0:	46e5                	li	a3,25
1c00aea2:	02f6ee63          	bltu	a3,a5,1c00aede <_prf+0x3e6>
1c00aea6:	6795                	lui	a5,0x5
1c00aea8:	e4978793          	addi	a5,a5,-439 # 4e49 <_l1_preload_size+0x3639>
1c00aeac:	00f71023          	sh	a5,0(a4)
1c00aeb0:	04600793          	li	a5,70
1c00aeb4:	00f70123          	sb	a5,2(a4)
1c00aeb8:	000701a3          	sb	zero,3(a4)
1c00aebc:	8d11                	sub	a0,a0,a2
1c00aebe:	47d2                	lw	a5,20(sp)
1c00aec0:	48079f63          	bnez	a5,1c00b35e <_prf+0x866>
1c00aec4:	e419                	bnez	s0,1c00aed2 <_prf+0x3da>
1c00aec6:	04414403          	lbu	s0,68(sp)
1c00aeca:	fd340413          	addi	s0,s0,-45
1c00aece:	00143413          	seqz	s0,s0
1c00aed2:	0c800793          	li	a5,200
1c00aed6:	c8a7c0e3          	blt	a5,a0,1c00ab56 <_prf+0x5e>
1c00aeda:	8caa                	mv	s9,a0
1c00aedc:	a691                	j	1c00b220 <_prf+0x728>
1c00aede:	679d                	lui	a5,0x7
1c00aee0:	e6978793          	addi	a5,a5,-407 # 6e69 <_l1_preload_size+0x5659>
1c00aee4:	00f71023          	sh	a5,0(a4)
1c00aee8:	06600793          	li	a5,102
1c00aeec:	b7e1                	j	1c00aeb4 <_prf+0x3bc>
1c00aeee:	46e5                	li	a3,25
1c00aef0:	00f6ea63          	bltu	a3,a5,1c00af04 <_prf+0x40c>
1c00aef4:	6791                	lui	a5,0x4
1c00aef6:	14e78793          	addi	a5,a5,334 # 414e <_l1_preload_size+0x293e>
1c00aefa:	00f71023          	sh	a5,0(a4)
1c00aefe:	04e00793          	li	a5,78
1c00af02:	bf4d                	j	1c00aeb4 <_prf+0x3bc>
1c00af04:	6799                	lui	a5,0x6
1c00af06:	16e78793          	addi	a5,a5,366 # 616e <_l1_preload_size+0x495e>
1c00af0a:	00f71023          	sh	a5,0(a4)
1c00af0e:	06e00793          	li	a5,110
1c00af12:	b74d                	j	1c00aeb4 <_prf+0x3bc>
1c00af14:	04600593          	li	a1,70
1c00af18:	00ba9463          	bne	s5,a1,1c00af20 <_prf+0x428>
1c00af1c:	06600a93          	li	s5,102
1c00af20:	011665b3          	or	a1,a2,a7
1c00af24:	8dd5                	or	a1,a1,a3
1c00af26:	c9c9                	beqz	a1,1c00afb8 <_prf+0x4c0>
1c00af28:	800007b7          	lui	a5,0x80000
1c00af2c:	8edd                	or	a3,a3,a5
1c00af2e:	da36                	sw	a3,52(sp)
1c00af30:	d846                	sw	a7,48(sp)
1c00af32:	c0260c13          	addi	s8,a2,-1022
1c00af36:	02d00693          	li	a3,45
1c00af3a:	00034b63          	bltz	t1,1c00af50 <_prf+0x458>
1c00af3e:	4752                	lw	a4,20(sp)
1c00af40:	02b00693          	li	a3,43
1c00af44:	e711                	bnez	a4,1c00af50 <_prf+0x458>
1c00af46:	04410b13          	addi	s6,sp,68
1c00af4a:	c419                	beqz	s0,1c00af58 <_prf+0x460>
1c00af4c:	02000693          	li	a3,32
1c00af50:	04d10223          	sb	a3,68(sp)
1c00af54:	04510b13          	addi	s6,sp,69
1c00af58:	4b81                	li	s7,0
1c00af5a:	55f9                	li	a1,-2
1c00af5c:	06bc4363          	blt	s8,a1,1c00afc2 <_prf+0x4ca>
1c00af60:	0b804a63          	bgtz	s8,1c00b014 <_prf+0x51c>
1c00af64:	4d91                	li	s11,4
1c00af66:	1808                	addi	a0,sp,48
1c00af68:	0c05                	addi	s8,s8,1
1c00af6a:	aebff0ef          	jal	ra,1c00aa54 <_rlrshift>
1c00af6e:	ffbc1ce3          	bne	s8,s11,1c00af66 <_prf+0x46e>
1c00af72:	000d5363          	bgez	s10,1c00af78 <_prf+0x480>
1c00af76:	4d19                	li	s10,6
1c00af78:	fdfaf593          	andi	a1,s5,-33
1c00af7c:	04700513          	li	a0,71
1c00af80:	0ca59663          	bne	a1,a0,1c00b04c <_prf+0x554>
1c00af84:	4c01                	li	s8,0
1c00af86:	000c9463          	bnez	s9,1c00af8e <_prf+0x496>
1c00af8a:	01a03c33          	snez	s8,s10
1c00af8e:	55f5                	li	a1,-3
1c00af90:	00bbc663          	blt	s7,a1,1c00af9c <_prf+0x4a4>
1c00af94:	001d0593          	addi	a1,s10,1
1c00af98:	0b75df63          	ble	s7,a1,1c00b056 <_prf+0x55e>
1c00af9c:	06700593          	li	a1,103
1c00afa0:	14ba8c63          	beq	s5,a1,1c00b0f8 <_prf+0x600>
1c00afa4:	04500a93          	li	s5,69
1c00afa8:	001d0593          	addi	a1,s10,1
1c00afac:	4541                	li	a0,16
1c00afae:	d62a                	sw	a0,44(sp)
1c00afb0:	0ab55c63          	ble	a1,a0,1c00b068 <_prf+0x570>
1c00afb4:	45c1                	li	a1,16
1c00afb6:	a84d                	j	1c00b068 <_prf+0x570>
1c00afb8:	4c01                	li	s8,0
1c00afba:	b751                	j	1c00af3e <_prf+0x446>
1c00afbc:	1808                	addi	a0,sp,48
1c00afbe:	a97ff0ef          	jal	ra,1c00aa54 <_rlrshift>
1c00afc2:	55d2                	lw	a1,52(sp)
1c00afc4:	333337b7          	lui	a5,0x33333
1c00afc8:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732199a>
1c00afcc:	5342                	lw	t1,48(sp)
1c00afce:	0c05                	addi	s8,s8,1
1c00afd0:	feb7e6e3          	bltu	a5,a1,1c00afbc <_prf+0x4c4>
1c00afd4:	4895                	li	a7,5
1c00afd6:	02b88533          	mul	a0,a7,a1
1c00afda:	1bfd                	addi	s7,s7,-1
1c00afdc:	0268b5b3          	mulhu	a1,a7,t1
1c00afe0:	026888b3          	mul	a7,a7,t1
1c00afe4:	95aa                	add	a1,a1,a0
1c00afe6:	da2e                	sw	a1,52(sp)
1c00afe8:	4501                	li	a0,0
1c00afea:	d846                	sw	a7,48(sp)
1c00afec:	800006b7          	lui	a3,0x80000
1c00aff0:	fff6c693          	not	a3,a3
1c00aff4:	00b6f663          	bleu	a1,a3,1c00b000 <_prf+0x508>
1c00aff8:	d12d                	beqz	a0,1c00af5a <_prf+0x462>
1c00affa:	d846                	sw	a7,48(sp)
1c00affc:	da2e                	sw	a1,52(sp)
1c00affe:	bfb1                	j	1c00af5a <_prf+0x462>
1c00b000:	01f8d313          	srli	t1,a7,0x1f
1c00b004:	00159513          	slli	a0,a1,0x1
1c00b008:	00a365b3          	or	a1,t1,a0
1c00b00c:	0886                	slli	a7,a7,0x1
1c00b00e:	1c7d                	addi	s8,s8,-1
1c00b010:	4505                	li	a0,1
1c00b012:	bfe9                	j	1c00afec <_prf+0x4f4>
1c00b014:	1808                	addi	a0,sp,48
1c00b016:	a5fff0ef          	jal	ra,1c00aa74 <_ldiv5>
1c00b01a:	58c2                	lw	a7,48(sp)
1c00b01c:	55d2                	lw	a1,52(sp)
1c00b01e:	1c7d                	addi	s8,s8,-1
1c00b020:	0b85                	addi	s7,s7,1
1c00b022:	4501                	li	a0,0
1c00b024:	80000737          	lui	a4,0x80000
1c00b028:	fff74713          	not	a4,a4
1c00b02c:	00b77663          	bleu	a1,a4,1c00b038 <_prf+0x540>
1c00b030:	d905                	beqz	a0,1c00af60 <_prf+0x468>
1c00b032:	d846                	sw	a7,48(sp)
1c00b034:	da2e                	sw	a1,52(sp)
1c00b036:	b72d                	j	1c00af60 <_prf+0x468>
1c00b038:	01f8d313          	srli	t1,a7,0x1f
1c00b03c:	00159513          	slli	a0,a1,0x1
1c00b040:	00a365b3          	or	a1,t1,a0
1c00b044:	0886                	slli	a7,a7,0x1
1c00b046:	1c7d                	addi	s8,s8,-1
1c00b048:	4505                	li	a0,1
1c00b04a:	bfe9                	j	1c00b024 <_prf+0x52c>
1c00b04c:	06600593          	li	a1,102
1c00b050:	4c01                	li	s8,0
1c00b052:	f4ba9be3          	bne	s5,a1,1c00afa8 <_prf+0x4b0>
1c00b056:	01ab85b3          	add	a1,s7,s10
1c00b05a:	06600a93          	li	s5,102
1c00b05e:	f405d7e3          	bgez	a1,1c00afac <_prf+0x4b4>
1c00b062:	45c1                	li	a1,16
1c00b064:	d62e                	sw	a1,44(sp)
1c00b066:	4581                	li	a1,0
1c00b068:	4301                	li	t1,0
1c00b06a:	080003b7          	lui	t2,0x8000
1c00b06e:	dc1a                	sw	t1,56(sp)
1c00b070:	de1e                	sw	t2,60(sp)
1c00b072:	5dfd                	li	s11,-1
1c00b074:	15fd                	addi	a1,a1,-1
1c00b076:	09b59463          	bne	a1,s11,1c00b0fe <_prf+0x606>
1c00b07a:	55c2                	lw	a1,48(sp)
1c00b07c:	5562                	lw	a0,56(sp)
1c00b07e:	58d2                	lw	a7,52(sp)
1c00b080:	5372                	lw	t1,60(sp)
1c00b082:	952e                	add	a0,a0,a1
1c00b084:	00b535b3          	sltu	a1,a0,a1
1c00b088:	989a                	add	a7,a7,t1
1c00b08a:	95c6                	add	a1,a1,a7
1c00b08c:	d82a                	sw	a0,48(sp)
1c00b08e:	f0000537          	lui	a0,0xf0000
1c00b092:	da2e                	sw	a1,52(sp)
1c00b094:	8de9                	and	a1,a1,a0
1c00b096:	c981                	beqz	a1,1c00b0a6 <_prf+0x5ae>
1c00b098:	1808                	addi	a0,sp,48
1c00b09a:	9dbff0ef          	jal	ra,1c00aa74 <_ldiv5>
1c00b09e:	1808                	addi	a0,sp,48
1c00b0a0:	9b5ff0ef          	jal	ra,1c00aa54 <_rlrshift>
1c00b0a4:	0b85                	addi	s7,s7,1
1c00b0a6:	06600593          	li	a1,102
1c00b0aa:	001b0d93          	addi	s11,s6,1
1c00b0ae:	08ba9663          	bne	s5,a1,1c00b13a <_prf+0x642>
1c00b0b2:	05705f63          	blez	s7,1c00b110 <_prf+0x618>
1c00b0b6:	017b0db3          	add	s11,s6,s7
1c00b0ba:	106c                	addi	a1,sp,44
1c00b0bc:	1808                	addi	a0,sp,48
1c00b0be:	0b05                	addi	s6,s6,1
1c00b0c0:	9fdff0ef          	jal	ra,1c00aabc <_get_digit>
1c00b0c4:	feab0fa3          	sb	a0,-1(s6)
1c00b0c8:	ffbb19e3          	bne	s6,s11,1c00b0ba <_prf+0x5c2>
1c00b0cc:	4b81                	li	s7,0
1c00b0ce:	000c9463          	bnez	s9,1c00b0d6 <_prf+0x5de>
1c00b0d2:	020d0063          	beqz	s10,1c00b0f2 <_prf+0x5fa>
1c00b0d6:	02e00613          	li	a2,46
1c00b0da:	00cd8023          	sb	a2,0(s11)
1c00b0de:	8b6e                	mv	s6,s11
1c00b0e0:	01ad8cb3          	add	s9,s11,s10
1c00b0e4:	03000313          	li	t1,48
1c00b0e8:	036c9963          	bne	s9,s6,1c00b11a <_prf+0x622>
1c00b0ec:	001d0713          	addi	a4,s10,1
1c00b0f0:	9dba                	add	s11,s11,a4
1c00b0f2:	060c1e63          	bnez	s8,1c00b16e <_prf+0x676>
1c00b0f6:	a8d1                	j	1c00b1ca <_prf+0x6d2>
1c00b0f8:	06500a93          	li	s5,101
1c00b0fc:	b575                	j	1c00afa8 <_prf+0x4b0>
1c00b0fe:	1828                	addi	a0,sp,56
1c00b100:	c42e                	sw	a1,8(sp)
1c00b102:	973ff0ef          	jal	ra,1c00aa74 <_ldiv5>
1c00b106:	1828                	addi	a0,sp,56
1c00b108:	94dff0ef          	jal	ra,1c00aa54 <_rlrshift>
1c00b10c:	45a2                	lw	a1,8(sp)
1c00b10e:	b79d                	j	1c00b074 <_prf+0x57c>
1c00b110:	03000593          	li	a1,48
1c00b114:	00bb0023          	sb	a1,0(s6)
1c00b118:	bf5d                	j	1c00b0ce <_prf+0x5d6>
1c00b11a:	000b8763          	beqz	s7,1c00b128 <_prf+0x630>
1c00b11e:	006b00a3          	sb	t1,1(s6)
1c00b122:	0b85                	addi	s7,s7,1
1c00b124:	0b05                	addi	s6,s6,1
1c00b126:	b7c9                	j	1c00b0e8 <_prf+0x5f0>
1c00b128:	106c                	addi	a1,sp,44
1c00b12a:	1808                	addi	a0,sp,48
1c00b12c:	c41a                	sw	t1,8(sp)
1c00b12e:	98fff0ef          	jal	ra,1c00aabc <_get_digit>
1c00b132:	00ab00a3          	sb	a0,1(s6)
1c00b136:	4322                	lw	t1,8(sp)
1c00b138:	b7f5                	j	1c00b124 <_prf+0x62c>
1c00b13a:	106c                	addi	a1,sp,44
1c00b13c:	1808                	addi	a0,sp,48
1c00b13e:	97fff0ef          	jal	ra,1c00aabc <_get_digit>
1c00b142:	00ab0023          	sb	a0,0(s6)
1c00b146:	03000593          	li	a1,48
1c00b14a:	00b50363          	beq	a0,a1,1c00b150 <_prf+0x658>
1c00b14e:	1bfd                	addi	s7,s7,-1
1c00b150:	000c9463          	bnez	s9,1c00b158 <_prf+0x660>
1c00b154:	000d0b63          	beqz	s10,1c00b16a <_prf+0x672>
1c00b158:	002b0d93          	addi	s11,s6,2
1c00b15c:	02e00593          	li	a1,46
1c00b160:	00bb00a3          	sb	a1,1(s6)
1c00b164:	9d6e                	add	s10,s10,s11
1c00b166:	07bd1863          	bne	s10,s11,1c00b1d6 <_prf+0x6de>
1c00b16a:	000c0f63          	beqz	s8,1c00b188 <_prf+0x690>
1c00b16e:	03000593          	li	a1,48
1c00b172:	fffdc603          	lbu	a2,-1(s11)
1c00b176:	fffd8713          	addi	a4,s11,-1
1c00b17a:	06b60663          	beq	a2,a1,1c00b1e6 <_prf+0x6ee>
1c00b17e:	02e00593          	li	a1,46
1c00b182:	00b61363          	bne	a2,a1,1c00b188 <_prf+0x690>
1c00b186:	8dba                	mv	s11,a4
1c00b188:	fdfaf713          	andi	a4,s5,-33
1c00b18c:	04500613          	li	a2,69
1c00b190:	02c71d63          	bne	a4,a2,1c00b1ca <_prf+0x6d2>
1c00b194:	87d6                	mv	a5,s5
1c00b196:	00fd8023          	sb	a5,0(s11)
1c00b19a:	02b00793          	li	a5,43
1c00b19e:	000bd663          	bgez	s7,1c00b1aa <_prf+0x6b2>
1c00b1a2:	41700bb3          	neg	s7,s7
1c00b1a6:	02d00793          	li	a5,45
1c00b1aa:	00fd80a3          	sb	a5,1(s11)
1c00b1ae:	47a9                	li	a5,10
1c00b1b0:	02fbc733          	div	a4,s7,a5
1c00b1b4:	0d91                	addi	s11,s11,4
1c00b1b6:	02fbe6b3          	rem	a3,s7,a5
1c00b1ba:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b1be:	feed8f23          	sb	a4,-2(s11)
1c00b1c2:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b1c6:	fedd8fa3          	sb	a3,-1(s11)
1c00b1ca:	00c8                	addi	a0,sp,68
1c00b1cc:	000d8023          	sb	zero,0(s11)
1c00b1d0:	40ad8533          	sub	a0,s11,a0
1c00b1d4:	b1ed                	j	1c00aebe <_prf+0x3c6>
1c00b1d6:	106c                	addi	a1,sp,44
1c00b1d8:	1808                	addi	a0,sp,48
1c00b1da:	0d85                	addi	s11,s11,1
1c00b1dc:	8e1ff0ef          	jal	ra,1c00aabc <_get_digit>
1c00b1e0:	fead8fa3          	sb	a0,-1(s11)
1c00b1e4:	b749                	j	1c00b166 <_prf+0x66e>
1c00b1e6:	8dba                	mv	s11,a4
1c00b1e8:	b769                	j	1c00b172 <_prf+0x67a>
1c00b1ea:	000c2783          	lw	a5,0(s8)
1c00b1ee:	004c0a13          	addi	s4,s8,4
1c00b1f2:	0137a023          	sw	s3,0(a5)
1c00b1f6:	b24d                	j	1c00ab98 <_prf+0xa0>
1c00b1f8:	004c0a13          	addi	s4,s8,4
1c00b1fc:	000c2583          	lw	a1,0(s8)
1c00b200:	00dc                	addi	a5,sp,68
1c00b202:	040c8463          	beqz	s9,1c00b24a <_prf+0x752>
1c00b206:	03000693          	li	a3,48
1c00b20a:	04d10223          	sb	a3,68(sp)
1c00b20e:	04510513          	addi	a0,sp,69
1c00b212:	ed8d                	bnez	a1,1c00b24c <_prf+0x754>
1c00b214:	040102a3          	sb	zero,69(sp)
1c00b218:	57fd                	li	a5,-1
1c00b21a:	4401                	li	s0,0
1c00b21c:	0efd1163          	bne	s10,a5,1c00b2fe <_prf+0x806>
1c00b220:	0f2cc363          	blt	s9,s2,1c00b306 <_prf+0x80e>
1c00b224:	8966                	mv	s2,s9
1c00b226:	00c0                	addi	s0,sp,68
1c00b228:	40898ab3          	sub	s5,s3,s0
1c00b22c:	5b7d                	li	s6,-1
1c00b22e:	015409b3          	add	s3,s0,s5
1c00b232:	960903e3          	beqz	s2,1c00ab98 <_prf+0xa0>
1c00b236:	45f2                	lw	a1,28(sp)
1c00b238:	00044503          	lbu	a0,0(s0)
1c00b23c:	47e2                	lw	a5,24(sp)
1c00b23e:	9782                	jalr	a5
1c00b240:	91650be3          	beq	a0,s6,1c00ab56 <_prf+0x5e>
1c00b244:	197d                	addi	s2,s2,-1
1c00b246:	0405                	addi	s0,s0,1
1c00b248:	b7dd                	j	1c00b22e <_prf+0x736>
1c00b24a:	853e                	mv	a0,a5
1c00b24c:	86ea                	mv	a3,s10
1c00b24e:	4621                	li	a2,8
1c00b250:	40f50433          	sub	s0,a0,a5
1c00b254:	fa0ff0ef          	jal	ra,1c00a9f4 <_to_x>
1c00b258:	9522                	add	a0,a0,s0
1c00b25a:	57fd                	li	a5,-1
1c00b25c:	4401                	li	s0,0
1c00b25e:	c6fd0ae3          	beq	s10,a5,1c00aed2 <_prf+0x3da>
1c00b262:	02000793          	li	a5,32
1c00b266:	c83e                	sw	a5,16(sp)
1c00b268:	b1ad                	j	1c00aed2 <_prf+0x3da>
1c00b26a:	000c2583          	lw	a1,0(s8)
1c00b26e:	77e1                	lui	a5,0xffff8
1c00b270:	8307c793          	xori	a5,a5,-2000
1c00b274:	46a1                	li	a3,8
1c00b276:	4641                	li	a2,16
1c00b278:	04610513          	addi	a0,sp,70
1c00b27c:	04f11223          	sh	a5,68(sp)
1c00b280:	f74ff0ef          	jal	ra,1c00a9f4 <_to_x>
1c00b284:	004c0a13          	addi	s4,s8,4
1c00b288:	0509                	addi	a0,a0,2
1c00b28a:	57fd                	li	a5,-1
1c00b28c:	4401                	li	s0,0
1c00b28e:	c4fd02e3          	beq	s10,a5,1c00aed2 <_prf+0x3da>
1c00b292:	02000713          	li	a4,32
1c00b296:	c83a                	sw	a4,16(sp)
1c00b298:	b92d                	j	1c00aed2 <_prf+0x3da>
1c00b29a:	000d4563          	bltz	s10,1c00b2a4 <_prf+0x7ac>
1c00b29e:	019d5363          	ble	s9,s10,1c00b2a4 <_prf+0x7ac>
1c00b2a2:	8cea                	mv	s9,s10
1c00b2a4:	8e0c8ae3          	beqz	s9,1c00ab98 <_prf+0xa0>
1c00b2a8:	8666                	mv	a2,s9
1c00b2aa:	00c8                	addi	a0,sp,68
1c00b2ac:	ce4ff0ef          	jal	ra,1c00a790 <memcpy>
1c00b2b0:	b6b9                	j	1c00adfe <_prf+0x306>
1c00b2b2:	000c2583          	lw	a1,0(s8)
1c00b2b6:	86ea                	mv	a3,s10
1c00b2b8:	4629                	li	a2,10
1c00b2ba:	00c8                	addi	a0,sp,68
1c00b2bc:	004c0a13          	addi	s4,s8,4
1c00b2c0:	f34ff0ef          	jal	ra,1c00a9f4 <_to_x>
1c00b2c4:	bf59                	j	1c00b25a <_prf+0x762>
1c00b2c6:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b2ca:	0ff67613          	andi	a2,a2,255
1c00b2ce:	00c5e563          	bltu	a1,a2,1c00b2d8 <_prf+0x7e0>
1c00b2d2:	1781                	addi	a5,a5,-32
1c00b2d4:	00f68023          	sb	a5,0(a3)
1c00b2d8:	0685                	addi	a3,a3,1
1c00b2da:	0006c783          	lbu	a5,0(a3)
1c00b2de:	f7e5                	bnez	a5,1c00b2c6 <_prf+0x7ce>
1c00b2e0:	bc9d                	j	1c00ad56 <_prf+0x25e>
1c00b2e2:	86de                	mv	a3,s7
1c00b2e4:	45e5                	li	a1,25
1c00b2e6:	bfd5                	j	1c00b2da <_prf+0x7e2>
1c00b2e8:	45f2                	lw	a1,28(sp)
1c00b2ea:	4762                	lw	a4,24(sp)
1c00b2ec:	02500513          	li	a0,37
1c00b2f0:	9702                	jalr	a4
1c00b2f2:	57fd                	li	a5,-1
1c00b2f4:	86f501e3          	beq	a0,a5,1c00ab56 <_prf+0x5e>
1c00b2f8:	0985                	addi	s3,s3,1
1c00b2fa:	8a62                	mv	s4,s8
1c00b2fc:	b871                	j	1c00ab98 <_prf+0xa0>
1c00b2fe:	02000793          	li	a5,32
1c00b302:	c83e                	sw	a5,16(sp)
1c00b304:	bf31                	j	1c00b220 <_prf+0x728>
1c00b306:	4732                	lw	a4,12(sp)
1c00b308:	cf01                	beqz	a4,1c00b320 <_prf+0x828>
1c00b30a:	02000713          	li	a4,32
1c00b30e:	00d4                	addi	a3,sp,68
1c00b310:	019687b3          	add	a5,a3,s9
1c00b314:	00e78023          	sb	a4,0(a5)
1c00b318:	0c85                	addi	s9,s9,1
1c00b31a:	ff991ae3          	bne	s2,s9,1c00b30e <_prf+0x816>
1c00b31e:	b721                	j	1c00b226 <_prf+0x72e>
1c00b320:	00cc                	addi	a1,sp,68
1c00b322:	41990bb3          	sub	s7,s2,s9
1c00b326:	001c8613          	addi	a2,s9,1
1c00b32a:	01758533          	add	a0,a1,s7
1c00b32e:	c7aff0ef          	jal	ra,1c00a7a8 <memmove>
1c00b332:	4742                	lw	a4,16(sp)
1c00b334:	02000793          	li	a5,32
1c00b338:	00f70363          	beq	a4,a5,1c00b33e <_prf+0x846>
1c00b33c:	c622                	sw	s0,12(sp)
1c00b33e:	47b2                	lw	a5,12(sp)
1c00b340:	9bbe                	add	s7,s7,a5
1c00b342:	4732                	lw	a4,12(sp)
1c00b344:	ef7751e3          	ble	s7,a4,1c00b226 <_prf+0x72e>
1c00b348:	4732                	lw	a4,12(sp)
1c00b34a:	00d4                	addi	a3,sp,68
1c00b34c:	00e687b3          	add	a5,a3,a4
1c00b350:	4742                	lw	a4,16(sp)
1c00b352:	00e78023          	sb	a4,0(a5)
1c00b356:	47b2                	lw	a5,12(sp)
1c00b358:	0785                	addi	a5,a5,1
1c00b35a:	c63e                	sw	a5,12(sp)
1c00b35c:	b7dd                	j	1c00b342 <_prf+0x84a>
1c00b35e:	4452                	lw	s0,20(sp)
1c00b360:	be8d                	j	1c00aed2 <_prf+0x3da>

1c00b362 <__rt_uart_cluster_req_done>:
1c00b362:	300476f3          	csrrci	a3,mstatus,8
1c00b366:	4785                	li	a5,1
1c00b368:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b36c:	09954783          	lbu	a5,153(a0)
1c00b370:	00201737          	lui	a4,0x201
1c00b374:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c00b378:	04078793          	addi	a5,a5,64
1c00b37c:	07da                	slli	a5,a5,0x16
1c00b37e:	97ba                	add	a5,a5,a4
1c00b380:	0007a023          	sw	zero,0(a5)
1c00b384:	30069073          	csrw	mstatus,a3
1c00b388:	8082                	ret

1c00b38a <__rt_uart_setup.isra.6>:
1c00b38a:	1c001737          	lui	a4,0x1c001
1c00b38e:	20872703          	lw	a4,520(a4) # 1c001208 <__rt_freq_domains>
1c00b392:	00155793          	srli	a5,a0,0x1
1c00b396:	97ba                	add	a5,a5,a4
1c00b398:	02a7d7b3          	divu	a5,a5,a0
1c00b39c:	1a102737          	lui	a4,0x1a102
1c00b3a0:	17fd                	addi	a5,a5,-1
1c00b3a2:	07c2                	slli	a5,a5,0x10
1c00b3a4:	3067e793          	ori	a5,a5,774
1c00b3a8:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100990>
1c00b3ac:	8082                	ret

1c00b3ae <__rt_uart_setfreq_after>:
1c00b3ae:	1c0017b7          	lui	a5,0x1c001
1c00b3b2:	18878793          	addi	a5,a5,392 # 1c001188 <__rt_uart>
1c00b3b6:	4398                	lw	a4,0(a5)
1c00b3b8:	cb09                	beqz	a4,1c00b3ca <__rt_uart_setfreq_after+0x1c>
1c00b3ba:	4788                	lw	a0,8(a5)
1c00b3bc:	1141                	addi	sp,sp,-16
1c00b3be:	c606                	sw	ra,12(sp)
1c00b3c0:	37e9                	jal	1c00b38a <__rt_uart_setup.isra.6>
1c00b3c2:	40b2                	lw	ra,12(sp)
1c00b3c4:	4501                	li	a0,0
1c00b3c6:	0141                	addi	sp,sp,16
1c00b3c8:	8082                	ret
1c00b3ca:	4501                	li	a0,0
1c00b3cc:	8082                	ret

1c00b3ce <__rt_uart_cluster_req>:
1c00b3ce:	1141                	addi	sp,sp,-16
1c00b3d0:	c606                	sw	ra,12(sp)
1c00b3d2:	c422                	sw	s0,8(sp)
1c00b3d4:	30047473          	csrrci	s0,mstatus,8
1c00b3d8:	1c00b7b7          	lui	a5,0x1c00b
1c00b3dc:	36278793          	addi	a5,a5,866 # 1c00b362 <__rt_uart_cluster_req_done>
1c00b3e0:	c55c                	sw	a5,12(a0)
1c00b3e2:	4785                	li	a5,1
1c00b3e4:	d55c                	sw	a5,44(a0)
1c00b3e6:	411c                	lw	a5,0(a0)
1c00b3e8:	02052823          	sw	zero,48(a0)
1c00b3ec:	c908                	sw	a0,16(a0)
1c00b3ee:	43cc                	lw	a1,4(a5)
1c00b3f0:	4514                	lw	a3,8(a0)
1c00b3f2:	4150                	lw	a2,4(a0)
1c00b3f4:	0586                	slli	a1,a1,0x1
1c00b3f6:	00c50793          	addi	a5,a0,12
1c00b3fa:	4701                	li	a4,0
1c00b3fc:	0585                	addi	a1,a1,1
1c00b3fe:	4501                	li	a0,0
1c00b400:	e99fe0ef          	jal	ra,1c00a298 <rt_periph_copy>
1c00b404:	30041073          	csrw	mstatus,s0
1c00b408:	40b2                	lw	ra,12(sp)
1c00b40a:	4422                	lw	s0,8(sp)
1c00b40c:	0141                	addi	sp,sp,16
1c00b40e:	8082                	ret

1c00b410 <__rt_uart_wait_tx_done.isra.5>:
1c00b410:	1a102737          	lui	a4,0x1a102
1c00b414:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa100984>
1c00b418:	8bc1                	andi	a5,a5,16
1c00b41a:	e7b9                	bnez	a5,1c00b468 <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b41c:	1a102737          	lui	a4,0x1a102
1c00b420:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa10098c>
1c00b424:	8b85                	andi	a5,a5,1
1c00b426:	ffed                	bnez	a5,1c00b420 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b428:	f14027f3          	csrr	a5,mhartid
1c00b42c:	8795                	srai	a5,a5,0x5
1c00b42e:	1a10a637          	lui	a2,0x1a10a
1c00b432:	03f7f793          	andi	a5,a5,63
1c00b436:	03200693          	li	a3,50
1c00b43a:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa108000>
1c00b43e:	6711                	lui	a4,0x4
1c00b440:	6311                	lui	t1,0x4
1c00b442:	45fd                	li	a1,31
1c00b444:	00204537          	lui	a0,0x204
1c00b448:	88be                	mv	a7,a5
1c00b44a:	00682023          	sw	t1,0(a6)
1c00b44e:	02b79063          	bne	a5,a1,1c00b46e <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b452:	80e62223          	sw	a4,-2044(a2)
1c00b456:	10500073          	wfi
1c00b45a:	00b89c63          	bne	a7,a1,1c00b472 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b45e:	80e62423          	sw	a4,-2040(a2)
1c00b462:	16fd                	addi	a3,a3,-1
1c00b464:	f2fd                	bnez	a3,1c00b44a <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b466:	8082                	ret
1c00b468:	10500073          	wfi
1c00b46c:	b765                	j	1c00b414 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b46e:	c958                	sw	a4,20(a0)
1c00b470:	b7dd                	j	1c00b456 <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b472:	c918                	sw	a4,16(a0)
1c00b474:	b7fd                	j	1c00b462 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b476 <__rt_uart_setfreq_before>:
1c00b476:	1c0017b7          	lui	a5,0x1c001
1c00b47a:	1887a783          	lw	a5,392(a5) # 1c001188 <__rt_uart>
1c00b47e:	cf99                	beqz	a5,1c00b49c <__rt_uart_setfreq_before+0x26>
1c00b480:	1141                	addi	sp,sp,-16
1c00b482:	c606                	sw	ra,12(sp)
1c00b484:	3771                	jal	1c00b410 <__rt_uart_wait_tx_done.isra.5>
1c00b486:	40b2                	lw	ra,12(sp)
1c00b488:	005007b7          	lui	a5,0x500
1c00b48c:	1a102737          	lui	a4,0x1a102
1c00b490:	0799                	addi	a5,a5,6
1c00b492:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100990>
1c00b496:	4501                	li	a0,0
1c00b498:	0141                	addi	sp,sp,16
1c00b49a:	8082                	ret
1c00b49c:	4501                	li	a0,0
1c00b49e:	8082                	ret

1c00b4a0 <soc_eu_fcEventMask_setEvent>:
1c00b4a0:	47fd                	li	a5,31
1c00b4a2:	4721                	li	a4,8
1c00b4a4:	00a7d463          	ble	a0,a5,1c00b4ac <soc_eu_fcEventMask_setEvent+0xc>
1c00b4a8:	1501                	addi	a0,a0,-32
1c00b4aa:	4711                	li	a4,4
1c00b4ac:	1a1067b7          	lui	a5,0x1a106
1c00b4b0:	973e                	add	a4,a4,a5
1c00b4b2:	4314                	lw	a3,0(a4)
1c00b4b4:	4785                	li	a5,1
1c00b4b6:	00a79533          	sll	a0,a5,a0
1c00b4ba:	fff54513          	not	a0,a0
1c00b4be:	8d75                	and	a0,a0,a3
1c00b4c0:	c308                	sw	a0,0(a4)
1c00b4c2:	8082                	ret

1c00b4c4 <rt_uart_conf_init>:
1c00b4c4:	000997b7          	lui	a5,0x99
1c00b4c8:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8a17c>
1c00b4cc:	c11c                	sw	a5,0(a0)
1c00b4ce:	57fd                	li	a5,-1
1c00b4d0:	c15c                	sw	a5,4(a0)
1c00b4d2:	8082                	ret

1c00b4d4 <__rt_uart_open>:
1c00b4d4:	1141                	addi	sp,sp,-16
1c00b4d6:	c606                	sw	ra,12(sp)
1c00b4d8:	c422                	sw	s0,8(sp)
1c00b4da:	c226                	sw	s1,4(sp)
1c00b4dc:	c04a                	sw	s2,0(sp)
1c00b4de:	30047973          	csrrci	s2,mstatus,8
1c00b4e2:	cd8d                	beqz	a1,1c00b51c <__rt_uart_open+0x48>
1c00b4e4:	4194                	lw	a3,0(a1)
1c00b4e6:	1c0017b7          	lui	a5,0x1c001
1c00b4ea:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f5811>
1c00b4ee:	18878413          	addi	s0,a5,392 # 1c001188 <__rt_uart>
1c00b4f2:	0712                	slli	a4,a4,0x4
1c00b4f4:	943a                	add	s0,s0,a4
1c00b4f6:	4010                	lw	a2,0(s0)
1c00b4f8:	18878793          	addi	a5,a5,392
1c00b4fc:	c60d                	beqz	a2,1c00b526 <__rt_uart_open+0x52>
1c00b4fe:	c589                	beqz	a1,1c00b508 <__rt_uart_open+0x34>
1c00b500:	418c                	lw	a1,0(a1)
1c00b502:	4414                	lw	a3,8(s0)
1c00b504:	04d59a63          	bne	a1,a3,1c00b558 <__rt_uart_open+0x84>
1c00b508:	97ba                	add	a5,a5,a4
1c00b50a:	0605                	addi	a2,a2,1
1c00b50c:	c390                	sw	a2,0(a5)
1c00b50e:	8522                	mv	a0,s0
1c00b510:	40b2                	lw	ra,12(sp)
1c00b512:	4422                	lw	s0,8(sp)
1c00b514:	4492                	lw	s1,4(sp)
1c00b516:	4902                	lw	s2,0(sp)
1c00b518:	0141                	addi	sp,sp,16
1c00b51a:	8082                	ret
1c00b51c:	000996b7          	lui	a3,0x99
1c00b520:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8a17c>
1c00b524:	b7c9                	j	1c00b4e6 <__rt_uart_open+0x12>
1c00b526:	4785                	li	a5,1
1c00b528:	1a102737          	lui	a4,0x1a102
1c00b52c:	c01c                	sw	a5,0(s0)
1c00b52e:	c048                	sw	a0,4(s0)
1c00b530:	c414                	sw	a3,8(s0)
1c00b532:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa100f6c>
1c00b536:	00a797b3          	sll	a5,a5,a0
1c00b53a:	00151493          	slli	s1,a0,0x1
1c00b53e:	8fd5                	or	a5,a5,a3
1c00b540:	78f72023          	sw	a5,1920(a4)
1c00b544:	8526                	mv	a0,s1
1c00b546:	3fa9                	jal	1c00b4a0 <soc_eu_fcEventMask_setEvent>
1c00b548:	00148513          	addi	a0,s1,1
1c00b54c:	3f91                	jal	1c00b4a0 <soc_eu_fcEventMask_setEvent>
1c00b54e:	4408                	lw	a0,8(s0)
1c00b550:	3d2d                	jal	1c00b38a <__rt_uart_setup.isra.6>
1c00b552:	30091073          	csrw	mstatus,s2
1c00b556:	bf65                	j	1c00b50e <__rt_uart_open+0x3a>
1c00b558:	4401                	li	s0,0
1c00b55a:	bf55                	j	1c00b50e <__rt_uart_open+0x3a>

1c00b55c <rt_uart_close>:
1c00b55c:	1141                	addi	sp,sp,-16
1c00b55e:	c606                	sw	ra,12(sp)
1c00b560:	c422                	sw	s0,8(sp)
1c00b562:	c226                	sw	s1,4(sp)
1c00b564:	300474f3          	csrrci	s1,mstatus,8
1c00b568:	411c                	lw	a5,0(a0)
1c00b56a:	17fd                	addi	a5,a5,-1
1c00b56c:	c11c                	sw	a5,0(a0)
1c00b56e:	e78d                	bnez	a5,1c00b598 <rt_uart_close+0x3c>
1c00b570:	842a                	mv	s0,a0
1c00b572:	3d79                	jal	1c00b410 <__rt_uart_wait_tx_done.isra.5>
1c00b574:	005007b7          	lui	a5,0x500
1c00b578:	1a102737          	lui	a4,0x1a102
1c00b57c:	0799                	addi	a5,a5,6
1c00b57e:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100990>
1c00b582:	4050                	lw	a2,4(s0)
1c00b584:	78072683          	lw	a3,1920(a4)
1c00b588:	4785                	li	a5,1
1c00b58a:	00c797b3          	sll	a5,a5,a2
1c00b58e:	fff7c793          	not	a5,a5
1c00b592:	8ff5                	and	a5,a5,a3
1c00b594:	78f72023          	sw	a5,1920(a4)
1c00b598:	30049073          	csrw	mstatus,s1
1c00b59c:	40b2                	lw	ra,12(sp)
1c00b59e:	4422                	lw	s0,8(sp)
1c00b5a0:	4492                	lw	s1,4(sp)
1c00b5a2:	0141                	addi	sp,sp,16
1c00b5a4:	8082                	ret

1c00b5a6 <rt_uart_cluster_write>:
1c00b5a6:	f14027f3          	csrr	a5,mhartid
1c00b5aa:	8795                	srai	a5,a5,0x5
1c00b5ac:	03f7f793          	andi	a5,a5,63
1c00b5b0:	08f68ca3          	sb	a5,153(a3)
1c00b5b4:	1c00b7b7          	lui	a5,0x1c00b
1c00b5b8:	3ce78793          	addi	a5,a5,974 # 1c00b3ce <__rt_uart_cluster_req>
1c00b5bc:	c6dc                	sw	a5,12(a3)
1c00b5be:	4785                	li	a5,1
1c00b5c0:	c288                	sw	a0,0(a3)
1c00b5c2:	c2cc                	sw	a1,4(a3)
1c00b5c4:	c690                	sw	a2,8(a3)
1c00b5c6:	08068c23          	sb	zero,152(a3)
1c00b5ca:	0206a823          	sw	zero,48(a3)
1c00b5ce:	ca94                	sw	a3,16(a3)
1c00b5d0:	d6dc                	sw	a5,44(a3)
1c00b5d2:	00c68513          	addi	a0,a3,12
1c00b5d6:	ab5fd06f          	j	1c00908a <__rt_cluster_push_fc_event>

1c00b5da <__rt_uart_init>:
1c00b5da:	1c00b5b7          	lui	a1,0x1c00b
1c00b5de:	1141                	addi	sp,sp,-16
1c00b5e0:	4601                	li	a2,0
1c00b5e2:	47658593          	addi	a1,a1,1142 # 1c00b476 <__rt_uart_setfreq_before>
1c00b5e6:	4511                	li	a0,4
1c00b5e8:	c606                	sw	ra,12(sp)
1c00b5ea:	c422                	sw	s0,8(sp)
1c00b5ec:	8bafe0ef          	jal	ra,1c0096a6 <__rt_cbsys_add>
1c00b5f0:	1c00b5b7          	lui	a1,0x1c00b
1c00b5f4:	842a                	mv	s0,a0
1c00b5f6:	4601                	li	a2,0
1c00b5f8:	3ae58593          	addi	a1,a1,942 # 1c00b3ae <__rt_uart_setfreq_after>
1c00b5fc:	4515                	li	a0,5
1c00b5fe:	8a8fe0ef          	jal	ra,1c0096a6 <__rt_cbsys_add>
1c00b602:	1c0017b7          	lui	a5,0x1c001
1c00b606:	1807a423          	sw	zero,392(a5) # 1c001188 <__rt_uart>
1c00b60a:	8d41                	or	a0,a0,s0
1c00b60c:	c105                	beqz	a0,1c00b62c <__rt_uart_init+0x52>
1c00b60e:	f1402673          	csrr	a2,mhartid
1c00b612:	1c000537          	lui	a0,0x1c000
1c00b616:	40565593          	srai	a1,a2,0x5
1c00b61a:	03f5f593          	andi	a1,a1,63
1c00b61e:	8a7d                	andi	a2,a2,31
1c00b620:	68050513          	addi	a0,a0,1664 # 1c000680 <__DTOR_END__+0x394>
1c00b624:	ba6ff0ef          	jal	ra,1c00a9ca <printf>
1c00b628:	b2eff0ef          	jal	ra,1c00a956 <abort>
1c00b62c:	40b2                	lw	ra,12(sp)
1c00b62e:	4422                	lw	s0,8(sp)
1c00b630:	0141                	addi	sp,sp,16
1c00b632:	8082                	ret

Disassembly of section .text.cluster:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x1f5814>
1c010016:	0e059863          	bnez	a1,1c010106 <__rt_slave_start>
1c01001a:	e3ff0417          	auipc	s0,0xe3ff0
1c01001e:	fea40413          	addi	s0,s0,-22 # 4 <__rt_bridge_flash_handle>
1c010022:	002049b7          	lui	s3,0x204
1c010026:	4a09                	li	s4,2
1c010028:	00000a97          	auipc	s5,0x0
1c01002c:	034a8a93          	addi	s5,s5,52 # 1c01005c <__rt_master_event>
1c010030:	ffff1b97          	auipc	s7,0xffff1
1c010034:	1a8b8b93          	addi	s7,s7,424 # 1c0011d8 <__rt_fc_cluster_data>
1c010038:	02800393          	li	t2,40
1c01003c:	02a383b3          	mul	t2,t2,a0
1c010040:	9b9e                	add	s7,s7,t2
1c010042:	0b91                	addi	s7,s7,4
1c010044:	1a10acb7          	lui	s9,0x1a10a
1c010048:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_end+0xa107ffc>
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
1c0100cc:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1f5898>
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
1c010124:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x1f5a30>

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
