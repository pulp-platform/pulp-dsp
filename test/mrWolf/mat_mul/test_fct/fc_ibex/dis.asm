/home/arnold/pulp-sdk/pkg/pulp_riscv_gcc/1.0.13/bin/riscv32-unknown-elf-objdump -Mmarch=rv32imfcxpulpv2 /home/arnold/PULP-DSP/test/mrWolf/mat_mul/test_fct/fc_ibex/build/wolfe/test/test -d

/home/arnold/PULP-DSP/test/mrWolf/mat_mul/test_fct/fc_ibex/build/wolfe/test/test:     file format elf32-littleriscv


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
1c0080da:	19a010ef          	jal	ra,1c009274 <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00000397          	auipc	t2,0x0
1c0080ea:	51e38393          	addi	t2,t2,1310 # 1c008604 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	2f4010ef          	jal	ra,1c0093e8 <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	73c020ef          	jal	ra,1c00a836 <exit>

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
1c00815e:	64a60613          	addi	a2,a2,1610 # 1c0097a4 <__rt_bridge_handle_notif>
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
1c00825e:	21e50513          	addi	a0,a0,542 # 1c009478 <__rt_handle_illegal_instr>
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
1c008340:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_end+0xa1097ec>
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
1c008518:	0007c503          	lbu	a0,0(a5) # 10000 <__l1_heap_size+0x14>
1c00851c:	40a70533          	sub	a0,a4,a0
1c008520:	8082                	ret
1c008522:	01000737          	lui	a4,0x1000
1c008526:	47c1                	li	a5,16
1c008528:	fce56ee3          	bltu	a0,a4,1c008504 <__clzsi2+0x10>
1c00852c:	47e1                	li	a5,24
1c00852e:	bfd9                	j	1c008504 <__clzsi2+0x10>

1c008530 <cpu_perf_get>:
1c008530:	47f9                	li	a5,30
1c008532:	0ca7e763          	bltu	a5,a0,1c008600 <cpu_perf_get+0xd0>
1c008536:	1c0007b7          	lui	a5,0x1c000
1c00853a:	3ec78793          	addi	a5,a5,1004 # 1c0003ec <__DTOR_END__+0x100>
1c00853e:	050a                	slli	a0,a0,0x2
1c008540:	953e                	add	a0,a0,a5
1c008542:	411c                	lw	a5,0(a0)
1c008544:	8782                	jr	a5
1c008546:	79d02573          	csrr	a0,pccr29
1c00854a:	8082                	ret
1c00854c:	79c02573          	csrr	a0,pccr28
1c008550:	8082                	ret
1c008552:	79b02573          	csrr	a0,pccr27
1c008556:	8082                	ret
1c008558:	79a02573          	csrr	a0,pccr26
1c00855c:	8082                	ret
1c00855e:	79902573          	csrr	a0,pccr25
1c008562:	8082                	ret
1c008564:	79802573          	csrr	a0,pccr24
1c008568:	8082                	ret
1c00856a:	79702573          	csrr	a0,pccr23
1c00856e:	8082                	ret
1c008570:	79602573          	csrr	a0,pccr22
1c008574:	8082                	ret
1c008576:	79502573          	csrr	a0,pccr21
1c00857a:	8082                	ret
1c00857c:	79402573          	csrr	a0,pccr20
1c008580:	8082                	ret
1c008582:	79302573          	csrr	a0,pccr19
1c008586:	8082                	ret
1c008588:	79202573          	csrr	a0,pccr18
1c00858c:	8082                	ret
1c00858e:	79102573          	csrr	a0,pccr17
1c008592:	8082                	ret
1c008594:	79002573          	csrr	a0,pccr16
1c008598:	8082                	ret
1c00859a:	78f02573          	csrr	a0,pccr15
1c00859e:	8082                	ret
1c0085a0:	78e02573          	csrr	a0,pccr14
1c0085a4:	8082                	ret
1c0085a6:	78d02573          	csrr	a0,pccr13
1c0085aa:	8082                	ret
1c0085ac:	78c02573          	csrr	a0,pccr12
1c0085b0:	8082                	ret
1c0085b2:	78b02573          	csrr	a0,pccr11
1c0085b6:	8082                	ret
1c0085b8:	78a02573          	csrr	a0,pccr10
1c0085bc:	8082                	ret
1c0085be:	78902573          	csrr	a0,pccr9
1c0085c2:	8082                	ret
1c0085c4:	78802573          	csrr	a0,pccr8
1c0085c8:	8082                	ret
1c0085ca:	78702573          	csrr	a0,pccr7
1c0085ce:	8082                	ret
1c0085d0:	78602573          	csrr	a0,pccr6
1c0085d4:	8082                	ret
1c0085d6:	78502573          	csrr	a0,pccr5
1c0085da:	8082                	ret
1c0085dc:	78402573          	csrr	a0,pccr4
1c0085e0:	8082                	ret
1c0085e2:	78302573          	csrr	a0,pccr3
1c0085e6:	8082                	ret
1c0085e8:	78202573          	csrr	a0,pccr2
1c0085ec:	8082                	ret
1c0085ee:	78102573          	csrr	a0,pccr1
1c0085f2:	8082                	ret
1c0085f4:	78002573          	csrr	a0,pccr0
1c0085f8:	8082                	ret
1c0085fa:	79e02573          	csrr	a0,pccr30
1c0085fe:	8082                	ret
1c008600:	4501                	li	a0,0
1c008602:	8082                	ret

1c008604 <main>:
1c008604:	7159                	addi	sp,sp,-112
1c008606:	0028                	addi	a0,sp,8
1c008608:	d686                	sw	ra,108(sp)
1c00860a:	d2a6                	sw	s1,100(sp)
1c00860c:	d4a2                	sw	s0,104(sp)
1c00860e:	d0ca                	sw	s2,96(sp)
1c008610:	cece                	sw	s3,92(sp)
1c008612:	ccd2                	sw	s4,88(sp)
1c008614:	429000ef          	jal	ra,1c00923c <rt_perf_init>
1c008618:	6585                	lui	a1,0x1
1c00861a:	4501                	li	a0,0
1c00861c:	2b19                	jal	1c008b32 <rt_alloc>
1c00861e:	84aa                	mv	s1,a0
1c008620:	1c000537          	lui	a0,0x1c000
1c008624:	46850513          	addi	a0,a0,1128 # 1c000468 <__DTOR_END__+0x17c>
1c008628:	1ac020ef          	jal	ra,1c00a7d4 <puts>
1c00862c:	65c1                	lui	a1,0x10
1c00862e:	0599                	addi	a1,a1,6
1c008630:	0028                	addi	a0,sp,8
1c008632:	41f000ef          	jal	ra,1c009250 <rt_perf_conf>
1c008636:	f14027f3          	csrr	a5,mhartid
1c00863a:	8795                	srai	a5,a5,0x5
1c00863c:	03f7f793          	andi	a5,a5,63
1c008640:	477d                	li	a4,31
1c008642:	14e78763          	beq	a5,a4,1c008790 <main+0x18c>
1c008646:	102007b7          	lui	a5,0x10200
1c00864a:	4705                	li	a4,1
1c00864c:	42e7a023          	sw	a4,1056(a5) # 10200420 <__l1_end+0x20040c>
1c008650:	4781                	li	a5,0
1c008652:	79f79073          	csrw	pccr31,a5
1c008656:	f14027f3          	csrr	a5,mhartid
1c00865a:	8795                	srai	a5,a5,0x5
1c00865c:	03f7f793          	andi	a5,a5,63
1c008660:	477d                	li	a4,31
1c008662:	14e78b63          	beq	a5,a4,1c0087b8 <main+0x1b4>
1c008666:	102007b7          	lui	a5,0x10200
1c00866a:	4705                	li	a4,1
1c00866c:	40e7ac23          	sw	a4,1048(a5) # 10200418 <__l1_end+0x200404>
1c008670:	478d                	li	a5,3
1c008672:	7a179073          	csrw	pcmr,a5
1c008676:	1c0115b7          	lui	a1,0x1c011
1c00867a:	1c012537          	lui	a0,0x1c012
1c00867e:	87a6                	mv	a5,s1
1c008680:	02000713          	li	a4,32
1c008684:	02000693          	li	a3,32
1c008688:	02000613          	li	a2,32
1c00868c:	16858593          	addi	a1,a1,360 # 1c011168 <m_b>
1c008690:	16850513          	addi	a0,a0,360 # 1c012168 <m_a>
1c008694:	2a15                	jal	1c0087c8 <plp_mat_mult_i32s_rv32im>
1c008696:	f14027f3          	csrr	a5,mhartid
1c00869a:	8795                	srai	a5,a5,0x5
1c00869c:	03f7f793          	andi	a5,a5,63
1c0086a0:	477d                	li	a4,31
1c0086a2:	10e78363          	beq	a5,a4,1c0087a8 <main+0x1a4>
1c0086a6:	102007b7          	lui	a5,0x10200
1c0086aa:	4007a023          	sw	zero,1024(a5) # 10200400 <__l1_end+0x2003ec>
1c0086ae:	4781                	li	a5,0
1c0086b0:	7a179073          	csrw	pcmr,a5
1c0086b4:	1c010937          	lui	s2,0x1c010
1c0086b8:	16890913          	addi	s2,s2,360 # 1c010168 <__cluster_text_end>
1c0086bc:	4401                	li	s0,0
1c0086be:	1c000a37          	lui	s4,0x1c000
1c0086c2:	40000993          	li	s3,1024
1c0086c6:	4098                	lw	a4,0(s1)
1c0086c8:	00092783          	lw	a5,0(s2)
1c0086cc:	85a2                	mv	a1,s0
1c0086ce:	863a                	mv	a2,a4
1c0086d0:	0405                	addi	s0,s0,1
1c0086d2:	86be                	mv	a3,a5
1c0086d4:	47ca0513          	addi	a0,s4,1148 # 1c00047c <__DTOR_END__+0x190>
1c0086d8:	00f70463          	beq	a4,a5,1c0086e0 <main+0xdc>
1c0086dc:	1f8020ef          	jal	ra,1c00a8d4 <printf>
1c0086e0:	0491                	addi	s1,s1,4
1c0086e2:	0911                	addi	s2,s2,4
1c0086e4:	ff3411e3          	bne	s0,s3,1c0086c6 <main+0xc2>
1c0086e8:	1c000537          	lui	a0,0x1c000
1c0086ec:	4b450513          	addi	a0,a0,1204 # 1c0004b4 <__DTOR_END__+0x1c8>
1c0086f0:	0e4020ef          	jal	ra,1c00a7d4 <puts>
1c0086f4:	f14027f3          	csrr	a5,mhartid
1c0086f8:	8795                	srai	a5,a5,0x5
1c0086fa:	03f7f793          	andi	a5,a5,63
1c0086fe:	477d                	li	a4,31
1c008700:	0ae78063          	beq	a5,a4,1c0087a0 <main+0x19c>
1c008704:	102007b7          	lui	a5,0x10200
1c008708:	4087a483          	lw	s1,1032(a5) # 10200408 <__l1_end+0x2003f4>
1c00870c:	4505                	li	a0,1
1c00870e:	350d                	jal	1c008530 <cpu_perf_get>
1c008710:	842a                	mv	s0,a0
1c008712:	4509                	li	a0,2
1c008714:	3d31                	jal	1c008530 <cpu_perf_get>
1c008716:	892a                	mv	s2,a0
1c008718:	1c000537          	lui	a0,0x1c000
1c00871c:	85a6                	mv	a1,s1
1c00871e:	4c850513          	addi	a0,a0,1224 # 1c0004c8 <__DTOR_END__+0x1dc>
1c008722:	1b2020ef          	jal	ra,1c00a8d4 <printf>
1c008726:	1c000537          	lui	a0,0x1c000
1c00872a:	85a2                	mv	a1,s0
1c00872c:	4dc50513          	addi	a0,a0,1244 # 1c0004dc <__DTOR_END__+0x1f0>
1c008730:	1a4020ef          	jal	ra,1c00a8d4 <printf>
1c008734:	1c000537          	lui	a0,0x1c000
1c008738:	85ca                	mv	a1,s2
1c00873a:	4f050513          	addi	a0,a0,1264 # 1c0004f0 <__DTOR_END__+0x204>
1c00873e:	196020ef          	jal	ra,1c00a8d4 <printf>
1c008742:	1c000537          	lui	a0,0x1c000
1c008746:	65c1                	lui	a1,0x10
1c008748:	50050513          	addi	a0,a0,1280 # 1c000500 <__DTOR_END__+0x214>
1c00874c:	188020ef          	jal	ra,1c00a8d4 <printf>
1c008750:	006409b7          	lui	s3,0x640
1c008754:	6941                	lui	s2,0x10
1c008756:	0289d633          	divu	a2,s3,s0
1c00875a:	1c000537          	lui	a0,0x1c000
1c00875e:	51050513          	addi	a0,a0,1296 # 1c000510 <__DTOR_END__+0x224>
1c008762:	028955b3          	divu	a1,s2,s0
1c008766:	16e020ef          	jal	ra,1c00a8d4 <printf>
1c00876a:	0299d633          	divu	a2,s3,s1
1c00876e:	1c000537          	lui	a0,0x1c000
1c008772:	53050513          	addi	a0,a0,1328 # 1c000530 <__DTOR_END__+0x244>
1c008776:	029955b3          	divu	a1,s2,s1
1c00877a:	15a020ef          	jal	ra,1c00a8d4 <printf>
1c00877e:	50b6                	lw	ra,108(sp)
1c008780:	5426                	lw	s0,104(sp)
1c008782:	5496                	lw	s1,100(sp)
1c008784:	5906                	lw	s2,96(sp)
1c008786:	49f6                	lw	s3,92(sp)
1c008788:	4a66                	lw	s4,88(sp)
1c00878a:	4501                	li	a0,0
1c00878c:	6165                	addi	sp,sp,112
1c00878e:	8082                	ret
1c008790:	1a10b7b7          	lui	a5,0x1a10b
1c008794:	4705                	li	a4,1
1c008796:	d398                	sw	a4,32(a5)
1c008798:	4781                	li	a5,0
1c00879a:	79f79073          	csrw	pccr31,a5
1c00879e:	bd65                	j	1c008656 <main+0x52>
1c0087a0:	1a10b7b7          	lui	a5,0x1a10b
1c0087a4:	4784                	lw	s1,8(a5)
1c0087a6:	b79d                	j	1c00870c <main+0x108>
1c0087a8:	1a10b7b7          	lui	a5,0x1a10b
1c0087ac:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa10afec>
1c0087b0:	4781                	li	a5,0
1c0087b2:	7a179073          	csrw	pcmr,a5
1c0087b6:	bdfd                	j	1c0086b4 <main+0xb0>
1c0087b8:	1a10b7b7          	lui	a5,0x1a10b
1c0087bc:	4705                	li	a4,1
1c0087be:	cf98                	sw	a4,24(a5)
1c0087c0:	478d                	li	a5,3
1c0087c2:	7a179073          	csrw	pcmr,a5
1c0087c6:	bd45                	j	1c008676 <main+0x72>

1c0087c8 <plp_mat_mult_i32s_rv32im>:
1c0087c8:	711d                	addi	sp,sp,-96
1c0087ca:	d232                	sw	a2,36(sp)
1c0087cc:	8205                	srli	a2,a2,0x1
1c0087ce:	cea2                	sw	s0,92(sp)
1c0087d0:	cca6                	sw	s1,88(sp)
1c0087d2:	caca                	sw	s2,84(sp)
1c0087d4:	c8ce                	sw	s3,80(sp)
1c0087d6:	c6d2                	sw	s4,76(sp)
1c0087d8:	c4d6                	sw	s5,72(sp)
1c0087da:	c2da                	sw	s6,68(sp)
1c0087dc:	c0de                	sw	s7,64(sp)
1c0087de:	de62                	sw	s8,60(sp)
1c0087e0:	dc66                	sw	s9,56(sp)
1c0087e2:	da6a                	sw	s10,52(sp)
1c0087e4:	d86e                	sw	s11,48(sp)
1c0087e6:	c832                	sw	a2,16(sp)
1c0087e8:	d02a                	sw	a0,32(sp)
1c0087ea:	cc2e                	sw	a1,24(sp)
1c0087ec:	ce3a                	sw	a4,28(sp)
1c0087ee:	d43e                	sw	a5,40(sp)
1c0087f0:	ca7d                	beqz	a2,1c0088e6 <plp_mat_mult_i32s_rv32im+0x11e>
1c0087f2:	863a                	mv	a2,a4
1c0087f4:	0016dc13          	srli	s8,a3,0x1
1c0087f8:	8305                	srli	a4,a4,0x1
1c0087fa:	00371d93          	slli	s11,a4,0x3
1c0087fe:	ca3a                	sw	a4,20(sp)
1c008800:	00269c93          	slli	s9,a3,0x2
1c008804:	003c1a13          	slli	s4,s8,0x3
1c008808:	00369713          	slli	a4,a3,0x3
1c00880c:	00361993          	slli	s3,a2,0x3
1c008810:	c23e                	sw	a5,4(sp)
1c008812:	c63a                	sw	a4,12(sp)
1c008814:	8d2a                	mv	s10,a0
1c008816:	9caa                	add	s9,s9,a0
1c008818:	9a2a                	add	s4,s4,a0
1c00881a:	00261b93          	slli	s7,a2,0x2
1c00881e:	9dae                	add	s11,s11,a1
1c008820:	c402                	sw	zero,8(sp)
1c008822:	d636                	sw	a3,44(sp)
1c008824:	4752                	lw	a4,20(sp)
1c008826:	24070863          	beqz	a4,1c008a76 <plp_mat_mult_i32s_rv32im+0x2ae>
1c00882a:	4792                	lw	a5,4(sp)
1c00882c:	4962                	lw	s2,24(sp)
1c00882e:	00fb8b33          	add	s6,s7,a5
1c008832:	8abe                	mv	s5,a5
1c008834:	220c0b63          	beqz	s8,1c008a6a <plp_mat_mult_i32s_rv32im+0x2a2>
1c008838:	012b8fb3          	add	t6,s7,s2
1c00883c:	8f4a                	mv	t5,s2
1c00883e:	8ee6                	mv	t4,s9
1c008840:	886a                	mv	a6,s10
1c008842:	4581                	li	a1,0
1c008844:	4301                	li	t1,0
1c008846:	4881                	li	a7,0
1c008848:	4e01                	li	t3,0
1c00884a:	00082403          	lw	s0,0(a6)
1c00884e:	000ea603          	lw	a2,0(t4)
1c008852:	000f2283          	lw	t0,0(t5)
1c008856:	004f2383          	lw	t2,4(t5)
1c00885a:	00482683          	lw	a3,4(a6)
1c00885e:	025404b3          	mul	s1,s0,t0
1c008862:	004ea783          	lw	a5,4(t4)
1c008866:	000fa703          	lw	a4,0(t6)
1c00886a:	004fa503          	lw	a0,4(t6)
1c00886e:	0821                	addi	a6,a6,8
1c008870:	0ea1                	addi	t4,t4,8
1c008872:	9f4e                	add	t5,t5,s3
1c008874:	9fce                	add	t6,t6,s3
1c008876:	025602b3          	mul	t0,a2,t0
1c00887a:	9e26                	add	t3,t3,s1
1c00887c:	02740433          	mul	s0,s0,t2
1c008880:	9316                	add	t1,t1,t0
1c008882:	02760633          	mul	a2,a2,t2
1c008886:	98a2                	add	a7,a7,s0
1c008888:	02e682b3          	mul	t0,a3,a4
1c00888c:	962e                	add	a2,a2,a1
1c00888e:	02e78733          	mul	a4,a5,a4
1c008892:	9e16                	add	t3,t3,t0
1c008894:	02a686b3          	mul	a3,a3,a0
1c008898:	933a                	add	t1,t1,a4
1c00889a:	02a787b3          	mul	a5,a5,a0
1c00889e:	98b6                	add	a7,a7,a3
1c0088a0:	00c785b3          	add	a1,a5,a2
1c0088a4:	fb0a13e3          	bne	s4,a6,1c00884a <plp_mat_mult_i32s_rv32im+0x82>
1c0088a8:	8862                	mv	a6,s8
1c0088aa:	01caa023          	sw	t3,0(s5)
1c0088ae:	011aa223          	sw	a7,4(s5)
1c0088b2:	006b2023          	sw	t1,0(s6)
1c0088b6:	00bb2223          	sw	a1,4(s6)
1c0088ba:	0921                	addi	s2,s2,8
1c0088bc:	0aa1                	addi	s5,s5,8
1c0088be:	0b21                	addi	s6,s6,8
1c0088c0:	f72d9ae3          	bne	s11,s2,1c008834 <plp_mat_mult_i32s_rv32im+0x6c>
1c0088c4:	4fd2                	lw	t6,20(sp)
1c0088c6:	4612                	lw	a2,4(sp)
1c0088c8:	47a2                	lw	a5,8(sp)
1c0088ca:	4732                	lw	a4,12(sp)
1c0088cc:	964e                	add	a2,a2,s3
1c0088ce:	c232                	sw	a2,4(sp)
1c0088d0:	4642                	lw	a2,16(sp)
1c0088d2:	0785                	addi	a5,a5,1
1c0088d4:	c43e                	sw	a5,8(sp)
1c0088d6:	9d3a                	add	s10,s10,a4
1c0088d8:	9cba                	add	s9,s9,a4
1c0088da:	9a3a                	add	s4,s4,a4
1c0088dc:	f4c794e3          	bne	a5,a2,1c008824 <plp_mat_mult_i32s_rv32im+0x5c>
1c0088e0:	56b2                	lw	a3,44(sp)
1c0088e2:	0606                	slli	a2,a2,0x1
1c0088e4:	c832                	sw	a2,16(sp)
1c0088e6:	5612                	lw	a2,36(sp)
1c0088e8:	4742                	lw	a4,16(sp)
1c0088ea:	0806                	slli	a6,a6,0x1
1c0088ec:	0f86                	slli	t6,t6,0x1
1c0088ee:	18e60e63          	beq	a2,a4,1c008a8a <plp_mat_mult_i32s_rv32im+0x2c2>
1c0088f2:	18d80463          	beq	a6,a3,1c008a7a <plp_mat_mult_i32s_rv32im+0x2b2>
1c0088f6:	4642                	lw	a2,16(sp)
1c0088f8:	18060163          	beqz	a2,1c008a7a <plp_mat_mult_i32s_rv32im+0x2b2>
1c0088fc:	060f8d63          	beqz	t6,1c008976 <plp_mat_mult_i32s_rv32im+0x1ae>
1c008900:	4772                	lw	a4,28(sp)
1c008902:	89b2                	mv	s3,a2
1c008904:	5602                	lw	a2,32(sp)
1c008906:	00271893          	slli	a7,a4,0x2
1c00890a:	031804b3          	mul	s1,a6,a7
1c00890e:	00269393          	slli	t2,a3,0x2
1c008912:	00281f13          	slli	t5,a6,0x2
1c008916:	57a2                	lw	a5,40(sp)
1c008918:	9f32                	add	t5,t5,a2
1c00891a:	00760533          	add	a0,a2,t2
1c00891e:	4662                	lw	a2,24(sp)
1c008920:	002f9e93          	slli	t4,t6,0x2
1c008924:	41f00433          	neg	s0,t6
1c008928:	9ebe                	add	t4,t4,a5
1c00892a:	040a                	slli	s0,s0,0x2
1c00892c:	4281                	li	t0,0
1c00892e:	94b2                	add	s1,s1,a2
1c008930:	01d40e33          	add	t3,s0,t4
1c008934:	8926                	mv	s2,s1
1c008936:	4601                	li	a2,0
1c008938:	02d87063          	bleu	a3,a6,1c008958 <plp_mat_mult_i32s_rv32im+0x190>
1c00893c:	85ca                	mv	a1,s2
1c00893e:	877a                	mv	a4,t5
1c008940:	4601                	li	a2,0
1c008942:	431c                	lw	a5,0(a4)
1c008944:	0005a303          	lw	t1,0(a1) # 10000 <__l1_heap_size+0x14>
1c008948:	0711                	addi	a4,a4,4
1c00894a:	95c6                	add	a1,a1,a7
1c00894c:	026787b3          	mul	a5,a5,t1
1c008950:	97b2                	add	a5,a5,a2
1c008952:	963e                	add	a2,a2,a5
1c008954:	fee517e3          	bne	a0,a4,1c008942 <plp_mat_mult_i32s_rv32im+0x17a>
1c008958:	000e2783          	lw	a5,0(t3)
1c00895c:	0e11                	addi	t3,t3,4
1c00895e:	0911                	addi	s2,s2,4
1c008960:	963e                	add	a2,a2,a5
1c008962:	fece2e23          	sw	a2,-4(t3)
1c008966:	fdce98e3          	bne	t4,t3,1c008936 <plp_mat_mult_i32s_rv32im+0x16e>
1c00896a:	0285                	addi	t0,t0,1
1c00896c:	9ec6                	add	t4,t4,a7
1c00896e:	9f1e                	add	t5,t5,t2
1c008970:	951e                	add	a0,a0,t2
1c008972:	fb329fe3          	bne	t0,s3,1c008930 <plp_mat_mult_i32s_rv32im+0x168>
1c008976:	4772                	lw	a4,28(sp)
1c008978:	06ef8263          	beq	t6,a4,1c0089dc <plp_mat_mult_i32s_rv32im+0x214>
1c00897c:	06eff063          	bleu	a4,t6,1c0089dc <plp_mat_mult_i32s_rv32im+0x214>
1c008980:	4662                	lw	a2,24(sp)
1c008982:	57a2                	lw	a5,40(sp)
1c008984:	5e82                	lw	t4,32(sp)
1c008986:	44c2                	lw	s1,16(sp)
1c008988:	0f8a                	slli	t6,t6,0x2
1c00898a:	00271893          	slli	a7,a4,0x2
1c00898e:	00269393          	slli	t2,a3,0x2
1c008992:	01f782b3          	add	t0,a5,t6
1c008996:	01f60433          	add	s0,a2,t6
1c00899a:	007e8833          	add	a6,t4,t2
1c00899e:	01160f33          	add	t5,a2,a7
1c0089a2:	4f81                	li	t6,0
1c0089a4:	8322                	mv	t1,s0
1c0089a6:	8e16                	mv	t3,t0
1c0089a8:	4581                	li	a1,0
1c0089aa:	ce89                	beqz	a3,1c0089c4 <plp_mat_mult_i32s_rv32im+0x1fc>
1c0089ac:	861a                	mv	a2,t1
1c0089ae:	87f6                	mv	a5,t4
1c0089b0:	4581                	li	a1,0
1c0089b2:	4398                	lw	a4,0(a5)
1c0089b4:	4208                	lw	a0,0(a2)
1c0089b6:	0791                	addi	a5,a5,4
1c0089b8:	9646                	add	a2,a2,a7
1c0089ba:	02a70733          	mul	a4,a4,a0
1c0089be:	95ba                	add	a1,a1,a4
1c0089c0:	fef819e3          	bne	a6,a5,1c0089b2 <plp_mat_mult_i32s_rv32im+0x1ea>
1c0089c4:	00be2023          	sw	a1,0(t3)
1c0089c8:	0311                	addi	t1,t1,4
1c0089ca:	0e11                	addi	t3,t3,4
1c0089cc:	fc6f1ee3          	bne	t5,t1,1c0089a8 <plp_mat_mult_i32s_rv32im+0x1e0>
1c0089d0:	0f85                	addi	t6,t6,1
1c0089d2:	92c6                	add	t0,t0,a7
1c0089d4:	9e9e                	add	t4,t4,t2
1c0089d6:	981e                	add	a6,a6,t2
1c0089d8:	fc9f96e3          	bne	t6,s1,1c0089a4 <plp_mat_mult_i32s_rv32im+0x1dc>
1c0089dc:	5612                	lw	a2,36(sp)
1c0089de:	4742                	lw	a4,16(sp)
1c0089e0:	06c77763          	bleu	a2,a4,1c008a4e <plp_mat_mult_i32s_rv32im+0x286>
1c0089e4:	4672                	lw	a2,28(sp)
1c0089e6:	c625                	beqz	a2,1c008a4e <plp_mat_mult_i32s_rv32im+0x286>
1c0089e8:	00261893          	slli	a7,a2,0x2
1c0089ec:	00269393          	slli	t2,a3,0x2
1c0089f0:	00170293          	addi	t0,a4,1 # 1000001 <__l1_heap_size+0xff0015>
1c0089f4:	03170fb3          	mul	t6,a4,a7
1c0089f8:	4662                	lw	a2,24(sp)
1c0089fa:	4462                	lw	s0,24(sp)
1c0089fc:	5492                	lw	s1,36(sp)
1c0089fe:	01160f33          	add	t5,a2,a7
1c008a02:	5602                	lw	a2,32(sp)
1c008a04:	02770eb3          	mul	t4,a4,t2
1c008a08:	5722                	lw	a4,40(sp)
1c008a0a:	9fba                	add	t6,t6,a4
1c008a0c:	02728833          	mul	a6,t0,t2
1c008a10:	9eb2                	add	t4,t4,a2
1c008a12:	9832                	add	a6,a6,a2
1c008a14:	8322                	mv	t1,s0
1c008a16:	8e7e                	mv	t3,t6
1c008a18:	4581                	li	a1,0
1c008a1a:	ce89                	beqz	a3,1c008a34 <plp_mat_mult_i32s_rv32im+0x26c>
1c008a1c:	861a                	mv	a2,t1
1c008a1e:	87f6                	mv	a5,t4
1c008a20:	4581                	li	a1,0
1c008a22:	4398                	lw	a4,0(a5)
1c008a24:	4208                	lw	a0,0(a2)
1c008a26:	0791                	addi	a5,a5,4
1c008a28:	9646                	add	a2,a2,a7
1c008a2a:	02a70733          	mul	a4,a4,a0
1c008a2e:	95ba                	add	a1,a1,a4
1c008a30:	fef819e3          	bne	a6,a5,1c008a22 <plp_mat_mult_i32s_rv32im+0x25a>
1c008a34:	00be2023          	sw	a1,0(t3)
1c008a38:	0311                	addi	t1,t1,4
1c008a3a:	0e11                	addi	t3,t3,4
1c008a3c:	fc6f1ee3          	bne	t5,t1,1c008a18 <plp_mat_mult_i32s_rv32im+0x250>
1c008a40:	8796                	mv	a5,t0
1c008a42:	9fc6                	add	t6,t6,a7
1c008a44:	9e9e                	add	t4,t4,t2
1c008a46:	981e                	add	a6,a6,t2
1c008a48:	0285                	addi	t0,t0,1
1c008a4a:	fcf495e3          	bne	s1,a5,1c008a14 <plp_mat_mult_i32s_rv32im+0x24c>
1c008a4e:	4476                	lw	s0,92(sp)
1c008a50:	44e6                	lw	s1,88(sp)
1c008a52:	4956                	lw	s2,84(sp)
1c008a54:	49c6                	lw	s3,80(sp)
1c008a56:	4a36                	lw	s4,76(sp)
1c008a58:	4aa6                	lw	s5,72(sp)
1c008a5a:	4b16                	lw	s6,68(sp)
1c008a5c:	4b86                	lw	s7,64(sp)
1c008a5e:	5c72                	lw	s8,60(sp)
1c008a60:	5ce2                	lw	s9,56(sp)
1c008a62:	5d52                	lw	s10,52(sp)
1c008a64:	5dc2                	lw	s11,48(sp)
1c008a66:	6125                	addi	sp,sp,96
1c008a68:	8082                	ret
1c008a6a:	4801                	li	a6,0
1c008a6c:	4581                	li	a1,0
1c008a6e:	4301                	li	t1,0
1c008a70:	4881                	li	a7,0
1c008a72:	4e01                	li	t3,0
1c008a74:	bd1d                	j	1c0088aa <plp_mat_mult_i32s_rv32im+0xe2>
1c008a76:	4f81                	li	t6,0
1c008a78:	b5b9                	j	1c0088c6 <plp_mat_mult_i32s_rv32im+0xfe>
1c008a7a:	4772                	lw	a4,28(sp)
1c008a7c:	f6ef80e3          	beq	t6,a4,1c0089dc <plp_mat_mult_i32s_rv32im+0x214>
1c008a80:	4642                	lw	a2,16(sp)
1c008a82:	de29                	beqz	a2,1c0089dc <plp_mat_mult_i32s_rv32im+0x214>
1c008a84:	eeefeee3          	bltu	t6,a4,1c008980 <plp_mat_mult_i32s_rv32im+0x1b8>
1c008a88:	bf91                	j	1c0089dc <plp_mat_mult_i32s_rv32im+0x214>
1c008a8a:	e6d816e3          	bne	a6,a3,1c0088f6 <plp_mat_mult_i32s_rv32im+0x12e>
1c008a8e:	4772                	lw	a4,28(sp)
1c008a90:	faef8fe3          	beq	t6,a4,1c008a4e <plp_mat_mult_i32s_rv32im+0x286>
1c008a94:	de4d                	beqz	a2,1c008a4e <plp_mat_mult_i32s_rv32im+0x286>
1c008a96:	eeefe5e3          	bltu	t6,a4,1c008980 <plp_mat_mult_i32s_rv32im+0x1b8>
1c008a9a:	b789                	j	1c0089dc <plp_mat_mult_i32s_rv32im+0x214>

1c008a9c <rt_user_alloc_init>:
1c008a9c:	00758793          	addi	a5,a1,7
1c008aa0:	9be1                	andi	a5,a5,-8
1c008aa2:	40b785b3          	sub	a1,a5,a1
1c008aa6:	c11c                	sw	a5,0(a0)
1c008aa8:	8e0d                	sub	a2,a2,a1
1c008aaa:	00c05663          	blez	a2,1c008ab6 <rt_user_alloc_init+0x1a>
1c008aae:	9a61                	andi	a2,a2,-8
1c008ab0:	c390                	sw	a2,0(a5)
1c008ab2:	0007a223          	sw	zero,4(a5) # 1a10b004 <__l1_end+0xa10aff0>
1c008ab6:	8082                	ret

1c008ab8 <rt_user_alloc>:
1c008ab8:	411c                	lw	a5,0(a0)
1c008aba:	059d                	addi	a1,a1,7
1c008abc:	99e1                	andi	a1,a1,-8
1c008abe:	4681                	li	a3,0
1c008ac0:	cb89                	beqz	a5,1c008ad2 <rt_user_alloc+0x1a>
1c008ac2:	4398                	lw	a4,0(a5)
1c008ac4:	00b74963          	blt	a4,a1,1c008ad6 <rt_user_alloc+0x1e>
1c008ac8:	00b71c63          	bne	a4,a1,1c008ae0 <rt_user_alloc+0x28>
1c008acc:	43d8                	lw	a4,4(a5)
1c008ace:	c699                	beqz	a3,1c008adc <rt_user_alloc+0x24>
1c008ad0:	c2d8                	sw	a4,4(a3)
1c008ad2:	853e                	mv	a0,a5
1c008ad4:	8082                	ret
1c008ad6:	86be                	mv	a3,a5
1c008ad8:	43dc                	lw	a5,4(a5)
1c008ada:	b7dd                	j	1c008ac0 <rt_user_alloc+0x8>
1c008adc:	c118                	sw	a4,0(a0)
1c008ade:	bfd5                	j	1c008ad2 <rt_user_alloc+0x1a>
1c008ae0:	8f0d                	sub	a4,a4,a1
1c008ae2:	c398                	sw	a4,0(a5)
1c008ae4:	97ba                	add	a5,a5,a4
1c008ae6:	b7f5                	j	1c008ad2 <rt_user_alloc+0x1a>

