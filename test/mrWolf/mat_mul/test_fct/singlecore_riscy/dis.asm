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
1c008090:	101c                	addi	a5,sp,32
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
1c0080bc:	03028293          	addi	t0,t0,48 # 1c0010e8 <_bss_start>
1c0080c0:	ffff9317          	auipc	t1,0xffff9
1c0080c4:	18430313          	addi	t1,t1,388 # 1c001244 <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0)
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	e2e10113          	addi	sp,sp,-466 # 1c000f00 <stack>
1c0080da:	15e010ef          	jal	ra,1c009238 <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00001397          	auipc	t2,0x1
1c0080ea:	93e38393          	addi	t2,t2,-1730 # 1c008a24 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	2b8010ef          	jal	ra,1c0093ac <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	702020ef          	jal	ra,1c00a7fc <exit>

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
1c00815e:	60e60613          	addi	a2,a2,1550 # 1c009768 <__rt_bridge_handle_notif>
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
1c008198:	07448493          	addi	s1,s1,116 # 1c001208 <__rt_fc_cluster_data>

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
1c0081fa:	01248493          	addi	s1,s1,18 # 1c001208 <__rt_fc_cluster_data>
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
1c00825e:	1e250513          	addi	a0,a0,482 # 1c00943c <__rt_handle_illegal_instr>
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
1c008340:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_end+0xa1067ec>
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
1c008518:	0007c503          	lbu	a0,0(a5) # 10000 <__l1_heap_size+0x3014>
1c00851c:	40a70533          	sub	a0,a4,a0
1c008520:	8082                	ret
1c008522:	01000737          	lui	a4,0x1000
1c008526:	47c1                	li	a5,16
1c008528:	fce56ee3          	bltu	a0,a4,1c008504 <__clzsi2+0x10>
1c00852c:	47e1                	li	a5,24
1c00852e:	bfd9                	j	1c008504 <__clzsi2+0x10>

1c008530 <cluster_entry>:
1c008530:	7175                	addi	sp,sp,-144
1c008532:	c522                	sw	s0,136(sp)
1c008534:	f1402673          	csrr	a2,mhartid
1c008538:	40565413          	srai	s0,a2,0x5
1c00853c:	f2643433          	p.bclr	s0,s0,25,6
1c008540:	1c000537          	lui	a0,0x1c000
1c008544:	85a2                	mv	a1,s0
1c008546:	f4563633          	p.bclr	a2,a2,26,5
1c00854a:	3ec50513          	addi	a0,a0,1004 # 1c0003ec <__DTOR_END__+0x100>
1c00854e:	c706                	sw	ra,140(sp)
1c008550:	c326                	sw	s1,132(sp)
1c008552:	c14a                	sw	s2,128(sp)
1c008554:	dece                	sw	s3,124(sp)
1c008556:	dcd2                	sw	s4,120(sp)
1c008558:	dad6                	sw	s5,116(sp)
1c00855a:	340020ef          	jal	ra,1c00a89a <printf>
1c00855e:	1028                	addi	a0,sp,40
1c008560:	4a1000ef          	jal	ra,1c009200 <rt_perf_init>
1c008564:	6585                	lui	a1,0x1
1c008566:	450d                	li	a0,3
1c008568:	2371                	jal	1c008af4 <rt_alloc>
1c00856a:	20050b63          	beqz	a0,1c008780 <cluster_entry+0x250>
1c00856e:	84aa                	mv	s1,a0
1c008570:	1c000537          	lui	a0,0x1c000
1c008574:	45a1                	li	a1,8
1c008576:	42450513          	addi	a0,a0,1060 # 1c000424 <__DTOR_END__+0x138>
1c00857a:	320020ef          	jal	ra,1c00a89a <printf>
1c00857e:	65e1                	lui	a1,0x18
1c008580:	0599                	addi	a1,a1,6
1c008582:	1028                	addi	a0,sp,40
1c008584:	491000ef          	jal	ra,1c009214 <rt_perf_conf>
1c008588:	47fd                	li	a5,31
1c00858a:	1af40063          	beq	s0,a5,1c00872a <cluster_entry+0x1fa>
1c00858e:	102007b7          	lui	a5,0x10200
1c008592:	4705                	li	a4,1
1c008594:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fd3ec>
1c008598:	02e7a023          	sw	a4,32(a5)
1c00859c:	4781                	li	a5,0
1c00859e:	79f79073          	csrw	pccr31,a5
1c0085a2:	f14027f3          	csrr	a5,mhartid
1c0085a6:	477d                	li	a4,31
1c0085a8:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085ac:	18e78e63          	beq	a5,a4,1c008748 <cluster_entry+0x218>
1c0085b0:	102007b7          	lui	a5,0x10200
1c0085b4:	4705                	li	a4,1
1c0085b6:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fd3ec>
1c0085ba:	00e7ac23          	sw	a4,24(a5)
1c0085be:	478d                	li	a5,3
1c0085c0:	7a179073          	csrw	pcmr,a5
1c0085c4:	10002637          	lui	a2,0x10002
1c0085c8:	01460613          	addi	a2,a2,20 # 10002014 <m_a>
1c0085cc:	02000693          	li	a3,32
1c0085d0:	c632                	sw	a2,12(sp)
1c0085d2:	10001637          	lui	a2,0x10001
1c0085d6:	01460613          	addi	a2,a2,20 # 10001014 <m_b>
1c0085da:	ca36                	sw	a3,20(sp)
1c0085dc:	cc36                	sw	a3,24(sp)
1c0085de:	ce36                	sw	a3,28(sp)
1c0085e0:	0ff00713          	li	a4,255
1c0085e4:	46a1                	li	a3,8
1c0085e6:	002047b7          	lui	a5,0x204
1c0085ea:	c832                	sw	a2,16(sp)
1c0085ec:	d036                	sw	a3,32(sp)
1c0085ee:	d226                	sw	s1,36(sp)
1c0085f0:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f7098>
1c0085f4:	20078413          	addi	s0,a5,512
1c0085f8:	c018                	sw	a4,0(s0)
1c0085fa:	20c78693          	addi	a3,a5,524
1c0085fe:	c298                	sw	a4,0(a3)
1c008600:	1c008737          	lui	a4,0x1c008
1c008604:	79e70713          	addi	a4,a4,1950 # 1c00879e <plp_mat_mult_i32p_xpulpv2>
1c008608:	08e7a023          	sw	a4,128(a5)
1c00860c:	0068                	addi	a0,sp,12
1c00860e:	08a7a023          	sw	a0,128(a5)
1c008612:	2271                	jal	1c00879e <plp_mat_mult_i32p_xpulpv2>
1c008614:	01c46783          	p.elw	a5,28(s0)
1c008618:	f14027f3          	csrr	a5,mhartid
1c00861c:	477d                	li	a4,31
1c00861e:	ca5797b3          	p.extractu	a5,a5,5,5
1c008622:	16e78663          	beq	a5,a4,1c00878e <cluster_entry+0x25e>
1c008626:	102007b7          	lui	a5,0x10200
1c00862a:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fd3ec>
1c00862e:	0007a023          	sw	zero,0(a5)
1c008632:	4781                	li	a5,0
1c008634:	7a179073          	csrw	pcmr,a5
1c008638:	10000937          	lui	s2,0x10000
1c00863c:	01490913          	addi	s2,s2,20 # 10000014 <m_c>
1c008640:	4a81                	li	s5,0
1c008642:	4401                	li	s0,0
1c008644:	1c000a37          	lui	s4,0x1c000
1c008648:	40000993          	li	s3,1024
1c00864c:	0044a70b          	p.lw	a4,4(s1!)
1c008650:	0049278b          	p.lw	a5,4(s2!)
1c008654:	85a2                	mv	a1,s0
1c008656:	863a                	mv	a2,a4
1c008658:	0405                	addi	s0,s0,1
1c00865a:	86be                	mv	a3,a5
1c00865c:	454a0513          	addi	a0,s4,1108 # 1c000454 <__DTOR_END__+0x168>
1c008660:	00f70563          	beq	a4,a5,1c00866a <cluster_entry+0x13a>
1c008664:	236020ef          	jal	ra,1c00a89a <printf>
1c008668:	0a85                	addi	s5,s5,1
1c00866a:	ff3411e3          	bne	s0,s3,1c00864c <cluster_entry+0x11c>
1c00866e:	0e0a9663          	bnez	s5,1c00875a <cluster_entry+0x22a>
1c008672:	1c000537          	lui	a0,0x1c000
1c008676:	48c50513          	addi	a0,a0,1164 # 1c00048c <__DTOR_END__+0x1a0>
1c00867a:	120020ef          	jal	ra,1c00a79a <puts>
1c00867e:	f14027f3          	csrr	a5,mhartid
1c008682:	477d                	li	a4,31
1c008684:	ca5797b3          	p.extractu	a5,a5,5,5
1c008688:	0ee78763          	beq	a5,a4,1c008776 <cluster_entry+0x246>
1c00868c:	10200437          	lui	s0,0x10200
1c008690:	40040413          	addi	s0,s0,1024 # 10200400 <__l1_end+0x1fd3ec>
1c008694:	00842403          	lw	s0,8(s0)
1c008698:	781024f3          	csrr	s1,pccr1
1c00869c:	782029f3          	csrr	s3,pccr2
1c0086a0:	78f02973          	csrr	s2,pccr15
1c0086a4:	1c000537          	lui	a0,0x1c000
1c0086a8:	85a2                	mv	a1,s0
1c0086aa:	4b450513          	addi	a0,a0,1204 # 1c0004b4 <__DTOR_END__+0x1c8>
1c0086ae:	1ec020ef          	jal	ra,1c00a89a <printf>
1c0086b2:	1c000537          	lui	a0,0x1c000
1c0086b6:	85a6                	mv	a1,s1
1c0086b8:	4c850513          	addi	a0,a0,1224 # 1c0004c8 <__DTOR_END__+0x1dc>
1c0086bc:	1de020ef          	jal	ra,1c00a89a <printf>
1c0086c0:	1c000537          	lui	a0,0x1c000
1c0086c4:	85ce                	mv	a1,s3
1c0086c6:	4dc50513          	addi	a0,a0,1244 # 1c0004dc <__DTOR_END__+0x1f0>
1c0086ca:	1d0020ef          	jal	ra,1c00a89a <printf>
1c0086ce:	1c000537          	lui	a0,0x1c000
1c0086d2:	85ca                	mv	a1,s2
1c0086d4:	4ec50513          	addi	a0,a0,1260 # 1c0004ec <__DTOR_END__+0x200>
1c0086d8:	1c2020ef          	jal	ra,1c00a89a <printf>
1c0086dc:	1c000537          	lui	a0,0x1c000
1c0086e0:	65c1                	lui	a1,0x10
1c0086e2:	4f850513          	addi	a0,a0,1272 # 1c0004f8 <__DTOR_END__+0x20c>
1c0086e6:	1b4020ef          	jal	ra,1c00a89a <printf>
1c0086ea:	006409b7          	lui	s3,0x640
1c0086ee:	6941                	lui	s2,0x10
1c0086f0:	0299d633          	divu	a2,s3,s1
1c0086f4:	1c000537          	lui	a0,0x1c000
1c0086f8:	50850513          	addi	a0,a0,1288 # 1c000508 <__DTOR_END__+0x21c>
1c0086fc:	029955b3          	divu	a1,s2,s1
1c008700:	19a020ef          	jal	ra,1c00a89a <printf>
1c008704:	0289d633          	divu	a2,s3,s0
1c008708:	1c000537          	lui	a0,0x1c000
1c00870c:	52850513          	addi	a0,a0,1320 # 1c000528 <__DTOR_END__+0x23c>
1c008710:	028955b3          	divu	a1,s2,s0
1c008714:	186020ef          	jal	ra,1c00a89a <printf>
1c008718:	40ba                	lw	ra,140(sp)
1c00871a:	442a                	lw	s0,136(sp)
1c00871c:	449a                	lw	s1,132(sp)
1c00871e:	490a                	lw	s2,128(sp)
1c008720:	59f6                	lw	s3,124(sp)
1c008722:	5a66                	lw	s4,120(sp)
1c008724:	5ad6                	lw	s5,116(sp)
1c008726:	6149                	addi	sp,sp,144
1c008728:	8082                	ret
1c00872a:	4785                	li	a5,1
1c00872c:	1a10b737          	lui	a4,0x1a10b
1c008730:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa10800c>
1c008734:	4781                	li	a5,0
1c008736:	79f79073          	csrw	pccr31,a5
1c00873a:	f14027f3          	csrr	a5,mhartid
1c00873e:	477d                	li	a4,31
1c008740:	ca5797b3          	p.extractu	a5,a5,5,5
1c008744:	e6e796e3          	bne	a5,a4,1c0085b0 <cluster_entry+0x80>
1c008748:	4785                	li	a5,1
1c00874a:	1a10b737          	lui	a4,0x1a10b
1c00874e:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa108004>
1c008752:	478d                	li	a5,3
1c008754:	7a179073          	csrw	pcmr,a5
1c008758:	b5b5                	j	1c0085c4 <cluster_entry+0x94>
1c00875a:	1c000537          	lui	a0,0x1c000
1c00875e:	85d6                	mv	a1,s5
1c008760:	4a050513          	addi	a0,a0,1184 # 1c0004a0 <__DTOR_END__+0x1b4>
1c008764:	136020ef          	jal	ra,1c00a89a <printf>
1c008768:	477d                	li	a4,31
1c00876a:	f14027f3          	csrr	a5,mhartid
1c00876e:	ca5797b3          	p.extractu	a5,a5,5,5
1c008772:	f0e79de3          	bne	a5,a4,1c00868c <cluster_entry+0x15c>
1c008776:	1a10b437          	lui	s0,0x1a10b
1c00877a:	00842403          	lw	s0,8(s0) # 1a10b008 <__l1_end+0xa107ff4>
1c00877e:	bf29                	j	1c008698 <cluster_entry+0x168>
1c008780:	1c000537          	lui	a0,0x1c000
1c008784:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c008788:	012020ef          	jal	ra,1c00a79a <puts>
1c00878c:	bdcd                	j	1c00867e <cluster_entry+0x14e>
1c00878e:	1a10b7b7          	lui	a5,0x1a10b
1c008792:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa107fec>
1c008796:	4781                	li	a5,0
1c008798:	7a179073          	csrw	pcmr,a5
1c00879c:	bd71                	j	1c008638 <cluster_entry+0x108>

1c00879e <plp_mat_mult_i32p_xpulpv2>:
1c00879e:	490c                	lw	a1,16(a0)
1c0087a0:	4950                	lw	a2,20(a0)
1c0087a2:	711d                	addi	sp,sp,-96
1c0087a4:	c8ce                	sw	s3,80(sp)
1c0087a6:	00c58733          	add	a4,a1,a2
1c0087aa:	177d                	addi	a4,a4,-1
1c0087ac:	02c75733          	divu	a4,a4,a2
1c0087b0:	00452983          	lw	s3,4(a0)
1c0087b4:	f14026f3          	csrr	a3,mhartid
1c0087b8:	f456b6b3          	p.bclr	a3,a3,26,5
1c0087bc:	d44e                	sw	s3,40(sp)
1c0087be:	4110                	lw	a2,0(a0)
1c0087c0:	d02e                	sw	a1,32(sp)
1c0087c2:	00c52383          	lw	t2,12(a0)
1c0087c6:	450c                	lw	a1,8(a0)
1c0087c8:	ce32                	sw	a2,28(sp)
1c0087ca:	4d08                	lw	a0,24(a0)
1c0087cc:	5602                	lw	a2,32(sp)
1c0087ce:	cea2                	sw	s0,92(sp)
1c0087d0:	cca6                	sw	s1,88(sp)
1c0087d2:	caca                	sw	s2,84(sp)
1c0087d4:	c6d2                	sw	s4,76(sp)
1c0087d6:	c4d6                	sw	s5,72(sp)
1c0087d8:	c2da                	sw	s6,68(sp)
1c0087da:	c0de                	sw	s7,64(sp)
1c0087dc:	de62                	sw	s8,60(sp)
1c0087de:	dc66                	sw	s9,56(sp)
1c0087e0:	da6a                	sw	s10,52(sp)
1c0087e2:	d86e                	sw	s11,48(sp)
1c0087e4:	cc2e                	sw	a1,24(sp)
1c0087e6:	d62a                	sw	a0,44(sp)
1c0087e8:	c832                	sw	a2,16(sp)
1c0087ea:	02d709b3          	mul	s3,a4,a3
1c0087ee:	ca4e                	sw	s3,20(sp)
1c0087f0:	0076a463          	p.beqimm	a3,7,1c0087f8 <plp_mat_mult_i32p_xpulpv2+0x5a>
1c0087f4:	974e                	add	a4,a4,s3
1c0087f6:	c83a                	sw	a4,16(sp)
1c0087f8:	45c2                	lw	a1,16(sp)
1c0087fa:	4652                	lw	a2,20(sp)
1c0087fc:	22b67263          	bleu	a1,a2,1c008a20 <plp_mat_mult_i32p_xpulpv2+0x282>
1c008800:	5682                	lw	a3,32(sp)
1c008802:	4762                	lw	a4,24(sp)
1c008804:	59b2                	lw	s3,44(sp)
1c008806:	55a2                	lw	a1,40(sp)
1c008808:	00261c13          	slli	s8,a2,0x2
1c00880c:	00160b93          	addi	s7,a2,1
1c008810:	00269d13          	slli	s10,a3,0x2
1c008814:	99e2                	add	s3,s3,s8
1c008816:	0b8a                	slli	s7,s7,0x2
1c008818:	8305                	srli	a4,a4,0x1
1c00881a:	c432                	sw	a2,8(sp)
1c00881c:	004d0613          	addi	a2,s10,4
1c008820:	c63a                	sw	a4,12(sp)
1c008822:	c24e                	sw	s3,4(sp)
1c008824:	9c2e                	add	s8,s8,a1
1c008826:	9bae                	add	s7,s7,a1
1c008828:	00369d93          	slli	s11,a3,0x3
1c00882c:	00339c93          	slli	s9,t2,0x3
1c008830:	00239b13          	slli	s6,t2,0x2
1c008834:	d232                	sw	a2,36(sp)
1c008836:	45b2                	lw	a1,12(sp)
1c008838:	1c058b63          	beqz	a1,1c008a0e <plp_mat_mult_i32p_xpulpv2+0x270>
1c00883c:	4612                	lw	a2,4(sp)
1c00883e:	5692                	lw	a3,36(sp)
1c008840:	42f2                	lw	t0,28(sp)
1c008842:	01a60ab3          	add	s5,a2,s10
1c008846:	00460a13          	addi	s4,a2,4
1c00884a:	00c689b3          	add	s3,a3,a2
1c00884e:	8932                	mv	s2,a2
1c008850:	4481                	li	s1,0
1c008852:	842e                	mv	s0,a1
1c008854:	02d4407b          	lp.setup	x0,s0,1c0088ae <plp_mat_mult_i32p_xpulpv2+0x110>
1c008858:	1a038563          	beqz	t2,1c008a02 <plp_mat_mult_i32p_xpulpv2+0x264>
1c00885c:	ffcb0793          	addi	a5,s6,-4
1c008860:	8389                	srli	a5,a5,0x2
1c008862:	8fde                	mv	t6,s7
1c008864:	8f62                	mv	t5,s8
1c008866:	8e96                	mv	t4,t0
1c008868:	4301                	li	t1,0
1c00886a:	4881                	li	a7,0
1c00886c:	4801                	li	a6,0
1c00886e:	4501                	li	a0,0
1c008870:	005b0e33          	add	t3,s6,t0
1c008874:	0785                	addi	a5,a5,1
1c008876:	0107c0fb          	lp.setup	x1,a5,1c008896 <plp_mat_mult_i32p_xpulpv2+0xf8>
1c00887a:	004ea58b          	p.lw	a1,4(t4!)
1c00887e:	004e268b          	p.lw	a3,4(t3!)
1c008882:	21af760b          	p.lw	a2,s10(t5!)
1c008886:	21aff70b          	p.lw	a4,s10(t6!)
1c00888a:	42c58533          	p.mac	a0,a1,a2
1c00888e:	42e58833          	p.mac	a6,a1,a4
1c008892:	42c688b3          	p.mac	a7,a3,a2
1c008896:	42e68333          	p.mac	t1,a3,a4
1c00889a:	879e                	mv	a5,t2
1c00889c:	00a96dab          	p.sw	a0,s11(s2!)
1c0088a0:	010a6dab          	p.sw	a6,s11(s4!)
1c0088a4:	011aedab          	p.sw	a7,s11(s5!)
1c0088a8:	0069edab          	p.sw	t1,s11(s3!)
1c0088ac:	0485                	addi	s1,s1,1
1c0088ae:	92e6                	add	t0,t0,s9
1c0088b0:	46a2                	lw	a3,8(sp)
1c0088b2:	4712                	lw	a4,4(sp)
1c0088b4:	49c2                	lw	s3,16(sp)
1c0088b6:	0689                	addi	a3,a3,2
1c0088b8:	0721                	addi	a4,a4,8
1c0088ba:	c436                	sw	a3,8(sp)
1c0088bc:	c23a                	sw	a4,4(sp)
1c0088be:	0c21                	addi	s8,s8,8
1c0088c0:	0ba1                	addi	s7,s7,8
1c0088c2:	f736eae3          	bltu	a3,s3,1c008836 <plp_mat_mult_i32p_xpulpv2+0x98>
1c0088c6:	49e2                	lw	s3,24(sp)
1c0088c8:	0486                	slli	s1,s1,0x1
1c0088ca:	14998463          	beq	s3,s1,1c008a12 <plp_mat_mult_i32p_xpulpv2+0x274>
1c0088ce:	08778163          	beq	a5,t2,1c008950 <plp_mat_mult_i32p_xpulpv2+0x1b2>
1c0088d2:	45a2                	lw	a1,8(sp)
1c0088d4:	06b4fe63          	bleu	a1,s1,1c008950 <plp_mat_mult_i32p_xpulpv2+0x1b2>
1c0088d8:	cca5                	beqz	s1,1c008950 <plp_mat_mult_i32p_xpulpv2+0x1b2>
1c0088da:	4652                	lw	a2,20(sp)
1c0088dc:	5702                	lw	a4,32(sp)
1c0088de:	56b2                	lw	a3,44(sp)
1c0088e0:	8e32                	mv	t3,a2
1c0088e2:	42e78e33          	p.mac	t3,a5,a4
1c0088e6:	49f2                	lw	s3,28(sp)
1c0088e8:	55a2                	lw	a1,40(sp)
1c0088ea:	00261f93          	slli	t6,a2,0x2
1c0088ee:	00279293          	slli	t0,a5,0x2
1c0088f2:	40f38f33          	sub	t5,t2,a5
1c0088f6:	9fb6                	add	t6,t6,a3
1c0088f8:	00271413          	slli	s0,a4,0x2
1c0088fc:	00239e93          	slli	t4,t2,0x2
1c008900:	92ce                	add	t0,t0,s3
1c008902:	0e0a                	slli	t3,t3,0x2
1c008904:	0f0a                	slli	t5,t5,0x2
1c008906:	9e2e                	add	t3,t3,a1
1c008908:	8316                	mv	t1,t0
1c00890a:	88fe                	mv	a7,t6
1c00890c:	8826                	mv	a6,s1
1c00890e:	01a8407b          	lp.setup	x0,a6,1c008942 <plp_mat_mult_i32p_xpulpv2+0x1a4>
1c008912:	4681                	li	a3,0
1c008914:	0277f363          	bleu	t2,a5,1c00893a <plp_mat_mult_i32p_xpulpv2+0x19c>
1c008918:	ffcf0713          	addi	a4,t5,-4
1c00891c:	8309                	srli	a4,a4,0x2
1c00891e:	85f2                	mv	a1,t3
1c008920:	861a                	mv	a2,t1
1c008922:	4681                	li	a3,0
1c008924:	0705                	addi	a4,a4,1
1c008926:	009740fb          	lp.setup	x1,a4,1c008938 <plp_mat_mult_i32p_xpulpv2+0x19a>
1c00892a:	0046290b          	p.lw	s2,4(a2!)
1c00892e:	2085f50b          	p.lw	a0,s0(a1!)
1c008932:	89b6                	mv	s3,a3
1c008934:	42a909b3          	p.mac	s3,s2,a0
1c008938:	96ce                	add	a3,a3,s3
1c00893a:	0008a703          	lw	a4,0(a7)
1c00893e:	9376                	add	t1,t1,t4
1c008940:	96ba                	add	a3,a3,a4
1c008942:	00d8e42b          	p.sw	a3,s0(a7!)
1c008946:	45a2                	lw	a1,8(sp)
1c008948:	0f91                	addi	t6,t6,4
1c00894a:	0e11                	addi	t3,t3,4
1c00894c:	fab4eee3          	bltu	s1,a1,1c008908 <plp_mat_mult_i32p_xpulpv2+0x16a>
1c008950:	4622                	lw	a2,8(sp)
1c008952:	46d2                	lw	a3,20(sp)
1c008954:	08c6f363          	bleu	a2,a3,1c0089da <plp_mat_mult_i32p_xpulpv2+0x23c>
1c008958:	4762                	lw	a4,24(sp)
1c00895a:	08e4f063          	bleu	a4,s1,1c0089da <plp_mat_mult_i32p_xpulpv2+0x23c>
1c00895e:	5782                	lw	a5,32(sp)
1c008960:	82b6                	mv	t0,a3
1c008962:	4972                	lw	s2,28(sp)
1c008964:	4472                	lw	s0,28(sp)
1c008966:	429782b3          	p.mac	t0,a5,s1
1c00896a:	00239e93          	slli	t4,t2,0x2
1c00896e:	00148793          	addi	a5,s1,1
1c008972:	59a2                	lw	s3,40(sp)
1c008974:	00261f93          	slli	t6,a2,0x2
1c008978:	5582                	lw	a1,32(sp)
1c00897a:	5632                	lw	a2,44(sp)
1c00897c:	00269f13          	slli	t5,a3,0x2
1c008980:	9f4e                	add	t5,t5,s3
1c008982:	9fce                	add	t6,t6,s3
1c008984:	43d48933          	p.mac	s2,s1,t4
1c008988:	028a                	slli	t0,t0,0x2
1c00898a:	00259993          	slli	s3,a1,0x2
1c00898e:	92b2                	add	t0,t0,a2
1c008990:	43d78433          	p.mac	s0,a5,t4
1c008994:	46e2                	lw	a3,24(sp)
1c008996:	8322                	mv	t1,s0
1c008998:	884a                	mv	a6,s2
1c00899a:	8e16                	mv	t3,t0
1c00899c:	409688b3          	sub	a7,a3,s1
1c0089a0:	0188c07b          	lp.setup	x0,a7,1c0089d0 <plp_mat_mult_i32p_xpulpv2+0x232>
1c0089a4:	4701                	li	a4,0
1c0089a6:	02038263          	beqz	t2,1c0089ca <plp_mat_mult_i32p_xpulpv2+0x22c>
1c0089aa:	410307b3          	sub	a5,t1,a6
1c0089ae:	17f1                	addi	a5,a5,-4
1c0089b0:	8389                	srli	a5,a5,0x2
1c0089b2:	867a                	mv	a2,t5
1c0089b4:	86c2                	mv	a3,a6
1c0089b6:	4701                	li	a4,0
1c0089b8:	0785                	addi	a5,a5,1
1c0089ba:	0067c0fb          	lp.setup	x1,a5,1c0089c6 <plp_mat_mult_i32p_xpulpv2+0x228>
1c0089be:	0046a50b          	p.lw	a0,4(a3!)
1c0089c2:	2136758b          	p.lw	a1,s3(a2!)
1c0089c6:	42b50733          	p.mac	a4,a0,a1
1c0089ca:	00ee69ab          	p.sw	a4,s3(t3!)
1c0089ce:	9876                	add	a6,a6,t4
1c0089d0:	9376                	add	t1,t1,t4
1c0089d2:	0f11                	addi	t5,t5,4
1c0089d4:	0291                	addi	t0,t0,4
1c0089d6:	fbef9fe3          	bne	t6,t5,1c008994 <plp_mat_mult_i32p_xpulpv2+0x1f6>
1c0089da:	002047b7          	lui	a5,0x204
1c0089de:	20078793          	addi	a5,a5,512 # 204200 <__l1_heap_size+0x1f7214>
1c0089e2:	01c7e703          	p.elw	a4,28(a5)
1c0089e6:	4476                	lw	s0,92(sp)
1c0089e8:	44e6                	lw	s1,88(sp)
1c0089ea:	4956                	lw	s2,84(sp)
1c0089ec:	49c6                	lw	s3,80(sp)
1c0089ee:	4a36                	lw	s4,76(sp)
1c0089f0:	4aa6                	lw	s5,72(sp)
1c0089f2:	4b16                	lw	s6,68(sp)
1c0089f4:	4b86                	lw	s7,64(sp)
1c0089f6:	5c72                	lw	s8,60(sp)
1c0089f8:	5ce2                	lw	s9,56(sp)
1c0089fa:	5d52                	lw	s10,52(sp)
1c0089fc:	5dc2                	lw	s11,48(sp)
1c0089fe:	6125                	addi	sp,sp,96
1c008a00:	8082                	ret
1c008a02:	4781                	li	a5,0
1c008a04:	4301                	li	t1,0
1c008a06:	4881                	li	a7,0
1c008a08:	4801                	li	a6,0
1c008a0a:	4501                	li	a0,0
1c008a0c:	bd41                	j	1c00889c <plp_mat_mult_i32p_xpulpv2+0xfe>
1c008a0e:	4481                	li	s1,0
1c008a10:	b545                	j	1c0088b0 <plp_mat_mult_i32p_xpulpv2+0x112>
1c008a12:	ec7790e3          	bne	a5,t2,1c0088d2 <plp_mat_mult_i32p_xpulpv2+0x134>
1c008a16:	4622                	lw	a2,8(sp)
1c008a18:	46c2                	lw	a3,16(sp)
1c008a1a:	f2d61be3          	bne	a2,a3,1c008950 <plp_mat_mult_i32p_xpulpv2+0x1b2>
1c008a1e:	bf75                	j	1c0089da <plp_mat_mult_i32p_xpulpv2+0x23c>
1c008a20:	c432                	sw	a2,8(sp)
1c008a22:	b555                	j	1c0088c6 <plp_mat_mult_i32p_xpulpv2+0x128>

1c008a24 <main>:
1c008a24:	1101                	addi	sp,sp,-32
1c008a26:	4681                	li	a3,0
1c008a28:	4601                	li	a2,0
1c008a2a:	4581                	li	a1,0
1c008a2c:	4505                	li	a0,1
1c008a2e:	ce06                	sw	ra,28(sp)
1c008a30:	2559                	jal	1c0090b6 <rt_cluster_mount>
1c008a32:	1c008637          	lui	a2,0x1c008
1c008a36:	4881                	li	a7,0
1c008a38:	4801                	li	a6,0
1c008a3a:	4781                	li	a5,0
1c008a3c:	4701                	li	a4,0
1c008a3e:	4681                	li	a3,0
1c008a40:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c008a44:	4581                	li	a1,0
1c008a46:	c002                	sw	zero,0(sp)
1c008a48:	4501                	li	a0,0
1c008a4a:	2bc9                	jal	1c00901c <rt_cluster_call>
1c008a4c:	4501                	li	a0,0
1c008a4e:	4681                	li	a3,0
1c008a50:	4601                	li	a2,0
1c008a52:	4581                	li	a1,0
1c008a54:	258d                	jal	1c0090b6 <rt_cluster_mount>
1c008a56:	40f2                	lw	ra,28(sp)
1c008a58:	4501                	li	a0,0
1c008a5a:	6105                	addi	sp,sp,32
1c008a5c:	8082                	ret

1c008a5e <rt_user_alloc_init>:
1c008a5e:	00758793          	addi	a5,a1,7 # 10007 <__l1_heap_size+0x301b>
1c008a62:	9be1                	andi	a5,a5,-8
1c008a64:	40b785b3          	sub	a1,a5,a1
1c008a68:	c11c                	sw	a5,0(a0)
1c008a6a:	8e0d                	sub	a2,a2,a1
1c008a6c:	00c05663          	blez	a2,1c008a78 <rt_user_alloc_init+0x1a>
1c008a70:	9a61                	andi	a2,a2,-8
1c008a72:	c390                	sw	a2,0(a5)
1c008a74:	0007a223          	sw	zero,4(a5)
1c008a78:	8082                	ret

1c008a7a <rt_user_alloc>:
1c008a7a:	411c                	lw	a5,0(a0)
1c008a7c:	059d                	addi	a1,a1,7
1c008a7e:	99e1                	andi	a1,a1,-8
1c008a80:	4681                	li	a3,0
1c008a82:	cb89                	beqz	a5,1c008a94 <rt_user_alloc+0x1a>
1c008a84:	4398                	lw	a4,0(a5)
1c008a86:	00b74963          	blt	a4,a1,1c008a98 <rt_user_alloc+0x1e>
1c008a8a:	00b71c63          	bne	a4,a1,1c008aa2 <rt_user_alloc+0x28>
1c008a8e:	43d8                	lw	a4,4(a5)
1c008a90:	c699                	beqz	a3,1c008a9e <rt_user_alloc+0x24>
1c008a92:	c2d8                	sw	a4,4(a3)
1c008a94:	853e                	mv	a0,a5
1c008a96:	8082                	ret
1c008a98:	86be                	mv	a3,a5
1c008a9a:	43dc                	lw	a5,4(a5)
1c008a9c:	b7dd                	j	1c008a82 <rt_user_alloc+0x8>
1c008a9e:	c118                	sw	a4,0(a0)
1c008aa0:	bfd5                	j	1c008a94 <rt_user_alloc+0x1a>
1c008aa2:	8f0d                	sub	a4,a4,a1
1c008aa4:	c398                	sw	a4,0(a5)
1c008aa6:	97ba                	add	a5,a5,a4
1c008aa8:	b7f5                	j	1c008a94 <rt_user_alloc+0x1a>

1c008aaa <rt_user_free>:
1c008aaa:	411c                	lw	a5,0(a0)
1c008aac:	061d                	addi	a2,a2,7
1c008aae:	9a61                	andi	a2,a2,-8
1c008ab0:	4701                	li	a4,0
1c008ab2:	c399                	beqz	a5,1c008ab8 <rt_user_free+0xe>
1c008ab4:	02b7e763          	bltu	a5,a1,1c008ae2 <rt_user_free+0x38>
1c008ab8:	00c586b3          	add	a3,a1,a2
1c008abc:	02d79663          	bne	a5,a3,1c008ae8 <rt_user_free+0x3e>
1c008ac0:	4394                	lw	a3,0(a5)
1c008ac2:	43dc                	lw	a5,4(a5)
1c008ac4:	9636                	add	a2,a2,a3
1c008ac6:	c190                	sw	a2,0(a1)
1c008ac8:	c1dc                	sw	a5,4(a1)
1c008aca:	c31d                	beqz	a4,1c008af0 <rt_user_free+0x46>
1c008acc:	4314                	lw	a3,0(a4)
1c008ace:	00d707b3          	add	a5,a4,a3
1c008ad2:	00f59d63          	bne	a1,a5,1c008aec <rt_user_free+0x42>
1c008ad6:	419c                	lw	a5,0(a1)
1c008ad8:	97b6                	add	a5,a5,a3
1c008ada:	c31c                	sw	a5,0(a4)
1c008adc:	41dc                	lw	a5,4(a1)
1c008ade:	c35c                	sw	a5,4(a4)
1c008ae0:	8082                	ret
1c008ae2:	873e                	mv	a4,a5
1c008ae4:	43dc                	lw	a5,4(a5)
1c008ae6:	b7f1                	j	1c008ab2 <rt_user_free+0x8>
1c008ae8:	c190                	sw	a2,0(a1)
1c008aea:	bff9                	j	1c008ac8 <rt_user_free+0x1e>
1c008aec:	c34c                	sw	a1,4(a4)
1c008aee:	8082                	ret
1c008af0:	c10c                	sw	a1,0(a0)
1c008af2:	8082                	ret