1c008ae8 <rt_user_free>:
1c008ae8:	411c                	lw	a5,0(a0)
1c008aea:	061d                	addi	a2,a2,7
1c008aec:	9a61                	andi	a2,a2,-8
1c008aee:	4701                	li	a4,0
1c008af0:	c399                	beqz	a5,1c008af6 <rt_user_free+0xe>
1c008af2:	02b7e763          	bltu	a5,a1,1c008b20 <rt_user_free+0x38>
1c008af6:	00c586b3          	add	a3,a1,a2
1c008afa:	02d79663          	bne	a5,a3,1c008b26 <rt_user_free+0x3e>
1c008afe:	4394                	lw	a3,0(a5)
1c008b00:	43dc                	lw	a5,4(a5)
1c008b02:	9636                	add	a2,a2,a3
1c008b04:	c190                	sw	a2,0(a1)
1c008b06:	c1dc                	sw	a5,4(a1)
1c008b08:	c31d                	beqz	a4,1c008b2e <rt_user_free+0x46>
1c008b0a:	4314                	lw	a3,0(a4)
1c008b0c:	00d707b3          	add	a5,a4,a3
1c008b10:	00f59d63          	bne	a1,a5,1c008b2a <rt_user_free+0x42>
1c008b14:	419c                	lw	a5,0(a1)
1c008b16:	97b6                	add	a5,a5,a3
1c008b18:	c31c                	sw	a5,0(a4)
1c008b1a:	41dc                	lw	a5,4(a1)
1c008b1c:	c35c                	sw	a5,4(a4)
1c008b1e:	8082                	ret
1c008b20:	873e                	mv	a4,a5
1c008b22:	43dc                	lw	a5,4(a5)
1c008b24:	b7f1                	j	1c008af0 <rt_user_free+0x8>
1c008b26:	c190                	sw	a2,0(a1)
1c008b28:	bff9                	j	1c008b06 <rt_user_free+0x1e>
1c008b2a:	c34c                	sw	a1,4(a4)
1c008b2c:	8082                	ret
1c008b2e:	c10c                	sw	a1,0(a0)
1c008b30:	8082                	ret

1c008b32 <rt_alloc>:
1c008b32:	1101                	addi	sp,sp,-32
1c008b34:	cc22                	sw	s0,24(sp)
1c008b36:	ce06                	sw	ra,28(sp)
1c008b38:	ca26                	sw	s1,20(sp)
1c008b3a:	c84a                	sw	s2,16(sp)
1c008b3c:	c64e                	sw	s3,12(sp)
1c008b3e:	c452                	sw	s4,8(sp)
1c008b40:	4789                	li	a5,2
1c008b42:	842a                	mv	s0,a0
1c008b44:	02a7ed63          	bltu	a5,a0,1c008b7e <rt_alloc+0x4c>
1c008b48:	1c001937          	lui	s2,0x1c001
1c008b4c:	89ae                	mv	s3,a1
1c008b4e:	448d                	li	s1,3
1c008b50:	1f890913          	addi	s2,s2,504 # 1c0011f8 <__rt_alloc_l2>
1c008b54:	4a0d                	li	s4,3
1c008b56:	00241513          	slli	a0,s0,0x2
1c008b5a:	85ce                	mv	a1,s3
1c008b5c:	954a                	add	a0,a0,s2
1c008b5e:	3fa9                	jal	1c008ab8 <rt_user_alloc>
1c008b60:	e519                	bnez	a0,1c008b6e <rt_alloc+0x3c>
1c008b62:	0405                	addi	s0,s0,1
1c008b64:	01441363          	bne	s0,s4,1c008b6a <rt_alloc+0x38>
1c008b68:	4401                	li	s0,0
1c008b6a:	14fd                	addi	s1,s1,-1
1c008b6c:	f4ed                	bnez	s1,1c008b56 <rt_alloc+0x24>
1c008b6e:	40f2                	lw	ra,28(sp)
1c008b70:	4462                	lw	s0,24(sp)
1c008b72:	44d2                	lw	s1,20(sp)
1c008b74:	4942                	lw	s2,16(sp)
1c008b76:	49b2                	lw	s3,12(sp)
1c008b78:	4a22                	lw	s4,8(sp)
1c008b7a:	6105                	addi	sp,sp,32
1c008b7c:	8082                	ret
1c008b7e:	1c0017b7          	lui	a5,0x1c001
1c008b82:	ffd50413          	addi	s0,a0,-3
1c008b86:	1f47a503          	lw	a0,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008b8a:	040a                	slli	s0,s0,0x2
1c008b8c:	40f2                	lw	ra,28(sp)
1c008b8e:	9522                	add	a0,a0,s0
1c008b90:	4462                	lw	s0,24(sp)
1c008b92:	44d2                	lw	s1,20(sp)
1c008b94:	4942                	lw	s2,16(sp)
1c008b96:	49b2                	lw	s3,12(sp)
1c008b98:	4a22                	lw	s4,8(sp)
1c008b9a:	6105                	addi	sp,sp,32
1c008b9c:	bf31                	j	1c008ab8 <rt_user_alloc>

1c008b9e <__rt_alloc_init_l1>:
1c008b9e:	1c0017b7          	lui	a5,0x1c001
1c008ba2:	1f47a703          	lw	a4,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008ba6:	100007b7          	lui	a5,0x10000
1c008baa:	01651593          	slli	a1,a0,0x16
1c008bae:	6641                	lui	a2,0x10
1c008bb0:	050a                	slli	a0,a0,0x2
1c008bb2:	01478793          	addi	a5,a5,20 # 10000014 <__l1_end>
1c008bb6:	fec60613          	addi	a2,a2,-20 # ffec <__l1_heap_size>
1c008bba:	95be                	add	a1,a1,a5
1c008bbc:	953a                	add	a0,a0,a4
1c008bbe:	bdf9                	j	1c008a9c <rt_user_alloc_init>

1c008bc0 <__rt_alloc_init_l1_for_fc>:
1c008bc0:	100005b7          	lui	a1,0x10000
1c008bc4:	01651793          	slli	a5,a0,0x16
1c008bc8:	01458593          	addi	a1,a1,20 # 10000014 <__l1_end>
1c008bcc:	00b78733          	add	a4,a5,a1
1c008bd0:	050a                	slli	a0,a0,0x2
1c008bd2:	0791                	addi	a5,a5,4
1c008bd4:	6641                	lui	a2,0x10
1c008bd6:	1c0016b7          	lui	a3,0x1c001
1c008bda:	fe860613          	addi	a2,a2,-24 # ffe8 <__rt_hyper_pending_emu_stride+0xfd40>
1c008bde:	95be                	add	a1,a1,a5
1c008be0:	953a                	add	a0,a0,a4
1c008be2:	1ee6aa23          	sw	a4,500(a3) # 1c0011f4 <__rt_alloc_l1>
1c008be6:	bd5d                	j	1c008a9c <rt_user_alloc_init>

1c008be8 <__rt_allocs_init>:
1c008be8:	1141                	addi	sp,sp,-16
1c008bea:	1c0015b7          	lui	a1,0x1c001
1c008bee:	c606                	sw	ra,12(sp)
1c008bf0:	24458793          	addi	a5,a1,580 # 1c001244 <__l2_priv0_end>
1c008bf4:	1c008637          	lui	a2,0x1c008
1c008bf8:	06c7ca63          	blt	a5,a2,1c008c6c <__rt_allocs_init+0x84>
1c008bfc:	4581                	li	a1,0
1c008bfe:	4601                	li	a2,0
1c008c00:	1c001537          	lui	a0,0x1c001
1c008c04:	1f850513          	addi	a0,a0,504 # 1c0011f8 <__rt_alloc_l2>
1c008c08:	3d51                	jal	1c008a9c <rt_user_alloc_init>
1c008c0a:	1c00b5b7          	lui	a1,0x1c00b
1c008c0e:	53c58793          	addi	a5,a1,1340 # 1c00b53c <__l2_priv1_end>
1c008c12:	1c010637          	lui	a2,0x1c010
1c008c16:	04c7cf63          	blt	a5,a2,1c008c74 <__rt_allocs_init+0x8c>
1c008c1a:	4581                	li	a1,0
1c008c1c:	4601                	li	a2,0
1c008c1e:	1c001537          	lui	a0,0x1c001
1c008c22:	1fc50513          	addi	a0,a0,508 # 1c0011fc <__rt_alloc_l2+0x4>
1c008c26:	3d9d                	jal	1c008a9c <rt_user_alloc_init>
1c008c28:	1c0135b7          	lui	a1,0x1c013
1c008c2c:	19858793          	addi	a5,a1,408 # 1c013198 <__l2_shared_end>
1c008c30:	1c080637          	lui	a2,0x1c080
1c008c34:	1c001537          	lui	a0,0x1c001
1c008c38:	8e1d                	sub	a2,a2,a5
1c008c3a:	19858593          	addi	a1,a1,408
1c008c3e:	20050513          	addi	a0,a0,512 # 1c001200 <__rt_alloc_l2+0x8>
1c008c42:	3da9                	jal	1c008a9c <rt_user_alloc_init>
1c008c44:	f14027f3          	csrr	a5,mhartid
1c008c48:	8795                	srai	a5,a5,0x5
1c008c4a:	03f7f793          	andi	a5,a5,63
1c008c4e:	e789                	bnez	a5,1c008c58 <__rt_allocs_init+0x70>
1c008c50:	40b2                	lw	ra,12(sp)
1c008c52:	4501                	li	a0,0
1c008c54:	0141                	addi	sp,sp,16
1c008c56:	b7ad                	j	1c008bc0 <__rt_alloc_init_l1_for_fc>
1c008c58:	4591                	li	a1,4
1c008c5a:	4501                	li	a0,0
1c008c5c:	3dd9                	jal	1c008b32 <rt_alloc>
1c008c5e:	40b2                	lw	ra,12(sp)
1c008c60:	1c0017b7          	lui	a5,0x1c001
1c008c64:	1ea7aa23          	sw	a0,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008c68:	0141                	addi	sp,sp,16
1c008c6a:	8082                	ret
1c008c6c:	8e1d                	sub	a2,a2,a5
1c008c6e:	24458593          	addi	a1,a1,580
1c008c72:	b779                	j	1c008c00 <__rt_allocs_init+0x18>
1c008c74:	8e1d                	sub	a2,a2,a5
1c008c76:	53c58593          	addi	a1,a1,1340
1c008c7a:	b755                	j	1c008c1e <__rt_allocs_init+0x36>

1c008c7c <__rt_init_cluster_data>:
1c008c7c:	04050793          	addi	a5,a0,64
1c008c80:	01679693          	slli	a3,a5,0x16
1c008c84:	6705                	lui	a4,0x1
1c008c86:	177d                	addi	a4,a4,-1
1c008c88:	00400793          	li	a5,4
1c008c8c:	8ff9                	and	a5,a5,a4
1c008c8e:	1c013737          	lui	a4,0x1c013
1c008c92:	97b6                	add	a5,a5,a3
1c008c94:	18870713          	addi	a4,a4,392 # 1c013188 <_l1_preload_start_inL2>
1c008c98:	01000613          	li	a2,16
1c008c9c:	8f99                	sub	a5,a5,a4
1c008c9e:	00f705b3          	add	a1,a4,a5
1c008ca2:	02c04b63          	bgtz	a2,1c008cd8 <__rt_init_cluster_data+0x5c>
1c008ca6:	02800713          	li	a4,40
1c008caa:	02e50733          	mul	a4,a0,a4
1c008cae:	1c0017b7          	lui	a5,0x1c001
1c008cb2:	20878513          	addi	a0,a5,520 # 1c001208 <__rt_fc_cluster_data>
1c008cb6:	002017b7          	lui	a5,0x201
1c008cba:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c008cbe:	97b6                	add	a5,a5,a3
1c008cc0:	953a                	add	a0,a0,a4
1c008cc2:	c91c                	sw	a5,16(a0)
1c008cc4:	6705                	lui	a4,0x1
1c008cc6:	00400793          	li	a5,4
1c008cca:	177d                	addi	a4,a4,-1
1c008ccc:	8ff9                	and	a5,a5,a4
1c008cce:	97b6                	add	a5,a5,a3
1c008cd0:	00052423          	sw	zero,8(a0)
1c008cd4:	c95c                	sw	a5,20(a0)
1c008cd6:	8082                	ret
1c008cd8:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008cdc:	1671                	addi	a2,a2,-4
1c008cde:	0711                	addi	a4,a4,4
1c008ce0:	0105a023          	sw	a6,0(a1)
1c008ce4:	bf6d                	j	1c008c9e <__rt_init_cluster_data+0x22>

1c008ce6 <__rt_cluster_mount_step>:
1c008ce6:	7179                	addi	sp,sp,-48
1c008ce8:	d04a                	sw	s2,32(sp)
1c008cea:	ce4e                	sw	s3,28(sp)
1c008cec:	6785                	lui	a5,0x1
1c008cee:	1c0089b7          	lui	s3,0x1c008
1c008cf2:	00400913          	li	s2,4
1c008cf6:	17fd                	addi	a5,a5,-1
1c008cf8:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008cfc:	d422                	sw	s0,40(sp)
1c008cfe:	d606                	sw	ra,44(sp)
1c008d00:	d226                	sw	s1,36(sp)
1c008d02:	cc52                	sw	s4,24(sp)
1c008d04:	842a                	mv	s0,a0
1c008d06:	00f97933          	and	s2,s2,a5
1c008d0a:	f009f993          	andi	s3,s3,-256
1c008d0e:	4c5c                	lw	a5,28(s0)
1c008d10:	4705                	li	a4,1
1c008d12:	02e78d63          	beq	a5,a4,1c008d4c <__rt_cluster_mount_step+0x66>
1c008d16:	4709                	li	a4,2
1c008d18:	0ae78d63          	beq	a5,a4,1c008dd2 <__rt_cluster_mount_step+0xec>
1c008d1c:	e7dd                	bnez	a5,1c008dca <__rt_cluster_mount_step+0xe4>
1c008d1e:	5018                	lw	a4,32(s0)
1c008d20:	00042c23          	sw	zero,24(s0)
1c008d24:	eb01                	bnez	a4,1c008d34 <__rt_cluster_mount_step+0x4e>
1c008d26:	5048                	lw	a0,36(s0)
1c008d28:	006c                	addi	a1,sp,12
1c008d2a:	c602                	sw	zero,12(sp)
1c008d2c:	1e8010ef          	jal	ra,1c009f14 <__rt_pmu_cluster_power_up>
1c008d30:	47b2                	lw	a5,12(sp)
1c008d32:	cc08                	sw	a0,24(s0)
1c008d34:	4c58                	lw	a4,28(s0)
1c008d36:	0705                	addi	a4,a4,1
1c008d38:	cc58                	sw	a4,28(s0)
1c008d3a:	dbf1                	beqz	a5,1c008d0e <__rt_cluster_mount_step+0x28>
1c008d3c:	50b2                	lw	ra,44(sp)
1c008d3e:	5422                	lw	s0,40(sp)
1c008d40:	5492                	lw	s1,36(sp)
1c008d42:	5902                	lw	s2,32(sp)
1c008d44:	49f2                	lw	s3,28(sp)
1c008d46:	4a62                	lw	s4,24(sp)
1c008d48:	6145                	addi	sp,sp,48
1c008d4a:	8082                	ret
1c008d4c:	02042a03          	lw	s4,32(s0)
1c008d50:	040a0493          	addi	s1,s4,64
1c008d54:	04da                	slli	s1,s1,0x16
1c008d56:	00990733          	add	a4,s2,s1
1c008d5a:	00072223          	sw	zero,4(a4)
1c008d5e:	00072423          	sw	zero,8(a4)
1c008d62:	00072023          	sw	zero,0(a4)
1c008d66:	1c001737          	lui	a4,0x1c001
1c008d6a:	0dc72703          	lw	a4,220(a4) # 1c0010dc <__rt_platform>
1c008d6e:	00f70f63          	beq	a4,a5,1c008d8c <__rt_cluster_mount_step+0xa6>
1c008d72:	4505                	li	a0,1
1c008d74:	727000ef          	jal	ra,1c009c9a <__rt_fll_init>
1c008d78:	1c0017b7          	lui	a5,0x1c001
1c008d7c:	23878793          	addi	a5,a5,568 # 1c001238 <__rt_freq_domains>
1c008d80:	43cc                	lw	a1,4(a5)
1c008d82:	c5b1                	beqz	a1,1c008dce <__rt_cluster_mount_step+0xe8>
1c008d84:	4601                	li	a2,0
1c008d86:	4505                	li	a0,1
1c008d88:	0a8010ef          	jal	ra,1c009e30 <rt_freq_set_and_get>
1c008d8c:	8552                	mv	a0,s4
1c008d8e:	35fd                	jal	1c008c7c <__rt_init_cluster_data>
1c008d90:	8552                	mv	a0,s4
1c008d92:	3531                	jal	1c008b9e <__rt_alloc_init_l1>
1c008d94:	002017b7          	lui	a5,0x201
1c008d98:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1414>
1c008d9c:	97a6                	add	a5,a5,s1
1c008d9e:	577d                	li	a4,-1
1c008da0:	c398                	sw	a4,0(a5)
1c008da2:	002007b7          	lui	a5,0x200
1c008da6:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f0054>
1c008daa:	06078793          	addi	a5,a5,96
1c008dae:	9726                	add	a4,a4,s1
1c008db0:	97a6                	add	a5,a5,s1
1c008db2:	01372023          	sw	s3,0(a4)
1c008db6:	0711                	addi	a4,a4,4
1c008db8:	fef71de3          	bne	a4,a5,1c008db2 <__rt_cluster_mount_step+0xcc>
1c008dbc:	002007b7          	lui	a5,0x200
1c008dc0:	07a1                	addi	a5,a5,8
1c008dc2:	94be                	add	s1,s1,a5
1c008dc4:	0ff00793          	li	a5,255
1c008dc8:	c09c                	sw	a5,0(s1)
1c008dca:	4781                	li	a5,0
1c008dcc:	b7a5                	j	1c008d34 <__rt_cluster_mount_step+0x4e>
1c008dce:	c3c8                	sw	a0,4(a5)
1c008dd0:	bf75                	j	1c008d8c <__rt_cluster_mount_step+0xa6>
1c008dd2:	505c                	lw	a5,36(s0)
1c008dd4:	5b98                	lw	a4,48(a5)
1c008dd6:	d398                	sw	a4,32(a5)
1c008dd8:	5798                	lw	a4,40(a5)
1c008dda:	c398                	sw	a4,0(a5)
1c008ddc:	57d8                	lw	a4,44(a5)
1c008dde:	c3d8                	sw	a4,4(a5)
1c008de0:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f0044>
1c008de4:	505c                	lw	a5,36(s0)
1c008de6:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008dea:	0007ac23          	sw	zero,24(a5)
1c008dee:	cb01                	beqz	a4,1c008dfe <__rt_cluster_mount_step+0x118>
1c008df0:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008df4:	cf1c                	sw	a5,24(a4)
1c008df6:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008dfa:	4785                	li	a5,1
1c008dfc:	bf25                	j	1c008d34 <__rt_cluster_mount_step+0x4e>
1c008dfe:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008e02:	bfd5                	j	1c008df6 <__rt_cluster_mount_step+0x110>

1c008e04 <__rt_cluster_init>:
1c008e04:	1c001537          	lui	a0,0x1c001
1c008e08:	1141                	addi	sp,sp,-16
1c008e0a:	02800613          	li	a2,40
1c008e0e:	4581                	li	a1,0
1c008e10:	20850513          	addi	a0,a0,520 # 1c001208 <__rt_fc_cluster_data>
1c008e14:	c606                	sw	ra,12(sp)
1c008e16:	073010ef          	jal	ra,1c00a688 <memset>
1c008e1a:	1c0085b7          	lui	a1,0x1c008
1c008e1e:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008e22:	4505                	li	a0,1
1c008e24:	2bfd                	jal	1c009422 <rt_irq_set_handler>
1c008e26:	f14027f3          	csrr	a5,mhartid
1c008e2a:	8795                	srai	a5,a5,0x5
1c008e2c:	03f7f793          	andi	a5,a5,63
1c008e30:	477d                	li	a4,31
1c008e32:	02e79e63          	bne	a5,a4,1c008e6e <__rt_cluster_init+0x6a>
1c008e36:	1a10a7b7          	lui	a5,0x1a10a
1c008e3a:	4709                	li	a4,2
1c008e3c:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c008e40:	1c0085b7          	lui	a1,0x1c008
1c008e44:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008e48:	4511                	li	a0,4
1c008e4a:	2be1                	jal	1c009422 <rt_irq_set_handler>
1c008e4c:	f14027f3          	csrr	a5,mhartid
1c008e50:	8795                	srai	a5,a5,0x5
1c008e52:	03f7f793          	andi	a5,a5,63
1c008e56:	477d                	li	a4,31
1c008e58:	02e79063          	bne	a5,a4,1c008e78 <__rt_cluster_init+0x74>
1c008e5c:	1a10a7b7          	lui	a5,0x1a10a
1c008e60:	4741                	li	a4,16
1c008e62:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c008e66:	40b2                	lw	ra,12(sp)
1c008e68:	4501                	li	a0,0
1c008e6a:	0141                	addi	sp,sp,16
1c008e6c:	8082                	ret
1c008e6e:	002047b7          	lui	a5,0x204
1c008e72:	4709                	li	a4,2
1c008e74:	cbd8                	sw	a4,20(a5)
1c008e76:	b7e9                	j	1c008e40 <__rt_cluster_init+0x3c>
1c008e78:	002047b7          	lui	a5,0x204
1c008e7c:	4741                	li	a4,16
1c008e7e:	cbd8                	sw	a4,20(a5)
1c008e80:	b7dd                	j	1c008e66 <__rt_cluster_init+0x62>

1c008e82 <pi_cluster_conf_init>:
1c008e82:	00052223          	sw	zero,4(a0)
1c008e86:	8082                	ret

1c008e88 <pi_cluster_open>:
1c008e88:	1101                	addi	sp,sp,-32
1c008e8a:	ce06                	sw	ra,28(sp)
1c008e8c:	cc22                	sw	s0,24(sp)
1c008e8e:	ca26                	sw	s1,20(sp)
1c008e90:	c84a                	sw	s2,16(sp)
1c008e92:	c64e                	sw	s3,12(sp)
1c008e94:	30047973          	csrrci	s2,mstatus,8
1c008e98:	00452983          	lw	s3,4(a0)
1c008e9c:	02800793          	li	a5,40
1c008ea0:	0049a483          	lw	s1,4(s3)
1c008ea4:	02f484b3          	mul	s1,s1,a5
1c008ea8:	1c0017b7          	lui	a5,0x1c001
1c008eac:	20878793          	addi	a5,a5,520 # 1c001208 <__rt_fc_cluster_data>
1c008eb0:	94be                	add	s1,s1,a5
1c008eb2:	c504                	sw	s1,8(a0)
1c008eb4:	3b7000ef          	jal	ra,1c009a6a <__rt_wait_event_prepare_blocking>
1c008eb8:	f14027f3          	csrr	a5,mhartid
1c008ebc:	8795                	srai	a5,a5,0x5
1c008ebe:	03f7f793          	andi	a5,a5,63
1c008ec2:	477d                	li	a4,31
1c008ec4:	842a                	mv	s0,a0
1c008ec6:	04e79463          	bne	a5,a4,1c008f0e <pi_cluster_open+0x86>
1c008eca:	511c                	lw	a5,32(a0)
1c008ecc:	0004ae23          	sw	zero,28(s1)
1c008ed0:	d0c8                	sw	a0,36(s1)
1c008ed2:	d91c                	sw	a5,48(a0)
1c008ed4:	411c                	lw	a5,0(a0)
1c008ed6:	02052223          	sw	zero,36(a0)
1c008eda:	d51c                	sw	a5,40(a0)
1c008edc:	415c                	lw	a5,4(a0)
1c008ede:	c144                	sw	s1,4(a0)
1c008ee0:	d55c                	sw	a5,44(a0)
1c008ee2:	1c0097b7          	lui	a5,0x1c009
1c008ee6:	ce678793          	addi	a5,a5,-794 # 1c008ce6 <__rt_cluster_mount_step>
1c008eea:	c11c                	sw	a5,0(a0)
1c008eec:	4785                	li	a5,1
1c008eee:	d11c                	sw	a5,32(a0)
1c008ef0:	8526                	mv	a0,s1
1c008ef2:	3bd5                	jal	1c008ce6 <__rt_cluster_mount_step>
1c008ef4:	8522                	mv	a0,s0
1c008ef6:	4c5000ef          	jal	ra,1c009bba <__rt_wait_event>
1c008efa:	30091073          	csrw	mstatus,s2
1c008efe:	40f2                	lw	ra,28(sp)
1c008f00:	4462                	lw	s0,24(sp)
1c008f02:	44d2                	lw	s1,20(sp)
1c008f04:	4942                	lw	s2,16(sp)
1c008f06:	49b2                	lw	s3,12(sp)
1c008f08:	4501                	li	a0,0
1c008f0a:	6105                	addi	sp,sp,32
1c008f0c:	8082                	ret
1c008f0e:	0049a483          	lw	s1,4(s3)
1c008f12:	8526                	mv	a0,s1
1c008f14:	33a5                	jal	1c008c7c <__rt_init_cluster_data>
1c008f16:	04048513          	addi	a0,s1,64
1c008f1a:	002017b7          	lui	a5,0x201
1c008f1e:	055a                	slli	a0,a0,0x16
1c008f20:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1414>
1c008f24:	97aa                	add	a5,a5,a0
1c008f26:	577d                	li	a4,-1
1c008f28:	c398                	sw	a4,0(a5)
1c008f2a:	1c0086b7          	lui	a3,0x1c008
1c008f2e:	002007b7          	lui	a5,0x200
1c008f32:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f0058>
1c008f36:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c008f3a:	06078793          	addi	a5,a5,96
1c008f3e:	972a                	add	a4,a4,a0
1c008f40:	97aa                	add	a5,a5,a0
1c008f42:	f006f693          	andi	a3,a3,-256
1c008f46:	c314                	sw	a3,0(a4)
1c008f48:	0711                	addi	a4,a4,4
1c008f4a:	fef71ee3          	bne	a4,a5,1c008f46 <pi_cluster_open+0xbe>
1c008f4e:	002007b7          	lui	a5,0x200
1c008f52:	07a1                	addi	a5,a5,8
1c008f54:	953e                	add	a0,a0,a5
1c008f56:	57fd                	li	a5,-1
1c008f58:	c11c                	sw	a5,0(a0)
1c008f5a:	8522                	mv	a0,s0
1c008f5c:	3db000ef          	jal	ra,1c009b36 <rt_event_push>
1c008f60:	bf51                	j	1c008ef4 <pi_cluster_open+0x6c>

1c008f62 <pi_cluster_close>:
1c008f62:	451c                	lw	a5,8(a0)
1c008f64:	1101                	addi	sp,sp,-32
1c008f66:	cc22                	sw	s0,24(sp)
1c008f68:	5380                	lw	s0,32(a5)
1c008f6a:	1c0017b7          	lui	a5,0x1c001
1c008f6e:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c008f72:	ce06                	sw	ra,28(sp)
1c008f74:	4785                	li	a5,1
1c008f76:	00f70563          	beq	a4,a5,1c008f80 <pi_cluster_close+0x1e>
1c008f7a:	4505                	li	a0,1
1c008f7c:	5d5000ef          	jal	ra,1c009d50 <__rt_fll_deinit>
1c008f80:	c602                	sw	zero,12(sp)
1c008f82:	e409                	bnez	s0,1c008f8c <pi_cluster_close+0x2a>
1c008f84:	006c                	addi	a1,sp,12
1c008f86:	4501                	li	a0,0
1c008f88:	749000ef          	jal	ra,1c009ed0 <__rt_pmu_cluster_power_down>
1c008f8c:	40f2                	lw	ra,28(sp)
1c008f8e:	4462                	lw	s0,24(sp)
1c008f90:	4501                	li	a0,0
1c008f92:	6105                	addi	sp,sp,32
1c008f94:	8082                	ret

1c008f96 <__rt_cluster_push_fc_event>:
1c008f96:	002047b7          	lui	a5,0x204
1c008f9a:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f40d4>
1c008f9e:	0007e703          	p.elw	a4,0(a5)
1c008fa2:	f14027f3          	csrr	a5,mhartid
1c008fa6:	8795                	srai	a5,a5,0x5
1c008fa8:	02800693          	li	a3,40
1c008fac:	03f7f793          	andi	a5,a5,63
1c008fb0:	02d787b3          	mul	a5,a5,a3
1c008fb4:	1c001737          	lui	a4,0x1c001
1c008fb8:	20870713          	addi	a4,a4,520 # 1c001208 <__rt_fc_cluster_data>
1c008fbc:	4689                	li	a3,2
1c008fbe:	97ba                	add	a5,a5,a4
1c008fc0:	00204737          	lui	a4,0x204
1c008fc4:	43d0                	lw	a2,4(a5)
1c008fc6:	ee01                	bnez	a2,1c008fde <__rt_cluster_push_fc_event+0x48>
1c008fc8:	c3c8                	sw	a0,4(a5)
1c008fca:	4709                	li	a4,2
1c008fcc:	1a10a7b7          	lui	a5,0x1a10a
1c008fd0:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1097fc>
1c008fd4:	002047b7          	lui	a5,0x204
1c008fd8:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f40d4>
1c008fdc:	8082                	ret
1c008fde:	c714                	sw	a3,8(a4)
1c008fe0:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c008fe4:	c354                	sw	a3,4(a4)
1c008fe6:	bff9                	j	1c008fc4 <__rt_cluster_push_fc_event+0x2e>

1c008fe8 <__rt_cluster_new>:
1c008fe8:	1c0095b7          	lui	a1,0x1c009
1c008fec:	1141                	addi	sp,sp,-16
1c008fee:	4601                	li	a2,0
1c008ff0:	e0458593          	addi	a1,a1,-508 # 1c008e04 <__rt_cluster_init>
1c008ff4:	4501                	li	a0,0
1c008ff6:	c606                	sw	ra,12(sp)
1c008ff8:	2b6d                	jal	1c0095b2 <__rt_cbsys_add>
1c008ffa:	c105                	beqz	a0,1c00901a <__rt_cluster_new+0x32>
1c008ffc:	f1402673          	csrr	a2,mhartid
1c009000:	1c000537          	lui	a0,0x1c000
1c009004:	40565593          	srai	a1,a2,0x5
1c009008:	03f5f593          	andi	a1,a1,63
1c00900c:	8a7d                	andi	a2,a2,31
1c00900e:	55850513          	addi	a0,a0,1368 # 1c000558 <__DTOR_END__+0x26c>
1c009012:	0c3010ef          	jal	ra,1c00a8d4 <printf>
1c009016:	04b010ef          	jal	ra,1c00a860 <abort>
1c00901a:	40b2                	lw	ra,12(sp)
1c00901c:	0141                	addi	sp,sp,16
1c00901e:	8082                	ret

1c009020 <__rt_cluster_pulpos_emu_init>:
1c009020:	1141                	addi	sp,sp,-16
1c009022:	45b1                	li	a1,12
1c009024:	4501                	li	a0,0
1c009026:	c606                	sw	ra,12(sp)
1c009028:	3629                	jal	1c008b32 <rt_alloc>
1c00902a:	1c0017b7          	lui	a5,0x1c001
1c00902e:	1ca7a423          	sw	a0,456(a5) # 1c0011c8 <__rt_fc_cluster_device>
1c009032:	e105                	bnez	a0,1c009052 <__rt_cluster_pulpos_emu_init+0x32>
1c009034:	f1402673          	csrr	a2,mhartid
1c009038:	1c000537          	lui	a0,0x1c000
1c00903c:	40565593          	srai	a1,a2,0x5
1c009040:	03f5f593          	andi	a1,a1,63
1c009044:	8a7d                	andi	a2,a2,31
1c009046:	5a050513          	addi	a0,a0,1440 # 1c0005a0 <__DTOR_END__+0x2b4>
1c00904a:	08b010ef          	jal	ra,1c00a8d4 <printf>
1c00904e:	013010ef          	jal	ra,1c00a860 <abort>
1c009052:	40b2                	lw	ra,12(sp)
1c009054:	0141                	addi	sp,sp,16
1c009056:	8082                	ret

1c009058 <rt_cluster_call>:
1c009058:	7139                	addi	sp,sp,-64
1c00905a:	d84a                	sw	s2,48(sp)
1c00905c:	4906                	lw	s2,64(sp)
1c00905e:	dc22                	sw	s0,56(sp)
1c009060:	842e                	mv	s0,a1
1c009062:	de06                	sw	ra,60(sp)
1c009064:	da26                	sw	s1,52(sp)
1c009066:	d64e                	sw	s3,44(sp)
1c009068:	300479f3          	csrrci	s3,mstatus,8
1c00906c:	84ca                	mv	s1,s2
1c00906e:	02091163          	bnez	s2,1c009090 <rt_cluster_call+0x38>
1c009072:	ce32                	sw	a2,28(sp)
1c009074:	cc36                	sw	a3,24(sp)
1c009076:	ca3a                	sw	a4,20(sp)
1c009078:	c83e                	sw	a5,16(sp)
1c00907a:	c642                	sw	a6,12(sp)
1c00907c:	c446                	sw	a7,8(sp)
1c00907e:	1ed000ef          	jal	ra,1c009a6a <__rt_wait_event_prepare_blocking>
1c009082:	48a2                	lw	a7,8(sp)
1c009084:	4832                	lw	a6,12(sp)
1c009086:	47c2                	lw	a5,16(sp)
1c009088:	4752                	lw	a4,20(sp)
1c00908a:	46e2                	lw	a3,24(sp)
1c00908c:	4672                	lw	a2,28(sp)
1c00908e:	84aa                	mv	s1,a0
1c009090:	4531                	li	a0,12
1c009092:	02a40433          	mul	s0,s0,a0
1c009096:	1c0015b7          	lui	a1,0x1c001
1c00909a:	10058313          	addi	t1,a1,256 # 1c001100 <__rt_pulpos_emu_global_cluster_task>
1c00909e:	00f32623          	sw	a5,12(t1)
1c0090a2:	1c0017b7          	lui	a5,0x1c001
1c0090a6:	1c87a503          	lw	a0,456(a5) # 1c0011c8 <__rt_fc_cluster_device>
1c0090aa:	00c32023          	sw	a2,0(t1)
1c0090ae:	10058593          	addi	a1,a1,256
1c0090b2:	8626                	mv	a2,s1
1c0090b4:	00d32223          	sw	a3,4(t1)
1c0090b8:	9522                	add	a0,a0,s0
1c0090ba:	00e32423          	sw	a4,8(t1)
1c0090be:	01032823          	sw	a6,16(t1)
1c0090c2:	01132a23          	sw	a7,20(t1)
1c0090c6:	2041                	jal	1c009146 <pi_cluster_send_task_to_cl_async>
1c0090c8:	842a                	mv	s0,a0
1c0090ca:	cd01                	beqz	a0,1c0090e2 <rt_cluster_call+0x8a>
1c0090cc:	30099073          	csrw	mstatus,s3
1c0090d0:	547d                	li	s0,-1
1c0090d2:	8522                	mv	a0,s0
1c0090d4:	50f2                	lw	ra,60(sp)
1c0090d6:	5462                	lw	s0,56(sp)
1c0090d8:	54d2                	lw	s1,52(sp)
1c0090da:	5942                	lw	s2,48(sp)
1c0090dc:	59b2                	lw	s3,44(sp)
1c0090de:	6121                	addi	sp,sp,64
1c0090e0:	8082                	ret
1c0090e2:	00091563          	bnez	s2,1c0090ec <rt_cluster_call+0x94>
1c0090e6:	8526                	mv	a0,s1
1c0090e8:	2d3000ef          	jal	ra,1c009bba <__rt_wait_event>
1c0090ec:	30099073          	csrw	mstatus,s3
1c0090f0:	b7cd                	j	1c0090d2 <rt_cluster_call+0x7a>

1c0090f2 <rt_cluster_mount>:
1c0090f2:	7139                	addi	sp,sp,-64
1c0090f4:	dc22                	sw	s0,56(sp)
1c0090f6:	da26                	sw	s1,52(sp)
1c0090f8:	d84a                	sw	s2,48(sp)
1c0090fa:	4431                	li	s0,12
1c0090fc:	1c0014b7          	lui	s1,0x1c001
1c009100:	de06                	sw	ra,60(sp)
1c009102:	d64e                	sw	s3,44(sp)
1c009104:	8936                	mv	s2,a3
1c009106:	02858433          	mul	s0,a1,s0
1c00910a:	1c848493          	addi	s1,s1,456 # 1c0011c8 <__rt_fc_cluster_device>
1c00910e:	c905                	beqz	a0,1c00913e <rt_cluster_mount+0x4c>
1c009110:	0068                	addi	a0,sp,12
1c009112:	89ae                	mv	s3,a1
1c009114:	33bd                	jal	1c008e82 <pi_cluster_conf_init>
1c009116:	4088                	lw	a0,0(s1)
1c009118:	006c                	addi	a1,sp,12
1c00911a:	9522                	add	a0,a0,s0
1c00911c:	2609                	jal	1c00941e <pi_open_from_conf>
1c00911e:	4088                	lw	a0,0(s1)
1c009120:	c84e                	sw	s3,16(sp)
1c009122:	9522                	add	a0,a0,s0
1c009124:	3395                	jal	1c008e88 <pi_cluster_open>
1c009126:	00090563          	beqz	s2,1c009130 <rt_cluster_mount+0x3e>
1c00912a:	854a                	mv	a0,s2
1c00912c:	20b000ef          	jal	ra,1c009b36 <rt_event_push>
1c009130:	50f2                	lw	ra,60(sp)
1c009132:	5462                	lw	s0,56(sp)
1c009134:	54d2                	lw	s1,52(sp)
1c009136:	5942                	lw	s2,48(sp)
1c009138:	59b2                	lw	s3,44(sp)
1c00913a:	6121                	addi	sp,sp,64
1c00913c:	8082                	ret
1c00913e:	4088                	lw	a0,0(s1)
1c009140:	9522                	add	a0,a0,s0
1c009142:	3505                	jal	1c008f62 <pi_cluster_close>
1c009144:	b7cd                	j	1c009126 <rt_cluster_mount+0x34>

1c009146 <pi_cluster_send_task_to_cl_async>:
1c009146:	1101                	addi	sp,sp,-32
1c009148:	ca26                	sw	s1,20(sp)
1c00914a:	4504                	lw	s1,8(a0)
1c00914c:	cc22                	sw	s0,24(sp)
1c00914e:	c256                	sw	s5,4(sp)
1c009150:	842e                	mv	s0,a1
1c009152:	8ab2                	mv	s5,a2
1c009154:	ce06                	sw	ra,28(sp)
1c009156:	c84a                	sw	s2,16(sp)
1c009158:	c64e                	sw	s3,12(sp)
1c00915a:	c452                	sw	s4,8(sp)
1c00915c:	30047a73          	csrrci	s4,mstatus,8
1c009160:	00060823          	sb	zero,16(a2) # 1c080010 <__l2_shared_end+0x6ce78>
1c009164:	4785                	li	a5,1
1c009166:	d1dc                	sw	a5,36(a1)
1c009168:	49dc                	lw	a5,20(a1)
1c00916a:	0144a983          	lw	s3,20(s1)
1c00916e:	e399                	bnez	a5,1c009174 <pi_cluster_send_task_to_cl_async+0x2e>
1c009170:	47a1                	li	a5,8
1c009172:	c9dc                	sw	a5,20(a1)
1c009174:	441c                	lw	a5,8(s0)
1c009176:	eb8d                	bnez	a5,1c0091a8 <pi_cluster_send_task_to_cl_async+0x62>
1c009178:	445c                	lw	a5,12(s0)
1c00917a:	e789                	bnez	a5,1c009184 <pi_cluster_send_task_to_cl_async+0x3e>
1c00917c:	40000793          	li	a5,1024
1c009180:	c45c                	sw	a5,12(s0)
1c009182:	c81c                	sw	a5,16(s0)
1c009184:	4818                	lw	a4,16(s0)
1c009186:	445c                	lw	a5,12(s0)
1c009188:	e311                	bnez	a4,1c00918c <pi_cluster_send_task_to_cl_async+0x46>
1c00918a:	c81c                	sw	a5,16(s0)
1c00918c:	01442903          	lw	s2,20(s0)
1c009190:	4818                	lw	a4,16(s0)
1c009192:	448c                	lw	a1,8(s1)
1c009194:	197d                	addi	s2,s2,-1
1c009196:	02e90933          	mul	s2,s2,a4
1c00919a:	993e                	add	s2,s2,a5
1c00919c:	c9bd                	beqz	a1,1c009212 <pi_cluster_send_task_to_cl_async+0xcc>
1c00919e:	44d0                	lw	a2,12(s1)
1c0091a0:	07261063          	bne	a2,s2,1c009200 <pi_cluster_send_task_to_cl_async+0xba>
1c0091a4:	449c                	lw	a5,8(s1)
1c0091a6:	c41c                	sw	a5,8(s0)
1c0091a8:	4858                	lw	a4,20(s0)
1c0091aa:	4785                	li	a5,1
1c0091ac:	01542c23          	sw	s5,24(s0)
1c0091b0:	00e797b3          	sll	a5,a5,a4
1c0091b4:	17fd                	addi	a5,a5,-1
1c0091b6:	d41c                	sw	a5,40(s0)
1c0091b8:	02042023          	sw	zero,32(s0)
1c0091bc:	0089a783          	lw	a5,8(s3)
1c0091c0:	cbbd                	beqz	a5,1c009236 <pi_cluster_send_task_to_cl_async+0xf0>
1c0091c2:	d380                	sw	s0,32(a5)
1c0091c4:	0089a423          	sw	s0,8(s3)
1c0091c8:	0009a783          	lw	a5,0(s3)
1c0091cc:	e399                	bnez	a5,1c0091d2 <pi_cluster_send_task_to_cl_async+0x8c>
1c0091ce:	0089a023          	sw	s0,0(s3)
1c0091d2:	509c                	lw	a5,32(s1)
1c0091d4:	00201737          	lui	a4,0x201
1c0091d8:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c0091dc:	04078793          	addi	a5,a5,64
1c0091e0:	07da                	slli	a5,a5,0x16
1c0091e2:	97ba                	add	a5,a5,a4
1c0091e4:	0007a023          	sw	zero,0(a5)
1c0091e8:	300a1073          	csrw	mstatus,s4
1c0091ec:	4501                	li	a0,0
1c0091ee:	40f2                	lw	ra,28(sp)
1c0091f0:	4462                	lw	s0,24(sp)
1c0091f2:	44d2                	lw	s1,20(sp)
1c0091f4:	4942                	lw	s2,16(sp)
1c0091f6:	49b2                	lw	s3,12(sp)
1c0091f8:	4a22                	lw	s4,8(sp)
1c0091fa:	4a92                	lw	s5,4(sp)
1c0091fc:	6105                	addi	sp,sp,32
1c0091fe:	8082                	ret
1c009200:	509c                	lw	a5,32(s1)
1c009202:	1c001737          	lui	a4,0x1c001
1c009206:	1f472503          	lw	a0,500(a4) # 1c0011f4 <__rt_alloc_l1>
1c00920a:	078a                	slli	a5,a5,0x2
1c00920c:	953e                	add	a0,a0,a5
1c00920e:	8dbff0ef          	jal	ra,1c008ae8 <rt_user_free>
1c009212:	509c                	lw	a5,32(s1)
1c009214:	1c001737          	lui	a4,0x1c001
1c009218:	1f472503          	lw	a0,500(a4) # 1c0011f4 <__rt_alloc_l1>
1c00921c:	078a                	slli	a5,a5,0x2
1c00921e:	0124a623          	sw	s2,12(s1)
1c009222:	85ca                	mv	a1,s2
1c009224:	953e                	add	a0,a0,a5
1c009226:	893ff0ef          	jal	ra,1c008ab8 <rt_user_alloc>
1c00922a:	c488                	sw	a0,8(s1)
1c00922c:	fd25                	bnez	a0,1c0091a4 <pi_cluster_send_task_to_cl_async+0x5e>
1c00922e:	300a1073          	csrw	mstatus,s4
1c009232:	557d                	li	a0,-1
1c009234:	bf6d                	j	1c0091ee <pi_cluster_send_task_to_cl_async+0xa8>
1c009236:	0089a223          	sw	s0,4(s3)
1c00923a:	b769                	j	1c0091c4 <pi_cluster_send_task_to_cl_async+0x7e>

1c00923c <rt_perf_init>:
1c00923c:	00450793          	addi	a5,a0,4
1c009240:	04850513          	addi	a0,a0,72
1c009244:	0007a023          	sw	zero,0(a5)
1c009248:	0791                	addi	a5,a5,4
1c00924a:	fea79de3          	bne	a5,a0,1c009244 <rt_perf_init+0x8>
1c00924e:	8082                	ret

1c009250 <rt_perf_conf>:
1c009250:	c10c                	sw	a1,0(a0)
1c009252:	7a059073          	csrw	pcer,a1
1c009256:	8082                	ret

1c009258 <cluster_start>:
1c009258:	002047b7          	lui	a5,0x204
1c00925c:	00070737          	lui	a4,0x70
1c009260:	c798                	sw	a4,8(a5)
1c009262:	0ff00713          	li	a4,255
1c009266:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f4098>
1c00926a:	20e7a023          	sw	a4,512(a5)
1c00926e:	20e7a623          	sw	a4,524(a5)
1c009272:	8082                	ret

1c009274 <__rt_init>:
1c009274:	1101                	addi	sp,sp,-32
1c009276:	ce06                	sw	ra,28(sp)
1c009278:	cc22                	sw	s0,24(sp)
1c00927a:	23d5                	jal	1c00985e <__rt_bridge_set_available>
1c00927c:	1c0017b7          	lui	a5,0x1c001
1c009280:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c009284:	478d                	li	a5,3
1c009286:	02f71263          	bne	a4,a5,1c0092aa <__rt_init+0x36>
1c00928a:	7d005073          	csrwi	0x7d0,0
1c00928e:	1c0007b7          	lui	a5,0x1c000
1c009292:	70078793          	addi	a5,a5,1792 # 1c000700 <stack_start>
1c009296:	7d179073          	csrw	0x7d1,a5
1c00929a:	1c0017b7          	lui	a5,0x1c001
1c00929e:	f0078793          	addi	a5,a5,-256 # 1c000f00 <stack>
1c0092a2:	7d279073          	csrw	0x7d2,a5
1c0092a6:	7d00d073          	csrwi	0x7d0,1
1c0092aa:	2c29                	jal	1c0094c4 <__rt_irq_init>
1c0092ac:	1a1067b7          	lui	a5,0x1a106
1c0092b0:	577d                	li	a4,-1
1c0092b2:	c3d8                	sw	a4,4(a5)
1c0092b4:	1c0085b7          	lui	a1,0x1c008
1c0092b8:	c798                	sw	a4,8(a5)
1c0092ba:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c0092be:	4569                	li	a0,26
1c0092c0:	228d                	jal	1c009422 <rt_irq_set_handler>
1c0092c2:	f14027f3          	csrr	a5,mhartid
1c0092c6:	8795                	srai	a5,a5,0x5
1c0092c8:	03f7f793          	andi	a5,a5,63
1c0092cc:	477d                	li	a4,31
1c0092ce:	0ae79e63          	bne	a5,a4,1c00938a <__rt_init+0x116>
1c0092d2:	1a10a7b7          	lui	a5,0x1a10a
1c0092d6:	04000737          	lui	a4,0x4000
1c0092da:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c0092de:	46d000ef          	jal	ra,1c009f4a <__rt_pmu_init>
1c0092e2:	373000ef          	jal	ra,1c009e54 <__rt_freq_init>
1c0092e6:	f14027f3          	csrr	a5,mhartid
1c0092ea:	8795                	srai	a5,a5,0x5
1c0092ec:	03f7f793          	andi	a5,a5,63
1c0092f0:	477d                	li	a4,31
1c0092f2:	00e78763          	beq	a5,a4,1c009300 <__rt_init+0x8c>
1c0092f6:	002017b7          	lui	a5,0x201
1c0092fa:	577d                	li	a4,-1
1c0092fc:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f1414>
1c009300:	1c000437          	lui	s0,0x1c000
1c009304:	2605                	jal	1c009624 <__rt_utils_init>
1c009306:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c00930a:	8dfff0ef          	jal	ra,1c008be8 <__rt_allocs_init>
1c00930e:	25cd                	jal	1c0099f0 <__rt_thread_sched_init>
1c009310:	0ed000ef          	jal	ra,1c009bfc <__rt_event_sched_init>
1c009314:	473000ef          	jal	ra,1c009f86 <__rt_padframe_init>
1c009318:	401c                	lw	a5,0(s0)
1c00931a:	efb5                	bnez	a5,1c009396 <__rt_init+0x122>
1c00931c:	30045073          	csrwi	mstatus,8
1c009320:	4501                	li	a0,0
1c009322:	2cc1                	jal	1c0095f2 <__rt_cbsys_exec>
1c009324:	e521                	bnez	a0,1c00936c <__rt_init+0xf8>
1c009326:	f14027f3          	csrr	a5,mhartid
1c00932a:	8795                	srai	a5,a5,0x5
1c00932c:	03f7f793          	andi	a5,a5,63
1c009330:	477d                	li	a4,31
1c009332:	0ae78763          	beq	a5,a4,1c0093e0 <__rt_init+0x16c>
1c009336:	4681                	li	a3,0
1c009338:	4601                	li	a2,0
1c00933a:	4581                	li	a1,0
1c00933c:	4505                	li	a0,1
1c00933e:	cfb9                	beqz	a5,1c00939c <__rt_init+0x128>
1c009340:	3b4d                	jal	1c0090f2 <rt_cluster_mount>
1c009342:	6591                	lui	a1,0x4
1c009344:	450d                	li	a0,3
1c009346:	fecff0ef          	jal	ra,1c008b32 <rt_alloc>
1c00934a:	872a                	mv	a4,a0
1c00934c:	c105                	beqz	a0,1c00936c <__rt_init+0xf8>
1c00934e:	6805                	lui	a6,0x1
1c009350:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009354:	1c009637          	lui	a2,0x1c009
1c009358:	c002                	sw	zero,0(sp)
1c00935a:	48a1                	li	a7,8
1c00935c:	87c2                	mv	a5,a6
1c00935e:	4681                	li	a3,0
1c009360:	25860613          	addi	a2,a2,600 # 1c009258 <cluster_start>
1c009364:	4581                	li	a1,0
1c009366:	4501                	li	a0,0
1c009368:	39c5                	jal	1c009058 <rt_cluster_call>
1c00936a:	c93d                	beqz	a0,1c0093e0 <__rt_init+0x16c>
1c00936c:	f1402673          	csrr	a2,mhartid
1c009370:	1c000537          	lui	a0,0x1c000
1c009374:	40565593          	srai	a1,a2,0x5
1c009378:	03f5f593          	andi	a1,a1,63
1c00937c:	8a7d                	andi	a2,a2,31
1c00937e:	5f450513          	addi	a0,a0,1524 # 1c0005f4 <__DTOR_END__+0x308>
1c009382:	552010ef          	jal	ra,1c00a8d4 <printf>
1c009386:	4da010ef          	jal	ra,1c00a860 <abort>
1c00938a:	002047b7          	lui	a5,0x204
1c00938e:	04000737          	lui	a4,0x4000
1c009392:	cbd8                	sw	a4,20(a5)
1c009394:	b7a9                	j	1c0092de <__rt_init+0x6a>
1c009396:	9782                	jalr	a5
1c009398:	0411                	addi	s0,s0,4
1c00939a:	bfbd                	j	1c009318 <__rt_init+0xa4>
1c00939c:	3b99                	jal	1c0090f2 <rt_cluster_mount>
1c00939e:	6591                	lui	a1,0x4
1c0093a0:	80058593          	addi	a1,a1,-2048 # 3800 <__rt_hyper_pending_emu_stride+0x3558>
1c0093a4:	450d                	li	a0,3
1c0093a6:	f8cff0ef          	jal	ra,1c008b32 <rt_alloc>
1c0093aa:	d169                	beqz	a0,1c00936c <__rt_init+0xf8>
1c0093ac:	00204737          	lui	a4,0x204
1c0093b0:	0ff00793          	li	a5,255
1c0093b4:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f4098>
1c0093b8:	1c0107b7          	lui	a5,0x1c010
1c0093bc:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c0093c0:	0017e793          	ori	a5,a5,1
1c0093c4:	08f72023          	sw	a5,128(a4)
1c0093c8:	6785                	lui	a5,0x1
1c0093ca:	4462                	lw	s0,24(sp)
1c0093cc:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0093d0:	08f72023          	sw	a5,128(a4)
1c0093d4:	40f2                	lw	ra,28(sp)
1c0093d6:	08a72023          	sw	a0,128(a4)
1c0093da:	4501                	li	a0,0
1c0093dc:	6105                	addi	sp,sp,32
1c0093de:	bdad                	j	1c009258 <cluster_start>
1c0093e0:	40f2                	lw	ra,28(sp)
1c0093e2:	4462                	lw	s0,24(sp)
1c0093e4:	6105                	addi	sp,sp,32
1c0093e6:	8082                	ret

1c0093e8 <__rt_deinit>:
1c0093e8:	1c0017b7          	lui	a5,0x1c001
1c0093ec:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c0093f0:	1141                	addi	sp,sp,-16
1c0093f2:	c606                	sw	ra,12(sp)
1c0093f4:	c422                	sw	s0,8(sp)
1c0093f6:	478d                	li	a5,3
1c0093f8:	00f71463          	bne	a4,a5,1c009400 <__rt_deinit+0x18>
1c0093fc:	7d005073          	csrwi	0x7d0,0
1c009400:	4505                	li	a0,1
1c009402:	1c000437          	lui	s0,0x1c000
1c009406:	22f5                	jal	1c0095f2 <__rt_cbsys_exec>
1c009408:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c00940c:	401c                	lw	a5,0(s0)
1c00940e:	e789                	bnez	a5,1c009418 <__rt_deinit+0x30>
1c009410:	40b2                	lw	ra,12(sp)
1c009412:	4422                	lw	s0,8(sp)
1c009414:	0141                	addi	sp,sp,16
1c009416:	8082                	ret
1c009418:	9782                	jalr	a5
1c00941a:	0411                	addi	s0,s0,4
1c00941c:	bfc5                	j	1c00940c <__rt_deinit+0x24>

1c00941e <pi_open_from_conf>:
1c00941e:	c14c                	sw	a1,4(a0)
1c009420:	8082                	ret

1c009422 <rt_irq_set_handler>:
1c009422:	f14027f3          	csrr	a5,mhartid
1c009426:	8795                	srai	a5,a5,0x5
1c009428:	03f7f793          	andi	a5,a5,63
1c00942c:	477d                	li	a4,31
1c00942e:	04e79063          	bne	a5,a4,1c00946e <rt_irq_set_handler+0x4c>
1c009432:	1a1047b7          	lui	a5,0x1a104
1c009436:	43dc                	lw	a5,4(a5)
1c009438:	050a                	slli	a0,a0,0x2
1c00943a:	8d89                	sub	a1,a1,a0
1c00943c:	8d9d                	sub	a1,a1,a5
1c00943e:	000ff737          	lui	a4,0xff
1c009442:	00f506b3          	add	a3,a0,a5
1c009446:	8f6d                	and	a4,a4,a1
1c009448:	0145d793          	srli	a5,a1,0x14
1c00944c:	06f76713          	ori	a4,a4,111
1c009450:	07fe                	slli	a5,a5,0x1f
1c009452:	8fd9                	or	a5,a5,a4
1c009454:	7fe00637          	lui	a2,0x7fe00
1c009458:	01459713          	slli	a4,a1,0x14
1c00945c:	8f71                	and	a4,a4,a2
1c00945e:	8fd9                	or	a5,a5,a4
1c009460:	05a6                	slli	a1,a1,0x9
1c009462:	00100737          	lui	a4,0x100
1c009466:	8df9                	and	a1,a1,a4
1c009468:	8ddd                	or	a1,a1,a5
1c00946a:	c28c                	sw	a1,0(a3)
1c00946c:	8082                	ret
1c00946e:	002007b7          	lui	a5,0x200
1c009472:	43bc                	lw	a5,64(a5)
1c009474:	b7d1                	j	1c009438 <rt_irq_set_handler+0x16>

1c009476 <illegal_insn_handler_c>:
1c009476:	8082                	ret

1c009478 <__rt_handle_illegal_instr>:
1c009478:	1c0017b7          	lui	a5,0x1c001
1c00947c:	f047a703          	lw	a4,-252(a5) # 1c000f04 <__rt_debug_config>
1c009480:	1141                	addi	sp,sp,-16
1c009482:	c422                	sw	s0,8(sp)
1c009484:	c606                	sw	ra,12(sp)
1c009486:	8b05                	andi	a4,a4,1
1c009488:	843e                	mv	s0,a5
1c00948a:	c30d                	beqz	a4,1c0094ac <__rt_handle_illegal_instr+0x34>
1c00948c:	341026f3          	csrr	a3,mepc
1c009490:	f1402673          	csrr	a2,mhartid
1c009494:	1c000537          	lui	a0,0x1c000
1c009498:	4298                	lw	a4,0(a3)
1c00949a:	40565593          	srai	a1,a2,0x5
1c00949e:	03f5f593          	andi	a1,a1,63
1c0094a2:	8a7d                	andi	a2,a2,31
1c0094a4:	64c50513          	addi	a0,a0,1612 # 1c00064c <__DTOR_END__+0x360>
1c0094a8:	42c010ef          	jal	ra,1c00a8d4 <printf>
1c0094ac:	f0442783          	lw	a5,-252(s0)
1c0094b0:	8385                	srli	a5,a5,0x1
1c0094b2:	8b85                	andi	a5,a5,1
1c0094b4:	c399                	beqz	a5,1c0094ba <__rt_handle_illegal_instr+0x42>
1c0094b6:	3aa010ef          	jal	ra,1c00a860 <abort>
1c0094ba:	4422                	lw	s0,8(sp)
1c0094bc:	40b2                	lw	ra,12(sp)
1c0094be:	0141                	addi	sp,sp,16
1c0094c0:	fb7ff06f          	j	1c009476 <illegal_insn_handler_c>

1c0094c4 <__rt_irq_init>:
1c0094c4:	f14027f3          	csrr	a5,mhartid
1c0094c8:	8795                	srai	a5,a5,0x5
1c0094ca:	03f7f793          	andi	a5,a5,63
1c0094ce:	477d                	li	a4,31
1c0094d0:	02e79763          	bne	a5,a4,1c0094fe <__rt_irq_init+0x3a>
1c0094d4:	1a10a7b7          	lui	a5,0x1a10a
1c0094d8:	577d                	li	a4,-1
1c0094da:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1097f4>
1c0094de:	f14027f3          	csrr	a5,mhartid
1c0094e2:	8795                	srai	a5,a5,0x5
1c0094e4:	1c008737          	lui	a4,0x1c008
1c0094e8:	03f7f793          	andi	a5,a5,63
1c0094ec:	46fd                	li	a3,31
1c0094ee:	00070713          	mv	a4,a4
1c0094f2:	00d79b63          	bne	a5,a3,1c009508 <__rt_irq_init+0x44>
1c0094f6:	1a1047b7          	lui	a5,0x1a104
1c0094fa:	c3d8                	sw	a4,4(a5)
1c0094fc:	8082                	ret
1c0094fe:	002047b7          	lui	a5,0x204
1c009502:	577d                	li	a4,-1
1c009504:	cb98                	sw	a4,16(a5)
1c009506:	bfe1                	j	1c0094de <__rt_irq_init+0x1a>
1c009508:	002007b7          	lui	a5,0x200
1c00950c:	c3b8                	sw	a4,64(a5)
1c00950e:	8082                	ret

1c009510 <__rt_fc_cluster_lock_req>:
1c009510:	1141                	addi	sp,sp,-16
1c009512:	c606                	sw	ra,12(sp)
1c009514:	c422                	sw	s0,8(sp)
1c009516:	c226                	sw	s1,4(sp)
1c009518:	300474f3          	csrrci	s1,mstatus,8
1c00951c:	09654703          	lbu	a4,150(a0)
1c009520:	411c                	lw	a5,0(a0)
1c009522:	c729                	beqz	a4,1c00956c <__rt_fc_cluster_lock_req+0x5c>
1c009524:	4398                	lw	a4,0(a5)
1c009526:	c30d                	beqz	a4,1c009548 <__rt_fc_cluster_lock_req+0x38>
1c009528:	43d8                	lw	a4,4(a5)
1c00952a:	cf09                	beqz	a4,1c009544 <__rt_fc_cluster_lock_req+0x34>
1c00952c:	4798                	lw	a4,8(a5)
1c00952e:	c348                	sw	a0,4(a4)
1c009530:	c788                	sw	a0,8(a5)
1c009532:	00052223          	sw	zero,4(a0)
1c009536:	30049073          	csrw	mstatus,s1
1c00953a:	40b2                	lw	ra,12(sp)
1c00953c:	4422                	lw	s0,8(sp)
1c00953e:	4492                	lw	s1,4(sp)
1c009540:	0141                	addi	sp,sp,16
1c009542:	8082                	ret
1c009544:	c3c8                	sw	a0,4(a5)
1c009546:	b7ed                	j	1c009530 <__rt_fc_cluster_lock_req+0x20>
1c009548:	4705                	li	a4,1
1c00954a:	08e50a23          	sb	a4,148(a0)
1c00954e:	4705                	li	a4,1
1c009550:	c398                	sw	a4,0(a5)
1c009552:	09554783          	lbu	a5,149(a0)
1c009556:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f0054>
1c00955a:	00201737          	lui	a4,0x201
1c00955e:	07da                	slli	a5,a5,0x16
1c009560:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c009564:	97ba                	add	a5,a5,a4
1c009566:	0007a023          	sw	zero,0(a5)
1c00956a:	b7f1                	j	1c009536 <__rt_fc_cluster_lock_req+0x26>
1c00956c:	842a                	mv	s0,a0
1c00956e:	47c8                	lw	a0,12(a5)
1c009570:	cd01                	beqz	a0,1c009588 <__rt_fc_cluster_lock_req+0x78>
1c009572:	0007a023          	sw	zero,0(a5)
1c009576:	0007a623          	sw	zero,12(a5)
1c00957a:	2185                	jal	1c0099da <__rt_thread_wakeup>
1c00957c:	4785                	li	a5,1
1c00957e:	08f40a23          	sb	a5,148(s0)
1c009582:	09544783          	lbu	a5,149(s0)
1c009586:	bfc1                	j	1c009556 <__rt_fc_cluster_lock_req+0x46>
1c009588:	43d8                	lw	a4,4(a5)
1c00958a:	e701                	bnez	a4,1c009592 <__rt_fc_cluster_lock_req+0x82>
1c00958c:	0007a023          	sw	zero,0(a5)
1c009590:	b7f5                	j	1c00957c <__rt_fc_cluster_lock_req+0x6c>
1c009592:	4354                	lw	a3,4(a4)
1c009594:	c3d4                	sw	a3,4(a5)
1c009596:	4785                	li	a5,1
1c009598:	08f70a23          	sb	a5,148(a4)
1c00959c:	09574783          	lbu	a5,149(a4)
1c0095a0:	00201737          	lui	a4,0x201
1c0095a4:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c0095a8:	04078793          	addi	a5,a5,64
1c0095ac:	07da                	slli	a5,a5,0x16
1c0095ae:	97ba                	add	a5,a5,a4
1c0095b0:	bff1                	j	1c00958c <__rt_fc_cluster_lock_req+0x7c>

1c0095b2 <__rt_cbsys_add>:
1c0095b2:	1101                	addi	sp,sp,-32
1c0095b4:	cc22                	sw	s0,24(sp)
1c0095b6:	ca26                	sw	s1,20(sp)
1c0095b8:	842a                	mv	s0,a0
1c0095ba:	84ae                	mv	s1,a1
1c0095bc:	4501                	li	a0,0
1c0095be:	45b1                	li	a1,12
1c0095c0:	c632                	sw	a2,12(sp)
1c0095c2:	ce06                	sw	ra,28(sp)
1c0095c4:	d6eff0ef          	jal	ra,1c008b32 <rt_alloc>
1c0095c8:	4632                	lw	a2,12(sp)
1c0095ca:	c115                	beqz	a0,1c0095ee <__rt_cbsys_add+0x3c>
1c0095cc:	1c0017b7          	lui	a5,0x1c001
1c0095d0:	040a                	slli	s0,s0,0x2
1c0095d2:	f0878793          	addi	a5,a5,-248 # 1c000f08 <cbsys_first>
1c0095d6:	97a2                	add	a5,a5,s0
1c0095d8:	4398                	lw	a4,0(a5)
1c0095da:	c104                	sw	s1,0(a0)
1c0095dc:	c150                	sw	a2,4(a0)
1c0095de:	c518                	sw	a4,8(a0)
1c0095e0:	c388                	sw	a0,0(a5)
1c0095e2:	4501                	li	a0,0
1c0095e4:	40f2                	lw	ra,28(sp)
1c0095e6:	4462                	lw	s0,24(sp)
1c0095e8:	44d2                	lw	s1,20(sp)
1c0095ea:	6105                	addi	sp,sp,32
1c0095ec:	8082                	ret
1c0095ee:	557d                	li	a0,-1
1c0095f0:	bfd5                	j	1c0095e4 <__rt_cbsys_add+0x32>

1c0095f2 <__rt_cbsys_exec>:
1c0095f2:	00251793          	slli	a5,a0,0x2
1c0095f6:	1c001537          	lui	a0,0x1c001
1c0095fa:	f0850513          	addi	a0,a0,-248 # 1c000f08 <cbsys_first>
1c0095fe:	1141                	addi	sp,sp,-16
1c009600:	953e                	add	a0,a0,a5
1c009602:	c422                	sw	s0,8(sp)
1c009604:	4100                	lw	s0,0(a0)
1c009606:	c606                	sw	ra,12(sp)
1c009608:	e411                	bnez	s0,1c009614 <__rt_cbsys_exec+0x22>
1c00960a:	4501                	li	a0,0
1c00960c:	40b2                	lw	ra,12(sp)
1c00960e:	4422                	lw	s0,8(sp)
1c009610:	0141                	addi	sp,sp,16
1c009612:	8082                	ret
1c009614:	401c                	lw	a5,0(s0)
1c009616:	4048                	lw	a0,4(s0)
1c009618:	9782                	jalr	a5
1c00961a:	e119                	bnez	a0,1c009620 <__rt_cbsys_exec+0x2e>
1c00961c:	4400                	lw	s0,8(s0)
1c00961e:	b7ed                	j	1c009608 <__rt_cbsys_exec+0x16>
1c009620:	557d                	li	a0,-1
1c009622:	b7ed                	j	1c00960c <__rt_cbsys_exec+0x1a>

1c009624 <__rt_utils_init>:
1c009624:	1c0017b7          	lui	a5,0x1c001
1c009628:	f0878793          	addi	a5,a5,-248 # 1c000f08 <cbsys_first>
1c00962c:	0007a023          	sw	zero,0(a5)
1c009630:	0007a223          	sw	zero,4(a5)
1c009634:	0007a423          	sw	zero,8(a5)
1c009638:	0007a623          	sw	zero,12(a5)
1c00963c:	0007a823          	sw	zero,16(a5)
1c009640:	0007aa23          	sw	zero,20(a5)
1c009644:	8082                	ret

1c009646 <__rt_fc_lock>:
1c009646:	1141                	addi	sp,sp,-16
1c009648:	c422                	sw	s0,8(sp)
1c00964a:	842a                	mv	s0,a0
1c00964c:	c606                	sw	ra,12(sp)
1c00964e:	c226                	sw	s1,4(sp)
1c009650:	c04a                	sw	s2,0(sp)
1c009652:	300474f3          	csrrci	s1,mstatus,8
1c009656:	401c                	lw	a5,0(s0)
1c009658:	eb99                	bnez	a5,1c00966e <__rt_fc_lock+0x28>
1c00965a:	4785                	li	a5,1
1c00965c:	c01c                	sw	a5,0(s0)
1c00965e:	30049073          	csrw	mstatus,s1
1c009662:	40b2                	lw	ra,12(sp)
1c009664:	4422                	lw	s0,8(sp)
1c009666:	4492                	lw	s1,4(sp)
1c009668:	4902                	lw	s2,0(sp)
1c00966a:	0141                	addi	sp,sp,16
1c00966c:	8082                	ret
1c00966e:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009672:	4585                	li	a1,1
1c009674:	e3ff7517          	auipc	a0,0xe3ff7
1c009678:	9b450513          	addi	a0,a0,-1612 # 28 <__rt_sched>
1c00967c:	c45c                	sw	a5,12(s0)
1c00967e:	29f1                	jal	1c009b5a <__rt_event_execute>
1c009680:	bfd9                	j	1c009656 <__rt_fc_lock+0x10>

1c009682 <__rt_fc_unlock>:
1c009682:	300476f3          	csrrci	a3,mstatus,8
1c009686:	415c                	lw	a5,4(a0)
1c009688:	e791                	bnez	a5,1c009694 <__rt_fc_unlock+0x12>
1c00968a:	00052023          	sw	zero,0(a0)
1c00968e:	30069073          	csrw	mstatus,a3
1c009692:	8082                	ret
1c009694:	43d8                	lw	a4,4(a5)
1c009696:	c158                	sw	a4,4(a0)
1c009698:	4705                	li	a4,1
1c00969a:	08e78a23          	sb	a4,148(a5)
1c00969e:	0957c783          	lbu	a5,149(a5)
1c0096a2:	00201737          	lui	a4,0x201
1c0096a6:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c0096aa:	04078793          	addi	a5,a5,64
1c0096ae:	07da                	slli	a5,a5,0x16
1c0096b0:	97ba                	add	a5,a5,a4
1c0096b2:	0007a023          	sw	zero,0(a5)
1c0096b6:	bfe1                	j	1c00968e <__rt_fc_unlock+0xc>

1c0096b8 <__rt_fc_cluster_lock>:
1c0096b8:	f14027f3          	csrr	a5,mhartid
1c0096bc:	8795                	srai	a5,a5,0x5
1c0096be:	03f7f793          	andi	a5,a5,63
1c0096c2:	08f58aa3          	sb	a5,149(a1)
1c0096c6:	4785                	li	a5,1
1c0096c8:	08f58b23          	sb	a5,150(a1)
1c0096cc:	1c0097b7          	lui	a5,0x1c009
1c0096d0:	51078793          	addi	a5,a5,1296 # 1c009510 <__rt_fc_cluster_lock_req>
1c0096d4:	c188                	sw	a0,0(a1)
1c0096d6:	08058a23          	sb	zero,148(a1)
1c0096da:	0205a423          	sw	zero,40(a1)
1c0096de:	0205a623          	sw	zero,44(a1)
1c0096e2:	c59c                	sw	a5,8(a1)
1c0096e4:	c5cc                	sw	a1,12(a1)
1c0096e6:	05a1                	addi	a1,a1,8
1c0096e8:	0015e513          	ori	a0,a1,1
1c0096ec:	8abff06f          	j	1c008f96 <__rt_cluster_push_fc_event>

1c0096f0 <__rt_fc_cluster_unlock>:
1c0096f0:	f14027f3          	csrr	a5,mhartid
1c0096f4:	8795                	srai	a5,a5,0x5
1c0096f6:	03f7f793          	andi	a5,a5,63
1c0096fa:	08f58aa3          	sb	a5,149(a1)
1c0096fe:	1c0097b7          	lui	a5,0x1c009
1c009702:	51078793          	addi	a5,a5,1296 # 1c009510 <__rt_fc_cluster_lock_req>
1c009706:	c188                	sw	a0,0(a1)
1c009708:	08058a23          	sb	zero,148(a1)
1c00970c:	08058b23          	sb	zero,150(a1)
1c009710:	0205a423          	sw	zero,40(a1)
1c009714:	0205a623          	sw	zero,44(a1)
1c009718:	c59c                	sw	a5,8(a1)
1c00971a:	c5cc                	sw	a1,12(a1)
1c00971c:	05a1                	addi	a1,a1,8
1c00971e:	0015e513          	ori	a0,a1,1
1c009722:	875ff06f          	j	1c008f96 <__rt_cluster_push_fc_event>