1c008af4 <rt_alloc>:
1c008af4:	1101                	addi	sp,sp,-32
1c008af6:	cc22                	sw	s0,24(sp)
1c008af8:	ce06                	sw	ra,28(sp)
1c008afa:	ca26                	sw	s1,20(sp)
1c008afc:	c84a                	sw	s2,16(sp)
1c008afe:	c64e                	sw	s3,12(sp)
1c008b00:	c452                	sw	s4,8(sp)
1c008b02:	4789                	li	a5,2
1c008b04:	842a                	mv	s0,a0
1c008b06:	02a7ed63          	bltu	a5,a0,1c008b40 <rt_alloc+0x4c>
1c008b0a:	1c001937          	lui	s2,0x1c001
1c008b0e:	89ae                	mv	s3,a1
1c008b10:	448d                	li	s1,3
1c008b12:	1f890913          	addi	s2,s2,504 # 1c0011f8 <__rt_alloc_l2>
1c008b16:	4a0d                	li	s4,3
1c008b18:	00241513          	slli	a0,s0,0x2
1c008b1c:	85ce                	mv	a1,s3
1c008b1e:	954a                	add	a0,a0,s2
1c008b20:	3fa9                	jal	1c008a7a <rt_user_alloc>
1c008b22:	e519                	bnez	a0,1c008b30 <rt_alloc+0x3c>
1c008b24:	0405                	addi	s0,s0,1
1c008b26:	01441363          	bne	s0,s4,1c008b2c <rt_alloc+0x38>
1c008b2a:	4401                	li	s0,0
1c008b2c:	14fd                	addi	s1,s1,-1
1c008b2e:	f4ed                	bnez	s1,1c008b18 <rt_alloc+0x24>
1c008b30:	40f2                	lw	ra,28(sp)
1c008b32:	4462                	lw	s0,24(sp)
1c008b34:	44d2                	lw	s1,20(sp)
1c008b36:	4942                	lw	s2,16(sp)
1c008b38:	49b2                	lw	s3,12(sp)
1c008b3a:	4a22                	lw	s4,8(sp)
1c008b3c:	6105                	addi	sp,sp,32
1c008b3e:	8082                	ret
1c008b40:	1c0017b7          	lui	a5,0x1c001
1c008b44:	ffd50413          	addi	s0,a0,-3
1c008b48:	1f47a503          	lw	a0,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008b4c:	040a                	slli	s0,s0,0x2
1c008b4e:	40f2                	lw	ra,28(sp)
1c008b50:	9522                	add	a0,a0,s0
1c008b52:	4462                	lw	s0,24(sp)
1c008b54:	44d2                	lw	s1,20(sp)
1c008b56:	4942                	lw	s2,16(sp)
1c008b58:	49b2                	lw	s3,12(sp)
1c008b5a:	4a22                	lw	s4,8(sp)
1c008b5c:	6105                	addi	sp,sp,32
1c008b5e:	bf31                	j	1c008a7a <rt_user_alloc>

1c008b60 <__rt_alloc_init_l1>:
1c008b60:	1c0017b7          	lui	a5,0x1c001
1c008b64:	1f47a703          	lw	a4,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008b68:	100037b7          	lui	a5,0x10003
1c008b6c:	01651593          	slli	a1,a0,0x16
1c008b70:	6635                	lui	a2,0xd
1c008b72:	050a                	slli	a0,a0,0x2
1c008b74:	01478793          	addi	a5,a5,20 # 10003014 <__l1_end>
1c008b78:	fec60613          	addi	a2,a2,-20 # cfec <__l1_heap_size>
1c008b7c:	95be                	add	a1,a1,a5
1c008b7e:	953a                	add	a0,a0,a4
1c008b80:	bdf9                	j	1c008a5e <rt_user_alloc_init>

1c008b82 <__rt_alloc_init_l1_for_fc>:
1c008b82:	100035b7          	lui	a1,0x10003
1c008b86:	01651793          	slli	a5,a0,0x16
1c008b8a:	01458593          	addi	a1,a1,20 # 10003014 <__l1_end>
1c008b8e:	00b78733          	add	a4,a5,a1
1c008b92:	050a                	slli	a0,a0,0x2
1c008b94:	0791                	addi	a5,a5,4
1c008b96:	6635                	lui	a2,0xd
1c008b98:	1c0016b7          	lui	a3,0x1c001
1c008b9c:	fe860613          	addi	a2,a2,-24 # cfe8 <_l1_preload_size+0x9fd8>
1c008ba0:	95be                	add	a1,a1,a5
1c008ba2:	953a                	add	a0,a0,a4
1c008ba4:	1ee6aa23          	sw	a4,500(a3) # 1c0011f4 <__rt_alloc_l1>
1c008ba8:	bd5d                	j	1c008a5e <rt_user_alloc_init>

1c008baa <__rt_allocs_init>:
1c008baa:	1141                	addi	sp,sp,-16
1c008bac:	1c0015b7          	lui	a1,0x1c001
1c008bb0:	c606                	sw	ra,12(sp)
1c008bb2:	24458793          	addi	a5,a1,580 # 1c001244 <__l2_priv0_end>
1c008bb6:	1c008637          	lui	a2,0x1c008
1c008bba:	06c7ca63          	blt	a5,a2,1c008c2e <__rt_allocs_init+0x84>
1c008bbe:	4581                	li	a1,0
1c008bc0:	4601                	li	a2,0
1c008bc2:	1c001537          	lui	a0,0x1c001
1c008bc6:	1f850513          	addi	a0,a0,504 # 1c0011f8 <__rt_alloc_l2>
1c008bca:	3d51                	jal	1c008a5e <rt_user_alloc_init>
1c008bcc:	1c00b5b7          	lui	a1,0x1c00b
1c008bd0:	50458793          	addi	a5,a1,1284 # 1c00b504 <__l2_priv1_end>
1c008bd4:	1c010637          	lui	a2,0x1c010
1c008bd8:	04c7cf63          	blt	a5,a2,1c008c36 <__rt_allocs_init+0x8c>
1c008bdc:	4581                	li	a1,0
1c008bde:	4601                	li	a2,0
1c008be0:	1c001537          	lui	a0,0x1c001
1c008be4:	1fc50513          	addi	a0,a0,508 # 1c0011fc <__rt_alloc_l2+0x4>
1c008be8:	3d9d                	jal	1c008a5e <rt_user_alloc_init>
1c008bea:	1c0135b7          	lui	a1,0x1c013
1c008bee:	19858793          	addi	a5,a1,408 # 1c013198 <__l2_shared_end>
1c008bf2:	1c080637          	lui	a2,0x1c080
1c008bf6:	1c001537          	lui	a0,0x1c001
1c008bfa:	8e1d                	sub	a2,a2,a5
1c008bfc:	19858593          	addi	a1,a1,408
1c008c00:	20050513          	addi	a0,a0,512 # 1c001200 <__rt_alloc_l2+0x8>
1c008c04:	3da9                	jal	1c008a5e <rt_user_alloc_init>
1c008c06:	f14027f3          	csrr	a5,mhartid
1c008c0a:	8795                	srai	a5,a5,0x5
1c008c0c:	03f7f793          	andi	a5,a5,63
1c008c10:	e789                	bnez	a5,1c008c1a <__rt_allocs_init+0x70>
1c008c12:	40b2                	lw	ra,12(sp)
1c008c14:	4501                	li	a0,0
1c008c16:	0141                	addi	sp,sp,16
1c008c18:	b7ad                	j	1c008b82 <__rt_alloc_init_l1_for_fc>
1c008c1a:	4591                	li	a1,4
1c008c1c:	4501                	li	a0,0
1c008c1e:	3dd9                	jal	1c008af4 <rt_alloc>
1c008c20:	40b2                	lw	ra,12(sp)
1c008c22:	1c0017b7          	lui	a5,0x1c001
1c008c26:	1ea7aa23          	sw	a0,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008c2a:	0141                	addi	sp,sp,16
1c008c2c:	8082                	ret
1c008c2e:	8e1d                	sub	a2,a2,a5
1c008c30:	24458593          	addi	a1,a1,580
1c008c34:	b779                	j	1c008bc2 <__rt_allocs_init+0x18>
1c008c36:	8e1d                	sub	a2,a2,a5
1c008c38:	50458593          	addi	a1,a1,1284
1c008c3c:	b755                	j	1c008be0 <__rt_allocs_init+0x36>

1c008c3e <__rt_init_cluster_data>:
1c008c3e:	04050793          	addi	a5,a0,64
1c008c42:	01679693          	slli	a3,a5,0x16
1c008c46:	6705                	lui	a4,0x1
1c008c48:	177d                	addi	a4,a4,-1
1c008c4a:	00400793          	li	a5,4
1c008c4e:	8ff9                	and	a5,a5,a4
1c008c50:	1c010737          	lui	a4,0x1c010
1c008c54:	97b6                	add	a5,a5,a3
1c008c56:	660d                	lui	a2,0x3
1c008c58:	18870713          	addi	a4,a4,392 # 1c010188 <_l1_preload_start_inL2>
1c008c5c:	01060613          	addi	a2,a2,16 # 3010 <_l1_preload_size>
1c008c60:	8f99                	sub	a5,a5,a4
1c008c62:	00f705b3          	add	a1,a4,a5
1c008c66:	02c04b63          	bgtz	a2,1c008c9c <__rt_init_cluster_data+0x5e>
1c008c6a:	02800713          	li	a4,40
1c008c6e:	02e50733          	mul	a4,a0,a4
1c008c72:	1c0017b7          	lui	a5,0x1c001
1c008c76:	20878513          	addi	a0,a5,520 # 1c001208 <__rt_fc_cluster_data>
1c008c7a:	002017b7          	lui	a5,0x201
1c008c7e:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f3e18>
1c008c82:	97b6                	add	a5,a5,a3
1c008c84:	953a                	add	a0,a0,a4
1c008c86:	c91c                	sw	a5,16(a0)
1c008c88:	6705                	lui	a4,0x1
1c008c8a:	00400793          	li	a5,4
1c008c8e:	177d                	addi	a4,a4,-1
1c008c90:	8ff9                	and	a5,a5,a4
1c008c92:	97b6                	add	a5,a5,a3
1c008c94:	00052423          	sw	zero,8(a0)
1c008c98:	c95c                	sw	a5,20(a0)
1c008c9a:	8082                	ret
1c008c9c:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008ca0:	1671                	addi	a2,a2,-4
1c008ca2:	0711                	addi	a4,a4,4
1c008ca4:	0105a023          	sw	a6,0(a1)
1c008ca8:	bf6d                	j	1c008c62 <__rt_init_cluster_data+0x24>

1c008caa <__rt_cluster_mount_step>:
1c008caa:	7179                	addi	sp,sp,-48
1c008cac:	d04a                	sw	s2,32(sp)
1c008cae:	ce4e                	sw	s3,28(sp)
1c008cb0:	6785                	lui	a5,0x1
1c008cb2:	1c0089b7          	lui	s3,0x1c008
1c008cb6:	00400913          	li	s2,4
1c008cba:	17fd                	addi	a5,a5,-1
1c008cbc:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008cc0:	d422                	sw	s0,40(sp)
1c008cc2:	d606                	sw	ra,44(sp)
1c008cc4:	d226                	sw	s1,36(sp)
1c008cc6:	cc52                	sw	s4,24(sp)
1c008cc8:	842a                	mv	s0,a0
1c008cca:	00f97933          	and	s2,s2,a5
1c008cce:	f009f993          	andi	s3,s3,-256
1c008cd2:	4c5c                	lw	a5,28(s0)
1c008cd4:	4705                	li	a4,1
1c008cd6:	02e78d63          	beq	a5,a4,1c008d10 <__rt_cluster_mount_step+0x66>
1c008cda:	4709                	li	a4,2
1c008cdc:	0ae78d63          	beq	a5,a4,1c008d96 <__rt_cluster_mount_step+0xec>
1c008ce0:	e7dd                	bnez	a5,1c008d8e <__rt_cluster_mount_step+0xe4>
1c008ce2:	5018                	lw	a4,32(s0)
1c008ce4:	00042c23          	sw	zero,24(s0)
1c008ce8:	eb01                	bnez	a4,1c008cf8 <__rt_cluster_mount_step+0x4e>
1c008cea:	5048                	lw	a0,36(s0)
1c008cec:	006c                	addi	a1,sp,12
1c008cee:	c602                	sw	zero,12(sp)
1c008cf0:	1e8010ef          	jal	ra,1c009ed8 <__rt_pmu_cluster_power_up>
1c008cf4:	47b2                	lw	a5,12(sp)
1c008cf6:	cc08                	sw	a0,24(s0)
1c008cf8:	4c58                	lw	a4,28(s0)
1c008cfa:	0705                	addi	a4,a4,1
1c008cfc:	cc58                	sw	a4,28(s0)
1c008cfe:	dbf1                	beqz	a5,1c008cd2 <__rt_cluster_mount_step+0x28>
1c008d00:	50b2                	lw	ra,44(sp)
1c008d02:	5422                	lw	s0,40(sp)
1c008d04:	5492                	lw	s1,36(sp)
1c008d06:	5902                	lw	s2,32(sp)
1c008d08:	49f2                	lw	s3,28(sp)
1c008d0a:	4a62                	lw	s4,24(sp)
1c008d0c:	6145                	addi	sp,sp,48
1c008d0e:	8082                	ret
1c008d10:	02042a03          	lw	s4,32(s0)
1c008d14:	040a0493          	addi	s1,s4,64
1c008d18:	04da                	slli	s1,s1,0x16
1c008d1a:	00990733          	add	a4,s2,s1
1c008d1e:	00072223          	sw	zero,4(a4)
1c008d22:	00072423          	sw	zero,8(a4)
1c008d26:	00072023          	sw	zero,0(a4)
1c008d2a:	1c001737          	lui	a4,0x1c001
1c008d2e:	0dc72703          	lw	a4,220(a4) # 1c0010dc <__rt_platform>
1c008d32:	00f70f63          	beq	a4,a5,1c008d50 <__rt_cluster_mount_step+0xa6>
1c008d36:	4505                	li	a0,1
1c008d38:	727000ef          	jal	ra,1c009c5e <__rt_fll_init>
1c008d3c:	1c0017b7          	lui	a5,0x1c001
1c008d40:	23878793          	addi	a5,a5,568 # 1c001238 <__rt_freq_domains>
1c008d44:	43cc                	lw	a1,4(a5)
1c008d46:	c5b1                	beqz	a1,1c008d92 <__rt_cluster_mount_step+0xe8>
1c008d48:	4601                	li	a2,0
1c008d4a:	4505                	li	a0,1
1c008d4c:	0a8010ef          	jal	ra,1c009df4 <rt_freq_set_and_get>
1c008d50:	8552                	mv	a0,s4
1c008d52:	35f5                	jal	1c008c3e <__rt_init_cluster_data>
1c008d54:	8552                	mv	a0,s4
1c008d56:	3529                	jal	1c008b60 <__rt_alloc_init_l1>
1c008d58:	002017b7          	lui	a5,0x201
1c008d5c:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f4414>
1c008d60:	97a6                	add	a5,a5,s1
1c008d62:	577d                	li	a4,-1
1c008d64:	c398                	sw	a4,0(a5)
1c008d66:	002007b7          	lui	a5,0x200
1c008d6a:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f3054>
1c008d6e:	06078793          	addi	a5,a5,96
1c008d72:	9726                	add	a4,a4,s1
1c008d74:	97a6                	add	a5,a5,s1
1c008d76:	01372023          	sw	s3,0(a4)
1c008d7a:	0711                	addi	a4,a4,4
1c008d7c:	fef71de3          	bne	a4,a5,1c008d76 <__rt_cluster_mount_step+0xcc>
1c008d80:	002007b7          	lui	a5,0x200
1c008d84:	07a1                	addi	a5,a5,8
1c008d86:	94be                	add	s1,s1,a5
1c008d88:	0ff00793          	li	a5,255
1c008d8c:	c09c                	sw	a5,0(s1)
1c008d8e:	4781                	li	a5,0
1c008d90:	b7a5                	j	1c008cf8 <__rt_cluster_mount_step+0x4e>
1c008d92:	c3c8                	sw	a0,4(a5)
1c008d94:	bf75                	j	1c008d50 <__rt_cluster_mount_step+0xa6>
1c008d96:	505c                	lw	a5,36(s0)
1c008d98:	5b98                	lw	a4,48(a5)
1c008d9a:	d398                	sw	a4,32(a5)
1c008d9c:	5798                	lw	a4,40(a5)
1c008d9e:	c398                	sw	a4,0(a5)
1c008da0:	57d8                	lw	a4,44(a5)
1c008da2:	c3d8                	sw	a4,4(a5)
1c008da4:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f3044>
1c008da8:	505c                	lw	a5,36(s0)
1c008daa:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008dae:	0007ac23          	sw	zero,24(a5)
1c008db2:	cb01                	beqz	a4,1c008dc2 <__rt_cluster_mount_step+0x118>
1c008db4:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008db8:	cf1c                	sw	a5,24(a4)
1c008dba:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008dbe:	4785                	li	a5,1
1c008dc0:	bf25                	j	1c008cf8 <__rt_cluster_mount_step+0x4e>
1c008dc2:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008dc6:	bfd5                	j	1c008dba <__rt_cluster_mount_step+0x110>

1c008dc8 <__rt_cluster_init>:
1c008dc8:	1c001537          	lui	a0,0x1c001
1c008dcc:	1141                	addi	sp,sp,-16
1c008dce:	02800613          	li	a2,40
1c008dd2:	4581                	li	a1,0
1c008dd4:	20850513          	addi	a0,a0,520 # 1c001208 <__rt_fc_cluster_data>
1c008dd8:	c606                	sw	ra,12(sp)
1c008dda:	075010ef          	jal	ra,1c00a64e <memset>
1c008dde:	1c0085b7          	lui	a1,0x1c008
1c008de2:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008de6:	4505                	li	a0,1
1c008de8:	2bfd                	jal	1c0093e6 <rt_irq_set_handler>
1c008dea:	f14027f3          	csrr	a5,mhartid
1c008dee:	8795                	srai	a5,a5,0x5
1c008df0:	03f7f793          	andi	a5,a5,63
1c008df4:	477d                	li	a4,31
1c008df6:	02e79e63          	bne	a5,a4,1c008e32 <__rt_cluster_init+0x6a>
1c008dfa:	1a10a7b7          	lui	a5,0x1a10a
1c008dfe:	4709                	li	a4,2
1c008e00:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1067f0>
1c008e04:	1c0085b7          	lui	a1,0x1c008
1c008e08:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008e0c:	4511                	li	a0,4
1c008e0e:	2be1                	jal	1c0093e6 <rt_irq_set_handler>
1c008e10:	f14027f3          	csrr	a5,mhartid
1c008e14:	8795                	srai	a5,a5,0x5
1c008e16:	03f7f793          	andi	a5,a5,63
1c008e1a:	477d                	li	a4,31
1c008e1c:	02e79063          	bne	a5,a4,1c008e3c <__rt_cluster_init+0x74>
1c008e20:	1a10a7b7          	lui	a5,0x1a10a
1c008e24:	4741                	li	a4,16
1c008e26:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1067f0>
1c008e2a:	40b2                	lw	ra,12(sp)
1c008e2c:	4501                	li	a0,0
1c008e2e:	0141                	addi	sp,sp,16
1c008e30:	8082                	ret
1c008e32:	002047b7          	lui	a5,0x204
1c008e36:	4709                	li	a4,2
1c008e38:	cbd8                	sw	a4,20(a5)
1c008e3a:	b7e9                	j	1c008e04 <__rt_cluster_init+0x3c>
1c008e3c:	002047b7          	lui	a5,0x204
1c008e40:	4741                	li	a4,16
1c008e42:	cbd8                	sw	a4,20(a5)
1c008e44:	b7dd                	j	1c008e2a <__rt_cluster_init+0x62>

1c008e46 <pi_cluster_conf_init>:
1c008e46:	00052223          	sw	zero,4(a0)
1c008e4a:	8082                	ret

1c008e4c <pi_cluster_open>:
1c008e4c:	1101                	addi	sp,sp,-32
1c008e4e:	ce06                	sw	ra,28(sp)
1c008e50:	cc22                	sw	s0,24(sp)
1c008e52:	ca26                	sw	s1,20(sp)
1c008e54:	c84a                	sw	s2,16(sp)
1c008e56:	c64e                	sw	s3,12(sp)
1c008e58:	30047973          	csrrci	s2,mstatus,8
1c008e5c:	00452983          	lw	s3,4(a0)
1c008e60:	02800793          	li	a5,40
1c008e64:	0049a483          	lw	s1,4(s3)
1c008e68:	02f484b3          	mul	s1,s1,a5
1c008e6c:	1c0017b7          	lui	a5,0x1c001
1c008e70:	20878793          	addi	a5,a5,520 # 1c001208 <__rt_fc_cluster_data>
1c008e74:	94be                	add	s1,s1,a5
1c008e76:	c504                	sw	s1,8(a0)
1c008e78:	3b7000ef          	jal	ra,1c009a2e <__rt_wait_event_prepare_blocking>
1c008e7c:	f14027f3          	csrr	a5,mhartid
1c008e80:	8795                	srai	a5,a5,0x5
1c008e82:	03f7f793          	andi	a5,a5,63
1c008e86:	477d                	li	a4,31
1c008e88:	842a                	mv	s0,a0
1c008e8a:	04e79463          	bne	a5,a4,1c008ed2 <pi_cluster_open+0x86>
1c008e8e:	511c                	lw	a5,32(a0)
1c008e90:	0004ae23          	sw	zero,28(s1)
1c008e94:	d0c8                	sw	a0,36(s1)
1c008e96:	d91c                	sw	a5,48(a0)
1c008e98:	411c                	lw	a5,0(a0)
1c008e9a:	02052223          	sw	zero,36(a0)
1c008e9e:	d51c                	sw	a5,40(a0)
1c008ea0:	415c                	lw	a5,4(a0)
1c008ea2:	c144                	sw	s1,4(a0)
1c008ea4:	d55c                	sw	a5,44(a0)
1c008ea6:	1c0097b7          	lui	a5,0x1c009
1c008eaa:	caa78793          	addi	a5,a5,-854 # 1c008caa <__rt_cluster_mount_step>
1c008eae:	c11c                	sw	a5,0(a0)
1c008eb0:	4785                	li	a5,1
1c008eb2:	d11c                	sw	a5,32(a0)
1c008eb4:	8526                	mv	a0,s1
1c008eb6:	3bd5                	jal	1c008caa <__rt_cluster_mount_step>
1c008eb8:	8522                	mv	a0,s0
1c008eba:	4c5000ef          	jal	ra,1c009b7e <__rt_wait_event>
1c008ebe:	30091073          	csrw	mstatus,s2
1c008ec2:	40f2                	lw	ra,28(sp)
1c008ec4:	4462                	lw	s0,24(sp)
1c008ec6:	44d2                	lw	s1,20(sp)
1c008ec8:	4942                	lw	s2,16(sp)
1c008eca:	49b2                	lw	s3,12(sp)
1c008ecc:	4501                	li	a0,0
1c008ece:	6105                	addi	sp,sp,32
1c008ed0:	8082                	ret
1c008ed2:	0049a483          	lw	s1,4(s3)
1c008ed6:	8526                	mv	a0,s1
1c008ed8:	339d                	jal	1c008c3e <__rt_init_cluster_data>
1c008eda:	04048513          	addi	a0,s1,64
1c008ede:	002017b7          	lui	a5,0x201
1c008ee2:	055a                	slli	a0,a0,0x16
1c008ee4:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f4414>
1c008ee8:	97aa                	add	a5,a5,a0
1c008eea:	577d                	li	a4,-1
1c008eec:	c398                	sw	a4,0(a5)
1c008eee:	1c0086b7          	lui	a3,0x1c008
1c008ef2:	002007b7          	lui	a5,0x200
1c008ef6:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f3058>
1c008efa:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c008efe:	06078793          	addi	a5,a5,96
1c008f02:	972a                	add	a4,a4,a0
1c008f04:	97aa                	add	a5,a5,a0
1c008f06:	f006f693          	andi	a3,a3,-256
1c008f0a:	c314                	sw	a3,0(a4)
1c008f0c:	0711                	addi	a4,a4,4
1c008f0e:	fef71ee3          	bne	a4,a5,1c008f0a <pi_cluster_open+0xbe>
1c008f12:	002007b7          	lui	a5,0x200
1c008f16:	07a1                	addi	a5,a5,8
1c008f18:	953e                	add	a0,a0,a5
1c008f1a:	57fd                	li	a5,-1
1c008f1c:	c11c                	sw	a5,0(a0)
1c008f1e:	8522                	mv	a0,s0
1c008f20:	3db000ef          	jal	ra,1c009afa <rt_event_push>
1c008f24:	bf51                	j	1c008eb8 <pi_cluster_open+0x6c>

1c008f26 <pi_cluster_close>:
1c008f26:	451c                	lw	a5,8(a0)
1c008f28:	1101                	addi	sp,sp,-32
1c008f2a:	cc22                	sw	s0,24(sp)
1c008f2c:	5380                	lw	s0,32(a5)
1c008f2e:	1c0017b7          	lui	a5,0x1c001
1c008f32:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c008f36:	ce06                	sw	ra,28(sp)
1c008f38:	4785                	li	a5,1
1c008f3a:	00f70563          	beq	a4,a5,1c008f44 <pi_cluster_close+0x1e>
1c008f3e:	4505                	li	a0,1
1c008f40:	5d5000ef          	jal	ra,1c009d14 <__rt_fll_deinit>
1c008f44:	c602                	sw	zero,12(sp)
1c008f46:	e409                	bnez	s0,1c008f50 <pi_cluster_close+0x2a>
1c008f48:	006c                	addi	a1,sp,12
1c008f4a:	4501                	li	a0,0
1c008f4c:	749000ef          	jal	ra,1c009e94 <__rt_pmu_cluster_power_down>
1c008f50:	40f2                	lw	ra,28(sp)
1c008f52:	4462                	lw	s0,24(sp)
1c008f54:	4501                	li	a0,0
1c008f56:	6105                	addi	sp,sp,32
1c008f58:	8082                	ret

1c008f5a <__rt_cluster_push_fc_event>:
1c008f5a:	002047b7          	lui	a5,0x204
1c008f5e:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f70d4>
1c008f62:	0007e703          	p.elw	a4,0(a5)
1c008f66:	f14027f3          	csrr	a5,mhartid
1c008f6a:	8795                	srai	a5,a5,0x5
1c008f6c:	02800693          	li	a3,40
1c008f70:	03f7f793          	andi	a5,a5,63
1c008f74:	02d787b3          	mul	a5,a5,a3
1c008f78:	1c001737          	lui	a4,0x1c001
1c008f7c:	20870713          	addi	a4,a4,520 # 1c001208 <__rt_fc_cluster_data>
1c008f80:	4689                	li	a3,2
1c008f82:	97ba                	add	a5,a5,a4
1c008f84:	00204737          	lui	a4,0x204
1c008f88:	43d0                	lw	a2,4(a5)
1c008f8a:	ee01                	bnez	a2,1c008fa2 <__rt_cluster_push_fc_event+0x48>
1c008f8c:	c3c8                	sw	a0,4(a5)
1c008f8e:	4709                	li	a4,2
1c008f90:	1a10a7b7          	lui	a5,0x1a10a
1c008f94:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1067fc>
1c008f98:	002047b7          	lui	a5,0x204
1c008f9c:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f70d4>
1c008fa0:	8082                	ret
1c008fa2:	c714                	sw	a3,8(a4)
1c008fa4:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f7050>
1c008fa8:	c354                	sw	a3,4(a4)
1c008faa:	bff9                	j	1c008f88 <__rt_cluster_push_fc_event+0x2e>

1c008fac <__rt_cluster_new>:
1c008fac:	1c0095b7          	lui	a1,0x1c009
1c008fb0:	1141                	addi	sp,sp,-16
1c008fb2:	4601                	li	a2,0
1c008fb4:	dc858593          	addi	a1,a1,-568 # 1c008dc8 <__rt_cluster_init>
1c008fb8:	4501                	li	a0,0
1c008fba:	c606                	sw	ra,12(sp)
1c008fbc:	2b6d                	jal	1c009576 <__rt_cbsys_add>
1c008fbe:	c105                	beqz	a0,1c008fde <__rt_cluster_new+0x32>
1c008fc0:	f1402673          	csrr	a2,mhartid
1c008fc4:	1c000537          	lui	a0,0x1c000
1c008fc8:	40565593          	srai	a1,a2,0x5
1c008fcc:	03f5f593          	andi	a1,a1,63
1c008fd0:	8a7d                	andi	a2,a2,31
1c008fd2:	55050513          	addi	a0,a0,1360 # 1c000550 <__DTOR_END__+0x264>
1c008fd6:	0c5010ef          	jal	ra,1c00a89a <printf>
1c008fda:	04d010ef          	jal	ra,1c00a826 <abort>
1c008fde:	40b2                	lw	ra,12(sp)
1c008fe0:	0141                	addi	sp,sp,16
1c008fe2:	8082                	ret

1c008fe4 <__rt_cluster_pulpos_emu_init>:
1c008fe4:	1141                	addi	sp,sp,-16
1c008fe6:	45b1                	li	a1,12
1c008fe8:	4501                	li	a0,0
1c008fea:	c606                	sw	ra,12(sp)
1c008fec:	3621                	jal	1c008af4 <rt_alloc>
1c008fee:	1c0017b7          	lui	a5,0x1c001
1c008ff2:	1ca7a423          	sw	a0,456(a5) # 1c0011c8 <__rt_fc_cluster_device>
1c008ff6:	e105                	bnez	a0,1c009016 <__rt_cluster_pulpos_emu_init+0x32>
1c008ff8:	f1402673          	csrr	a2,mhartid
1c008ffc:	1c000537          	lui	a0,0x1c000
1c009000:	40565593          	srai	a1,a2,0x5
1c009004:	03f5f593          	andi	a1,a1,63
1c009008:	8a7d                	andi	a2,a2,31
1c00900a:	59850513          	addi	a0,a0,1432 # 1c000598 <__DTOR_END__+0x2ac>
1c00900e:	08d010ef          	jal	ra,1c00a89a <printf>
1c009012:	015010ef          	jal	ra,1c00a826 <abort>
1c009016:	40b2                	lw	ra,12(sp)
1c009018:	0141                	addi	sp,sp,16
1c00901a:	8082                	ret

1c00901c <rt_cluster_call>:
1c00901c:	7139                	addi	sp,sp,-64
1c00901e:	d84a                	sw	s2,48(sp)
1c009020:	4906                	lw	s2,64(sp)
1c009022:	dc22                	sw	s0,56(sp)
1c009024:	842e                	mv	s0,a1
1c009026:	de06                	sw	ra,60(sp)
1c009028:	da26                	sw	s1,52(sp)
1c00902a:	d64e                	sw	s3,44(sp)
1c00902c:	300479f3          	csrrci	s3,mstatus,8
1c009030:	84ca                	mv	s1,s2
1c009032:	02091163          	bnez	s2,1c009054 <rt_cluster_call+0x38>
1c009036:	ce32                	sw	a2,28(sp)
1c009038:	cc36                	sw	a3,24(sp)
1c00903a:	ca3a                	sw	a4,20(sp)
1c00903c:	c83e                	sw	a5,16(sp)
1c00903e:	c642                	sw	a6,12(sp)
1c009040:	c446                	sw	a7,8(sp)
1c009042:	1ed000ef          	jal	ra,1c009a2e <__rt_wait_event_prepare_blocking>
1c009046:	48a2                	lw	a7,8(sp)
1c009048:	4832                	lw	a6,12(sp)
1c00904a:	47c2                	lw	a5,16(sp)
1c00904c:	4752                	lw	a4,20(sp)
1c00904e:	46e2                	lw	a3,24(sp)
1c009050:	4672                	lw	a2,28(sp)
1c009052:	84aa                	mv	s1,a0
1c009054:	4531                	li	a0,12
1c009056:	02a40433          	mul	s0,s0,a0
1c00905a:	1c0015b7          	lui	a1,0x1c001
1c00905e:	10058313          	addi	t1,a1,256 # 1c001100 <__rt_pulpos_emu_global_cluster_task>
1c009062:	00f32623          	sw	a5,12(t1)
1c009066:	1c0017b7          	lui	a5,0x1c001
1c00906a:	1c87a503          	lw	a0,456(a5) # 1c0011c8 <__rt_fc_cluster_device>
1c00906e:	00c32023          	sw	a2,0(t1)
1c009072:	10058593          	addi	a1,a1,256
1c009076:	8626                	mv	a2,s1
1c009078:	00d32223          	sw	a3,4(t1)
1c00907c:	9522                	add	a0,a0,s0
1c00907e:	00e32423          	sw	a4,8(t1)
1c009082:	01032823          	sw	a6,16(t1)
1c009086:	01132a23          	sw	a7,20(t1)
1c00908a:	2041                	jal	1c00910a <pi_cluster_send_task_to_cl_async>
1c00908c:	842a                	mv	s0,a0
1c00908e:	cd01                	beqz	a0,1c0090a6 <rt_cluster_call+0x8a>
1c009090:	30099073          	csrw	mstatus,s3
1c009094:	547d                	li	s0,-1
1c009096:	8522                	mv	a0,s0
1c009098:	50f2                	lw	ra,60(sp)
1c00909a:	5462                	lw	s0,56(sp)
1c00909c:	54d2                	lw	s1,52(sp)
1c00909e:	5942                	lw	s2,48(sp)
1c0090a0:	59b2                	lw	s3,44(sp)
1c0090a2:	6121                	addi	sp,sp,64
1c0090a4:	8082                	ret
1c0090a6:	00091563          	bnez	s2,1c0090b0 <rt_cluster_call+0x94>
1c0090aa:	8526                	mv	a0,s1
1c0090ac:	2d3000ef          	jal	ra,1c009b7e <__rt_wait_event>
1c0090b0:	30099073          	csrw	mstatus,s3
1c0090b4:	b7cd                	j	1c009096 <rt_cluster_call+0x7a>

1c0090b6 <rt_cluster_mount>:
1c0090b6:	7139                	addi	sp,sp,-64
1c0090b8:	dc22                	sw	s0,56(sp)
1c0090ba:	da26                	sw	s1,52(sp)
1c0090bc:	d84a                	sw	s2,48(sp)
1c0090be:	4431                	li	s0,12
1c0090c0:	1c0014b7          	lui	s1,0x1c001
1c0090c4:	de06                	sw	ra,60(sp)
1c0090c6:	d64e                	sw	s3,44(sp)
1c0090c8:	8936                	mv	s2,a3
1c0090ca:	02858433          	mul	s0,a1,s0
1c0090ce:	1c848493          	addi	s1,s1,456 # 1c0011c8 <__rt_fc_cluster_device>
1c0090d2:	c905                	beqz	a0,1c009102 <rt_cluster_mount+0x4c>
1c0090d4:	0068                	addi	a0,sp,12
1c0090d6:	89ae                	mv	s3,a1
1c0090d8:	33bd                	jal	1c008e46 <pi_cluster_conf_init>
1c0090da:	4088                	lw	a0,0(s1)
1c0090dc:	006c                	addi	a1,sp,12
1c0090de:	9522                	add	a0,a0,s0
1c0090e0:	2609                	jal	1c0093e2 <pi_open_from_conf>
1c0090e2:	4088                	lw	a0,0(s1)
1c0090e4:	c84e                	sw	s3,16(sp)
1c0090e6:	9522                	add	a0,a0,s0
1c0090e8:	3395                	jal	1c008e4c <pi_cluster_open>
1c0090ea:	00090563          	beqz	s2,1c0090f4 <rt_cluster_mount+0x3e>
1c0090ee:	854a                	mv	a0,s2
1c0090f0:	20b000ef          	jal	ra,1c009afa <rt_event_push>
1c0090f4:	50f2                	lw	ra,60(sp)
1c0090f6:	5462                	lw	s0,56(sp)
1c0090f8:	54d2                	lw	s1,52(sp)
1c0090fa:	5942                	lw	s2,48(sp)
1c0090fc:	59b2                	lw	s3,44(sp)
1c0090fe:	6121                	addi	sp,sp,64
1c009100:	8082                	ret
1c009102:	4088                	lw	a0,0(s1)
1c009104:	9522                	add	a0,a0,s0
1c009106:	3505                	jal	1c008f26 <pi_cluster_close>
1c009108:	b7cd                	j	1c0090ea <rt_cluster_mount+0x34>