1c009726 <__rt_event_enqueue>:
1c009726:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c00972a:	00052c23          	sw	zero,24(a0)
1c00972e:	c799                	beqz	a5,1c00973c <__rt_event_enqueue+0x16>
1c009730:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c009734:	cf88                	sw	a0,24(a5)
1c009736:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c00973a:	8082                	ret
1c00973c:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c009740:	bfdd                	j	1c009736 <__rt_event_enqueue+0x10>

1c009742 <__rt_bridge_check_bridge_req.part.5>:
1c009742:	1c001737          	lui	a4,0x1c001
1c009746:	01c70793          	addi	a5,a4,28 # 1c00101c <__hal_debug_struct>
1c00974a:	0a47a783          	lw	a5,164(a5)
1c00974e:	01c70713          	addi	a4,a4,28
1c009752:	c789                	beqz	a5,1c00975c <__rt_bridge_check_bridge_req.part.5+0x1a>
1c009754:	4f94                	lw	a3,24(a5)
1c009756:	e681                	bnez	a3,1c00975e <__rt_bridge_check_bridge_req.part.5+0x1c>
1c009758:	0af72623          	sw	a5,172(a4)
1c00975c:	8082                	ret
1c00975e:	479c                	lw	a5,8(a5)
1c009760:	bfcd                	j	1c009752 <__rt_bridge_check_bridge_req.part.5+0x10>

1c009762 <__rt_bridge_wait>:
1c009762:	f14027f3          	csrr	a5,mhartid
1c009766:	8795                	srai	a5,a5,0x5
1c009768:	03f7f793          	andi	a5,a5,63
1c00976c:	477d                	li	a4,31
1c00976e:	02e79a63          	bne	a5,a4,1c0097a2 <__rt_bridge_wait+0x40>
1c009772:	1a10a7b7          	lui	a5,0x1a10a
1c009776:	6711                	lui	a4,0x4
1c009778:	300476f3          	csrrci	a3,mstatus,8
1c00977c:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1097f8>
1c009780:	01161593          	slli	a1,a2,0x11
1c009784:	0005cb63          	bltz	a1,1c00979a <__rt_bridge_wait+0x38>
1c009788:	80e7a223          	sw	a4,-2044(a5)
1c00978c:	10500073          	wfi
1c009790:	80e7a423          	sw	a4,-2040(a5)
1c009794:	30069073          	csrw	mstatus,a3
1c009798:	b7c5                	j	1c009778 <__rt_bridge_wait+0x16>
1c00979a:	80e7aa23          	sw	a4,-2028(a5)
1c00979e:	30069073          	csrw	mstatus,a3
1c0097a2:	8082                	ret

1c0097a4 <__rt_bridge_handle_notif>:
1c0097a4:	1141                	addi	sp,sp,-16
1c0097a6:	c422                	sw	s0,8(sp)
1c0097a8:	1c001437          	lui	s0,0x1c001
1c0097ac:	01c40793          	addi	a5,s0,28 # 1c00101c <__hal_debug_struct>
1c0097b0:	0a47a783          	lw	a5,164(a5)
1c0097b4:	c606                	sw	ra,12(sp)
1c0097b6:	c226                	sw	s1,4(sp)
1c0097b8:	c04a                	sw	s2,0(sp)
1c0097ba:	01c40413          	addi	s0,s0,28
1c0097be:	c399                	beqz	a5,1c0097c4 <__rt_bridge_handle_notif+0x20>
1c0097c0:	4bd8                	lw	a4,20(a5)
1c0097c2:	e30d                	bnez	a4,1c0097e4 <__rt_bridge_handle_notif+0x40>
1c0097c4:	0b442783          	lw	a5,180(s0)
1c0097c8:	c789                	beqz	a5,1c0097d2 <__rt_bridge_handle_notif+0x2e>
1c0097ca:	43a8                	lw	a0,64(a5)
1c0097cc:	0a042a23          	sw	zero,180(s0)
1c0097d0:	3f99                	jal	1c009726 <__rt_event_enqueue>
1c0097d2:	0ac42783          	lw	a5,172(s0)
1c0097d6:	eb95                	bnez	a5,1c00980a <__rt_bridge_handle_notif+0x66>
1c0097d8:	4422                	lw	s0,8(sp)
1c0097da:	40b2                	lw	ra,12(sp)
1c0097dc:	4492                	lw	s1,4(sp)
1c0097de:	4902                	lw	s2,0(sp)
1c0097e0:	0141                	addi	sp,sp,16
1c0097e2:	b785                	j	1c009742 <__rt_bridge_check_bridge_req.part.5>
1c0097e4:	4784                	lw	s1,8(a5)
1c0097e6:	4fd8                	lw	a4,28(a5)
1c0097e8:	0a942223          	sw	s1,164(s0)
1c0097ec:	cb01                	beqz	a4,1c0097fc <__rt_bridge_handle_notif+0x58>
1c0097ee:	0b042703          	lw	a4,176(s0)
1c0097f2:	c798                	sw	a4,8(a5)
1c0097f4:	0af42823          	sw	a5,176(s0)
1c0097f8:	87a6                	mv	a5,s1
1c0097fa:	b7d1                	j	1c0097be <__rt_bridge_handle_notif+0x1a>
1c0097fc:	43a8                	lw	a0,64(a5)
1c0097fe:	30047973          	csrrci	s2,mstatus,8
1c009802:	3715                	jal	1c009726 <__rt_event_enqueue>
1c009804:	30091073          	csrw	mstatus,s2
1c009808:	bfc5                	j	1c0097f8 <__rt_bridge_handle_notif+0x54>
1c00980a:	40b2                	lw	ra,12(sp)
1c00980c:	4422                	lw	s0,8(sp)
1c00980e:	4492                	lw	s1,4(sp)
1c009810:	4902                	lw	s2,0(sp)
1c009812:	0141                	addi	sp,sp,16
1c009814:	8082                	ret

1c009816 <__rt_bridge_check_connection>:
1c009816:	1c001737          	lui	a4,0x1c001
1c00981a:	01c70713          	addi	a4,a4,28 # 1c00101c <__hal_debug_struct>
1c00981e:	471c                	lw	a5,8(a4)
1c009820:	ef95                	bnez	a5,1c00985c <__rt_bridge_check_connection+0x46>
1c009822:	1a1047b7          	lui	a5,0x1a104
1c009826:	5bfc                	lw	a5,116(a5)
1c009828:	469d                	li	a3,7
1c00982a:	83a5                	srli	a5,a5,0x9
1c00982c:	8b9d                	andi	a5,a5,7
1c00982e:	02d79763          	bne	a5,a3,1c00985c <__rt_bridge_check_connection+0x46>
1c009832:	1141                	addi	sp,sp,-16
1c009834:	c422                	sw	s0,8(sp)
1c009836:	c226                	sw	s1,4(sp)
1c009838:	c606                	sw	ra,12(sp)
1c00983a:	4785                	li	a5,1
1c00983c:	c71c                	sw	a5,8(a4)
1c00983e:	1a1044b7          	lui	s1,0x1a104
1c009842:	441d                	li	s0,7
1c009844:	58fc                	lw	a5,116(s1)
1c009846:	83a5                	srli	a5,a5,0x9
1c009848:	8b9d                	andi	a5,a5,7
1c00984a:	00878763          	beq	a5,s0,1c009858 <__rt_bridge_check_connection+0x42>
1c00984e:	40b2                	lw	ra,12(sp)
1c009850:	4422                	lw	s0,8(sp)
1c009852:	4492                	lw	s1,4(sp)
1c009854:	0141                	addi	sp,sp,16
1c009856:	8082                	ret
1c009858:	3729                	jal	1c009762 <__rt_bridge_wait>
1c00985a:	b7ed                	j	1c009844 <__rt_bridge_check_connection+0x2e>
1c00985c:	8082                	ret

1c00985e <__rt_bridge_set_available>:
1c00985e:	1c0017b7          	lui	a5,0x1c001
1c009862:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009866:	479c                	lw	a5,8(a5)
1c009868:	8082                	ret

1c00986a <__rt_bridge_send_notif>:
1c00986a:	1141                	addi	sp,sp,-16
1c00986c:	c606                	sw	ra,12(sp)
1c00986e:	3765                	jal	1c009816 <__rt_bridge_check_connection>
1c009870:	40b2                	lw	ra,12(sp)
1c009872:	1c0017b7          	lui	a5,0x1c001
1c009876:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00987a:	479c                	lw	a5,8(a5)
1c00987c:	0141                	addi	sp,sp,16
1c00987e:	8082                	ret

1c009880 <__rt_bridge_clear_notif>:
1c009880:	1141                	addi	sp,sp,-16
1c009882:	c606                	sw	ra,12(sp)
1c009884:	3f49                	jal	1c009816 <__rt_bridge_check_connection>
1c009886:	1c0017b7          	lui	a5,0x1c001
1c00988a:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00988e:	4798                	lw	a4,8(a5)
1c009890:	c311                	beqz	a4,1c009894 <__rt_bridge_clear_notif+0x14>
1c009892:	479c                	lw	a5,8(a5)
1c009894:	40b2                	lw	ra,12(sp)
1c009896:	0141                	addi	sp,sp,16
1c009898:	8082                	ret

1c00989a <__rt_bridge_printf_flush>:
1c00989a:	1141                	addi	sp,sp,-16
1c00989c:	c422                	sw	s0,8(sp)
1c00989e:	c606                	sw	ra,12(sp)
1c0098a0:	1c001437          	lui	s0,0x1c001
1c0098a4:	3f8d                	jal	1c009816 <__rt_bridge_check_connection>
1c0098a6:	01c40793          	addi	a5,s0,28 # 1c00101c <__hal_debug_struct>
1c0098aa:	479c                	lw	a5,8(a5)
1c0098ac:	c385                	beqz	a5,1c0098cc <__rt_bridge_printf_flush+0x32>
1c0098ae:	01c40413          	addi	s0,s0,28
1c0098b2:	485c                	lw	a5,20(s0)
1c0098b4:	e399                	bnez	a5,1c0098ba <__rt_bridge_printf_flush+0x20>
1c0098b6:	4c1c                	lw	a5,24(s0)
1c0098b8:	cb91                	beqz	a5,1c0098cc <__rt_bridge_printf_flush+0x32>
1c0098ba:	3f45                	jal	1c00986a <__rt_bridge_send_notif>
1c0098bc:	485c                	lw	a5,20(s0)
1c0098be:	e789                	bnez	a5,1c0098c8 <__rt_bridge_printf_flush+0x2e>
1c0098c0:	4422                	lw	s0,8(sp)
1c0098c2:	40b2                	lw	ra,12(sp)
1c0098c4:	0141                	addi	sp,sp,16
1c0098c6:	bf6d                	j	1c009880 <__rt_bridge_clear_notif>
1c0098c8:	3d69                	jal	1c009762 <__rt_bridge_wait>
1c0098ca:	bfcd                	j	1c0098bc <__rt_bridge_printf_flush+0x22>
1c0098cc:	40b2                	lw	ra,12(sp)
1c0098ce:	4422                	lw	s0,8(sp)
1c0098d0:	0141                	addi	sp,sp,16
1c0098d2:	8082                	ret

1c0098d4 <__rt_bridge_req_shutdown>:
1c0098d4:	1141                	addi	sp,sp,-16
1c0098d6:	c606                	sw	ra,12(sp)
1c0098d8:	c422                	sw	s0,8(sp)
1c0098da:	c226                	sw	s1,4(sp)
1c0098dc:	3f2d                	jal	1c009816 <__rt_bridge_check_connection>
1c0098de:	1c0017b7          	lui	a5,0x1c001
1c0098e2:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c0098e6:	479c                	lw	a5,8(a5)
1c0098e8:	cb95                	beqz	a5,1c00991c <__rt_bridge_req_shutdown+0x48>
1c0098ea:	3f45                	jal	1c00989a <__rt_bridge_printf_flush>
1c0098ec:	1a1044b7          	lui	s1,0x1a104
1c0098f0:	441d                	li	s0,7
1c0098f2:	58fc                	lw	a5,116(s1)
1c0098f4:	83a5                	srli	a5,a5,0x9
1c0098f6:	8b9d                	andi	a5,a5,7
1c0098f8:	02878763          	beq	a5,s0,1c009926 <__rt_bridge_req_shutdown+0x52>
1c0098fc:	1a1044b7          	lui	s1,0x1a104
1c009900:	441d                	li	s0,7
1c009902:	58fc                	lw	a5,116(s1)
1c009904:	83a5                	srli	a5,a5,0x9
1c009906:	8b9d                	andi	a5,a5,7
1c009908:	02879163          	bne	a5,s0,1c00992a <__rt_bridge_req_shutdown+0x56>
1c00990c:	1a1044b7          	lui	s1,0x1a104
1c009910:	441d                	li	s0,7
1c009912:	58fc                	lw	a5,116(s1)
1c009914:	83a5                	srli	a5,a5,0x9
1c009916:	8b9d                	andi	a5,a5,7
1c009918:	00878b63          	beq	a5,s0,1c00992e <__rt_bridge_req_shutdown+0x5a>
1c00991c:	40b2                	lw	ra,12(sp)
1c00991e:	4422                	lw	s0,8(sp)
1c009920:	4492                	lw	s1,4(sp)
1c009922:	0141                	addi	sp,sp,16
1c009924:	8082                	ret
1c009926:	3d35                	jal	1c009762 <__rt_bridge_wait>
1c009928:	b7e9                	j	1c0098f2 <__rt_bridge_req_shutdown+0x1e>
1c00992a:	3d25                	jal	1c009762 <__rt_bridge_wait>
1c00992c:	bfd9                	j	1c009902 <__rt_bridge_req_shutdown+0x2e>
1c00992e:	3d15                	jal	1c009762 <__rt_bridge_wait>
1c009930:	b7cd                	j	1c009912 <__rt_bridge_req_shutdown+0x3e>

1c009932 <__rt_bridge_init>:
1c009932:	1c0017b7          	lui	a5,0x1c001
1c009936:	1a10a737          	lui	a4,0x1a10a
1c00993a:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00993e:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1097fc>
1c009942:	0ae7ac23          	sw	a4,184(a5)
1c009946:	4741                	li	a4,16
1c009948:	0a07a223          	sw	zero,164(a5)
1c00994c:	0a07a623          	sw	zero,172(a5)
1c009950:	0a07aa23          	sw	zero,180(a5)
1c009954:	0ae7ae23          	sw	a4,188(a5)
1c009958:	00400793          	li	a5,4
1c00995c:	0007a823          	sw	zero,16(a5)
1c009960:	0007a023          	sw	zero,0(a5)
1c009964:	8082                	ret

1c009966 <__rt_thread_enqueue_ready>:
1c009966:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c00996a:	02052c23          	sw	zero,56(a0)
1c00996e:	01800793          	li	a5,24
1c009972:	e711                	bnez	a4,1c00997e <__rt_thread_enqueue_ready+0x18>
1c009974:	c388                	sw	a0,0(a5)
1c009976:	c3c8                	sw	a0,4(a5)
1c009978:	0c052a23          	sw	zero,212(a0)
1c00997c:	8082                	ret
1c00997e:	43d8                	lw	a4,4(a5)
1c009980:	df08                	sw	a0,56(a4)
1c009982:	bfd5                	j	1c009976 <__rt_thread_enqueue_ready+0x10>

1c009984 <__rt_thread_sleep>:
1c009984:	01800713          	li	a4,24
1c009988:	4708                	lw	a0,8(a4)
1c00998a:	01800793          	li	a5,24
1c00998e:	438c                	lw	a1,0(a5)
1c009990:	c999                	beqz	a1,1c0099a6 <__rt_thread_sleep+0x22>
1c009992:	5d98                	lw	a4,56(a1)
1c009994:	c398                	sw	a4,0(a5)
1c009996:	4705                	li	a4,1
1c009998:	0ce5aa23          	sw	a4,212(a1)
1c00999c:	00b50c63          	beq	a0,a1,1c0099b4 <__rt_thread_sleep+0x30>
1c0099a0:	c78c                	sw	a1,8(a5)
1c0099a2:	925fe06f          	j	1c0082c6 <__rt_thread_switch>
1c0099a6:	10500073          	wfi
1c0099aa:	30045073          	csrwi	mstatus,8
1c0099ae:	30047773          	csrrci	a4,mstatus,8
1c0099b2:	bff1                	j	1c00998e <__rt_thread_sleep+0xa>
1c0099b4:	8082                	ret

1c0099b6 <rt_thread_exit>:
1c0099b6:	300477f3          	csrrci	a5,mstatus,8
1c0099ba:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c0099be:	4705                	li	a4,1
1c0099c0:	c3e8                	sw	a0,68(a5)
1c0099c2:	5fc8                	lw	a0,60(a5)
1c0099c4:	c3b8                	sw	a4,64(a5)
1c0099c6:	c909                	beqz	a0,1c0099d8 <rt_thread_exit+0x22>
1c0099c8:	0d452783          	lw	a5,212(a0)
1c0099cc:	c791                	beqz	a5,1c0099d8 <rt_thread_exit+0x22>
1c0099ce:	1141                	addi	sp,sp,-16
1c0099d0:	c606                	sw	ra,12(sp)
1c0099d2:	3f51                	jal	1c009966 <__rt_thread_enqueue_ready>
1c0099d4:	40b2                	lw	ra,12(sp)
1c0099d6:	0141                	addi	sp,sp,16
1c0099d8:	b775                	j	1c009984 <__rt_thread_sleep>

1c0099da <__rt_thread_wakeup>:
1c0099da:	5d18                	lw	a4,56(a0)
1c0099dc:	eb09                	bnez	a4,1c0099ee <__rt_thread_wakeup+0x14>
1c0099de:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c0099e2:	00a70663          	beq	a4,a0,1c0099ee <__rt_thread_wakeup+0x14>
1c0099e6:	0d452783          	lw	a5,212(a0)
1c0099ea:	c391                	beqz	a5,1c0099ee <__rt_thread_wakeup+0x14>
1c0099ec:	bfad                	j	1c009966 <__rt_thread_enqueue_ready>
1c0099ee:	8082                	ret

1c0099f0 <__rt_thread_sched_init>:
1c0099f0:	1141                	addi	sp,sp,-16
1c0099f2:	c422                	sw	s0,8(sp)
1c0099f4:	1c0087b7          	lui	a5,0x1c008
1c0099f8:	1c001437          	lui	s0,0x1c001
1c0099fc:	c226                	sw	s1,4(sp)
1c0099fe:	c04a                	sw	s2,0(sp)
1c009a00:	c606                	sw	ra,12(sp)
1c009a02:	f2040413          	addi	s0,s0,-224 # 1c000f20 <__rt_thread_main>
1c009a06:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009a0a:	c01c                	sw	a5,0(s0)
1c009a0c:	1c00a7b7          	lui	a5,0x1c00a
1c009a10:	04840913          	addi	s2,s0,72
1c009a14:	9b678793          	addi	a5,a5,-1610 # 1c0099b6 <rt_thread_exit>
1c009a18:	01800493          	li	s1,24
1c009a1c:	c45c                	sw	a5,12(s0)
1c009a1e:	854a                	mv	a0,s2
1c009a20:	4785                	li	a5,1
1c009a22:	e3ff6597          	auipc	a1,0xe3ff6
1c009a26:	60658593          	addi	a1,a1,1542 # 28 <__rt_sched>
1c009a2a:	0cf42a23          	sw	a5,212(s0)
1c009a2e:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa103fec>
1c009a32:	02042a23          	sw	zero,52(s0)
1c009a36:	00042223          	sw	zero,4(s0)
1c009a3a:	00042423          	sw	zero,8(s0)
1c009a3e:	2829                	jal	1c009a58 <__rt_event_init>
1c009a40:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009a44:	c480                	sw	s0,8(s1)
1c009a46:	40b2                	lw	ra,12(sp)
1c009a48:	d03c                	sw	a5,96(s0)
1c009a4a:	4422                	lw	s0,8(sp)
1c009a4c:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009a50:	4492                	lw	s1,4(sp)
1c009a52:	4902                	lw	s2,0(sp)
1c009a54:	0141                	addi	sp,sp,16
1c009a56:	8082                	ret

1c009a58 <__rt_event_init>:
1c009a58:	02052023          	sw	zero,32(a0)
1c009a5c:	02052223          	sw	zero,36(a0)
1c009a60:	02052823          	sw	zero,48(a0)
1c009a64:	00052023          	sw	zero,0(a0)
1c009a68:	8082                	ret

1c009a6a <__rt_wait_event_prepare_blocking>:
1c009a6a:	02400793          	li	a5,36
1c009a6e:	4388                	lw	a0,0(a5)
1c009a70:	4d18                	lw	a4,24(a0)
1c009a72:	02052223          	sw	zero,36(a0)
1c009a76:	c398                	sw	a4,0(a5)
1c009a78:	4785                	li	a5,1
1c009a7a:	d11c                	sw	a5,32(a0)
1c009a7c:	00052023          	sw	zero,0(a0)
1c009a80:	8082                	ret

1c009a82 <rt_event_alloc>:
1c009a82:	1141                	addi	sp,sp,-16
1c009a84:	c422                	sw	s0,8(sp)
1c009a86:	842e                	mv	s0,a1
1c009a88:	c606                	sw	ra,12(sp)
1c009a8a:	c226                	sw	s1,4(sp)
1c009a8c:	300474f3          	csrrci	s1,mstatus,8
1c009a90:	f14027f3          	csrr	a5,mhartid
1c009a94:	8795                	srai	a5,a5,0x5
1c009a96:	03f7f793          	andi	a5,a5,63
1c009a9a:	477d                	li	a4,31
1c009a9c:	00378513          	addi	a0,a5,3
1c009aa0:	00e79363          	bne	a5,a4,1c009aa6 <rt_event_alloc+0x24>
1c009aa4:	4501                	li	a0,0
1c009aa6:	08c00593          	li	a1,140
1c009aaa:	02b405b3          	mul	a1,s0,a1
1c009aae:	884ff0ef          	jal	ra,1c008b32 <rt_alloc>
1c009ab2:	87aa                	mv	a5,a0
1c009ab4:	557d                	li	a0,-1
1c009ab6:	cf91                	beqz	a5,1c009ad2 <rt_event_alloc+0x50>
1c009ab8:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009abc:	4581                	li	a1,0
1c009abe:	4601                	li	a2,0
1c009ac0:	02400713          	li	a4,36
1c009ac4:	00864c63          	blt	a2,s0,1c009adc <rt_event_alloc+0x5a>
1c009ac8:	c191                	beqz	a1,1c009acc <rt_event_alloc+0x4a>
1c009aca:	c314                	sw	a3,0(a4)
1c009acc:	30049073          	csrw	mstatus,s1
1c009ad0:	4501                	li	a0,0
1c009ad2:	40b2                	lw	ra,12(sp)
1c009ad4:	4422                	lw	s0,8(sp)
1c009ad6:	4492                	lw	s1,4(sp)
1c009ad8:	0141                	addi	sp,sp,16
1c009ada:	8082                	ret
1c009adc:	cf94                	sw	a3,24(a5)
1c009ade:	0207a023          	sw	zero,32(a5)
1c009ae2:	0207a223          	sw	zero,36(a5)
1c009ae6:	0207a823          	sw	zero,48(a5)
1c009aea:	0007a023          	sw	zero,0(a5)
1c009aee:	86be                	mv	a3,a5
1c009af0:	0605                	addi	a2,a2,1
1c009af2:	4585                	li	a1,1
1c009af4:	08c78793          	addi	a5,a5,140
1c009af8:	b7f1                	j	1c009ac4 <rt_event_alloc+0x42>

1c009afa <rt_event_get>:
1c009afa:	30047773          	csrrci	a4,mstatus,8
1c009afe:	02400793          	li	a5,36
1c009b02:	4388                	lw	a0,0(a5)
1c009b04:	c509                	beqz	a0,1c009b0e <rt_event_get+0x14>
1c009b06:	4d14                	lw	a3,24(a0)
1c009b08:	c150                	sw	a2,4(a0)
1c009b0a:	c394                	sw	a3,0(a5)
1c009b0c:	c10c                	sw	a1,0(a0)
1c009b0e:	30071073          	csrw	mstatus,a4
1c009b12:	8082                	ret

1c009b14 <rt_event_get_blocking>:
1c009b14:	30047773          	csrrci	a4,mstatus,8
1c009b18:	02400793          	li	a5,36
1c009b1c:	4388                	lw	a0,0(a5)
1c009b1e:	c909                	beqz	a0,1c009b30 <rt_event_get_blocking+0x1c>
1c009b20:	4d14                	lw	a3,24(a0)
1c009b22:	00052223          	sw	zero,4(a0)
1c009b26:	c394                	sw	a3,0(a5)
1c009b28:	4785                	li	a5,1
1c009b2a:	00052023          	sw	zero,0(a0)
1c009b2e:	d11c                	sw	a5,32(a0)
1c009b30:	30071073          	csrw	mstatus,a4
1c009b34:	8082                	ret

1c009b36 <rt_event_push>:
1c009b36:	30047773          	csrrci	a4,mstatus,8
1c009b3a:	02400693          	li	a3,36
1c009b3e:	42d4                	lw	a3,4(a3)
1c009b40:	00052c23          	sw	zero,24(a0)
1c009b44:	02400793          	li	a5,36
1c009b48:	e691                	bnez	a3,1c009b54 <rt_event_push+0x1e>
1c009b4a:	c3c8                	sw	a0,4(a5)
1c009b4c:	c788                	sw	a0,8(a5)
1c009b4e:	30071073          	csrw	mstatus,a4
1c009b52:	8082                	ret
1c009b54:	4794                	lw	a3,8(a5)
1c009b56:	ce88                	sw	a0,24(a3)
1c009b58:	bfd5                	j	1c009b4c <rt_event_push+0x16>

1c009b5a <__rt_event_execute>:
1c009b5a:	1141                	addi	sp,sp,-16
1c009b5c:	c422                	sw	s0,8(sp)
1c009b5e:	02400793          	li	a5,36
1c009b62:	43dc                	lw	a5,4(a5)
1c009b64:	c606                	sw	ra,12(sp)
1c009b66:	c226                	sw	s1,4(sp)
1c009b68:	02400413          	li	s0,36
1c009b6c:	eb91                	bnez	a5,1c009b80 <__rt_event_execute+0x26>
1c009b6e:	c1a9                	beqz	a1,1c009bb0 <__rt_event_execute+0x56>
1c009b70:	10500073          	wfi
1c009b74:	30045073          	csrwi	mstatus,8
1c009b78:	300477f3          	csrrci	a5,mstatus,8
1c009b7c:	405c                	lw	a5,4(s0)
1c009b7e:	cb8d                	beqz	a5,1c009bb0 <__rt_event_execute+0x56>
1c009b80:	4485                	li	s1,1
1c009b82:	4f98                	lw	a4,24(a5)
1c009b84:	53d4                	lw	a3,36(a5)
1c009b86:	00978823          	sb	s1,16(a5)
1c009b8a:	c058                	sw	a4,4(s0)
1c009b8c:	43c8                	lw	a0,4(a5)
1c009b8e:	4398                	lw	a4,0(a5)
1c009b90:	e691                	bnez	a3,1c009b9c <__rt_event_execute+0x42>
1c009b92:	5394                	lw	a3,32(a5)
1c009b94:	e681                	bnez	a3,1c009b9c <__rt_event_execute+0x42>
1c009b96:	4014                	lw	a3,0(s0)
1c009b98:	c01c                	sw	a5,0(s0)
1c009b9a:	cf94                	sw	a3,24(a5)
1c009b9c:	0207a023          	sw	zero,32(a5)
1c009ba0:	c711                	beqz	a4,1c009bac <__rt_event_execute+0x52>
1c009ba2:	30045073          	csrwi	mstatus,8
1c009ba6:	9702                	jalr	a4
1c009ba8:	300477f3          	csrrci	a5,mstatus,8
1c009bac:	405c                	lw	a5,4(s0)
1c009bae:	fbf1                	bnez	a5,1c009b82 <__rt_event_execute+0x28>
1c009bb0:	40b2                	lw	ra,12(sp)
1c009bb2:	4422                	lw	s0,8(sp)
1c009bb4:	4492                	lw	s1,4(sp)
1c009bb6:	0141                	addi	sp,sp,16
1c009bb8:	8082                	ret

1c009bba <__rt_wait_event>:
1c009bba:	1141                	addi	sp,sp,-16
1c009bbc:	c422                	sw	s0,8(sp)
1c009bbe:	c606                	sw	ra,12(sp)
1c009bc0:	842a                	mv	s0,a0
1c009bc2:	501c                	lw	a5,32(s0)
1c009bc4:	ef81                	bnez	a5,1c009bdc <__rt_wait_event+0x22>
1c009bc6:	581c                	lw	a5,48(s0)
1c009bc8:	eb91                	bnez	a5,1c009bdc <__rt_wait_event+0x22>
1c009bca:	02400793          	li	a5,36
1c009bce:	4398                	lw	a4,0(a5)
1c009bd0:	40b2                	lw	ra,12(sp)
1c009bd2:	c380                	sw	s0,0(a5)
1c009bd4:	cc18                	sw	a4,24(s0)
1c009bd6:	4422                	lw	s0,8(sp)
1c009bd8:	0141                	addi	sp,sp,16
1c009bda:	8082                	ret
1c009bdc:	4585                	li	a1,1
1c009bde:	4501                	li	a0,0
1c009be0:	3fad                	jal	1c009b5a <__rt_event_execute>
1c009be2:	b7c5                	j	1c009bc2 <__rt_wait_event+0x8>

1c009be4 <rt_event_wait>:
1c009be4:	1141                	addi	sp,sp,-16
1c009be6:	c606                	sw	ra,12(sp)
1c009be8:	c422                	sw	s0,8(sp)
1c009bea:	30047473          	csrrci	s0,mstatus,8
1c009bee:	37f1                	jal	1c009bba <__rt_wait_event>
1c009bf0:	30041073          	csrw	mstatus,s0
1c009bf4:	40b2                	lw	ra,12(sp)
1c009bf6:	4422                	lw	s0,8(sp)
1c009bf8:	0141                	addi	sp,sp,16
1c009bfa:	8082                	ret

1c009bfc <__rt_event_sched_init>:
1c009bfc:	02400513          	li	a0,36
1c009c00:	00052023          	sw	zero,0(a0)
1c009c04:	00052223          	sw	zero,4(a0)
1c009c08:	4585                	li	a1,1
1c009c0a:	0511                	addi	a0,a0,4
1c009c0c:	bd9d                	j	1c009a82 <rt_event_alloc>

1c009c0e <__rt_fll_set_freq>:
1c009c0e:	1141                	addi	sp,sp,-16
1c009c10:	c422                	sw	s0,8(sp)
1c009c12:	c226                	sw	s1,4(sp)
1c009c14:	c606                	sw	ra,12(sp)
1c009c16:	842a                	mv	s0,a0
1c009c18:	84ae                	mv	s1,a1
1c009c1a:	e111                	bnez	a0,1c009c1e <__rt_fll_set_freq+0x10>
1c009c1c:	3965                	jal	1c0098d4 <__rt_bridge_req_shutdown>
1c009c1e:	8526                	mv	a0,s1
1c009c20:	8d5fe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009c24:	1579                	addi	a0,a0,-2
1c009c26:	00155793          	srli	a5,a0,0x1
1c009c2a:	e391                	bnez	a5,1c009c2e <__rt_fll_set_freq+0x20>
1c009c2c:	4785                	li	a5,1
1c009c2e:	fff78713          	addi	a4,a5,-1
1c009c32:	4505                	li	a0,1
1c009c34:	00e51533          	sll	a0,a0,a4
1c009c38:	00f494b3          	sll	s1,s1,a5
1c009c3c:	7761                	lui	a4,0xffff8
1c009c3e:	8f65                	and	a4,a4,s1
1c009c40:	1c0016b7          	lui	a3,0x1c001
1c009c44:	953a                	add	a0,a0,a4
1c009c46:	23068693          	addi	a3,a3,560 # 1c001230 <__rt_fll_freq>
1c009c4a:	00241713          	slli	a4,s0,0x2
1c009c4e:	9736                	add	a4,a4,a3
1c009c50:	00f55533          	srl	a0,a0,a5
1c009c54:	c308                	sw	a0,0(a4)
1c009c56:	1c001737          	lui	a4,0x1c001
1c009c5a:	1cc70713          	addi	a4,a4,460 # 1c0011cc <__rt_fll_is_on>
1c009c5e:	9722                	add	a4,a4,s0
1c009c60:	00074703          	lbu	a4,0(a4)
1c009c64:	c715                	beqz	a4,1c009c90 <__rt_fll_set_freq+0x82>
1c009c66:	1a100737          	lui	a4,0x1a100
1c009c6a:	0711                	addi	a4,a4,4
1c009c6c:	0412                	slli	s0,s0,0x4
1c009c6e:	943a                	add	s0,s0,a4
1c009c70:	4018                	lw	a4,0(s0)
1c009c72:	80bd                	srli	s1,s1,0xf
1c009c74:	76c1                	lui	a3,0xffff0
1c009c76:	04c2                	slli	s1,s1,0x10
1c009c78:	8f75                	and	a4,a4,a3
1c009c7a:	80c1                	srli	s1,s1,0x10
1c009c7c:	0785                	addi	a5,a5,1
1c009c7e:	c40006b7          	lui	a3,0xc4000
1c009c82:	8f45                	or	a4,a4,s1
1c009c84:	8bbd                	andi	a5,a5,15
1c009c86:	16fd                	addi	a3,a3,-1
1c009c88:	07ea                	slli	a5,a5,0x1a
1c009c8a:	8f75                	and	a4,a4,a3
1c009c8c:	8fd9                	or	a5,a5,a4
1c009c8e:	c01c                	sw	a5,0(s0)
1c009c90:	40b2                	lw	ra,12(sp)
1c009c92:	4422                	lw	s0,8(sp)
1c009c94:	4492                	lw	s1,4(sp)
1c009c96:	0141                	addi	sp,sp,16
1c009c98:	8082                	ret