1c00910a <pi_cluster_send_task_to_cl_async>:
1c00910a:	1101                	addi	sp,sp,-32
1c00910c:	ca26                	sw	s1,20(sp)
1c00910e:	4504                	lw	s1,8(a0)
1c009110:	cc22                	sw	s0,24(sp)
1c009112:	c256                	sw	s5,4(sp)
1c009114:	842e                	mv	s0,a1
1c009116:	8ab2                	mv	s5,a2
1c009118:	ce06                	sw	ra,28(sp)
1c00911a:	c84a                	sw	s2,16(sp)
1c00911c:	c64e                	sw	s3,12(sp)
1c00911e:	c452                	sw	s4,8(sp)
1c009120:	30047a73          	csrrci	s4,mstatus,8
1c009124:	00060823          	sb	zero,16(a2)
1c009128:	4785                	li	a5,1
1c00912a:	d1dc                	sw	a5,36(a1)
1c00912c:	49dc                	lw	a5,20(a1)
1c00912e:	0144a983          	lw	s3,20(s1)
1c009132:	e399                	bnez	a5,1c009138 <pi_cluster_send_task_to_cl_async+0x2e>
1c009134:	47a1                	li	a5,8
1c009136:	c9dc                	sw	a5,20(a1)
1c009138:	441c                	lw	a5,8(s0)
1c00913a:	eb8d                	bnez	a5,1c00916c <pi_cluster_send_task_to_cl_async+0x62>
1c00913c:	445c                	lw	a5,12(s0)
1c00913e:	e789                	bnez	a5,1c009148 <pi_cluster_send_task_to_cl_async+0x3e>
1c009140:	40000793          	li	a5,1024
1c009144:	c45c                	sw	a5,12(s0)
1c009146:	c81c                	sw	a5,16(s0)
1c009148:	4818                	lw	a4,16(s0)
1c00914a:	445c                	lw	a5,12(s0)
1c00914c:	e311                	bnez	a4,1c009150 <pi_cluster_send_task_to_cl_async+0x46>
1c00914e:	c81c                	sw	a5,16(s0)
1c009150:	01442903          	lw	s2,20(s0)
1c009154:	4818                	lw	a4,16(s0)
1c009156:	448c                	lw	a1,8(s1)
1c009158:	197d                	addi	s2,s2,-1
1c00915a:	02e90933          	mul	s2,s2,a4
1c00915e:	993e                	add	s2,s2,a5
1c009160:	c9bd                	beqz	a1,1c0091d6 <pi_cluster_send_task_to_cl_async+0xcc>
1c009162:	44d0                	lw	a2,12(s1)
1c009164:	07261063          	bne	a2,s2,1c0091c4 <pi_cluster_send_task_to_cl_async+0xba>
1c009168:	449c                	lw	a5,8(s1)
1c00916a:	c41c                	sw	a5,8(s0)
1c00916c:	4858                	lw	a4,20(s0)
1c00916e:	4785                	li	a5,1
1c009170:	01542c23          	sw	s5,24(s0)
1c009174:	00e797b3          	sll	a5,a5,a4
1c009178:	17fd                	addi	a5,a5,-1
1c00917a:	d41c                	sw	a5,40(s0)
1c00917c:	02042023          	sw	zero,32(s0)
1c009180:	0089a783          	lw	a5,8(s3)
1c009184:	cbbd                	beqz	a5,1c0091fa <pi_cluster_send_task_to_cl_async+0xf0>
1c009186:	d380                	sw	s0,32(a5)
1c009188:	0089a423          	sw	s0,8(s3)
1c00918c:	0009a783          	lw	a5,0(s3)
1c009190:	e399                	bnez	a5,1c009196 <pi_cluster_send_task_to_cl_async+0x8c>
1c009192:	0089a023          	sw	s0,0(s3)
1c009196:	509c                	lw	a5,32(s1)
1c009198:	00201737          	lui	a4,0x201
1c00919c:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3e18>
1c0091a0:	04078793          	addi	a5,a5,64
1c0091a4:	07da                	slli	a5,a5,0x16
1c0091a6:	97ba                	add	a5,a5,a4
1c0091a8:	0007a023          	sw	zero,0(a5)
1c0091ac:	300a1073          	csrw	mstatus,s4
1c0091b0:	4501                	li	a0,0
1c0091b2:	40f2                	lw	ra,28(sp)
1c0091b4:	4462                	lw	s0,24(sp)
1c0091b6:	44d2                	lw	s1,20(sp)
1c0091b8:	4942                	lw	s2,16(sp)
1c0091ba:	49b2                	lw	s3,12(sp)
1c0091bc:	4a22                	lw	s4,8(sp)
1c0091be:	4a92                	lw	s5,4(sp)
1c0091c0:	6105                	addi	sp,sp,32
1c0091c2:	8082                	ret
1c0091c4:	509c                	lw	a5,32(s1)
1c0091c6:	1c001737          	lui	a4,0x1c001
1c0091ca:	1f472503          	lw	a0,500(a4) # 1c0011f4 <__rt_alloc_l1>
1c0091ce:	078a                	slli	a5,a5,0x2
1c0091d0:	953e                	add	a0,a0,a5
1c0091d2:	8d9ff0ef          	jal	ra,1c008aaa <rt_user_free>
1c0091d6:	509c                	lw	a5,32(s1)
1c0091d8:	1c001737          	lui	a4,0x1c001
1c0091dc:	1f472503          	lw	a0,500(a4) # 1c0011f4 <__rt_alloc_l1>
1c0091e0:	078a                	slli	a5,a5,0x2
1c0091e2:	0124a623          	sw	s2,12(s1)
1c0091e6:	85ca                	mv	a1,s2
1c0091e8:	953e                	add	a0,a0,a5
1c0091ea:	891ff0ef          	jal	ra,1c008a7a <rt_user_alloc>
1c0091ee:	c488                	sw	a0,8(s1)
1c0091f0:	fd25                	bnez	a0,1c009168 <pi_cluster_send_task_to_cl_async+0x5e>
1c0091f2:	300a1073          	csrw	mstatus,s4
1c0091f6:	557d                	li	a0,-1
1c0091f8:	bf6d                	j	1c0091b2 <pi_cluster_send_task_to_cl_async+0xa8>
1c0091fa:	0089a223          	sw	s0,4(s3)
1c0091fe:	b769                	j	1c009188 <pi_cluster_send_task_to_cl_async+0x7e>

1c009200 <rt_perf_init>:
1c009200:	00450793          	addi	a5,a0,4
1c009204:	04850513          	addi	a0,a0,72
1c009208:	0007a023          	sw	zero,0(a5)
1c00920c:	0791                	addi	a5,a5,4
1c00920e:	fea79de3          	bne	a5,a0,1c009208 <rt_perf_init+0x8>
1c009212:	8082                	ret

1c009214 <rt_perf_conf>:
1c009214:	c10c                	sw	a1,0(a0)
1c009216:	7a059073          	csrw	pcer,a1
1c00921a:	8082                	ret

1c00921c <cluster_start>:
1c00921c:	002047b7          	lui	a5,0x204
1c009220:	00070737          	lui	a4,0x70
1c009224:	c798                	sw	a4,8(a5)
1c009226:	0ff00713          	li	a4,255
1c00922a:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f7098>
1c00922e:	20e7a023          	sw	a4,512(a5)
1c009232:	20e7a623          	sw	a4,524(a5)
1c009236:	8082                	ret

1c009238 <__rt_init>:
1c009238:	1101                	addi	sp,sp,-32
1c00923a:	ce06                	sw	ra,28(sp)
1c00923c:	cc22                	sw	s0,24(sp)
1c00923e:	23d5                	jal	1c009822 <__rt_bridge_set_available>
1c009240:	1c0017b7          	lui	a5,0x1c001
1c009244:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c009248:	478d                	li	a5,3
1c00924a:	02f71263          	bne	a4,a5,1c00926e <__rt_init+0x36>
1c00924e:	7d005073          	csrwi	0x7d0,0
1c009252:	1c0007b7          	lui	a5,0x1c000
1c009256:	70078793          	addi	a5,a5,1792 # 1c000700 <stack_start>
1c00925a:	7d179073          	csrw	0x7d1,a5
1c00925e:	1c0017b7          	lui	a5,0x1c001
1c009262:	f0078793          	addi	a5,a5,-256 # 1c000f00 <stack>
1c009266:	7d279073          	csrw	0x7d2,a5
1c00926a:	7d00d073          	csrwi	0x7d0,1
1c00926e:	2c29                	jal	1c009488 <__rt_irq_init>
1c009270:	1a1067b7          	lui	a5,0x1a106
1c009274:	577d                	li	a4,-1
1c009276:	c3d8                	sw	a4,4(a5)
1c009278:	1c0085b7          	lui	a1,0x1c008
1c00927c:	c798                	sw	a4,8(a5)
1c00927e:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c009282:	4569                	li	a0,26
1c009284:	228d                	jal	1c0093e6 <rt_irq_set_handler>
1c009286:	f14027f3          	csrr	a5,mhartid
1c00928a:	8795                	srai	a5,a5,0x5
1c00928c:	03f7f793          	andi	a5,a5,63
1c009290:	477d                	li	a4,31
1c009292:	0ae79e63          	bne	a5,a4,1c00934e <__rt_init+0x116>
1c009296:	1a10a7b7          	lui	a5,0x1a10a
1c00929a:	04000737          	lui	a4,0x4000
1c00929e:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1067f0>
1c0092a2:	46d000ef          	jal	ra,1c009f0e <__rt_pmu_init>
1c0092a6:	373000ef          	jal	ra,1c009e18 <__rt_freq_init>
1c0092aa:	f14027f3          	csrr	a5,mhartid
1c0092ae:	8795                	srai	a5,a5,0x5
1c0092b0:	03f7f793          	andi	a5,a5,63
1c0092b4:	477d                	li	a4,31
1c0092b6:	00e78763          	beq	a5,a4,1c0092c4 <__rt_init+0x8c>
1c0092ba:	002017b7          	lui	a5,0x201
1c0092be:	577d                	li	a4,-1
1c0092c0:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f4414>
1c0092c4:	1c000437          	lui	s0,0x1c000
1c0092c8:	2605                	jal	1c0095e8 <__rt_utils_init>
1c0092ca:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c0092ce:	8ddff0ef          	jal	ra,1c008baa <__rt_allocs_init>
1c0092d2:	25cd                	jal	1c0099b4 <__rt_thread_sched_init>
1c0092d4:	0ed000ef          	jal	ra,1c009bc0 <__rt_event_sched_init>
1c0092d8:	473000ef          	jal	ra,1c009f4a <__rt_padframe_init>
1c0092dc:	401c                	lw	a5,0(s0)
1c0092de:	efb5                	bnez	a5,1c00935a <__rt_init+0x122>
1c0092e0:	30045073          	csrwi	mstatus,8
1c0092e4:	4501                	li	a0,0
1c0092e6:	2cc1                	jal	1c0095b6 <__rt_cbsys_exec>
1c0092e8:	e521                	bnez	a0,1c009330 <__rt_init+0xf8>
1c0092ea:	f14027f3          	csrr	a5,mhartid
1c0092ee:	8795                	srai	a5,a5,0x5
1c0092f0:	03f7f793          	andi	a5,a5,63
1c0092f4:	477d                	li	a4,31
1c0092f6:	0ae78763          	beq	a5,a4,1c0093a4 <__rt_init+0x16c>
1c0092fa:	4681                	li	a3,0
1c0092fc:	4601                	li	a2,0
1c0092fe:	4581                	li	a1,0
1c009300:	4505                	li	a0,1
1c009302:	cfb9                	beqz	a5,1c009360 <__rt_init+0x128>
1c009304:	3b4d                	jal	1c0090b6 <rt_cluster_mount>
1c009306:	6591                	lui	a1,0x4
1c009308:	450d                	li	a0,3
1c00930a:	feaff0ef          	jal	ra,1c008af4 <rt_alloc>
1c00930e:	872a                	mv	a4,a0
1c009310:	c105                	beqz	a0,1c009330 <__rt_init+0xf8>
1c009312:	6805                	lui	a6,0x1
1c009314:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009318:	1c009637          	lui	a2,0x1c009
1c00931c:	c002                	sw	zero,0(sp)
1c00931e:	48a1                	li	a7,8
1c009320:	87c2                	mv	a5,a6
1c009322:	4681                	li	a3,0
1c009324:	21c60613          	addi	a2,a2,540 # 1c00921c <cluster_start>
1c009328:	4581                	li	a1,0
1c00932a:	4501                	li	a0,0
1c00932c:	39c5                	jal	1c00901c <rt_cluster_call>
1c00932e:	c93d                	beqz	a0,1c0093a4 <__rt_init+0x16c>
1c009330:	f1402673          	csrr	a2,mhartid
1c009334:	1c000537          	lui	a0,0x1c000
1c009338:	40565593          	srai	a1,a2,0x5
1c00933c:	03f5f593          	andi	a1,a1,63
1c009340:	8a7d                	andi	a2,a2,31
1c009342:	5ec50513          	addi	a0,a0,1516 # 1c0005ec <__DTOR_END__+0x300>
1c009346:	554010ef          	jal	ra,1c00a89a <printf>
1c00934a:	4dc010ef          	jal	ra,1c00a826 <abort>
1c00934e:	002047b7          	lui	a5,0x204
1c009352:	04000737          	lui	a4,0x4000
1c009356:	cbd8                	sw	a4,20(a5)
1c009358:	b7a9                	j	1c0092a2 <__rt_init+0x6a>
1c00935a:	9782                	jalr	a5
1c00935c:	0411                	addi	s0,s0,4
1c00935e:	bfbd                	j	1c0092dc <__rt_init+0xa4>
1c009360:	3b99                	jal	1c0090b6 <rt_cluster_mount>
1c009362:	6591                	lui	a1,0x4
1c009364:	80058593          	addi	a1,a1,-2048 # 3800 <_l1_preload_size+0x7f0>
1c009368:	450d                	li	a0,3
1c00936a:	f8aff0ef          	jal	ra,1c008af4 <rt_alloc>
1c00936e:	d169                	beqz	a0,1c009330 <__rt_init+0xf8>
1c009370:	00204737          	lui	a4,0x204
1c009374:	0ff00793          	li	a5,255
1c009378:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f7098>
1c00937c:	1c0107b7          	lui	a5,0x1c010
1c009380:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c009384:	0017e793          	ori	a5,a5,1
1c009388:	08f72023          	sw	a5,128(a4)
1c00938c:	6785                	lui	a5,0x1
1c00938e:	4462                	lw	s0,24(sp)
1c009390:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009394:	08f72023          	sw	a5,128(a4)
1c009398:	40f2                	lw	ra,28(sp)
1c00939a:	08a72023          	sw	a0,128(a4)
1c00939e:	4501                	li	a0,0
1c0093a0:	6105                	addi	sp,sp,32
1c0093a2:	bdad                	j	1c00921c <cluster_start>
1c0093a4:	40f2                	lw	ra,28(sp)
1c0093a6:	4462                	lw	s0,24(sp)
1c0093a8:	6105                	addi	sp,sp,32
1c0093aa:	8082                	ret

1c0093ac <__rt_deinit>:
1c0093ac:	1c0017b7          	lui	a5,0x1c001
1c0093b0:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c0093b4:	1141                	addi	sp,sp,-16
1c0093b6:	c606                	sw	ra,12(sp)
1c0093b8:	c422                	sw	s0,8(sp)
1c0093ba:	478d                	li	a5,3
1c0093bc:	00f71463          	bne	a4,a5,1c0093c4 <__rt_deinit+0x18>
1c0093c0:	7d005073          	csrwi	0x7d0,0
1c0093c4:	4505                	li	a0,1
1c0093c6:	1c000437          	lui	s0,0x1c000
1c0093ca:	22f5                	jal	1c0095b6 <__rt_cbsys_exec>
1c0093cc:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c0093d0:	401c                	lw	a5,0(s0)
1c0093d2:	e789                	bnez	a5,1c0093dc <__rt_deinit+0x30>
1c0093d4:	40b2                	lw	ra,12(sp)
1c0093d6:	4422                	lw	s0,8(sp)
1c0093d8:	0141                	addi	sp,sp,16
1c0093da:	8082                	ret
1c0093dc:	9782                	jalr	a5
1c0093de:	0411                	addi	s0,s0,4
1c0093e0:	bfc5                	j	1c0093d0 <__rt_deinit+0x24>

1c0093e2 <pi_open_from_conf>:
1c0093e2:	c14c                	sw	a1,4(a0)
1c0093e4:	8082                	ret

1c0093e6 <rt_irq_set_handler>:
1c0093e6:	f14027f3          	csrr	a5,mhartid
1c0093ea:	8795                	srai	a5,a5,0x5
1c0093ec:	03f7f793          	andi	a5,a5,63
1c0093f0:	477d                	li	a4,31
1c0093f2:	04e79063          	bne	a5,a4,1c009432 <rt_irq_set_handler+0x4c>
1c0093f6:	1a1047b7          	lui	a5,0x1a104
1c0093fa:	43dc                	lw	a5,4(a5)
1c0093fc:	050a                	slli	a0,a0,0x2
1c0093fe:	8d89                	sub	a1,a1,a0
1c009400:	8d9d                	sub	a1,a1,a5
1c009402:	000ff737          	lui	a4,0xff
1c009406:	00f506b3          	add	a3,a0,a5
1c00940a:	8f6d                	and	a4,a4,a1
1c00940c:	0145d793          	srli	a5,a1,0x14
1c009410:	06f76713          	ori	a4,a4,111
1c009414:	07fe                	slli	a5,a5,0x1f
1c009416:	8fd9                	or	a5,a5,a4
1c009418:	7fe00637          	lui	a2,0x7fe00
1c00941c:	01459713          	slli	a4,a1,0x14
1c009420:	8f71                	and	a4,a4,a2
1c009422:	8fd9                	or	a5,a5,a4
1c009424:	05a6                	slli	a1,a1,0x9
1c009426:	00100737          	lui	a4,0x100
1c00942a:	8df9                	and	a1,a1,a4
1c00942c:	8ddd                	or	a1,a1,a5
1c00942e:	c28c                	sw	a1,0(a3)
1c009430:	8082                	ret
1c009432:	002007b7          	lui	a5,0x200
1c009436:	43bc                	lw	a5,64(a5)
1c009438:	b7d1                	j	1c0093fc <rt_irq_set_handler+0x16>

1c00943a <illegal_insn_handler_c>:
1c00943a:	8082                	ret

1c00943c <__rt_handle_illegal_instr>:
1c00943c:	1c0017b7          	lui	a5,0x1c001
1c009440:	f047a703          	lw	a4,-252(a5) # 1c000f04 <__rt_debug_config>
1c009444:	1141                	addi	sp,sp,-16
1c009446:	c422                	sw	s0,8(sp)
1c009448:	c606                	sw	ra,12(sp)
1c00944a:	8b05                	andi	a4,a4,1
1c00944c:	843e                	mv	s0,a5
1c00944e:	c30d                	beqz	a4,1c009470 <__rt_handle_illegal_instr+0x34>
1c009450:	341026f3          	csrr	a3,mepc
1c009454:	f1402673          	csrr	a2,mhartid
1c009458:	1c000537          	lui	a0,0x1c000
1c00945c:	4298                	lw	a4,0(a3)
1c00945e:	40565593          	srai	a1,a2,0x5
1c009462:	03f5f593          	andi	a1,a1,63
1c009466:	8a7d                	andi	a2,a2,31
1c009468:	64450513          	addi	a0,a0,1604 # 1c000644 <__DTOR_END__+0x358>
1c00946c:	42e010ef          	jal	ra,1c00a89a <printf>
1c009470:	f0442783          	lw	a5,-252(s0)
1c009474:	8385                	srli	a5,a5,0x1
1c009476:	8b85                	andi	a5,a5,1
1c009478:	c399                	beqz	a5,1c00947e <__rt_handle_illegal_instr+0x42>
1c00947a:	3ac010ef          	jal	ra,1c00a826 <abort>
1c00947e:	4422                	lw	s0,8(sp)
1c009480:	40b2                	lw	ra,12(sp)
1c009482:	0141                	addi	sp,sp,16
1c009484:	fb7ff06f          	j	1c00943a <illegal_insn_handler_c>

1c009488 <__rt_irq_init>:
1c009488:	f14027f3          	csrr	a5,mhartid
1c00948c:	8795                	srai	a5,a5,0x5
1c00948e:	03f7f793          	andi	a5,a5,63
1c009492:	477d                	li	a4,31
1c009494:	02e79763          	bne	a5,a4,1c0094c2 <__rt_irq_init+0x3a>
1c009498:	1a10a7b7          	lui	a5,0x1a10a
1c00949c:	577d                	li	a4,-1
1c00949e:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1067f4>
1c0094a2:	f14027f3          	csrr	a5,mhartid
1c0094a6:	8795                	srai	a5,a5,0x5
1c0094a8:	1c008737          	lui	a4,0x1c008
1c0094ac:	03f7f793          	andi	a5,a5,63
1c0094b0:	46fd                	li	a3,31
1c0094b2:	00070713          	mv	a4,a4
1c0094b6:	00d79b63          	bne	a5,a3,1c0094cc <__rt_irq_init+0x44>
1c0094ba:	1a1047b7          	lui	a5,0x1a104
1c0094be:	c3d8                	sw	a4,4(a5)
1c0094c0:	8082                	ret
1c0094c2:	002047b7          	lui	a5,0x204
1c0094c6:	577d                	li	a4,-1
1c0094c8:	cb98                	sw	a4,16(a5)
1c0094ca:	bfe1                	j	1c0094a2 <__rt_irq_init+0x1a>
1c0094cc:	002007b7          	lui	a5,0x200
1c0094d0:	c3b8                	sw	a4,64(a5)
1c0094d2:	8082                	ret

1c0094d4 <__rt_fc_cluster_lock_req>:
1c0094d4:	1141                	addi	sp,sp,-16
1c0094d6:	c606                	sw	ra,12(sp)
1c0094d8:	c422                	sw	s0,8(sp)
1c0094da:	c226                	sw	s1,4(sp)
1c0094dc:	300474f3          	csrrci	s1,mstatus,8
1c0094e0:	09654703          	lbu	a4,150(a0)
1c0094e4:	411c                	lw	a5,0(a0)
1c0094e6:	c729                	beqz	a4,1c009530 <__rt_fc_cluster_lock_req+0x5c>
1c0094e8:	4398                	lw	a4,0(a5)
1c0094ea:	c30d                	beqz	a4,1c00950c <__rt_fc_cluster_lock_req+0x38>
1c0094ec:	43d8                	lw	a4,4(a5)
1c0094ee:	cf09                	beqz	a4,1c009508 <__rt_fc_cluster_lock_req+0x34>
1c0094f0:	4798                	lw	a4,8(a5)
1c0094f2:	c348                	sw	a0,4(a4)
1c0094f4:	c788                	sw	a0,8(a5)
1c0094f6:	00052223          	sw	zero,4(a0)
1c0094fa:	30049073          	csrw	mstatus,s1
1c0094fe:	40b2                	lw	ra,12(sp)
1c009500:	4422                	lw	s0,8(sp)
1c009502:	4492                	lw	s1,4(sp)
1c009504:	0141                	addi	sp,sp,16
1c009506:	8082                	ret
1c009508:	c3c8                	sw	a0,4(a5)
1c00950a:	b7ed                	j	1c0094f4 <__rt_fc_cluster_lock_req+0x20>
1c00950c:	4705                	li	a4,1
1c00950e:	08e50a23          	sb	a4,148(a0)
1c009512:	4705                	li	a4,1
1c009514:	c398                	sw	a4,0(a5)
1c009516:	09554783          	lbu	a5,149(a0)
1c00951a:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f3054>
1c00951e:	00201737          	lui	a4,0x201
1c009522:	07da                	slli	a5,a5,0x16
1c009524:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3e18>
1c009528:	97ba                	add	a5,a5,a4
1c00952a:	0007a023          	sw	zero,0(a5)
1c00952e:	b7f1                	j	1c0094fa <__rt_fc_cluster_lock_req+0x26>
1c009530:	842a                	mv	s0,a0
1c009532:	47c8                	lw	a0,12(a5)
1c009534:	cd01                	beqz	a0,1c00954c <__rt_fc_cluster_lock_req+0x78>
1c009536:	0007a023          	sw	zero,0(a5)
1c00953a:	0007a623          	sw	zero,12(a5)
1c00953e:	2185                	jal	1c00999e <__rt_thread_wakeup>
1c009540:	4785                	li	a5,1
1c009542:	08f40a23          	sb	a5,148(s0)
1c009546:	09544783          	lbu	a5,149(s0)
1c00954a:	bfc1                	j	1c00951a <__rt_fc_cluster_lock_req+0x46>
1c00954c:	43d8                	lw	a4,4(a5)
1c00954e:	e701                	bnez	a4,1c009556 <__rt_fc_cluster_lock_req+0x82>
1c009550:	0007a023          	sw	zero,0(a5)
1c009554:	b7f5                	j	1c009540 <__rt_fc_cluster_lock_req+0x6c>
1c009556:	4354                	lw	a3,4(a4)
1c009558:	c3d4                	sw	a3,4(a5)
1c00955a:	4785                	li	a5,1
1c00955c:	08f70a23          	sb	a5,148(a4)
1c009560:	09574783          	lbu	a5,149(a4)
1c009564:	00201737          	lui	a4,0x201
1c009568:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3e18>
1c00956c:	04078793          	addi	a5,a5,64
1c009570:	07da                	slli	a5,a5,0x16
1c009572:	97ba                	add	a5,a5,a4
1c009574:	bff1                	j	1c009550 <__rt_fc_cluster_lock_req+0x7c>

1c009576 <__rt_cbsys_add>:
1c009576:	1101                	addi	sp,sp,-32
1c009578:	cc22                	sw	s0,24(sp)
1c00957a:	ca26                	sw	s1,20(sp)
1c00957c:	842a                	mv	s0,a0
1c00957e:	84ae                	mv	s1,a1
1c009580:	4501                	li	a0,0
1c009582:	45b1                	li	a1,12
1c009584:	c632                	sw	a2,12(sp)
1c009586:	ce06                	sw	ra,28(sp)
1c009588:	d6cff0ef          	jal	ra,1c008af4 <rt_alloc>
1c00958c:	4632                	lw	a2,12(sp)
1c00958e:	c115                	beqz	a0,1c0095b2 <__rt_cbsys_add+0x3c>
1c009590:	1c0017b7          	lui	a5,0x1c001
1c009594:	040a                	slli	s0,s0,0x2
1c009596:	f0878793          	addi	a5,a5,-248 # 1c000f08 <cbsys_first>
1c00959a:	97a2                	add	a5,a5,s0
1c00959c:	4398                	lw	a4,0(a5)
1c00959e:	c104                	sw	s1,0(a0)
1c0095a0:	c150                	sw	a2,4(a0)
1c0095a2:	c518                	sw	a4,8(a0)
1c0095a4:	c388                	sw	a0,0(a5)
1c0095a6:	4501                	li	a0,0
1c0095a8:	40f2                	lw	ra,28(sp)
1c0095aa:	4462                	lw	s0,24(sp)
1c0095ac:	44d2                	lw	s1,20(sp)
1c0095ae:	6105                	addi	sp,sp,32
1c0095b0:	8082                	ret
1c0095b2:	557d                	li	a0,-1
1c0095b4:	bfd5                	j	1c0095a8 <__rt_cbsys_add+0x32>

1c0095b6 <__rt_cbsys_exec>:
1c0095b6:	00251793          	slli	a5,a0,0x2
1c0095ba:	1c001537          	lui	a0,0x1c001
1c0095be:	f0850513          	addi	a0,a0,-248 # 1c000f08 <cbsys_first>
1c0095c2:	1141                	addi	sp,sp,-16
1c0095c4:	953e                	add	a0,a0,a5
1c0095c6:	c422                	sw	s0,8(sp)
1c0095c8:	4100                	lw	s0,0(a0)
1c0095ca:	c606                	sw	ra,12(sp)
1c0095cc:	e411                	bnez	s0,1c0095d8 <__rt_cbsys_exec+0x22>
1c0095ce:	4501                	li	a0,0
1c0095d0:	40b2                	lw	ra,12(sp)
1c0095d2:	4422                	lw	s0,8(sp)
1c0095d4:	0141                	addi	sp,sp,16
1c0095d6:	8082                	ret
1c0095d8:	401c                	lw	a5,0(s0)
1c0095da:	4048                	lw	a0,4(s0)
1c0095dc:	9782                	jalr	a5
1c0095de:	e119                	bnez	a0,1c0095e4 <__rt_cbsys_exec+0x2e>
1c0095e0:	4400                	lw	s0,8(s0)
1c0095e2:	b7ed                	j	1c0095cc <__rt_cbsys_exec+0x16>
1c0095e4:	557d                	li	a0,-1
1c0095e6:	b7ed                	j	1c0095d0 <__rt_cbsys_exec+0x1a>

1c0095e8 <__rt_utils_init>:
1c0095e8:	1c0017b7          	lui	a5,0x1c001
1c0095ec:	f0878793          	addi	a5,a5,-248 # 1c000f08 <cbsys_first>
1c0095f0:	0007a023          	sw	zero,0(a5)
1c0095f4:	0007a223          	sw	zero,4(a5)
1c0095f8:	0007a423          	sw	zero,8(a5)
1c0095fc:	0007a623          	sw	zero,12(a5)
1c009600:	0007a823          	sw	zero,16(a5)
1c009604:	0007aa23          	sw	zero,20(a5)
1c009608:	8082                	ret

1c00960a <__rt_fc_lock>:
1c00960a:	1141                	addi	sp,sp,-16
1c00960c:	c422                	sw	s0,8(sp)
1c00960e:	842a                	mv	s0,a0
1c009610:	c606                	sw	ra,12(sp)
1c009612:	c226                	sw	s1,4(sp)
1c009614:	c04a                	sw	s2,0(sp)
1c009616:	300474f3          	csrrci	s1,mstatus,8
1c00961a:	401c                	lw	a5,0(s0)
1c00961c:	eb99                	bnez	a5,1c009632 <__rt_fc_lock+0x28>
1c00961e:	4785                	li	a5,1
1c009620:	c01c                	sw	a5,0(s0)
1c009622:	30049073          	csrw	mstatus,s1
1c009626:	40b2                	lw	ra,12(sp)
1c009628:	4422                	lw	s0,8(sp)
1c00962a:	4492                	lw	s1,4(sp)
1c00962c:	4902                	lw	s2,0(sp)
1c00962e:	0141                	addi	sp,sp,16
1c009630:	8082                	ret
1c009632:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009636:	4585                	li	a1,1
1c009638:	e3ff7517          	auipc	a0,0xe3ff7
1c00963c:	9f050513          	addi	a0,a0,-1552 # 28 <__rt_sched>
1c009640:	c45c                	sw	a5,12(s0)
1c009642:	29f1                	jal	1c009b1e <__rt_event_execute>
1c009644:	bfd9                	j	1c00961a <__rt_fc_lock+0x10>

1c009646 <__rt_fc_unlock>:
1c009646:	300476f3          	csrrci	a3,mstatus,8
1c00964a:	415c                	lw	a5,4(a0)
1c00964c:	e791                	bnez	a5,1c009658 <__rt_fc_unlock+0x12>
1c00964e:	00052023          	sw	zero,0(a0)
1c009652:	30069073          	csrw	mstatus,a3
1c009656:	8082                	ret
1c009658:	43d8                	lw	a4,4(a5)
1c00965a:	c158                	sw	a4,4(a0)
1c00965c:	4705                	li	a4,1
1c00965e:	08e78a23          	sb	a4,148(a5)
1c009662:	0957c783          	lbu	a5,149(a5)
1c009666:	00201737          	lui	a4,0x201
1c00966a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3e18>
1c00966e:	04078793          	addi	a5,a5,64
1c009672:	07da                	slli	a5,a5,0x16
1c009674:	97ba                	add	a5,a5,a4
1c009676:	0007a023          	sw	zero,0(a5)
1c00967a:	bfe1                	j	1c009652 <__rt_fc_unlock+0xc>

1c00967c <__rt_fc_cluster_lock>:
1c00967c:	f14027f3          	csrr	a5,mhartid
1c009680:	8795                	srai	a5,a5,0x5
1c009682:	03f7f793          	andi	a5,a5,63
1c009686:	08f58aa3          	sb	a5,149(a1)
1c00968a:	4785                	li	a5,1
1c00968c:	08f58b23          	sb	a5,150(a1)
1c009690:	1c0097b7          	lui	a5,0x1c009
1c009694:	4d478793          	addi	a5,a5,1236 # 1c0094d4 <__rt_fc_cluster_lock_req>
1c009698:	c188                	sw	a0,0(a1)
1c00969a:	08058a23          	sb	zero,148(a1)
1c00969e:	0205a423          	sw	zero,40(a1)
1c0096a2:	0205a623          	sw	zero,44(a1)
1c0096a6:	c59c                	sw	a5,8(a1)
1c0096a8:	c5cc                	sw	a1,12(a1)
1c0096aa:	05a1                	addi	a1,a1,8
1c0096ac:	0015e513          	ori	a0,a1,1
1c0096b0:	8abff06f          	j	1c008f5a <__rt_cluster_push_fc_event>

1c0096b4 <__rt_fc_cluster_unlock>:
1c0096b4:	f14027f3          	csrr	a5,mhartid
1c0096b8:	8795                	srai	a5,a5,0x5
1c0096ba:	03f7f793          	andi	a5,a5,63
1c0096be:	08f58aa3          	sb	a5,149(a1)
1c0096c2:	1c0097b7          	lui	a5,0x1c009
1c0096c6:	4d478793          	addi	a5,a5,1236 # 1c0094d4 <__rt_fc_cluster_lock_req>
1c0096ca:	c188                	sw	a0,0(a1)
1c0096cc:	08058a23          	sb	zero,148(a1)
1c0096d0:	08058b23          	sb	zero,150(a1)
1c0096d4:	0205a423          	sw	zero,40(a1)
1c0096d8:	0205a623          	sw	zero,44(a1)
1c0096dc:	c59c                	sw	a5,8(a1)
1c0096de:	c5cc                	sw	a1,12(a1)
1c0096e0:	05a1                	addi	a1,a1,8
1c0096e2:	0015e513          	ori	a0,a1,1
1c0096e6:	875ff06f          	j	1c008f5a <__rt_cluster_push_fc_event>

1c0096ea <__rt_event_enqueue>:
1c0096ea:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c0096ee:	00052c23          	sw	zero,24(a0)
1c0096f2:	c799                	beqz	a5,1c009700 <__rt_event_enqueue+0x16>
1c0096f4:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c0096f8:	cf88                	sw	a0,24(a5)
1c0096fa:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c0096fe:	8082                	ret
1c009700:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c009704:	bfdd                	j	1c0096fa <__rt_event_enqueue+0x10>