1c009c9a <__rt_fll_init>:
1c009c9a:	1141                	addi	sp,sp,-16
1c009c9c:	1a1005b7          	lui	a1,0x1a100
1c009ca0:	00451613          	slli	a2,a0,0x4
1c009ca4:	c226                	sw	s1,4(sp)
1c009ca6:	84aa                	mv	s1,a0
1c009ca8:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0ffff0>
1c009cac:	9532                	add	a0,a0,a2
1c009cae:	4114                	lw	a3,0(a0)
1c009cb0:	c606                	sw	ra,12(sp)
1c009cb2:	c422                	sw	s0,8(sp)
1c009cb4:	87b6                	mv	a5,a3
1c009cb6:	0406c963          	bltz	a3,1c009d08 <__rt_fll_init+0x6e>
1c009cba:	00858793          	addi	a5,a1,8
1c009cbe:	97b2                	add	a5,a5,a2
1c009cc0:	4398                	lw	a4,0(a5)
1c009cc2:	7841                	lui	a6,0xffff0
1c009cc4:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009cc8:	01077733          	and	a4,a4,a6
1c009ccc:	6809                	lui	a6,0x2
1c009cce:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009cd2:	01076733          	or	a4,a4,a6
1c009cd6:	f0010837          	lui	a6,0xf0010
1c009cda:	187d                	addi	a6,a6,-1
1c009cdc:	01077733          	and	a4,a4,a6
1c009ce0:	00500837          	lui	a6,0x500
1c009ce4:	01076733          	or	a4,a4,a6
1c009ce8:	05b1                	addi	a1,a1,12
1c009cea:	c398                	sw	a4,0(a5)
1c009cec:	962e                	add	a2,a2,a1
1c009cee:	421c                	lw	a5,0(a2)
1c009cf0:	fc010737          	lui	a4,0xfc010
1c009cf4:	177d                	addi	a4,a4,-1
1c009cf6:	8ff9                	and	a5,a5,a4
1c009cf8:	014c0737          	lui	a4,0x14c0
1c009cfc:	8fd9                	or	a5,a5,a4
1c009cfe:	c21c                	sw	a5,0(a2)
1c009d00:	c00007b7          	lui	a5,0xc0000
1c009d04:	8fd5                	or	a5,a5,a3
1c009d06:	c11c                	sw	a5,0(a0)
1c009d08:	1c001637          	lui	a2,0x1c001
1c009d0c:	00249713          	slli	a4,s1,0x2
1c009d10:	23060613          	addi	a2,a2,560 # 1c001230 <__rt_fll_freq>
1c009d14:	9732                	add	a4,a4,a2
1c009d16:	4300                	lw	s0,0(a4)
1c009d18:	c015                	beqz	s0,1c009d3c <__rt_fll_init+0xa2>
1c009d1a:	85a2                	mv	a1,s0
1c009d1c:	8526                	mv	a0,s1
1c009d1e:	3dc5                	jal	1c009c0e <__rt_fll_set_freq>
1c009d20:	1c001537          	lui	a0,0x1c001
1c009d24:	1cc50513          	addi	a0,a0,460 # 1c0011cc <__rt_fll_is_on>
1c009d28:	9526                	add	a0,a0,s1
1c009d2a:	4785                	li	a5,1
1c009d2c:	00f50023          	sb	a5,0(a0)
1c009d30:	40b2                	lw	ra,12(sp)
1c009d32:	8522                	mv	a0,s0
1c009d34:	4422                	lw	s0,8(sp)
1c009d36:	4492                	lw	s1,4(sp)
1c009d38:	0141                	addi	sp,sp,16
1c009d3a:	8082                	ret
1c009d3c:	06c2                	slli	a3,a3,0x10
1c009d3e:	83e9                	srli	a5,a5,0x1a
1c009d40:	82c1                	srli	a3,a3,0x10
1c009d42:	8bbd                	andi	a5,a5,15
1c009d44:	06be                	slli	a3,a3,0xf
1c009d46:	17fd                	addi	a5,a5,-1
1c009d48:	00f6d433          	srl	s0,a3,a5
1c009d4c:	c300                	sw	s0,0(a4)
1c009d4e:	bfc9                	j	1c009d20 <__rt_fll_init+0x86>

1c009d50 <__rt_fll_deinit>:
1c009d50:	1c0017b7          	lui	a5,0x1c001
1c009d54:	1cc78793          	addi	a5,a5,460 # 1c0011cc <__rt_fll_is_on>
1c009d58:	953e                	add	a0,a0,a5
1c009d5a:	00050023          	sb	zero,0(a0)
1c009d5e:	8082                	ret

1c009d60 <__rt_flls_constructor>:
1c009d60:	1c0017b7          	lui	a5,0x1c001
1c009d64:	2207a823          	sw	zero,560(a5) # 1c001230 <__rt_fll_freq>
1c009d68:	23078793          	addi	a5,a5,560
1c009d6c:	0007a223          	sw	zero,4(a5)
1c009d70:	1c0017b7          	lui	a5,0x1c001
1c009d74:	1c079623          	sh	zero,460(a5) # 1c0011cc <__rt_fll_is_on>
1c009d78:	8082                	ret

1c009d7a <gcd>:
1c009d7a:	cd19                	beqz	a0,1c009d98 <gcd+0x1e>
1c009d7c:	cd81                	beqz	a1,1c009d94 <gcd+0x1a>
1c009d7e:	00054463          	bltz	a0,1c009d86 <gcd+0xc>
1c009d82:	0005d563          	bgez	a1,1c009d8c <gcd+0x12>
1c009d86:	55fd                	li	a1,-1
1c009d88:	a031                	j	1c009d94 <gcd+0x1a>
1c009d8a:	85be                	mv	a1,a5
1c009d8c:	02b567b3          	rem	a5,a0,a1
1c009d90:	852e                	mv	a0,a1
1c009d92:	ffe5                	bnez	a5,1c009d8a <gcd+0x10>
1c009d94:	852e                	mv	a0,a1
1c009d96:	8082                	ret
1c009d98:	4581                	li	a1,0
1c009d9a:	bfed                	j	1c009d94 <gcd+0x1a>

1c009d9c <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009d9c:	1101                	addi	sp,sp,-32
1c009d9e:	1c0017b7          	lui	a5,0x1c001
1c009da2:	c84a                	sw	s2,16(sp)
1c009da4:	1d07a903          	lw	s2,464(a5) # 1c0011d0 <__rt_periph_lcm>
1c009da8:	c452                	sw	s4,8(sp)
1c009daa:	8a2e                	mv	s4,a1
1c009dac:	85ca                	mv	a1,s2
1c009dae:	ce06                	sw	ra,28(sp)
1c009db0:	cc22                	sw	s0,24(sp)
1c009db2:	ca26                	sw	s1,20(sp)
1c009db4:	842a                	mv	s0,a0
1c009db6:	c64e                	sw	s3,12(sp)
1c009db8:	89aa                	mv	s3,a0
1c009dba:	37c1                	jal	1c009d7a <gcd>
1c009dbc:	02a44533          	div	a0,s0,a0
1c009dc0:	03250933          	mul	s2,a0,s2
1c009dc4:	4511                	li	a0,4
1c009dc6:	82dff0ef          	jal	ra,1c0095f2 <__rt_cbsys_exec>
1c009dca:	1c0017b7          	lui	a5,0x1c001
1c009dce:	2307a783          	lw	a5,560(a5) # 1c001230 <__rt_fll_freq>
1c009dd2:	028954b3          	divu	s1,s2,s0
1c009dd6:	0527f263          	bleu	s2,a5,1c009e1a <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009dda:	1a1047b7          	lui	a5,0x1a104
1c009dde:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040c0>
1c009de2:	4705                	li	a4,1
1c009de4:	0ce7ae23          	sw	a4,220(a5)
1c009de8:	85a2                	mv	a1,s0
1c009dea:	4501                	li	a0,0
1c009dec:	350d                	jal	1c009c0e <__rt_fll_set_freq>
1c009dee:	57fd                	li	a5,-1
1c009df0:	00fa0963          	beq	s4,a5,1c009e02 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009df4:	c099                	beqz	s1,1c009dfa <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009df6:	029459b3          	divu	s3,s0,s1
1c009dfa:	1c0017b7          	lui	a5,0x1c001
1c009dfe:	2337ac23          	sw	s3,568(a5) # 1c001238 <__rt_freq_domains>
1c009e02:	4515                	li	a0,5
1c009e04:	feeff0ef          	jal	ra,1c0095f2 <__rt_cbsys_exec>
1c009e08:	40f2                	lw	ra,28(sp)
1c009e0a:	4462                	lw	s0,24(sp)
1c009e0c:	44d2                	lw	s1,20(sp)
1c009e0e:	4942                	lw	s2,16(sp)
1c009e10:	49b2                	lw	s3,12(sp)
1c009e12:	4a22                	lw	s4,8(sp)
1c009e14:	4501                	li	a0,0
1c009e16:	6105                	addi	sp,sp,32
1c009e18:	8082                	ret
1c009e1a:	85a2                	mv	a1,s0
1c009e1c:	4501                	li	a0,0
1c009e1e:	3bc5                	jal	1c009c0e <__rt_fll_set_freq>
1c009e20:	1a1047b7          	lui	a5,0x1a104
1c009e24:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040c0>
1c009e28:	4705                	li	a4,1
1c009e2a:	0ce7ae23          	sw	a4,220(a5)
1c009e2e:	b7c1                	j	1c009dee <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009e30 <rt_freq_set_and_get>:
1c009e30:	1141                	addi	sp,sp,-16
1c009e32:	852e                	mv	a0,a1
1c009e34:	c606                	sw	ra,12(sp)
1c009e36:	c422                	sw	s0,8(sp)
1c009e38:	30047473          	csrrci	s0,mstatus,8
1c009e3c:	4581                	li	a1,0
1c009e3e:	3fb9                	jal	1c009d9c <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009e40:	30041073          	csrw	mstatus,s0
1c009e44:	40b2                	lw	ra,12(sp)
1c009e46:	4422                	lw	s0,8(sp)
1c009e48:	00a03533          	snez	a0,a0
1c009e4c:	40a00533          	neg	a0,a0
1c009e50:	0141                	addi	sp,sp,16
1c009e52:	8082                	ret

1c009e54 <__rt_freq_init>:
1c009e54:	1141                	addi	sp,sp,-16
1c009e56:	c422                	sw	s0,8(sp)
1c009e58:	c606                	sw	ra,12(sp)
1c009e5a:	3719                	jal	1c009d60 <__rt_flls_constructor>
1c009e5c:	1c0017b7          	lui	a5,0x1c001
1c009e60:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c009e64:	4785                	li	a5,1
1c009e66:	1c001437          	lui	s0,0x1c001
1c009e6a:	02f70663          	beq	a4,a5,1c009e96 <__rt_freq_init+0x42>
1c009e6e:	4501                	li	a0,0
1c009e70:	352d                	jal	1c009c9a <__rt_fll_init>
1c009e72:	22a42c23          	sw	a0,568(s0) # 1c001238 <__rt_freq_domains>
1c009e76:	1a1047b7          	lui	a5,0x1a104
1c009e7a:	4709                	li	a4,2
1c009e7c:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1040bc>
1c009e80:	4705                	li	a4,1
1c009e82:	0ce7ac23          	sw	a4,216(a5)
1c009e86:	40b2                	lw	ra,12(sp)
1c009e88:	4422                	lw	s0,8(sp)
1c009e8a:	0ce7ae23          	sw	a4,220(a5)
1c009e8e:	0ce7aa23          	sw	a4,212(a5)
1c009e92:	0141                	addi	sp,sp,16
1c009e94:	8082                	ret
1c009e96:	026267b7          	lui	a5,0x2626
1c009e9a:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2615a14>
1c009e9e:	22f42c23          	sw	a5,568(s0)
1c009ea2:	bfd1                	j	1c009e76 <__rt_freq_init+0x22>

1c009ea4 <hal_itc_wait_for_event_noirq>:
1c009ea4:	1a10a7b7          	lui	a5,0x1a10a
1c009ea8:	300476f3          	csrrci	a3,mstatus,8
1c009eac:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1097f8>
1c009eb0:	8f69                	and	a4,a4,a0
1c009eb2:	eb11                	bnez	a4,1c009ec6 <hal_itc_wait_for_event_noirq+0x22>
1c009eb4:	80a7a223          	sw	a0,-2044(a5)
1c009eb8:	10500073          	wfi
1c009ebc:	80a7a423          	sw	a0,-2040(a5)
1c009ec0:	30069073          	csrw	mstatus,a3
1c009ec4:	b7d5                	j	1c009ea8 <hal_itc_wait_for_event_noirq+0x4>
1c009ec6:	80a7aa23          	sw	a0,-2028(a5)
1c009eca:	30069073          	csrw	mstatus,a3
1c009ece:	8082                	ret

1c009ed0 <__rt_pmu_cluster_power_down>:
1c009ed0:	1a1047b7          	lui	a5,0x1a104
1c009ed4:	5bbc                	lw	a5,112(a5)
1c009ed6:	01079713          	slli	a4,a5,0x10
1c009eda:	02074c63          	bltz	a4,1c009f12 <__rt_pmu_cluster_power_down+0x42>
1c009ede:	1141                	addi	sp,sp,-16
1c009ee0:	c422                	sw	s0,8(sp)
1c009ee2:	c606                	sw	ra,12(sp)
1c009ee4:	c226                	sw	s1,4(sp)
1c009ee6:	1a104437          	lui	s0,0x1a104
1c009eea:	547c                	lw	a5,108(s0)
1c009eec:	e385                	bnez	a5,1c009f0c <__rt_pmu_cluster_power_down+0x3c>
1c009eee:	4485                	li	s1,1
1c009ef0:	c444                	sw	s1,12(s0)
1c009ef2:	478d                	li	a5,3
1c009ef4:	d83c                	sw	a5,112(s0)
1c009ef6:	00800537          	lui	a0,0x800
1c009efa:	376d                	jal	1c009ea4 <hal_itc_wait_for_event_noirq>
1c009efc:	d824                	sw	s1,112(s0)
1c009efe:	4422                	lw	s0,8(sp)
1c009f00:	40b2                	lw	ra,12(sp)
1c009f02:	4492                	lw	s1,4(sp)
1c009f04:	00400537          	lui	a0,0x400
1c009f08:	0141                	addi	sp,sp,16
1c009f0a:	bf69                	j	1c009ea4 <hal_itc_wait_for_event_noirq>
1c009f0c:	4505                	li	a0,1
1c009f0e:	2a11                	jal	1c00a022 <rt_time_wait_us>
1c009f10:	bfe9                	j	1c009eea <__rt_pmu_cluster_power_down+0x1a>
1c009f12:	8082                	ret

1c009f14 <__rt_pmu_cluster_power_up>:
1c009f14:	1141                	addi	sp,sp,-16
1c009f16:	c606                	sw	ra,12(sp)
1c009f18:	c422                	sw	s0,8(sp)
1c009f1a:	478d                	li	a5,3
1c009f1c:	1a104437          	lui	s0,0x1a104
1c009f20:	d83c                	sw	a5,112(s0)
1c009f22:	00400537          	lui	a0,0x400
1c009f26:	3fbd                	jal	1c009ea4 <hal_itc_wait_for_event_noirq>
1c009f28:	02700793          	li	a5,39
1c009f2c:	d83c                	sw	a5,112(s0)
1c009f2e:	00800537          	lui	a0,0x800
1c009f32:	3f8d                	jal	1c009ea4 <hal_itc_wait_for_event_noirq>
1c009f34:	6791                	lui	a5,0x4
1c009f36:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa103ff8>
1c009f3a:	02778793          	addi	a5,a5,39 # 4027 <__rt_hyper_pending_emu_stride+0x3d7f>
1c009f3e:	d83c                	sw	a5,112(s0)
1c009f40:	40b2                	lw	ra,12(sp)
1c009f42:	4422                	lw	s0,8(sp)
1c009f44:	4505                	li	a0,1
1c009f46:	0141                	addi	sp,sp,16
1c009f48:	8082                	ret

1c009f4a <__rt_pmu_init>:
1c009f4a:	1a1077b7          	lui	a5,0x1a107
1c009f4e:	4741                	li	a4,16
1c009f50:	cb98                	sw	a4,16(a5)
1c009f52:	1a10a7b7          	lui	a5,0x1a10a
1c009f56:	02000737          	lui	a4,0x2000
1c009f5a:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa109800>
1c009f5e:	4709                	li	a4,2
1c009f60:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c009f64:	8082                	ret

1c009f66 <rt_padframe_set>:
1c009f66:	300476f3          	csrrci	a3,mstatus,8
1c009f6a:	4158                	lw	a4,4(a0)
1c009f6c:	1a1047b7          	lui	a5,0x1a104
1c009f70:	4310                	lw	a2,0(a4)
1c009f72:	cb90                	sw	a2,16(a5)
1c009f74:	4350                	lw	a2,4(a4)
1c009f76:	cbd0                	sw	a2,20(a5)
1c009f78:	4710                	lw	a2,8(a4)
1c009f7a:	cf90                	sw	a2,24(a5)
1c009f7c:	4758                	lw	a4,12(a4)
1c009f7e:	cfd8                	sw	a4,28(a5)
1c009f80:	30069073          	csrw	mstatus,a3
1c009f84:	8082                	ret

1c009f86 <__rt_padframe_init>:
1c009f86:	1c001537          	lui	a0,0x1c001
1c009f8a:	00c50513          	addi	a0,a0,12 # 1c00100c <__rt_padframe_profiles>
1c009f8e:	bfe1                	j	1c009f66 <rt_padframe_set>

1c009f90 <__rt_time_poweroff>:
1c009f90:	1a10b7b7          	lui	a5,0x1a10b
1c009f94:	47d8                	lw	a4,12(a5)
1c009f96:	1c0017b7          	lui	a5,0x1c001
1c009f9a:	4501                	li	a0,0
1c009f9c:	1ce7aa23          	sw	a4,468(a5) # 1c0011d4 <timer_count>
1c009fa0:	8082                	ret

1c009fa2 <__rt_time_poweron>:
1c009fa2:	1c0017b7          	lui	a5,0x1c001
1c009fa6:	1d47a703          	lw	a4,468(a5) # 1c0011d4 <timer_count>
1c009faa:	1a10b7b7          	lui	a5,0x1a10b
1c009fae:	4501                	li	a0,0
1c009fb0:	c7d8                	sw	a4,12(a5)
1c009fb2:	8082                	ret

1c009fb4 <rt_event_push_delayed>:
1c009fb4:	30047373          	csrrci	t1,mstatus,8
1c009fb8:	1a10b6b7          	lui	a3,0x1a10b
1c009fbc:	46d0                	lw	a2,12(a3)
1c009fbe:	1c001737          	lui	a4,0x1c001
1c009fc2:	24072783          	lw	a5,576(a4) # 1c001240 <first_delayed>
1c009fc6:	86ba                	mv	a3,a4
1c009fc8:	0005d363          	bgez	a1,1c009fce <rt_event_push_delayed+0x1a>
1c009fcc:	4581                	li	a1,0
1c009fce:	4779                	li	a4,30
1c009fd0:	02e5c5b3          	div	a1,a1,a4
1c009fd4:	80000737          	lui	a4,0x80000
1c009fd8:	fff74713          	not	a4,a4
1c009fdc:	00e67833          	and	a6,a2,a4
1c009fe0:	0585                	addi	a1,a1,1
1c009fe2:	962e                	add	a2,a2,a1
1c009fe4:	d950                	sw	a2,52(a0)
1c009fe6:	982e                	add	a6,a6,a1
1c009fe8:	4601                	li	a2,0
1c009fea:	c799                	beqz	a5,1c009ff8 <rt_event_push_delayed+0x44>
1c009fec:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa10b020>
1c009ff0:	00e8f8b3          	and	a7,a7,a4
1c009ff4:	0108e863          	bltu	a7,a6,1c00a004 <rt_event_push_delayed+0x50>
1c009ff8:	ca09                	beqz	a2,1c00a00a <rt_event_push_delayed+0x56>
1c009ffa:	ce08                	sw	a0,24(a2)
1c009ffc:	cd1c                	sw	a5,24(a0)
1c009ffe:	30031073          	csrw	mstatus,t1
1c00a002:	8082                	ret
1c00a004:	863e                	mv	a2,a5
1c00a006:	4f9c                	lw	a5,24(a5)
1c00a008:	b7cd                	j	1c009fea <rt_event_push_delayed+0x36>
1c00a00a:	cd1c                	sw	a5,24(a0)
1c00a00c:	1a10b7b7          	lui	a5,0x1a10b
1c00a010:	47d8                	lw	a4,12(a5)
1c00a012:	24a6a023          	sw	a0,576(a3) # 1a10b240 <__l1_end+0xa10b22c>
1c00a016:	95ba                	add	a1,a1,a4
1c00a018:	cbcc                	sw	a1,20(a5)
1c00a01a:	08500713          	li	a4,133
1c00a01e:	c3d8                	sw	a4,4(a5)
1c00a020:	bff9                	j	1c009ffe <rt_event_push_delayed+0x4a>

1c00a022 <rt_time_wait_us>:
1c00a022:	1101                	addi	sp,sp,-32
1c00a024:	85aa                	mv	a1,a0
1c00a026:	4501                	li	a0,0
1c00a028:	ce06                	sw	ra,28(sp)
1c00a02a:	cc22                	sw	s0,24(sp)
1c00a02c:	c62e                	sw	a1,12(sp)
1c00a02e:	34dd                	jal	1c009b14 <rt_event_get_blocking>
1c00a030:	45b2                	lw	a1,12(sp)
1c00a032:	842a                	mv	s0,a0
1c00a034:	3741                	jal	1c009fb4 <rt_event_push_delayed>
1c00a036:	8522                	mv	a0,s0
1c00a038:	4462                	lw	s0,24(sp)
1c00a03a:	40f2                	lw	ra,28(sp)
1c00a03c:	6105                	addi	sp,sp,32
1c00a03e:	b65d                	j	1c009be4 <rt_event_wait>

1c00a040 <__rt_time_init>:
1c00a040:	1141                	addi	sp,sp,-16
1c00a042:	1c0017b7          	lui	a5,0x1c001
1c00a046:	2407a023          	sw	zero,576(a5) # 1c001240 <first_delayed>
1c00a04a:	08300713          	li	a4,131
1c00a04e:	1a10b7b7          	lui	a5,0x1a10b
1c00a052:	c606                	sw	ra,12(sp)
1c00a054:	c422                	sw	s0,8(sp)
1c00a056:	1c00a5b7          	lui	a1,0x1c00a
1c00a05a:	c3d8                	sw	a4,4(a5)
1c00a05c:	0d858593          	addi	a1,a1,216 # 1c00a0d8 <__rt_timer_handler>
1c00a060:	452d                	li	a0,11
1c00a062:	bc0ff0ef          	jal	ra,1c009422 <rt_irq_set_handler>
1c00a066:	f14027f3          	csrr	a5,mhartid
1c00a06a:	8795                	srai	a5,a5,0x5
1c00a06c:	6705                	lui	a4,0x1
1c00a06e:	03f7f793          	andi	a5,a5,63
1c00a072:	46fd                	li	a3,31
1c00a074:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a078:	04d79863          	bne	a5,a3,1c00a0c8 <__rt_time_init+0x88>
1c00a07c:	1a10a7b7          	lui	a5,0x1a10a
1c00a080:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c00a084:	1c00a5b7          	lui	a1,0x1c00a
1c00a088:	4601                	li	a2,0
1c00a08a:	f9058593          	addi	a1,a1,-112 # 1c009f90 <__rt_time_poweroff>
1c00a08e:	4509                	li	a0,2
1c00a090:	d22ff0ef          	jal	ra,1c0095b2 <__rt_cbsys_add>
1c00a094:	1c00a5b7          	lui	a1,0x1c00a
1c00a098:	842a                	mv	s0,a0
1c00a09a:	4601                	li	a2,0
1c00a09c:	fa258593          	addi	a1,a1,-94 # 1c009fa2 <__rt_time_poweron>
1c00a0a0:	450d                	li	a0,3
1c00a0a2:	d10ff0ef          	jal	ra,1c0095b2 <__rt_cbsys_add>
1c00a0a6:	8d41                	or	a0,a0,s0
1c00a0a8:	c505                	beqz	a0,1c00a0d0 <__rt_time_init+0x90>
1c00a0aa:	f1402673          	csrr	a2,mhartid
1c00a0ae:	1c000537          	lui	a0,0x1c000
1c00a0b2:	40565593          	srai	a1,a2,0x5
1c00a0b6:	03f5f593          	andi	a1,a1,63
1c00a0ba:	8a7d                	andi	a2,a2,31
1c00a0bc:	55850513          	addi	a0,a0,1368 # 1c000558 <__DTOR_END__+0x26c>
1c00a0c0:	015000ef          	jal	ra,1c00a8d4 <printf>
1c00a0c4:	79c000ef          	jal	ra,1c00a860 <abort>
1c00a0c8:	002047b7          	lui	a5,0x204
1c00a0cc:	cbd8                	sw	a4,20(a5)
1c00a0ce:	bf5d                	j	1c00a084 <__rt_time_init+0x44>
1c00a0d0:	40b2                	lw	ra,12(sp)
1c00a0d2:	4422                	lw	s0,8(sp)
1c00a0d4:	0141                	addi	sp,sp,16
1c00a0d6:	8082                	ret

1c00a0d8 <__rt_timer_handler>:
1c00a0d8:	7179                	addi	sp,sp,-48
1c00a0da:	ce36                	sw	a3,28(sp)
1c00a0dc:	cc3a                	sw	a4,24(sp)
1c00a0de:	1a10b6b7          	lui	a3,0x1a10b
1c00a0e2:	1c001737          	lui	a4,0x1c001
1c00a0e6:	d61a                	sw	t1,44(sp)
1c00a0e8:	d032                	sw	a2,32(sp)
1c00a0ea:	ca3e                	sw	a5,20(sp)
1c00a0ec:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa10aff8>
1c00a0f0:	24072783          	lw	a5,576(a4) # 1c001240 <first_delayed>
1c00a0f4:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a0f8:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a0fc:	c842                	sw	a6,16(sp)
1c00a0fe:	80000837          	lui	a6,0x80000
1c00a102:	d42a                	sw	a0,40(sp)
1c00a104:	d22e                	sw	a1,36(sp)
1c00a106:	c646                	sw	a7,12(sp)
1c00a108:	c472                	sw	t3,8(sp)
1c00a10a:	4581                	li	a1,0
1c00a10c:	4501                	li	a0,0
1c00a10e:	ffe84813          	xori	a6,a6,-2
1c00a112:	efb9                	bnez	a5,1c00a170 <__rt_timer_handler+0x98>
1c00a114:	c119                	beqz	a0,1c00a11a <__rt_timer_handler+0x42>
1c00a116:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a11a:	c199                	beqz	a1,1c00a120 <__rt_timer_handler+0x48>
1c00a11c:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a120:	24072023          	sw	zero,576(a4)
1c00a124:	1a10b7b7          	lui	a5,0x1a10b
1c00a128:	08100713          	li	a4,129
1c00a12c:	c3d8                	sw	a4,4(a5)
1c00a12e:	6785                	lui	a5,0x1
1c00a130:	1a10a737          	lui	a4,0x1a10a
1c00a134:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a138:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa109800>
1c00a13c:	5332                	lw	t1,44(sp)
1c00a13e:	5522                	lw	a0,40(sp)
1c00a140:	5592                	lw	a1,36(sp)
1c00a142:	5602                	lw	a2,32(sp)
1c00a144:	46f2                	lw	a3,28(sp)
1c00a146:	4762                	lw	a4,24(sp)
1c00a148:	47d2                	lw	a5,20(sp)
1c00a14a:	4842                	lw	a6,16(sp)
1c00a14c:	48b2                	lw	a7,12(sp)
1c00a14e:	4e22                	lw	t3,8(sp)
1c00a150:	6145                	addi	sp,sp,48
1c00a152:	30200073          	mret
1c00a156:	0187a883          	lw	a7,24(a5)
1c00a15a:	0007ac23          	sw	zero,24(a5)
1c00a15e:	c611                	beqz	a2,1c00a16a <__rt_timer_handler+0x92>
1c00a160:	ce9c                	sw	a5,24(a3)
1c00a162:	86be                	mv	a3,a5
1c00a164:	4585                	li	a1,1
1c00a166:	87c6                	mv	a5,a7
1c00a168:	b76d                	j	1c00a112 <__rt_timer_handler+0x3a>
1c00a16a:	863e                	mv	a2,a5
1c00a16c:	4505                	li	a0,1
1c00a16e:	bfd5                	j	1c00a162 <__rt_timer_handler+0x8a>
1c00a170:	0347a883          	lw	a7,52(a5)
1c00a174:	41130e33          	sub	t3,t1,a7
1c00a178:	fdc87fe3          	bleu	t3,a6,1c00a156 <__rt_timer_handler+0x7e>
1c00a17c:	c119                	beqz	a0,1c00a182 <__rt_timer_handler+0xaa>
1c00a17e:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a182:	c199                	beqz	a1,1c00a188 <__rt_timer_handler+0xb0>
1c00a184:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a188:	24f72023          	sw	a5,576(a4)
1c00a18c:	1a10b737          	lui	a4,0x1a10b
1c00a190:	475c                	lw	a5,12(a4)
1c00a192:	406787b3          	sub	a5,a5,t1
1c00a196:	97c6                	add	a5,a5,a7
1c00a198:	cb5c                	sw	a5,20(a4)
1c00a19a:	08500793          	li	a5,133
1c00a19e:	c35c                	sw	a5,4(a4)
1c00a1a0:	bf71                	j	1c00a13c <__rt_timer_handler+0x64>

1c00a1a2 <rt_periph_copy>:
1c00a1a2:	7179                	addi	sp,sp,-48
1c00a1a4:	d422                	sw	s0,40(sp)
1c00a1a6:	842a                	mv	s0,a0
1c00a1a8:	d606                	sw	ra,44(sp)
1c00a1aa:	d226                	sw	s1,36(sp)
1c00a1ac:	d04a                	sw	s2,32(sp)
1c00a1ae:	30047973          	csrrci	s2,mstatus,8
1c00a1b2:	4015d493          	srai	s1,a1,0x1
1c00a1b6:	1a102537          	lui	a0,0x1a102
1c00a1ba:	049e                	slli	s1,s1,0x7
1c00a1bc:	94aa                	add	s1,s1,a0
1c00a1be:	00459513          	slli	a0,a1,0x4
1c00a1c2:	8941                	andi	a0,a0,16
1c00a1c4:	94aa                	add	s1,s1,a0
1c00a1c6:	853e                	mv	a0,a5
1c00a1c8:	ef89                	bnez	a5,1c00a1e2 <rt_periph_copy+0x40>
1c00a1ca:	ce2e                	sw	a1,28(sp)
1c00a1cc:	cc32                	sw	a2,24(sp)
1c00a1ce:	ca36                	sw	a3,20(sp)
1c00a1d0:	c83a                	sw	a4,16(sp)
1c00a1d2:	c63e                	sw	a5,12(sp)
1c00a1d4:	897ff0ef          	jal	ra,1c009a6a <__rt_wait_event_prepare_blocking>
1c00a1d8:	47b2                	lw	a5,12(sp)
1c00a1da:	4742                	lw	a4,16(sp)
1c00a1dc:	46d2                	lw	a3,20(sp)
1c00a1de:	4662                	lw	a2,24(sp)
1c00a1e0:	45f2                	lw	a1,28(sp)
1c00a1e2:	e419                	bnez	s0,1c00a1f0 <rt_periph_copy+0x4e>
1c00a1e4:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa102020>
1c00a1e8:	04052023          	sw	zero,64(a0)
1c00a1ec:	04052823          	sw	zero,80(a0)
1c00a1f0:	00c42803          	lw	a6,12(s0)
1c00a1f4:	c054                	sw	a3,4(s0)
1c00a1f6:	cc08                	sw	a0,24(s0)
1c00a1f8:	00f87813          	andi	a6,a6,15
1c00a1fc:	4891                	li	a7,4
1c00a1fe:	01076713          	ori	a4,a4,16
1c00a202:	0708ec63          	bltu	a7,a6,1c00a27a <rt_periph_copy+0xd8>
1c00a206:	04000893          	li	a7,64
1c00a20a:	0596                	slli	a1,a1,0x5
1c00a20c:	98ae                	add	a7,a7,a1
1c00a20e:	0008a303          	lw	t1,0(a7)
1c00a212:	00042a23          	sw	zero,20(s0)
1c00a216:	04000813          	li	a6,64
1c00a21a:	02031663          	bnez	t1,1c00a246 <rt_periph_copy+0xa4>
1c00a21e:	0088a023          	sw	s0,0(a7)
1c00a222:	00b808b3          	add	a7,a6,a1
1c00a226:	0088a303          	lw	t1,8(a7)
1c00a22a:	0088a223          	sw	s0,4(a7)
1c00a22e:	02031163          	bnez	t1,1c00a250 <rt_periph_copy+0xae>
1c00a232:	0084a883          	lw	a7,8(s1)
1c00a236:	0208f893          	andi	a7,a7,32
1c00a23a:	00089b63          	bnez	a7,1c00a250 <rt_periph_copy+0xae>
1c00a23e:	c090                	sw	a2,0(s1)
1c00a240:	c0d4                	sw	a3,4(s1)
1c00a242:	c498                	sw	a4,8(s1)
1c00a244:	a005                	j	1c00a264 <rt_periph_copy+0xc2>
1c00a246:	0048a883          	lw	a7,4(a7)
1c00a24a:	0088aa23          	sw	s0,20(a7)
1c00a24e:	bfd1                	j	1c00a222 <rt_periph_copy+0x80>
1c00a250:	00042823          	sw	zero,16(s0)
1c00a254:	c010                	sw	a2,0(s0)
1c00a256:	c054                	sw	a3,4(s0)
1c00a258:	c418                	sw	a4,8(s0)
1c00a25a:	00031563          	bnez	t1,1c00a264 <rt_periph_copy+0xc2>
1c00a25e:	982e                	add	a6,a6,a1
1c00a260:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a264:	e399                	bnez	a5,1c00a26a <rt_periph_copy+0xc8>
1c00a266:	955ff0ef          	jal	ra,1c009bba <__rt_wait_event>
1c00a26a:	30091073          	csrw	mstatus,s2
1c00a26e:	50b2                	lw	ra,44(sp)
1c00a270:	5422                	lw	s0,40(sp)
1c00a272:	5492                	lw	s1,36(sp)
1c00a274:	5902                	lw	s2,32(sp)
1c00a276:	6145                	addi	sp,sp,48
1c00a278:	8082                	ret
1c00a27a:	4899                	li	a7,6
1c00a27c:	ff1814e3          	bne	a6,a7,1c00a264 <rt_periph_copy+0xc2>
1c00a280:	04000893          	li	a7,64
1c00a284:	0596                	slli	a1,a1,0x5
1c00a286:	98ae                	add	a7,a7,a1
1c00a288:	0008a303          	lw	t1,0(a7)
1c00a28c:	00042a23          	sw	zero,20(s0)
1c00a290:	04000813          	li	a6,64
1c00a294:	00031f63          	bnez	t1,1c00a2b2 <rt_periph_copy+0x110>
1c00a298:	0088a023          	sw	s0,0(a7)
1c00a29c:	95c2                	add	a1,a1,a6
1c00a29e:	c1c0                	sw	s0,4(a1)
1c00a2a0:	00031e63          	bnez	t1,1c00a2bc <rt_periph_copy+0x11a>
1c00a2a4:	02442803          	lw	a6,36(s0)
1c00a2a8:	1a1025b7          	lui	a1,0x1a102
1c00a2ac:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa10210c>
1c00a2b0:	b779                	j	1c00a23e <rt_periph_copy+0x9c>
1c00a2b2:	0048a883          	lw	a7,4(a7)
1c00a2b6:	0088aa23          	sw	s0,20(a7)
1c00a2ba:	b7cd                	j	1c00a29c <rt_periph_copy+0xfa>
1c00a2bc:	c418                	sw	a4,8(s0)
1c00a2be:	4598                	lw	a4,8(a1)
1c00a2c0:	c010                	sw	a2,0(s0)
1c00a2c2:	c054                	sw	a3,4(s0)
1c00a2c4:	00042823          	sw	zero,16(s0)
1c00a2c8:	ff51                	bnez	a4,1c00a264 <rt_periph_copy+0xc2>
1c00a2ca:	c580                	sw	s0,8(a1)
1c00a2cc:	bf61                	j	1c00a264 <rt_periph_copy+0xc2>