1c009706 <__rt_bridge_check_bridge_req.part.5>:
1c009706:	1c001737          	lui	a4,0x1c001
1c00970a:	01c70793          	addi	a5,a4,28 # 1c00101c <__hal_debug_struct>
1c00970e:	0a47a783          	lw	a5,164(a5)
1c009712:	01c70713          	addi	a4,a4,28
1c009716:	c789                	beqz	a5,1c009720 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c009718:	4f94                	lw	a3,24(a5)
1c00971a:	e681                	bnez	a3,1c009722 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c00971c:	0af72623          	sw	a5,172(a4)
1c009720:	8082                	ret
1c009722:	479c                	lw	a5,8(a5)
1c009724:	bfcd                	j	1c009716 <__rt_bridge_check_bridge_req.part.5+0x10>

1c009726 <__rt_bridge_wait>:
1c009726:	f14027f3          	csrr	a5,mhartid
1c00972a:	8795                	srai	a5,a5,0x5
1c00972c:	03f7f793          	andi	a5,a5,63
1c009730:	477d                	li	a4,31
1c009732:	02e79a63          	bne	a5,a4,1c009766 <__rt_bridge_wait+0x40>
1c009736:	1a10a7b7          	lui	a5,0x1a10a
1c00973a:	6711                	lui	a4,0x4
1c00973c:	300476f3          	csrrci	a3,mstatus,8
1c009740:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1067f8>
1c009744:	01161593          	slli	a1,a2,0x11
1c009748:	0005cb63          	bltz	a1,1c00975e <__rt_bridge_wait+0x38>
1c00974c:	80e7a223          	sw	a4,-2044(a5)
1c009750:	10500073          	wfi
1c009754:	80e7a423          	sw	a4,-2040(a5)
1c009758:	30069073          	csrw	mstatus,a3
1c00975c:	b7c5                	j	1c00973c <__rt_bridge_wait+0x16>
1c00975e:	80e7aa23          	sw	a4,-2028(a5)
1c009762:	30069073          	csrw	mstatus,a3
1c009766:	8082                	ret

1c009768 <__rt_bridge_handle_notif>:
1c009768:	1141                	addi	sp,sp,-16
1c00976a:	c422                	sw	s0,8(sp)
1c00976c:	1c001437          	lui	s0,0x1c001
1c009770:	01c40793          	addi	a5,s0,28 # 1c00101c <__hal_debug_struct>
1c009774:	0a47a783          	lw	a5,164(a5)
1c009778:	c606                	sw	ra,12(sp)
1c00977a:	c226                	sw	s1,4(sp)
1c00977c:	c04a                	sw	s2,0(sp)
1c00977e:	01c40413          	addi	s0,s0,28
1c009782:	c399                	beqz	a5,1c009788 <__rt_bridge_handle_notif+0x20>
1c009784:	4bd8                	lw	a4,20(a5)
1c009786:	e30d                	bnez	a4,1c0097a8 <__rt_bridge_handle_notif+0x40>
1c009788:	0b442783          	lw	a5,180(s0)
1c00978c:	c789                	beqz	a5,1c009796 <__rt_bridge_handle_notif+0x2e>
1c00978e:	43a8                	lw	a0,64(a5)
1c009790:	0a042a23          	sw	zero,180(s0)
1c009794:	3f99                	jal	1c0096ea <__rt_event_enqueue>
1c009796:	0ac42783          	lw	a5,172(s0)
1c00979a:	eb95                	bnez	a5,1c0097ce <__rt_bridge_handle_notif+0x66>
1c00979c:	4422                	lw	s0,8(sp)
1c00979e:	40b2                	lw	ra,12(sp)
1c0097a0:	4492                	lw	s1,4(sp)
1c0097a2:	4902                	lw	s2,0(sp)
1c0097a4:	0141                	addi	sp,sp,16
1c0097a6:	b785                	j	1c009706 <__rt_bridge_check_bridge_req.part.5>
1c0097a8:	4784                	lw	s1,8(a5)
1c0097aa:	4fd8                	lw	a4,28(a5)
1c0097ac:	0a942223          	sw	s1,164(s0)
1c0097b0:	cb01                	beqz	a4,1c0097c0 <__rt_bridge_handle_notif+0x58>
1c0097b2:	0b042703          	lw	a4,176(s0)
1c0097b6:	c798                	sw	a4,8(a5)
1c0097b8:	0af42823          	sw	a5,176(s0)
1c0097bc:	87a6                	mv	a5,s1
1c0097be:	b7d1                	j	1c009782 <__rt_bridge_handle_notif+0x1a>
1c0097c0:	43a8                	lw	a0,64(a5)
1c0097c2:	30047973          	csrrci	s2,mstatus,8
1c0097c6:	3715                	jal	1c0096ea <__rt_event_enqueue>
1c0097c8:	30091073          	csrw	mstatus,s2
1c0097cc:	bfc5                	j	1c0097bc <__rt_bridge_handle_notif+0x54>
1c0097ce:	40b2                	lw	ra,12(sp)
1c0097d0:	4422                	lw	s0,8(sp)
1c0097d2:	4492                	lw	s1,4(sp)
1c0097d4:	4902                	lw	s2,0(sp)
1c0097d6:	0141                	addi	sp,sp,16
1c0097d8:	8082                	ret

1c0097da <__rt_bridge_check_connection>:
1c0097da:	1c001737          	lui	a4,0x1c001
1c0097de:	01c70713          	addi	a4,a4,28 # 1c00101c <__hal_debug_struct>
1c0097e2:	471c                	lw	a5,8(a4)
1c0097e4:	ef95                	bnez	a5,1c009820 <__rt_bridge_check_connection+0x46>
1c0097e6:	1a1047b7          	lui	a5,0x1a104
1c0097ea:	5bfc                	lw	a5,116(a5)
1c0097ec:	469d                	li	a3,7
1c0097ee:	83a5                	srli	a5,a5,0x9
1c0097f0:	8b9d                	andi	a5,a5,7
1c0097f2:	02d79763          	bne	a5,a3,1c009820 <__rt_bridge_check_connection+0x46>
1c0097f6:	1141                	addi	sp,sp,-16
1c0097f8:	c422                	sw	s0,8(sp)
1c0097fa:	c226                	sw	s1,4(sp)
1c0097fc:	c606                	sw	ra,12(sp)
1c0097fe:	4785                	li	a5,1
1c009800:	c71c                	sw	a5,8(a4)
1c009802:	1a1044b7          	lui	s1,0x1a104
1c009806:	441d                	li	s0,7
1c009808:	58fc                	lw	a5,116(s1)
1c00980a:	83a5                	srli	a5,a5,0x9
1c00980c:	8b9d                	andi	a5,a5,7
1c00980e:	00878763          	beq	a5,s0,1c00981c <__rt_bridge_check_connection+0x42>
1c009812:	40b2                	lw	ra,12(sp)
1c009814:	4422                	lw	s0,8(sp)
1c009816:	4492                	lw	s1,4(sp)
1c009818:	0141                	addi	sp,sp,16
1c00981a:	8082                	ret
1c00981c:	3729                	jal	1c009726 <__rt_bridge_wait>
1c00981e:	b7ed                	j	1c009808 <__rt_bridge_check_connection+0x2e>
1c009820:	8082                	ret

1c009822 <__rt_bridge_set_available>:
1c009822:	1c0017b7          	lui	a5,0x1c001
1c009826:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00982a:	479c                	lw	a5,8(a5)
1c00982c:	8082                	ret

1c00982e <__rt_bridge_send_notif>:
1c00982e:	1141                	addi	sp,sp,-16
1c009830:	c606                	sw	ra,12(sp)
1c009832:	3765                	jal	1c0097da <__rt_bridge_check_connection>
1c009834:	40b2                	lw	ra,12(sp)
1c009836:	1c0017b7          	lui	a5,0x1c001
1c00983a:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00983e:	479c                	lw	a5,8(a5)
1c009840:	0141                	addi	sp,sp,16
1c009842:	8082                	ret

1c009844 <__rt_bridge_clear_notif>:
1c009844:	1141                	addi	sp,sp,-16
1c009846:	c606                	sw	ra,12(sp)
1c009848:	3f49                	jal	1c0097da <__rt_bridge_check_connection>
1c00984a:	1c0017b7          	lui	a5,0x1c001
1c00984e:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009852:	4798                	lw	a4,8(a5)
1c009854:	c311                	beqz	a4,1c009858 <__rt_bridge_clear_notif+0x14>
1c009856:	479c                	lw	a5,8(a5)
1c009858:	40b2                	lw	ra,12(sp)
1c00985a:	0141                	addi	sp,sp,16
1c00985c:	8082                	ret

1c00985e <__rt_bridge_printf_flush>:
1c00985e:	1141                	addi	sp,sp,-16
1c009860:	c422                	sw	s0,8(sp)
1c009862:	c606                	sw	ra,12(sp)
1c009864:	1c001437          	lui	s0,0x1c001
1c009868:	3f8d                	jal	1c0097da <__rt_bridge_check_connection>
1c00986a:	01c40793          	addi	a5,s0,28 # 1c00101c <__hal_debug_struct>
1c00986e:	479c                	lw	a5,8(a5)
1c009870:	c385                	beqz	a5,1c009890 <__rt_bridge_printf_flush+0x32>
1c009872:	01c40413          	addi	s0,s0,28
1c009876:	485c                	lw	a5,20(s0)
1c009878:	e399                	bnez	a5,1c00987e <__rt_bridge_printf_flush+0x20>
1c00987a:	4c1c                	lw	a5,24(s0)
1c00987c:	cb91                	beqz	a5,1c009890 <__rt_bridge_printf_flush+0x32>
1c00987e:	3f45                	jal	1c00982e <__rt_bridge_send_notif>
1c009880:	485c                	lw	a5,20(s0)
1c009882:	e789                	bnez	a5,1c00988c <__rt_bridge_printf_flush+0x2e>
1c009884:	4422                	lw	s0,8(sp)
1c009886:	40b2                	lw	ra,12(sp)
1c009888:	0141                	addi	sp,sp,16
1c00988a:	bf6d                	j	1c009844 <__rt_bridge_clear_notif>
1c00988c:	3d69                	jal	1c009726 <__rt_bridge_wait>
1c00988e:	bfcd                	j	1c009880 <__rt_bridge_printf_flush+0x22>
1c009890:	40b2                	lw	ra,12(sp)
1c009892:	4422                	lw	s0,8(sp)
1c009894:	0141                	addi	sp,sp,16
1c009896:	8082                	ret

1c009898 <__rt_bridge_req_shutdown>:
1c009898:	1141                	addi	sp,sp,-16
1c00989a:	c606                	sw	ra,12(sp)
1c00989c:	c422                	sw	s0,8(sp)
1c00989e:	c226                	sw	s1,4(sp)
1c0098a0:	3f2d                	jal	1c0097da <__rt_bridge_check_connection>
1c0098a2:	1c0017b7          	lui	a5,0x1c001
1c0098a6:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c0098aa:	479c                	lw	a5,8(a5)
1c0098ac:	cb95                	beqz	a5,1c0098e0 <__rt_bridge_req_shutdown+0x48>
1c0098ae:	3f45                	jal	1c00985e <__rt_bridge_printf_flush>
1c0098b0:	1a1044b7          	lui	s1,0x1a104
1c0098b4:	441d                	li	s0,7
1c0098b6:	58fc                	lw	a5,116(s1)
1c0098b8:	83a5                	srli	a5,a5,0x9
1c0098ba:	8b9d                	andi	a5,a5,7
1c0098bc:	02878763          	beq	a5,s0,1c0098ea <__rt_bridge_req_shutdown+0x52>
1c0098c0:	1a1044b7          	lui	s1,0x1a104
1c0098c4:	441d                	li	s0,7
1c0098c6:	58fc                	lw	a5,116(s1)
1c0098c8:	83a5                	srli	a5,a5,0x9
1c0098ca:	8b9d                	andi	a5,a5,7
1c0098cc:	02879163          	bne	a5,s0,1c0098ee <__rt_bridge_req_shutdown+0x56>
1c0098d0:	1a1044b7          	lui	s1,0x1a104
1c0098d4:	441d                	li	s0,7
1c0098d6:	58fc                	lw	a5,116(s1)
1c0098d8:	83a5                	srli	a5,a5,0x9
1c0098da:	8b9d                	andi	a5,a5,7
1c0098dc:	00878b63          	beq	a5,s0,1c0098f2 <__rt_bridge_req_shutdown+0x5a>
1c0098e0:	40b2                	lw	ra,12(sp)
1c0098e2:	4422                	lw	s0,8(sp)
1c0098e4:	4492                	lw	s1,4(sp)
1c0098e6:	0141                	addi	sp,sp,16
1c0098e8:	8082                	ret
1c0098ea:	3d35                	jal	1c009726 <__rt_bridge_wait>
1c0098ec:	b7e9                	j	1c0098b6 <__rt_bridge_req_shutdown+0x1e>
1c0098ee:	3d25                	jal	1c009726 <__rt_bridge_wait>
1c0098f0:	bfd9                	j	1c0098c6 <__rt_bridge_req_shutdown+0x2e>
1c0098f2:	3d15                	jal	1c009726 <__rt_bridge_wait>
1c0098f4:	b7cd                	j	1c0098d6 <__rt_bridge_req_shutdown+0x3e>

1c0098f6 <__rt_bridge_init>:
1c0098f6:	1c0017b7          	lui	a5,0x1c001
1c0098fa:	1a10a737          	lui	a4,0x1a10a
1c0098fe:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009902:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1067fc>
1c009906:	0ae7ac23          	sw	a4,184(a5)
1c00990a:	4741                	li	a4,16
1c00990c:	0a07a223          	sw	zero,164(a5)
1c009910:	0a07a623          	sw	zero,172(a5)
1c009914:	0a07aa23          	sw	zero,180(a5)
1c009918:	0ae7ae23          	sw	a4,188(a5)
1c00991c:	00400793          	li	a5,4
1c009920:	0007a823          	sw	zero,16(a5)
1c009924:	0007a023          	sw	zero,0(a5)
1c009928:	8082                	ret

1c00992a <__rt_thread_enqueue_ready>:
1c00992a:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c00992e:	02052c23          	sw	zero,56(a0)
1c009932:	01800793          	li	a5,24
1c009936:	e711                	bnez	a4,1c009942 <__rt_thread_enqueue_ready+0x18>
1c009938:	c388                	sw	a0,0(a5)
1c00993a:	c3c8                	sw	a0,4(a5)
1c00993c:	0c052a23          	sw	zero,212(a0)
1c009940:	8082                	ret
1c009942:	43d8                	lw	a4,4(a5)
1c009944:	df08                	sw	a0,56(a4)
1c009946:	bfd5                	j	1c00993a <__rt_thread_enqueue_ready+0x10>

1c009948 <__rt_thread_sleep>:
1c009948:	01800713          	li	a4,24
1c00994c:	4708                	lw	a0,8(a4)
1c00994e:	01800793          	li	a5,24
1c009952:	438c                	lw	a1,0(a5)
1c009954:	c999                	beqz	a1,1c00996a <__rt_thread_sleep+0x22>
1c009956:	5d98                	lw	a4,56(a1)
1c009958:	c398                	sw	a4,0(a5)
1c00995a:	4705                	li	a4,1
1c00995c:	0ce5aa23          	sw	a4,212(a1)
1c009960:	00b50c63          	beq	a0,a1,1c009978 <__rt_thread_sleep+0x30>
1c009964:	c78c                	sw	a1,8(a5)
1c009966:	961fe06f          	j	1c0082c6 <__rt_thread_switch>
1c00996a:	10500073          	wfi
1c00996e:	30045073          	csrwi	mstatus,8
1c009972:	30047773          	csrrci	a4,mstatus,8
1c009976:	bff1                	j	1c009952 <__rt_thread_sleep+0xa>
1c009978:	8082                	ret

1c00997a <rt_thread_exit>:
1c00997a:	300477f3          	csrrci	a5,mstatus,8
1c00997e:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009982:	4705                	li	a4,1
1c009984:	c3e8                	sw	a0,68(a5)
1c009986:	5fc8                	lw	a0,60(a5)
1c009988:	c3b8                	sw	a4,64(a5)
1c00998a:	c909                	beqz	a0,1c00999c <rt_thread_exit+0x22>
1c00998c:	0d452783          	lw	a5,212(a0)
1c009990:	c791                	beqz	a5,1c00999c <rt_thread_exit+0x22>
1c009992:	1141                	addi	sp,sp,-16
1c009994:	c606                	sw	ra,12(sp)
1c009996:	3f51                	jal	1c00992a <__rt_thread_enqueue_ready>
1c009998:	40b2                	lw	ra,12(sp)
1c00999a:	0141                	addi	sp,sp,16
1c00999c:	b775                	j	1c009948 <__rt_thread_sleep>

1c00999e <__rt_thread_wakeup>:
1c00999e:	5d18                	lw	a4,56(a0)
1c0099a0:	eb09                	bnez	a4,1c0099b2 <__rt_thread_wakeup+0x14>
1c0099a2:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c0099a6:	00a70663          	beq	a4,a0,1c0099b2 <__rt_thread_wakeup+0x14>
1c0099aa:	0d452783          	lw	a5,212(a0)
1c0099ae:	c391                	beqz	a5,1c0099b2 <__rt_thread_wakeup+0x14>
1c0099b0:	bfad                	j	1c00992a <__rt_thread_enqueue_ready>
1c0099b2:	8082                	ret

1c0099b4 <__rt_thread_sched_init>:
1c0099b4:	1141                	addi	sp,sp,-16
1c0099b6:	c422                	sw	s0,8(sp)
1c0099b8:	1c0087b7          	lui	a5,0x1c008
1c0099bc:	1c001437          	lui	s0,0x1c001
1c0099c0:	c226                	sw	s1,4(sp)
1c0099c2:	c04a                	sw	s2,0(sp)
1c0099c4:	c606                	sw	ra,12(sp)
1c0099c6:	f2040413          	addi	s0,s0,-224 # 1c000f20 <__rt_thread_main>
1c0099ca:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c0099ce:	c01c                	sw	a5,0(s0)
1c0099d0:	1c00a7b7          	lui	a5,0x1c00a
1c0099d4:	04840913          	addi	s2,s0,72
1c0099d8:	97a78793          	addi	a5,a5,-1670 # 1c00997a <rt_thread_exit>
1c0099dc:	01800493          	li	s1,24
1c0099e0:	c45c                	sw	a5,12(s0)
1c0099e2:	854a                	mv	a0,s2
1c0099e4:	4785                	li	a5,1
1c0099e6:	e3ff6597          	auipc	a1,0xe3ff6
1c0099ea:	64258593          	addi	a1,a1,1602 # 28 <__rt_sched>
1c0099ee:	0cf42a23          	sw	a5,212(s0)
1c0099f2:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa100fec>
1c0099f6:	02042a23          	sw	zero,52(s0)
1c0099fa:	00042223          	sw	zero,4(s0)
1c0099fe:	00042423          	sw	zero,8(s0)
1c009a02:	2829                	jal	1c009a1c <__rt_event_init>
1c009a04:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009a08:	c480                	sw	s0,8(s1)
1c009a0a:	40b2                	lw	ra,12(sp)
1c009a0c:	d03c                	sw	a5,96(s0)
1c009a0e:	4422                	lw	s0,8(sp)
1c009a10:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009a14:	4492                	lw	s1,4(sp)
1c009a16:	4902                	lw	s2,0(sp)
1c009a18:	0141                	addi	sp,sp,16
1c009a1a:	8082                	ret

1c009a1c <__rt_event_init>:
1c009a1c:	02052023          	sw	zero,32(a0)
1c009a20:	02052223          	sw	zero,36(a0)
1c009a24:	02052823          	sw	zero,48(a0)
1c009a28:	00052023          	sw	zero,0(a0)
1c009a2c:	8082                	ret

1c009a2e <__rt_wait_event_prepare_blocking>:
1c009a2e:	02400793          	li	a5,36
1c009a32:	4388                	lw	a0,0(a5)
1c009a34:	4d18                	lw	a4,24(a0)
1c009a36:	02052223          	sw	zero,36(a0)
1c009a3a:	c398                	sw	a4,0(a5)
1c009a3c:	4785                	li	a5,1
1c009a3e:	d11c                	sw	a5,32(a0)
1c009a40:	00052023          	sw	zero,0(a0)
1c009a44:	8082                	ret

1c009a46 <rt_event_alloc>:
1c009a46:	1141                	addi	sp,sp,-16
1c009a48:	c422                	sw	s0,8(sp)
1c009a4a:	842e                	mv	s0,a1
1c009a4c:	c606                	sw	ra,12(sp)
1c009a4e:	c226                	sw	s1,4(sp)
1c009a50:	300474f3          	csrrci	s1,mstatus,8
1c009a54:	f14027f3          	csrr	a5,mhartid
1c009a58:	8795                	srai	a5,a5,0x5
1c009a5a:	03f7f793          	andi	a5,a5,63
1c009a5e:	477d                	li	a4,31
1c009a60:	00378513          	addi	a0,a5,3
1c009a64:	00e79363          	bne	a5,a4,1c009a6a <rt_event_alloc+0x24>
1c009a68:	4501                	li	a0,0
1c009a6a:	08c00593          	li	a1,140
1c009a6e:	02b405b3          	mul	a1,s0,a1
1c009a72:	882ff0ef          	jal	ra,1c008af4 <rt_alloc>
1c009a76:	87aa                	mv	a5,a0
1c009a78:	557d                	li	a0,-1
1c009a7a:	cf91                	beqz	a5,1c009a96 <rt_event_alloc+0x50>
1c009a7c:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009a80:	4581                	li	a1,0
1c009a82:	4601                	li	a2,0
1c009a84:	02400713          	li	a4,36
1c009a88:	00864c63          	blt	a2,s0,1c009aa0 <rt_event_alloc+0x5a>
1c009a8c:	c191                	beqz	a1,1c009a90 <rt_event_alloc+0x4a>
1c009a8e:	c314                	sw	a3,0(a4)
1c009a90:	30049073          	csrw	mstatus,s1
1c009a94:	4501                	li	a0,0
1c009a96:	40b2                	lw	ra,12(sp)
1c009a98:	4422                	lw	s0,8(sp)
1c009a9a:	4492                	lw	s1,4(sp)
1c009a9c:	0141                	addi	sp,sp,16
1c009a9e:	8082                	ret
1c009aa0:	cf94                	sw	a3,24(a5)
1c009aa2:	0207a023          	sw	zero,32(a5)
1c009aa6:	0207a223          	sw	zero,36(a5)
1c009aaa:	0207a823          	sw	zero,48(a5)
1c009aae:	0007a023          	sw	zero,0(a5)
1c009ab2:	86be                	mv	a3,a5
1c009ab4:	0605                	addi	a2,a2,1
1c009ab6:	4585                	li	a1,1
1c009ab8:	08c78793          	addi	a5,a5,140
1c009abc:	b7f1                	j	1c009a88 <rt_event_alloc+0x42>

1c009abe <rt_event_get>:
1c009abe:	30047773          	csrrci	a4,mstatus,8
1c009ac2:	02400793          	li	a5,36
1c009ac6:	4388                	lw	a0,0(a5)
1c009ac8:	c509                	beqz	a0,1c009ad2 <rt_event_get+0x14>
1c009aca:	4d14                	lw	a3,24(a0)
1c009acc:	c150                	sw	a2,4(a0)
1c009ace:	c394                	sw	a3,0(a5)
1c009ad0:	c10c                	sw	a1,0(a0)
1c009ad2:	30071073          	csrw	mstatus,a4
1c009ad6:	8082                	ret

1c009ad8 <rt_event_get_blocking>:
1c009ad8:	30047773          	csrrci	a4,mstatus,8
1c009adc:	02400793          	li	a5,36
1c009ae0:	4388                	lw	a0,0(a5)
1c009ae2:	c909                	beqz	a0,1c009af4 <rt_event_get_blocking+0x1c>
1c009ae4:	4d14                	lw	a3,24(a0)
1c009ae6:	00052223          	sw	zero,4(a0)
1c009aea:	c394                	sw	a3,0(a5)
1c009aec:	4785                	li	a5,1
1c009aee:	00052023          	sw	zero,0(a0)
1c009af2:	d11c                	sw	a5,32(a0)
1c009af4:	30071073          	csrw	mstatus,a4
1c009af8:	8082                	ret

1c009afa <rt_event_push>:
1c009afa:	30047773          	csrrci	a4,mstatus,8
1c009afe:	02400693          	li	a3,36
1c009b02:	42d4                	lw	a3,4(a3)
1c009b04:	00052c23          	sw	zero,24(a0)
1c009b08:	02400793          	li	a5,36
1c009b0c:	e691                	bnez	a3,1c009b18 <rt_event_push+0x1e>
1c009b0e:	c3c8                	sw	a0,4(a5)
1c009b10:	c788                	sw	a0,8(a5)
1c009b12:	30071073          	csrw	mstatus,a4
1c009b16:	8082                	ret
1c009b18:	4794                	lw	a3,8(a5)
1c009b1a:	ce88                	sw	a0,24(a3)
1c009b1c:	bfd5                	j	1c009b10 <rt_event_push+0x16>

1c009b1e <__rt_event_execute>:
1c009b1e:	1141                	addi	sp,sp,-16
1c009b20:	c422                	sw	s0,8(sp)
1c009b22:	02400793          	li	a5,36
1c009b26:	43dc                	lw	a5,4(a5)
1c009b28:	c606                	sw	ra,12(sp)
1c009b2a:	c226                	sw	s1,4(sp)
1c009b2c:	02400413          	li	s0,36
1c009b30:	eb91                	bnez	a5,1c009b44 <__rt_event_execute+0x26>
1c009b32:	c1a9                	beqz	a1,1c009b74 <__rt_event_execute+0x56>
1c009b34:	10500073          	wfi
1c009b38:	30045073          	csrwi	mstatus,8
1c009b3c:	300477f3          	csrrci	a5,mstatus,8
1c009b40:	405c                	lw	a5,4(s0)
1c009b42:	cb8d                	beqz	a5,1c009b74 <__rt_event_execute+0x56>
1c009b44:	4485                	li	s1,1
1c009b46:	4f98                	lw	a4,24(a5)
1c009b48:	53d4                	lw	a3,36(a5)
1c009b4a:	00978823          	sb	s1,16(a5)
1c009b4e:	c058                	sw	a4,4(s0)
1c009b50:	43c8                	lw	a0,4(a5)
1c009b52:	4398                	lw	a4,0(a5)
1c009b54:	e691                	bnez	a3,1c009b60 <__rt_event_execute+0x42>
1c009b56:	5394                	lw	a3,32(a5)
1c009b58:	e681                	bnez	a3,1c009b60 <__rt_event_execute+0x42>
1c009b5a:	4014                	lw	a3,0(s0)
1c009b5c:	c01c                	sw	a5,0(s0)
1c009b5e:	cf94                	sw	a3,24(a5)
1c009b60:	0207a023          	sw	zero,32(a5)
1c009b64:	c711                	beqz	a4,1c009b70 <__rt_event_execute+0x52>
1c009b66:	30045073          	csrwi	mstatus,8
1c009b6a:	9702                	jalr	a4
1c009b6c:	300477f3          	csrrci	a5,mstatus,8
1c009b70:	405c                	lw	a5,4(s0)
1c009b72:	fbf1                	bnez	a5,1c009b46 <__rt_event_execute+0x28>
1c009b74:	40b2                	lw	ra,12(sp)
1c009b76:	4422                	lw	s0,8(sp)
1c009b78:	4492                	lw	s1,4(sp)
1c009b7a:	0141                	addi	sp,sp,16
1c009b7c:	8082                	ret

1c009b7e <__rt_wait_event>:
1c009b7e:	1141                	addi	sp,sp,-16
1c009b80:	c422                	sw	s0,8(sp)
1c009b82:	c606                	sw	ra,12(sp)
1c009b84:	842a                	mv	s0,a0
1c009b86:	501c                	lw	a5,32(s0)
1c009b88:	ef81                	bnez	a5,1c009ba0 <__rt_wait_event+0x22>
1c009b8a:	581c                	lw	a5,48(s0)
1c009b8c:	eb91                	bnez	a5,1c009ba0 <__rt_wait_event+0x22>
1c009b8e:	02400793          	li	a5,36
1c009b92:	4398                	lw	a4,0(a5)
1c009b94:	40b2                	lw	ra,12(sp)
1c009b96:	c380                	sw	s0,0(a5)
1c009b98:	cc18                	sw	a4,24(s0)
1c009b9a:	4422                	lw	s0,8(sp)
1c009b9c:	0141                	addi	sp,sp,16
1c009b9e:	8082                	ret
1c009ba0:	4585                	li	a1,1
1c009ba2:	4501                	li	a0,0
1c009ba4:	3fad                	jal	1c009b1e <__rt_event_execute>
1c009ba6:	b7c5                	j	1c009b86 <__rt_wait_event+0x8>

1c009ba8 <rt_event_wait>:
1c009ba8:	1141                	addi	sp,sp,-16
1c009baa:	c606                	sw	ra,12(sp)
1c009bac:	c422                	sw	s0,8(sp)
1c009bae:	30047473          	csrrci	s0,mstatus,8
1c009bb2:	37f1                	jal	1c009b7e <__rt_wait_event>
1c009bb4:	30041073          	csrw	mstatus,s0
1c009bb8:	40b2                	lw	ra,12(sp)
1c009bba:	4422                	lw	s0,8(sp)
1c009bbc:	0141                	addi	sp,sp,16
1c009bbe:	8082                	ret

1c009bc0 <__rt_event_sched_init>:
1c009bc0:	02400513          	li	a0,36
1c009bc4:	00052023          	sw	zero,0(a0)
1c009bc8:	00052223          	sw	zero,4(a0)
1c009bcc:	4585                	li	a1,1
1c009bce:	0511                	addi	a0,a0,4
1c009bd0:	bd9d                	j	1c009a46 <rt_event_alloc>

1c009bd2 <__rt_fll_set_freq>:
1c009bd2:	1141                	addi	sp,sp,-16
1c009bd4:	c422                	sw	s0,8(sp)
1c009bd6:	c226                	sw	s1,4(sp)
1c009bd8:	c606                	sw	ra,12(sp)
1c009bda:	842a                	mv	s0,a0
1c009bdc:	84ae                	mv	s1,a1
1c009bde:	e111                	bnez	a0,1c009be2 <__rt_fll_set_freq+0x10>
1c009be0:	3965                	jal	1c009898 <__rt_bridge_req_shutdown>
1c009be2:	8526                	mv	a0,s1
1c009be4:	911fe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009be8:	1579                	addi	a0,a0,-2
1c009bea:	00155793          	srli	a5,a0,0x1
1c009bee:	e391                	bnez	a5,1c009bf2 <__rt_fll_set_freq+0x20>
1c009bf0:	4785                	li	a5,1
1c009bf2:	fff78713          	addi	a4,a5,-1
1c009bf6:	4505                	li	a0,1
1c009bf8:	00e51533          	sll	a0,a0,a4
1c009bfc:	00f494b3          	sll	s1,s1,a5
1c009c00:	7761                	lui	a4,0xffff8
1c009c02:	8f65                	and	a4,a4,s1
1c009c04:	1c0016b7          	lui	a3,0x1c001
1c009c08:	953a                	add	a0,a0,a4
1c009c0a:	23068693          	addi	a3,a3,560 # 1c001230 <__rt_fll_freq>
1c009c0e:	00241713          	slli	a4,s0,0x2
1c009c12:	9736                	add	a4,a4,a3
1c009c14:	00f55533          	srl	a0,a0,a5
1c009c18:	c308                	sw	a0,0(a4)
1c009c1a:	1c001737          	lui	a4,0x1c001
1c009c1e:	1cc70713          	addi	a4,a4,460 # 1c0011cc <__rt_fll_is_on>
1c009c22:	9722                	add	a4,a4,s0
1c009c24:	00074703          	lbu	a4,0(a4)
1c009c28:	c715                	beqz	a4,1c009c54 <__rt_fll_set_freq+0x82>
1c009c2a:	1a100737          	lui	a4,0x1a100
1c009c2e:	0711                	addi	a4,a4,4
1c009c30:	0412                	slli	s0,s0,0x4
1c009c32:	943a                	add	s0,s0,a4
1c009c34:	4018                	lw	a4,0(s0)
1c009c36:	80bd                	srli	s1,s1,0xf
1c009c38:	76c1                	lui	a3,0xffff0
1c009c3a:	04c2                	slli	s1,s1,0x10
1c009c3c:	8f75                	and	a4,a4,a3
1c009c3e:	80c1                	srli	s1,s1,0x10
1c009c40:	0785                	addi	a5,a5,1
1c009c42:	c40006b7          	lui	a3,0xc4000
1c009c46:	8f45                	or	a4,a4,s1
1c009c48:	8bbd                	andi	a5,a5,15
1c009c4a:	16fd                	addi	a3,a3,-1
1c009c4c:	07ea                	slli	a5,a5,0x1a
1c009c4e:	8f75                	and	a4,a4,a3
1c009c50:	8fd9                	or	a5,a5,a4
1c009c52:	c01c                	sw	a5,0(s0)
1c009c54:	40b2                	lw	ra,12(sp)
1c009c56:	4422                	lw	s0,8(sp)
1c009c58:	4492                	lw	s1,4(sp)
1c009c5a:	0141                	addi	sp,sp,16
1c009c5c:	8082                	ret

1c009c5e <__rt_fll_init>:
1c009c5e:	1141                	addi	sp,sp,-16
1c009c60:	1a1005b7          	lui	a1,0x1a100
1c009c64:	00451613          	slli	a2,a0,0x4
1c009c68:	c226                	sw	s1,4(sp)
1c009c6a:	84aa                	mv	s1,a0
1c009c6c:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fcff0>
1c009c70:	9532                	add	a0,a0,a2
1c009c72:	4114                	lw	a3,0(a0)
1c009c74:	c606                	sw	ra,12(sp)
1c009c76:	c422                	sw	s0,8(sp)
1c009c78:	87b6                	mv	a5,a3
1c009c7a:	0406c963          	bltz	a3,1c009ccc <__rt_fll_init+0x6e>
1c009c7e:	00858793          	addi	a5,a1,8
1c009c82:	97b2                	add	a5,a5,a2
1c009c84:	4398                	lw	a4,0(a5)
1c009c86:	7841                	lui	a6,0xffff0
1c009c88:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009c8c:	01077733          	and	a4,a4,a6
1c009c90:	6809                	lui	a6,0x2
1c009c92:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009c96:	01076733          	or	a4,a4,a6
1c009c9a:	f0010837          	lui	a6,0xf0010
1c009c9e:	187d                	addi	a6,a6,-1
1c009ca0:	01077733          	and	a4,a4,a6
1c009ca4:	00500837          	lui	a6,0x500
1c009ca8:	01076733          	or	a4,a4,a6
1c009cac:	05b1                	addi	a1,a1,12
1c009cae:	c398                	sw	a4,0(a5)
1c009cb0:	962e                	add	a2,a2,a1
1c009cb2:	421c                	lw	a5,0(a2)
1c009cb4:	fc010737          	lui	a4,0xfc010
1c009cb8:	177d                	addi	a4,a4,-1
1c009cba:	8ff9                	and	a5,a5,a4
1c009cbc:	014c0737          	lui	a4,0x14c0
1c009cc0:	8fd9                	or	a5,a5,a4
1c009cc2:	c21c                	sw	a5,0(a2)
1c009cc4:	c00007b7          	lui	a5,0xc0000
1c009cc8:	8fd5                	or	a5,a5,a3
1c009cca:	c11c                	sw	a5,0(a0)
1c009ccc:	1c001637          	lui	a2,0x1c001
1c009cd0:	00249713          	slli	a4,s1,0x2
1c009cd4:	23060613          	addi	a2,a2,560 # 1c001230 <__rt_fll_freq>
1c009cd8:	9732                	add	a4,a4,a2
1c009cda:	4300                	lw	s0,0(a4)
1c009cdc:	c015                	beqz	s0,1c009d00 <__rt_fll_init+0xa2>
1c009cde:	85a2                	mv	a1,s0
1c009ce0:	8526                	mv	a0,s1
1c009ce2:	3dc5                	jal	1c009bd2 <__rt_fll_set_freq>
1c009ce4:	1c001537          	lui	a0,0x1c001
1c009ce8:	1cc50513          	addi	a0,a0,460 # 1c0011cc <__rt_fll_is_on>
1c009cec:	9526                	add	a0,a0,s1
1c009cee:	4785                	li	a5,1
1c009cf0:	00f50023          	sb	a5,0(a0)
1c009cf4:	40b2                	lw	ra,12(sp)
1c009cf6:	8522                	mv	a0,s0
1c009cf8:	4422                	lw	s0,8(sp)
1c009cfa:	4492                	lw	s1,4(sp)
1c009cfc:	0141                	addi	sp,sp,16
1c009cfe:	8082                	ret
1c009d00:	06c2                	slli	a3,a3,0x10
1c009d02:	83e9                	srli	a5,a5,0x1a
1c009d04:	82c1                	srli	a3,a3,0x10
1c009d06:	8bbd                	andi	a5,a5,15
1c009d08:	06be                	slli	a3,a3,0xf
1c009d0a:	17fd                	addi	a5,a5,-1
1c009d0c:	00f6d433          	srl	s0,a3,a5
1c009d10:	c300                	sw	s0,0(a4)
1c009d12:	bfc9                	j	1c009ce4 <__rt_fll_init+0x86>

1c009d14 <__rt_fll_deinit>:
1c009d14:	1c0017b7          	lui	a5,0x1c001
1c009d18:	1cc78793          	addi	a5,a5,460 # 1c0011cc <__rt_fll_is_on>
1c009d1c:	953e                	add	a0,a0,a5
1c009d1e:	00050023          	sb	zero,0(a0)
1c009d22:	8082                	ret

1c009d24 <__rt_flls_constructor>:
1c009d24:	1c0017b7          	lui	a5,0x1c001
1c009d28:	2207a823          	sw	zero,560(a5) # 1c001230 <__rt_fll_freq>
1c009d2c:	23078793          	addi	a5,a5,560
1c009d30:	0007a223          	sw	zero,4(a5)
1c009d34:	1c0017b7          	lui	a5,0x1c001
1c009d38:	1c079623          	sh	zero,460(a5) # 1c0011cc <__rt_fll_is_on>
1c009d3c:	8082                	ret

1c009d3e <gcd>:
1c009d3e:	cd19                	beqz	a0,1c009d5c <gcd+0x1e>
1c009d40:	cd81                	beqz	a1,1c009d58 <gcd+0x1a>
1c009d42:	00054463          	bltz	a0,1c009d4a <gcd+0xc>
1c009d46:	0005d563          	bgez	a1,1c009d50 <gcd+0x12>
1c009d4a:	55fd                	li	a1,-1
1c009d4c:	a031                	j	1c009d58 <gcd+0x1a>
1c009d4e:	85be                	mv	a1,a5
1c009d50:	02b567b3          	rem	a5,a0,a1
1c009d54:	852e                	mv	a0,a1
1c009d56:	ffe5                	bnez	a5,1c009d4e <gcd+0x10>
1c009d58:	852e                	mv	a0,a1
1c009d5a:	8082                	ret
1c009d5c:	4581                	li	a1,0
1c009d5e:	bfed                	j	1c009d58 <gcd+0x1a>

1c009d60 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009d60:	1101                	addi	sp,sp,-32
1c009d62:	1c0017b7          	lui	a5,0x1c001
1c009d66:	c84a                	sw	s2,16(sp)
1c009d68:	1d07a903          	lw	s2,464(a5) # 1c0011d0 <__rt_periph_lcm>
1c009d6c:	c452                	sw	s4,8(sp)
1c009d6e:	8a2e                	mv	s4,a1
1c009d70:	85ca                	mv	a1,s2
1c009d72:	ce06                	sw	ra,28(sp)
1c009d74:	cc22                	sw	s0,24(sp)
1c009d76:	ca26                	sw	s1,20(sp)
1c009d78:	842a                	mv	s0,a0
1c009d7a:	c64e                	sw	s3,12(sp)
1c009d7c:	89aa                	mv	s3,a0
1c009d7e:	37c1                	jal	1c009d3e <gcd>
1c009d80:	02a44533          	div	a0,s0,a0
1c009d84:	03250933          	mul	s2,a0,s2
1c009d88:	4511                	li	a0,4
1c009d8a:	82dff0ef          	jal	ra,1c0095b6 <__rt_cbsys_exec>
1c009d8e:	1c0017b7          	lui	a5,0x1c001
1c009d92:	2307a783          	lw	a5,560(a5) # 1c001230 <__rt_fll_freq>
1c009d96:	028954b3          	divu	s1,s2,s0
1c009d9a:	0527f263          	bleu	s2,a5,1c009dde <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009d9e:	1a1047b7          	lui	a5,0x1a104
1c009da2:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1010c0>
1c009da6:	4705                	li	a4,1
1c009da8:	0ce7ae23          	sw	a4,220(a5)
1c009dac:	85a2                	mv	a1,s0
1c009dae:	4501                	li	a0,0
1c009db0:	350d                	jal	1c009bd2 <__rt_fll_set_freq>
1c009db2:	57fd                	li	a5,-1
1c009db4:	00fa0963          	beq	s4,a5,1c009dc6 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009db8:	c099                	beqz	s1,1c009dbe <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009dba:	029459b3          	divu	s3,s0,s1
1c009dbe:	1c0017b7          	lui	a5,0x1c001
1c009dc2:	2337ac23          	sw	s3,568(a5) # 1c001238 <__rt_freq_domains>
1c009dc6:	4515                	li	a0,5
1c009dc8:	feeff0ef          	jal	ra,1c0095b6 <__rt_cbsys_exec>
1c009dcc:	40f2                	lw	ra,28(sp)
1c009dce:	4462                	lw	s0,24(sp)
1c009dd0:	44d2                	lw	s1,20(sp)
1c009dd2:	4942                	lw	s2,16(sp)
1c009dd4:	49b2                	lw	s3,12(sp)
1c009dd6:	4a22                	lw	s4,8(sp)
1c009dd8:	4501                	li	a0,0
1c009dda:	6105                	addi	sp,sp,32
1c009ddc:	8082                	ret
1c009dde:	85a2                	mv	a1,s0
1c009de0:	4501                	li	a0,0
1c009de2:	3bc5                	jal	1c009bd2 <__rt_fll_set_freq>
1c009de4:	1a1047b7          	lui	a5,0x1a104
1c009de8:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1010c0>
1c009dec:	4705                	li	a4,1
1c009dee:	0ce7ae23          	sw	a4,220(a5)
1c009df2:	b7c1                	j	1c009db2 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009df4 <rt_freq_set_and_get>:
1c009df4:	1141                	addi	sp,sp,-16
1c009df6:	852e                	mv	a0,a1
1c009df8:	c606                	sw	ra,12(sp)
1c009dfa:	c422                	sw	s0,8(sp)
1c009dfc:	30047473          	csrrci	s0,mstatus,8
1c009e00:	4581                	li	a1,0
1c009e02:	3fb9                	jal	1c009d60 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009e04:	30041073          	csrw	mstatus,s0
1c009e08:	40b2                	lw	ra,12(sp)
1c009e0a:	4422                	lw	s0,8(sp)
1c009e0c:	00a03533          	snez	a0,a0
1c009e10:	40a00533          	neg	a0,a0
1c009e14:	0141                	addi	sp,sp,16
1c009e16:	8082                	ret

1c009e18 <__rt_freq_init>:
1c009e18:	1141                	addi	sp,sp,-16
1c009e1a:	c422                	sw	s0,8(sp)
1c009e1c:	c606                	sw	ra,12(sp)
1c009e1e:	3719                	jal	1c009d24 <__rt_flls_constructor>
1c009e20:	1c0017b7          	lui	a5,0x1c001
1c009e24:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c009e28:	4785                	li	a5,1
1c009e2a:	1c001437          	lui	s0,0x1c001
1c009e2e:	02f70663          	beq	a4,a5,1c009e5a <__rt_freq_init+0x42>
1c009e32:	4501                	li	a0,0
1c009e34:	352d                	jal	1c009c5e <__rt_fll_init>
1c009e36:	22a42c23          	sw	a0,568(s0) # 1c001238 <__rt_freq_domains>
1c009e3a:	1a1047b7          	lui	a5,0x1a104
1c009e3e:	4709                	li	a4,2
1c009e40:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1010bc>
1c009e44:	4705                	li	a4,1
1c009e46:	0ce7ac23          	sw	a4,216(a5)
1c009e4a:	40b2                	lw	ra,12(sp)
1c009e4c:	4422                	lw	s0,8(sp)
1c009e4e:	0ce7ae23          	sw	a4,220(a5)
1c009e52:	0ce7aa23          	sw	a4,212(a5)
1c009e56:	0141                	addi	sp,sp,16
1c009e58:	8082                	ret
1c009e5a:	026267b7          	lui	a5,0x2626
1c009e5e:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2618a14>
1c009e62:	22f42c23          	sw	a5,568(s0)
1c009e66:	bfd1                	j	1c009e3a <__rt_freq_init+0x22>

1c009e68 <hal_itc_wait_for_event_noirq>:
1c009e68:	1a10a7b7          	lui	a5,0x1a10a
1c009e6c:	300476f3          	csrrci	a3,mstatus,8
1c009e70:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1067f8>
1c009e74:	8f69                	and	a4,a4,a0
1c009e76:	eb11                	bnez	a4,1c009e8a <hal_itc_wait_for_event_noirq+0x22>
1c009e78:	80a7a223          	sw	a0,-2044(a5)
1c009e7c:	10500073          	wfi
1c009e80:	80a7a423          	sw	a0,-2040(a5)
1c009e84:	30069073          	csrw	mstatus,a3
1c009e88:	b7d5                	j	1c009e6c <hal_itc_wait_for_event_noirq+0x4>
1c009e8a:	80a7aa23          	sw	a0,-2028(a5)
1c009e8e:	30069073          	csrw	mstatus,a3
1c009e92:	8082                	ret

1c009e94 <__rt_pmu_cluster_power_down>:
1c009e94:	1a1047b7          	lui	a5,0x1a104
1c009e98:	5bbc                	lw	a5,112(a5)
1c009e9a:	01079713          	slli	a4,a5,0x10
1c009e9e:	02074c63          	bltz	a4,1c009ed6 <__rt_pmu_cluster_power_down+0x42>
1c009ea2:	1141                	addi	sp,sp,-16
1c009ea4:	c422                	sw	s0,8(sp)
1c009ea6:	c606                	sw	ra,12(sp)
1c009ea8:	c226                	sw	s1,4(sp)
1c009eaa:	1a104437          	lui	s0,0x1a104
1c009eae:	547c                	lw	a5,108(s0)
1c009eb0:	e385                	bnez	a5,1c009ed0 <__rt_pmu_cluster_power_down+0x3c>
1c009eb2:	4485                	li	s1,1
1c009eb4:	c444                	sw	s1,12(s0)
1c009eb6:	478d                	li	a5,3
1c009eb8:	d83c                	sw	a5,112(s0)
1c009eba:	00800537          	lui	a0,0x800
1c009ebe:	376d                	jal	1c009e68 <hal_itc_wait_for_event_noirq>
1c009ec0:	d824                	sw	s1,112(s0)
1c009ec2:	4422                	lw	s0,8(sp)
1c009ec4:	40b2                	lw	ra,12(sp)
1c009ec6:	4492                	lw	s1,4(sp)
1c009ec8:	00400537          	lui	a0,0x400
1c009ecc:	0141                	addi	sp,sp,16
1c009ece:	bf69                	j	1c009e68 <hal_itc_wait_for_event_noirq>
1c009ed0:	4505                	li	a0,1
1c009ed2:	2a11                	jal	1c009fe6 <rt_time_wait_us>
1c009ed4:	bfe9                	j	1c009eae <__rt_pmu_cluster_power_down+0x1a>
1c009ed6:	8082                	ret

1c009ed8 <__rt_pmu_cluster_power_up>:
1c009ed8:	1141                	addi	sp,sp,-16
1c009eda:	c606                	sw	ra,12(sp)
1c009edc:	c422                	sw	s0,8(sp)
1c009ede:	478d                	li	a5,3
1c009ee0:	1a104437          	lui	s0,0x1a104
1c009ee4:	d83c                	sw	a5,112(s0)
1c009ee6:	00400537          	lui	a0,0x400
1c009eea:	3fbd                	jal	1c009e68 <hal_itc_wait_for_event_noirq>
1c009eec:	02700793          	li	a5,39
1c009ef0:	d83c                	sw	a5,112(s0)
1c009ef2:	00800537          	lui	a0,0x800
1c009ef6:	3f8d                	jal	1c009e68 <hal_itc_wait_for_event_noirq>
1c009ef8:	6791                	lui	a5,0x4
1c009efa:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa100ff8>
1c009efe:	02778793          	addi	a5,a5,39 # 4027 <_l1_preload_size+0x1017>
1c009f02:	d83c                	sw	a5,112(s0)
1c009f04:	40b2                	lw	ra,12(sp)
1c009f06:	4422                	lw	s0,8(sp)
1c009f08:	4505                	li	a0,1
1c009f0a:	0141                	addi	sp,sp,16
1c009f0c:	8082                	ret

1c009f0e <__rt_pmu_init>:
1c009f0e:	1a1077b7          	lui	a5,0x1a107
1c009f12:	4741                	li	a4,16
1c009f14:	cb98                	sw	a4,16(a5)
1c009f16:	1a10a7b7          	lui	a5,0x1a10a
1c009f1a:	02000737          	lui	a4,0x2000
1c009f1e:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa106800>
1c009f22:	4709                	li	a4,2
1c009f24:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c009f28:	8082                	ret

1c009f2a <rt_padframe_set>:
1c009f2a:	300476f3          	csrrci	a3,mstatus,8
1c009f2e:	4158                	lw	a4,4(a0)
1c009f30:	1a1047b7          	lui	a5,0x1a104
1c009f34:	4310                	lw	a2,0(a4)
1c009f36:	cb90                	sw	a2,16(a5)
1c009f38:	4350                	lw	a2,4(a4)
1c009f3a:	cbd0                	sw	a2,20(a5)
1c009f3c:	4710                	lw	a2,8(a4)
1c009f3e:	cf90                	sw	a2,24(a5)
1c009f40:	4758                	lw	a4,12(a4)
1c009f42:	cfd8                	sw	a4,28(a5)
1c009f44:	30069073          	csrw	mstatus,a3
1c009f48:	8082                	ret

1c009f4a <__rt_padframe_init>:
1c009f4a:	1c001537          	lui	a0,0x1c001
1c009f4e:	00c50513          	addi	a0,a0,12 # 1c00100c <__rt_padframe_profiles>
1c009f52:	bfe1                	j	1c009f2a <rt_padframe_set>

1c009f54 <__rt_time_poweroff>:
1c009f54:	1a10b7b7          	lui	a5,0x1a10b
1c009f58:	47d8                	lw	a4,12(a5)
1c009f5a:	1c0017b7          	lui	a5,0x1c001
1c009f5e:	4501                	li	a0,0
1c009f60:	1ce7aa23          	sw	a4,468(a5) # 1c0011d4 <timer_count>
1c009f64:	8082                	ret

1c009f66 <__rt_time_poweron>:
1c009f66:	1c0017b7          	lui	a5,0x1c001
1c009f6a:	1d47a703          	lw	a4,468(a5) # 1c0011d4 <timer_count>
1c009f6e:	1a10b7b7          	lui	a5,0x1a10b
1c009f72:	4501                	li	a0,0
1c009f74:	c7d8                	sw	a4,12(a5)
1c009f76:	8082                	ret

1c009f78 <rt_event_push_delayed>:
1c009f78:	30047373          	csrrci	t1,mstatus,8
1c009f7c:	1a10b6b7          	lui	a3,0x1a10b
1c009f80:	46d0                	lw	a2,12(a3)
1c009f82:	1c001737          	lui	a4,0x1c001
1c009f86:	24072783          	lw	a5,576(a4) # 1c001240 <first_delayed>
1c009f8a:	86ba                	mv	a3,a4
1c009f8c:	0005d363          	bgez	a1,1c009f92 <rt_event_push_delayed+0x1a>
1c009f90:	4581                	li	a1,0
1c009f92:	4779                	li	a4,30
1c009f94:	02e5c5b3          	div	a1,a1,a4
1c009f98:	80000737          	lui	a4,0x80000
1c009f9c:	fff74713          	not	a4,a4
1c009fa0:	00e67833          	and	a6,a2,a4
1c009fa4:	0585                	addi	a1,a1,1
1c009fa6:	962e                	add	a2,a2,a1
1c009fa8:	d950                	sw	a2,52(a0)
1c009faa:	982e                	add	a6,a6,a1
1c009fac:	4601                	li	a2,0
1c009fae:	c799                	beqz	a5,1c009fbc <rt_event_push_delayed+0x44>
1c009fb0:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa108020>
1c009fb4:	00e8f8b3          	and	a7,a7,a4
1c009fb8:	0108e863          	bltu	a7,a6,1c009fc8 <rt_event_push_delayed+0x50>
1c009fbc:	ca09                	beqz	a2,1c009fce <rt_event_push_delayed+0x56>
1c009fbe:	ce08                	sw	a0,24(a2)
1c009fc0:	cd1c                	sw	a5,24(a0)
1c009fc2:	30031073          	csrw	mstatus,t1
1c009fc6:	8082                	ret
1c009fc8:	863e                	mv	a2,a5
1c009fca:	4f9c                	lw	a5,24(a5)
1c009fcc:	b7cd                	j	1c009fae <rt_event_push_delayed+0x36>
1c009fce:	cd1c                	sw	a5,24(a0)
1c009fd0:	1a10b7b7          	lui	a5,0x1a10b
1c009fd4:	47d8                	lw	a4,12(a5)
1c009fd6:	24a6a023          	sw	a0,576(a3) # 1a10b240 <__l1_end+0xa10822c>
1c009fda:	95ba                	add	a1,a1,a4
1c009fdc:	cbcc                	sw	a1,20(a5)
1c009fde:	08500713          	li	a4,133
1c009fe2:	c3d8                	sw	a4,4(a5)
1c009fe4:	bff9                	j	1c009fc2 <rt_event_push_delayed+0x4a>

1c009fe6 <rt_time_wait_us>:
1c009fe6:	1101                	addi	sp,sp,-32
1c009fe8:	85aa                	mv	a1,a0
1c009fea:	4501                	li	a0,0
1c009fec:	ce06                	sw	ra,28(sp)
1c009fee:	cc22                	sw	s0,24(sp)
1c009ff0:	c62e                	sw	a1,12(sp)
1c009ff2:	ae7ff0ef          	jal	ra,1c009ad8 <rt_event_get_blocking>
1c009ff6:	45b2                	lw	a1,12(sp)
1c009ff8:	842a                	mv	s0,a0
1c009ffa:	3fbd                	jal	1c009f78 <rt_event_push_delayed>
1c009ffc:	8522                	mv	a0,s0
1c009ffe:	4462                	lw	s0,24(sp)
1c00a000:	40f2                	lw	ra,28(sp)
1c00a002:	6105                	addi	sp,sp,32
1c00a004:	b655                	j	1c009ba8 <rt_event_wait>

1c00a006 <__rt_time_init>:
1c00a006:	1141                	addi	sp,sp,-16
1c00a008:	1c0017b7          	lui	a5,0x1c001
1c00a00c:	2407a023          	sw	zero,576(a5) # 1c001240 <first_delayed>
1c00a010:	08300713          	li	a4,131
1c00a014:	1a10b7b7          	lui	a5,0x1a10b
1c00a018:	c606                	sw	ra,12(sp)
1c00a01a:	c422                	sw	s0,8(sp)
1c00a01c:	1c00a5b7          	lui	a1,0x1c00a
1c00a020:	c3d8                	sw	a4,4(a5)
1c00a022:	09e58593          	addi	a1,a1,158 # 1c00a09e <__rt_timer_handler>
1c00a026:	452d                	li	a0,11
1c00a028:	bbeff0ef          	jal	ra,1c0093e6 <rt_irq_set_handler>
1c00a02c:	f14027f3          	csrr	a5,mhartid
1c00a030:	8795                	srai	a5,a5,0x5
1c00a032:	6705                	lui	a4,0x1
1c00a034:	03f7f793          	andi	a5,a5,63
1c00a038:	46fd                	li	a3,31
1c00a03a:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a03e:	04d79863          	bne	a5,a3,1c00a08e <__rt_time_init+0x88>
1c00a042:	1a10a7b7          	lui	a5,0x1a10a
1c00a046:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1067f0>
1c00a04a:	1c00a5b7          	lui	a1,0x1c00a
1c00a04e:	4601                	li	a2,0
1c00a050:	f5458593          	addi	a1,a1,-172 # 1c009f54 <__rt_time_poweroff>
1c00a054:	4509                	li	a0,2
1c00a056:	d20ff0ef          	jal	ra,1c009576 <__rt_cbsys_add>
1c00a05a:	1c00a5b7          	lui	a1,0x1c00a
1c00a05e:	842a                	mv	s0,a0
1c00a060:	4601                	li	a2,0
1c00a062:	f6658593          	addi	a1,a1,-154 # 1c009f66 <__rt_time_poweron>
1c00a066:	450d                	li	a0,3
1c00a068:	d0eff0ef          	jal	ra,1c009576 <__rt_cbsys_add>
1c00a06c:	8d41                	or	a0,a0,s0
1c00a06e:	c505                	beqz	a0,1c00a096 <__rt_time_init+0x90>
1c00a070:	f1402673          	csrr	a2,mhartid
1c00a074:	1c000537          	lui	a0,0x1c000
1c00a078:	40565593          	srai	a1,a2,0x5
1c00a07c:	03f5f593          	andi	a1,a1,63
1c00a080:	8a7d                	andi	a2,a2,31
1c00a082:	55050513          	addi	a0,a0,1360 # 1c000550 <__DTOR_END__+0x264>
1c00a086:	015000ef          	jal	ra,1c00a89a <printf>
1c00a08a:	79c000ef          	jal	ra,1c00a826 <abort>
1c00a08e:	002047b7          	lui	a5,0x204
1c00a092:	cbd8                	sw	a4,20(a5)
1c00a094:	bf5d                	j	1c00a04a <__rt_time_init+0x44>
1c00a096:	40b2                	lw	ra,12(sp)
1c00a098:	4422                	lw	s0,8(sp)
1c00a09a:	0141                	addi	sp,sp,16
1c00a09c:	8082                	ret

1c00a09e <__rt_timer_handler>:
1c00a09e:	7179                	addi	sp,sp,-48
1c00a0a0:	ce36                	sw	a3,28(sp)
1c00a0a2:	cc3a                	sw	a4,24(sp)
1c00a0a4:	1a10b6b7          	lui	a3,0x1a10b
1c00a0a8:	1c001737          	lui	a4,0x1c001
1c00a0ac:	d61a                	sw	t1,44(sp)
1c00a0ae:	d032                	sw	a2,32(sp)
1c00a0b0:	ca3e                	sw	a5,20(sp)
1c00a0b2:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa107ff8>
1c00a0b6:	24072783          	lw	a5,576(a4) # 1c001240 <first_delayed>
1c00a0ba:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a0be:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a0c2:	c842                	sw	a6,16(sp)
1c00a0c4:	80000837          	lui	a6,0x80000
1c00a0c8:	d42a                	sw	a0,40(sp)
1c00a0ca:	d22e                	sw	a1,36(sp)
1c00a0cc:	c646                	sw	a7,12(sp)
1c00a0ce:	c472                	sw	t3,8(sp)
1c00a0d0:	4581                	li	a1,0
1c00a0d2:	4501                	li	a0,0
1c00a0d4:	ffe84813          	xori	a6,a6,-2
1c00a0d8:	efb9                	bnez	a5,1c00a136 <__rt_timer_handler+0x98>
1c00a0da:	c119                	beqz	a0,1c00a0e0 <__rt_timer_handler+0x42>
1c00a0dc:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a0e0:	c199                	beqz	a1,1c00a0e6 <__rt_timer_handler+0x48>
1c00a0e2:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a0e6:	24072023          	sw	zero,576(a4)
1c00a0ea:	1a10b7b7          	lui	a5,0x1a10b
1c00a0ee:	08100713          	li	a4,129
1c00a0f2:	c3d8                	sw	a4,4(a5)
1c00a0f4:	6785                	lui	a5,0x1
1c00a0f6:	1a10a737          	lui	a4,0x1a10a
1c00a0fa:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a0fe:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa106800>
1c00a102:	5332                	lw	t1,44(sp)
1c00a104:	5522                	lw	a0,40(sp)
1c00a106:	5592                	lw	a1,36(sp)
1c00a108:	5602                	lw	a2,32(sp)
1c00a10a:	46f2                	lw	a3,28(sp)
1c00a10c:	4762                	lw	a4,24(sp)
1c00a10e:	47d2                	lw	a5,20(sp)
1c00a110:	4842                	lw	a6,16(sp)
1c00a112:	48b2                	lw	a7,12(sp)
1c00a114:	4e22                	lw	t3,8(sp)
1c00a116:	6145                	addi	sp,sp,48
1c00a118:	30200073          	mret
1c00a11c:	0187a883          	lw	a7,24(a5)
1c00a120:	0007ac23          	sw	zero,24(a5)
1c00a124:	c611                	beqz	a2,1c00a130 <__rt_timer_handler+0x92>
1c00a126:	ce9c                	sw	a5,24(a3)
1c00a128:	86be                	mv	a3,a5
1c00a12a:	4585                	li	a1,1
1c00a12c:	87c6                	mv	a5,a7
1c00a12e:	b76d                	j	1c00a0d8 <__rt_timer_handler+0x3a>
1c00a130:	863e                	mv	a2,a5
1c00a132:	4505                	li	a0,1
1c00a134:	bfd5                	j	1c00a128 <__rt_timer_handler+0x8a>
1c00a136:	0347a883          	lw	a7,52(a5)
1c00a13a:	41130e33          	sub	t3,t1,a7
1c00a13e:	fdc87fe3          	bleu	t3,a6,1c00a11c <__rt_timer_handler+0x7e>
1c00a142:	c119                	beqz	a0,1c00a148 <__rt_timer_handler+0xaa>
1c00a144:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a148:	c199                	beqz	a1,1c00a14e <__rt_timer_handler+0xb0>
1c00a14a:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a14e:	24f72023          	sw	a5,576(a4)
1c00a152:	1a10b737          	lui	a4,0x1a10b
1c00a156:	475c                	lw	a5,12(a4)
1c00a158:	406787b3          	sub	a5,a5,t1
1c00a15c:	97c6                	add	a5,a5,a7
1c00a15e:	cb5c                	sw	a5,20(a4)
1c00a160:	08500793          	li	a5,133
1c00a164:	c35c                	sw	a5,4(a4)
1c00a166:	bf71                	j	1c00a102 <__rt_timer_handler+0x64>

1c00a168 <rt_periph_copy>:
1c00a168:	7179                	addi	sp,sp,-48
1c00a16a:	d422                	sw	s0,40(sp)
1c00a16c:	842a                	mv	s0,a0
1c00a16e:	d606                	sw	ra,44(sp)
1c00a170:	d226                	sw	s1,36(sp)
1c00a172:	d04a                	sw	s2,32(sp)
1c00a174:	30047973          	csrrci	s2,mstatus,8
1c00a178:	4015d493          	srai	s1,a1,0x1
1c00a17c:	1a102537          	lui	a0,0x1a102
1c00a180:	049e                	slli	s1,s1,0x7
1c00a182:	94aa                	add	s1,s1,a0
1c00a184:	00459513          	slli	a0,a1,0x4
1c00a188:	8941                	andi	a0,a0,16
1c00a18a:	94aa                	add	s1,s1,a0
1c00a18c:	853e                	mv	a0,a5
1c00a18e:	ef89                	bnez	a5,1c00a1a8 <rt_periph_copy+0x40>
1c00a190:	ce2e                	sw	a1,28(sp)
1c00a192:	cc32                	sw	a2,24(sp)
1c00a194:	ca36                	sw	a3,20(sp)
1c00a196:	c83a                	sw	a4,16(sp)
1c00a198:	c63e                	sw	a5,12(sp)
1c00a19a:	895ff0ef          	jal	ra,1c009a2e <__rt_wait_event_prepare_blocking>
1c00a19e:	47b2                	lw	a5,12(sp)
1c00a1a0:	4742                	lw	a4,16(sp)
1c00a1a2:	46d2                	lw	a3,20(sp)
1c00a1a4:	4662                	lw	a2,24(sp)
1c00a1a6:	45f2                	lw	a1,28(sp)
1c00a1a8:	e419                	bnez	s0,1c00a1b6 <rt_periph_copy+0x4e>
1c00a1aa:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa0ff020>
1c00a1ae:	04052023          	sw	zero,64(a0)
1c00a1b2:	04052823          	sw	zero,80(a0)
1c00a1b6:	00c42803          	lw	a6,12(s0)
1c00a1ba:	c054                	sw	a3,4(s0)
1c00a1bc:	cc08                	sw	a0,24(s0)
1c00a1be:	00f87813          	andi	a6,a6,15
1c00a1c2:	4891                	li	a7,4
1c00a1c4:	01076713          	ori	a4,a4,16
1c00a1c8:	0708ec63          	bltu	a7,a6,1c00a240 <rt_periph_copy+0xd8>
1c00a1cc:	04000893          	li	a7,64
1c00a1d0:	0596                	slli	a1,a1,0x5
1c00a1d2:	98ae                	add	a7,a7,a1
1c00a1d4:	0008a303          	lw	t1,0(a7)
1c00a1d8:	00042a23          	sw	zero,20(s0)
1c00a1dc:	04000813          	li	a6,64
1c00a1e0:	02031663          	bnez	t1,1c00a20c <rt_periph_copy+0xa4>
1c00a1e4:	0088a023          	sw	s0,0(a7)
1c00a1e8:	00b808b3          	add	a7,a6,a1
1c00a1ec:	0088a303          	lw	t1,8(a7)
1c00a1f0:	0088a223          	sw	s0,4(a7)
1c00a1f4:	02031163          	bnez	t1,1c00a216 <rt_periph_copy+0xae>
1c00a1f8:	0084a883          	lw	a7,8(s1)
1c00a1fc:	0208f893          	andi	a7,a7,32
1c00a200:	00089b63          	bnez	a7,1c00a216 <rt_periph_copy+0xae>
1c00a204:	c090                	sw	a2,0(s1)
1c00a206:	c0d4                	sw	a3,4(s1)
1c00a208:	c498                	sw	a4,8(s1)
1c00a20a:	a005                	j	1c00a22a <rt_periph_copy+0xc2>
1c00a20c:	0048a883          	lw	a7,4(a7)
1c00a210:	0088aa23          	sw	s0,20(a7)
1c00a214:	bfd1                	j	1c00a1e8 <rt_periph_copy+0x80>
1c00a216:	00042823          	sw	zero,16(s0)
1c00a21a:	c010                	sw	a2,0(s0)
1c00a21c:	c054                	sw	a3,4(s0)
1c00a21e:	c418                	sw	a4,8(s0)
1c00a220:	00031563          	bnez	t1,1c00a22a <rt_periph_copy+0xc2>
1c00a224:	982e                	add	a6,a6,a1
1c00a226:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a22a:	e399                	bnez	a5,1c00a230 <rt_periph_copy+0xc8>
1c00a22c:	953ff0ef          	jal	ra,1c009b7e <__rt_wait_event>
1c00a230:	30091073          	csrw	mstatus,s2
1c00a234:	50b2                	lw	ra,44(sp)
1c00a236:	5422                	lw	s0,40(sp)
1c00a238:	5492                	lw	s1,36(sp)
1c00a23a:	5902                	lw	s2,32(sp)
1c00a23c:	6145                	addi	sp,sp,48
1c00a23e:	8082                	ret
1c00a240:	4899                	li	a7,6
1c00a242:	ff1814e3          	bne	a6,a7,1c00a22a <rt_periph_copy+0xc2>
1c00a246:	04000893          	li	a7,64
1c00a24a:	0596                	slli	a1,a1,0x5
1c00a24c:	98ae                	add	a7,a7,a1
1c00a24e:	0008a303          	lw	t1,0(a7)
1c00a252:	00042a23          	sw	zero,20(s0)
1c00a256:	04000813          	li	a6,64
1c00a25a:	00031f63          	bnez	t1,1c00a278 <rt_periph_copy+0x110>
1c00a25e:	0088a023          	sw	s0,0(a7)
1c00a262:	95c2                	add	a1,a1,a6
1c00a264:	c1c0                	sw	s0,4(a1)
1c00a266:	00031e63          	bnez	t1,1c00a282 <rt_periph_copy+0x11a>
1c00a26a:	02442803          	lw	a6,36(s0)
1c00a26e:	1a1025b7          	lui	a1,0x1a102
1c00a272:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa0ff10c>
1c00a276:	b779                	j	1c00a204 <rt_periph_copy+0x9c>
1c00a278:	0048a883          	lw	a7,4(a7)
1c00a27c:	0088aa23          	sw	s0,20(a7)
1c00a280:	b7cd                	j	1c00a262 <rt_periph_copy+0xfa>
1c00a282:	c418                	sw	a4,8(s0)
1c00a284:	4598                	lw	a4,8(a1)
1c00a286:	c010                	sw	a2,0(s0)
1c00a288:	c054                	sw	a3,4(s0)
1c00a28a:	00042823          	sw	zero,16(s0)
1c00a28e:	ff51                	bnez	a4,1c00a22a <rt_periph_copy+0xc2>
1c00a290:	c580                	sw	s0,8(a1)
1c00a292:	bf61                	j	1c00a22a <rt_periph_copy+0xc2>

1c00a294 <__rt_periph_init>:
1c00a294:	1c0085b7          	lui	a1,0x1c008
1c00a298:	04000693          	li	a3,64
1c00a29c:	4601                	li	a2,0
1c00a29e:	04000793          	li	a5,64
1c00a2a2:	1a1028b7          	lui	a7,0x1a102
1c00a2a6:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a2aa:	4841                	li	a6,16
1c00a2ac:	40165713          	srai	a4,a2,0x1
1c00a2b0:	00461513          	slli	a0,a2,0x4
1c00a2b4:	071e                	slli	a4,a4,0x7
1c00a2b6:	9746                	add	a4,a4,a7
1c00a2b8:	8941                	andi	a0,a0,16
1c00a2ba:	972a                	add	a4,a4,a0
1c00a2bc:	0006a023          	sw	zero,0(a3)
1c00a2c0:	0006a423          	sw	zero,8(a3)
1c00a2c4:	c6d8                	sw	a4,12(a3)
1c00a2c6:	cecc                	sw	a1,28(a3)
1c00a2c8:	0605                	addi	a2,a2,1
1c00a2ca:	02068693          	addi	a3,a3,32
1c00a2ce:	fd061fe3          	bne	a2,a6,1c00a2ac <__rt_periph_init+0x18>
1c00a2d2:	1c008737          	lui	a4,0x1c008
1c00a2d6:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a2da:	2007a023          	sw	zero,512(a5)
1c00a2de:	20e7a423          	sw	a4,520(a5)
1c00a2e2:	20e7a623          	sw	a4,524(a5)
1c00a2e6:	20e7a823          	sw	a4,528(a5)
1c00a2ea:	20e7aa23          	sw	a4,532(a5)
1c00a2ee:	20e7ac23          	sw	a4,536(a5)
1c00a2f2:	20e7ae23          	sw	a4,540(a5)
1c00a2f6:	22e7a023          	sw	a4,544(a5)
1c00a2fa:	22e7a223          	sw	a4,548(a5)
1c00a2fe:	2007a223          	sw	zero,516(a5)
1c00a302:	8082                	ret