1c00a2ce <__rt_periph_init>:
1c00a2ce:	1c0085b7          	lui	a1,0x1c008
1c00a2d2:	04000693          	li	a3,64
1c00a2d6:	4601                	li	a2,0
1c00a2d8:	04000793          	li	a5,64
1c00a2dc:	1a1028b7          	lui	a7,0x1a102
1c00a2e0:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a2e4:	4841                	li	a6,16
1c00a2e6:	40165713          	srai	a4,a2,0x1
1c00a2ea:	00461513          	slli	a0,a2,0x4
1c00a2ee:	071e                	slli	a4,a4,0x7
1c00a2f0:	9746                	add	a4,a4,a7
1c00a2f2:	8941                	andi	a0,a0,16
1c00a2f4:	972a                	add	a4,a4,a0
1c00a2f6:	0006a023          	sw	zero,0(a3)
1c00a2fa:	0006a423          	sw	zero,8(a3)
1c00a2fe:	c6d8                	sw	a4,12(a3)
1c00a300:	cecc                	sw	a1,28(a3)
1c00a302:	0605                	addi	a2,a2,1
1c00a304:	02068693          	addi	a3,a3,32
1c00a308:	fd061fe3          	bne	a2,a6,1c00a2e6 <__rt_periph_init+0x18>
1c00a30c:	1c008737          	lui	a4,0x1c008
1c00a310:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a314:	2007a023          	sw	zero,512(a5)
1c00a318:	20e7a423          	sw	a4,520(a5)
1c00a31c:	20e7a623          	sw	a4,524(a5)
1c00a320:	20e7a823          	sw	a4,528(a5)
1c00a324:	20e7aa23          	sw	a4,532(a5)
1c00a328:	20e7ac23          	sw	a4,536(a5)
1c00a32c:	20e7ae23          	sw	a4,540(a5)
1c00a330:	22e7a023          	sw	a4,544(a5)
1c00a334:	22e7a223          	sw	a4,548(a5)
1c00a338:	2007a223          	sw	zero,516(a5)
1c00a33c:	8082                	ret

1c00a33e <__rt_i2c_init>:
1c00a33e:	1c0137b7          	lui	a5,0x1c013
1c00a342:	16878793          	addi	a5,a5,360 # 1c013168 <__rt_i2c>
1c00a346:	00078223          	sb	zero,4(a5)
1c00a34a:	00078a23          	sb	zero,20(a5)
1c00a34e:	8082                	ret

1c00a350 <__rt_hyper_init>:
1c00a350:	1c001737          	lui	a4,0x1c001
1c00a354:	26800793          	li	a5,616
1c00a358:	1c072c23          	sw	zero,472(a4) # 1c0011d8 <__pi_hyper_cluster_reqs_first>
1c00a35c:	577d                	li	a4,-1
1c00a35e:	0007aa23          	sw	zero,20(a5)
1c00a362:	0207a823          	sw	zero,48(a5)
1c00a366:	cf98                	sw	a4,24(a5)
1c00a368:	8082                	ret

1c00a36a <__rt_spim_init>:
1c00a36a:	1c0017b7          	lui	a5,0x1c001
1c00a36e:	1c07ae23          	sw	zero,476(a5) # 1c0011dc <__rt_spim_open_count>
1c00a372:	8082                	ret

1c00a374 <rt_is_fc>:
1c00a374:	f1402573          	csrr	a0,mhartid
1c00a378:	8515                	srai	a0,a0,0x5
1c00a37a:	03f57513          	andi	a0,a0,63
1c00a37e:	1505                	addi	a0,a0,-31
1c00a380:	00153513          	seqz	a0,a0
1c00a384:	8082                	ret

1c00a386 <__rt_io_end_of_flush>:
1c00a386:	1c0017b7          	lui	a5,0x1c001
1c00a38a:	1e07a223          	sw	zero,484(a5) # 1c0011e4 <__rt_io_pending_flush>
1c00a38e:	00052c23          	sw	zero,24(a0)
1c00a392:	8082                	ret

1c00a394 <__rt_io_uart_wait_req>:
1c00a394:	1141                	addi	sp,sp,-16
1c00a396:	c226                	sw	s1,4(sp)
1c00a398:	84aa                	mv	s1,a0
1c00a39a:	c606                	sw	ra,12(sp)
1c00a39c:	c422                	sw	s0,8(sp)
1c00a39e:	c04a                	sw	s2,0(sp)
1c00a3a0:	30047973          	csrrci	s2,mstatus,8
1c00a3a4:	1c001437          	lui	s0,0x1c001
1c00a3a8:	1e040413          	addi	s0,s0,480 # 1c0011e0 <__rt_io_event_current>
1c00a3ac:	4008                	lw	a0,0(s0)
1c00a3ae:	c509                	beqz	a0,1c00a3b8 <__rt_io_uart_wait_req+0x24>
1c00a3b0:	835ff0ef          	jal	ra,1c009be4 <rt_event_wait>
1c00a3b4:	00042023          	sw	zero,0(s0)
1c00a3b8:	4785                	li	a5,1
1c00a3ba:	08f48623          	sb	a5,140(s1)
1c00a3be:	08d4c783          	lbu	a5,141(s1)
1c00a3c2:	00201737          	lui	a4,0x201
1c00a3c6:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c00a3ca:	04078793          	addi	a5,a5,64
1c00a3ce:	07da                	slli	a5,a5,0x16
1c00a3d0:	97ba                	add	a5,a5,a4
1c00a3d2:	0007a023          	sw	zero,0(a5)
1c00a3d6:	30091073          	csrw	mstatus,s2
1c00a3da:	40b2                	lw	ra,12(sp)
1c00a3dc:	4422                	lw	s0,8(sp)
1c00a3de:	4492                	lw	s1,4(sp)
1c00a3e0:	4902                	lw	s2,0(sp)
1c00a3e2:	0141                	addi	sp,sp,16
1c00a3e4:	8082                	ret

1c00a3e6 <__rt_io_start>:
1c00a3e6:	1101                	addi	sp,sp,-32
1c00a3e8:	0028                	addi	a0,sp,8
1c00a3ea:	ce06                	sw	ra,28(sp)
1c00a3ec:	cc22                	sw	s0,24(sp)
1c00a3ee:	7df000ef          	jal	ra,1c00b3cc <rt_uart_conf_init>
1c00a3f2:	4585                	li	a1,1
1c00a3f4:	4501                	li	a0,0
1c00a3f6:	e8cff0ef          	jal	ra,1c009a82 <rt_event_alloc>
1c00a3fa:	547d                	li	s0,-1
1c00a3fc:	ed1d                	bnez	a0,1c00a43a <__rt_io_start+0x54>
1c00a3fe:	1c0017b7          	lui	a5,0x1c001
1c00a402:	0e07a783          	lw	a5,224(a5) # 1c0010e0 <__rt_iodev_uart_baudrate>
1c00a406:	842a                	mv	s0,a0
1c00a408:	1c001537          	lui	a0,0x1c001
1c00a40c:	e3ff6597          	auipc	a1,0xe3ff6
1c00a410:	c1c58593          	addi	a1,a1,-996 # 28 <__rt_sched>
1c00a414:	12c50513          	addi	a0,a0,300 # 1c00112c <__rt_io_event>
1c00a418:	c43e                	sw	a5,8(sp)
1c00a41a:	e3eff0ef          	jal	ra,1c009a58 <__rt_event_init>
1c00a41e:	1c0017b7          	lui	a5,0x1c001
1c00a422:	1f07a503          	lw	a0,496(a5) # 1c0011f0 <__rt_iodev_uart_channel>
1c00a426:	4681                	li	a3,0
1c00a428:	4601                	li	a2,0
1c00a42a:	002c                	addi	a1,sp,8
1c00a42c:	050d                	addi	a0,a0,3
1c00a42e:	7af000ef          	jal	ra,1c00b3dc <__rt_uart_open>
1c00a432:	1c0017b7          	lui	a5,0x1c001
1c00a436:	1ea7a423          	sw	a0,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a43a:	8522                	mv	a0,s0
1c00a43c:	40f2                	lw	ra,28(sp)
1c00a43e:	4462                	lw	s0,24(sp)
1c00a440:	6105                	addi	sp,sp,32
1c00a442:	8082                	ret

1c00a444 <rt_event_execute.isra.2.constprop.11>:
1c00a444:	1141                	addi	sp,sp,-16
1c00a446:	c606                	sw	ra,12(sp)
1c00a448:	c422                	sw	s0,8(sp)
1c00a44a:	30047473          	csrrci	s0,mstatus,8
1c00a44e:	4585                	li	a1,1
1c00a450:	e3ff6517          	auipc	a0,0xe3ff6
1c00a454:	bd850513          	addi	a0,a0,-1064 # 28 <__rt_sched>
1c00a458:	f02ff0ef          	jal	ra,1c009b5a <__rt_event_execute>
1c00a45c:	30041073          	csrw	mstatus,s0
1c00a460:	40b2                	lw	ra,12(sp)
1c00a462:	4422                	lw	s0,8(sp)
1c00a464:	0141                	addi	sp,sp,16
1c00a466:	8082                	ret

1c00a468 <__rt_io_lock>:
1c00a468:	1c0017b7          	lui	a5,0x1c001
1c00a46c:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a470:	c791                	beqz	a5,1c00a47c <__rt_io_lock+0x14>
1c00a472:	1c0017b7          	lui	a5,0x1c001
1c00a476:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a47a:	c3a1                	beqz	a5,1c00a4ba <__rt_io_lock+0x52>
1c00a47c:	7171                	addi	sp,sp,-176
1c00a47e:	d706                	sw	ra,172(sp)
1c00a480:	3dd5                	jal	1c00a374 <rt_is_fc>
1c00a482:	1c0017b7          	lui	a5,0x1c001
1c00a486:	c901                	beqz	a0,1c00a496 <__rt_io_lock+0x2e>
1c00a488:	ffc78513          	addi	a0,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a48c:	9baff0ef          	jal	ra,1c009646 <__rt_fc_lock>
1c00a490:	50ba                	lw	ra,172(sp)
1c00a492:	614d                	addi	sp,sp,176
1c00a494:	8082                	ret
1c00a496:	002c                	addi	a1,sp,8
1c00a498:	ffc78513          	addi	a0,a5,-4
1c00a49c:	a1cff0ef          	jal	ra,1c0096b8 <__rt_fc_cluster_lock>
1c00a4a0:	4689                	li	a3,2
1c00a4a2:	00204737          	lui	a4,0x204
1c00a4a6:	09c14783          	lbu	a5,156(sp)
1c00a4aa:	0ff7f793          	andi	a5,a5,255
1c00a4ae:	f3ed                	bnez	a5,1c00a490 <__rt_io_lock+0x28>
1c00a4b0:	c714                	sw	a3,8(a4)
1c00a4b2:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a4b6:	c354                	sw	a3,4(a4)
1c00a4b8:	b7fd                	j	1c00a4a6 <__rt_io_lock+0x3e>
1c00a4ba:	8082                	ret

1c00a4bc <__rt_io_unlock>:
1c00a4bc:	1c0017b7          	lui	a5,0x1c001
1c00a4c0:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a4c4:	c791                	beqz	a5,1c00a4d0 <__rt_io_unlock+0x14>
1c00a4c6:	1c0017b7          	lui	a5,0x1c001
1c00a4ca:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a4ce:	c3a1                	beqz	a5,1c00a50e <__rt_io_unlock+0x52>
1c00a4d0:	7171                	addi	sp,sp,-176
1c00a4d2:	d706                	sw	ra,172(sp)
1c00a4d4:	3545                	jal	1c00a374 <rt_is_fc>
1c00a4d6:	1c0017b7          	lui	a5,0x1c001
1c00a4da:	c901                	beqz	a0,1c00a4ea <__rt_io_unlock+0x2e>
1c00a4dc:	ffc78513          	addi	a0,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a4e0:	9a2ff0ef          	jal	ra,1c009682 <__rt_fc_unlock>
1c00a4e4:	50ba                	lw	ra,172(sp)
1c00a4e6:	614d                	addi	sp,sp,176
1c00a4e8:	8082                	ret
1c00a4ea:	002c                	addi	a1,sp,8
1c00a4ec:	ffc78513          	addi	a0,a5,-4
1c00a4f0:	a00ff0ef          	jal	ra,1c0096f0 <__rt_fc_cluster_unlock>
1c00a4f4:	4689                	li	a3,2
1c00a4f6:	00204737          	lui	a4,0x204
1c00a4fa:	09c14783          	lbu	a5,156(sp)
1c00a4fe:	0ff7f793          	andi	a5,a5,255
1c00a502:	f3ed                	bnez	a5,1c00a4e4 <__rt_io_unlock+0x28>
1c00a504:	c714                	sw	a3,8(a4)
1c00a506:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a50a:	c354                	sw	a3,4(a4)
1c00a50c:	b7fd                	j	1c00a4fa <__rt_io_unlock+0x3e>
1c00a50e:	8082                	ret

1c00a510 <__rt_io_uart_wait_pending>:
1c00a510:	7135                	addi	sp,sp,-160
1c00a512:	cd22                	sw	s0,152(sp)
1c00a514:	cf06                	sw	ra,156(sp)
1c00a516:	cb26                	sw	s1,148(sp)
1c00a518:	1c001437          	lui	s0,0x1c001
1c00a51c:	1e442783          	lw	a5,484(s0) # 1c0011e4 <__rt_io_pending_flush>
1c00a520:	e39d                	bnez	a5,1c00a546 <__rt_io_uart_wait_pending+0x36>
1c00a522:	1c001437          	lui	s0,0x1c001
1c00a526:	1e040413          	addi	s0,s0,480 # 1c0011e0 <__rt_io_event_current>
1c00a52a:	4004                	lw	s1,0(s0)
1c00a52c:	c881                	beqz	s1,1c00a53c <__rt_io_uart_wait_pending+0x2c>
1c00a52e:	3599                	jal	1c00a374 <rt_is_fc>
1c00a530:	cd19                	beqz	a0,1c00a54e <__rt_io_uart_wait_pending+0x3e>
1c00a532:	8526                	mv	a0,s1
1c00a534:	eb0ff0ef          	jal	ra,1c009be4 <rt_event_wait>
1c00a538:	00042023          	sw	zero,0(s0)
1c00a53c:	40fa                	lw	ra,156(sp)
1c00a53e:	446a                	lw	s0,152(sp)
1c00a540:	44da                	lw	s1,148(sp)
1c00a542:	610d                	addi	sp,sp,160
1c00a544:	8082                	ret
1c00a546:	3f9d                	jal	1c00a4bc <__rt_io_unlock>
1c00a548:	3df5                	jal	1c00a444 <rt_event_execute.isra.2.constprop.11>
1c00a54a:	3f39                	jal	1c00a468 <__rt_io_lock>
1c00a54c:	bfc1                	j	1c00a51c <__rt_io_uart_wait_pending+0xc>
1c00a54e:	f14027f3          	csrr	a5,mhartid
1c00a552:	8795                	srai	a5,a5,0x5
1c00a554:	03f7f793          	andi	a5,a5,63
1c00a558:	08f106a3          	sb	a5,141(sp)
1c00a55c:	1c00a7b7          	lui	a5,0x1c00a
1c00a560:	39478793          	addi	a5,a5,916 # 1c00a394 <__rt_io_uart_wait_req>
1c00a564:	c03e                	sw	a5,0(sp)
1c00a566:	00010793          	mv	a5,sp
1c00a56a:	4705                	li	a4,1
1c00a56c:	c23e                	sw	a5,4(sp)
1c00a56e:	850a                	mv	a0,sp
1c00a570:	1c0017b7          	lui	a5,0x1c001
1c00a574:	14e7a623          	sw	a4,332(a5) # 1c00114c <__rt_io_event+0x20>
1c00a578:	08010623          	sb	zero,140(sp)
1c00a57c:	d002                	sw	zero,32(sp)
1c00a57e:	d202                	sw	zero,36(sp)
1c00a580:	a17fe0ef          	jal	ra,1c008f96 <__rt_cluster_push_fc_event>
1c00a584:	4689                	li	a3,2
1c00a586:	00204737          	lui	a4,0x204
1c00a58a:	08c14783          	lbu	a5,140(sp)
1c00a58e:	0ff7f793          	andi	a5,a5,255
1c00a592:	f7cd                	bnez	a5,1c00a53c <__rt_io_uart_wait_pending+0x2c>
1c00a594:	c714                	sw	a3,8(a4)
1c00a596:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a59a:	c354                	sw	a3,4(a4)
1c00a59c:	b7fd                	j	1c00a58a <__rt_io_uart_wait_pending+0x7a>

1c00a59e <__rt_io_stop>:
1c00a59e:	1141                	addi	sp,sp,-16
1c00a5a0:	c422                	sw	s0,8(sp)
1c00a5a2:	1c001437          	lui	s0,0x1c001
1c00a5a6:	c606                	sw	ra,12(sp)
1c00a5a8:	1e840413          	addi	s0,s0,488 # 1c0011e8 <_rt_io_uart>
1c00a5ac:	3795                	jal	1c00a510 <__rt_io_uart_wait_pending>
1c00a5ae:	4008                	lw	a0,0(s0)
1c00a5b0:	4581                	li	a1,0
1c00a5b2:	6b3000ef          	jal	ra,1c00b464 <rt_uart_close>
1c00a5b6:	40b2                	lw	ra,12(sp)
1c00a5b8:	00042023          	sw	zero,0(s0)
1c00a5bc:	4422                	lw	s0,8(sp)
1c00a5be:	4501                	li	a0,0
1c00a5c0:	0141                	addi	sp,sp,16
1c00a5c2:	8082                	ret

1c00a5c4 <__rt_io_uart_flush.constprop.10>:
1c00a5c4:	7131                	addi	sp,sp,-192
1c00a5c6:	dd22                	sw	s0,184(sp)
1c00a5c8:	df06                	sw	ra,188(sp)
1c00a5ca:	db26                	sw	s1,180(sp)
1c00a5cc:	d94a                	sw	s2,176(sp)
1c00a5ce:	d74e                	sw	s3,172(sp)
1c00a5d0:	d552                	sw	s4,168(sp)
1c00a5d2:	d356                	sw	s5,164(sp)
1c00a5d4:	1c001437          	lui	s0,0x1c001
1c00a5d8:	1e442783          	lw	a5,484(s0) # 1c0011e4 <__rt_io_pending_flush>
1c00a5dc:	1e440a13          	addi	s4,s0,484
1c00a5e0:	e7bd                	bnez	a5,1c00a64e <__rt_io_uart_flush.constprop.10+0x8a>
1c00a5e2:	1c0014b7          	lui	s1,0x1c001
1c00a5e6:	01c48793          	addi	a5,s1,28 # 1c00101c <__hal_debug_struct>
1c00a5ea:	4f80                	lw	s0,24(a5)
1c00a5ec:	01c48a93          	addi	s5,s1,28
1c00a5f0:	c431                	beqz	s0,1c00a63c <__rt_io_uart_flush.constprop.10+0x78>
1c00a5f2:	3349                	jal	1c00a374 <rt_is_fc>
1c00a5f4:	1c0017b7          	lui	a5,0x1c001
1c00a5f8:	1e87a903          	lw	s2,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a5fc:	1c0019b7          	lui	s3,0x1c001
1c00a600:	cd29                	beqz	a0,1c00a65a <__rt_io_uart_flush.constprop.10+0x96>
1c00a602:	1c00a5b7          	lui	a1,0x1c00a
1c00a606:	4785                	li	a5,1
1c00a608:	01c48613          	addi	a2,s1,28
1c00a60c:	38658593          	addi	a1,a1,902 # 1c00a386 <__rt_io_end_of_flush>
1c00a610:	4501                	li	a0,0
1c00a612:	00fa2023          	sw	a5,0(s4)
1c00a616:	ce4ff0ef          	jal	ra,1c009afa <rt_event_get>
1c00a61a:	00492583          	lw	a1,4(s2)
1c00a61e:	87aa                	mv	a5,a0
1c00a620:	4701                	li	a4,0
1c00a622:	0586                	slli	a1,a1,0x1
1c00a624:	86a2                	mv	a3,s0
1c00a626:	03898613          	addi	a2,s3,56 # 1c001038 <__hal_debug_struct+0x1c>
1c00a62a:	0585                	addi	a1,a1,1
1c00a62c:	4501                	li	a0,0
1c00a62e:	b75ff0ef          	jal	ra,1c00a1a2 <rt_periph_copy>
1c00a632:	3569                	jal	1c00a4bc <__rt_io_unlock>
1c00a634:	000a2783          	lw	a5,0(s4)
1c00a638:	ef99                	bnez	a5,1c00a656 <__rt_io_uart_flush.constprop.10+0x92>
1c00a63a:	353d                	jal	1c00a468 <__rt_io_lock>
1c00a63c:	50fa                	lw	ra,188(sp)
1c00a63e:	546a                	lw	s0,184(sp)
1c00a640:	54da                	lw	s1,180(sp)
1c00a642:	594a                	lw	s2,176(sp)
1c00a644:	59ba                	lw	s3,172(sp)
1c00a646:	5a2a                	lw	s4,168(sp)
1c00a648:	5a9a                	lw	s5,164(sp)
1c00a64a:	6129                	addi	sp,sp,192
1c00a64c:	8082                	ret
1c00a64e:	35bd                	jal	1c00a4bc <__rt_io_unlock>
1c00a650:	3bd5                	jal	1c00a444 <rt_event_execute.isra.2.constprop.11>
1c00a652:	3d19                	jal	1c00a468 <__rt_io_lock>
1c00a654:	b751                	j	1c00a5d8 <__rt_io_uart_flush.constprop.10+0x14>
1c00a656:	33fd                	jal	1c00a444 <rt_event_execute.isra.2.constprop.11>
1c00a658:	bff1                	j	1c00a634 <__rt_io_uart_flush.constprop.10+0x70>
1c00a65a:	0054                	addi	a3,sp,4
1c00a65c:	8622                	mv	a2,s0
1c00a65e:	03898593          	addi	a1,s3,56
1c00a662:	854a                	mv	a0,s2
1c00a664:	64b000ef          	jal	ra,1c00b4ae <rt_uart_cluster_write>
1c00a668:	4689                	li	a3,2
1c00a66a:	00204737          	lui	a4,0x204
1c00a66e:	09c14783          	lbu	a5,156(sp)
1c00a672:	0ff7f793          	andi	a5,a5,255
1c00a676:	c781                	beqz	a5,1c00a67e <__rt_io_uart_flush.constprop.10+0xba>
1c00a678:	000aac23          	sw	zero,24(s5)
1c00a67c:	b7c1                	j	1c00a63c <__rt_io_uart_flush.constprop.10+0x78>
1c00a67e:	c714                	sw	a3,8(a4)
1c00a680:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a684:	c354                	sw	a3,4(a4)
1c00a686:	b7e5                	j	1c00a66e <__rt_io_uart_flush.constprop.10+0xaa>

1c00a688 <memset>:
1c00a688:	962a                	add	a2,a2,a0
1c00a68a:	87aa                	mv	a5,a0
1c00a68c:	00c79363          	bne	a5,a2,1c00a692 <memset+0xa>
1c00a690:	8082                	ret
1c00a692:	0785                	addi	a5,a5,1
1c00a694:	feb78fa3          	sb	a1,-1(a5)
1c00a698:	bfd5                	j	1c00a68c <memset+0x4>

1c00a69a <memcpy>:
1c00a69a:	962a                	add	a2,a2,a0
1c00a69c:	87aa                	mv	a5,a0
1c00a69e:	00c79363          	bne	a5,a2,1c00a6a4 <memcpy+0xa>
1c00a6a2:	8082                	ret
1c00a6a4:	0585                	addi	a1,a1,1
1c00a6a6:	fff5c703          	lbu	a4,-1(a1)
1c00a6aa:	0785                	addi	a5,a5,1
1c00a6ac:	fee78fa3          	sb	a4,-1(a5)
1c00a6b0:	b7fd                	j	1c00a69e <memcpy+0x4>

1c00a6b2 <memmove>:
1c00a6b2:	40b507b3          	sub	a5,a0,a1
1c00a6b6:	00c7e763          	bltu	a5,a2,1c00a6c4 <memmove+0x12>
1c00a6ba:	962e                	add	a2,a2,a1
1c00a6bc:	87aa                	mv	a5,a0
1c00a6be:	00c59e63          	bne	a1,a2,1c00a6da <memmove+0x28>
1c00a6c2:	8082                	ret
1c00a6c4:	167d                	addi	a2,a2,-1
1c00a6c6:	00c587b3          	add	a5,a1,a2
1c00a6ca:	0007c703          	lbu	a4,0(a5)
1c00a6ce:	00c507b3          	add	a5,a0,a2
1c00a6d2:	00e78023          	sb	a4,0(a5)
1c00a6d6:	f67d                	bnez	a2,1c00a6c4 <memmove+0x12>
1c00a6d8:	8082                	ret
1c00a6da:	0005c703          	lbu	a4,0(a1)
1c00a6de:	0785                	addi	a5,a5,1
1c00a6e0:	0585                	addi	a1,a1,1
1c00a6e2:	fee78fa3          	sb	a4,-1(a5)
1c00a6e6:	bfe1                	j	1c00a6be <memmove+0xc>

1c00a6e8 <strchr>:
1c00a6e8:	0ff5f593          	andi	a1,a1,255
1c00a6ec:	00054783          	lbu	a5,0(a0)
1c00a6f0:	00b78563          	beq	a5,a1,1c00a6fa <strchr+0x12>
1c00a6f4:	e781                	bnez	a5,1c00a6fc <strchr+0x14>
1c00a6f6:	c191                	beqz	a1,1c00a6fa <strchr+0x12>
1c00a6f8:	4501                	li	a0,0
1c00a6fa:	8082                	ret
1c00a6fc:	0505                	addi	a0,a0,1
1c00a6fe:	b7fd                	j	1c00a6ec <strchr+0x4>

1c00a700 <__rt_putc_debug_bridge>:
1c00a700:	1141                	addi	sp,sp,-16
1c00a702:	c422                	sw	s0,8(sp)
1c00a704:	1c001437          	lui	s0,0x1c001
1c00a708:	c226                	sw	s1,4(sp)
1c00a70a:	c606                	sw	ra,12(sp)
1c00a70c:	84aa                	mv	s1,a0
1c00a70e:	01c40413          	addi	s0,s0,28 # 1c00101c <__hal_debug_struct>
1c00a712:	485c                	lw	a5,20(s0)
1c00a714:	c791                	beqz	a5,1c00a720 <__rt_putc_debug_bridge+0x20>
1c00a716:	06400513          	li	a0,100
1c00a71a:	909ff0ef          	jal	ra,1c00a022 <rt_time_wait_us>
1c00a71e:	bfd5                	j	1c00a712 <__rt_putc_debug_bridge+0x12>
1c00a720:	4c1c                	lw	a5,24(s0)
1c00a722:	00178713          	addi	a4,a5,1
1c00a726:	97a2                	add	a5,a5,s0
1c00a728:	00978e23          	sb	s1,28(a5)
1c00a72c:	cc18                	sw	a4,24(s0)
1c00a72e:	4c14                	lw	a3,24(s0)
1c00a730:	08000793          	li	a5,128
1c00a734:	00f68563          	beq	a3,a5,1c00a73e <__rt_putc_debug_bridge+0x3e>
1c00a738:	47a9                	li	a5,10
1c00a73a:	00f49663          	bne	s1,a5,1c00a746 <__rt_putc_debug_bridge+0x46>
1c00a73e:	c701                	beqz	a4,1c00a746 <__rt_putc_debug_bridge+0x46>
1c00a740:	c858                	sw	a4,20(s0)
1c00a742:	00042c23          	sw	zero,24(s0)
1c00a746:	4c1c                	lw	a5,24(s0)
1c00a748:	e799                	bnez	a5,1c00a756 <__rt_putc_debug_bridge+0x56>
1c00a74a:	4422                	lw	s0,8(sp)
1c00a74c:	40b2                	lw	ra,12(sp)
1c00a74e:	4492                	lw	s1,4(sp)
1c00a750:	0141                	addi	sp,sp,16
1c00a752:	948ff06f          	j	1c00989a <__rt_bridge_printf_flush>
1c00a756:	40b2                	lw	ra,12(sp)
1c00a758:	4422                	lw	s0,8(sp)
1c00a75a:	4492                	lw	s1,4(sp)
1c00a75c:	0141                	addi	sp,sp,16
1c00a75e:	8082                	ret

1c00a760 <__rt_putc_uart>:
1c00a760:	1101                	addi	sp,sp,-32
1c00a762:	c62a                	sw	a0,12(sp)
1c00a764:	ce06                	sw	ra,28(sp)
1c00a766:	336d                	jal	1c00a510 <__rt_io_uart_wait_pending>
1c00a768:	1c0017b7          	lui	a5,0x1c001
1c00a76c:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00a770:	4f94                	lw	a3,24(a5)
1c00a772:	4532                	lw	a0,12(sp)
1c00a774:	00168713          	addi	a4,a3,1
1c00a778:	cf98                	sw	a4,24(a5)
1c00a77a:	97b6                	add	a5,a5,a3
1c00a77c:	00a78e23          	sb	a0,28(a5)
1c00a780:	08000793          	li	a5,128
1c00a784:	00f70563          	beq	a4,a5,1c00a78e <__rt_putc_uart+0x2e>
1c00a788:	47a9                	li	a5,10
1c00a78a:	00f51563          	bne	a0,a5,1c00a794 <__rt_putc_uart+0x34>
1c00a78e:	40f2                	lw	ra,28(sp)
1c00a790:	6105                	addi	sp,sp,32
1c00a792:	bd0d                	j	1c00a5c4 <__rt_io_uart_flush.constprop.10>
1c00a794:	40f2                	lw	ra,28(sp)
1c00a796:	6105                	addi	sp,sp,32
1c00a798:	8082                	ret

1c00a79a <tfp_putc.isra.8>:
1c00a79a:	1c0017b7          	lui	a5,0x1c001
1c00a79e:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a7a2:	c391                	beqz	a5,1c00a7a6 <tfp_putc.isra.8+0xc>
1c00a7a4:	bf75                	j	1c00a760 <__rt_putc_uart>
1c00a7a6:	1c0017b7          	lui	a5,0x1c001
1c00a7aa:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a7ae:	c395                	beqz	a5,1c00a7d2 <tfp_putc.isra.8+0x38>
1c00a7b0:	6689                	lui	a3,0x2
1c00a7b2:	f14027f3          	csrr	a5,mhartid
1c00a7b6:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a7ba:	00379713          	slli	a4,a5,0x3
1c00a7be:	078a                	slli	a5,a5,0x2
1c00a7c0:	0ff77713          	andi	a4,a4,255
1c00a7c4:	8ff5                	and	a5,a5,a3
1c00a7c6:	97ba                	add	a5,a5,a4
1c00a7c8:	1a10f737          	lui	a4,0x1a10f
1c00a7cc:	97ba                	add	a5,a5,a4
1c00a7ce:	c388                	sw	a0,0(a5)
1c00a7d0:	8082                	ret
1c00a7d2:	b73d                	j	1c00a700 <__rt_putc_debug_bridge>

1c00a7d4 <puts>:
1c00a7d4:	1141                	addi	sp,sp,-16
1c00a7d6:	c422                	sw	s0,8(sp)
1c00a7d8:	c606                	sw	ra,12(sp)
1c00a7da:	842a                	mv	s0,a0
1c00a7dc:	3171                	jal	1c00a468 <__rt_io_lock>
1c00a7de:	00044503          	lbu	a0,0(s0)
1c00a7e2:	c501                	beqz	a0,1c00a7ea <puts+0x16>
1c00a7e4:	3f5d                	jal	1c00a79a <tfp_putc.isra.8>
1c00a7e6:	0405                	addi	s0,s0,1
1c00a7e8:	bfdd                	j	1c00a7de <puts+0xa>
1c00a7ea:	4529                	li	a0,10
1c00a7ec:	377d                	jal	1c00a79a <tfp_putc.isra.8>
1c00a7ee:	31f9                	jal	1c00a4bc <__rt_io_unlock>
1c00a7f0:	40b2                	lw	ra,12(sp)
1c00a7f2:	4422                	lw	s0,8(sp)
1c00a7f4:	4501                	li	a0,0
1c00a7f6:	0141                	addi	sp,sp,16
1c00a7f8:	8082                	ret

1c00a7fa <fputc_locked>:
1c00a7fa:	1141                	addi	sp,sp,-16
1c00a7fc:	c422                	sw	s0,8(sp)
1c00a7fe:	842a                	mv	s0,a0
1c00a800:	0ff57513          	andi	a0,a0,255
1c00a804:	c606                	sw	ra,12(sp)
1c00a806:	3f51                	jal	1c00a79a <tfp_putc.isra.8>
1c00a808:	8522                	mv	a0,s0
1c00a80a:	40b2                	lw	ra,12(sp)
1c00a80c:	4422                	lw	s0,8(sp)
1c00a80e:	0141                	addi	sp,sp,16
1c00a810:	8082                	ret

1c00a812 <_prf_locked>:
1c00a812:	1101                	addi	sp,sp,-32
1c00a814:	ce06                	sw	ra,28(sp)
1c00a816:	c02a                	sw	a0,0(sp)
1c00a818:	c62e                	sw	a1,12(sp)
1c00a81a:	c432                	sw	a2,8(sp)
1c00a81c:	c236                	sw	a3,4(sp)
1c00a81e:	31a9                	jal	1c00a468 <__rt_io_lock>
1c00a820:	4692                	lw	a3,4(sp)
1c00a822:	4622                	lw	a2,8(sp)
1c00a824:	45b2                	lw	a1,12(sp)
1c00a826:	4502                	lw	a0,0(sp)
1c00a828:	2ae9                	jal	1c00aa02 <_prf>
1c00a82a:	c02a                	sw	a0,0(sp)
1c00a82c:	3941                	jal	1c00a4bc <__rt_io_unlock>
1c00a82e:	40f2                	lw	ra,28(sp)
1c00a830:	4502                	lw	a0,0(sp)
1c00a832:	6105                	addi	sp,sp,32
1c00a834:	8082                	ret

1c00a836 <exit>:
1c00a836:	1141                	addi	sp,sp,-16
1c00a838:	c606                	sw	ra,12(sp)
1c00a83a:	c422                	sw	s0,8(sp)
1c00a83c:	842a                	mv	s0,a0
1c00a83e:	85cff0ef          	jal	ra,1c00989a <__rt_bridge_printf_flush>
1c00a842:	80000537          	lui	a0,0x80000
1c00a846:	1c0017b7          	lui	a5,0x1c001
1c00a84a:	8c49                	or	s0,s0,a0
1c00a84c:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00a850:	c7c0                	sw	s0,12(a5)
1c00a852:	818ff0ef          	jal	ra,1c00986a <__rt_bridge_send_notif>
1c00a856:	1a1047b7          	lui	a5,0x1a104
1c00a85a:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa10408c>
1c00a85e:	a001                	j	1c00a85e <exit+0x28>

1c00a860 <abort>:
1c00a860:	1141                	addi	sp,sp,-16
1c00a862:	557d                	li	a0,-1
1c00a864:	c606                	sw	ra,12(sp)
1c00a866:	3fc1                	jal	1c00a836 <exit>

1c00a868 <__rt_io_init>:
1c00a868:	1c0017b7          	lui	a5,0x1c001
1c00a86c:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a870:	0007a223          	sw	zero,4(a5)
1c00a874:	0007a023          	sw	zero,0(a5)
1c00a878:	0007a623          	sw	zero,12(a5)
1c00a87c:	1c0017b7          	lui	a5,0x1c001
1c00a880:	1e07a423          	sw	zero,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a884:	1c0017b7          	lui	a5,0x1c001
1c00a888:	1e07a023          	sw	zero,480(a5) # 1c0011e0 <__rt_io_event_current>
1c00a88c:	1c0017b7          	lui	a5,0x1c001
1c00a890:	1ec7a703          	lw	a4,492(a5) # 1c0011ec <__rt_iodev>
1c00a894:	4785                	li	a5,1
1c00a896:	02f71e63          	bne	a4,a5,1c00a8d2 <__rt_io_init+0x6a>
1c00a89a:	1c00a5b7          	lui	a1,0x1c00a
1c00a89e:	1141                	addi	sp,sp,-16
1c00a8a0:	4601                	li	a2,0
1c00a8a2:	3e658593          	addi	a1,a1,998 # 1c00a3e6 <__rt_io_start>
1c00a8a6:	4501                	li	a0,0
1c00a8a8:	c606                	sw	ra,12(sp)
1c00a8aa:	d09fe0ef          	jal	ra,1c0095b2 <__rt_cbsys_add>
1c00a8ae:	1c00a5b7          	lui	a1,0x1c00a
1c00a8b2:	59e58593          	addi	a1,a1,1438 # 1c00a59e <__rt_io_stop>
1c00a8b6:	4601                	li	a2,0
1c00a8b8:	4505                	li	a0,1
1c00a8ba:	cf9fe0ef          	jal	ra,1c0095b2 <__rt_cbsys_add>
1c00a8be:	40b2                	lw	ra,12(sp)
1c00a8c0:	1c0017b7          	lui	a5,0x1c001
1c00a8c4:	1e07a223          	sw	zero,484(a5) # 1c0011e4 <__rt_io_pending_flush>
1c00a8c8:	4585                	li	a1,1
1c00a8ca:	4501                	li	a0,0
1c00a8cc:	0141                	addi	sp,sp,16
1c00a8ce:	9b4ff06f          	j	1c009a82 <rt_event_alloc>
1c00a8d2:	8082                	ret

1c00a8d4 <printf>:
1c00a8d4:	7139                	addi	sp,sp,-64
1c00a8d6:	d432                	sw	a2,40(sp)
1c00a8d8:	862a                	mv	a2,a0
1c00a8da:	1c00a537          	lui	a0,0x1c00a
1c00a8de:	d22e                	sw	a1,36(sp)
1c00a8e0:	d636                	sw	a3,44(sp)
1c00a8e2:	4589                	li	a1,2
1c00a8e4:	1054                	addi	a3,sp,36
1c00a8e6:	7fa50513          	addi	a0,a0,2042 # 1c00a7fa <fputc_locked>
1c00a8ea:	ce06                	sw	ra,28(sp)
1c00a8ec:	d83a                	sw	a4,48(sp)
1c00a8ee:	da3e                	sw	a5,52(sp)
1c00a8f0:	dc42                	sw	a6,56(sp)
1c00a8f2:	de46                	sw	a7,60(sp)
1c00a8f4:	c636                	sw	a3,12(sp)
1c00a8f6:	3f31                	jal	1c00a812 <_prf_locked>
1c00a8f8:	40f2                	lw	ra,28(sp)
1c00a8fa:	6121                	addi	sp,sp,64
1c00a8fc:	8082                	ret

1c00a8fe <_to_x>:
1c00a8fe:	872a                	mv	a4,a0
1c00a900:	87aa                	mv	a5,a0
1c00a902:	4325                	li	t1,9
1c00a904:	02c5f8b3          	remu	a7,a1,a2
1c00a908:	02700513          	li	a0,39
1c00a90c:	02c5d5b3          	divu	a1,a1,a2
1c00a910:	0ff8f813          	andi	a6,a7,255
1c00a914:	01136363          	bltu	t1,a7,1c00a91a <_to_x+0x1c>
1c00a918:	4501                	li	a0,0
1c00a91a:	03080813          	addi	a6,a6,48
1c00a91e:	0785                	addi	a5,a5,1
1c00a920:	9542                	add	a0,a0,a6
1c00a922:	fea78fa3          	sb	a0,-1(a5)
1c00a926:	fdf9                	bnez	a1,1c00a904 <_to_x+0x6>
1c00a928:	03000613          	li	a2,48
1c00a92c:	40e78533          	sub	a0,a5,a4
1c00a930:	00d54863          	blt	a0,a3,1c00a940 <_to_x+0x42>
1c00a934:	00078023          	sb	zero,0(a5)
1c00a938:	17fd                	addi	a5,a5,-1
1c00a93a:	00f76763          	bltu	a4,a5,1c00a948 <_to_x+0x4a>
1c00a93e:	8082                	ret
1c00a940:	0785                	addi	a5,a5,1
1c00a942:	fec78fa3          	sb	a2,-1(a5)
1c00a946:	b7dd                	j	1c00a92c <_to_x+0x2e>
1c00a948:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10efec>
1c00a94c:	0007c683          	lbu	a3,0(a5)
1c00a950:	0705                	addi	a4,a4,1
1c00a952:	00c78023          	sb	a2,0(a5)
1c00a956:	fed70fa3          	sb	a3,-1(a4)
1c00a95a:	17fd                	addi	a5,a5,-1
1c00a95c:	bff9                	j	1c00a93a <_to_x+0x3c>

1c00a95e <_rlrshift>:
1c00a95e:	411c                	lw	a5,0(a0)
1c00a960:	4154                	lw	a3,4(a0)
1c00a962:	0017f713          	andi	a4,a5,1
1c00a966:	01f69613          	slli	a2,a3,0x1f
1c00a96a:	8385                	srli	a5,a5,0x1
1c00a96c:	8fd1                	or	a5,a5,a2
1c00a96e:	97ba                	add	a5,a5,a4
1c00a970:	8285                	srli	a3,a3,0x1
1c00a972:	00e7b733          	sltu	a4,a5,a4
1c00a976:	9736                	add	a4,a4,a3
1c00a978:	c11c                	sw	a5,0(a0)
1c00a97a:	c158                	sw	a4,4(a0)
1c00a97c:	8082                	ret

1c00a97e <_ldiv5>:
1c00a97e:	4118                	lw	a4,0(a0)
1c00a980:	4154                	lw	a3,4(a0)
1c00a982:	4615                	li	a2,5
1c00a984:	00270793          	addi	a5,a4,2
1c00a988:	00e7b733          	sltu	a4,a5,a4
1c00a98c:	9736                	add	a4,a4,a3
1c00a98e:	02c755b3          	divu	a1,a4,a2
1c00a992:	02b606b3          	mul	a3,a2,a1
1c00a996:	8f15                	sub	a4,a4,a3
1c00a998:	01d71693          	slli	a3,a4,0x1d
1c00a99c:	0037d713          	srli	a4,a5,0x3
1c00a9a0:	8f55                	or	a4,a4,a3
1c00a9a2:	02c75733          	divu	a4,a4,a2
1c00a9a6:	01d75693          	srli	a3,a4,0x1d
1c00a9aa:	070e                	slli	a4,a4,0x3
1c00a9ac:	95b6                	add	a1,a1,a3
1c00a9ae:	02e606b3          	mul	a3,a2,a4
1c00a9b2:	8f95                	sub	a5,a5,a3
1c00a9b4:	02c7d7b3          	divu	a5,a5,a2
1c00a9b8:	973e                	add	a4,a4,a5
1c00a9ba:	00f737b3          	sltu	a5,a4,a5
1c00a9be:	97ae                	add	a5,a5,a1
1c00a9c0:	c118                	sw	a4,0(a0)
1c00a9c2:	c15c                	sw	a5,4(a0)
1c00a9c4:	8082                	ret

1c00a9c6 <_get_digit>:
1c00a9c6:	419c                	lw	a5,0(a1)
1c00a9c8:	03000713          	li	a4,48
1c00a9cc:	02f05863          	blez	a5,1c00a9fc <_get_digit+0x36>
1c00a9d0:	17fd                	addi	a5,a5,-1
1c00a9d2:	4114                	lw	a3,0(a0)
1c00a9d4:	c19c                	sw	a5,0(a1)
1c00a9d6:	415c                	lw	a5,4(a0)
1c00a9d8:	4729                	li	a4,10
1c00a9da:	02d70633          	mul	a2,a4,a3
1c00a9de:	02f707b3          	mul	a5,a4,a5
1c00a9e2:	c110                	sw	a2,0(a0)
1c00a9e4:	02d73733          	mulhu	a4,a4,a3
1c00a9e8:	100006b7          	lui	a3,0x10000
1c00a9ec:	16fd                	addi	a3,a3,-1
1c00a9ee:	97ba                	add	a5,a5,a4
1c00a9f0:	01c7d713          	srli	a4,a5,0x1c
1c00a9f4:	8ff5                	and	a5,a5,a3
1c00a9f6:	03070713          	addi	a4,a4,48
1c00a9fa:	c15c                	sw	a5,4(a0)
1c00a9fc:	0ff77513          	andi	a0,a4,255
1c00aa00:	8082                	ret

1c00aa02 <_prf>:
1c00aa02:	714d                	addi	sp,sp,-336
1c00aa04:	14912223          	sw	s1,324(sp)
1c00aa08:	13312e23          	sw	s3,316(sp)
1c00aa0c:	13812423          	sw	s8,296(sp)
1c00aa10:	14112623          	sw	ra,332(sp)
1c00aa14:	14812423          	sw	s0,328(sp)
1c00aa18:	15212023          	sw	s2,320(sp)
1c00aa1c:	13412c23          	sw	s4,312(sp)
1c00aa20:	13512a23          	sw	s5,308(sp)
1c00aa24:	13612823          	sw	s6,304(sp)
1c00aa28:	13712623          	sw	s7,300(sp)
1c00aa2c:	13912223          	sw	s9,292(sp)
1c00aa30:	13a12023          	sw	s10,288(sp)
1c00aa34:	11b12e23          	sw	s11,284(sp)
1c00aa38:	cc2a                	sw	a0,24(sp)
1c00aa3a:	ce2e                	sw	a1,28(sp)
1c00aa3c:	84b2                	mv	s1,a2
1c00aa3e:	8c36                	mv	s8,a3
1c00aa40:	4981                	li	s3,0
1c00aa42:	0004c503          	lbu	a0,0(s1)
1c00aa46:	00148b93          	addi	s7,s1,1
1c00aa4a:	cd01                	beqz	a0,1c00aa62 <_prf+0x60>
1c00aa4c:	02500793          	li	a5,37
1c00aa50:	14f50963          	beq	a0,a5,1c00aba2 <_prf+0x1a0>
1c00aa54:	45f2                	lw	a1,28(sp)
1c00aa56:	4762                	lw	a4,24(sp)
1c00aa58:	9702                	jalr	a4
1c00aa5a:	57fd                	li	a5,-1
1c00aa5c:	04f51063          	bne	a0,a5,1c00aa9c <_prf+0x9a>
1c00aa60:	59fd                	li	s3,-1
1c00aa62:	14c12083          	lw	ra,332(sp)
1c00aa66:	14812403          	lw	s0,328(sp)
1c00aa6a:	854e                	mv	a0,s3
1c00aa6c:	14412483          	lw	s1,324(sp)
1c00aa70:	14012903          	lw	s2,320(sp)
1c00aa74:	13c12983          	lw	s3,316(sp)
1c00aa78:	13812a03          	lw	s4,312(sp)
1c00aa7c:	13412a83          	lw	s5,308(sp)
1c00aa80:	13012b03          	lw	s6,304(sp)
1c00aa84:	12c12b83          	lw	s7,300(sp)
1c00aa88:	12812c03          	lw	s8,296(sp)
1c00aa8c:	12412c83          	lw	s9,292(sp)
1c00aa90:	12012d03          	lw	s10,288(sp)
1c00aa94:	11c12d83          	lw	s11,284(sp)
1c00aa98:	6171                	addi	sp,sp,336
1c00aa9a:	8082                	ret
1c00aa9c:	0985                	addi	s3,s3,1
1c00aa9e:	8a62                	mv	s4,s8
1c00aaa0:	84de                	mv	s1,s7
1c00aaa2:	8c52                	mv	s8,s4
1c00aaa4:	bf79                	j	1c00aa42 <_prf+0x40>
1c00aaa6:	0f2a8563          	beq	s5,s2,1c00ab90 <_prf+0x18e>
1c00aaaa:	0d596863          	bltu	s2,s5,1c00ab7a <_prf+0x178>
1c00aaae:	fa0a8ae3          	beqz	s5,1c00aa62 <_prf+0x60>
1c00aab2:	0dba8d63          	beq	s5,s11,1c00ab8c <_prf+0x18a>
1c00aab6:	8ba6                	mv	s7,s1
1c00aab8:	001b8493          	addi	s1,s7,1
1c00aabc:	fff4ca83          	lbu	s5,-1(s1)
1c00aac0:	1c0007b7          	lui	a5,0x1c000
1c00aac4:	6a878513          	addi	a0,a5,1704 # 1c0006a8 <__DTOR_END__+0x3bc>
1c00aac8:	85d6                	mv	a1,s5
1c00aaca:	3939                	jal	1c00a6e8 <strchr>
1c00aacc:	fd69                	bnez	a0,1c00aaa6 <_prf+0xa4>
1c00aace:	02a00693          	li	a3,42
1c00aad2:	0eda9a63          	bne	s5,a3,1c00abc6 <_prf+0x1c4>
1c00aad6:	000c2903          	lw	s2,0(s8)
1c00aada:	004c0693          	addi	a3,s8,4
1c00aade:	00095663          	bgez	s2,1c00aaea <_prf+0xe8>
1c00aae2:	4705                	li	a4,1
1c00aae4:	41200933          	neg	s2,s2
1c00aae8:	c63a                	sw	a4,12(sp)
1c00aaea:	0004ca83          	lbu	s5,0(s1)
1c00aaee:	8c36                	mv	s8,a3
1c00aaf0:	002b8493          	addi	s1,s7,2
1c00aaf4:	0c800713          	li	a4,200
1c00aaf8:	01277463          	bleu	s2,a4,1c00ab00 <_prf+0xfe>
1c00aafc:	0c800913          	li	s2,200
1c00ab00:	02e00693          	li	a3,46
1c00ab04:	5d7d                	li	s10,-1
1c00ab06:	02da9463          	bne	s5,a3,1c00ab2e <_prf+0x12c>
1c00ab0a:	0004c703          	lbu	a4,0(s1)
1c00ab0e:	02a00793          	li	a5,42
1c00ab12:	10f71063          	bne	a4,a5,1c00ac12 <_prf+0x210>
1c00ab16:	000c2d03          	lw	s10,0(s8)
1c00ab1a:	0485                	addi	s1,s1,1
1c00ab1c:	0c11                	addi	s8,s8,4
1c00ab1e:	0c800793          	li	a5,200
1c00ab22:	01a7d363          	ble	s10,a5,1c00ab28 <_prf+0x126>
1c00ab26:	5d7d                	li	s10,-1
1c00ab28:	0004ca83          	lbu	s5,0(s1)
1c00ab2c:	0485                	addi	s1,s1,1
1c00ab2e:	1c0007b7          	lui	a5,0x1c000
1c00ab32:	85d6                	mv	a1,s5
1c00ab34:	6b078513          	addi	a0,a5,1712 # 1c0006b0 <__DTOR_END__+0x3c4>
1c00ab38:	bb1ff0ef          	jal	ra,1c00a6e8 <strchr>
1c00ab3c:	c501                	beqz	a0,1c00ab44 <_prf+0x142>
1c00ab3e:	0004ca83          	lbu	s5,0(s1)
1c00ab42:	0485                	addi	s1,s1,1
1c00ab44:	06700693          	li	a3,103
1c00ab48:	1356c263          	blt	a3,s5,1c00ac6c <_prf+0x26a>
1c00ab4c:	06500693          	li	a3,101
1c00ab50:	1edadd63          	ble	a3,s5,1c00ad4a <_prf+0x348>
1c00ab54:	04700693          	li	a3,71
1c00ab58:	0d56c163          	blt	a3,s5,1c00ac1a <_prf+0x218>
1c00ab5c:	04500693          	li	a3,69
1c00ab60:	1edad563          	ble	a3,s5,1c00ad4a <_prf+0x348>
1c00ab64:	ee0a8fe3          	beqz	s5,1c00aa62 <_prf+0x60>
1c00ab68:	02500713          	li	a4,37
1c00ab6c:	68ea8263          	beq	s5,a4,1c00b1f0 <_prf+0x7ee>
1c00ab70:	0c800713          	li	a4,200
1c00ab74:	69575763          	ble	s5,a4,1c00b202 <_prf+0x800>
1c00ab78:	b5e5                	j	1c00aa60 <_prf+0x5e>
1c00ab7a:	034a8163          	beq	s5,s4,1c00ab9c <_prf+0x19a>
1c00ab7e:	016a8b63          	beq	s5,s6,1c00ab94 <_prf+0x192>
1c00ab82:	f3aa9ae3          	bne	s5,s10,1c00aab6 <_prf+0xb4>
1c00ab86:	4785                	li	a5,1
1c00ab88:	ca3e                	sw	a5,20(sp)
1c00ab8a:	b735                	j	1c00aab6 <_prf+0xb4>
1c00ab8c:	4405                	li	s0,1
1c00ab8e:	b725                	j	1c00aab6 <_prf+0xb4>
1c00ab90:	4c85                	li	s9,1
1c00ab92:	b715                	j	1c00aab6 <_prf+0xb4>
1c00ab94:	03000713          	li	a4,48
1c00ab98:	c83a                	sw	a4,16(sp)
1c00ab9a:	bf31                	j	1c00aab6 <_prf+0xb4>
1c00ab9c:	4785                	li	a5,1
1c00ab9e:	c63e                	sw	a5,12(sp)
1c00aba0:	bf19                	j	1c00aab6 <_prf+0xb4>
1c00aba2:	02000713          	li	a4,32
1c00aba6:	c83a                	sw	a4,16(sp)
1c00aba8:	4401                	li	s0,0
1c00abaa:	ca02                	sw	zero,20(sp)
1c00abac:	c602                	sw	zero,12(sp)
1c00abae:	4c81                	li	s9,0
1c00abb0:	02300913          	li	s2,35
1c00abb4:	02d00a13          	li	s4,45
1c00abb8:	03000b13          	li	s6,48
1c00abbc:	02b00d13          	li	s10,43
1c00abc0:	02000d93          	li	s11,32
1c00abc4:	bdd5                	j	1c00aab8 <_prf+0xb6>
1c00abc6:	fd0a8693          	addi	a3,s5,-48
1c00abca:	4625                	li	a2,9
1c00abcc:	4901                	li	s2,0
1c00abce:	45a9                	li	a1,10
1c00abd0:	f2d662e3          	bltu	a2,a3,1c00aaf4 <_prf+0xf2>
1c00abd4:	000bc683          	lbu	a3,0(s7)
1c00abd8:	001b8493          	addi	s1,s7,1
1c00abdc:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xffeffe4>
1c00abe0:	8ab6                	mv	s5,a3
1c00abe2:	f0e669e3          	bltu	a2,a4,1c00aaf4 <_prf+0xf2>
1c00abe6:	02b90933          	mul	s2,s2,a1
1c00abea:	8ba6                	mv	s7,s1
1c00abec:	9936                	add	s2,s2,a3
1c00abee:	fd090913          	addi	s2,s2,-48
1c00abf2:	b7cd                	j	1c00abd4 <_prf+0x1d2>
1c00abf4:	02ad0733          	mul	a4,s10,a0
1c00abf8:	84ae                	mv	s1,a1
1c00abfa:	973e                	add	a4,a4,a5
1c00abfc:	fd070d13          	addi	s10,a4,-48
1c00ac00:	0004c783          	lbu	a5,0(s1)
1c00ac04:	00148593          	addi	a1,s1,1
1c00ac08:	fd078613          	addi	a2,a5,-48
1c00ac0c:	fec6f4e3          	bleu	a2,a3,1c00abf4 <_prf+0x1f2>
1c00ac10:	b739                	j	1c00ab1e <_prf+0x11c>
1c00ac12:	4d01                	li	s10,0
1c00ac14:	46a5                	li	a3,9
1c00ac16:	4529                	li	a0,10
1c00ac18:	b7e5                	j	1c00ac00 <_prf+0x1fe>
1c00ac1a:	06300693          	li	a3,99
1c00ac1e:	0cda8b63          	beq	s5,a3,1c00acf4 <_prf+0x2f2>
1c00ac22:	0756c563          	blt	a3,s5,1c00ac8c <_prf+0x28a>
1c00ac26:	05800693          	li	a3,88
1c00ac2a:	f4da93e3          	bne	s5,a3,1c00ab70 <_prf+0x16e>
1c00ac2e:	04410b93          	addi	s7,sp,68
1c00ac32:	004c0a13          	addi	s4,s8,4
1c00ac36:	000c2583          	lw	a1,0(s8)
1c00ac3a:	845e                	mv	s0,s7
1c00ac3c:	000c8963          	beqz	s9,1c00ac4e <_prf+0x24c>
1c00ac40:	76e1                	lui	a3,0xffff8
1c00ac42:	8306c693          	xori	a3,a3,-2000
1c00ac46:	04d11223          	sh	a3,68(sp)
1c00ac4a:	04610413          	addi	s0,sp,70
1c00ac4e:	86ea                	mv	a3,s10
1c00ac50:	4641                	li	a2,16
1c00ac52:	8522                	mv	a0,s0
1c00ac54:	316d                	jal	1c00a8fe <_to_x>
1c00ac56:	05800693          	li	a3,88
1c00ac5a:	58da8863          	beq	s5,a3,1c00b1ea <_prf+0x7e8>
1c00ac5e:	41740433          	sub	s0,s0,s7
1c00ac62:	9522                	add	a0,a0,s0
1c00ac64:	01903433          	snez	s0,s9
1c00ac68:	0406                	slli	s0,s0,0x1
1c00ac6a:	a8c9                	j	1c00ad3c <_prf+0x33a>
1c00ac6c:	07000693          	li	a3,112
1c00ac70:	50da8163          	beq	s5,a3,1c00b172 <_prf+0x770>
1c00ac74:	0556c163          	blt	a3,s5,1c00acb6 <_prf+0x2b4>
1c00ac78:	06e00693          	li	a3,110
1c00ac7c:	46da8b63          	beq	s5,a3,1c00b0f2 <_prf+0x6f0>
1c00ac80:	4956c063          	blt	a3,s5,1c00b100 <_prf+0x6fe>
1c00ac84:	06900693          	li	a3,105
1c00ac88:	eeda94e3          	bne	s5,a3,1c00ab70 <_prf+0x16e>
1c00ac8c:	000c2a83          	lw	s5,0(s8)
1c00ac90:	004c0a13          	addi	s4,s8,4
1c00ac94:	04410b13          	addi	s6,sp,68
1c00ac98:	060ad963          	bgez	s5,1c00ad0a <_prf+0x308>
1c00ac9c:	02d00693          	li	a3,45
1c00aca0:	04d10223          	sb	a3,68(sp)
1c00aca4:	800006b7          	lui	a3,0x80000
1c00aca8:	415005b3          	neg	a1,s5
1c00acac:	06da9963          	bne	s5,a3,1c00ad1e <_prf+0x31c>
1c00acb0:	800005b7          	lui	a1,0x80000
1c00acb4:	a0ad                	j	1c00ad1e <_prf+0x31c>
1c00acb6:	07500693          	li	a3,117
1c00acba:	50da8063          	beq	s5,a3,1c00b1ba <_prf+0x7b8>
1c00acbe:	07800693          	li	a3,120
1c00acc2:	f6da86e3          	beq	s5,a3,1c00ac2e <_prf+0x22c>
1c00acc6:	07300693          	li	a3,115
1c00acca:	eada93e3          	bne	s5,a3,1c00ab70 <_prf+0x16e>
1c00acce:	000c2583          	lw	a1,0(s8)
1c00acd2:	004c0a13          	addi	s4,s8,4
1c00acd6:	4c81                	li	s9,0
1c00acd8:	0c800793          	li	a5,200
1c00acdc:	019586b3          	add	a3,a1,s9
1c00ace0:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00ace4:	4a068f63          	beqz	a3,1c00b1a2 <_prf+0x7a0>
1c00ace8:	0c85                	addi	s9,s9,1
1c00acea:	fefc99e3          	bne	s9,a5,1c00acdc <_prf+0x2da>
1c00acee:	4a0d5c63          	bgez	s10,1c00b1a6 <_prf+0x7a4>
1c00acf2:	a97d                	j	1c00b1b0 <_prf+0x7ae>
1c00acf4:	000c2783          	lw	a5,0(s8)
1c00acf8:	004c0a13          	addi	s4,s8,4
1c00acfc:	040102a3          	sb	zero,69(sp)
1c00ad00:	04f10223          	sb	a5,68(sp)
1c00ad04:	4c85                	li	s9,1
1c00ad06:	4401                	li	s0,0
1c00ad08:	a105                	j	1c00b128 <_prf+0x726>
1c00ad0a:	4752                	lw	a4,20(sp)
1c00ad0c:	02b00693          	li	a3,43
1c00ad10:	e701                	bnez	a4,1c00ad18 <_prf+0x316>
1c00ad12:	c41d                	beqz	s0,1c00ad40 <_prf+0x33e>
1c00ad14:	02000693          	li	a3,32
1c00ad18:	04d10223          	sb	a3,68(sp)
1c00ad1c:	85d6                	mv	a1,s5
1c00ad1e:	04510c13          	addi	s8,sp,69
1c00ad22:	86ea                	mv	a3,s10
1c00ad24:	4629                	li	a2,10
1c00ad26:	8562                	mv	a0,s8
1c00ad28:	bd7ff0ef          	jal	ra,1c00a8fe <_to_x>
1c00ad2c:	47d2                	lw	a5,20(sp)
1c00ad2e:	9562                	add	a0,a0,s8
1c00ad30:	41650533          	sub	a0,a0,s6
1c00ad34:	eb89                	bnez	a5,1c00ad46 <_prf+0x344>
1c00ad36:	e019                	bnez	s0,1c00ad3c <_prf+0x33a>
1c00ad38:	01fad413          	srli	s0,s5,0x1f
1c00ad3c:	57fd                	li	a5,-1
1c00ad3e:	a9a1                	j	1c00b196 <_prf+0x794>
1c00ad40:	85d6                	mv	a1,s5
1c00ad42:	8c5a                	mv	s8,s6
1c00ad44:	bff9                	j	1c00ad22 <_prf+0x320>
1c00ad46:	4452                	lw	s0,20(sp)
1c00ad48:	bfd5                	j	1c00ad3c <_prf+0x33a>
1c00ad4a:	0c1d                	addi	s8,s8,7
1c00ad4c:	ff8c7c13          	andi	s8,s8,-8
1c00ad50:	000c2883          	lw	a7,0(s8)
1c00ad54:	004c2303          	lw	t1,4(s8)
1c00ad58:	80000737          	lui	a4,0x80000
1c00ad5c:	0158d593          	srli	a1,a7,0x15
1c00ad60:	00b31693          	slli	a3,t1,0xb
1c00ad64:	8ecd                	or	a3,a3,a1
1c00ad66:	fff74713          	not	a4,a4
1c00ad6a:	01435613          	srli	a2,t1,0x14
1c00ad6e:	08ae                	slli	a7,a7,0xb
1c00ad70:	8ef9                	and	a3,a3,a4
1c00ad72:	7ff67613          	andi	a2,a2,2047
1c00ad76:	d846                	sw	a7,48(sp)
1c00ad78:	da36                	sw	a3,52(sp)
1c00ad7a:	7ff00593          	li	a1,2047
1c00ad7e:	008c0a13          	addi	s4,s8,8
1c00ad82:	08b61d63          	bne	a2,a1,1c00ae1c <_prf+0x41a>
1c00ad86:	00d0                	addi	a2,sp,68
1c00ad88:	8732                	mv	a4,a2
1c00ad8a:	00035863          	bgez	t1,1c00ad9a <_prf+0x398>
1c00ad8e:	02d00713          	li	a4,45
1c00ad92:	04e10223          	sb	a4,68(sp)
1c00ad96:	04510713          	addi	a4,sp,69
1c00ad9a:	00d8e6b3          	or	a3,a7,a3
1c00ad9e:	fbfa8793          	addi	a5,s5,-65
1c00ada2:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00ada6:	eaa1                	bnez	a3,1c00adf6 <_prf+0x3f4>
1c00ada8:	46e5                	li	a3,25
1c00adaa:	02f6ee63          	bltu	a3,a5,1c00ade6 <_prf+0x3e4>
1c00adae:	6795                	lui	a5,0x5
1c00adb0:	e4978793          	addi	a5,a5,-439 # 4e49 <__rt_hyper_pending_emu_stride+0x4ba1>
1c00adb4:	00f71023          	sh	a5,0(a4)
1c00adb8:	04600793          	li	a5,70
1c00adbc:	00f70123          	sb	a5,2(a4)
1c00adc0:	000701a3          	sb	zero,3(a4)
1c00adc4:	8d11                	sub	a0,a0,a2
1c00adc6:	47d2                	lw	a5,20(sp)
1c00adc8:	48079f63          	bnez	a5,1c00b266 <_prf+0x864>
1c00adcc:	e419                	bnez	s0,1c00adda <_prf+0x3d8>
1c00adce:	04414403          	lbu	s0,68(sp)
1c00add2:	fd340413          	addi	s0,s0,-45
1c00add6:	00143413          	seqz	s0,s0
1c00adda:	0c800793          	li	a5,200
1c00adde:	c8a7c1e3          	blt	a5,a0,1c00aa60 <_prf+0x5e>
1c00ade2:	8caa                	mv	s9,a0
1c00ade4:	a691                	j	1c00b128 <_prf+0x726>
1c00ade6:	679d                	lui	a5,0x7
1c00ade8:	e6978793          	addi	a5,a5,-407 # 6e69 <__rt_hyper_pending_emu_stride+0x6bc1>
1c00adec:	00f71023          	sh	a5,0(a4)
1c00adf0:	06600793          	li	a5,102
1c00adf4:	b7e1                	j	1c00adbc <_prf+0x3ba>
1c00adf6:	46e5                	li	a3,25
1c00adf8:	00f6ea63          	bltu	a3,a5,1c00ae0c <_prf+0x40a>
1c00adfc:	6791                	lui	a5,0x4
1c00adfe:	14e78793          	addi	a5,a5,334 # 414e <__rt_hyper_pending_emu_stride+0x3ea6>
1c00ae02:	00f71023          	sh	a5,0(a4)
1c00ae06:	04e00793          	li	a5,78
1c00ae0a:	bf4d                	j	1c00adbc <_prf+0x3ba>
1c00ae0c:	6799                	lui	a5,0x6
1c00ae0e:	16e78793          	addi	a5,a5,366 # 616e <__rt_hyper_pending_emu_stride+0x5ec6>
1c00ae12:	00f71023          	sh	a5,0(a4)
1c00ae16:	06e00793          	li	a5,110
1c00ae1a:	b74d                	j	1c00adbc <_prf+0x3ba>
1c00ae1c:	04600593          	li	a1,70
1c00ae20:	00ba9463          	bne	s5,a1,1c00ae28 <_prf+0x426>
1c00ae24:	06600a93          	li	s5,102
1c00ae28:	011665b3          	or	a1,a2,a7
1c00ae2c:	8dd5                	or	a1,a1,a3
1c00ae2e:	c9c9                	beqz	a1,1c00aec0 <_prf+0x4be>
1c00ae30:	800007b7          	lui	a5,0x80000
1c00ae34:	8edd                	or	a3,a3,a5
1c00ae36:	da36                	sw	a3,52(sp)
1c00ae38:	d846                	sw	a7,48(sp)
1c00ae3a:	c0260c13          	addi	s8,a2,-1022
1c00ae3e:	02d00693          	li	a3,45
1c00ae42:	00034b63          	bltz	t1,1c00ae58 <_prf+0x456>
1c00ae46:	4752                	lw	a4,20(sp)
1c00ae48:	02b00693          	li	a3,43
1c00ae4c:	e711                	bnez	a4,1c00ae58 <_prf+0x456>
1c00ae4e:	04410b13          	addi	s6,sp,68
1c00ae52:	c419                	beqz	s0,1c00ae60 <_prf+0x45e>
1c00ae54:	02000693          	li	a3,32
1c00ae58:	04d10223          	sb	a3,68(sp)
1c00ae5c:	04510b13          	addi	s6,sp,69
1c00ae60:	4b81                	li	s7,0
1c00ae62:	55f9                	li	a1,-2
1c00ae64:	06bc4363          	blt	s8,a1,1c00aeca <_prf+0x4c8>
1c00ae68:	0b804a63          	bgtz	s8,1c00af1c <_prf+0x51a>
1c00ae6c:	4d91                	li	s11,4
1c00ae6e:	1808                	addi	a0,sp,48
1c00ae70:	0c05                	addi	s8,s8,1
1c00ae72:	aedff0ef          	jal	ra,1c00a95e <_rlrshift>
1c00ae76:	ffbc1ce3          	bne	s8,s11,1c00ae6e <_prf+0x46c>
1c00ae7a:	000d5363          	bgez	s10,1c00ae80 <_prf+0x47e>
1c00ae7e:	4d19                	li	s10,6
1c00ae80:	fdfaf593          	andi	a1,s5,-33
1c00ae84:	04700513          	li	a0,71
1c00ae88:	0ca59663          	bne	a1,a0,1c00af54 <_prf+0x552>
1c00ae8c:	4c01                	li	s8,0
1c00ae8e:	000c9463          	bnez	s9,1c00ae96 <_prf+0x494>
1c00ae92:	01a03c33          	snez	s8,s10
1c00ae96:	55f5                	li	a1,-3
1c00ae98:	00bbc663          	blt	s7,a1,1c00aea4 <_prf+0x4a2>
1c00ae9c:	001d0593          	addi	a1,s10,1
1c00aea0:	0b75df63          	ble	s7,a1,1c00af5e <_prf+0x55c>
1c00aea4:	06700593          	li	a1,103
1c00aea8:	14ba8c63          	beq	s5,a1,1c00b000 <_prf+0x5fe>
1c00aeac:	04500a93          	li	s5,69
1c00aeb0:	001d0593          	addi	a1,s10,1
1c00aeb4:	4541                	li	a0,16
1c00aeb6:	d62a                	sw	a0,44(sp)
1c00aeb8:	0ab55c63          	ble	a1,a0,1c00af70 <_prf+0x56e>
1c00aebc:	45c1                	li	a1,16
1c00aebe:	a84d                	j	1c00af70 <_prf+0x56e>
1c00aec0:	4c01                	li	s8,0
1c00aec2:	b751                	j	1c00ae46 <_prf+0x444>
1c00aec4:	1808                	addi	a0,sp,48
1c00aec6:	a99ff0ef          	jal	ra,1c00a95e <_rlrshift>
1c00aeca:	55d2                	lw	a1,52(sp)
1c00aecc:	333337b7          	lui	a5,0x33333
1c00aed0:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732019a>
1c00aed4:	5342                	lw	t1,48(sp)
1c00aed6:	0c05                	addi	s8,s8,1
1c00aed8:	feb7e6e3          	bltu	a5,a1,1c00aec4 <_prf+0x4c2>
1c00aedc:	4895                	li	a7,5
1c00aede:	02b88533          	mul	a0,a7,a1
1c00aee2:	1bfd                	addi	s7,s7,-1
1c00aee4:	0268b5b3          	mulhu	a1,a7,t1
1c00aee8:	026888b3          	mul	a7,a7,t1
1c00aeec:	95aa                	add	a1,a1,a0
1c00aeee:	da2e                	sw	a1,52(sp)
1c00aef0:	4501                	li	a0,0
1c00aef2:	d846                	sw	a7,48(sp)
1c00aef4:	800006b7          	lui	a3,0x80000
1c00aef8:	fff6c693          	not	a3,a3
1c00aefc:	00b6f663          	bleu	a1,a3,1c00af08 <_prf+0x506>
1c00af00:	d12d                	beqz	a0,1c00ae62 <_prf+0x460>
1c00af02:	d846                	sw	a7,48(sp)
1c00af04:	da2e                	sw	a1,52(sp)
1c00af06:	bfb1                	j	1c00ae62 <_prf+0x460>
1c00af08:	01f8d313          	srli	t1,a7,0x1f
1c00af0c:	00159513          	slli	a0,a1,0x1
1c00af10:	00a365b3          	or	a1,t1,a0
1c00af14:	0886                	slli	a7,a7,0x1
1c00af16:	1c7d                	addi	s8,s8,-1
1c00af18:	4505                	li	a0,1
1c00af1a:	bfe9                	j	1c00aef4 <_prf+0x4f2>
1c00af1c:	1808                	addi	a0,sp,48
1c00af1e:	a61ff0ef          	jal	ra,1c00a97e <_ldiv5>
1c00af22:	58c2                	lw	a7,48(sp)
1c00af24:	55d2                	lw	a1,52(sp)
1c00af26:	1c7d                	addi	s8,s8,-1
1c00af28:	0b85                	addi	s7,s7,1
1c00af2a:	4501                	li	a0,0
1c00af2c:	80000737          	lui	a4,0x80000
1c00af30:	fff74713          	not	a4,a4
1c00af34:	00b77663          	bleu	a1,a4,1c00af40 <_prf+0x53e>
1c00af38:	d905                	beqz	a0,1c00ae68 <_prf+0x466>
1c00af3a:	d846                	sw	a7,48(sp)
1c00af3c:	da2e                	sw	a1,52(sp)
1c00af3e:	b72d                	j	1c00ae68 <_prf+0x466>
1c00af40:	01f8d313          	srli	t1,a7,0x1f
1c00af44:	00159513          	slli	a0,a1,0x1
1c00af48:	00a365b3          	or	a1,t1,a0
1c00af4c:	0886                	slli	a7,a7,0x1
1c00af4e:	1c7d                	addi	s8,s8,-1
1c00af50:	4505                	li	a0,1
1c00af52:	bfe9                	j	1c00af2c <_prf+0x52a>
1c00af54:	06600593          	li	a1,102
1c00af58:	4c01                	li	s8,0
1c00af5a:	f4ba9be3          	bne	s5,a1,1c00aeb0 <_prf+0x4ae>
1c00af5e:	01ab85b3          	add	a1,s7,s10
1c00af62:	06600a93          	li	s5,102
1c00af66:	f405d7e3          	bgez	a1,1c00aeb4 <_prf+0x4b2>
1c00af6a:	45c1                	li	a1,16
1c00af6c:	d62e                	sw	a1,44(sp)
1c00af6e:	4581                	li	a1,0
1c00af70:	4301                	li	t1,0
1c00af72:	080003b7          	lui	t2,0x8000
1c00af76:	dc1a                	sw	t1,56(sp)
1c00af78:	de1e                	sw	t2,60(sp)
1c00af7a:	5dfd                	li	s11,-1
1c00af7c:	15fd                	addi	a1,a1,-1
1c00af7e:	09b59463          	bne	a1,s11,1c00b006 <_prf+0x604>
1c00af82:	55c2                	lw	a1,48(sp)
1c00af84:	5562                	lw	a0,56(sp)
1c00af86:	58d2                	lw	a7,52(sp)
1c00af88:	5372                	lw	t1,60(sp)
1c00af8a:	952e                	add	a0,a0,a1
1c00af8c:	00b535b3          	sltu	a1,a0,a1
1c00af90:	989a                	add	a7,a7,t1
1c00af92:	95c6                	add	a1,a1,a7
1c00af94:	d82a                	sw	a0,48(sp)
1c00af96:	f0000537          	lui	a0,0xf0000
1c00af9a:	da2e                	sw	a1,52(sp)
1c00af9c:	8de9                	and	a1,a1,a0
1c00af9e:	c981                	beqz	a1,1c00afae <_prf+0x5ac>
1c00afa0:	1808                	addi	a0,sp,48
1c00afa2:	9ddff0ef          	jal	ra,1c00a97e <_ldiv5>
1c00afa6:	1808                	addi	a0,sp,48
1c00afa8:	9b7ff0ef          	jal	ra,1c00a95e <_rlrshift>
1c00afac:	0b85                	addi	s7,s7,1
1c00afae:	06600593          	li	a1,102
1c00afb2:	001b0d93          	addi	s11,s6,1
1c00afb6:	08ba9663          	bne	s5,a1,1c00b042 <_prf+0x640>
1c00afba:	05705f63          	blez	s7,1c00b018 <_prf+0x616>
1c00afbe:	017b0db3          	add	s11,s6,s7
1c00afc2:	106c                	addi	a1,sp,44
1c00afc4:	1808                	addi	a0,sp,48
1c00afc6:	0b05                	addi	s6,s6,1
1c00afc8:	9ffff0ef          	jal	ra,1c00a9c6 <_get_digit>
1c00afcc:	feab0fa3          	sb	a0,-1(s6)
1c00afd0:	ffbb19e3          	bne	s6,s11,1c00afc2 <_prf+0x5c0>
1c00afd4:	4b81                	li	s7,0
1c00afd6:	000c9463          	bnez	s9,1c00afde <_prf+0x5dc>
1c00afda:	020d0063          	beqz	s10,1c00affa <_prf+0x5f8>
1c00afde:	02e00613          	li	a2,46
1c00afe2:	00cd8023          	sb	a2,0(s11)
1c00afe6:	8b6e                	mv	s6,s11
1c00afe8:	01ad8cb3          	add	s9,s11,s10
1c00afec:	03000313          	li	t1,48
1c00aff0:	036c9963          	bne	s9,s6,1c00b022 <_prf+0x620>
1c00aff4:	001d0713          	addi	a4,s10,1
1c00aff8:	9dba                	add	s11,s11,a4
1c00affa:	060c1e63          	bnez	s8,1c00b076 <_prf+0x674>
1c00affe:	a8d1                	j	1c00b0d2 <_prf+0x6d0>
1c00b000:	06500a93          	li	s5,101
1c00b004:	b575                	j	1c00aeb0 <_prf+0x4ae>
1c00b006:	1828                	addi	a0,sp,56
1c00b008:	c42e                	sw	a1,8(sp)
1c00b00a:	975ff0ef          	jal	ra,1c00a97e <_ldiv5>
1c00b00e:	1828                	addi	a0,sp,56
1c00b010:	94fff0ef          	jal	ra,1c00a95e <_rlrshift>
1c00b014:	45a2                	lw	a1,8(sp)
1c00b016:	b79d                	j	1c00af7c <_prf+0x57a>
1c00b018:	03000593          	li	a1,48
1c00b01c:	00bb0023          	sb	a1,0(s6)
1c00b020:	bf5d                	j	1c00afd6 <_prf+0x5d4>
1c00b022:	000b8763          	beqz	s7,1c00b030 <_prf+0x62e>
1c00b026:	006b00a3          	sb	t1,1(s6)
1c00b02a:	0b85                	addi	s7,s7,1
1c00b02c:	0b05                	addi	s6,s6,1
1c00b02e:	b7c9                	j	1c00aff0 <_prf+0x5ee>
1c00b030:	106c                	addi	a1,sp,44
1c00b032:	1808                	addi	a0,sp,48
1c00b034:	c41a                	sw	t1,8(sp)
1c00b036:	991ff0ef          	jal	ra,1c00a9c6 <_get_digit>
1c00b03a:	00ab00a3          	sb	a0,1(s6)
1c00b03e:	4322                	lw	t1,8(sp)
1c00b040:	b7f5                	j	1c00b02c <_prf+0x62a>
1c00b042:	106c                	addi	a1,sp,44
1c00b044:	1808                	addi	a0,sp,48
1c00b046:	981ff0ef          	jal	ra,1c00a9c6 <_get_digit>
1c00b04a:	00ab0023          	sb	a0,0(s6)
1c00b04e:	03000593          	li	a1,48
1c00b052:	00b50363          	beq	a0,a1,1c00b058 <_prf+0x656>
1c00b056:	1bfd                	addi	s7,s7,-1
1c00b058:	000c9463          	bnez	s9,1c00b060 <_prf+0x65e>
1c00b05c:	000d0b63          	beqz	s10,1c00b072 <_prf+0x670>
1c00b060:	002b0d93          	addi	s11,s6,2
1c00b064:	02e00593          	li	a1,46
1c00b068:	00bb00a3          	sb	a1,1(s6)
1c00b06c:	9d6e                	add	s10,s10,s11
1c00b06e:	07bd1863          	bne	s10,s11,1c00b0de <_prf+0x6dc>
1c00b072:	000c0f63          	beqz	s8,1c00b090 <_prf+0x68e>
1c00b076:	03000593          	li	a1,48
1c00b07a:	fffdc603          	lbu	a2,-1(s11)
1c00b07e:	fffd8713          	addi	a4,s11,-1
1c00b082:	06b60663          	beq	a2,a1,1c00b0ee <_prf+0x6ec>
1c00b086:	02e00593          	li	a1,46
1c00b08a:	00b61363          	bne	a2,a1,1c00b090 <_prf+0x68e>
1c00b08e:	8dba                	mv	s11,a4
1c00b090:	fdfaf713          	andi	a4,s5,-33
1c00b094:	04500613          	li	a2,69
1c00b098:	02c71d63          	bne	a4,a2,1c00b0d2 <_prf+0x6d0>
1c00b09c:	87d6                	mv	a5,s5
1c00b09e:	00fd8023          	sb	a5,0(s11)
1c00b0a2:	02b00793          	li	a5,43
1c00b0a6:	000bd663          	bgez	s7,1c00b0b2 <_prf+0x6b0>
1c00b0aa:	41700bb3          	neg	s7,s7
1c00b0ae:	02d00793          	li	a5,45
1c00b0b2:	00fd80a3          	sb	a5,1(s11)
1c00b0b6:	47a9                	li	a5,10
1c00b0b8:	02fbc733          	div	a4,s7,a5
1c00b0bc:	0d91                	addi	s11,s11,4
1c00b0be:	02fbe6b3          	rem	a3,s7,a5
1c00b0c2:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b0c6:	feed8f23          	sb	a4,-2(s11)
1c00b0ca:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b0ce:	fedd8fa3          	sb	a3,-1(s11)
1c00b0d2:	00c8                	addi	a0,sp,68
1c00b0d4:	000d8023          	sb	zero,0(s11)
1c00b0d8:	40ad8533          	sub	a0,s11,a0
1c00b0dc:	b1ed                	j	1c00adc6 <_prf+0x3c4>
1c00b0de:	106c                	addi	a1,sp,44
1c00b0e0:	1808                	addi	a0,sp,48
1c00b0e2:	0d85                	addi	s11,s11,1
1c00b0e4:	8e3ff0ef          	jal	ra,1c00a9c6 <_get_digit>
1c00b0e8:	fead8fa3          	sb	a0,-1(s11)
1c00b0ec:	b749                	j	1c00b06e <_prf+0x66c>
1c00b0ee:	8dba                	mv	s11,a4
1c00b0f0:	b769                	j	1c00b07a <_prf+0x678>
1c00b0f2:	000c2783          	lw	a5,0(s8)
1c00b0f6:	004c0a13          	addi	s4,s8,4
1c00b0fa:	0137a023          	sw	s3,0(a5)
1c00b0fe:	b255                	j	1c00aaa2 <_prf+0xa0>
1c00b100:	004c0a13          	addi	s4,s8,4
1c00b104:	000c2583          	lw	a1,0(s8)
1c00b108:	00dc                	addi	a5,sp,68
1c00b10a:	040c8463          	beqz	s9,1c00b152 <_prf+0x750>
1c00b10e:	03000693          	li	a3,48
1c00b112:	04d10223          	sb	a3,68(sp)
1c00b116:	04510513          	addi	a0,sp,69
1c00b11a:	ed8d                	bnez	a1,1c00b154 <_prf+0x752>
1c00b11c:	040102a3          	sb	zero,69(sp)
1c00b120:	57fd                	li	a5,-1
1c00b122:	4401                	li	s0,0
1c00b124:	0efd1163          	bne	s10,a5,1c00b206 <_prf+0x804>
1c00b128:	0f2cc363          	blt	s9,s2,1c00b20e <_prf+0x80c>
1c00b12c:	8966                	mv	s2,s9
1c00b12e:	00c0                	addi	s0,sp,68
1c00b130:	40898ab3          	sub	s5,s3,s0
1c00b134:	5b7d                	li	s6,-1
1c00b136:	015409b3          	add	s3,s0,s5
1c00b13a:	960904e3          	beqz	s2,1c00aaa2 <_prf+0xa0>
1c00b13e:	45f2                	lw	a1,28(sp)
1c00b140:	00044503          	lbu	a0,0(s0)
1c00b144:	47e2                	lw	a5,24(sp)
1c00b146:	9782                	jalr	a5
1c00b148:	91650ce3          	beq	a0,s6,1c00aa60 <_prf+0x5e>
1c00b14c:	197d                	addi	s2,s2,-1
1c00b14e:	0405                	addi	s0,s0,1
1c00b150:	b7dd                	j	1c00b136 <_prf+0x734>
1c00b152:	853e                	mv	a0,a5
1c00b154:	86ea                	mv	a3,s10
1c00b156:	4621                	li	a2,8
1c00b158:	40f50433          	sub	s0,a0,a5
1c00b15c:	fa2ff0ef          	jal	ra,1c00a8fe <_to_x>
1c00b160:	9522                	add	a0,a0,s0
1c00b162:	57fd                	li	a5,-1
1c00b164:	4401                	li	s0,0
1c00b166:	c6fd0ae3          	beq	s10,a5,1c00adda <_prf+0x3d8>
1c00b16a:	02000793          	li	a5,32
1c00b16e:	c83e                	sw	a5,16(sp)
1c00b170:	b1ad                	j	1c00adda <_prf+0x3d8>
1c00b172:	000c2583          	lw	a1,0(s8)
1c00b176:	77e1                	lui	a5,0xffff8
1c00b178:	8307c793          	xori	a5,a5,-2000
1c00b17c:	46a1                	li	a3,8
1c00b17e:	4641                	li	a2,16
1c00b180:	04610513          	addi	a0,sp,70
1c00b184:	04f11223          	sh	a5,68(sp)
1c00b188:	f76ff0ef          	jal	ra,1c00a8fe <_to_x>
1c00b18c:	004c0a13          	addi	s4,s8,4
1c00b190:	0509                	addi	a0,a0,2
1c00b192:	57fd                	li	a5,-1
1c00b194:	4401                	li	s0,0
1c00b196:	c4fd02e3          	beq	s10,a5,1c00adda <_prf+0x3d8>
1c00b19a:	02000713          	li	a4,32
1c00b19e:	c83a                	sw	a4,16(sp)
1c00b1a0:	b92d                	j	1c00adda <_prf+0x3d8>
1c00b1a2:	000d4563          	bltz	s10,1c00b1ac <_prf+0x7aa>
1c00b1a6:	019d5363          	ble	s9,s10,1c00b1ac <_prf+0x7aa>
1c00b1aa:	8cea                	mv	s9,s10
1c00b1ac:	8e0c8be3          	beqz	s9,1c00aaa2 <_prf+0xa0>
1c00b1b0:	8666                	mv	a2,s9
1c00b1b2:	00c8                	addi	a0,sp,68
1c00b1b4:	ce6ff0ef          	jal	ra,1c00a69a <memcpy>
1c00b1b8:	b6b9                	j	1c00ad06 <_prf+0x304>
1c00b1ba:	000c2583          	lw	a1,0(s8)
1c00b1be:	86ea                	mv	a3,s10
1c00b1c0:	4629                	li	a2,10
1c00b1c2:	00c8                	addi	a0,sp,68
1c00b1c4:	004c0a13          	addi	s4,s8,4
1c00b1c8:	f36ff0ef          	jal	ra,1c00a8fe <_to_x>
1c00b1cc:	bf59                	j	1c00b162 <_prf+0x760>
1c00b1ce:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b1d2:	0ff67613          	andi	a2,a2,255
1c00b1d6:	00c5e563          	bltu	a1,a2,1c00b1e0 <_prf+0x7de>
1c00b1da:	1781                	addi	a5,a5,-32
1c00b1dc:	00f68023          	sb	a5,0(a3)
1c00b1e0:	0685                	addi	a3,a3,1
1c00b1e2:	0006c783          	lbu	a5,0(a3)
1c00b1e6:	f7e5                	bnez	a5,1c00b1ce <_prf+0x7cc>
1c00b1e8:	bc9d                	j	1c00ac5e <_prf+0x25c>
1c00b1ea:	86de                	mv	a3,s7
1c00b1ec:	45e5                	li	a1,25
1c00b1ee:	bfd5                	j	1c00b1e2 <_prf+0x7e0>
1c00b1f0:	45f2                	lw	a1,28(sp)
1c00b1f2:	4762                	lw	a4,24(sp)
1c00b1f4:	02500513          	li	a0,37
1c00b1f8:	9702                	jalr	a4
1c00b1fa:	57fd                	li	a5,-1
1c00b1fc:	86f502e3          	beq	a0,a5,1c00aa60 <_prf+0x5e>
1c00b200:	0985                	addi	s3,s3,1
1c00b202:	8a62                	mv	s4,s8
1c00b204:	b879                	j	1c00aaa2 <_prf+0xa0>
1c00b206:	02000793          	li	a5,32
1c00b20a:	c83e                	sw	a5,16(sp)
1c00b20c:	bf31                	j	1c00b128 <_prf+0x726>
1c00b20e:	4732                	lw	a4,12(sp)
1c00b210:	cf01                	beqz	a4,1c00b228 <_prf+0x826>
1c00b212:	02000713          	li	a4,32
1c00b216:	00d4                	addi	a3,sp,68
1c00b218:	019687b3          	add	a5,a3,s9
1c00b21c:	00e78023          	sb	a4,0(a5)
1c00b220:	0c85                	addi	s9,s9,1
1c00b222:	ff991ae3          	bne	s2,s9,1c00b216 <_prf+0x814>
1c00b226:	b721                	j	1c00b12e <_prf+0x72c>
1c00b228:	00cc                	addi	a1,sp,68
1c00b22a:	41990bb3          	sub	s7,s2,s9
1c00b22e:	001c8613          	addi	a2,s9,1
1c00b232:	01758533          	add	a0,a1,s7
1c00b236:	c7cff0ef          	jal	ra,1c00a6b2 <memmove>
1c00b23a:	4742                	lw	a4,16(sp)
1c00b23c:	02000793          	li	a5,32
1c00b240:	00f70363          	beq	a4,a5,1c00b246 <_prf+0x844>
1c00b244:	c622                	sw	s0,12(sp)
1c00b246:	47b2                	lw	a5,12(sp)
1c00b248:	9bbe                	add	s7,s7,a5
1c00b24a:	4732                	lw	a4,12(sp)
1c00b24c:	ef7751e3          	ble	s7,a4,1c00b12e <_prf+0x72c>
1c00b250:	4732                	lw	a4,12(sp)
1c00b252:	00d4                	addi	a3,sp,68
1c00b254:	00e687b3          	add	a5,a3,a4
1c00b258:	4742                	lw	a4,16(sp)
1c00b25a:	00e78023          	sb	a4,0(a5)
1c00b25e:	47b2                	lw	a5,12(sp)
1c00b260:	0785                	addi	a5,a5,1
1c00b262:	c63e                	sw	a5,12(sp)
1c00b264:	b7dd                	j	1c00b24a <_prf+0x848>
1c00b266:	4452                	lw	s0,20(sp)
1c00b268:	be8d                	j	1c00adda <_prf+0x3d8>