1c00a304 <__rt_i2c_init>:
1c00a304:	1c0107b7          	lui	a5,0x1c010
1c00a308:	16878793          	addi	a5,a5,360 # 1c010168 <__cluster_text_end>
1c00a30c:	00078223          	sb	zero,4(a5)
1c00a310:	00078a23          	sb	zero,20(a5)
1c00a314:	8082                	ret

1c00a316 <__rt_hyper_init>:
1c00a316:	1c001737          	lui	a4,0x1c001
1c00a31a:	26800793          	li	a5,616
1c00a31e:	1c072c23          	sw	zero,472(a4) # 1c0011d8 <__pi_hyper_cluster_reqs_first>
1c00a322:	577d                	li	a4,-1
1c00a324:	0007aa23          	sw	zero,20(a5)
1c00a328:	0207a823          	sw	zero,48(a5)
1c00a32c:	cf98                	sw	a4,24(a5)
1c00a32e:	8082                	ret

1c00a330 <__rt_spim_init>:
1c00a330:	1c0017b7          	lui	a5,0x1c001
1c00a334:	1c07ae23          	sw	zero,476(a5) # 1c0011dc <__rt_spim_open_count>
1c00a338:	8082                	ret

1c00a33a <rt_is_fc>:
1c00a33a:	f1402573          	csrr	a0,mhartid
1c00a33e:	8515                	srai	a0,a0,0x5
1c00a340:	03f57513          	andi	a0,a0,63
1c00a344:	1505                	addi	a0,a0,-31
1c00a346:	00153513          	seqz	a0,a0
1c00a34a:	8082                	ret

1c00a34c <__rt_io_end_of_flush>:
1c00a34c:	1c0017b7          	lui	a5,0x1c001
1c00a350:	1e07a223          	sw	zero,484(a5) # 1c0011e4 <__rt_io_pending_flush>
1c00a354:	00052c23          	sw	zero,24(a0)
1c00a358:	8082                	ret

1c00a35a <__rt_io_uart_wait_req>:
1c00a35a:	1141                	addi	sp,sp,-16
1c00a35c:	c226                	sw	s1,4(sp)
1c00a35e:	84aa                	mv	s1,a0
1c00a360:	c606                	sw	ra,12(sp)
1c00a362:	c422                	sw	s0,8(sp)
1c00a364:	c04a                	sw	s2,0(sp)
1c00a366:	30047973          	csrrci	s2,mstatus,8
1c00a36a:	1c001437          	lui	s0,0x1c001
1c00a36e:	1e040413          	addi	s0,s0,480 # 1c0011e0 <__rt_io_event_current>
1c00a372:	4008                	lw	a0,0(s0)
1c00a374:	c509                	beqz	a0,1c00a37e <__rt_io_uart_wait_req+0x24>
1c00a376:	833ff0ef          	jal	ra,1c009ba8 <rt_event_wait>
1c00a37a:	00042023          	sw	zero,0(s0)
1c00a37e:	4785                	li	a5,1
1c00a380:	08f48623          	sb	a5,140(s1)
1c00a384:	08d4c783          	lbu	a5,141(s1)
1c00a388:	00201737          	lui	a4,0x201
1c00a38c:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3e18>
1c00a390:	04078793          	addi	a5,a5,64
1c00a394:	07da                	slli	a5,a5,0x16
1c00a396:	97ba                	add	a5,a5,a4
1c00a398:	0007a023          	sw	zero,0(a5)
1c00a39c:	30091073          	csrw	mstatus,s2
1c00a3a0:	40b2                	lw	ra,12(sp)
1c00a3a2:	4422                	lw	s0,8(sp)
1c00a3a4:	4492                	lw	s1,4(sp)
1c00a3a6:	4902                	lw	s2,0(sp)
1c00a3a8:	0141                	addi	sp,sp,16
1c00a3aa:	8082                	ret

1c00a3ac <__rt_io_start>:
1c00a3ac:	1101                	addi	sp,sp,-32
1c00a3ae:	0028                	addi	a0,sp,8
1c00a3b0:	ce06                	sw	ra,28(sp)
1c00a3b2:	cc22                	sw	s0,24(sp)
1c00a3b4:	7e1000ef          	jal	ra,1c00b394 <rt_uart_conf_init>
1c00a3b8:	4585                	li	a1,1
1c00a3ba:	4501                	li	a0,0
1c00a3bc:	e8aff0ef          	jal	ra,1c009a46 <rt_event_alloc>
1c00a3c0:	547d                	li	s0,-1
1c00a3c2:	ed1d                	bnez	a0,1c00a400 <__rt_io_start+0x54>
1c00a3c4:	1c0017b7          	lui	a5,0x1c001
1c00a3c8:	0e07a783          	lw	a5,224(a5) # 1c0010e0 <__rt_iodev_uart_baudrate>
1c00a3cc:	842a                	mv	s0,a0
1c00a3ce:	1c001537          	lui	a0,0x1c001
1c00a3d2:	e3ff6597          	auipc	a1,0xe3ff6
1c00a3d6:	c5658593          	addi	a1,a1,-938 # 28 <__rt_sched>
1c00a3da:	12c50513          	addi	a0,a0,300 # 1c00112c <__rt_io_event>
1c00a3de:	c43e                	sw	a5,8(sp)
1c00a3e0:	e3cff0ef          	jal	ra,1c009a1c <__rt_event_init>
1c00a3e4:	1c0017b7          	lui	a5,0x1c001
1c00a3e8:	1f07a503          	lw	a0,496(a5) # 1c0011f0 <__rt_iodev_uart_channel>
1c00a3ec:	4681                	li	a3,0
1c00a3ee:	4601                	li	a2,0
1c00a3f0:	002c                	addi	a1,sp,8
1c00a3f2:	050d                	addi	a0,a0,3
1c00a3f4:	7b1000ef          	jal	ra,1c00b3a4 <__rt_uart_open>
1c00a3f8:	1c0017b7          	lui	a5,0x1c001
1c00a3fc:	1ea7a423          	sw	a0,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a400:	8522                	mv	a0,s0
1c00a402:	40f2                	lw	ra,28(sp)
1c00a404:	4462                	lw	s0,24(sp)
1c00a406:	6105                	addi	sp,sp,32
1c00a408:	8082                	ret

1c00a40a <rt_event_execute.isra.2.constprop.11>:
1c00a40a:	1141                	addi	sp,sp,-16
1c00a40c:	c606                	sw	ra,12(sp)
1c00a40e:	c422                	sw	s0,8(sp)
1c00a410:	30047473          	csrrci	s0,mstatus,8
1c00a414:	4585                	li	a1,1
1c00a416:	e3ff6517          	auipc	a0,0xe3ff6
1c00a41a:	c1250513          	addi	a0,a0,-1006 # 28 <__rt_sched>
1c00a41e:	f00ff0ef          	jal	ra,1c009b1e <__rt_event_execute>
1c00a422:	30041073          	csrw	mstatus,s0
1c00a426:	40b2                	lw	ra,12(sp)
1c00a428:	4422                	lw	s0,8(sp)
1c00a42a:	0141                	addi	sp,sp,16
1c00a42c:	8082                	ret

1c00a42e <__rt_io_lock>:
1c00a42e:	1c0017b7          	lui	a5,0x1c001
1c00a432:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a436:	c791                	beqz	a5,1c00a442 <__rt_io_lock+0x14>
1c00a438:	1c0017b7          	lui	a5,0x1c001
1c00a43c:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a440:	c3a1                	beqz	a5,1c00a480 <__rt_io_lock+0x52>
1c00a442:	7171                	addi	sp,sp,-176
1c00a444:	d706                	sw	ra,172(sp)
1c00a446:	3dd5                	jal	1c00a33a <rt_is_fc>
1c00a448:	1c0017b7          	lui	a5,0x1c001
1c00a44c:	c901                	beqz	a0,1c00a45c <__rt_io_lock+0x2e>
1c00a44e:	ffc78513          	addi	a0,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a452:	9b8ff0ef          	jal	ra,1c00960a <__rt_fc_lock>
1c00a456:	50ba                	lw	ra,172(sp)
1c00a458:	614d                	addi	sp,sp,176
1c00a45a:	8082                	ret
1c00a45c:	002c                	addi	a1,sp,8
1c00a45e:	ffc78513          	addi	a0,a5,-4
1c00a462:	a1aff0ef          	jal	ra,1c00967c <__rt_fc_cluster_lock>
1c00a466:	4689                	li	a3,2
1c00a468:	00204737          	lui	a4,0x204
1c00a46c:	09c14783          	lbu	a5,156(sp)
1c00a470:	0ff7f793          	andi	a5,a5,255
1c00a474:	f3ed                	bnez	a5,1c00a456 <__rt_io_lock+0x28>
1c00a476:	c714                	sw	a3,8(a4)
1c00a478:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7050>
1c00a47c:	c354                	sw	a3,4(a4)
1c00a47e:	b7fd                	j	1c00a46c <__rt_io_lock+0x3e>
1c00a480:	8082                	ret

1c00a482 <__rt_io_unlock>:
1c00a482:	1c0017b7          	lui	a5,0x1c001
1c00a486:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a48a:	c791                	beqz	a5,1c00a496 <__rt_io_unlock+0x14>
1c00a48c:	1c0017b7          	lui	a5,0x1c001
1c00a490:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a494:	c3a1                	beqz	a5,1c00a4d4 <__rt_io_unlock+0x52>
1c00a496:	7171                	addi	sp,sp,-176
1c00a498:	d706                	sw	ra,172(sp)
1c00a49a:	3545                	jal	1c00a33a <rt_is_fc>
1c00a49c:	1c0017b7          	lui	a5,0x1c001
1c00a4a0:	c901                	beqz	a0,1c00a4b0 <__rt_io_unlock+0x2e>
1c00a4a2:	ffc78513          	addi	a0,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a4a6:	9a0ff0ef          	jal	ra,1c009646 <__rt_fc_unlock>
1c00a4aa:	50ba                	lw	ra,172(sp)
1c00a4ac:	614d                	addi	sp,sp,176
1c00a4ae:	8082                	ret
1c00a4b0:	002c                	addi	a1,sp,8
1c00a4b2:	ffc78513          	addi	a0,a5,-4
1c00a4b6:	9feff0ef          	jal	ra,1c0096b4 <__rt_fc_cluster_unlock>
1c00a4ba:	4689                	li	a3,2
1c00a4bc:	00204737          	lui	a4,0x204
1c00a4c0:	09c14783          	lbu	a5,156(sp)
1c00a4c4:	0ff7f793          	andi	a5,a5,255
1c00a4c8:	f3ed                	bnez	a5,1c00a4aa <__rt_io_unlock+0x28>
1c00a4ca:	c714                	sw	a3,8(a4)
1c00a4cc:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7050>
1c00a4d0:	c354                	sw	a3,4(a4)
1c00a4d2:	b7fd                	j	1c00a4c0 <__rt_io_unlock+0x3e>
1c00a4d4:	8082                	ret

1c00a4d6 <__rt_io_uart_wait_pending>:
1c00a4d6:	7135                	addi	sp,sp,-160
1c00a4d8:	cd22                	sw	s0,152(sp)
1c00a4da:	cf06                	sw	ra,156(sp)
1c00a4dc:	cb26                	sw	s1,148(sp)
1c00a4de:	1c001437          	lui	s0,0x1c001
1c00a4e2:	1e442783          	lw	a5,484(s0) # 1c0011e4 <__rt_io_pending_flush>
1c00a4e6:	e39d                	bnez	a5,1c00a50c <__rt_io_uart_wait_pending+0x36>
1c00a4e8:	1c001437          	lui	s0,0x1c001
1c00a4ec:	1e040413          	addi	s0,s0,480 # 1c0011e0 <__rt_io_event_current>
1c00a4f0:	4004                	lw	s1,0(s0)
1c00a4f2:	c881                	beqz	s1,1c00a502 <__rt_io_uart_wait_pending+0x2c>
1c00a4f4:	3599                	jal	1c00a33a <rt_is_fc>
1c00a4f6:	cd19                	beqz	a0,1c00a514 <__rt_io_uart_wait_pending+0x3e>
1c00a4f8:	8526                	mv	a0,s1
1c00a4fa:	eaeff0ef          	jal	ra,1c009ba8 <rt_event_wait>
1c00a4fe:	00042023          	sw	zero,0(s0)
1c00a502:	40fa                	lw	ra,156(sp)
1c00a504:	446a                	lw	s0,152(sp)
1c00a506:	44da                	lw	s1,148(sp)
1c00a508:	610d                	addi	sp,sp,160
1c00a50a:	8082                	ret
1c00a50c:	3f9d                	jal	1c00a482 <__rt_io_unlock>
1c00a50e:	3df5                	jal	1c00a40a <rt_event_execute.isra.2.constprop.11>
1c00a510:	3f39                	jal	1c00a42e <__rt_io_lock>
1c00a512:	bfc1                	j	1c00a4e2 <__rt_io_uart_wait_pending+0xc>
1c00a514:	f14027f3          	csrr	a5,mhartid
1c00a518:	8795                	srai	a5,a5,0x5
1c00a51a:	03f7f793          	andi	a5,a5,63
1c00a51e:	08f106a3          	sb	a5,141(sp)
1c00a522:	1c00a7b7          	lui	a5,0x1c00a
1c00a526:	35a78793          	addi	a5,a5,858 # 1c00a35a <__rt_io_uart_wait_req>
1c00a52a:	c03e                	sw	a5,0(sp)
1c00a52c:	00010793          	mv	a5,sp
1c00a530:	4705                	li	a4,1
1c00a532:	c23e                	sw	a5,4(sp)
1c00a534:	850a                	mv	a0,sp
1c00a536:	1c0017b7          	lui	a5,0x1c001
1c00a53a:	14e7a623          	sw	a4,332(a5) # 1c00114c <__rt_io_event+0x20>
1c00a53e:	08010623          	sb	zero,140(sp)
1c00a542:	d002                	sw	zero,32(sp)
1c00a544:	d202                	sw	zero,36(sp)
1c00a546:	a15fe0ef          	jal	ra,1c008f5a <__rt_cluster_push_fc_event>
1c00a54a:	4689                	li	a3,2
1c00a54c:	00204737          	lui	a4,0x204
1c00a550:	08c14783          	lbu	a5,140(sp)
1c00a554:	0ff7f793          	andi	a5,a5,255
1c00a558:	f7cd                	bnez	a5,1c00a502 <__rt_io_uart_wait_pending+0x2c>
1c00a55a:	c714                	sw	a3,8(a4)
1c00a55c:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7050>
1c00a560:	c354                	sw	a3,4(a4)
1c00a562:	b7fd                	j	1c00a550 <__rt_io_uart_wait_pending+0x7a>

1c00a564 <__rt_io_stop>:
1c00a564:	1141                	addi	sp,sp,-16
1c00a566:	c422                	sw	s0,8(sp)
1c00a568:	1c001437          	lui	s0,0x1c001
1c00a56c:	c606                	sw	ra,12(sp)
1c00a56e:	1e840413          	addi	s0,s0,488 # 1c0011e8 <_rt_io_uart>
1c00a572:	3795                	jal	1c00a4d6 <__rt_io_uart_wait_pending>
1c00a574:	4008                	lw	a0,0(s0)
1c00a576:	4581                	li	a1,0
1c00a578:	6b5000ef          	jal	ra,1c00b42c <rt_uart_close>
1c00a57c:	40b2                	lw	ra,12(sp)
1c00a57e:	00042023          	sw	zero,0(s0)
1c00a582:	4422                	lw	s0,8(sp)
1c00a584:	4501                	li	a0,0
1c00a586:	0141                	addi	sp,sp,16
1c00a588:	8082                	ret

1c00a58a <__rt_io_uart_flush.constprop.10>:
1c00a58a:	7131                	addi	sp,sp,-192
1c00a58c:	dd22                	sw	s0,184(sp)
1c00a58e:	df06                	sw	ra,188(sp)
1c00a590:	db26                	sw	s1,180(sp)
1c00a592:	d94a                	sw	s2,176(sp)
1c00a594:	d74e                	sw	s3,172(sp)
1c00a596:	d552                	sw	s4,168(sp)
1c00a598:	d356                	sw	s5,164(sp)
1c00a59a:	1c001437          	lui	s0,0x1c001
1c00a59e:	1e442783          	lw	a5,484(s0) # 1c0011e4 <__rt_io_pending_flush>
1c00a5a2:	1e440a13          	addi	s4,s0,484
1c00a5a6:	e7bd                	bnez	a5,1c00a614 <__rt_io_uart_flush.constprop.10+0x8a>
1c00a5a8:	1c0014b7          	lui	s1,0x1c001
1c00a5ac:	01c48793          	addi	a5,s1,28 # 1c00101c <__hal_debug_struct>
1c00a5b0:	4f80                	lw	s0,24(a5)
1c00a5b2:	01c48a93          	addi	s5,s1,28
1c00a5b6:	c431                	beqz	s0,1c00a602 <__rt_io_uart_flush.constprop.10+0x78>
1c00a5b8:	3349                	jal	1c00a33a <rt_is_fc>
1c00a5ba:	1c0017b7          	lui	a5,0x1c001
1c00a5be:	1e87a903          	lw	s2,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a5c2:	1c0019b7          	lui	s3,0x1c001
1c00a5c6:	cd29                	beqz	a0,1c00a620 <__rt_io_uart_flush.constprop.10+0x96>
1c00a5c8:	1c00a5b7          	lui	a1,0x1c00a
1c00a5cc:	4785                	li	a5,1
1c00a5ce:	01c48613          	addi	a2,s1,28
1c00a5d2:	34c58593          	addi	a1,a1,844 # 1c00a34c <__rt_io_end_of_flush>
1c00a5d6:	4501                	li	a0,0
1c00a5d8:	00fa2023          	sw	a5,0(s4)
1c00a5dc:	ce2ff0ef          	jal	ra,1c009abe <rt_event_get>
1c00a5e0:	00492583          	lw	a1,4(s2)
1c00a5e4:	87aa                	mv	a5,a0
1c00a5e6:	4701                	li	a4,0
1c00a5e8:	0586                	slli	a1,a1,0x1
1c00a5ea:	86a2                	mv	a3,s0
1c00a5ec:	03898613          	addi	a2,s3,56 # 1c001038 <__hal_debug_struct+0x1c>
1c00a5f0:	0585                	addi	a1,a1,1
1c00a5f2:	4501                	li	a0,0
1c00a5f4:	b75ff0ef          	jal	ra,1c00a168 <rt_periph_copy>
1c00a5f8:	3569                	jal	1c00a482 <__rt_io_unlock>
1c00a5fa:	000a2783          	lw	a5,0(s4)
1c00a5fe:	ef99                	bnez	a5,1c00a61c <__rt_io_uart_flush.constprop.10+0x92>
1c00a600:	353d                	jal	1c00a42e <__rt_io_lock>
1c00a602:	50fa                	lw	ra,188(sp)
1c00a604:	546a                	lw	s0,184(sp)
1c00a606:	54da                	lw	s1,180(sp)
1c00a608:	594a                	lw	s2,176(sp)
1c00a60a:	59ba                	lw	s3,172(sp)
1c00a60c:	5a2a                	lw	s4,168(sp)
1c00a60e:	5a9a                	lw	s5,164(sp)
1c00a610:	6129                	addi	sp,sp,192
1c00a612:	8082                	ret
1c00a614:	35bd                	jal	1c00a482 <__rt_io_unlock>
1c00a616:	3bd5                	jal	1c00a40a <rt_event_execute.isra.2.constprop.11>
1c00a618:	3d19                	jal	1c00a42e <__rt_io_lock>
1c00a61a:	b751                	j	1c00a59e <__rt_io_uart_flush.constprop.10+0x14>
1c00a61c:	33fd                	jal	1c00a40a <rt_event_execute.isra.2.constprop.11>
1c00a61e:	bff1                	j	1c00a5fa <__rt_io_uart_flush.constprop.10+0x70>
1c00a620:	0054                	addi	a3,sp,4
1c00a622:	8622                	mv	a2,s0
1c00a624:	03898593          	addi	a1,s3,56
1c00a628:	854a                	mv	a0,s2
1c00a62a:	64d000ef          	jal	ra,1c00b476 <rt_uart_cluster_write>
1c00a62e:	4689                	li	a3,2
1c00a630:	00204737          	lui	a4,0x204
1c00a634:	09c14783          	lbu	a5,156(sp)
1c00a638:	0ff7f793          	andi	a5,a5,255
1c00a63c:	c781                	beqz	a5,1c00a644 <__rt_io_uart_flush.constprop.10+0xba>
1c00a63e:	000aac23          	sw	zero,24(s5)
1c00a642:	b7c1                	j	1c00a602 <__rt_io_uart_flush.constprop.10+0x78>
1c00a644:	c714                	sw	a3,8(a4)
1c00a646:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7050>
1c00a64a:	c354                	sw	a3,4(a4)
1c00a64c:	b7e5                	j	1c00a634 <__rt_io_uart_flush.constprop.10+0xaa>

1c00a64e <memset>:
1c00a64e:	962a                	add	a2,a2,a0
1c00a650:	87aa                	mv	a5,a0
1c00a652:	00c79363          	bne	a5,a2,1c00a658 <memset+0xa>
1c00a656:	8082                	ret
1c00a658:	0785                	addi	a5,a5,1
1c00a65a:	feb78fa3          	sb	a1,-1(a5)
1c00a65e:	bfd5                	j	1c00a652 <memset+0x4>

1c00a660 <memcpy>:
1c00a660:	962a                	add	a2,a2,a0
1c00a662:	87aa                	mv	a5,a0
1c00a664:	00c79363          	bne	a5,a2,1c00a66a <memcpy+0xa>
1c00a668:	8082                	ret
1c00a66a:	0585                	addi	a1,a1,1
1c00a66c:	fff5c703          	lbu	a4,-1(a1)
1c00a670:	0785                	addi	a5,a5,1
1c00a672:	fee78fa3          	sb	a4,-1(a5)
1c00a676:	b7fd                	j	1c00a664 <memcpy+0x4>

1c00a678 <memmove>:
1c00a678:	40b507b3          	sub	a5,a0,a1
1c00a67c:	00c7e763          	bltu	a5,a2,1c00a68a <memmove+0x12>
1c00a680:	962e                	add	a2,a2,a1
1c00a682:	87aa                	mv	a5,a0
1c00a684:	00c59e63          	bne	a1,a2,1c00a6a0 <memmove+0x28>
1c00a688:	8082                	ret
1c00a68a:	167d                	addi	a2,a2,-1
1c00a68c:	00c587b3          	add	a5,a1,a2
1c00a690:	0007c703          	lbu	a4,0(a5)
1c00a694:	00c507b3          	add	a5,a0,a2
1c00a698:	00e78023          	sb	a4,0(a5)
1c00a69c:	f67d                	bnez	a2,1c00a68a <memmove+0x12>
1c00a69e:	8082                	ret
1c00a6a0:	0005c703          	lbu	a4,0(a1)
1c00a6a4:	0785                	addi	a5,a5,1
1c00a6a6:	0585                	addi	a1,a1,1
1c00a6a8:	fee78fa3          	sb	a4,-1(a5)
1c00a6ac:	bfe1                	j	1c00a684 <memmove+0xc>

1c00a6ae <strchr>:
1c00a6ae:	0ff5f593          	andi	a1,a1,255
1c00a6b2:	00054783          	lbu	a5,0(a0)
1c00a6b6:	00b78563          	beq	a5,a1,1c00a6c0 <strchr+0x12>
1c00a6ba:	e781                	bnez	a5,1c00a6c2 <strchr+0x14>
1c00a6bc:	c191                	beqz	a1,1c00a6c0 <strchr+0x12>
1c00a6be:	4501                	li	a0,0
1c00a6c0:	8082                	ret
1c00a6c2:	0505                	addi	a0,a0,1
1c00a6c4:	b7fd                	j	1c00a6b2 <strchr+0x4>

1c00a6c6 <__rt_putc_debug_bridge>:
1c00a6c6:	1141                	addi	sp,sp,-16
1c00a6c8:	c422                	sw	s0,8(sp)
1c00a6ca:	1c001437          	lui	s0,0x1c001
1c00a6ce:	c226                	sw	s1,4(sp)
1c00a6d0:	c606                	sw	ra,12(sp)
1c00a6d2:	84aa                	mv	s1,a0
1c00a6d4:	01c40413          	addi	s0,s0,28 # 1c00101c <__hal_debug_struct>
1c00a6d8:	485c                	lw	a5,20(s0)
1c00a6da:	c791                	beqz	a5,1c00a6e6 <__rt_putc_debug_bridge+0x20>
1c00a6dc:	06400513          	li	a0,100
1c00a6e0:	907ff0ef          	jal	ra,1c009fe6 <rt_time_wait_us>
1c00a6e4:	bfd5                	j	1c00a6d8 <__rt_putc_debug_bridge+0x12>
1c00a6e6:	4c1c                	lw	a5,24(s0)
1c00a6e8:	00178713          	addi	a4,a5,1
1c00a6ec:	97a2                	add	a5,a5,s0
1c00a6ee:	00978e23          	sb	s1,28(a5)
1c00a6f2:	cc18                	sw	a4,24(s0)
1c00a6f4:	4c14                	lw	a3,24(s0)
1c00a6f6:	08000793          	li	a5,128
1c00a6fa:	00f68563          	beq	a3,a5,1c00a704 <__rt_putc_debug_bridge+0x3e>
1c00a6fe:	47a9                	li	a5,10
1c00a700:	00f49663          	bne	s1,a5,1c00a70c <__rt_putc_debug_bridge+0x46>
1c00a704:	c701                	beqz	a4,1c00a70c <__rt_putc_debug_bridge+0x46>
1c00a706:	c858                	sw	a4,20(s0)
1c00a708:	00042c23          	sw	zero,24(s0)
1c00a70c:	4c1c                	lw	a5,24(s0)
1c00a70e:	e799                	bnez	a5,1c00a71c <__rt_putc_debug_bridge+0x56>
1c00a710:	4422                	lw	s0,8(sp)
1c00a712:	40b2                	lw	ra,12(sp)
1c00a714:	4492                	lw	s1,4(sp)
1c00a716:	0141                	addi	sp,sp,16
1c00a718:	946ff06f          	j	1c00985e <__rt_bridge_printf_flush>
1c00a71c:	40b2                	lw	ra,12(sp)
1c00a71e:	4422                	lw	s0,8(sp)
1c00a720:	4492                	lw	s1,4(sp)
1c00a722:	0141                	addi	sp,sp,16
1c00a724:	8082                	ret

1c00a726 <__rt_putc_uart>:
1c00a726:	1101                	addi	sp,sp,-32
1c00a728:	c62a                	sw	a0,12(sp)
1c00a72a:	ce06                	sw	ra,28(sp)
1c00a72c:	336d                	jal	1c00a4d6 <__rt_io_uart_wait_pending>
1c00a72e:	1c0017b7          	lui	a5,0x1c001
1c00a732:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00a736:	4f94                	lw	a3,24(a5)
1c00a738:	4532                	lw	a0,12(sp)
1c00a73a:	00168713          	addi	a4,a3,1
1c00a73e:	cf98                	sw	a4,24(a5)
1c00a740:	97b6                	add	a5,a5,a3
1c00a742:	00a78e23          	sb	a0,28(a5)
1c00a746:	08000793          	li	a5,128
1c00a74a:	00f70563          	beq	a4,a5,1c00a754 <__rt_putc_uart+0x2e>
1c00a74e:	47a9                	li	a5,10
1c00a750:	00f51563          	bne	a0,a5,1c00a75a <__rt_putc_uart+0x34>
1c00a754:	40f2                	lw	ra,28(sp)
1c00a756:	6105                	addi	sp,sp,32
1c00a758:	bd0d                	j	1c00a58a <__rt_io_uart_flush.constprop.10>
1c00a75a:	40f2                	lw	ra,28(sp)
1c00a75c:	6105                	addi	sp,sp,32
1c00a75e:	8082                	ret

1c00a760 <tfp_putc.isra.8>:
1c00a760:	1c0017b7          	lui	a5,0x1c001
1c00a764:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a768:	c391                	beqz	a5,1c00a76c <tfp_putc.isra.8+0xc>
1c00a76a:	bf75                	j	1c00a726 <__rt_putc_uart>
1c00a76c:	1c0017b7          	lui	a5,0x1c001
1c00a770:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a774:	c395                	beqz	a5,1c00a798 <tfp_putc.isra.8+0x38>
1c00a776:	6689                	lui	a3,0x2
1c00a778:	f14027f3          	csrr	a5,mhartid
1c00a77c:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a780:	00379713          	slli	a4,a5,0x3
1c00a784:	078a                	slli	a5,a5,0x2
1c00a786:	0ff77713          	andi	a4,a4,255
1c00a78a:	8ff5                	and	a5,a5,a3
1c00a78c:	97ba                	add	a5,a5,a4
1c00a78e:	1a10f737          	lui	a4,0x1a10f
1c00a792:	97ba                	add	a5,a5,a4
1c00a794:	c388                	sw	a0,0(a5)
1c00a796:	8082                	ret
1c00a798:	b73d                	j	1c00a6c6 <__rt_putc_debug_bridge>

1c00a79a <puts>:
1c00a79a:	1141                	addi	sp,sp,-16
1c00a79c:	c422                	sw	s0,8(sp)
1c00a79e:	c606                	sw	ra,12(sp)
1c00a7a0:	842a                	mv	s0,a0
1c00a7a2:	3171                	jal	1c00a42e <__rt_io_lock>
1c00a7a4:	00044503          	lbu	a0,0(s0)
1c00a7a8:	c501                	beqz	a0,1c00a7b0 <puts+0x16>
1c00a7aa:	3f5d                	jal	1c00a760 <tfp_putc.isra.8>
1c00a7ac:	0405                	addi	s0,s0,1
1c00a7ae:	bfdd                	j	1c00a7a4 <puts+0xa>
1c00a7b0:	4529                	li	a0,10
1c00a7b2:	377d                	jal	1c00a760 <tfp_putc.isra.8>
1c00a7b4:	31f9                	jal	1c00a482 <__rt_io_unlock>
1c00a7b6:	40b2                	lw	ra,12(sp)
1c00a7b8:	4422                	lw	s0,8(sp)
1c00a7ba:	4501                	li	a0,0
1c00a7bc:	0141                	addi	sp,sp,16
1c00a7be:	8082                	ret

1c00a7c0 <fputc_locked>:
1c00a7c0:	1141                	addi	sp,sp,-16
1c00a7c2:	c422                	sw	s0,8(sp)
1c00a7c4:	842a                	mv	s0,a0
1c00a7c6:	0ff57513          	andi	a0,a0,255
1c00a7ca:	c606                	sw	ra,12(sp)
1c00a7cc:	3f51                	jal	1c00a760 <tfp_putc.isra.8>
1c00a7ce:	8522                	mv	a0,s0
1c00a7d0:	40b2                	lw	ra,12(sp)
1c00a7d2:	4422                	lw	s0,8(sp)
1c00a7d4:	0141                	addi	sp,sp,16
1c00a7d6:	8082                	ret

1c00a7d8 <_prf_locked>:
1c00a7d8:	1101                	addi	sp,sp,-32
1c00a7da:	ce06                	sw	ra,28(sp)
1c00a7dc:	c02a                	sw	a0,0(sp)
1c00a7de:	c62e                	sw	a1,12(sp)
1c00a7e0:	c432                	sw	a2,8(sp)
1c00a7e2:	c236                	sw	a3,4(sp)
1c00a7e4:	31a9                	jal	1c00a42e <__rt_io_lock>
1c00a7e6:	4692                	lw	a3,4(sp)
1c00a7e8:	4622                	lw	a2,8(sp)
1c00a7ea:	45b2                	lw	a1,12(sp)
1c00a7ec:	4502                	lw	a0,0(sp)
1c00a7ee:	2ae9                	jal	1c00a9c8 <_prf>
1c00a7f0:	c02a                	sw	a0,0(sp)
1c00a7f2:	3941                	jal	1c00a482 <__rt_io_unlock>
1c00a7f4:	40f2                	lw	ra,28(sp)
1c00a7f6:	4502                	lw	a0,0(sp)
1c00a7f8:	6105                	addi	sp,sp,32
1c00a7fa:	8082                	ret

1c00a7fc <exit>:
1c00a7fc:	1141                	addi	sp,sp,-16
1c00a7fe:	c606                	sw	ra,12(sp)
1c00a800:	c422                	sw	s0,8(sp)
1c00a802:	842a                	mv	s0,a0
1c00a804:	85aff0ef          	jal	ra,1c00985e <__rt_bridge_printf_flush>
1c00a808:	80000537          	lui	a0,0x80000
1c00a80c:	1c0017b7          	lui	a5,0x1c001
1c00a810:	8c49                	or	s0,s0,a0
1c00a812:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00a816:	c7c0                	sw	s0,12(a5)
1c00a818:	816ff0ef          	jal	ra,1c00982e <__rt_bridge_send_notif>
1c00a81c:	1a1047b7          	lui	a5,0x1a104
1c00a820:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa10108c>
1c00a824:	a001                	j	1c00a824 <exit+0x28>

1c00a826 <abort>:
1c00a826:	1141                	addi	sp,sp,-16
1c00a828:	557d                	li	a0,-1
1c00a82a:	c606                	sw	ra,12(sp)
1c00a82c:	3fc1                	jal	1c00a7fc <exit>

1c00a82e <__rt_io_init>:
1c00a82e:	1c0017b7          	lui	a5,0x1c001
1c00a832:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a836:	0007a223          	sw	zero,4(a5)
1c00a83a:	0007a023          	sw	zero,0(a5)
1c00a83e:	0007a623          	sw	zero,12(a5)
1c00a842:	1c0017b7          	lui	a5,0x1c001
1c00a846:	1e07a423          	sw	zero,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a84a:	1c0017b7          	lui	a5,0x1c001
1c00a84e:	1e07a023          	sw	zero,480(a5) # 1c0011e0 <__rt_io_event_current>
1c00a852:	1c0017b7          	lui	a5,0x1c001
1c00a856:	1ec7a703          	lw	a4,492(a5) # 1c0011ec <__rt_iodev>
1c00a85a:	4785                	li	a5,1
1c00a85c:	02f71e63          	bne	a4,a5,1c00a898 <__rt_io_init+0x6a>
1c00a860:	1c00a5b7          	lui	a1,0x1c00a
1c00a864:	1141                	addi	sp,sp,-16
1c00a866:	4601                	li	a2,0
1c00a868:	3ac58593          	addi	a1,a1,940 # 1c00a3ac <__rt_io_start>
1c00a86c:	4501                	li	a0,0
1c00a86e:	c606                	sw	ra,12(sp)
1c00a870:	d07fe0ef          	jal	ra,1c009576 <__rt_cbsys_add>
1c00a874:	1c00a5b7          	lui	a1,0x1c00a
1c00a878:	56458593          	addi	a1,a1,1380 # 1c00a564 <__rt_io_stop>
1c00a87c:	4601                	li	a2,0
1c00a87e:	4505                	li	a0,1
1c00a880:	cf7fe0ef          	jal	ra,1c009576 <__rt_cbsys_add>
1c00a884:	40b2                	lw	ra,12(sp)
1c00a886:	1c0017b7          	lui	a5,0x1c001
1c00a88a:	1e07a223          	sw	zero,484(a5) # 1c0011e4 <__rt_io_pending_flush>
1c00a88e:	4585                	li	a1,1
1c00a890:	4501                	li	a0,0
1c00a892:	0141                	addi	sp,sp,16
1c00a894:	9b2ff06f          	j	1c009a46 <rt_event_alloc>
1c00a898:	8082                	ret