1c00b26a <__rt_uart_cluster_req_done>:
1c00b26a:	300476f3          	csrrci	a3,mstatus,8
1c00b26e:	4785                	li	a5,1
1c00b270:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b274:	09954783          	lbu	a5,153(a0)
1c00b278:	00201737          	lui	a4,0x201
1c00b27c:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c00b280:	04078793          	addi	a5,a5,64
1c00b284:	07da                	slli	a5,a5,0x16
1c00b286:	97ba                	add	a5,a5,a4
1c00b288:	0007a023          	sw	zero,0(a5)
1c00b28c:	30069073          	csrw	mstatus,a3
1c00b290:	8082                	ret

1c00b292 <__rt_uart_setup.isra.6>:
1c00b292:	1c001737          	lui	a4,0x1c001
1c00b296:	23872703          	lw	a4,568(a4) # 1c001238 <__rt_freq_domains>
1c00b29a:	00155793          	srli	a5,a0,0x1
1c00b29e:	97ba                	add	a5,a5,a4
1c00b2a0:	02a7d7b3          	divu	a5,a5,a0
1c00b2a4:	1a102737          	lui	a4,0x1a102
1c00b2a8:	17fd                	addi	a5,a5,-1
1c00b2aa:	07c2                	slli	a5,a5,0x10
1c00b2ac:	3067e793          	ori	a5,a5,774
1c00b2b0:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102190>
1c00b2b4:	8082                	ret

1c00b2b6 <__rt_uart_setfreq_after>:
1c00b2b6:	1c0017b7          	lui	a5,0x1c001
1c00b2ba:	1b878793          	addi	a5,a5,440 # 1c0011b8 <__rt_uart>
1c00b2be:	4398                	lw	a4,0(a5)
1c00b2c0:	cb09                	beqz	a4,1c00b2d2 <__rt_uart_setfreq_after+0x1c>
1c00b2c2:	4788                	lw	a0,8(a5)
1c00b2c4:	1141                	addi	sp,sp,-16
1c00b2c6:	c606                	sw	ra,12(sp)
1c00b2c8:	37e9                	jal	1c00b292 <__rt_uart_setup.isra.6>
1c00b2ca:	40b2                	lw	ra,12(sp)
1c00b2cc:	4501                	li	a0,0
1c00b2ce:	0141                	addi	sp,sp,16
1c00b2d0:	8082                	ret
1c00b2d2:	4501                	li	a0,0
1c00b2d4:	8082                	ret

1c00b2d6 <__rt_uart_cluster_req>:
1c00b2d6:	1141                	addi	sp,sp,-16
1c00b2d8:	c606                	sw	ra,12(sp)
1c00b2da:	c422                	sw	s0,8(sp)
1c00b2dc:	30047473          	csrrci	s0,mstatus,8
1c00b2e0:	1c00b7b7          	lui	a5,0x1c00b
1c00b2e4:	26a78793          	addi	a5,a5,618 # 1c00b26a <__rt_uart_cluster_req_done>
1c00b2e8:	c55c                	sw	a5,12(a0)
1c00b2ea:	4785                	li	a5,1
1c00b2ec:	d55c                	sw	a5,44(a0)
1c00b2ee:	411c                	lw	a5,0(a0)
1c00b2f0:	02052823          	sw	zero,48(a0)
1c00b2f4:	c908                	sw	a0,16(a0)
1c00b2f6:	43cc                	lw	a1,4(a5)
1c00b2f8:	4514                	lw	a3,8(a0)
1c00b2fa:	4150                	lw	a2,4(a0)
1c00b2fc:	0586                	slli	a1,a1,0x1
1c00b2fe:	00c50793          	addi	a5,a0,12
1c00b302:	4701                	li	a4,0
1c00b304:	0585                	addi	a1,a1,1
1c00b306:	4501                	li	a0,0
1c00b308:	e9bfe0ef          	jal	ra,1c00a1a2 <rt_periph_copy>
1c00b30c:	30041073          	csrw	mstatus,s0
1c00b310:	40b2                	lw	ra,12(sp)
1c00b312:	4422                	lw	s0,8(sp)
1c00b314:	0141                	addi	sp,sp,16
1c00b316:	8082                	ret

1c00b318 <__rt_uart_wait_tx_done.isra.5>:
1c00b318:	1a102737          	lui	a4,0x1a102
1c00b31c:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa102184>
1c00b320:	8bc1                	andi	a5,a5,16
1c00b322:	e7b9                	bnez	a5,1c00b370 <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b324:	1a102737          	lui	a4,0x1a102
1c00b328:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa10218c>
1c00b32c:	8b85                	andi	a5,a5,1
1c00b32e:	ffed                	bnez	a5,1c00b328 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b330:	f14027f3          	csrr	a5,mhartid
1c00b334:	8795                	srai	a5,a5,0x5
1c00b336:	1a10a637          	lui	a2,0x1a10a
1c00b33a:	03f7f793          	andi	a5,a5,63
1c00b33e:	03200693          	li	a3,50
1c00b342:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa109800>
1c00b346:	6711                	lui	a4,0x4
1c00b348:	6311                	lui	t1,0x4
1c00b34a:	45fd                	li	a1,31
1c00b34c:	00204537          	lui	a0,0x204
1c00b350:	88be                	mv	a7,a5
1c00b352:	00682023          	sw	t1,0(a6)
1c00b356:	02b79063          	bne	a5,a1,1c00b376 <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b35a:	80e62223          	sw	a4,-2044(a2)
1c00b35e:	10500073          	wfi
1c00b362:	00b89c63          	bne	a7,a1,1c00b37a <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b366:	80e62423          	sw	a4,-2040(a2)
1c00b36a:	16fd                	addi	a3,a3,-1
1c00b36c:	f2fd                	bnez	a3,1c00b352 <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b36e:	8082                	ret
1c00b370:	10500073          	wfi
1c00b374:	b765                	j	1c00b31c <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b376:	c958                	sw	a4,20(a0)
1c00b378:	b7dd                	j	1c00b35e <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b37a:	c918                	sw	a4,16(a0)
1c00b37c:	b7fd                	j	1c00b36a <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b37e <__rt_uart_setfreq_before>:
1c00b37e:	1c0017b7          	lui	a5,0x1c001
1c00b382:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <__rt_uart>
1c00b386:	cf99                	beqz	a5,1c00b3a4 <__rt_uart_setfreq_before+0x26>
1c00b388:	1141                	addi	sp,sp,-16
1c00b38a:	c606                	sw	ra,12(sp)
1c00b38c:	3771                	jal	1c00b318 <__rt_uart_wait_tx_done.isra.5>
1c00b38e:	40b2                	lw	ra,12(sp)
1c00b390:	005007b7          	lui	a5,0x500
1c00b394:	1a102737          	lui	a4,0x1a102
1c00b398:	0799                	addi	a5,a5,6
1c00b39a:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102190>
1c00b39e:	4501                	li	a0,0
1c00b3a0:	0141                	addi	sp,sp,16
1c00b3a2:	8082                	ret
1c00b3a4:	4501                	li	a0,0
1c00b3a6:	8082                	ret

1c00b3a8 <soc_eu_fcEventMask_setEvent>:
1c00b3a8:	47fd                	li	a5,31
1c00b3aa:	4721                	li	a4,8
1c00b3ac:	00a7d463          	ble	a0,a5,1c00b3b4 <soc_eu_fcEventMask_setEvent+0xc>
1c00b3b0:	1501                	addi	a0,a0,-32
1c00b3b2:	4711                	li	a4,4
1c00b3b4:	1a1067b7          	lui	a5,0x1a106
1c00b3b8:	973e                	add	a4,a4,a5
1c00b3ba:	4314                	lw	a3,0(a4)
1c00b3bc:	4785                	li	a5,1
1c00b3be:	00a79533          	sll	a0,a5,a0
1c00b3c2:	fff54513          	not	a0,a0
1c00b3c6:	8d75                	and	a0,a0,a3
1c00b3c8:	c308                	sw	a0,0(a4)
1c00b3ca:	8082                	ret

1c00b3cc <rt_uart_conf_init>:
1c00b3cc:	000997b7          	lui	a5,0x99
1c00b3d0:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8897c>
1c00b3d4:	c11c                	sw	a5,0(a0)
1c00b3d6:	57fd                	li	a5,-1
1c00b3d8:	c15c                	sw	a5,4(a0)
1c00b3da:	8082                	ret

1c00b3dc <__rt_uart_open>:
1c00b3dc:	1141                	addi	sp,sp,-16
1c00b3de:	c606                	sw	ra,12(sp)
1c00b3e0:	c422                	sw	s0,8(sp)
1c00b3e2:	c226                	sw	s1,4(sp)
1c00b3e4:	c04a                	sw	s2,0(sp)
1c00b3e6:	30047973          	csrrci	s2,mstatus,8
1c00b3ea:	cd8d                	beqz	a1,1c00b424 <__rt_uart_open+0x48>
1c00b3ec:	4194                	lw	a3,0(a1)
1c00b3ee:	1c0017b7          	lui	a5,0x1c001
1c00b3f2:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f4011>
1c00b3f6:	1b878413          	addi	s0,a5,440 # 1c0011b8 <__rt_uart>
1c00b3fa:	0712                	slli	a4,a4,0x4
1c00b3fc:	943a                	add	s0,s0,a4
1c00b3fe:	4010                	lw	a2,0(s0)
1c00b400:	1b878793          	addi	a5,a5,440
1c00b404:	c60d                	beqz	a2,1c00b42e <__rt_uart_open+0x52>
1c00b406:	c589                	beqz	a1,1c00b410 <__rt_uart_open+0x34>
1c00b408:	418c                	lw	a1,0(a1)
1c00b40a:	4414                	lw	a3,8(s0)
1c00b40c:	04d59a63          	bne	a1,a3,1c00b460 <__rt_uart_open+0x84>
1c00b410:	97ba                	add	a5,a5,a4
1c00b412:	0605                	addi	a2,a2,1
1c00b414:	c390                	sw	a2,0(a5)
1c00b416:	8522                	mv	a0,s0
1c00b418:	40b2                	lw	ra,12(sp)
1c00b41a:	4422                	lw	s0,8(sp)
1c00b41c:	4492                	lw	s1,4(sp)
1c00b41e:	4902                	lw	s2,0(sp)
1c00b420:	0141                	addi	sp,sp,16
1c00b422:	8082                	ret
1c00b424:	000996b7          	lui	a3,0x99
1c00b428:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8897c>
1c00b42c:	b7c9                	j	1c00b3ee <__rt_uart_open+0x12>
1c00b42e:	4785                	li	a5,1
1c00b430:	1a102737          	lui	a4,0x1a102
1c00b434:	c01c                	sw	a5,0(s0)
1c00b436:	c048                	sw	a0,4(s0)
1c00b438:	c414                	sw	a3,8(s0)
1c00b43a:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa10276c>
1c00b43e:	00a797b3          	sll	a5,a5,a0
1c00b442:	00151493          	slli	s1,a0,0x1
1c00b446:	8fd5                	or	a5,a5,a3
1c00b448:	78f72023          	sw	a5,1920(a4)
1c00b44c:	8526                	mv	a0,s1
1c00b44e:	3fa9                	jal	1c00b3a8 <soc_eu_fcEventMask_setEvent>
1c00b450:	00148513          	addi	a0,s1,1
1c00b454:	3f91                	jal	1c00b3a8 <soc_eu_fcEventMask_setEvent>
1c00b456:	4408                	lw	a0,8(s0)
1c00b458:	3d2d                	jal	1c00b292 <__rt_uart_setup.isra.6>
1c00b45a:	30091073          	csrw	mstatus,s2
1c00b45e:	bf65                	j	1c00b416 <__rt_uart_open+0x3a>
1c00b460:	4401                	li	s0,0
1c00b462:	bf55                	j	1c00b416 <__rt_uart_open+0x3a>

1c00b464 <rt_uart_close>:
1c00b464:	1141                	addi	sp,sp,-16
1c00b466:	c606                	sw	ra,12(sp)
1c00b468:	c422                	sw	s0,8(sp)
1c00b46a:	c226                	sw	s1,4(sp)
1c00b46c:	300474f3          	csrrci	s1,mstatus,8
1c00b470:	411c                	lw	a5,0(a0)
1c00b472:	17fd                	addi	a5,a5,-1
1c00b474:	c11c                	sw	a5,0(a0)
1c00b476:	e78d                	bnez	a5,1c00b4a0 <rt_uart_close+0x3c>
1c00b478:	842a                	mv	s0,a0
1c00b47a:	3d79                	jal	1c00b318 <__rt_uart_wait_tx_done.isra.5>
1c00b47c:	005007b7          	lui	a5,0x500
1c00b480:	1a102737          	lui	a4,0x1a102
1c00b484:	0799                	addi	a5,a5,6
1c00b486:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102190>
1c00b48a:	4050                	lw	a2,4(s0)
1c00b48c:	78072683          	lw	a3,1920(a4)
1c00b490:	4785                	li	a5,1
1c00b492:	00c797b3          	sll	a5,a5,a2
1c00b496:	fff7c793          	not	a5,a5
1c00b49a:	8ff5                	and	a5,a5,a3
1c00b49c:	78f72023          	sw	a5,1920(a4)
1c00b4a0:	30049073          	csrw	mstatus,s1
1c00b4a4:	40b2                	lw	ra,12(sp)
1c00b4a6:	4422                	lw	s0,8(sp)
1c00b4a8:	4492                	lw	s1,4(sp)
1c00b4aa:	0141                	addi	sp,sp,16
1c00b4ac:	8082                	ret

1c00b4ae <rt_uart_cluster_write>:
1c00b4ae:	f14027f3          	csrr	a5,mhartid
1c00b4b2:	8795                	srai	a5,a5,0x5
1c00b4b4:	03f7f793          	andi	a5,a5,63
1c00b4b8:	08f68ca3          	sb	a5,153(a3)
1c00b4bc:	1c00b7b7          	lui	a5,0x1c00b
1c00b4c0:	2d678793          	addi	a5,a5,726 # 1c00b2d6 <__rt_uart_cluster_req>
1c00b4c4:	c6dc                	sw	a5,12(a3)
1c00b4c6:	4785                	li	a5,1
1c00b4c8:	c288                	sw	a0,0(a3)
1c00b4ca:	c2cc                	sw	a1,4(a3)
1c00b4cc:	c690                	sw	a2,8(a3)
1c00b4ce:	08068c23          	sb	zero,152(a3)
1c00b4d2:	0206a823          	sw	zero,48(a3)
1c00b4d6:	ca94                	sw	a3,16(a3)
1c00b4d8:	d6dc                	sw	a5,44(a3)
1c00b4da:	00c68513          	addi	a0,a3,12
1c00b4de:	ab9fd06f          	j	1c008f96 <__rt_cluster_push_fc_event>

1c00b4e2 <__rt_uart_init>:
1c00b4e2:	1c00b5b7          	lui	a1,0x1c00b
1c00b4e6:	1141                	addi	sp,sp,-16
1c00b4e8:	4601                	li	a2,0
1c00b4ea:	37e58593          	addi	a1,a1,894 # 1c00b37e <__rt_uart_setfreq_before>
1c00b4ee:	4511                	li	a0,4
1c00b4f0:	c606                	sw	ra,12(sp)
1c00b4f2:	c422                	sw	s0,8(sp)
1c00b4f4:	8befe0ef          	jal	ra,1c0095b2 <__rt_cbsys_add>
1c00b4f8:	1c00b5b7          	lui	a1,0x1c00b
1c00b4fc:	842a                	mv	s0,a0
1c00b4fe:	4601                	li	a2,0
1c00b500:	2b658593          	addi	a1,a1,694 # 1c00b2b6 <__rt_uart_setfreq_after>
1c00b504:	4515                	li	a0,5
1c00b506:	8acfe0ef          	jal	ra,1c0095b2 <__rt_cbsys_add>
1c00b50a:	1c0017b7          	lui	a5,0x1c001
1c00b50e:	1a07ac23          	sw	zero,440(a5) # 1c0011b8 <__rt_uart>
1c00b512:	8d41                	or	a0,a0,s0
1c00b514:	c105                	beqz	a0,1c00b534 <__rt_uart_init+0x52>
1c00b516:	f1402673          	csrr	a2,mhartid
1c00b51a:	1c000537          	lui	a0,0x1c000
1c00b51e:	40565593          	srai	a1,a2,0x5
1c00b522:	03f5f593          	andi	a1,a1,63
1c00b526:	8a7d                	andi	a2,a2,31
1c00b528:	6b850513          	addi	a0,a0,1720 # 1c0006b8 <__DTOR_END__+0x3cc>
1c00b52c:	ba8ff0ef          	jal	ra,1c00a8d4 <printf>
1c00b530:	b30ff0ef          	jal	ra,1c00a860 <abort>
1c00b534:	40b2                	lw	ra,12(sp)
1c00b536:	4422                	lw	s0,8(sp)
1c00b538:	0141                	addi	sp,sp,16
1c00b53a:	8082                	ret

Disassembly of section .text.cluster:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x1f4014>
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
1c010048:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_end+0xa1097fc>
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
1c0100b4:	01f02823          	sw	t6,16(zero) # 10 <_l1_preload_size>
1c0100b8:	00030a63          	beqz	t1,1c0100cc <__rt_no_stack_check>
1c0100bc:	40610eb3          	sub	t4,sp,t1
1c0100c0:	7d1e9073          	csrw	0x7d1,t4
1c0100c4:	7d211073          	csrw	0x7d2,sp
1c0100c8:	7d00d073          	csrwi	0x7d0,1

1c0100cc <__rt_no_stack_check>:
1c0100cc:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1f4098>
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
1c010124:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x1f4230>

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