1c00a89a <printf>:
1c00a89a:	7139                	addi	sp,sp,-64
1c00a89c:	d432                	sw	a2,40(sp)
1c00a89e:	862a                	mv	a2,a0
1c00a8a0:	1c00a537          	lui	a0,0x1c00a
1c00a8a4:	d22e                	sw	a1,36(sp)
1c00a8a6:	d636                	sw	a3,44(sp)
1c00a8a8:	4589                	li	a1,2
1c00a8aa:	1054                	addi	a3,sp,36
1c00a8ac:	7c050513          	addi	a0,a0,1984 # 1c00a7c0 <fputc_locked>
1c00a8b0:	ce06                	sw	ra,28(sp)
1c00a8b2:	d83a                	sw	a4,48(sp)
1c00a8b4:	da3e                	sw	a5,52(sp)
1c00a8b6:	dc42                	sw	a6,56(sp)
1c00a8b8:	de46                	sw	a7,60(sp)
1c00a8ba:	c636                	sw	a3,12(sp)
1c00a8bc:	3f31                	jal	1c00a7d8 <_prf_locked>
1c00a8be:	40f2                	lw	ra,28(sp)
1c00a8c0:	6121                	addi	sp,sp,64
1c00a8c2:	8082                	ret

1c00a8c4 <_to_x>:
1c00a8c4:	872a                	mv	a4,a0
1c00a8c6:	87aa                	mv	a5,a0
1c00a8c8:	4325                	li	t1,9
1c00a8ca:	02c5f8b3          	remu	a7,a1,a2
1c00a8ce:	02700513          	li	a0,39
1c00a8d2:	02c5d5b3          	divu	a1,a1,a2
1c00a8d6:	0ff8f813          	andi	a6,a7,255
1c00a8da:	01136363          	bltu	t1,a7,1c00a8e0 <_to_x+0x1c>
1c00a8de:	4501                	li	a0,0
1c00a8e0:	03080813          	addi	a6,a6,48
1c00a8e4:	0785                	addi	a5,a5,1
1c00a8e6:	9542                	add	a0,a0,a6
1c00a8e8:	fea78fa3          	sb	a0,-1(a5)
1c00a8ec:	fdf9                	bnez	a1,1c00a8ca <_to_x+0x6>
1c00a8ee:	03000613          	li	a2,48
1c00a8f2:	40e78533          	sub	a0,a5,a4
1c00a8f6:	00d54863          	blt	a0,a3,1c00a906 <_to_x+0x42>
1c00a8fa:	00078023          	sb	zero,0(a5)
1c00a8fe:	17fd                	addi	a5,a5,-1
1c00a900:	00f76763          	bltu	a4,a5,1c00a90e <_to_x+0x4a>
1c00a904:	8082                	ret
1c00a906:	0785                	addi	a5,a5,1
1c00a908:	fec78fa3          	sb	a2,-1(a5)
1c00a90c:	b7dd                	j	1c00a8f2 <_to_x+0x2e>
1c00a90e:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10bfec>
1c00a912:	0007c683          	lbu	a3,0(a5)
1c00a916:	0705                	addi	a4,a4,1
1c00a918:	00c78023          	sb	a2,0(a5)
1c00a91c:	fed70fa3          	sb	a3,-1(a4)
1c00a920:	17fd                	addi	a5,a5,-1
1c00a922:	bff9                	j	1c00a900 <_to_x+0x3c>

1c00a924 <_rlrshift>:
1c00a924:	411c                	lw	a5,0(a0)
1c00a926:	4154                	lw	a3,4(a0)
1c00a928:	0017f713          	andi	a4,a5,1
1c00a92c:	01f69613          	slli	a2,a3,0x1f
1c00a930:	8385                	srli	a5,a5,0x1
1c00a932:	8fd1                	or	a5,a5,a2
1c00a934:	97ba                	add	a5,a5,a4
1c00a936:	8285                	srli	a3,a3,0x1
1c00a938:	00e7b733          	sltu	a4,a5,a4
1c00a93c:	9736                	add	a4,a4,a3
1c00a93e:	c11c                	sw	a5,0(a0)
1c00a940:	c158                	sw	a4,4(a0)
1c00a942:	8082                	ret

1c00a944 <_ldiv5>:
1c00a944:	4118                	lw	a4,0(a0)
1c00a946:	4154                	lw	a3,4(a0)
1c00a948:	4615                	li	a2,5
1c00a94a:	00270793          	addi	a5,a4,2
1c00a94e:	00e7b733          	sltu	a4,a5,a4
1c00a952:	9736                	add	a4,a4,a3
1c00a954:	02c755b3          	divu	a1,a4,a2
1c00a958:	02b606b3          	mul	a3,a2,a1
1c00a95c:	8f15                	sub	a4,a4,a3
1c00a95e:	01d71693          	slli	a3,a4,0x1d
1c00a962:	0037d713          	srli	a4,a5,0x3
1c00a966:	8f55                	or	a4,a4,a3
1c00a968:	02c75733          	divu	a4,a4,a2
1c00a96c:	01d75693          	srli	a3,a4,0x1d
1c00a970:	070e                	slli	a4,a4,0x3
1c00a972:	95b6                	add	a1,a1,a3
1c00a974:	02e606b3          	mul	a3,a2,a4
1c00a978:	8f95                	sub	a5,a5,a3
1c00a97a:	02c7d7b3          	divu	a5,a5,a2
1c00a97e:	973e                	add	a4,a4,a5
1c00a980:	00f737b3          	sltu	a5,a4,a5
1c00a984:	97ae                	add	a5,a5,a1
1c00a986:	c118                	sw	a4,0(a0)
1c00a988:	c15c                	sw	a5,4(a0)
1c00a98a:	8082                	ret

1c00a98c <_get_digit>:
1c00a98c:	419c                	lw	a5,0(a1)
1c00a98e:	03000713          	li	a4,48
1c00a992:	02f05863          	blez	a5,1c00a9c2 <_get_digit+0x36>
1c00a996:	17fd                	addi	a5,a5,-1
1c00a998:	4114                	lw	a3,0(a0)
1c00a99a:	c19c                	sw	a5,0(a1)
1c00a99c:	415c                	lw	a5,4(a0)
1c00a99e:	4729                	li	a4,10
1c00a9a0:	02d70633          	mul	a2,a4,a3
1c00a9a4:	02f707b3          	mul	a5,a4,a5
1c00a9a8:	c110                	sw	a2,0(a0)
1c00a9aa:	02d73733          	mulhu	a4,a4,a3
1c00a9ae:	100006b7          	lui	a3,0x10000
1c00a9b2:	16fd                	addi	a3,a3,-1
1c00a9b4:	97ba                	add	a5,a5,a4
1c00a9b6:	01c7d713          	srli	a4,a5,0x1c
1c00a9ba:	8ff5                	and	a5,a5,a3
1c00a9bc:	03070713          	addi	a4,a4,48
1c00a9c0:	c15c                	sw	a5,4(a0)
1c00a9c2:	0ff77513          	andi	a0,a4,255
1c00a9c6:	8082                	ret

1c00a9c8 <_prf>:
1c00a9c8:	714d                	addi	sp,sp,-336
1c00a9ca:	14912223          	sw	s1,324(sp)
1c00a9ce:	13312e23          	sw	s3,316(sp)
1c00a9d2:	13812423          	sw	s8,296(sp)
1c00a9d6:	14112623          	sw	ra,332(sp)
1c00a9da:	14812423          	sw	s0,328(sp)
1c00a9de:	15212023          	sw	s2,320(sp)
1c00a9e2:	13412c23          	sw	s4,312(sp)
1c00a9e6:	13512a23          	sw	s5,308(sp)
1c00a9ea:	13612823          	sw	s6,304(sp)
1c00a9ee:	13712623          	sw	s7,300(sp)
1c00a9f2:	13912223          	sw	s9,292(sp)
1c00a9f6:	13a12023          	sw	s10,288(sp)
1c00a9fa:	11b12e23          	sw	s11,284(sp)
1c00a9fe:	cc2a                	sw	a0,24(sp)
1c00aa00:	ce2e                	sw	a1,28(sp)
1c00aa02:	84b2                	mv	s1,a2
1c00aa04:	8c36                	mv	s8,a3
1c00aa06:	4981                	li	s3,0
1c00aa08:	0004c503          	lbu	a0,0(s1)
1c00aa0c:	00148b93          	addi	s7,s1,1
1c00aa10:	cd01                	beqz	a0,1c00aa28 <_prf+0x60>
1c00aa12:	02500793          	li	a5,37
1c00aa16:	14f50a63          	beq	a0,a5,1c00ab6a <_prf+0x1a2>
1c00aa1a:	45f2                	lw	a1,28(sp)
1c00aa1c:	4762                	lw	a4,24(sp)
1c00aa1e:	9702                	jalr	a4
1c00aa20:	57fd                	li	a5,-1
1c00aa22:	04f51063          	bne	a0,a5,1c00aa62 <_prf+0x9a>
1c00aa26:	59fd                	li	s3,-1
1c00aa28:	14c12083          	lw	ra,332(sp)
1c00aa2c:	14812403          	lw	s0,328(sp)
1c00aa30:	854e                	mv	a0,s3
1c00aa32:	14412483          	lw	s1,324(sp)
1c00aa36:	14012903          	lw	s2,320(sp)
1c00aa3a:	13c12983          	lw	s3,316(sp)
1c00aa3e:	13812a03          	lw	s4,312(sp)
1c00aa42:	13412a83          	lw	s5,308(sp)
1c00aa46:	13012b03          	lw	s6,304(sp)
1c00aa4a:	12c12b83          	lw	s7,300(sp)
1c00aa4e:	12812c03          	lw	s8,296(sp)
1c00aa52:	12412c83          	lw	s9,292(sp)
1c00aa56:	12012d03          	lw	s10,288(sp)
1c00aa5a:	11c12d83          	lw	s11,284(sp)
1c00aa5e:	6171                	addi	sp,sp,336
1c00aa60:	8082                	ret
1c00aa62:	0985                	addi	s3,s3,1
1c00aa64:	8a62                	mv	s4,s8
1c00aa66:	84de                	mv	s1,s7
1c00aa68:	8c52                	mv	s8,s4
1c00aa6a:	bf79                	j	1c00aa08 <_prf+0x40>
1c00aa6c:	0f2a8663          	beq	s5,s2,1c00ab58 <_prf+0x190>
1c00aa70:	0d596963          	bltu	s2,s5,1c00ab42 <_prf+0x17a>
1c00aa74:	fa0a8ae3          	beqz	s5,1c00aa28 <_prf+0x60>
1c00aa78:	0dba8e63          	beq	s5,s11,1c00ab54 <_prf+0x18c>
1c00aa7c:	8ba6                	mv	s7,s1
1c00aa7e:	001b8493          	addi	s1,s7,1
1c00aa82:	fff4ca83          	lbu	s5,-1(s1)
1c00aa86:	1c0007b7          	lui	a5,0x1c000
1c00aa8a:	6a078513          	addi	a0,a5,1696 # 1c0006a0 <__DTOR_END__+0x3b4>
1c00aa8e:	85d6                	mv	a1,s5
1c00aa90:	c1fff0ef          	jal	ra,1c00a6ae <strchr>
1c00aa94:	fd61                	bnez	a0,1c00aa6c <_prf+0xa4>
1c00aa96:	02a00693          	li	a3,42
1c00aa9a:	0eda9a63          	bne	s5,a3,1c00ab8e <_prf+0x1c6>
1c00aa9e:	000c2903          	lw	s2,0(s8)
1c00aaa2:	004c0693          	addi	a3,s8,4
1c00aaa6:	00095663          	bgez	s2,1c00aab2 <_prf+0xea>
1c00aaaa:	4705                	li	a4,1
1c00aaac:	41200933          	neg	s2,s2
1c00aab0:	c63a                	sw	a4,12(sp)
1c00aab2:	0004ca83          	lbu	s5,0(s1)
1c00aab6:	8c36                	mv	s8,a3
1c00aab8:	002b8493          	addi	s1,s7,2
1c00aabc:	0c800713          	li	a4,200
1c00aac0:	01277463          	bleu	s2,a4,1c00aac8 <_prf+0x100>
1c00aac4:	0c800913          	li	s2,200
1c00aac8:	02e00693          	li	a3,46
1c00aacc:	5d7d                	li	s10,-1
1c00aace:	02da9463          	bne	s5,a3,1c00aaf6 <_prf+0x12e>
1c00aad2:	0004c703          	lbu	a4,0(s1)
1c00aad6:	02a00793          	li	a5,42
1c00aada:	10f71063          	bne	a4,a5,1c00abda <_prf+0x212>
1c00aade:	000c2d03          	lw	s10,0(s8)
1c00aae2:	0485                	addi	s1,s1,1
1c00aae4:	0c11                	addi	s8,s8,4
1c00aae6:	0c800793          	li	a5,200
1c00aaea:	01a7d363          	ble	s10,a5,1c00aaf0 <_prf+0x128>
1c00aaee:	5d7d                	li	s10,-1
1c00aaf0:	0004ca83          	lbu	s5,0(s1)
1c00aaf4:	0485                	addi	s1,s1,1
1c00aaf6:	1c0007b7          	lui	a5,0x1c000
1c00aafa:	85d6                	mv	a1,s5
1c00aafc:	6a878513          	addi	a0,a5,1704 # 1c0006a8 <__DTOR_END__+0x3bc>
1c00ab00:	bafff0ef          	jal	ra,1c00a6ae <strchr>
1c00ab04:	c501                	beqz	a0,1c00ab0c <_prf+0x144>
1c00ab06:	0004ca83          	lbu	s5,0(s1)
1c00ab0a:	0485                	addi	s1,s1,1
1c00ab0c:	06700693          	li	a3,103
1c00ab10:	1356c263          	blt	a3,s5,1c00ac34 <_prf+0x26c>
1c00ab14:	06500693          	li	a3,101
1c00ab18:	1edadd63          	ble	a3,s5,1c00ad12 <_prf+0x34a>
1c00ab1c:	04700693          	li	a3,71
1c00ab20:	0d56c163          	blt	a3,s5,1c00abe2 <_prf+0x21a>
1c00ab24:	04500693          	li	a3,69
1c00ab28:	1edad563          	ble	a3,s5,1c00ad12 <_prf+0x34a>
1c00ab2c:	ee0a8ee3          	beqz	s5,1c00aa28 <_prf+0x60>
1c00ab30:	02500713          	li	a4,37
1c00ab34:	68ea8263          	beq	s5,a4,1c00b1b8 <_prf+0x7f0>
1c00ab38:	0c800713          	li	a4,200
1c00ab3c:	69575763          	ble	s5,a4,1c00b1ca <_prf+0x802>
1c00ab40:	b5dd                	j	1c00aa26 <_prf+0x5e>
1c00ab42:	034a8163          	beq	s5,s4,1c00ab64 <_prf+0x19c>
1c00ab46:	016a8b63          	beq	s5,s6,1c00ab5c <_prf+0x194>
1c00ab4a:	f3aa99e3          	bne	s5,s10,1c00aa7c <_prf+0xb4>
1c00ab4e:	4785                	li	a5,1
1c00ab50:	ca3e                	sw	a5,20(sp)
1c00ab52:	b72d                	j	1c00aa7c <_prf+0xb4>
1c00ab54:	4405                	li	s0,1
1c00ab56:	b71d                	j	1c00aa7c <_prf+0xb4>
1c00ab58:	4c85                	li	s9,1
1c00ab5a:	b70d                	j	1c00aa7c <_prf+0xb4>
1c00ab5c:	03000713          	li	a4,48
1c00ab60:	c83a                	sw	a4,16(sp)
1c00ab62:	bf29                	j	1c00aa7c <_prf+0xb4>
1c00ab64:	4785                	li	a5,1
1c00ab66:	c63e                	sw	a5,12(sp)
1c00ab68:	bf11                	j	1c00aa7c <_prf+0xb4>
1c00ab6a:	02000713          	li	a4,32
1c00ab6e:	c83a                	sw	a4,16(sp)
1c00ab70:	4401                	li	s0,0
1c00ab72:	ca02                	sw	zero,20(sp)
1c00ab74:	c602                	sw	zero,12(sp)
1c00ab76:	4c81                	li	s9,0
1c00ab78:	02300913          	li	s2,35
1c00ab7c:	02d00a13          	li	s4,45
1c00ab80:	03000b13          	li	s6,48
1c00ab84:	02b00d13          	li	s10,43
1c00ab88:	02000d93          	li	s11,32
1c00ab8c:	bdcd                	j	1c00aa7e <_prf+0xb6>
1c00ab8e:	fd0a8693          	addi	a3,s5,-48
1c00ab92:	4625                	li	a2,9
1c00ab94:	4901                	li	s2,0
1c00ab96:	45a9                	li	a1,10
1c00ab98:	f2d662e3          	bltu	a2,a3,1c00aabc <_prf+0xf4>
1c00ab9c:	000bc683          	lbu	a3,0(s7)
1c00aba0:	001b8493          	addi	s1,s7,1
1c00aba4:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xfff2fe4>
1c00aba8:	8ab6                	mv	s5,a3
1c00abaa:	f0e669e3          	bltu	a2,a4,1c00aabc <_prf+0xf4>
1c00abae:	02b90933          	mul	s2,s2,a1
1c00abb2:	8ba6                	mv	s7,s1
1c00abb4:	9936                	add	s2,s2,a3
1c00abb6:	fd090913          	addi	s2,s2,-48
1c00abba:	b7cd                	j	1c00ab9c <_prf+0x1d4>
1c00abbc:	02ad0733          	mul	a4,s10,a0
1c00abc0:	84ae                	mv	s1,a1
1c00abc2:	973e                	add	a4,a4,a5
1c00abc4:	fd070d13          	addi	s10,a4,-48
1c00abc8:	0004c783          	lbu	a5,0(s1)
1c00abcc:	00148593          	addi	a1,s1,1
1c00abd0:	fd078613          	addi	a2,a5,-48
1c00abd4:	fec6f4e3          	bleu	a2,a3,1c00abbc <_prf+0x1f4>
1c00abd8:	b739                	j	1c00aae6 <_prf+0x11e>
1c00abda:	4d01                	li	s10,0
1c00abdc:	46a5                	li	a3,9
1c00abde:	4529                	li	a0,10
1c00abe0:	b7e5                	j	1c00abc8 <_prf+0x200>
1c00abe2:	06300693          	li	a3,99
1c00abe6:	0cda8b63          	beq	s5,a3,1c00acbc <_prf+0x2f4>
1c00abea:	0756c563          	blt	a3,s5,1c00ac54 <_prf+0x28c>
1c00abee:	05800693          	li	a3,88
1c00abf2:	f4da93e3          	bne	s5,a3,1c00ab38 <_prf+0x170>
1c00abf6:	04410b93          	addi	s7,sp,68
1c00abfa:	004c0a13          	addi	s4,s8,4
1c00abfe:	000c2583          	lw	a1,0(s8)
1c00ac02:	845e                	mv	s0,s7
1c00ac04:	000c8963          	beqz	s9,1c00ac16 <_prf+0x24e>
1c00ac08:	76e1                	lui	a3,0xffff8
1c00ac0a:	8306c693          	xori	a3,a3,-2000
1c00ac0e:	04d11223          	sh	a3,68(sp)
1c00ac12:	04610413          	addi	s0,sp,70
1c00ac16:	86ea                	mv	a3,s10
1c00ac18:	4641                	li	a2,16
1c00ac1a:	8522                	mv	a0,s0
1c00ac1c:	3165                	jal	1c00a8c4 <_to_x>
1c00ac1e:	05800693          	li	a3,88
1c00ac22:	58da8863          	beq	s5,a3,1c00b1b2 <_prf+0x7ea>
1c00ac26:	41740433          	sub	s0,s0,s7
1c00ac2a:	9522                	add	a0,a0,s0
1c00ac2c:	01903433          	snez	s0,s9
1c00ac30:	0406                	slli	s0,s0,0x1
1c00ac32:	a8c9                	j	1c00ad04 <_prf+0x33c>
1c00ac34:	07000693          	li	a3,112
1c00ac38:	50da8163          	beq	s5,a3,1c00b13a <_prf+0x772>
1c00ac3c:	0556c163          	blt	a3,s5,1c00ac7e <_prf+0x2b6>
1c00ac40:	06e00693          	li	a3,110
1c00ac44:	46da8b63          	beq	s5,a3,1c00b0ba <_prf+0x6f2>
1c00ac48:	4956c063          	blt	a3,s5,1c00b0c8 <_prf+0x700>
1c00ac4c:	06900693          	li	a3,105
1c00ac50:	eeda94e3          	bne	s5,a3,1c00ab38 <_prf+0x170>
1c00ac54:	000c2a83          	lw	s5,0(s8)
1c00ac58:	004c0a13          	addi	s4,s8,4
1c00ac5c:	04410b13          	addi	s6,sp,68
1c00ac60:	060ad963          	bgez	s5,1c00acd2 <_prf+0x30a>
1c00ac64:	02d00693          	li	a3,45
1c00ac68:	04d10223          	sb	a3,68(sp)
1c00ac6c:	800006b7          	lui	a3,0x80000
1c00ac70:	415005b3          	neg	a1,s5
1c00ac74:	06da9963          	bne	s5,a3,1c00ace6 <_prf+0x31e>
1c00ac78:	800005b7          	lui	a1,0x80000
1c00ac7c:	a0ad                	j	1c00ace6 <_prf+0x31e>
1c00ac7e:	07500693          	li	a3,117
1c00ac82:	50da8063          	beq	s5,a3,1c00b182 <_prf+0x7ba>
1c00ac86:	07800693          	li	a3,120
1c00ac8a:	f6da86e3          	beq	s5,a3,1c00abf6 <_prf+0x22e>
1c00ac8e:	07300693          	li	a3,115
1c00ac92:	eada93e3          	bne	s5,a3,1c00ab38 <_prf+0x170>
1c00ac96:	000c2583          	lw	a1,0(s8)
1c00ac9a:	004c0a13          	addi	s4,s8,4
1c00ac9e:	4c81                	li	s9,0
1c00aca0:	0c800793          	li	a5,200
1c00aca4:	019586b3          	add	a3,a1,s9
1c00aca8:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00acac:	4a068f63          	beqz	a3,1c00b16a <_prf+0x7a2>
1c00acb0:	0c85                	addi	s9,s9,1
1c00acb2:	fefc99e3          	bne	s9,a5,1c00aca4 <_prf+0x2dc>
1c00acb6:	4a0d5c63          	bgez	s10,1c00b16e <_prf+0x7a6>
1c00acba:	a97d                	j	1c00b178 <_prf+0x7b0>
1c00acbc:	000c2783          	lw	a5,0(s8)
1c00acc0:	004c0a13          	addi	s4,s8,4
1c00acc4:	040102a3          	sb	zero,69(sp)
1c00acc8:	04f10223          	sb	a5,68(sp)
1c00accc:	4c85                	li	s9,1
1c00acce:	4401                	li	s0,0
1c00acd0:	a105                	j	1c00b0f0 <_prf+0x728>
1c00acd2:	4752                	lw	a4,20(sp)
1c00acd4:	02b00693          	li	a3,43
1c00acd8:	e701                	bnez	a4,1c00ace0 <_prf+0x318>
1c00acda:	c41d                	beqz	s0,1c00ad08 <_prf+0x340>
1c00acdc:	02000693          	li	a3,32
1c00ace0:	04d10223          	sb	a3,68(sp)
1c00ace4:	85d6                	mv	a1,s5
1c00ace6:	04510c13          	addi	s8,sp,69
1c00acea:	86ea                	mv	a3,s10
1c00acec:	4629                	li	a2,10
1c00acee:	8562                	mv	a0,s8
1c00acf0:	bd5ff0ef          	jal	ra,1c00a8c4 <_to_x>
1c00acf4:	47d2                	lw	a5,20(sp)
1c00acf6:	9562                	add	a0,a0,s8
1c00acf8:	41650533          	sub	a0,a0,s6
1c00acfc:	eb89                	bnez	a5,1c00ad0e <_prf+0x346>
1c00acfe:	e019                	bnez	s0,1c00ad04 <_prf+0x33c>
1c00ad00:	01fad413          	srli	s0,s5,0x1f
1c00ad04:	57fd                	li	a5,-1
1c00ad06:	a9a1                	j	1c00b15e <_prf+0x796>
1c00ad08:	85d6                	mv	a1,s5
1c00ad0a:	8c5a                	mv	s8,s6
1c00ad0c:	bff9                	j	1c00acea <_prf+0x322>
1c00ad0e:	4452                	lw	s0,20(sp)
1c00ad10:	bfd5                	j	1c00ad04 <_prf+0x33c>
1c00ad12:	0c1d                	addi	s8,s8,7
1c00ad14:	ff8c7c13          	andi	s8,s8,-8
1c00ad18:	000c2883          	lw	a7,0(s8)
1c00ad1c:	004c2303          	lw	t1,4(s8)
1c00ad20:	80000737          	lui	a4,0x80000
1c00ad24:	0158d593          	srli	a1,a7,0x15
1c00ad28:	00b31693          	slli	a3,t1,0xb
1c00ad2c:	8ecd                	or	a3,a3,a1
1c00ad2e:	fff74713          	not	a4,a4
1c00ad32:	01435613          	srli	a2,t1,0x14
1c00ad36:	08ae                	slli	a7,a7,0xb
1c00ad38:	8ef9                	and	a3,a3,a4
1c00ad3a:	7ff67613          	andi	a2,a2,2047
1c00ad3e:	d846                	sw	a7,48(sp)
1c00ad40:	da36                	sw	a3,52(sp)
1c00ad42:	7ff00593          	li	a1,2047
1c00ad46:	008c0a13          	addi	s4,s8,8
1c00ad4a:	08b61d63          	bne	a2,a1,1c00ade4 <_prf+0x41c>
1c00ad4e:	00d0                	addi	a2,sp,68
1c00ad50:	8732                	mv	a4,a2
1c00ad52:	00035863          	bgez	t1,1c00ad62 <_prf+0x39a>
1c00ad56:	02d00713          	li	a4,45
1c00ad5a:	04e10223          	sb	a4,68(sp)
1c00ad5e:	04510713          	addi	a4,sp,69
1c00ad62:	00d8e6b3          	or	a3,a7,a3
1c00ad66:	fbfa8793          	addi	a5,s5,-65
1c00ad6a:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00ad6e:	eaa1                	bnez	a3,1c00adbe <_prf+0x3f6>
1c00ad70:	46e5                	li	a3,25
1c00ad72:	02f6ee63          	bltu	a3,a5,1c00adae <_prf+0x3e6>
1c00ad76:	6795                	lui	a5,0x5
1c00ad78:	e4978793          	addi	a5,a5,-439 # 4e49 <_l1_preload_size+0x1e39>
1c00ad7c:	00f71023          	sh	a5,0(a4)
1c00ad80:	04600793          	li	a5,70
1c00ad84:	00f70123          	sb	a5,2(a4)
1c00ad88:	000701a3          	sb	zero,3(a4)
1c00ad8c:	8d11                	sub	a0,a0,a2
1c00ad8e:	47d2                	lw	a5,20(sp)
1c00ad90:	48079f63          	bnez	a5,1c00b22e <_prf+0x866>
1c00ad94:	e419                	bnez	s0,1c00ada2 <_prf+0x3da>
1c00ad96:	04414403          	lbu	s0,68(sp)
1c00ad9a:	fd340413          	addi	s0,s0,-45
1c00ad9e:	00143413          	seqz	s0,s0
1c00ada2:	0c800793          	li	a5,200
1c00ada6:	c8a7c0e3          	blt	a5,a0,1c00aa26 <_prf+0x5e>
1c00adaa:	8caa                	mv	s9,a0
1c00adac:	a691                	j	1c00b0f0 <_prf+0x728>
1c00adae:	679d                	lui	a5,0x7
1c00adb0:	e6978793          	addi	a5,a5,-407 # 6e69 <_l1_preload_size+0x3e59>
1c00adb4:	00f71023          	sh	a5,0(a4)
1c00adb8:	06600793          	li	a5,102
1c00adbc:	b7e1                	j	1c00ad84 <_prf+0x3bc>
1c00adbe:	46e5                	li	a3,25
1c00adc0:	00f6ea63          	bltu	a3,a5,1c00add4 <_prf+0x40c>
1c00adc4:	6791                	lui	a5,0x4
1c00adc6:	14e78793          	addi	a5,a5,334 # 414e <_l1_preload_size+0x113e>
1c00adca:	00f71023          	sh	a5,0(a4)
1c00adce:	04e00793          	li	a5,78
1c00add2:	bf4d                	j	1c00ad84 <_prf+0x3bc>
1c00add4:	6799                	lui	a5,0x6
1c00add6:	16e78793          	addi	a5,a5,366 # 616e <_l1_preload_size+0x315e>
1c00adda:	00f71023          	sh	a5,0(a4)
1c00adde:	06e00793          	li	a5,110
1c00ade2:	b74d                	j	1c00ad84 <_prf+0x3bc>
1c00ade4:	04600593          	li	a1,70
1c00ade8:	00ba9463          	bne	s5,a1,1c00adf0 <_prf+0x428>
1c00adec:	06600a93          	li	s5,102
1c00adf0:	011665b3          	or	a1,a2,a7
1c00adf4:	8dd5                	or	a1,a1,a3
1c00adf6:	c9c9                	beqz	a1,1c00ae88 <_prf+0x4c0>
1c00adf8:	800007b7          	lui	a5,0x80000
1c00adfc:	8edd                	or	a3,a3,a5
1c00adfe:	da36                	sw	a3,52(sp)
1c00ae00:	d846                	sw	a7,48(sp)
1c00ae02:	c0260c13          	addi	s8,a2,-1022
1c00ae06:	02d00693          	li	a3,45
1c00ae0a:	00034b63          	bltz	t1,1c00ae20 <_prf+0x458>
1c00ae0e:	4752                	lw	a4,20(sp)
1c00ae10:	02b00693          	li	a3,43
1c00ae14:	e711                	bnez	a4,1c00ae20 <_prf+0x458>
1c00ae16:	04410b13          	addi	s6,sp,68
1c00ae1a:	c419                	beqz	s0,1c00ae28 <_prf+0x460>
1c00ae1c:	02000693          	li	a3,32
1c00ae20:	04d10223          	sb	a3,68(sp)
1c00ae24:	04510b13          	addi	s6,sp,69
1c00ae28:	4b81                	li	s7,0
1c00ae2a:	55f9                	li	a1,-2
1c00ae2c:	06bc4363          	blt	s8,a1,1c00ae92 <_prf+0x4ca>
1c00ae30:	0b804a63          	bgtz	s8,1c00aee4 <_prf+0x51c>
1c00ae34:	4d91                	li	s11,4
1c00ae36:	1808                	addi	a0,sp,48
1c00ae38:	0c05                	addi	s8,s8,1
1c00ae3a:	aebff0ef          	jal	ra,1c00a924 <_rlrshift>
1c00ae3e:	ffbc1ce3          	bne	s8,s11,1c00ae36 <_prf+0x46e>
1c00ae42:	000d5363          	bgez	s10,1c00ae48 <_prf+0x480>
1c00ae46:	4d19                	li	s10,6
1c00ae48:	fdfaf593          	andi	a1,s5,-33
1c00ae4c:	04700513          	li	a0,71
1c00ae50:	0ca59663          	bne	a1,a0,1c00af1c <_prf+0x554>
1c00ae54:	4c01                	li	s8,0
1c00ae56:	000c9463          	bnez	s9,1c00ae5e <_prf+0x496>
1c00ae5a:	01a03c33          	snez	s8,s10
1c00ae5e:	55f5                	li	a1,-3
1c00ae60:	00bbc663          	blt	s7,a1,1c00ae6c <_prf+0x4a4>
1c00ae64:	001d0593          	addi	a1,s10,1
1c00ae68:	0b75df63          	ble	s7,a1,1c00af26 <_prf+0x55e>
1c00ae6c:	06700593          	li	a1,103
1c00ae70:	14ba8c63          	beq	s5,a1,1c00afc8 <_prf+0x600>
1c00ae74:	04500a93          	li	s5,69
1c00ae78:	001d0593          	addi	a1,s10,1
1c00ae7c:	4541                	li	a0,16
1c00ae7e:	d62a                	sw	a0,44(sp)
1c00ae80:	0ab55c63          	ble	a1,a0,1c00af38 <_prf+0x570>
1c00ae84:	45c1                	li	a1,16
1c00ae86:	a84d                	j	1c00af38 <_prf+0x570>
1c00ae88:	4c01                	li	s8,0
1c00ae8a:	b751                	j	1c00ae0e <_prf+0x446>
1c00ae8c:	1808                	addi	a0,sp,48
1c00ae8e:	a97ff0ef          	jal	ra,1c00a924 <_rlrshift>
1c00ae92:	55d2                	lw	a1,52(sp)
1c00ae94:	333337b7          	lui	a5,0x33333
1c00ae98:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732019a>
1c00ae9c:	5342                	lw	t1,48(sp)
1c00ae9e:	0c05                	addi	s8,s8,1
1c00aea0:	feb7e6e3          	bltu	a5,a1,1c00ae8c <_prf+0x4c4>
1c00aea4:	4895                	li	a7,5
1c00aea6:	02b88533          	mul	a0,a7,a1
1c00aeaa:	1bfd                	addi	s7,s7,-1
1c00aeac:	0268b5b3          	mulhu	a1,a7,t1
1c00aeb0:	026888b3          	mul	a7,a7,t1
1c00aeb4:	95aa                	add	a1,a1,a0
1c00aeb6:	da2e                	sw	a1,52(sp)
1c00aeb8:	4501                	li	a0,0
1c00aeba:	d846                	sw	a7,48(sp)
1c00aebc:	800006b7          	lui	a3,0x80000
1c00aec0:	fff6c693          	not	a3,a3
1c00aec4:	00b6f663          	bleu	a1,a3,1c00aed0 <_prf+0x508>
1c00aec8:	d12d                	beqz	a0,1c00ae2a <_prf+0x462>
1c00aeca:	d846                	sw	a7,48(sp)
1c00aecc:	da2e                	sw	a1,52(sp)
1c00aece:	bfb1                	j	1c00ae2a <_prf+0x462>
1c00aed0:	01f8d313          	srli	t1,a7,0x1f
1c00aed4:	00159513          	slli	a0,a1,0x1
1c00aed8:	00a365b3          	or	a1,t1,a0
1c00aedc:	0886                	slli	a7,a7,0x1
1c00aede:	1c7d                	addi	s8,s8,-1
1c00aee0:	4505                	li	a0,1
1c00aee2:	bfe9                	j	1c00aebc <_prf+0x4f4>
1c00aee4:	1808                	addi	a0,sp,48
1c00aee6:	a5fff0ef          	jal	ra,1c00a944 <_ldiv5>
1c00aeea:	58c2                	lw	a7,48(sp)
1c00aeec:	55d2                	lw	a1,52(sp)
1c00aeee:	1c7d                	addi	s8,s8,-1
1c00aef0:	0b85                	addi	s7,s7,1
1c00aef2:	4501                	li	a0,0
1c00aef4:	80000737          	lui	a4,0x80000
1c00aef8:	fff74713          	not	a4,a4
1c00aefc:	00b77663          	bleu	a1,a4,1c00af08 <_prf+0x540>
1c00af00:	d905                	beqz	a0,1c00ae30 <_prf+0x468>
1c00af02:	d846                	sw	a7,48(sp)
1c00af04:	da2e                	sw	a1,52(sp)
1c00af06:	b72d                	j	1c00ae30 <_prf+0x468>
1c00af08:	01f8d313          	srli	t1,a7,0x1f
1c00af0c:	00159513          	slli	a0,a1,0x1
1c00af10:	00a365b3          	or	a1,t1,a0
1c00af14:	0886                	slli	a7,a7,0x1
1c00af16:	1c7d                	addi	s8,s8,-1
1c00af18:	4505                	li	a0,1
1c00af1a:	bfe9                	j	1c00aef4 <_prf+0x52c>
1c00af1c:	06600593          	li	a1,102
1c00af20:	4c01                	li	s8,0
1c00af22:	f4ba9be3          	bne	s5,a1,1c00ae78 <_prf+0x4b0>
1c00af26:	01ab85b3          	add	a1,s7,s10
1c00af2a:	06600a93          	li	s5,102
1c00af2e:	f405d7e3          	bgez	a1,1c00ae7c <_prf+0x4b4>
1c00af32:	45c1                	li	a1,16
1c00af34:	d62e                	sw	a1,44(sp)
1c00af36:	4581                	li	a1,0
1c00af38:	4301                	li	t1,0
1c00af3a:	080003b7          	lui	t2,0x8000
1c00af3e:	dc1a                	sw	t1,56(sp)
1c00af40:	de1e                	sw	t2,60(sp)
1c00af42:	5dfd                	li	s11,-1
1c00af44:	15fd                	addi	a1,a1,-1
1c00af46:	09b59463          	bne	a1,s11,1c00afce <_prf+0x606>
1c00af4a:	55c2                	lw	a1,48(sp)
1c00af4c:	5562                	lw	a0,56(sp)
1c00af4e:	58d2                	lw	a7,52(sp)
1c00af50:	5372                	lw	t1,60(sp)
1c00af52:	952e                	add	a0,a0,a1
1c00af54:	00b535b3          	sltu	a1,a0,a1
1c00af58:	989a                	add	a7,a7,t1
1c00af5a:	95c6                	add	a1,a1,a7
1c00af5c:	d82a                	sw	a0,48(sp)
1c00af5e:	f0000537          	lui	a0,0xf0000
1c00af62:	da2e                	sw	a1,52(sp)
1c00af64:	8de9                	and	a1,a1,a0
1c00af66:	c981                	beqz	a1,1c00af76 <_prf+0x5ae>
1c00af68:	1808                	addi	a0,sp,48
1c00af6a:	9dbff0ef          	jal	ra,1c00a944 <_ldiv5>
1c00af6e:	1808                	addi	a0,sp,48
1c00af70:	9b5ff0ef          	jal	ra,1c00a924 <_rlrshift>
1c00af74:	0b85                	addi	s7,s7,1
1c00af76:	06600593          	li	a1,102
1c00af7a:	001b0d93          	addi	s11,s6,1
1c00af7e:	08ba9663          	bne	s5,a1,1c00b00a <_prf+0x642>
1c00af82:	05705f63          	blez	s7,1c00afe0 <_prf+0x618>
1c00af86:	017b0db3          	add	s11,s6,s7
1c00af8a:	106c                	addi	a1,sp,44
1c00af8c:	1808                	addi	a0,sp,48
1c00af8e:	0b05                	addi	s6,s6,1
1c00af90:	9fdff0ef          	jal	ra,1c00a98c <_get_digit>
1c00af94:	feab0fa3          	sb	a0,-1(s6)
1c00af98:	ffbb19e3          	bne	s6,s11,1c00af8a <_prf+0x5c2>
1c00af9c:	4b81                	li	s7,0
1c00af9e:	000c9463          	bnez	s9,1c00afa6 <_prf+0x5de>
1c00afa2:	020d0063          	beqz	s10,1c00afc2 <_prf+0x5fa>
1c00afa6:	02e00613          	li	a2,46
1c00afaa:	00cd8023          	sb	a2,0(s11)
1c00afae:	8b6e                	mv	s6,s11
1c00afb0:	01ad8cb3          	add	s9,s11,s10
1c00afb4:	03000313          	li	t1,48
1c00afb8:	036c9963          	bne	s9,s6,1c00afea <_prf+0x622>
1c00afbc:	001d0713          	addi	a4,s10,1
1c00afc0:	9dba                	add	s11,s11,a4
1c00afc2:	060c1e63          	bnez	s8,1c00b03e <_prf+0x676>
1c00afc6:	a8d1                	j	1c00b09a <_prf+0x6d2>
1c00afc8:	06500a93          	li	s5,101
1c00afcc:	b575                	j	1c00ae78 <_prf+0x4b0>
1c00afce:	1828                	addi	a0,sp,56
1c00afd0:	c42e                	sw	a1,8(sp)
1c00afd2:	973ff0ef          	jal	ra,1c00a944 <_ldiv5>
1c00afd6:	1828                	addi	a0,sp,56
1c00afd8:	94dff0ef          	jal	ra,1c00a924 <_rlrshift>
1c00afdc:	45a2                	lw	a1,8(sp)
1c00afde:	b79d                	j	1c00af44 <_prf+0x57c>
1c00afe0:	03000593          	li	a1,48
1c00afe4:	00bb0023          	sb	a1,0(s6)
1c00afe8:	bf5d                	j	1c00af9e <_prf+0x5d6>
1c00afea:	000b8763          	beqz	s7,1c00aff8 <_prf+0x630>
1c00afee:	006b00a3          	sb	t1,1(s6)
1c00aff2:	0b85                	addi	s7,s7,1
1c00aff4:	0b05                	addi	s6,s6,1
1c00aff6:	b7c9                	j	1c00afb8 <_prf+0x5f0>
1c00aff8:	106c                	addi	a1,sp,44
1c00affa:	1808                	addi	a0,sp,48
1c00affc:	c41a                	sw	t1,8(sp)
1c00affe:	98fff0ef          	jal	ra,1c00a98c <_get_digit>
1c00b002:	00ab00a3          	sb	a0,1(s6)
1c00b006:	4322                	lw	t1,8(sp)
1c00b008:	b7f5                	j	1c00aff4 <_prf+0x62c>
1c00b00a:	106c                	addi	a1,sp,44
1c00b00c:	1808                	addi	a0,sp,48
1c00b00e:	97fff0ef          	jal	ra,1c00a98c <_get_digit>
1c00b012:	00ab0023          	sb	a0,0(s6)
1c00b016:	03000593          	li	a1,48
1c00b01a:	00b50363          	beq	a0,a1,1c00b020 <_prf+0x658>
1c00b01e:	1bfd                	addi	s7,s7,-1
1c00b020:	000c9463          	bnez	s9,1c00b028 <_prf+0x660>
1c00b024:	000d0b63          	beqz	s10,1c00b03a <_prf+0x672>
1c00b028:	002b0d93          	addi	s11,s6,2
1c00b02c:	02e00593          	li	a1,46
1c00b030:	00bb00a3          	sb	a1,1(s6)
1c00b034:	9d6e                	add	s10,s10,s11
1c00b036:	07bd1863          	bne	s10,s11,1c00b0a6 <_prf+0x6de>
1c00b03a:	000c0f63          	beqz	s8,1c00b058 <_prf+0x690>
1c00b03e:	03000593          	li	a1,48
1c00b042:	fffdc603          	lbu	a2,-1(s11)
1c00b046:	fffd8713          	addi	a4,s11,-1
1c00b04a:	06b60663          	beq	a2,a1,1c00b0b6 <_prf+0x6ee>
1c00b04e:	02e00593          	li	a1,46
1c00b052:	00b61363          	bne	a2,a1,1c00b058 <_prf+0x690>
1c00b056:	8dba                	mv	s11,a4
1c00b058:	fdfaf713          	andi	a4,s5,-33
1c00b05c:	04500613          	li	a2,69
1c00b060:	02c71d63          	bne	a4,a2,1c00b09a <_prf+0x6d2>
1c00b064:	87d6                	mv	a5,s5
1c00b066:	00fd8023          	sb	a5,0(s11)
1c00b06a:	02b00793          	li	a5,43
1c00b06e:	000bd663          	bgez	s7,1c00b07a <_prf+0x6b2>
1c00b072:	41700bb3          	neg	s7,s7
1c00b076:	02d00793          	li	a5,45
1c00b07a:	00fd80a3          	sb	a5,1(s11)
1c00b07e:	47a9                	li	a5,10
1c00b080:	02fbc733          	div	a4,s7,a5
1c00b084:	0d91                	addi	s11,s11,4
1c00b086:	02fbe6b3          	rem	a3,s7,a5
1c00b08a:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b08e:	feed8f23          	sb	a4,-2(s11)
1c00b092:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b096:	fedd8fa3          	sb	a3,-1(s11)
1c00b09a:	00c8                	addi	a0,sp,68
1c00b09c:	000d8023          	sb	zero,0(s11)
1c00b0a0:	40ad8533          	sub	a0,s11,a0
1c00b0a4:	b1ed                	j	1c00ad8e <_prf+0x3c6>
1c00b0a6:	106c                	addi	a1,sp,44
1c00b0a8:	1808                	addi	a0,sp,48
1c00b0aa:	0d85                	addi	s11,s11,1
1c00b0ac:	8e1ff0ef          	jal	ra,1c00a98c <_get_digit>
1c00b0b0:	fead8fa3          	sb	a0,-1(s11)
1c00b0b4:	b749                	j	1c00b036 <_prf+0x66e>
1c00b0b6:	8dba                	mv	s11,a4
1c00b0b8:	b769                	j	1c00b042 <_prf+0x67a>
1c00b0ba:	000c2783          	lw	a5,0(s8)
1c00b0be:	004c0a13          	addi	s4,s8,4
1c00b0c2:	0137a023          	sw	s3,0(a5)
1c00b0c6:	b24d                	j	1c00aa68 <_prf+0xa0>
1c00b0c8:	004c0a13          	addi	s4,s8,4
1c00b0cc:	000c2583          	lw	a1,0(s8)
1c00b0d0:	00dc                	addi	a5,sp,68
1c00b0d2:	040c8463          	beqz	s9,1c00b11a <_prf+0x752>
1c00b0d6:	03000693          	li	a3,48
1c00b0da:	04d10223          	sb	a3,68(sp)
1c00b0de:	04510513          	addi	a0,sp,69
1c00b0e2:	ed8d                	bnez	a1,1c00b11c <_prf+0x754>
1c00b0e4:	040102a3          	sb	zero,69(sp)
1c00b0e8:	57fd                	li	a5,-1
1c00b0ea:	4401                	li	s0,0
1c00b0ec:	0efd1163          	bne	s10,a5,1c00b1ce <_prf+0x806>
1c00b0f0:	0f2cc363          	blt	s9,s2,1c00b1d6 <_prf+0x80e>
1c00b0f4:	8966                	mv	s2,s9
1c00b0f6:	00c0                	addi	s0,sp,68
1c00b0f8:	40898ab3          	sub	s5,s3,s0
1c00b0fc:	5b7d                	li	s6,-1
1c00b0fe:	015409b3          	add	s3,s0,s5
1c00b102:	960903e3          	beqz	s2,1c00aa68 <_prf+0xa0>
1c00b106:	45f2                	lw	a1,28(sp)
1c00b108:	00044503          	lbu	a0,0(s0)
1c00b10c:	47e2                	lw	a5,24(sp)
1c00b10e:	9782                	jalr	a5
1c00b110:	91650be3          	beq	a0,s6,1c00aa26 <_prf+0x5e>
1c00b114:	197d                	addi	s2,s2,-1
1c00b116:	0405                	addi	s0,s0,1
1c00b118:	b7dd                	j	1c00b0fe <_prf+0x736>
1c00b11a:	853e                	mv	a0,a5
1c00b11c:	86ea                	mv	a3,s10
1c00b11e:	4621                	li	a2,8
1c00b120:	40f50433          	sub	s0,a0,a5
1c00b124:	fa0ff0ef          	jal	ra,1c00a8c4 <_to_x>
1c00b128:	9522                	add	a0,a0,s0
1c00b12a:	57fd                	li	a5,-1
1c00b12c:	4401                	li	s0,0
1c00b12e:	c6fd0ae3          	beq	s10,a5,1c00ada2 <_prf+0x3da>
1c00b132:	02000793          	li	a5,32
1c00b136:	c83e                	sw	a5,16(sp)
1c00b138:	b1ad                	j	1c00ada2 <_prf+0x3da>
1c00b13a:	000c2583          	lw	a1,0(s8)
1c00b13e:	77e1                	lui	a5,0xffff8
1c00b140:	8307c793          	xori	a5,a5,-2000
1c00b144:	46a1                	li	a3,8
1c00b146:	4641                	li	a2,16
1c00b148:	04610513          	addi	a0,sp,70
1c00b14c:	04f11223          	sh	a5,68(sp)
1c00b150:	f74ff0ef          	jal	ra,1c00a8c4 <_to_x>
1c00b154:	004c0a13          	addi	s4,s8,4
1c00b158:	0509                	addi	a0,a0,2
1c00b15a:	57fd                	li	a5,-1
1c00b15c:	4401                	li	s0,0
1c00b15e:	c4fd02e3          	beq	s10,a5,1c00ada2 <_prf+0x3da>
1c00b162:	02000713          	li	a4,32
1c00b166:	c83a                	sw	a4,16(sp)
1c00b168:	b92d                	j	1c00ada2 <_prf+0x3da>
1c00b16a:	000d4563          	bltz	s10,1c00b174 <_prf+0x7ac>
1c00b16e:	019d5363          	ble	s9,s10,1c00b174 <_prf+0x7ac>
1c00b172:	8cea                	mv	s9,s10
1c00b174:	8e0c8ae3          	beqz	s9,1c00aa68 <_prf+0xa0>
1c00b178:	8666                	mv	a2,s9
1c00b17a:	00c8                	addi	a0,sp,68
1c00b17c:	ce4ff0ef          	jal	ra,1c00a660 <memcpy>
1c00b180:	b6b9                	j	1c00acce <_prf+0x306>
1c00b182:	000c2583          	lw	a1,0(s8)
1c00b186:	86ea                	mv	a3,s10
1c00b188:	4629                	li	a2,10
1c00b18a:	00c8                	addi	a0,sp,68
1c00b18c:	004c0a13          	addi	s4,s8,4
1c00b190:	f34ff0ef          	jal	ra,1c00a8c4 <_to_x>
1c00b194:	bf59                	j	1c00b12a <_prf+0x762>
1c00b196:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b19a:	0ff67613          	andi	a2,a2,255
1c00b19e:	00c5e563          	bltu	a1,a2,1c00b1a8 <_prf+0x7e0>
1c00b1a2:	1781                	addi	a5,a5,-32
1c00b1a4:	00f68023          	sb	a5,0(a3)
1c00b1a8:	0685                	addi	a3,a3,1
1c00b1aa:	0006c783          	lbu	a5,0(a3)
1c00b1ae:	f7e5                	bnez	a5,1c00b196 <_prf+0x7ce>
1c00b1b0:	bc9d                	j	1c00ac26 <_prf+0x25e>
1c00b1b2:	86de                	mv	a3,s7
1c00b1b4:	45e5                	li	a1,25
1c00b1b6:	bfd5                	j	1c00b1aa <_prf+0x7e2>
1c00b1b8:	45f2                	lw	a1,28(sp)
1c00b1ba:	4762                	lw	a4,24(sp)
1c00b1bc:	02500513          	li	a0,37
1c00b1c0:	9702                	jalr	a4
1c00b1c2:	57fd                	li	a5,-1
1c00b1c4:	86f501e3          	beq	a0,a5,1c00aa26 <_prf+0x5e>
1c00b1c8:	0985                	addi	s3,s3,1
1c00b1ca:	8a62                	mv	s4,s8
1c00b1cc:	b871                	j	1c00aa68 <_prf+0xa0>
1c00b1ce:	02000793          	li	a5,32
1c00b1d2:	c83e                	sw	a5,16(sp)
1c00b1d4:	bf31                	j	1c00b0f0 <_prf+0x728>
1c00b1d6:	4732                	lw	a4,12(sp)
1c00b1d8:	cf01                	beqz	a4,1c00b1f0 <_prf+0x828>
1c00b1da:	02000713          	li	a4,32
1c00b1de:	00d4                	addi	a3,sp,68
1c00b1e0:	019687b3          	add	a5,a3,s9
1c00b1e4:	00e78023          	sb	a4,0(a5)
1c00b1e8:	0c85                	addi	s9,s9,1
1c00b1ea:	ff991ae3          	bne	s2,s9,1c00b1de <_prf+0x816>
1c00b1ee:	b721                	j	1c00b0f6 <_prf+0x72e>
1c00b1f0:	00cc                	addi	a1,sp,68
1c00b1f2:	41990bb3          	sub	s7,s2,s9
1c00b1f6:	001c8613          	addi	a2,s9,1
1c00b1fa:	01758533          	add	a0,a1,s7
1c00b1fe:	c7aff0ef          	jal	ra,1c00a678 <memmove>
1c00b202:	4742                	lw	a4,16(sp)
1c00b204:	02000793          	li	a5,32
1c00b208:	00f70363          	beq	a4,a5,1c00b20e <_prf+0x846>
1c00b20c:	c622                	sw	s0,12(sp)
1c00b20e:	47b2                	lw	a5,12(sp)
1c00b210:	9bbe                	add	s7,s7,a5
1c00b212:	4732                	lw	a4,12(sp)
1c00b214:	ef7751e3          	ble	s7,a4,1c00b0f6 <_prf+0x72e>
1c00b218:	4732                	lw	a4,12(sp)
1c00b21a:	00d4                	addi	a3,sp,68
1c00b21c:	00e687b3          	add	a5,a3,a4
1c00b220:	4742                	lw	a4,16(sp)
1c00b222:	00e78023          	sb	a4,0(a5)
1c00b226:	47b2                	lw	a5,12(sp)
1c00b228:	0785                	addi	a5,a5,1
1c00b22a:	c63e                	sw	a5,12(sp)
1c00b22c:	b7dd                	j	1c00b212 <_prf+0x84a>
1c00b22e:	4452                	lw	s0,20(sp)
1c00b230:	be8d                	j	1c00ada2 <_prf+0x3da>

1c00b232 <__rt_uart_cluster_req_done>:
1c00b232:	300476f3          	csrrci	a3,mstatus,8
1c00b236:	4785                	li	a5,1
1c00b238:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b23c:	09954783          	lbu	a5,153(a0)
1c00b240:	00201737          	lui	a4,0x201
1c00b244:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3e18>
1c00b248:	04078793          	addi	a5,a5,64
1c00b24c:	07da                	slli	a5,a5,0x16
1c00b24e:	97ba                	add	a5,a5,a4
1c00b250:	0007a023          	sw	zero,0(a5)
1c00b254:	30069073          	csrw	mstatus,a3
1c00b258:	8082                	ret

1c00b25a <__rt_uart_setup.isra.6>:
1c00b25a:	1c001737          	lui	a4,0x1c001
1c00b25e:	23872703          	lw	a4,568(a4) # 1c001238 <__rt_freq_domains>
1c00b262:	00155793          	srli	a5,a0,0x1
1c00b266:	97ba                	add	a5,a5,a4
1c00b268:	02a7d7b3          	divu	a5,a5,a0
1c00b26c:	1a102737          	lui	a4,0x1a102
1c00b270:	17fd                	addi	a5,a5,-1
1c00b272:	07c2                	slli	a5,a5,0x10
1c00b274:	3067e793          	ori	a5,a5,774
1c00b278:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0ff190>
1c00b27c:	8082                	ret

1c00b27e <__rt_uart_setfreq_after>:
1c00b27e:	1c0017b7          	lui	a5,0x1c001
1c00b282:	1b878793          	addi	a5,a5,440 # 1c0011b8 <__rt_uart>
1c00b286:	4398                	lw	a4,0(a5)
1c00b288:	cb09                	beqz	a4,1c00b29a <__rt_uart_setfreq_after+0x1c>
1c00b28a:	4788                	lw	a0,8(a5)
1c00b28c:	1141                	addi	sp,sp,-16
1c00b28e:	c606                	sw	ra,12(sp)
1c00b290:	37e9                	jal	1c00b25a <__rt_uart_setup.isra.6>
1c00b292:	40b2                	lw	ra,12(sp)
1c00b294:	4501                	li	a0,0
1c00b296:	0141                	addi	sp,sp,16
1c00b298:	8082                	ret
1c00b29a:	4501                	li	a0,0
1c00b29c:	8082                	ret

1c00b29e <__rt_uart_cluster_req>:
1c00b29e:	1141                	addi	sp,sp,-16
1c00b2a0:	c606                	sw	ra,12(sp)
1c00b2a2:	c422                	sw	s0,8(sp)
1c00b2a4:	30047473          	csrrci	s0,mstatus,8
1c00b2a8:	1c00b7b7          	lui	a5,0x1c00b
1c00b2ac:	23278793          	addi	a5,a5,562 # 1c00b232 <__rt_uart_cluster_req_done>
1c00b2b0:	c55c                	sw	a5,12(a0)
1c00b2b2:	4785                	li	a5,1
1c00b2b4:	d55c                	sw	a5,44(a0)
1c00b2b6:	411c                	lw	a5,0(a0)
1c00b2b8:	02052823          	sw	zero,48(a0)
1c00b2bc:	c908                	sw	a0,16(a0)
1c00b2be:	43cc                	lw	a1,4(a5)
1c00b2c0:	4514                	lw	a3,8(a0)
1c00b2c2:	4150                	lw	a2,4(a0)
1c00b2c4:	0586                	slli	a1,a1,0x1
1c00b2c6:	00c50793          	addi	a5,a0,12
1c00b2ca:	4701                	li	a4,0
1c00b2cc:	0585                	addi	a1,a1,1
1c00b2ce:	4501                	li	a0,0
1c00b2d0:	e99fe0ef          	jal	ra,1c00a168 <rt_periph_copy>
1c00b2d4:	30041073          	csrw	mstatus,s0
1c00b2d8:	40b2                	lw	ra,12(sp)
1c00b2da:	4422                	lw	s0,8(sp)
1c00b2dc:	0141                	addi	sp,sp,16
1c00b2de:	8082                	ret

1c00b2e0 <__rt_uart_wait_tx_done.isra.5>:
1c00b2e0:	1a102737          	lui	a4,0x1a102
1c00b2e4:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa0ff184>
1c00b2e8:	8bc1                	andi	a5,a5,16
1c00b2ea:	e7b9                	bnez	a5,1c00b338 <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b2ec:	1a102737          	lui	a4,0x1a102
1c00b2f0:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa0ff18c>
1c00b2f4:	8b85                	andi	a5,a5,1
1c00b2f6:	ffed                	bnez	a5,1c00b2f0 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b2f8:	f14027f3          	csrr	a5,mhartid
1c00b2fc:	8795                	srai	a5,a5,0x5
1c00b2fe:	1a10a637          	lui	a2,0x1a10a
1c00b302:	03f7f793          	andi	a5,a5,63
1c00b306:	03200693          	li	a3,50
1c00b30a:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa106800>
1c00b30e:	6711                	lui	a4,0x4
1c00b310:	6311                	lui	t1,0x4
1c00b312:	45fd                	li	a1,31
1c00b314:	00204537          	lui	a0,0x204
1c00b318:	88be                	mv	a7,a5
1c00b31a:	00682023          	sw	t1,0(a6)
1c00b31e:	02b79063          	bne	a5,a1,1c00b33e <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b322:	80e62223          	sw	a4,-2044(a2)
1c00b326:	10500073          	wfi
1c00b32a:	00b89c63          	bne	a7,a1,1c00b342 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b32e:	80e62423          	sw	a4,-2040(a2)
1c00b332:	16fd                	addi	a3,a3,-1
1c00b334:	f2fd                	bnez	a3,1c00b31a <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b336:	8082                	ret
1c00b338:	10500073          	wfi
1c00b33c:	b765                	j	1c00b2e4 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b33e:	c958                	sw	a4,20(a0)
1c00b340:	b7dd                	j	1c00b326 <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b342:	c918                	sw	a4,16(a0)
1c00b344:	b7fd                	j	1c00b332 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b346 <__rt_uart_setfreq_before>:
1c00b346:	1c0017b7          	lui	a5,0x1c001
1c00b34a:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <__rt_uart>
1c00b34e:	cf99                	beqz	a5,1c00b36c <__rt_uart_setfreq_before+0x26>
1c00b350:	1141                	addi	sp,sp,-16
1c00b352:	c606                	sw	ra,12(sp)
1c00b354:	3771                	jal	1c00b2e0 <__rt_uart_wait_tx_done.isra.5>
1c00b356:	40b2                	lw	ra,12(sp)
1c00b358:	005007b7          	lui	a5,0x500
1c00b35c:	1a102737          	lui	a4,0x1a102
1c00b360:	0799                	addi	a5,a5,6
1c00b362:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0ff190>
1c00b366:	4501                	li	a0,0
1c00b368:	0141                	addi	sp,sp,16
1c00b36a:	8082                	ret
1c00b36c:	4501                	li	a0,0
1c00b36e:	8082                	ret

1c00b370 <soc_eu_fcEventMask_setEvent>:
1c00b370:	47fd                	li	a5,31
1c00b372:	4721                	li	a4,8
1c00b374:	00a7d463          	ble	a0,a5,1c00b37c <soc_eu_fcEventMask_setEvent+0xc>
1c00b378:	1501                	addi	a0,a0,-32
1c00b37a:	4711                	li	a4,4
1c00b37c:	1a1067b7          	lui	a5,0x1a106
1c00b380:	973e                	add	a4,a4,a5
1c00b382:	4314                	lw	a3,0(a4)
1c00b384:	4785                	li	a5,1
1c00b386:	00a79533          	sll	a0,a5,a0
1c00b38a:	fff54513          	not	a0,a0
1c00b38e:	8d75                	and	a0,a0,a3
1c00b390:	c308                	sw	a0,0(a4)
1c00b392:	8082                	ret

1c00b394 <rt_uart_conf_init>:
1c00b394:	000997b7          	lui	a5,0x99
1c00b398:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8b97c>
1c00b39c:	c11c                	sw	a5,0(a0)
1c00b39e:	57fd                	li	a5,-1
1c00b3a0:	c15c                	sw	a5,4(a0)
1c00b3a2:	8082                	ret

1c00b3a4 <__rt_uart_open>:
1c00b3a4:	1141                	addi	sp,sp,-16
1c00b3a6:	c606                	sw	ra,12(sp)
1c00b3a8:	c422                	sw	s0,8(sp)
1c00b3aa:	c226                	sw	s1,4(sp)
1c00b3ac:	c04a                	sw	s2,0(sp)
1c00b3ae:	30047973          	csrrci	s2,mstatus,8
1c00b3b2:	cd8d                	beqz	a1,1c00b3ec <__rt_uart_open+0x48>
1c00b3b4:	4194                	lw	a3,0(a1)
1c00b3b6:	1c0017b7          	lui	a5,0x1c001
1c00b3ba:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f7011>
1c00b3be:	1b878413          	addi	s0,a5,440 # 1c0011b8 <__rt_uart>
1c00b3c2:	0712                	slli	a4,a4,0x4
1c00b3c4:	943a                	add	s0,s0,a4
1c00b3c6:	4010                	lw	a2,0(s0)
1c00b3c8:	1b878793          	addi	a5,a5,440
1c00b3cc:	c60d                	beqz	a2,1c00b3f6 <__rt_uart_open+0x52>
1c00b3ce:	c589                	beqz	a1,1c00b3d8 <__rt_uart_open+0x34>
1c00b3d0:	418c                	lw	a1,0(a1)
1c00b3d2:	4414                	lw	a3,8(s0)
1c00b3d4:	04d59a63          	bne	a1,a3,1c00b428 <__rt_uart_open+0x84>
1c00b3d8:	97ba                	add	a5,a5,a4
1c00b3da:	0605                	addi	a2,a2,1
1c00b3dc:	c390                	sw	a2,0(a5)
1c00b3de:	8522                	mv	a0,s0
1c00b3e0:	40b2                	lw	ra,12(sp)
1c00b3e2:	4422                	lw	s0,8(sp)
1c00b3e4:	4492                	lw	s1,4(sp)
1c00b3e6:	4902                	lw	s2,0(sp)
1c00b3e8:	0141                	addi	sp,sp,16
1c00b3ea:	8082                	ret
1c00b3ec:	000996b7          	lui	a3,0x99
1c00b3f0:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8b97c>
1c00b3f4:	b7c9                	j	1c00b3b6 <__rt_uart_open+0x12>
1c00b3f6:	4785                	li	a5,1
1c00b3f8:	1a102737          	lui	a4,0x1a102
1c00b3fc:	c01c                	sw	a5,0(s0)
1c00b3fe:	c048                	sw	a0,4(s0)
1c00b400:	c414                	sw	a3,8(s0)
1c00b402:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa0ff76c>
1c00b406:	00a797b3          	sll	a5,a5,a0
1c00b40a:	00151493          	slli	s1,a0,0x1
1c00b40e:	8fd5                	or	a5,a5,a3
1c00b410:	78f72023          	sw	a5,1920(a4)
1c00b414:	8526                	mv	a0,s1
1c00b416:	3fa9                	jal	1c00b370 <soc_eu_fcEventMask_setEvent>
1c00b418:	00148513          	addi	a0,s1,1
1c00b41c:	3f91                	jal	1c00b370 <soc_eu_fcEventMask_setEvent>
1c00b41e:	4408                	lw	a0,8(s0)
1c00b420:	3d2d                	jal	1c00b25a <__rt_uart_setup.isra.6>
1c00b422:	30091073          	csrw	mstatus,s2
1c00b426:	bf65                	j	1c00b3de <__rt_uart_open+0x3a>
1c00b428:	4401                	li	s0,0
1c00b42a:	bf55                	j	1c00b3de <__rt_uart_open+0x3a>

1c00b42c <rt_uart_close>:
1c00b42c:	1141                	addi	sp,sp,-16
1c00b42e:	c606                	sw	ra,12(sp)
1c00b430:	c422                	sw	s0,8(sp)
1c00b432:	c226                	sw	s1,4(sp)
1c00b434:	300474f3          	csrrci	s1,mstatus,8
1c00b438:	411c                	lw	a5,0(a0)
1c00b43a:	17fd                	addi	a5,a5,-1
1c00b43c:	c11c                	sw	a5,0(a0)
1c00b43e:	e78d                	bnez	a5,1c00b468 <rt_uart_close+0x3c>
1c00b440:	842a                	mv	s0,a0
1c00b442:	3d79                	jal	1c00b2e0 <__rt_uart_wait_tx_done.isra.5>
1c00b444:	005007b7          	lui	a5,0x500
1c00b448:	1a102737          	lui	a4,0x1a102
1c00b44c:	0799                	addi	a5,a5,6
1c00b44e:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0ff190>
1c00b452:	4050                	lw	a2,4(s0)
1c00b454:	78072683          	lw	a3,1920(a4)
1c00b458:	4785                	li	a5,1
1c00b45a:	00c797b3          	sll	a5,a5,a2
1c00b45e:	fff7c793          	not	a5,a5
1c00b462:	8ff5                	and	a5,a5,a3
1c00b464:	78f72023          	sw	a5,1920(a4)
1c00b468:	30049073          	csrw	mstatus,s1
1c00b46c:	40b2                	lw	ra,12(sp)
1c00b46e:	4422                	lw	s0,8(sp)
1c00b470:	4492                	lw	s1,4(sp)
1c00b472:	0141                	addi	sp,sp,16
1c00b474:	8082                	ret

1c00b476 <rt_uart_cluster_write>:
1c00b476:	f14027f3          	csrr	a5,mhartid
1c00b47a:	8795                	srai	a5,a5,0x5
1c00b47c:	03f7f793          	andi	a5,a5,63
1c00b480:	08f68ca3          	sb	a5,153(a3)
1c00b484:	1c00b7b7          	lui	a5,0x1c00b
1c00b488:	29e78793          	addi	a5,a5,670 # 1c00b29e <__rt_uart_cluster_req>
1c00b48c:	c6dc                	sw	a5,12(a3)
1c00b48e:	4785                	li	a5,1
1c00b490:	c288                	sw	a0,0(a3)
1c00b492:	c2cc                	sw	a1,4(a3)
1c00b494:	c690                	sw	a2,8(a3)
1c00b496:	08068c23          	sb	zero,152(a3)
1c00b49a:	0206a823          	sw	zero,48(a3)
1c00b49e:	ca94                	sw	a3,16(a3)
1c00b4a0:	d6dc                	sw	a5,44(a3)
1c00b4a2:	00c68513          	addi	a0,a3,12
1c00b4a6:	ab5fd06f          	j	1c008f5a <__rt_cluster_push_fc_event>

1c00b4aa <__rt_uart_init>:
1c00b4aa:	1c00b5b7          	lui	a1,0x1c00b
1c00b4ae:	1141                	addi	sp,sp,-16
1c00b4b0:	4601                	li	a2,0
1c00b4b2:	34658593          	addi	a1,a1,838 # 1c00b346 <__rt_uart_setfreq_before>
1c00b4b6:	4511                	li	a0,4
1c00b4b8:	c606                	sw	ra,12(sp)
1c00b4ba:	c422                	sw	s0,8(sp)
1c00b4bc:	8bafe0ef          	jal	ra,1c009576 <__rt_cbsys_add>
1c00b4c0:	1c00b5b7          	lui	a1,0x1c00b
1c00b4c4:	842a                	mv	s0,a0
1c00b4c6:	4601                	li	a2,0
1c00b4c8:	27e58593          	addi	a1,a1,638 # 1c00b27e <__rt_uart_setfreq_after>
1c00b4cc:	4515                	li	a0,5
1c00b4ce:	8a8fe0ef          	jal	ra,1c009576 <__rt_cbsys_add>
1c00b4d2:	1c0017b7          	lui	a5,0x1c001
1c00b4d6:	1a07ac23          	sw	zero,440(a5) # 1c0011b8 <__rt_uart>
1c00b4da:	8d41                	or	a0,a0,s0
1c00b4dc:	c105                	beqz	a0,1c00b4fc <__rt_uart_init+0x52>
1c00b4de:	f1402673          	csrr	a2,mhartid
1c00b4e2:	1c000537          	lui	a0,0x1c000
1c00b4e6:	40565593          	srai	a1,a2,0x5
1c00b4ea:	03f5f593          	andi	a1,a1,63
1c00b4ee:	8a7d                	andi	a2,a2,31
1c00b4f0:	6b050513          	addi	a0,a0,1712 # 1c0006b0 <__DTOR_END__+0x3c4>
1c00b4f4:	ba6ff0ef          	jal	ra,1c00a89a <printf>
1c00b4f8:	b2eff0ef          	jal	ra,1c00a826 <abort>
1c00b4fc:	40b2                	lw	ra,12(sp)
1c00b4fe:	4422                	lw	s0,8(sp)
1c00b500:	0141                	addi	sp,sp,16
1c00b502:	8082                	ret

Disassembly of section .text.cluster:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x1f7014>
1c010016:	0e059863          	bnez	a1,1c010106 <__rt_slave_start>
1c01001a:	e3ff0417          	auipc	s0,0xe3ff0
1c01001e:	fea40413          	addi	s0,s0,-22 # 4 <__rt_bridge_flash_handle>
1c010022:	002049b7          	lui	s3,0x204
1c010026:	4a09                	li	s4,2
1c010028:	00000a97          	auipc	s5,0x0
1c01002c:	034a8a93          	addi	s5,s5,52 # 1c01005c <__rt_master_event>
1c010030:	ffff1b97          	auipc	s7,0xffff1
1c010034:	1d8b8b93          	addi	s7,s7,472 # 1c001208 <__rt_fc_cluster_data>
1c010038:	02800393          	li	t2,40
1c01003c:	02a383b3          	mul	t2,t2,a0
1c010040:	9b9e                	add	s7,s7,t2
1c010042:	0b91                	addi	s7,s7,4
1c010044:	1a10acb7          	lui	s9,0x1a10a
1c010048:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_end+0xa1067fc>
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
1c0100cc:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1f7098>
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
1c010124:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x1f7230>

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
