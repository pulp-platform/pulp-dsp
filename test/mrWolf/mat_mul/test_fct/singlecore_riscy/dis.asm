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
1c008090:	0ffc                	addi	a5,sp,988
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
1c0080bc:	01028293          	addi	t0,t0,16 # 1c0010c8 <_bss_start>
1c0080c0:	ffff9317          	auipc	t1,0xffff9
1c0080c4:	16430313          	addi	t1,t1,356 # 1c001224 <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0)
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	e0e10113          	addi	sp,sp,-498 # 1c000ee0 <stack>
1c0080da:	21e010ef          	jal	ra,1c0092f8 <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00001397          	auipc	t2,0x1
1c0080ea:	9fe38393          	addi	t2,t2,-1538 # 1c008ae4 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	378010ef          	jal	ra,1c00946c <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	7c2020ef          	jal	ra,1c00a8bc <exit>

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
1c00815e:	6ce60613          	addi	a2,a2,1742 # 1c009828 <__rt_bridge_handle_notif>
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
1c008198:	05448493          	addi	s1,s1,84 # 1c0011e8 <__rt_fc_cluster_data>

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
1c0081fa:	ff248493          	addi	s1,s1,-14 # 1c0011e8 <__rt_fc_cluster_data>
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
1c00825e:	2a250513          	addi	a0,a0,674 # 1c0094fc <__rt_handle_illegal_instr>
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
1c008340:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_end+0xa1077ec>
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
1c008518:	0007c503          	lbu	a0,0(a5) # 10000 <__l1_heap_size+0x2014>
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
1c00855a:	400020ef          	jal	ra,1c00a95a <printf>
1c00855e:	0028                	addi	a0,sp,8
1c008560:	561000ef          	jal	ra,1c0092c0 <rt_perf_init>
1c008564:	6585                	lui	a1,0x1
1c008566:	450d                	li	a0,3
1c008568:	25b1                	jal	1c008bb4 <rt_alloc>
1c00856a:	1c050163          	beqz	a0,1c00872c <cluster_entry+0x1fc>
1c00856e:	84aa                	mv	s1,a0
1c008570:	1c000537          	lui	a0,0x1c000
1c008574:	42450513          	addi	a0,a0,1060 # 1c000424 <__DTOR_END__+0x138>
1c008578:	2e2020ef          	jal	ra,1c00a85a <puts>
1c00857c:	65c1                	lui	a1,0x10
1c00857e:	0599                	addi	a1,a1,6
1c008580:	0028                	addi	a0,sp,8
1c008582:	553000ef          	jal	ra,1c0092d4 <rt_perf_conf>
1c008586:	47fd                	li	a5,31
1c008588:	14f40e63          	beq	s0,a5,1c0086e4 <cluster_entry+0x1b4>
1c00858c:	102007b7          	lui	a5,0x10200
1c008590:	4705                	li	a4,1
1c008592:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fe3ec>
1c008596:	02e7a023          	sw	a4,32(a5)
1c00859a:	4781                	li	a5,0
1c00859c:	79f79073          	csrw	pccr31,a5
1c0085a0:	f14027f3          	csrr	a5,mhartid
1c0085a4:	477d                	li	a4,31
1c0085a6:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085aa:	14e78c63          	beq	a5,a4,1c008702 <cluster_entry+0x1d2>
1c0085ae:	102007b7          	lui	a5,0x10200
1c0085b2:	4705                	li	a4,1
1c0085b4:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fe3ec>
1c0085b8:	00e7ac23          	sw	a4,24(a5)
1c0085bc:	478d                	li	a5,3
1c0085be:	7a179073          	csrw	pcmr,a5
1c0085c2:	100015b7          	lui	a1,0x10001
1c0085c6:	10002537          	lui	a0,0x10002
1c0085ca:	87a6                	mv	a5,s1
1c0085cc:	02000713          	li	a4,32
1c0085d0:	02000693          	li	a3,32
1c0085d4:	02000613          	li	a2,32
1c0085d8:	01458593          	addi	a1,a1,20 # 10001014 <m_b>
1c0085dc:	81450513          	addi	a0,a0,-2028 # 10001814 <m_a>
1c0085e0:	22ad                	jal	1c00874a <plp_mat_mult_i16v_xpulpv2>
1c0085e2:	477d                	li	a4,31
1c0085e4:	f14027f3          	csrr	a5,mhartid
1c0085e8:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085ec:	14e78763          	beq	a5,a4,1c00873a <cluster_entry+0x20a>
1c0085f0:	102007b7          	lui	a5,0x10200
1c0085f4:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fe3ec>
1c0085f8:	0007a023          	sw	zero,0(a5)
1c0085fc:	4781                	li	a5,0
1c0085fe:	7a179073          	csrw	pcmr,a5
1c008602:	10000937          	lui	s2,0x10000
1c008606:	01490913          	addi	s2,s2,20 # 10000014 <m_c>
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
1c00862e:	32c020ef          	jal	ra,1c00a95a <printf>
1c008632:	0a85                	addi	s5,s5,1
1c008634:	ff3411e3          	bne	s0,s3,1c008616 <cluster_entry+0xe6>
1c008638:	0e0a8363          	beqz	s5,1c00871e <cluster_entry+0x1ee>
1c00863c:	1c000537          	lui	a0,0x1c000
1c008640:	85d6                	mv	a1,s5
1c008642:	48850513          	addi	a0,a0,1160 # 1c000488 <__DTOR_END__+0x19c>
1c008646:	314020ef          	jal	ra,1c00a95a <printf>
1c00864a:	f14027f3          	csrr	a5,mhartid
1c00864e:	477d                	li	a4,31
1c008650:	ca5797b3          	p.extractu	a5,a5,5,5
1c008654:	0ce78063          	beq	a5,a4,1c008714 <cluster_entry+0x1e4>
1c008658:	10200437          	lui	s0,0x10200
1c00865c:	40040413          	addi	s0,s0,1024 # 10200400 <__l1_end+0x1fe3ec>
1c008660:	00842403          	lw	s0,8(s0)
1c008664:	781024f3          	csrr	s1,pccr1
1c008668:	78202973          	csrr	s2,pccr2
1c00866c:	1c000537          	lui	a0,0x1c000
1c008670:	85a2                	mv	a1,s0
1c008672:	49c50513          	addi	a0,a0,1180 # 1c00049c <__DTOR_END__+0x1b0>
1c008676:	2e4020ef          	jal	ra,1c00a95a <printf>
1c00867a:	1c000537          	lui	a0,0x1c000
1c00867e:	85a6                	mv	a1,s1
1c008680:	4b050513          	addi	a0,a0,1200 # 1c0004b0 <__DTOR_END__+0x1c4>
1c008684:	2d6020ef          	jal	ra,1c00a95a <printf>
1c008688:	1c000537          	lui	a0,0x1c000
1c00868c:	85ca                	mv	a1,s2
1c00868e:	4c450513          	addi	a0,a0,1220 # 1c0004c4 <__DTOR_END__+0x1d8>
1c008692:	2c8020ef          	jal	ra,1c00a95a <printf>
1c008696:	1c000537          	lui	a0,0x1c000
1c00869a:	65c1                	lui	a1,0x10
1c00869c:	4d450513          	addi	a0,a0,1236 # 1c0004d4 <__DTOR_END__+0x1e8>
1c0086a0:	2ba020ef          	jal	ra,1c00a95a <printf>
1c0086a4:	006409b7          	lui	s3,0x640
1c0086a8:	6941                	lui	s2,0x10
1c0086aa:	0299d633          	divu	a2,s3,s1
1c0086ae:	1c000537          	lui	a0,0x1c000
1c0086b2:	4e450513          	addi	a0,a0,1252 # 1c0004e4 <__DTOR_END__+0x1f8>
1c0086b6:	029955b3          	divu	a1,s2,s1
1c0086ba:	2a0020ef          	jal	ra,1c00a95a <printf>
1c0086be:	0289d633          	divu	a2,s3,s0
1c0086c2:	1c000537          	lui	a0,0x1c000
1c0086c6:	50450513          	addi	a0,a0,1284 # 1c000504 <__DTOR_END__+0x218>
1c0086ca:	028955b3          	divu	a1,s2,s0
1c0086ce:	28c020ef          	jal	ra,1c00a95a <printf>
1c0086d2:	50b6                	lw	ra,108(sp)
1c0086d4:	5426                	lw	s0,104(sp)
1c0086d6:	5496                	lw	s1,100(sp)
1c0086d8:	5906                	lw	s2,96(sp)
1c0086da:	49f6                	lw	s3,92(sp)
1c0086dc:	4a66                	lw	s4,88(sp)
1c0086de:	4ad6                	lw	s5,84(sp)
1c0086e0:	6165                	addi	sp,sp,112
1c0086e2:	8082                	ret
1c0086e4:	4785                	li	a5,1
1c0086e6:	1a10b737          	lui	a4,0x1a10b
1c0086ea:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa10900c>
1c0086ee:	4781                	li	a5,0
1c0086f0:	79f79073          	csrw	pccr31,a5
1c0086f4:	f14027f3          	csrr	a5,mhartid
1c0086f8:	477d                	li	a4,31
1c0086fa:	ca5797b3          	p.extractu	a5,a5,5,5
1c0086fe:	eae798e3          	bne	a5,a4,1c0085ae <cluster_entry+0x7e>
1c008702:	4785                	li	a5,1
1c008704:	1a10b737          	lui	a4,0x1a10b
1c008708:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa109004>
1c00870c:	478d                	li	a5,3
1c00870e:	7a179073          	csrw	pcmr,a5
1c008712:	bd45                	j	1c0085c2 <cluster_entry+0x92>
1c008714:	1a10b437          	lui	s0,0x1a10b
1c008718:	00842403          	lw	s0,8(s0) # 1a10b008 <__l1_end+0xa108ff4>
1c00871c:	b7a1                	j	1c008664 <cluster_entry+0x134>
1c00871e:	1c000537          	lui	a0,0x1c000
1c008722:	47450513          	addi	a0,a0,1140 # 1c000474 <__DTOR_END__+0x188>
1c008726:	134020ef          	jal	ra,1c00a85a <puts>
1c00872a:	b705                	j	1c00864a <cluster_entry+0x11a>
1c00872c:	1c000537          	lui	a0,0x1c000
1c008730:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c008734:	126020ef          	jal	ra,1c00a85a <puts>
1c008738:	bf09                	j	1c00864a <cluster_entry+0x11a>
1c00873a:	1a10b7b7          	lui	a5,0x1a10b
1c00873e:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa108fec>
1c008742:	4781                	li	a5,0
1c008744:	7a179073          	csrw	pcmr,a5
1c008748:	bd6d                	j	1c008602 <cluster_entry+0xd2>

1c00874a <plp_mat_mult_i16v_xpulpv2>:
1c00874a:	7119                	addi	sp,sp,-128
1c00874c:	dea2                	sw	s0,124(sp)
1c00874e:	00265413          	srli	s0,a2,0x2
1c008752:	dca6                	sw	s1,120(sp)
1c008754:	daca                	sw	s2,116(sp)
1c008756:	d8ce                	sw	s3,112(sp)
1c008758:	d6d2                	sw	s4,108(sp)
1c00875a:	d4d6                	sw	s5,104(sp)
1c00875c:	d2da                	sw	s6,100(sp)
1c00875e:	d0de                	sw	s7,96(sp)
1c008760:	cee2                	sw	s8,92(sp)
1c008762:	cce6                	sw	s9,88(sp)
1c008764:	caea                	sw	s10,84(sp)
1c008766:	c8ee                	sw	s11,80(sp)
1c008768:	c2b2                	sw	a2,68(sp)
1c00876a:	d822                	sw	s0,48(sp)
1c00876c:	d62a                	sw	a0,44(sp)
1c00876e:	d02e                	sw	a1,32(sp)
1c008770:	c4be                	sw	a5,72(sp)
1c008772:	36040263          	beqz	s0,1c008ad6 <plp_mat_mult_i16v_xpulpv2+0x38c>
1c008776:	00169793          	slli	a5,a3,0x1
1c00877a:	00f50633          	add	a2,a0,a5
1c00877e:	00f60cb3          	add	s9,a2,a5
1c008782:	c866                	sw	s9,16(sp)
1c008784:	4ca6                	lw	s9,72(sp)
1c008786:	0016d593          	srli	a1,a3,0x1
1c00878a:	00171413          	slli	s0,a4,0x1
1c00878e:	c62e                	sw	a1,12(sp)
1c008790:	ca32                	sw	a2,20(sp)
1c008792:	00271d93          	slli	s11,a4,0x2
1c008796:	00259613          	slli	a2,a1,0x2
1c00879a:	00471593          	slli	a1,a4,0x4
1c00879e:	d222                	sw	s0,36(sp)
1c0087a0:	c0ae                	sw	a1,64(sp)
1c0087a2:	01bc8433          	add	s0,s9,s11
1c0087a6:	00369593          	slli	a1,a3,0x3
1c0087aa:	de66                	sw	s9,60(sp)
1c0087ac:	da22                	sw	s0,52(sp)
1c0087ae:	d42e                	sw	a1,40(sp)
1c0087b0:	4cc2                	lw	s9,16(sp)
1c0087b2:	5402                	lw	s0,32(sp)
1c0087b4:	5592                	lw	a1,36(sp)
1c0087b6:	97e6                	add	a5,a5,s9
1c0087b8:	962a                	add	a2,a2,a0
1c0087ba:	942e                	add	s0,s0,a1
1c0087bc:	8d2a                	mv	s10,a0
1c0087be:	ce3e                	sw	a5,28(sp)
1c0087c0:	cc32                	sw	a2,24(sp)
1c0087c2:	c6a2                	sw	s0,76(sp)
1c0087c4:	dc02                	sw	zero,56(sp)
1c0087c6:	18070863          	beqz	a4,1c008956 <plp_mat_mult_i16v_xpulpv2+0x20c>
1c0087ca:	5c82                	lw	s9,32(sp)
1c0087cc:	47b6                	lw	a5,76(sp)
1c0087ce:	5452                	lw	s0,52(sp)
1c0087d0:	5a82                	lw	s5,32(sp)
1c0087d2:	41978a33          	sub	s4,a5,s9
1c0087d6:	1a79                	addi	s4,s4,-2
1c0087d8:	5bf2                	lw	s7,60(sp)
1c0087da:	008d8b33          	add	s6,s11,s0
1c0087de:	001a5a13          	srli	s4,s4,0x1
1c0087e2:	016d8cb3          	add	s9,s11,s6
1c0087e6:	8c22                	mv	s8,s0
1c0087e8:	0a05                	addi	s4,s4,1
1c0087ea:	038a407b          	lp.setup	x0,s4,1c00885a <plp_mat_mult_i16v_xpulpv2+0x110>
1c0087ee:	45b2                	lw	a1,12(sp)
1c0087f0:	14058d63          	beqz	a1,1c00894a <plp_mat_mult_i16v_xpulpv2+0x200>
1c0087f4:	47e2                	lw	a5,24(sp)
1c0087f6:	5412                	lw	s0,36(sp)
1c0087f8:	43c2                	lw	t2,16(sp)
1c0087fa:	41a78633          	sub	a2,a5,s10
1c0087fe:	1671                	addi	a2,a2,-4
1c008800:	01540933          	add	s2,s0,s5
1c008804:	42d2                	lw	t0,20(sp)
1c008806:	4472                	lw	s0,28(sp)
1c008808:	8209                	srli	a2,a2,0x2
1c00880a:	84d6                	mv	s1,s5
1c00880c:	8fea                	mv	t6,s10
1c00880e:	4f01                	li	t5,0
1c008810:	4e81                	li	t4,0
1c008812:	4e01                	li	t3,0
1c008814:	4301                	li	t1,0
1c008816:	0605                	addi	a2,a2,1
1c008818:	016640fb          	lp.setup	x1,a2,1c008844 <plp_mat_mult_i16v_xpulpv2+0xfa>
1c00881c:	11b9798b          	p.lh	s3,s11(s2!)
1c008820:	11b4f78b          	p.lh	a5,s11(s1!)
1c008824:	004fa88b          	p.lw	a7,4(t6!)
1c008828:	0042a80b          	p.lw	a6,4(t0!)
1c00882c:	0043a50b          	p.lw	a0,4(t2!)
1c008830:	0044258b          	p.lw	a1,4(s0!)
1c008834:	d0f987d7          	pv.pack.h	a5,s3,a5
1c008838:	b8f88357          	pv.sdotsp.h	t1,a7,a5
1c00883c:	b8f80e57          	pv.sdotsp.h	t3,a6,a5
1c008840:	b8f50ed7          	pv.sdotsp.h	t4,a0,a5
1c008844:	b8f58f57          	pv.sdotsp.h	t5,a1,a5
1c008848:	4832                	lw	a6,12(sp)
1c00884a:	006ba22b          	p.sw	t1,4(s7!)
1c00884e:	01cc222b          	p.sw	t3,4(s8!)
1c008852:	01db222b          	p.sw	t4,4(s6!)
1c008856:	01eca22b          	p.sw	t5,4(s9!)
1c00885a:	0a89                	addi	s5,s5,2
1c00885c:	88ba                	mv	a7,a4
1c00885e:	5662                	lw	a2,56(sp)
1c008860:	4c86                	lw	s9,64(sp)
1c008862:	57f2                	lw	a5,60(sp)
1c008864:	5452                	lw	s0,52(sp)
1c008866:	0605                	addi	a2,a2,1
1c008868:	55a2                	lw	a1,40(sp)
1c00886a:	97e6                	add	a5,a5,s9
1c00886c:	9466                	add	s0,s0,s9
1c00886e:	dc32                	sw	a2,56(sp)
1c008870:	4652                	lw	a2,20(sp)
1c008872:	4cf2                	lw	s9,28(sp)
1c008874:	de3e                	sw	a5,60(sp)
1c008876:	da22                	sw	s0,52(sp)
1c008878:	47c2                	lw	a5,16(sp)
1c00887a:	4462                	lw	s0,24(sp)
1c00887c:	962e                	add	a2,a2,a1
1c00887e:	97ae                	add	a5,a5,a1
1c008880:	9cae                	add	s9,s9,a1
1c008882:	942e                	add	s0,s0,a1
1c008884:	9d2e                	add	s10,s10,a1
1c008886:	ca32                	sw	a2,20(sp)
1c008888:	55e2                	lw	a1,56(sp)
1c00888a:	5642                	lw	a2,48(sp)
1c00888c:	c83e                	sw	a5,16(sp)
1c00888e:	ce66                	sw	s9,28(sp)
1c008890:	cc22                	sw	s0,24(sp)
1c008892:	f2c59ae3          	bne	a1,a2,1c0087c6 <plp_mat_mult_i16v_xpulpv2+0x7c>
1c008896:	4c96                	lw	s9,68(sp)
1c008898:	060a                	slli	a2,a2,0x2
1c00889a:	d832                	sw	a2,48(sp)
1c00889c:	0806                	slli	a6,a6,0x1
1c00889e:	0acc8e63          	beq	s9,a2,1c00895a <plp_mat_mult_i16v_xpulpv2+0x210>
1c0088a2:	0c089463          	bnez	a7,1c00896a <plp_mat_mult_i16v_xpulpv2+0x220>
1c0088a6:	5642                	lw	a2,48(sp)
1c0088a8:	4c96                	lw	s9,68(sp)
1c0088aa:	09967263          	bleu	s9,a2,1c00892e <plp_mat_mult_i16v_xpulpv2+0x1e4>
1c0088ae:	5e32                	lw	t3,44(sp)
1c0088b0:	00169f93          	slli	t6,a3,0x1
1c0088b4:	00160e93          	addi	t4,a2,1 # 90000001 <pulp__FC+0x90000002>
1c0088b8:	02e60f33          	mul	t5,a2,a4
1c0088bc:	00171293          	slli	t0,a4,0x1
1c0088c0:	43fe8e33          	p.mac	t3,t4,t6
1c0088c4:	02d60333          	mul	t1,a2,a3
1c0088c8:	04e8fa63          	bleu	a4,a7,1c00891c <plp_mat_mult_i16v_xpulpv2+0x1d2>
1c0088cc:	4426                	lw	s0,72(sp)
1c0088ce:	01e883b3          	add	t2,a7,t5
1c0088d2:	038a                	slli	t2,t2,0x2
1c0088d4:	93a2                	add	t2,t2,s0
1c0088d6:	41170533          	sub	a0,a4,a7
1c0088da:	0205407b          	lp.setup	x0,a0,1c00891a <plp_mat_mult_i16v_xpulpv2+0x1d0>
1c0088de:	4581                	li	a1,0
1c0088e0:	02d87b63          	bleu	a3,a6,1c008916 <plp_mat_mult_i16v_xpulpv2+0x1cc>
1c0088e4:	8646                	mv	a2,a7
1c0088e6:	43070633          	p.mac	a2,a4,a6
1c0088ea:	5cb2                	lw	s9,44(sp)
1c0088ec:	981a                	add	a6,a6,t1
1c0088ee:	0806                	slli	a6,a6,0x1
1c0088f0:	9866                	add	a6,a6,s9
1c0088f2:	410e07b3          	sub	a5,t3,a6
1c0088f6:	5402                	lw	s0,32(sp)
1c0088f8:	17f9                	addi	a5,a5,-2
1c0088fa:	8385                	srli	a5,a5,0x1
1c0088fc:	4581                	li	a1,0
1c0088fe:	0606                	slli	a2,a2,0x1
1c008900:	0785                	addi	a5,a5,1
1c008902:	9622                	add	a2,a2,s0
1c008904:	0067c0fb          	lp.setup	x1,a5,1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c6>
1c008908:	0028140b          	p.lh	s0,2(a6!)
1c00890c:	1056748b          	p.lh	s1,t0(a2!)
1c008910:	428485b3          	p.mac	a1,s1,s0
1c008914:	8836                	mv	a6,a3
1c008916:	00b3a22b          	p.sw	a1,4(t2!)
1c00891a:	0885                	addi	a7,a7,1
1c00891c:	d876                	sw	t4,48(sp)
1c00891e:	4616                	lw	a2,68(sp)
1c008920:	5cc2                	lw	s9,48(sp)
1c008922:	9f3a                	add	t5,t5,a4
1c008924:	9e7e                	add	t3,t3,t6
1c008926:	9336                	add	t1,t1,a3
1c008928:	0e85                	addi	t4,t4,1
1c00892a:	f9961fe3          	bne	a2,s9,1c0088c8 <plp_mat_mult_i16v_xpulpv2+0x17e>
1c00892e:	5476                	lw	s0,124(sp)
1c008930:	54e6                	lw	s1,120(sp)
1c008932:	5956                	lw	s2,116(sp)
1c008934:	59c6                	lw	s3,112(sp)
1c008936:	5a36                	lw	s4,108(sp)
1c008938:	5aa6                	lw	s5,104(sp)
1c00893a:	5b16                	lw	s6,100(sp)
1c00893c:	5b86                	lw	s7,96(sp)
1c00893e:	4c76                	lw	s8,92(sp)
1c008940:	4ce6                	lw	s9,88(sp)
1c008942:	4d56                	lw	s10,84(sp)
1c008944:	4dc6                	lw	s11,80(sp)
1c008946:	6109                	addi	sp,sp,128
1c008948:	8082                	ret
1c00894a:	4801                	li	a6,0
1c00894c:	4f01                	li	t5,0
1c00894e:	4e81                	li	t4,0
1c008950:	4e01                	li	t3,0
1c008952:	4301                	li	t1,0
1c008954:	bddd                	j	1c00884a <plp_mat_mult_i16v_xpulpv2+0x100>
1c008956:	4881                	li	a7,0
1c008958:	b719                	j	1c00885e <plp_mat_mult_i16v_xpulpv2+0x114>
1c00895a:	f4d814e3          	bne	a6,a3,1c0088a2 <plp_mat_mult_i16v_xpulpv2+0x158>
1c00895e:	fd1708e3          	beq	a4,a7,1c00892e <plp_mat_mult_i16v_xpulpv2+0x1e4>
1c008962:	5cc2                	lw	s9,48(sp)
1c008964:	fc0c85e3          	beqz	s9,1c00892e <plp_mat_mult_i16v_xpulpv2+0x1e4>
1c008968:	bf2d                	j	1c0088a2 <plp_mat_mult_i16v_xpulpv2+0x158>
1c00896a:	f2080ee3          	beqz	a6,1c0088a6 <plp_mat_mult_i16v_xpulpv2+0x15c>
1c00896e:	5b82                	lw	s7,32(sp)
1c008970:	00171b13          	slli	s6,a4,0x1
1c008974:	4426                	lw	s0,72(sp)
1c008976:	43680bb3          	p.mac	s7,a6,s6
1c00897a:	5632                	lw	a2,44(sp)
1c00897c:	00289c13          	slli	s8,a7,0x2
1c008980:	00169493          	slli	s1,a3,0x1
1c008984:	9c22                	add	s8,s8,s0
1c008986:	00181293          	slli	t0,a6,0x1
1c00898a:	00960433          	add	s0,a2,s1
1c00898e:	41100ab3          	neg	s5,a7
1c008992:	00271a13          	slli	s4,a4,0x2
1c008996:	8962                	mv	s2,s8
1c008998:	92b2                	add	t0,t0,a2
1c00899a:	0a8a                	slli	s5,s5,0x2
1c00899c:	83a2                	mv	t2,s0
1c00899e:	4981                	li	s3,0
1c0089a0:	012a8f33          	add	t5,s5,s2
1c0089a4:	41e90eb3          	sub	t4,s2,t5
1c0089a8:	1ef1                	addi	t4,t4,-4
1c0089aa:	002ede93          	srli	t4,t4,0x2
1c0089ae:	8fde                	mv	t6,s7
1c0089b0:	0e85                	addi	t4,t4,1
1c0089b2:	01bec07b          	lp.setup	x0,t4,1c0089e8 <plp_mat_mult_i16v_xpulpv2+0x29e>
1c0089b6:	4601                	li	a2,0
1c0089b8:	02d87463          	bleu	a3,a6,1c0089e0 <plp_mat_mult_i16v_xpulpv2+0x296>
1c0089bc:	405387b3          	sub	a5,t2,t0
1c0089c0:	17f9                	addi	a5,a5,-2
1c0089c2:	8385                	srli	a5,a5,0x1
1c0089c4:	857e                	mv	a0,t6
1c0089c6:	8596                	mv	a1,t0
1c0089c8:	4601                	li	a2,0
1c0089ca:	0785                	addi	a5,a5,1
1c0089cc:	0097c0fb          	lp.setup	x1,a5,1c0089de <plp_mat_mult_i16v_xpulpv2+0x294>
1c0089d0:	0025930b          	p.lh	t1,2(a1!) # 10002 <__l1_heap_size+0x2016>
1c0089d4:	11657e0b          	p.lh	t3,s6(a0!)
1c0089d8:	8cb2                	mv	s9,a2
1c0089da:	426e0cb3          	p.mac	s9,t3,t1
1c0089de:	9666                	add	a2,a2,s9
1c0089e0:	000f2783          	lw	a5,0(t5)
1c0089e4:	0f89                	addi	t6,t6,2
1c0089e6:	963e                	add	a2,a2,a5
1c0089e8:	00cf222b          	p.sw	a2,4(t5!)
1c0089ec:	5642                	lw	a2,48(sp)
1c0089ee:	0985                	addi	s3,s3,1
1c0089f0:	9952                	add	s2,s2,s4
1c0089f2:	92a6                	add	t0,t0,s1
1c0089f4:	93a6                	add	t2,t2,s1
1c0089f6:	fac9e5e3          	bltu	s3,a2,1c0089a0 <plp_mat_mult_i16v_xpulpv2+0x256>
1c0089fa:	06e8f063          	bleu	a4,a7,1c008a5a <plp_mat_mult_i16v_xpulpv2+0x310>
1c0089fe:	5582                	lw	a1,32(sp)
1c008a00:	5eb2                	lw	t4,44(sp)
1c008a02:	0886                	slli	a7,a7,0x1
1c008a04:	01158fb3          	add	t6,a1,a7
1c008a08:	016582b3          	add	t0,a1,s6
1c008a0c:	4f01                	li	t5,0
1c008a0e:	41f288b3          	sub	a7,t0,t6
1c008a12:	18f9                	addi	a7,a7,-2
1c008a14:	0018d893          	srli	a7,a7,0x1
1c008a18:	837e                	mv	t1,t6
1c008a1a:	8e62                	mv	t3,s8
1c008a1c:	0885                	addi	a7,a7,1
1c008a1e:	0168c07b          	lp.setup	x0,a7,1c008a4a <plp_mat_mult_i16v_xpulpv2+0x300>
1c008a22:	4601                	li	a2,0
1c008a24:	c28d                	beqz	a3,1c008a46 <plp_mat_mult_i16v_xpulpv2+0x2fc>
1c008a26:	41d407b3          	sub	a5,s0,t4
1c008a2a:	17f9                	addi	a5,a5,-2
1c008a2c:	8385                	srli	a5,a5,0x1
1c008a2e:	851a                	mv	a0,t1
1c008a30:	85f6                	mv	a1,t4
1c008a32:	4601                	li	a2,0
1c008a34:	0785                	addi	a5,a5,1
1c008a36:	0067c0fb          	lp.setup	x1,a5,1c008a42 <plp_mat_mult_i16v_xpulpv2+0x2f8>
1c008a3a:	0025980b          	p.lh	a6,2(a1!)
1c008a3e:	1165738b          	p.lh	t2,s6(a0!)
1c008a42:	43038633          	p.mac	a2,t2,a6
1c008a46:	00ce222b          	p.sw	a2,4(t3!)
1c008a4a:	0309                	addi	t1,t1,2
1c008a4c:	5cc2                	lw	s9,48(sp)
1c008a4e:	0f05                	addi	t5,t5,1
1c008a50:	9c52                	add	s8,s8,s4
1c008a52:	9ea6                	add	t4,t4,s1
1c008a54:	9426                	add	s0,s0,s1
1c008a56:	fb9f6ce3          	bltu	t5,s9,1c008a0e <plp_mat_mult_i16v_xpulpv2+0x2c4>
1c008a5a:	5442                	lw	s0,48(sp)
1c008a5c:	4616                	lw	a2,68(sp)
1c008a5e:	ecc478e3          	bleu	a2,s0,1c00892e <plp_mat_mult_i16v_xpulpv2+0x1e4>
1c008a62:	ec0706e3          	beqz	a4,1c00892e <plp_mat_mult_i16v_xpulpv2+0x1e4>
1c008a66:	4fa6                	lw	t6,72(sp)
1c008a68:	5f32                	lw	t5,44(sp)
1c008a6a:	53b2                	lw	t2,44(sp)
1c008a6c:	00140e93          	addi	t4,s0,1
1c008a70:	43440fb3          	p.mac	t6,s0,s4
1c008a74:	5c82                	lw	s9,32(sp)
1c008a76:	016c82b3          	add	t0,s9,s6
1c008a7a:	42940f33          	p.mac	t5,s0,s1
1c008a7e:	429e83b3          	p.mac	t2,t4,s1
1c008a82:	5402                	lw	s0,32(sp)
1c008a84:	8e7e                	mv	t3,t6
1c008a86:	408288b3          	sub	a7,t0,s0
1c008a8a:	18f9                	addi	a7,a7,-2
1c008a8c:	0018d893          	srli	a7,a7,0x1
1c008a90:	8322                	mv	t1,s0
1c008a92:	0885                	addi	a7,a7,1
1c008a94:	0168c07b          	lp.setup	x0,a7,1c008ac0 <plp_mat_mult_i16v_xpulpv2+0x376>
1c008a98:	4701                	li	a4,0
1c008a9a:	c28d                	beqz	a3,1c008abc <plp_mat_mult_i16v_xpulpv2+0x372>
1c008a9c:	41e387b3          	sub	a5,t2,t5
1c008aa0:	17f9                	addi	a5,a5,-2
1c008aa2:	8385                	srli	a5,a5,0x1
1c008aa4:	859a                	mv	a1,t1
1c008aa6:	867a                	mv	a2,t5
1c008aa8:	4701                	li	a4,0
1c008aaa:	0785                	addi	a5,a5,1
1c008aac:	0067c0fb          	lp.setup	x1,a5,1c008ab8 <plp_mat_mult_i16v_xpulpv2+0x36e>
1c008ab0:	0026150b          	p.lh	a0,2(a2!)
1c008ab4:	1165f80b          	p.lh	a6,s6(a1!)
1c008ab8:	42a80733          	p.mac	a4,a6,a0
1c008abc:	00ee222b          	p.sw	a4,4(t3!)
1c008ac0:	0309                	addi	t1,t1,2
1c008ac2:	d876                	sw	t4,48(sp)
1c008ac4:	4616                	lw	a2,68(sp)
1c008ac6:	5cc2                	lw	s9,48(sp)
1c008ac8:	9fd2                	add	t6,t6,s4
1c008aca:	9f26                	add	t5,t5,s1
1c008acc:	93a6                	add	t2,t2,s1
1c008ace:	0e85                	addi	t4,t4,1
1c008ad0:	fb9619e3          	bne	a2,s9,1c008a82 <plp_mat_mult_i16v_xpulpv2+0x338>
1c008ad4:	bda9                	j	1c00892e <plp_mat_mult_i16v_xpulpv2+0x1e4>
1c008ad6:	4801                	li	a6,0
1c008ad8:	dc0617e3          	bnez	a2,1c0088a6 <plp_mat_mult_i16v_xpulpv2+0x15c>
1c008adc:	e50699e3          	bne	a3,a6,1c00892e <plp_mat_mult_i16v_xpulpv2+0x1e4>
1c008ae0:	d832                	sw	a2,48(sp)
1c008ae2:	bdb5                	j	1c00895e <plp_mat_mult_i16v_xpulpv2+0x214>

1c008ae4 <main>:
1c008ae4:	1101                	addi	sp,sp,-32
1c008ae6:	4681                	li	a3,0
1c008ae8:	4601                	li	a2,0
1c008aea:	4581                	li	a1,0
1c008aec:	4505                	li	a0,1
1c008aee:	ce06                	sw	ra,28(sp)
1c008af0:	2559                	jal	1c009176 <rt_cluster_mount>
1c008af2:	1c008637          	lui	a2,0x1c008
1c008af6:	4881                	li	a7,0
1c008af8:	4801                	li	a6,0
1c008afa:	4781                	li	a5,0
1c008afc:	4701                	li	a4,0
1c008afe:	4681                	li	a3,0
1c008b00:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c008b04:	4581                	li	a1,0
1c008b06:	c002                	sw	zero,0(sp)
1c008b08:	4501                	li	a0,0
1c008b0a:	2bc9                	jal	1c0090dc <rt_cluster_call>
1c008b0c:	4501                	li	a0,0
1c008b0e:	4681                	li	a3,0
1c008b10:	4601                	li	a2,0
1c008b12:	4581                	li	a1,0
1c008b14:	258d                	jal	1c009176 <rt_cluster_mount>
1c008b16:	40f2                	lw	ra,28(sp)
1c008b18:	4501                	li	a0,0
1c008b1a:	6105                	addi	sp,sp,32
1c008b1c:	8082                	ret

1c008b1e <rt_user_alloc_init>:
1c008b1e:	00758793          	addi	a5,a1,7
1c008b22:	9be1                	andi	a5,a5,-8
1c008b24:	40b785b3          	sub	a1,a5,a1
1c008b28:	c11c                	sw	a5,0(a0)
1c008b2a:	8e0d                	sub	a2,a2,a1
1c008b2c:	00c05663          	blez	a2,1c008b38 <rt_user_alloc_init+0x1a>
1c008b30:	9a61                	andi	a2,a2,-8
1c008b32:	c390                	sw	a2,0(a5)
1c008b34:	0007a223          	sw	zero,4(a5)
1c008b38:	8082                	ret

1c008b3a <rt_user_alloc>:
1c008b3a:	411c                	lw	a5,0(a0)
1c008b3c:	059d                	addi	a1,a1,7
1c008b3e:	99e1                	andi	a1,a1,-8
1c008b40:	4681                	li	a3,0
1c008b42:	cb89                	beqz	a5,1c008b54 <rt_user_alloc+0x1a>
1c008b44:	4398                	lw	a4,0(a5)
1c008b46:	00b74963          	blt	a4,a1,1c008b58 <rt_user_alloc+0x1e>
1c008b4a:	00b71c63          	bne	a4,a1,1c008b62 <rt_user_alloc+0x28>
1c008b4e:	43d8                	lw	a4,4(a5)
1c008b50:	c699                	beqz	a3,1c008b5e <rt_user_alloc+0x24>
1c008b52:	c2d8                	sw	a4,4(a3)
1c008b54:	853e                	mv	a0,a5
1c008b56:	8082                	ret
1c008b58:	86be                	mv	a3,a5
1c008b5a:	43dc                	lw	a5,4(a5)
1c008b5c:	b7dd                	j	1c008b42 <rt_user_alloc+0x8>
1c008b5e:	c118                	sw	a4,0(a0)
1c008b60:	bfd5                	j	1c008b54 <rt_user_alloc+0x1a>
1c008b62:	8f0d                	sub	a4,a4,a1
1c008b64:	c398                	sw	a4,0(a5)
1c008b66:	97ba                	add	a5,a5,a4
1c008b68:	b7f5                	j	1c008b54 <rt_user_alloc+0x1a>

1c008b6a <rt_user_free>:
1c008b6a:	411c                	lw	a5,0(a0)
1c008b6c:	061d                	addi	a2,a2,7
1c008b6e:	9a61                	andi	a2,a2,-8
1c008b70:	4701                	li	a4,0
1c008b72:	c399                	beqz	a5,1c008b78 <rt_user_free+0xe>
1c008b74:	02b7e763          	bltu	a5,a1,1c008ba2 <rt_user_free+0x38>
1c008b78:	00c586b3          	add	a3,a1,a2
1c008b7c:	02d79663          	bne	a5,a3,1c008ba8 <rt_user_free+0x3e>
1c008b80:	4394                	lw	a3,0(a5)
1c008b82:	43dc                	lw	a5,4(a5)
1c008b84:	9636                	add	a2,a2,a3
1c008b86:	c190                	sw	a2,0(a1)
1c008b88:	c1dc                	sw	a5,4(a1)
1c008b8a:	c31d                	beqz	a4,1c008bb0 <rt_user_free+0x46>
1c008b8c:	4314                	lw	a3,0(a4)
1c008b8e:	00d707b3          	add	a5,a4,a3
1c008b92:	00f59d63          	bne	a1,a5,1c008bac <rt_user_free+0x42>
1c008b96:	419c                	lw	a5,0(a1)
1c008b98:	97b6                	add	a5,a5,a3
1c008b9a:	c31c                	sw	a5,0(a4)
1c008b9c:	41dc                	lw	a5,4(a1)
1c008b9e:	c35c                	sw	a5,4(a4)
1c008ba0:	8082                	ret
1c008ba2:	873e                	mv	a4,a5
1c008ba4:	43dc                	lw	a5,4(a5)
1c008ba6:	b7f1                	j	1c008b72 <rt_user_free+0x8>
1c008ba8:	c190                	sw	a2,0(a1)
1c008baa:	bff9                	j	1c008b88 <rt_user_free+0x1e>
1c008bac:	c34c                	sw	a1,4(a4)
1c008bae:	8082                	ret
1c008bb0:	c10c                	sw	a1,0(a0)
1c008bb2:	8082                	ret

1c008bb4 <rt_alloc>:
1c008bb4:	1101                	addi	sp,sp,-32
1c008bb6:	cc22                	sw	s0,24(sp)
1c008bb8:	ce06                	sw	ra,28(sp)
1c008bba:	ca26                	sw	s1,20(sp)
1c008bbc:	c84a                	sw	s2,16(sp)
1c008bbe:	c64e                	sw	s3,12(sp)
1c008bc0:	c452                	sw	s4,8(sp)
1c008bc2:	4789                	li	a5,2
1c008bc4:	842a                	mv	s0,a0
1c008bc6:	02a7ed63          	bltu	a5,a0,1c008c00 <rt_alloc+0x4c>
1c008bca:	1c001937          	lui	s2,0x1c001
1c008bce:	89ae                	mv	s3,a1
1c008bd0:	448d                	li	s1,3
1c008bd2:	1d890913          	addi	s2,s2,472 # 1c0011d8 <__rt_alloc_l2>
1c008bd6:	4a0d                	li	s4,3
1c008bd8:	00241513          	slli	a0,s0,0x2
1c008bdc:	85ce                	mv	a1,s3
1c008bde:	954a                	add	a0,a0,s2
1c008be0:	3fa9                	jal	1c008b3a <rt_user_alloc>
1c008be2:	e519                	bnez	a0,1c008bf0 <rt_alloc+0x3c>
1c008be4:	0405                	addi	s0,s0,1
1c008be6:	01441363          	bne	s0,s4,1c008bec <rt_alloc+0x38>
1c008bea:	4401                	li	s0,0
1c008bec:	14fd                	addi	s1,s1,-1
1c008bee:	f4ed                	bnez	s1,1c008bd8 <rt_alloc+0x24>
1c008bf0:	40f2                	lw	ra,28(sp)
1c008bf2:	4462                	lw	s0,24(sp)
1c008bf4:	44d2                	lw	s1,20(sp)
1c008bf6:	4942                	lw	s2,16(sp)
1c008bf8:	49b2                	lw	s3,12(sp)
1c008bfa:	4a22                	lw	s4,8(sp)
1c008bfc:	6105                	addi	sp,sp,32
1c008bfe:	8082                	ret
1c008c00:	1c0017b7          	lui	a5,0x1c001
1c008c04:	ffd50413          	addi	s0,a0,-3
1c008c08:	1d47a503          	lw	a0,468(a5) # 1c0011d4 <__rt_alloc_l1>
1c008c0c:	040a                	slli	s0,s0,0x2
1c008c0e:	40f2                	lw	ra,28(sp)
1c008c10:	9522                	add	a0,a0,s0
1c008c12:	4462                	lw	s0,24(sp)
1c008c14:	44d2                	lw	s1,20(sp)
1c008c16:	4942                	lw	s2,16(sp)
1c008c18:	49b2                	lw	s3,12(sp)
1c008c1a:	4a22                	lw	s4,8(sp)
1c008c1c:	6105                	addi	sp,sp,32
1c008c1e:	bf31                	j	1c008b3a <rt_user_alloc>

1c008c20 <__rt_alloc_init_l1>:
1c008c20:	1c0017b7          	lui	a5,0x1c001
1c008c24:	1d47a703          	lw	a4,468(a5) # 1c0011d4 <__rt_alloc_l1>
1c008c28:	100027b7          	lui	a5,0x10002
1c008c2c:	01651593          	slli	a1,a0,0x16
1c008c30:	6639                	lui	a2,0xe
1c008c32:	050a                	slli	a0,a0,0x2
1c008c34:	01478793          	addi	a5,a5,20 # 10002014 <__l1_end>
1c008c38:	fec60613          	addi	a2,a2,-20 # dfec <__l1_heap_size>
1c008c3c:	95be                	add	a1,a1,a5
1c008c3e:	953a                	add	a0,a0,a4
1c008c40:	bdf9                	j	1c008b1e <rt_user_alloc_init>

1c008c42 <__rt_alloc_init_l1_for_fc>:
1c008c42:	100025b7          	lui	a1,0x10002
1c008c46:	01651793          	slli	a5,a0,0x16
1c008c4a:	01458593          	addi	a1,a1,20 # 10002014 <__l1_end>
1c008c4e:	00b78733          	add	a4,a5,a1
1c008c52:	050a                	slli	a0,a0,0x2
1c008c54:	0791                	addi	a5,a5,4
1c008c56:	6639                	lui	a2,0xe
1c008c58:	1c0016b7          	lui	a3,0x1c001
1c008c5c:	fe860613          	addi	a2,a2,-24 # dfe8 <_l1_preload_size+0xbfd8>
1c008c60:	95be                	add	a1,a1,a5
1c008c62:	953a                	add	a0,a0,a4
1c008c64:	1ce6aa23          	sw	a4,468(a3) # 1c0011d4 <__rt_alloc_l1>
1c008c68:	bd5d                	j	1c008b1e <rt_user_alloc_init>

1c008c6a <__rt_allocs_init>:
1c008c6a:	1141                	addi	sp,sp,-16
1c008c6c:	1c0015b7          	lui	a1,0x1c001
1c008c70:	c606                	sw	ra,12(sp)
1c008c72:	22458793          	addi	a5,a1,548 # 1c001224 <__l2_priv0_end>
1c008c76:	1c008637          	lui	a2,0x1c008
1c008c7a:	06c7ca63          	blt	a5,a2,1c008cee <__rt_allocs_init+0x84>
1c008c7e:	4581                	li	a1,0
1c008c80:	4601                	li	a2,0
1c008c82:	1c001537          	lui	a0,0x1c001
1c008c86:	1d850513          	addi	a0,a0,472 # 1c0011d8 <__rt_alloc_l2>
1c008c8a:	3d51                	jal	1c008b1e <rt_user_alloc_init>
1c008c8c:	1c00b5b7          	lui	a1,0x1c00b
1c008c90:	5c458793          	addi	a5,a1,1476 # 1c00b5c4 <__l2_priv1_end>
1c008c94:	1c010637          	lui	a2,0x1c010
1c008c98:	04c7cf63          	blt	a5,a2,1c008cf6 <__rt_allocs_init+0x8c>
1c008c9c:	4581                	li	a1,0
1c008c9e:	4601                	li	a2,0
1c008ca0:	1c001537          	lui	a0,0x1c001
1c008ca4:	1dc50513          	addi	a0,a0,476 # 1c0011dc <__rt_alloc_l2+0x4>
1c008ca8:	3d9d                	jal	1c008b1e <rt_user_alloc_init>
1c008caa:	1c0125b7          	lui	a1,0x1c012
1c008cae:	19858793          	addi	a5,a1,408 # 1c012198 <__l2_shared_end>
1c008cb2:	1c080637          	lui	a2,0x1c080
1c008cb6:	1c001537          	lui	a0,0x1c001
1c008cba:	8e1d                	sub	a2,a2,a5
1c008cbc:	19858593          	addi	a1,a1,408
1c008cc0:	1e050513          	addi	a0,a0,480 # 1c0011e0 <__rt_alloc_l2+0x8>
1c008cc4:	3da9                	jal	1c008b1e <rt_user_alloc_init>
1c008cc6:	f14027f3          	csrr	a5,mhartid
1c008cca:	8795                	srai	a5,a5,0x5
1c008ccc:	03f7f793          	andi	a5,a5,63
1c008cd0:	e789                	bnez	a5,1c008cda <__rt_allocs_init+0x70>
1c008cd2:	40b2                	lw	ra,12(sp)
1c008cd4:	4501                	li	a0,0
1c008cd6:	0141                	addi	sp,sp,16
1c008cd8:	b7ad                	j	1c008c42 <__rt_alloc_init_l1_for_fc>
1c008cda:	4591                	li	a1,4
1c008cdc:	4501                	li	a0,0
1c008cde:	3dd9                	jal	1c008bb4 <rt_alloc>
1c008ce0:	40b2                	lw	ra,12(sp)
1c008ce2:	1c0017b7          	lui	a5,0x1c001
1c008ce6:	1ca7aa23          	sw	a0,468(a5) # 1c0011d4 <__rt_alloc_l1>
1c008cea:	0141                	addi	sp,sp,16
1c008cec:	8082                	ret
1c008cee:	8e1d                	sub	a2,a2,a5
1c008cf0:	22458593          	addi	a1,a1,548
1c008cf4:	b779                	j	1c008c82 <__rt_allocs_init+0x18>
1c008cf6:	8e1d                	sub	a2,a2,a5
1c008cf8:	5c458593          	addi	a1,a1,1476
1c008cfc:	b755                	j	1c008ca0 <__rt_allocs_init+0x36>

1c008cfe <__rt_init_cluster_data>:
1c008cfe:	04050793          	addi	a5,a0,64
1c008d02:	01679693          	slli	a3,a5,0x16
1c008d06:	6705                	lui	a4,0x1
1c008d08:	177d                	addi	a4,a4,-1
1c008d0a:	00400793          	li	a5,4
1c008d0e:	8ff9                	and	a5,a5,a4
1c008d10:	1c010737          	lui	a4,0x1c010
1c008d14:	97b6                	add	a5,a5,a3
1c008d16:	6609                	lui	a2,0x2
1c008d18:	18870713          	addi	a4,a4,392 # 1c010188 <_l1_preload_start_inL2>
1c008d1c:	01060613          	addi	a2,a2,16 # 2010 <_l1_preload_size>
1c008d20:	8f99                	sub	a5,a5,a4
1c008d22:	00f705b3          	add	a1,a4,a5
1c008d26:	02c04b63          	bgtz	a2,1c008d5c <__rt_init_cluster_data+0x5e>
1c008d2a:	02800713          	li	a4,40
1c008d2e:	02e50733          	mul	a4,a0,a4
1c008d32:	1c0017b7          	lui	a5,0x1c001
1c008d36:	1e878513          	addi	a0,a5,488 # 1c0011e8 <__rt_fc_cluster_data>
1c008d3a:	002017b7          	lui	a5,0x201
1c008d3e:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c008d42:	97b6                	add	a5,a5,a3
1c008d44:	953a                	add	a0,a0,a4
1c008d46:	c91c                	sw	a5,16(a0)
1c008d48:	6705                	lui	a4,0x1
1c008d4a:	00400793          	li	a5,4
1c008d4e:	177d                	addi	a4,a4,-1
1c008d50:	8ff9                	and	a5,a5,a4
1c008d52:	97b6                	add	a5,a5,a3
1c008d54:	00052423          	sw	zero,8(a0)
1c008d58:	c95c                	sw	a5,20(a0)
1c008d5a:	8082                	ret
1c008d5c:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008d60:	1671                	addi	a2,a2,-4
1c008d62:	0711                	addi	a4,a4,4
1c008d64:	0105a023          	sw	a6,0(a1)
1c008d68:	bf6d                	j	1c008d22 <__rt_init_cluster_data+0x24>

1c008d6a <__rt_cluster_mount_step>:
1c008d6a:	7179                	addi	sp,sp,-48
1c008d6c:	d04a                	sw	s2,32(sp)
1c008d6e:	ce4e                	sw	s3,28(sp)
1c008d70:	6785                	lui	a5,0x1
1c008d72:	1c0089b7          	lui	s3,0x1c008
1c008d76:	00400913          	li	s2,4
1c008d7a:	17fd                	addi	a5,a5,-1
1c008d7c:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008d80:	d422                	sw	s0,40(sp)
1c008d82:	d606                	sw	ra,44(sp)
1c008d84:	d226                	sw	s1,36(sp)
1c008d86:	cc52                	sw	s4,24(sp)
1c008d88:	842a                	mv	s0,a0
1c008d8a:	00f97933          	and	s2,s2,a5
1c008d8e:	f009f993          	andi	s3,s3,-256
1c008d92:	4c5c                	lw	a5,28(s0)
1c008d94:	4705                	li	a4,1
1c008d96:	02e78d63          	beq	a5,a4,1c008dd0 <__rt_cluster_mount_step+0x66>
1c008d9a:	4709                	li	a4,2
1c008d9c:	0ae78d63          	beq	a5,a4,1c008e56 <__rt_cluster_mount_step+0xec>
1c008da0:	e7dd                	bnez	a5,1c008e4e <__rt_cluster_mount_step+0xe4>
1c008da2:	5018                	lw	a4,32(s0)
1c008da4:	00042c23          	sw	zero,24(s0)
1c008da8:	eb01                	bnez	a4,1c008db8 <__rt_cluster_mount_step+0x4e>
1c008daa:	5048                	lw	a0,36(s0)
1c008dac:	006c                	addi	a1,sp,12
1c008dae:	c602                	sw	zero,12(sp)
1c008db0:	1e8010ef          	jal	ra,1c009f98 <__rt_pmu_cluster_power_up>
1c008db4:	47b2                	lw	a5,12(sp)
1c008db6:	cc08                	sw	a0,24(s0)
1c008db8:	4c58                	lw	a4,28(s0)
1c008dba:	0705                	addi	a4,a4,1
1c008dbc:	cc58                	sw	a4,28(s0)
1c008dbe:	dbf1                	beqz	a5,1c008d92 <__rt_cluster_mount_step+0x28>
1c008dc0:	50b2                	lw	ra,44(sp)
1c008dc2:	5422                	lw	s0,40(sp)
1c008dc4:	5492                	lw	s1,36(sp)
1c008dc6:	5902                	lw	s2,32(sp)
1c008dc8:	49f2                	lw	s3,28(sp)
1c008dca:	4a62                	lw	s4,24(sp)
1c008dcc:	6145                	addi	sp,sp,48
1c008dce:	8082                	ret
1c008dd0:	02042a03          	lw	s4,32(s0)
1c008dd4:	040a0493          	addi	s1,s4,64
1c008dd8:	04da                	slli	s1,s1,0x16
1c008dda:	00990733          	add	a4,s2,s1
1c008dde:	00072223          	sw	zero,4(a4)
1c008de2:	00072423          	sw	zero,8(a4)
1c008de6:	00072023          	sw	zero,0(a4)
1c008dea:	1c001737          	lui	a4,0x1c001
1c008dee:	0bc72703          	lw	a4,188(a4) # 1c0010bc <__rt_platform>
1c008df2:	00f70f63          	beq	a4,a5,1c008e10 <__rt_cluster_mount_step+0xa6>
1c008df6:	4505                	li	a0,1
1c008df8:	727000ef          	jal	ra,1c009d1e <__rt_fll_init>
1c008dfc:	1c0017b7          	lui	a5,0x1c001
1c008e00:	21878793          	addi	a5,a5,536 # 1c001218 <__rt_freq_domains>
1c008e04:	43cc                	lw	a1,4(a5)
1c008e06:	c5b1                	beqz	a1,1c008e52 <__rt_cluster_mount_step+0xe8>
1c008e08:	4601                	li	a2,0
1c008e0a:	4505                	li	a0,1
1c008e0c:	0a8010ef          	jal	ra,1c009eb4 <rt_freq_set_and_get>
1c008e10:	8552                	mv	a0,s4
1c008e12:	35f5                	jal	1c008cfe <__rt_init_cluster_data>
1c008e14:	8552                	mv	a0,s4
1c008e16:	3529                	jal	1c008c20 <__rt_alloc_init_l1>
1c008e18:	002017b7          	lui	a5,0x201
1c008e1c:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f3414>
1c008e20:	97a6                	add	a5,a5,s1
1c008e22:	577d                	li	a4,-1
1c008e24:	c398                	sw	a4,0(a5)
1c008e26:	002007b7          	lui	a5,0x200
1c008e2a:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f2054>
1c008e2e:	06078793          	addi	a5,a5,96
1c008e32:	9726                	add	a4,a4,s1
1c008e34:	97a6                	add	a5,a5,s1
1c008e36:	01372023          	sw	s3,0(a4)
1c008e3a:	0711                	addi	a4,a4,4
1c008e3c:	fef71de3          	bne	a4,a5,1c008e36 <__rt_cluster_mount_step+0xcc>
1c008e40:	002007b7          	lui	a5,0x200
1c008e44:	07a1                	addi	a5,a5,8
1c008e46:	94be                	add	s1,s1,a5
1c008e48:	0ff00793          	li	a5,255
1c008e4c:	c09c                	sw	a5,0(s1)
1c008e4e:	4781                	li	a5,0
1c008e50:	b7a5                	j	1c008db8 <__rt_cluster_mount_step+0x4e>
1c008e52:	c3c8                	sw	a0,4(a5)
1c008e54:	bf75                	j	1c008e10 <__rt_cluster_mount_step+0xa6>
1c008e56:	505c                	lw	a5,36(s0)
1c008e58:	5b98                	lw	a4,48(a5)
1c008e5a:	d398                	sw	a4,32(a5)
1c008e5c:	5798                	lw	a4,40(a5)
1c008e5e:	c398                	sw	a4,0(a5)
1c008e60:	57d8                	lw	a4,44(a5)
1c008e62:	c3d8                	sw	a4,4(a5)
1c008e64:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f2044>
1c008e68:	505c                	lw	a5,36(s0)
1c008e6a:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008e6e:	0007ac23          	sw	zero,24(a5)
1c008e72:	cb01                	beqz	a4,1c008e82 <__rt_cluster_mount_step+0x118>
1c008e74:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008e78:	cf1c                	sw	a5,24(a4)
1c008e7a:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008e7e:	4785                	li	a5,1
1c008e80:	bf25                	j	1c008db8 <__rt_cluster_mount_step+0x4e>
1c008e82:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008e86:	bfd5                	j	1c008e7a <__rt_cluster_mount_step+0x110>

1c008e88 <__rt_cluster_init>:
1c008e88:	1c001537          	lui	a0,0x1c001
1c008e8c:	1141                	addi	sp,sp,-16
1c008e8e:	02800613          	li	a2,40
1c008e92:	4581                	li	a1,0
1c008e94:	1e850513          	addi	a0,a0,488 # 1c0011e8 <__rt_fc_cluster_data>
1c008e98:	c606                	sw	ra,12(sp)
1c008e9a:	075010ef          	jal	ra,1c00a70e <memset>
1c008e9e:	1c0085b7          	lui	a1,0x1c008
1c008ea2:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008ea6:	4505                	li	a0,1
1c008ea8:	2bfd                	jal	1c0094a6 <rt_irq_set_handler>
1c008eaa:	f14027f3          	csrr	a5,mhartid
1c008eae:	8795                	srai	a5,a5,0x5
1c008eb0:	03f7f793          	andi	a5,a5,63
1c008eb4:	477d                	li	a4,31
1c008eb6:	02e79e63          	bne	a5,a4,1c008ef2 <__rt_cluster_init+0x6a>
1c008eba:	1a10a7b7          	lui	a5,0x1a10a
1c008ebe:	4709                	li	a4,2
1c008ec0:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c008ec4:	1c0085b7          	lui	a1,0x1c008
1c008ec8:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008ecc:	4511                	li	a0,4
1c008ece:	2be1                	jal	1c0094a6 <rt_irq_set_handler>
1c008ed0:	f14027f3          	csrr	a5,mhartid
1c008ed4:	8795                	srai	a5,a5,0x5
1c008ed6:	03f7f793          	andi	a5,a5,63
1c008eda:	477d                	li	a4,31
1c008edc:	02e79063          	bne	a5,a4,1c008efc <__rt_cluster_init+0x74>
1c008ee0:	1a10a7b7          	lui	a5,0x1a10a
1c008ee4:	4741                	li	a4,16
1c008ee6:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c008eea:	40b2                	lw	ra,12(sp)
1c008eec:	4501                	li	a0,0
1c008eee:	0141                	addi	sp,sp,16
1c008ef0:	8082                	ret
1c008ef2:	002047b7          	lui	a5,0x204
1c008ef6:	4709                	li	a4,2
1c008ef8:	cbd8                	sw	a4,20(a5)
1c008efa:	b7e9                	j	1c008ec4 <__rt_cluster_init+0x3c>
1c008efc:	002047b7          	lui	a5,0x204
1c008f00:	4741                	li	a4,16
1c008f02:	cbd8                	sw	a4,20(a5)
1c008f04:	b7dd                	j	1c008eea <__rt_cluster_init+0x62>

1c008f06 <pi_cluster_conf_init>:
1c008f06:	00052223          	sw	zero,4(a0)
1c008f0a:	8082                	ret

1c008f0c <pi_cluster_open>:
1c008f0c:	1101                	addi	sp,sp,-32
1c008f0e:	ce06                	sw	ra,28(sp)
1c008f10:	cc22                	sw	s0,24(sp)
1c008f12:	ca26                	sw	s1,20(sp)
1c008f14:	c84a                	sw	s2,16(sp)
1c008f16:	c64e                	sw	s3,12(sp)
1c008f18:	30047973          	csrrci	s2,mstatus,8
1c008f1c:	00452983          	lw	s3,4(a0)
1c008f20:	02800793          	li	a5,40
1c008f24:	0049a483          	lw	s1,4(s3)
1c008f28:	02f484b3          	mul	s1,s1,a5
1c008f2c:	1c0017b7          	lui	a5,0x1c001
1c008f30:	1e878793          	addi	a5,a5,488 # 1c0011e8 <__rt_fc_cluster_data>
1c008f34:	94be                	add	s1,s1,a5
1c008f36:	c504                	sw	s1,8(a0)
1c008f38:	3b7000ef          	jal	ra,1c009aee <__rt_wait_event_prepare_blocking>
1c008f3c:	f14027f3          	csrr	a5,mhartid
1c008f40:	8795                	srai	a5,a5,0x5
1c008f42:	03f7f793          	andi	a5,a5,63
1c008f46:	477d                	li	a4,31
1c008f48:	842a                	mv	s0,a0
1c008f4a:	04e79463          	bne	a5,a4,1c008f92 <pi_cluster_open+0x86>
1c008f4e:	511c                	lw	a5,32(a0)
1c008f50:	0004ae23          	sw	zero,28(s1)
1c008f54:	d0c8                	sw	a0,36(s1)
1c008f56:	d91c                	sw	a5,48(a0)
1c008f58:	411c                	lw	a5,0(a0)
1c008f5a:	02052223          	sw	zero,36(a0)
1c008f5e:	d51c                	sw	a5,40(a0)
1c008f60:	415c                	lw	a5,4(a0)
1c008f62:	c144                	sw	s1,4(a0)
1c008f64:	d55c                	sw	a5,44(a0)
1c008f66:	1c0097b7          	lui	a5,0x1c009
1c008f6a:	d6a78793          	addi	a5,a5,-662 # 1c008d6a <__rt_cluster_mount_step>
1c008f6e:	c11c                	sw	a5,0(a0)
1c008f70:	4785                	li	a5,1
1c008f72:	d11c                	sw	a5,32(a0)
1c008f74:	8526                	mv	a0,s1
1c008f76:	3bd5                	jal	1c008d6a <__rt_cluster_mount_step>
1c008f78:	8522                	mv	a0,s0
1c008f7a:	4c5000ef          	jal	ra,1c009c3e <__rt_wait_event>
1c008f7e:	30091073          	csrw	mstatus,s2
1c008f82:	40f2                	lw	ra,28(sp)
1c008f84:	4462                	lw	s0,24(sp)
1c008f86:	44d2                	lw	s1,20(sp)
1c008f88:	4942                	lw	s2,16(sp)
1c008f8a:	49b2                	lw	s3,12(sp)
1c008f8c:	4501                	li	a0,0
1c008f8e:	6105                	addi	sp,sp,32
1c008f90:	8082                	ret
1c008f92:	0049a483          	lw	s1,4(s3)
1c008f96:	8526                	mv	a0,s1
1c008f98:	339d                	jal	1c008cfe <__rt_init_cluster_data>
1c008f9a:	04048513          	addi	a0,s1,64
1c008f9e:	002017b7          	lui	a5,0x201
1c008fa2:	055a                	slli	a0,a0,0x16
1c008fa4:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f3414>
1c008fa8:	97aa                	add	a5,a5,a0
1c008faa:	577d                	li	a4,-1
1c008fac:	c398                	sw	a4,0(a5)
1c008fae:	1c0086b7          	lui	a3,0x1c008
1c008fb2:	002007b7          	lui	a5,0x200
1c008fb6:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f2058>
1c008fba:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c008fbe:	06078793          	addi	a5,a5,96
1c008fc2:	972a                	add	a4,a4,a0
1c008fc4:	97aa                	add	a5,a5,a0
1c008fc6:	f006f693          	andi	a3,a3,-256
1c008fca:	c314                	sw	a3,0(a4)
1c008fcc:	0711                	addi	a4,a4,4
1c008fce:	fef71ee3          	bne	a4,a5,1c008fca <pi_cluster_open+0xbe>
1c008fd2:	002007b7          	lui	a5,0x200
1c008fd6:	07a1                	addi	a5,a5,8
1c008fd8:	953e                	add	a0,a0,a5
1c008fda:	57fd                	li	a5,-1
1c008fdc:	c11c                	sw	a5,0(a0)
1c008fde:	8522                	mv	a0,s0
1c008fe0:	3db000ef          	jal	ra,1c009bba <rt_event_push>
1c008fe4:	bf51                	j	1c008f78 <pi_cluster_open+0x6c>

1c008fe6 <pi_cluster_close>:
1c008fe6:	451c                	lw	a5,8(a0)
1c008fe8:	1101                	addi	sp,sp,-32
1c008fea:	cc22                	sw	s0,24(sp)
1c008fec:	5380                	lw	s0,32(a5)
1c008fee:	1c0017b7          	lui	a5,0x1c001
1c008ff2:	0bc7a703          	lw	a4,188(a5) # 1c0010bc <__rt_platform>
1c008ff6:	ce06                	sw	ra,28(sp)
1c008ff8:	4785                	li	a5,1
1c008ffa:	00f70563          	beq	a4,a5,1c009004 <pi_cluster_close+0x1e>
1c008ffe:	4505                	li	a0,1
1c009000:	5d5000ef          	jal	ra,1c009dd4 <__rt_fll_deinit>
1c009004:	c602                	sw	zero,12(sp)
1c009006:	e409                	bnez	s0,1c009010 <pi_cluster_close+0x2a>
1c009008:	006c                	addi	a1,sp,12
1c00900a:	4501                	li	a0,0
1c00900c:	749000ef          	jal	ra,1c009f54 <__rt_pmu_cluster_power_down>
1c009010:	40f2                	lw	ra,28(sp)
1c009012:	4462                	lw	s0,24(sp)
1c009014:	4501                	li	a0,0
1c009016:	6105                	addi	sp,sp,32
1c009018:	8082                	ret

1c00901a <__rt_cluster_push_fc_event>:
1c00901a:	002047b7          	lui	a5,0x204
1c00901e:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f60d4>
1c009022:	0007e703          	p.elw	a4,0(a5)
1c009026:	f14027f3          	csrr	a5,mhartid
1c00902a:	8795                	srai	a5,a5,0x5
1c00902c:	02800693          	li	a3,40
1c009030:	03f7f793          	andi	a5,a5,63
1c009034:	02d787b3          	mul	a5,a5,a3
1c009038:	1c001737          	lui	a4,0x1c001
1c00903c:	1e870713          	addi	a4,a4,488 # 1c0011e8 <__rt_fc_cluster_data>
1c009040:	4689                	li	a3,2
1c009042:	97ba                	add	a5,a5,a4
1c009044:	00204737          	lui	a4,0x204
1c009048:	43d0                	lw	a2,4(a5)
1c00904a:	ee01                	bnez	a2,1c009062 <__rt_cluster_push_fc_event+0x48>
1c00904c:	c3c8                	sw	a0,4(a5)
1c00904e:	4709                	li	a4,2
1c009050:	1a10a7b7          	lui	a5,0x1a10a
1c009054:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1077fc>
1c009058:	002047b7          	lui	a5,0x204
1c00905c:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f60d4>
1c009060:	8082                	ret
1c009062:	c714                	sw	a3,8(a4)
1c009064:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c009068:	c354                	sw	a3,4(a4)
1c00906a:	bff9                	j	1c009048 <__rt_cluster_push_fc_event+0x2e>

1c00906c <__rt_cluster_new>:
1c00906c:	1c0095b7          	lui	a1,0x1c009
1c009070:	1141                	addi	sp,sp,-16
1c009072:	4601                	li	a2,0
1c009074:	e8858593          	addi	a1,a1,-376 # 1c008e88 <__rt_cluster_init>
1c009078:	4501                	li	a0,0
1c00907a:	c606                	sw	ra,12(sp)
1c00907c:	2b6d                	jal	1c009636 <__rt_cbsys_add>
1c00907e:	c105                	beqz	a0,1c00909e <__rt_cluster_new+0x32>
1c009080:	f1402673          	csrr	a2,mhartid
1c009084:	1c000537          	lui	a0,0x1c000
1c009088:	40565593          	srai	a1,a2,0x5
1c00908c:	03f5f593          	andi	a1,a1,63
1c009090:	8a7d                	andi	a2,a2,31
1c009092:	52c50513          	addi	a0,a0,1324 # 1c00052c <__DTOR_END__+0x240>
1c009096:	0c5010ef          	jal	ra,1c00a95a <printf>
1c00909a:	04d010ef          	jal	ra,1c00a8e6 <abort>
1c00909e:	40b2                	lw	ra,12(sp)
1c0090a0:	0141                	addi	sp,sp,16
1c0090a2:	8082                	ret

1c0090a4 <__rt_cluster_pulpos_emu_init>:
1c0090a4:	1141                	addi	sp,sp,-16
1c0090a6:	45b1                	li	a1,12
1c0090a8:	4501                	li	a0,0
1c0090aa:	c606                	sw	ra,12(sp)
1c0090ac:	3621                	jal	1c008bb4 <rt_alloc>
1c0090ae:	1c0017b7          	lui	a5,0x1c001
1c0090b2:	1aa7a423          	sw	a0,424(a5) # 1c0011a8 <__rt_fc_cluster_device>
1c0090b6:	e105                	bnez	a0,1c0090d6 <__rt_cluster_pulpos_emu_init+0x32>
1c0090b8:	f1402673          	csrr	a2,mhartid
1c0090bc:	1c000537          	lui	a0,0x1c000
1c0090c0:	40565593          	srai	a1,a2,0x5
1c0090c4:	03f5f593          	andi	a1,a1,63
1c0090c8:	8a7d                	andi	a2,a2,31
1c0090ca:	57450513          	addi	a0,a0,1396 # 1c000574 <__DTOR_END__+0x288>
1c0090ce:	08d010ef          	jal	ra,1c00a95a <printf>
1c0090d2:	015010ef          	jal	ra,1c00a8e6 <abort>
1c0090d6:	40b2                	lw	ra,12(sp)
1c0090d8:	0141                	addi	sp,sp,16
1c0090da:	8082                	ret

1c0090dc <rt_cluster_call>:
1c0090dc:	7139                	addi	sp,sp,-64
1c0090de:	d84a                	sw	s2,48(sp)
1c0090e0:	4906                	lw	s2,64(sp)
1c0090e2:	dc22                	sw	s0,56(sp)
1c0090e4:	842e                	mv	s0,a1
1c0090e6:	de06                	sw	ra,60(sp)
1c0090e8:	da26                	sw	s1,52(sp)
1c0090ea:	d64e                	sw	s3,44(sp)
1c0090ec:	300479f3          	csrrci	s3,mstatus,8
1c0090f0:	84ca                	mv	s1,s2
1c0090f2:	02091163          	bnez	s2,1c009114 <rt_cluster_call+0x38>
1c0090f6:	ce32                	sw	a2,28(sp)
1c0090f8:	cc36                	sw	a3,24(sp)
1c0090fa:	ca3a                	sw	a4,20(sp)
1c0090fc:	c83e                	sw	a5,16(sp)
1c0090fe:	c642                	sw	a6,12(sp)
1c009100:	c446                	sw	a7,8(sp)
1c009102:	1ed000ef          	jal	ra,1c009aee <__rt_wait_event_prepare_blocking>
1c009106:	48a2                	lw	a7,8(sp)
1c009108:	4832                	lw	a6,12(sp)
1c00910a:	47c2                	lw	a5,16(sp)
1c00910c:	4752                	lw	a4,20(sp)
1c00910e:	46e2                	lw	a3,24(sp)
1c009110:	4672                	lw	a2,28(sp)
1c009112:	84aa                	mv	s1,a0
1c009114:	4531                	li	a0,12
1c009116:	02a40433          	mul	s0,s0,a0
1c00911a:	1c0015b7          	lui	a1,0x1c001
1c00911e:	0e058313          	addi	t1,a1,224 # 1c0010e0 <__rt_pulpos_emu_global_cluster_task>
1c009122:	00f32623          	sw	a5,12(t1)
1c009126:	1c0017b7          	lui	a5,0x1c001
1c00912a:	1a87a503          	lw	a0,424(a5) # 1c0011a8 <__rt_fc_cluster_device>
1c00912e:	00c32023          	sw	a2,0(t1)
1c009132:	0e058593          	addi	a1,a1,224
1c009136:	8626                	mv	a2,s1
1c009138:	00d32223          	sw	a3,4(t1)
1c00913c:	9522                	add	a0,a0,s0
1c00913e:	00e32423          	sw	a4,8(t1)
1c009142:	01032823          	sw	a6,16(t1)
1c009146:	01132a23          	sw	a7,20(t1)
1c00914a:	2041                	jal	1c0091ca <pi_cluster_send_task_to_cl_async>
1c00914c:	842a                	mv	s0,a0
1c00914e:	cd01                	beqz	a0,1c009166 <rt_cluster_call+0x8a>
1c009150:	30099073          	csrw	mstatus,s3
1c009154:	547d                	li	s0,-1
1c009156:	8522                	mv	a0,s0
1c009158:	50f2                	lw	ra,60(sp)
1c00915a:	5462                	lw	s0,56(sp)
1c00915c:	54d2                	lw	s1,52(sp)
1c00915e:	5942                	lw	s2,48(sp)
1c009160:	59b2                	lw	s3,44(sp)
1c009162:	6121                	addi	sp,sp,64
1c009164:	8082                	ret
1c009166:	00091563          	bnez	s2,1c009170 <rt_cluster_call+0x94>
1c00916a:	8526                	mv	a0,s1
1c00916c:	2d3000ef          	jal	ra,1c009c3e <__rt_wait_event>
1c009170:	30099073          	csrw	mstatus,s3
1c009174:	b7cd                	j	1c009156 <rt_cluster_call+0x7a>

1c009176 <rt_cluster_mount>:
1c009176:	7139                	addi	sp,sp,-64
1c009178:	dc22                	sw	s0,56(sp)
1c00917a:	da26                	sw	s1,52(sp)
1c00917c:	d84a                	sw	s2,48(sp)
1c00917e:	4431                	li	s0,12
1c009180:	1c0014b7          	lui	s1,0x1c001
1c009184:	de06                	sw	ra,60(sp)
1c009186:	d64e                	sw	s3,44(sp)
1c009188:	8936                	mv	s2,a3
1c00918a:	02858433          	mul	s0,a1,s0
1c00918e:	1a848493          	addi	s1,s1,424 # 1c0011a8 <__rt_fc_cluster_device>
1c009192:	c905                	beqz	a0,1c0091c2 <rt_cluster_mount+0x4c>
1c009194:	0068                	addi	a0,sp,12
1c009196:	89ae                	mv	s3,a1
1c009198:	33bd                	jal	1c008f06 <pi_cluster_conf_init>
1c00919a:	4088                	lw	a0,0(s1)
1c00919c:	006c                	addi	a1,sp,12
1c00919e:	9522                	add	a0,a0,s0
1c0091a0:	2609                	jal	1c0094a2 <pi_open_from_conf>
1c0091a2:	4088                	lw	a0,0(s1)
1c0091a4:	c84e                	sw	s3,16(sp)
1c0091a6:	9522                	add	a0,a0,s0
1c0091a8:	3395                	jal	1c008f0c <pi_cluster_open>
1c0091aa:	00090563          	beqz	s2,1c0091b4 <rt_cluster_mount+0x3e>
1c0091ae:	854a                	mv	a0,s2
1c0091b0:	20b000ef          	jal	ra,1c009bba <rt_event_push>
1c0091b4:	50f2                	lw	ra,60(sp)
1c0091b6:	5462                	lw	s0,56(sp)
1c0091b8:	54d2                	lw	s1,52(sp)
1c0091ba:	5942                	lw	s2,48(sp)
1c0091bc:	59b2                	lw	s3,44(sp)
1c0091be:	6121                	addi	sp,sp,64
1c0091c0:	8082                	ret
1c0091c2:	4088                	lw	a0,0(s1)
1c0091c4:	9522                	add	a0,a0,s0
1c0091c6:	3505                	jal	1c008fe6 <pi_cluster_close>
1c0091c8:	b7cd                	j	1c0091aa <rt_cluster_mount+0x34>

1c0091ca <pi_cluster_send_task_to_cl_async>:
1c0091ca:	1101                	addi	sp,sp,-32
1c0091cc:	ca26                	sw	s1,20(sp)
1c0091ce:	4504                	lw	s1,8(a0)
1c0091d0:	cc22                	sw	s0,24(sp)
1c0091d2:	c256                	sw	s5,4(sp)
1c0091d4:	842e                	mv	s0,a1
1c0091d6:	8ab2                	mv	s5,a2
1c0091d8:	ce06                	sw	ra,28(sp)
1c0091da:	c84a                	sw	s2,16(sp)
1c0091dc:	c64e                	sw	s3,12(sp)
1c0091de:	c452                	sw	s4,8(sp)
1c0091e0:	30047a73          	csrrci	s4,mstatus,8
1c0091e4:	00060823          	sb	zero,16(a2)
1c0091e8:	4785                	li	a5,1
1c0091ea:	d1dc                	sw	a5,36(a1)
1c0091ec:	49dc                	lw	a5,20(a1)
1c0091ee:	0144a983          	lw	s3,20(s1)
1c0091f2:	e399                	bnez	a5,1c0091f8 <pi_cluster_send_task_to_cl_async+0x2e>
1c0091f4:	47a1                	li	a5,8
1c0091f6:	c9dc                	sw	a5,20(a1)
1c0091f8:	441c                	lw	a5,8(s0)
1c0091fa:	eb8d                	bnez	a5,1c00922c <pi_cluster_send_task_to_cl_async+0x62>
1c0091fc:	445c                	lw	a5,12(s0)
1c0091fe:	e789                	bnez	a5,1c009208 <pi_cluster_send_task_to_cl_async+0x3e>
1c009200:	40000793          	li	a5,1024
1c009204:	c45c                	sw	a5,12(s0)
1c009206:	c81c                	sw	a5,16(s0)
1c009208:	4818                	lw	a4,16(s0)
1c00920a:	445c                	lw	a5,12(s0)
1c00920c:	e311                	bnez	a4,1c009210 <pi_cluster_send_task_to_cl_async+0x46>
1c00920e:	c81c                	sw	a5,16(s0)
1c009210:	01442903          	lw	s2,20(s0)
1c009214:	4818                	lw	a4,16(s0)
1c009216:	448c                	lw	a1,8(s1)
1c009218:	197d                	addi	s2,s2,-1
1c00921a:	02e90933          	mul	s2,s2,a4
1c00921e:	993e                	add	s2,s2,a5
1c009220:	c9bd                	beqz	a1,1c009296 <pi_cluster_send_task_to_cl_async+0xcc>
1c009222:	44d0                	lw	a2,12(s1)
1c009224:	07261063          	bne	a2,s2,1c009284 <pi_cluster_send_task_to_cl_async+0xba>
1c009228:	449c                	lw	a5,8(s1)
1c00922a:	c41c                	sw	a5,8(s0)
1c00922c:	4858                	lw	a4,20(s0)
1c00922e:	4785                	li	a5,1
1c009230:	01542c23          	sw	s5,24(s0)
1c009234:	00e797b3          	sll	a5,a5,a4
1c009238:	17fd                	addi	a5,a5,-1
1c00923a:	d41c                	sw	a5,40(s0)
1c00923c:	02042023          	sw	zero,32(s0)
1c009240:	0089a783          	lw	a5,8(s3)
1c009244:	cbbd                	beqz	a5,1c0092ba <pi_cluster_send_task_to_cl_async+0xf0>
1c009246:	d380                	sw	s0,32(a5)
1c009248:	0089a423          	sw	s0,8(s3)
1c00924c:	0009a783          	lw	a5,0(s3)
1c009250:	e399                	bnez	a5,1c009256 <pi_cluster_send_task_to_cl_async+0x8c>
1c009252:	0089a023          	sw	s0,0(s3)
1c009256:	509c                	lw	a5,32(s1)
1c009258:	00201737          	lui	a4,0x201
1c00925c:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c009260:	04078793          	addi	a5,a5,64
1c009264:	07da                	slli	a5,a5,0x16
1c009266:	97ba                	add	a5,a5,a4
1c009268:	0007a023          	sw	zero,0(a5)
1c00926c:	300a1073          	csrw	mstatus,s4
1c009270:	4501                	li	a0,0
1c009272:	40f2                	lw	ra,28(sp)
1c009274:	4462                	lw	s0,24(sp)
1c009276:	44d2                	lw	s1,20(sp)
1c009278:	4942                	lw	s2,16(sp)
1c00927a:	49b2                	lw	s3,12(sp)
1c00927c:	4a22                	lw	s4,8(sp)
1c00927e:	4a92                	lw	s5,4(sp)
1c009280:	6105                	addi	sp,sp,32
1c009282:	8082                	ret
1c009284:	509c                	lw	a5,32(s1)
1c009286:	1c001737          	lui	a4,0x1c001
1c00928a:	1d472503          	lw	a0,468(a4) # 1c0011d4 <__rt_alloc_l1>
1c00928e:	078a                	slli	a5,a5,0x2
1c009290:	953e                	add	a0,a0,a5
1c009292:	8d9ff0ef          	jal	ra,1c008b6a <rt_user_free>
1c009296:	509c                	lw	a5,32(s1)
1c009298:	1c001737          	lui	a4,0x1c001
1c00929c:	1d472503          	lw	a0,468(a4) # 1c0011d4 <__rt_alloc_l1>
1c0092a0:	078a                	slli	a5,a5,0x2
1c0092a2:	0124a623          	sw	s2,12(s1)
1c0092a6:	85ca                	mv	a1,s2
1c0092a8:	953e                	add	a0,a0,a5
1c0092aa:	891ff0ef          	jal	ra,1c008b3a <rt_user_alloc>
1c0092ae:	c488                	sw	a0,8(s1)
1c0092b0:	fd25                	bnez	a0,1c009228 <pi_cluster_send_task_to_cl_async+0x5e>
1c0092b2:	300a1073          	csrw	mstatus,s4
1c0092b6:	557d                	li	a0,-1
1c0092b8:	bf6d                	j	1c009272 <pi_cluster_send_task_to_cl_async+0xa8>
1c0092ba:	0089a223          	sw	s0,4(s3)
1c0092be:	b769                	j	1c009248 <pi_cluster_send_task_to_cl_async+0x7e>

1c0092c0 <rt_perf_init>:
1c0092c0:	00450793          	addi	a5,a0,4
1c0092c4:	04850513          	addi	a0,a0,72
1c0092c8:	0007a023          	sw	zero,0(a5)
1c0092cc:	0791                	addi	a5,a5,4
1c0092ce:	fea79de3          	bne	a5,a0,1c0092c8 <rt_perf_init+0x8>
1c0092d2:	8082                	ret

1c0092d4 <rt_perf_conf>:
1c0092d4:	c10c                	sw	a1,0(a0)
1c0092d6:	7a059073          	csrw	pcer,a1
1c0092da:	8082                	ret

1c0092dc <cluster_start>:
1c0092dc:	002047b7          	lui	a5,0x204
1c0092e0:	00070737          	lui	a4,0x70
1c0092e4:	c798                	sw	a4,8(a5)
1c0092e6:	0ff00713          	li	a4,255
1c0092ea:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f6098>
1c0092ee:	20e7a023          	sw	a4,512(a5)
1c0092f2:	20e7a623          	sw	a4,524(a5)
1c0092f6:	8082                	ret

1c0092f8 <__rt_init>:
1c0092f8:	1101                	addi	sp,sp,-32
1c0092fa:	ce06                	sw	ra,28(sp)
1c0092fc:	cc22                	sw	s0,24(sp)
1c0092fe:	23d5                	jal	1c0098e2 <__rt_bridge_set_available>
1c009300:	1c0017b7          	lui	a5,0x1c001
1c009304:	0bc7a703          	lw	a4,188(a5) # 1c0010bc <__rt_platform>
1c009308:	478d                	li	a5,3
1c00930a:	02f71263          	bne	a4,a5,1c00932e <__rt_init+0x36>
1c00930e:	7d005073          	csrwi	0x7d0,0
1c009312:	1c0007b7          	lui	a5,0x1c000
1c009316:	6e078793          	addi	a5,a5,1760 # 1c0006e0 <stack_start>
1c00931a:	7d179073          	csrw	0x7d1,a5
1c00931e:	1c0017b7          	lui	a5,0x1c001
1c009322:	ee078793          	addi	a5,a5,-288 # 1c000ee0 <stack>
1c009326:	7d279073          	csrw	0x7d2,a5
1c00932a:	7d00d073          	csrwi	0x7d0,1
1c00932e:	2c29                	jal	1c009548 <__rt_irq_init>
1c009330:	1a1067b7          	lui	a5,0x1a106
1c009334:	577d                	li	a4,-1
1c009336:	c3d8                	sw	a4,4(a5)
1c009338:	1c0085b7          	lui	a1,0x1c008
1c00933c:	c798                	sw	a4,8(a5)
1c00933e:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c009342:	4569                	li	a0,26
1c009344:	228d                	jal	1c0094a6 <rt_irq_set_handler>
1c009346:	f14027f3          	csrr	a5,mhartid
1c00934a:	8795                	srai	a5,a5,0x5
1c00934c:	03f7f793          	andi	a5,a5,63
1c009350:	477d                	li	a4,31
1c009352:	0ae79e63          	bne	a5,a4,1c00940e <__rt_init+0x116>
1c009356:	1a10a7b7          	lui	a5,0x1a10a
1c00935a:	04000737          	lui	a4,0x4000
1c00935e:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c009362:	46d000ef          	jal	ra,1c009fce <__rt_pmu_init>
1c009366:	373000ef          	jal	ra,1c009ed8 <__rt_freq_init>
1c00936a:	f14027f3          	csrr	a5,mhartid
1c00936e:	8795                	srai	a5,a5,0x5
1c009370:	03f7f793          	andi	a5,a5,63
1c009374:	477d                	li	a4,31
1c009376:	00e78763          	beq	a5,a4,1c009384 <__rt_init+0x8c>
1c00937a:	002017b7          	lui	a5,0x201
1c00937e:	577d                	li	a4,-1
1c009380:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f3414>
1c009384:	1c000437          	lui	s0,0x1c000
1c009388:	2605                	jal	1c0096a8 <__rt_utils_init>
1c00938a:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c00938e:	8ddff0ef          	jal	ra,1c008c6a <__rt_allocs_init>
1c009392:	25cd                	jal	1c009a74 <__rt_thread_sched_init>
1c009394:	0ed000ef          	jal	ra,1c009c80 <__rt_event_sched_init>
1c009398:	473000ef          	jal	ra,1c00a00a <__rt_padframe_init>
1c00939c:	401c                	lw	a5,0(s0)
1c00939e:	efb5                	bnez	a5,1c00941a <__rt_init+0x122>
1c0093a0:	30045073          	csrwi	mstatus,8
1c0093a4:	4501                	li	a0,0
1c0093a6:	2cc1                	jal	1c009676 <__rt_cbsys_exec>
1c0093a8:	e521                	bnez	a0,1c0093f0 <__rt_init+0xf8>
1c0093aa:	f14027f3          	csrr	a5,mhartid
1c0093ae:	8795                	srai	a5,a5,0x5
1c0093b0:	03f7f793          	andi	a5,a5,63
1c0093b4:	477d                	li	a4,31
1c0093b6:	0ae78763          	beq	a5,a4,1c009464 <__rt_init+0x16c>
1c0093ba:	4681                	li	a3,0
1c0093bc:	4601                	li	a2,0
1c0093be:	4581                	li	a1,0
1c0093c0:	4505                	li	a0,1
1c0093c2:	cfb9                	beqz	a5,1c009420 <__rt_init+0x128>
1c0093c4:	3b4d                	jal	1c009176 <rt_cluster_mount>
1c0093c6:	6591                	lui	a1,0x4
1c0093c8:	450d                	li	a0,3
1c0093ca:	feaff0ef          	jal	ra,1c008bb4 <rt_alloc>
1c0093ce:	872a                	mv	a4,a0
1c0093d0:	c105                	beqz	a0,1c0093f0 <__rt_init+0xf8>
1c0093d2:	6805                	lui	a6,0x1
1c0093d4:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0093d8:	1c009637          	lui	a2,0x1c009
1c0093dc:	c002                	sw	zero,0(sp)
1c0093de:	48a1                	li	a7,8
1c0093e0:	87c2                	mv	a5,a6
1c0093e2:	4681                	li	a3,0
1c0093e4:	2dc60613          	addi	a2,a2,732 # 1c0092dc <cluster_start>
1c0093e8:	4581                	li	a1,0
1c0093ea:	4501                	li	a0,0
1c0093ec:	39c5                	jal	1c0090dc <rt_cluster_call>
1c0093ee:	c93d                	beqz	a0,1c009464 <__rt_init+0x16c>
1c0093f0:	f1402673          	csrr	a2,mhartid
1c0093f4:	1c000537          	lui	a0,0x1c000
1c0093f8:	40565593          	srai	a1,a2,0x5
1c0093fc:	03f5f593          	andi	a1,a1,63
1c009400:	8a7d                	andi	a2,a2,31
1c009402:	5c850513          	addi	a0,a0,1480 # 1c0005c8 <__DTOR_END__+0x2dc>
1c009406:	554010ef          	jal	ra,1c00a95a <printf>
1c00940a:	4dc010ef          	jal	ra,1c00a8e6 <abort>
1c00940e:	002047b7          	lui	a5,0x204
1c009412:	04000737          	lui	a4,0x4000
1c009416:	cbd8                	sw	a4,20(a5)
1c009418:	b7a9                	j	1c009362 <__rt_init+0x6a>
1c00941a:	9782                	jalr	a5
1c00941c:	0411                	addi	s0,s0,4
1c00941e:	bfbd                	j	1c00939c <__rt_init+0xa4>
1c009420:	3b99                	jal	1c009176 <rt_cluster_mount>
1c009422:	6591                	lui	a1,0x4
1c009424:	80058593          	addi	a1,a1,-2048 # 3800 <_l1_preload_size+0x17f0>
1c009428:	450d                	li	a0,3
1c00942a:	f8aff0ef          	jal	ra,1c008bb4 <rt_alloc>
1c00942e:	d169                	beqz	a0,1c0093f0 <__rt_init+0xf8>
1c009430:	00204737          	lui	a4,0x204
1c009434:	0ff00793          	li	a5,255
1c009438:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f6098>
1c00943c:	1c0107b7          	lui	a5,0x1c010
1c009440:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c009444:	0017e793          	ori	a5,a5,1
1c009448:	08f72023          	sw	a5,128(a4)
1c00944c:	6785                	lui	a5,0x1
1c00944e:	4462                	lw	s0,24(sp)
1c009450:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009454:	08f72023          	sw	a5,128(a4)
1c009458:	40f2                	lw	ra,28(sp)
1c00945a:	08a72023          	sw	a0,128(a4)
1c00945e:	4501                	li	a0,0
1c009460:	6105                	addi	sp,sp,32
1c009462:	bdad                	j	1c0092dc <cluster_start>
1c009464:	40f2                	lw	ra,28(sp)
1c009466:	4462                	lw	s0,24(sp)
1c009468:	6105                	addi	sp,sp,32
1c00946a:	8082                	ret

1c00946c <__rt_deinit>:
1c00946c:	1c0017b7          	lui	a5,0x1c001
1c009470:	0bc7a703          	lw	a4,188(a5) # 1c0010bc <__rt_platform>
1c009474:	1141                	addi	sp,sp,-16
1c009476:	c606                	sw	ra,12(sp)
1c009478:	c422                	sw	s0,8(sp)
1c00947a:	478d                	li	a5,3
1c00947c:	00f71463          	bne	a4,a5,1c009484 <__rt_deinit+0x18>
1c009480:	7d005073          	csrwi	0x7d0,0
1c009484:	4505                	li	a0,1
1c009486:	1c000437          	lui	s0,0x1c000
1c00948a:	22f5                	jal	1c009676 <__rt_cbsys_exec>
1c00948c:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c009490:	401c                	lw	a5,0(s0)
1c009492:	e789                	bnez	a5,1c00949c <__rt_deinit+0x30>
1c009494:	40b2                	lw	ra,12(sp)
1c009496:	4422                	lw	s0,8(sp)
1c009498:	0141                	addi	sp,sp,16
1c00949a:	8082                	ret
1c00949c:	9782                	jalr	a5
1c00949e:	0411                	addi	s0,s0,4
1c0094a0:	bfc5                	j	1c009490 <__rt_deinit+0x24>

1c0094a2 <pi_open_from_conf>:
1c0094a2:	c14c                	sw	a1,4(a0)
1c0094a4:	8082                	ret

1c0094a6 <rt_irq_set_handler>:
1c0094a6:	f14027f3          	csrr	a5,mhartid
1c0094aa:	8795                	srai	a5,a5,0x5
1c0094ac:	03f7f793          	andi	a5,a5,63
1c0094b0:	477d                	li	a4,31
1c0094b2:	04e79063          	bne	a5,a4,1c0094f2 <rt_irq_set_handler+0x4c>
1c0094b6:	1a1047b7          	lui	a5,0x1a104
1c0094ba:	43dc                	lw	a5,4(a5)
1c0094bc:	050a                	slli	a0,a0,0x2
1c0094be:	8d89                	sub	a1,a1,a0
1c0094c0:	8d9d                	sub	a1,a1,a5
1c0094c2:	000ff737          	lui	a4,0xff
1c0094c6:	00f506b3          	add	a3,a0,a5
1c0094ca:	8f6d                	and	a4,a4,a1
1c0094cc:	0145d793          	srli	a5,a1,0x14
1c0094d0:	06f76713          	ori	a4,a4,111
1c0094d4:	07fe                	slli	a5,a5,0x1f
1c0094d6:	8fd9                	or	a5,a5,a4
1c0094d8:	7fe00637          	lui	a2,0x7fe00
1c0094dc:	01459713          	slli	a4,a1,0x14
1c0094e0:	8f71                	and	a4,a4,a2
1c0094e2:	8fd9                	or	a5,a5,a4
1c0094e4:	05a6                	slli	a1,a1,0x9
1c0094e6:	00100737          	lui	a4,0x100
1c0094ea:	8df9                	and	a1,a1,a4
1c0094ec:	8ddd                	or	a1,a1,a5
1c0094ee:	c28c                	sw	a1,0(a3)
1c0094f0:	8082                	ret
1c0094f2:	002007b7          	lui	a5,0x200
1c0094f6:	43bc                	lw	a5,64(a5)
1c0094f8:	b7d1                	j	1c0094bc <rt_irq_set_handler+0x16>

1c0094fa <illegal_insn_handler_c>:
1c0094fa:	8082                	ret

1c0094fc <__rt_handle_illegal_instr>:
1c0094fc:	1c0017b7          	lui	a5,0x1c001
1c009500:	ee47a703          	lw	a4,-284(a5) # 1c000ee4 <__rt_debug_config>
1c009504:	1141                	addi	sp,sp,-16
1c009506:	c422                	sw	s0,8(sp)
1c009508:	c606                	sw	ra,12(sp)
1c00950a:	8b05                	andi	a4,a4,1
1c00950c:	843e                	mv	s0,a5
1c00950e:	c30d                	beqz	a4,1c009530 <__rt_handle_illegal_instr+0x34>
1c009510:	341026f3          	csrr	a3,mepc
1c009514:	f1402673          	csrr	a2,mhartid
1c009518:	1c000537          	lui	a0,0x1c000
1c00951c:	4298                	lw	a4,0(a3)
1c00951e:	40565593          	srai	a1,a2,0x5
1c009522:	03f5f593          	andi	a1,a1,63
1c009526:	8a7d                	andi	a2,a2,31
1c009528:	62050513          	addi	a0,a0,1568 # 1c000620 <__DTOR_END__+0x334>
1c00952c:	42e010ef          	jal	ra,1c00a95a <printf>
1c009530:	ee442783          	lw	a5,-284(s0)
1c009534:	8385                	srli	a5,a5,0x1
1c009536:	8b85                	andi	a5,a5,1
1c009538:	c399                	beqz	a5,1c00953e <__rt_handle_illegal_instr+0x42>
1c00953a:	3ac010ef          	jal	ra,1c00a8e6 <abort>
1c00953e:	4422                	lw	s0,8(sp)
1c009540:	40b2                	lw	ra,12(sp)
1c009542:	0141                	addi	sp,sp,16
1c009544:	fb7ff06f          	j	1c0094fa <illegal_insn_handler_c>

1c009548 <__rt_irq_init>:
1c009548:	f14027f3          	csrr	a5,mhartid
1c00954c:	8795                	srai	a5,a5,0x5
1c00954e:	03f7f793          	andi	a5,a5,63
1c009552:	477d                	li	a4,31
1c009554:	02e79763          	bne	a5,a4,1c009582 <__rt_irq_init+0x3a>
1c009558:	1a10a7b7          	lui	a5,0x1a10a
1c00955c:	577d                	li	a4,-1
1c00955e:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1077f4>
1c009562:	f14027f3          	csrr	a5,mhartid
1c009566:	8795                	srai	a5,a5,0x5
1c009568:	1c008737          	lui	a4,0x1c008
1c00956c:	03f7f793          	andi	a5,a5,63
1c009570:	46fd                	li	a3,31
1c009572:	00070713          	mv	a4,a4
1c009576:	00d79b63          	bne	a5,a3,1c00958c <__rt_irq_init+0x44>
1c00957a:	1a1047b7          	lui	a5,0x1a104
1c00957e:	c3d8                	sw	a4,4(a5)
1c009580:	8082                	ret
1c009582:	002047b7          	lui	a5,0x204
1c009586:	577d                	li	a4,-1
1c009588:	cb98                	sw	a4,16(a5)
1c00958a:	bfe1                	j	1c009562 <__rt_irq_init+0x1a>
1c00958c:	002007b7          	lui	a5,0x200
1c009590:	c3b8                	sw	a4,64(a5)
1c009592:	8082                	ret

1c009594 <__rt_fc_cluster_lock_req>:
1c009594:	1141                	addi	sp,sp,-16
1c009596:	c606                	sw	ra,12(sp)
1c009598:	c422                	sw	s0,8(sp)
1c00959a:	c226                	sw	s1,4(sp)
1c00959c:	300474f3          	csrrci	s1,mstatus,8
1c0095a0:	09654703          	lbu	a4,150(a0)
1c0095a4:	411c                	lw	a5,0(a0)
1c0095a6:	c729                	beqz	a4,1c0095f0 <__rt_fc_cluster_lock_req+0x5c>
1c0095a8:	4398                	lw	a4,0(a5)
1c0095aa:	c30d                	beqz	a4,1c0095cc <__rt_fc_cluster_lock_req+0x38>
1c0095ac:	43d8                	lw	a4,4(a5)
1c0095ae:	cf09                	beqz	a4,1c0095c8 <__rt_fc_cluster_lock_req+0x34>
1c0095b0:	4798                	lw	a4,8(a5)
1c0095b2:	c348                	sw	a0,4(a4)
1c0095b4:	c788                	sw	a0,8(a5)
1c0095b6:	00052223          	sw	zero,4(a0)
1c0095ba:	30049073          	csrw	mstatus,s1
1c0095be:	40b2                	lw	ra,12(sp)
1c0095c0:	4422                	lw	s0,8(sp)
1c0095c2:	4492                	lw	s1,4(sp)
1c0095c4:	0141                	addi	sp,sp,16
1c0095c6:	8082                	ret
1c0095c8:	c3c8                	sw	a0,4(a5)
1c0095ca:	b7ed                	j	1c0095b4 <__rt_fc_cluster_lock_req+0x20>
1c0095cc:	4705                	li	a4,1
1c0095ce:	08e50a23          	sb	a4,148(a0)
1c0095d2:	4705                	li	a4,1
1c0095d4:	c398                	sw	a4,0(a5)
1c0095d6:	09554783          	lbu	a5,149(a0)
1c0095da:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f2054>
1c0095de:	00201737          	lui	a4,0x201
1c0095e2:	07da                	slli	a5,a5,0x16
1c0095e4:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c0095e8:	97ba                	add	a5,a5,a4
1c0095ea:	0007a023          	sw	zero,0(a5)
1c0095ee:	b7f1                	j	1c0095ba <__rt_fc_cluster_lock_req+0x26>
1c0095f0:	842a                	mv	s0,a0
1c0095f2:	47c8                	lw	a0,12(a5)
1c0095f4:	cd01                	beqz	a0,1c00960c <__rt_fc_cluster_lock_req+0x78>
1c0095f6:	0007a023          	sw	zero,0(a5)
1c0095fa:	0007a623          	sw	zero,12(a5)
1c0095fe:	2185                	jal	1c009a5e <__rt_thread_wakeup>
1c009600:	4785                	li	a5,1
1c009602:	08f40a23          	sb	a5,148(s0)
1c009606:	09544783          	lbu	a5,149(s0)
1c00960a:	bfc1                	j	1c0095da <__rt_fc_cluster_lock_req+0x46>
1c00960c:	43d8                	lw	a4,4(a5)
1c00960e:	e701                	bnez	a4,1c009616 <__rt_fc_cluster_lock_req+0x82>
1c009610:	0007a023          	sw	zero,0(a5)
1c009614:	b7f5                	j	1c009600 <__rt_fc_cluster_lock_req+0x6c>
1c009616:	4354                	lw	a3,4(a4)
1c009618:	c3d4                	sw	a3,4(a5)
1c00961a:	4785                	li	a5,1
1c00961c:	08f70a23          	sb	a5,148(a4)
1c009620:	09574783          	lbu	a5,149(a4)
1c009624:	00201737          	lui	a4,0x201
1c009628:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00962c:	04078793          	addi	a5,a5,64
1c009630:	07da                	slli	a5,a5,0x16
1c009632:	97ba                	add	a5,a5,a4
1c009634:	bff1                	j	1c009610 <__rt_fc_cluster_lock_req+0x7c>

1c009636 <__rt_cbsys_add>:
1c009636:	1101                	addi	sp,sp,-32
1c009638:	cc22                	sw	s0,24(sp)
1c00963a:	ca26                	sw	s1,20(sp)
1c00963c:	842a                	mv	s0,a0
1c00963e:	84ae                	mv	s1,a1
1c009640:	4501                	li	a0,0
1c009642:	45b1                	li	a1,12
1c009644:	c632                	sw	a2,12(sp)
1c009646:	ce06                	sw	ra,28(sp)
1c009648:	d6cff0ef          	jal	ra,1c008bb4 <rt_alloc>
1c00964c:	4632                	lw	a2,12(sp)
1c00964e:	c115                	beqz	a0,1c009672 <__rt_cbsys_add+0x3c>
1c009650:	1c0017b7          	lui	a5,0x1c001
1c009654:	040a                	slli	s0,s0,0x2
1c009656:	ee878793          	addi	a5,a5,-280 # 1c000ee8 <cbsys_first>
1c00965a:	97a2                	add	a5,a5,s0
1c00965c:	4398                	lw	a4,0(a5)
1c00965e:	c104                	sw	s1,0(a0)
1c009660:	c150                	sw	a2,4(a0)
1c009662:	c518                	sw	a4,8(a0)
1c009664:	c388                	sw	a0,0(a5)
1c009666:	4501                	li	a0,0
1c009668:	40f2                	lw	ra,28(sp)
1c00966a:	4462                	lw	s0,24(sp)
1c00966c:	44d2                	lw	s1,20(sp)
1c00966e:	6105                	addi	sp,sp,32
1c009670:	8082                	ret
1c009672:	557d                	li	a0,-1
1c009674:	bfd5                	j	1c009668 <__rt_cbsys_add+0x32>

1c009676 <__rt_cbsys_exec>:
1c009676:	00251793          	slli	a5,a0,0x2
1c00967a:	1c001537          	lui	a0,0x1c001
1c00967e:	ee850513          	addi	a0,a0,-280 # 1c000ee8 <cbsys_first>
1c009682:	1141                	addi	sp,sp,-16
1c009684:	953e                	add	a0,a0,a5
1c009686:	c422                	sw	s0,8(sp)
1c009688:	4100                	lw	s0,0(a0)
1c00968a:	c606                	sw	ra,12(sp)
1c00968c:	e411                	bnez	s0,1c009698 <__rt_cbsys_exec+0x22>
1c00968e:	4501                	li	a0,0
1c009690:	40b2                	lw	ra,12(sp)
1c009692:	4422                	lw	s0,8(sp)
1c009694:	0141                	addi	sp,sp,16
1c009696:	8082                	ret
1c009698:	401c                	lw	a5,0(s0)
1c00969a:	4048                	lw	a0,4(s0)
1c00969c:	9782                	jalr	a5
1c00969e:	e119                	bnez	a0,1c0096a4 <__rt_cbsys_exec+0x2e>
1c0096a0:	4400                	lw	s0,8(s0)
1c0096a2:	b7ed                	j	1c00968c <__rt_cbsys_exec+0x16>
1c0096a4:	557d                	li	a0,-1
1c0096a6:	b7ed                	j	1c009690 <__rt_cbsys_exec+0x1a>

1c0096a8 <__rt_utils_init>:
1c0096a8:	1c0017b7          	lui	a5,0x1c001
1c0096ac:	ee878793          	addi	a5,a5,-280 # 1c000ee8 <cbsys_first>
1c0096b0:	0007a023          	sw	zero,0(a5)
1c0096b4:	0007a223          	sw	zero,4(a5)
1c0096b8:	0007a423          	sw	zero,8(a5)
1c0096bc:	0007a623          	sw	zero,12(a5)
1c0096c0:	0007a823          	sw	zero,16(a5)
1c0096c4:	0007aa23          	sw	zero,20(a5)
1c0096c8:	8082                	ret

1c0096ca <__rt_fc_lock>:
1c0096ca:	1141                	addi	sp,sp,-16
1c0096cc:	c422                	sw	s0,8(sp)
1c0096ce:	842a                	mv	s0,a0
1c0096d0:	c606                	sw	ra,12(sp)
1c0096d2:	c226                	sw	s1,4(sp)
1c0096d4:	c04a                	sw	s2,0(sp)
1c0096d6:	300474f3          	csrrci	s1,mstatus,8
1c0096da:	401c                	lw	a5,0(s0)
1c0096dc:	eb99                	bnez	a5,1c0096f2 <__rt_fc_lock+0x28>
1c0096de:	4785                	li	a5,1
1c0096e0:	c01c                	sw	a5,0(s0)
1c0096e2:	30049073          	csrw	mstatus,s1
1c0096e6:	40b2                	lw	ra,12(sp)
1c0096e8:	4422                	lw	s0,8(sp)
1c0096ea:	4492                	lw	s1,4(sp)
1c0096ec:	4902                	lw	s2,0(sp)
1c0096ee:	0141                	addi	sp,sp,16
1c0096f0:	8082                	ret
1c0096f2:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c0096f6:	4585                	li	a1,1
1c0096f8:	e3ff7517          	auipc	a0,0xe3ff7
1c0096fc:	93050513          	addi	a0,a0,-1744 # 28 <__rt_sched>
1c009700:	c45c                	sw	a5,12(s0)
1c009702:	29f1                	jal	1c009bde <__rt_event_execute>
1c009704:	bfd9                	j	1c0096da <__rt_fc_lock+0x10>

1c009706 <__rt_fc_unlock>:
1c009706:	300476f3          	csrrci	a3,mstatus,8
1c00970a:	415c                	lw	a5,4(a0)
1c00970c:	e791                	bnez	a5,1c009718 <__rt_fc_unlock+0x12>
1c00970e:	00052023          	sw	zero,0(a0)
1c009712:	30069073          	csrw	mstatus,a3
1c009716:	8082                	ret
1c009718:	43d8                	lw	a4,4(a5)
1c00971a:	c158                	sw	a4,4(a0)
1c00971c:	4705                	li	a4,1
1c00971e:	08e78a23          	sb	a4,148(a5)
1c009722:	0957c783          	lbu	a5,149(a5)
1c009726:	00201737          	lui	a4,0x201
1c00972a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00972e:	04078793          	addi	a5,a5,64
1c009732:	07da                	slli	a5,a5,0x16
1c009734:	97ba                	add	a5,a5,a4
1c009736:	0007a023          	sw	zero,0(a5)
1c00973a:	bfe1                	j	1c009712 <__rt_fc_unlock+0xc>

1c00973c <__rt_fc_cluster_lock>:
1c00973c:	f14027f3          	csrr	a5,mhartid
1c009740:	8795                	srai	a5,a5,0x5
1c009742:	03f7f793          	andi	a5,a5,63
1c009746:	08f58aa3          	sb	a5,149(a1)
1c00974a:	4785                	li	a5,1
1c00974c:	08f58b23          	sb	a5,150(a1)
1c009750:	1c0097b7          	lui	a5,0x1c009
1c009754:	59478793          	addi	a5,a5,1428 # 1c009594 <__rt_fc_cluster_lock_req>
1c009758:	c188                	sw	a0,0(a1)
1c00975a:	08058a23          	sb	zero,148(a1)
1c00975e:	0205a423          	sw	zero,40(a1)
1c009762:	0205a623          	sw	zero,44(a1)
1c009766:	c59c                	sw	a5,8(a1)
1c009768:	c5cc                	sw	a1,12(a1)
1c00976a:	05a1                	addi	a1,a1,8
1c00976c:	0015e513          	ori	a0,a1,1
1c009770:	8abff06f          	j	1c00901a <__rt_cluster_push_fc_event>

1c009774 <__rt_fc_cluster_unlock>:
1c009774:	f14027f3          	csrr	a5,mhartid
1c009778:	8795                	srai	a5,a5,0x5
1c00977a:	03f7f793          	andi	a5,a5,63
1c00977e:	08f58aa3          	sb	a5,149(a1)
1c009782:	1c0097b7          	lui	a5,0x1c009
1c009786:	59478793          	addi	a5,a5,1428 # 1c009594 <__rt_fc_cluster_lock_req>
1c00978a:	c188                	sw	a0,0(a1)
1c00978c:	08058a23          	sb	zero,148(a1)
1c009790:	08058b23          	sb	zero,150(a1)
1c009794:	0205a423          	sw	zero,40(a1)
1c009798:	0205a623          	sw	zero,44(a1)
1c00979c:	c59c                	sw	a5,8(a1)
1c00979e:	c5cc                	sw	a1,12(a1)
1c0097a0:	05a1                	addi	a1,a1,8
1c0097a2:	0015e513          	ori	a0,a1,1
1c0097a6:	875ff06f          	j	1c00901a <__rt_cluster_push_fc_event>

1c0097aa <__rt_event_enqueue>:
1c0097aa:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c0097ae:	00052c23          	sw	zero,24(a0)
1c0097b2:	c799                	beqz	a5,1c0097c0 <__rt_event_enqueue+0x16>
1c0097b4:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c0097b8:	cf88                	sw	a0,24(a5)
1c0097ba:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c0097be:	8082                	ret
1c0097c0:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c0097c4:	bfdd                	j	1c0097ba <__rt_event_enqueue+0x10>

1c0097c6 <__rt_bridge_check_bridge_req.part.5>:
1c0097c6:	1c001737          	lui	a4,0x1c001
1c0097ca:	ffc70793          	addi	a5,a4,-4 # 1c000ffc <__hal_debug_struct>
1c0097ce:	0a47a783          	lw	a5,164(a5)
1c0097d2:	ffc70713          	addi	a4,a4,-4
1c0097d6:	c789                	beqz	a5,1c0097e0 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c0097d8:	4f94                	lw	a3,24(a5)
1c0097da:	e681                	bnez	a3,1c0097e2 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c0097dc:	0af72623          	sw	a5,172(a4)
1c0097e0:	8082                	ret
1c0097e2:	479c                	lw	a5,8(a5)
1c0097e4:	bfcd                	j	1c0097d6 <__rt_bridge_check_bridge_req.part.5+0x10>

1c0097e6 <__rt_bridge_wait>:
1c0097e6:	f14027f3          	csrr	a5,mhartid
1c0097ea:	8795                	srai	a5,a5,0x5
1c0097ec:	03f7f793          	andi	a5,a5,63
1c0097f0:	477d                	li	a4,31
1c0097f2:	02e79a63          	bne	a5,a4,1c009826 <__rt_bridge_wait+0x40>
1c0097f6:	1a10a7b7          	lui	a5,0x1a10a
1c0097fa:	6711                	lui	a4,0x4
1c0097fc:	300476f3          	csrrci	a3,mstatus,8
1c009800:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1077f8>
1c009804:	01161593          	slli	a1,a2,0x11
1c009808:	0005cb63          	bltz	a1,1c00981e <__rt_bridge_wait+0x38>
1c00980c:	80e7a223          	sw	a4,-2044(a5)
1c009810:	10500073          	wfi
1c009814:	80e7a423          	sw	a4,-2040(a5)
1c009818:	30069073          	csrw	mstatus,a3
1c00981c:	b7c5                	j	1c0097fc <__rt_bridge_wait+0x16>
1c00981e:	80e7aa23          	sw	a4,-2028(a5)
1c009822:	30069073          	csrw	mstatus,a3
1c009826:	8082                	ret

1c009828 <__rt_bridge_handle_notif>:
1c009828:	1141                	addi	sp,sp,-16
1c00982a:	c422                	sw	s0,8(sp)
1c00982c:	1c001437          	lui	s0,0x1c001
1c009830:	ffc40793          	addi	a5,s0,-4 # 1c000ffc <__hal_debug_struct>
1c009834:	0a47a783          	lw	a5,164(a5)
1c009838:	c606                	sw	ra,12(sp)
1c00983a:	c226                	sw	s1,4(sp)
1c00983c:	c04a                	sw	s2,0(sp)
1c00983e:	ffc40413          	addi	s0,s0,-4
1c009842:	c399                	beqz	a5,1c009848 <__rt_bridge_handle_notif+0x20>
1c009844:	4bd8                	lw	a4,20(a5)
1c009846:	e30d                	bnez	a4,1c009868 <__rt_bridge_handle_notif+0x40>
1c009848:	0b442783          	lw	a5,180(s0)
1c00984c:	c789                	beqz	a5,1c009856 <__rt_bridge_handle_notif+0x2e>
1c00984e:	43a8                	lw	a0,64(a5)
1c009850:	0a042a23          	sw	zero,180(s0)
1c009854:	3f99                	jal	1c0097aa <__rt_event_enqueue>
1c009856:	0ac42783          	lw	a5,172(s0)
1c00985a:	eb95                	bnez	a5,1c00988e <__rt_bridge_handle_notif+0x66>
1c00985c:	4422                	lw	s0,8(sp)
1c00985e:	40b2                	lw	ra,12(sp)
1c009860:	4492                	lw	s1,4(sp)
1c009862:	4902                	lw	s2,0(sp)
1c009864:	0141                	addi	sp,sp,16
1c009866:	b785                	j	1c0097c6 <__rt_bridge_check_bridge_req.part.5>
1c009868:	4784                	lw	s1,8(a5)
1c00986a:	4fd8                	lw	a4,28(a5)
1c00986c:	0a942223          	sw	s1,164(s0)
1c009870:	cb01                	beqz	a4,1c009880 <__rt_bridge_handle_notif+0x58>
1c009872:	0b042703          	lw	a4,176(s0)
1c009876:	c798                	sw	a4,8(a5)
1c009878:	0af42823          	sw	a5,176(s0)
1c00987c:	87a6                	mv	a5,s1
1c00987e:	b7d1                	j	1c009842 <__rt_bridge_handle_notif+0x1a>
1c009880:	43a8                	lw	a0,64(a5)
1c009882:	30047973          	csrrci	s2,mstatus,8
1c009886:	3715                	jal	1c0097aa <__rt_event_enqueue>
1c009888:	30091073          	csrw	mstatus,s2
1c00988c:	bfc5                	j	1c00987c <__rt_bridge_handle_notif+0x54>
1c00988e:	40b2                	lw	ra,12(sp)
1c009890:	4422                	lw	s0,8(sp)
1c009892:	4492                	lw	s1,4(sp)
1c009894:	4902                	lw	s2,0(sp)
1c009896:	0141                	addi	sp,sp,16
1c009898:	8082                	ret

1c00989a <__rt_bridge_check_connection>:
1c00989a:	1c001737          	lui	a4,0x1c001
1c00989e:	ffc70713          	addi	a4,a4,-4 # 1c000ffc <__hal_debug_struct>
1c0098a2:	471c                	lw	a5,8(a4)
1c0098a4:	ef95                	bnez	a5,1c0098e0 <__rt_bridge_check_connection+0x46>
1c0098a6:	1a1047b7          	lui	a5,0x1a104
1c0098aa:	5bfc                	lw	a5,116(a5)
1c0098ac:	469d                	li	a3,7
1c0098ae:	83a5                	srli	a5,a5,0x9
1c0098b0:	8b9d                	andi	a5,a5,7
1c0098b2:	02d79763          	bne	a5,a3,1c0098e0 <__rt_bridge_check_connection+0x46>
1c0098b6:	1141                	addi	sp,sp,-16
1c0098b8:	c422                	sw	s0,8(sp)
1c0098ba:	c226                	sw	s1,4(sp)
1c0098bc:	c606                	sw	ra,12(sp)
1c0098be:	4785                	li	a5,1
1c0098c0:	c71c                	sw	a5,8(a4)
1c0098c2:	1a1044b7          	lui	s1,0x1a104
1c0098c6:	441d                	li	s0,7
1c0098c8:	58fc                	lw	a5,116(s1)
1c0098ca:	83a5                	srli	a5,a5,0x9
1c0098cc:	8b9d                	andi	a5,a5,7
1c0098ce:	00878763          	beq	a5,s0,1c0098dc <__rt_bridge_check_connection+0x42>
1c0098d2:	40b2                	lw	ra,12(sp)
1c0098d4:	4422                	lw	s0,8(sp)
1c0098d6:	4492                	lw	s1,4(sp)
1c0098d8:	0141                	addi	sp,sp,16
1c0098da:	8082                	ret
1c0098dc:	3729                	jal	1c0097e6 <__rt_bridge_wait>
1c0098de:	b7ed                	j	1c0098c8 <__rt_bridge_check_connection+0x2e>
1c0098e0:	8082                	ret

1c0098e2 <__rt_bridge_set_available>:
1c0098e2:	1c0017b7          	lui	a5,0x1c001
1c0098e6:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__hal_debug_struct>
1c0098ea:	479c                	lw	a5,8(a5)
1c0098ec:	8082                	ret

1c0098ee <__rt_bridge_send_notif>:
1c0098ee:	1141                	addi	sp,sp,-16
1c0098f0:	c606                	sw	ra,12(sp)
1c0098f2:	3765                	jal	1c00989a <__rt_bridge_check_connection>
1c0098f4:	40b2                	lw	ra,12(sp)
1c0098f6:	1c0017b7          	lui	a5,0x1c001
1c0098fa:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__hal_debug_struct>
1c0098fe:	479c                	lw	a5,8(a5)
1c009900:	0141                	addi	sp,sp,16
1c009902:	8082                	ret

1c009904 <__rt_bridge_clear_notif>:
1c009904:	1141                	addi	sp,sp,-16
1c009906:	c606                	sw	ra,12(sp)
1c009908:	3f49                	jal	1c00989a <__rt_bridge_check_connection>
1c00990a:	1c0017b7          	lui	a5,0x1c001
1c00990e:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__hal_debug_struct>
1c009912:	4798                	lw	a4,8(a5)
1c009914:	c311                	beqz	a4,1c009918 <__rt_bridge_clear_notif+0x14>
1c009916:	479c                	lw	a5,8(a5)
1c009918:	40b2                	lw	ra,12(sp)
1c00991a:	0141                	addi	sp,sp,16
1c00991c:	8082                	ret

1c00991e <__rt_bridge_printf_flush>:
1c00991e:	1141                	addi	sp,sp,-16
1c009920:	c422                	sw	s0,8(sp)
1c009922:	c606                	sw	ra,12(sp)
1c009924:	1c001437          	lui	s0,0x1c001
1c009928:	3f8d                	jal	1c00989a <__rt_bridge_check_connection>
1c00992a:	ffc40793          	addi	a5,s0,-4 # 1c000ffc <__hal_debug_struct>
1c00992e:	479c                	lw	a5,8(a5)
1c009930:	c385                	beqz	a5,1c009950 <__rt_bridge_printf_flush+0x32>
1c009932:	ffc40413          	addi	s0,s0,-4
1c009936:	485c                	lw	a5,20(s0)
1c009938:	e399                	bnez	a5,1c00993e <__rt_bridge_printf_flush+0x20>
1c00993a:	4c1c                	lw	a5,24(s0)
1c00993c:	cb91                	beqz	a5,1c009950 <__rt_bridge_printf_flush+0x32>
1c00993e:	3f45                	jal	1c0098ee <__rt_bridge_send_notif>
1c009940:	485c                	lw	a5,20(s0)
1c009942:	e789                	bnez	a5,1c00994c <__rt_bridge_printf_flush+0x2e>
1c009944:	4422                	lw	s0,8(sp)
1c009946:	40b2                	lw	ra,12(sp)
1c009948:	0141                	addi	sp,sp,16
1c00994a:	bf6d                	j	1c009904 <__rt_bridge_clear_notif>
1c00994c:	3d69                	jal	1c0097e6 <__rt_bridge_wait>
1c00994e:	bfcd                	j	1c009940 <__rt_bridge_printf_flush+0x22>
1c009950:	40b2                	lw	ra,12(sp)
1c009952:	4422                	lw	s0,8(sp)
1c009954:	0141                	addi	sp,sp,16
1c009956:	8082                	ret

1c009958 <__rt_bridge_req_shutdown>:
1c009958:	1141                	addi	sp,sp,-16
1c00995a:	c606                	sw	ra,12(sp)
1c00995c:	c422                	sw	s0,8(sp)
1c00995e:	c226                	sw	s1,4(sp)
1c009960:	3f2d                	jal	1c00989a <__rt_bridge_check_connection>
1c009962:	1c0017b7          	lui	a5,0x1c001
1c009966:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__hal_debug_struct>
1c00996a:	479c                	lw	a5,8(a5)
1c00996c:	cb95                	beqz	a5,1c0099a0 <__rt_bridge_req_shutdown+0x48>
1c00996e:	3f45                	jal	1c00991e <__rt_bridge_printf_flush>
1c009970:	1a1044b7          	lui	s1,0x1a104
1c009974:	441d                	li	s0,7
1c009976:	58fc                	lw	a5,116(s1)
1c009978:	83a5                	srli	a5,a5,0x9
1c00997a:	8b9d                	andi	a5,a5,7
1c00997c:	02878763          	beq	a5,s0,1c0099aa <__rt_bridge_req_shutdown+0x52>
1c009980:	1a1044b7          	lui	s1,0x1a104
1c009984:	441d                	li	s0,7
1c009986:	58fc                	lw	a5,116(s1)
1c009988:	83a5                	srli	a5,a5,0x9
1c00998a:	8b9d                	andi	a5,a5,7
1c00998c:	02879163          	bne	a5,s0,1c0099ae <__rt_bridge_req_shutdown+0x56>
1c009990:	1a1044b7          	lui	s1,0x1a104
1c009994:	441d                	li	s0,7
1c009996:	58fc                	lw	a5,116(s1)
1c009998:	83a5                	srli	a5,a5,0x9
1c00999a:	8b9d                	andi	a5,a5,7
1c00999c:	00878b63          	beq	a5,s0,1c0099b2 <__rt_bridge_req_shutdown+0x5a>
1c0099a0:	40b2                	lw	ra,12(sp)
1c0099a2:	4422                	lw	s0,8(sp)
1c0099a4:	4492                	lw	s1,4(sp)
1c0099a6:	0141                	addi	sp,sp,16
1c0099a8:	8082                	ret
1c0099aa:	3d35                	jal	1c0097e6 <__rt_bridge_wait>
1c0099ac:	b7e9                	j	1c009976 <__rt_bridge_req_shutdown+0x1e>
1c0099ae:	3d25                	jal	1c0097e6 <__rt_bridge_wait>
1c0099b0:	bfd9                	j	1c009986 <__rt_bridge_req_shutdown+0x2e>
1c0099b2:	3d15                	jal	1c0097e6 <__rt_bridge_wait>
1c0099b4:	b7cd                	j	1c009996 <__rt_bridge_req_shutdown+0x3e>

1c0099b6 <__rt_bridge_init>:
1c0099b6:	1c0017b7          	lui	a5,0x1c001
1c0099ba:	1a10a737          	lui	a4,0x1a10a
1c0099be:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__hal_debug_struct>
1c0099c2:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1077fc>
1c0099c6:	0ae7ac23          	sw	a4,184(a5)
1c0099ca:	4741                	li	a4,16
1c0099cc:	0a07a223          	sw	zero,164(a5)
1c0099d0:	0a07a623          	sw	zero,172(a5)
1c0099d4:	0a07aa23          	sw	zero,180(a5)
1c0099d8:	0ae7ae23          	sw	a4,188(a5)
1c0099dc:	00400793          	li	a5,4
1c0099e0:	0007a823          	sw	zero,16(a5)
1c0099e4:	0007a023          	sw	zero,0(a5)
1c0099e8:	8082                	ret

1c0099ea <__rt_thread_enqueue_ready>:
1c0099ea:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c0099ee:	02052c23          	sw	zero,56(a0)
1c0099f2:	01800793          	li	a5,24
1c0099f6:	e711                	bnez	a4,1c009a02 <__rt_thread_enqueue_ready+0x18>
1c0099f8:	c388                	sw	a0,0(a5)
1c0099fa:	c3c8                	sw	a0,4(a5)
1c0099fc:	0c052a23          	sw	zero,212(a0)
1c009a00:	8082                	ret
1c009a02:	43d8                	lw	a4,4(a5)
1c009a04:	df08                	sw	a0,56(a4)
1c009a06:	bfd5                	j	1c0099fa <__rt_thread_enqueue_ready+0x10>

1c009a08 <__rt_thread_sleep>:
1c009a08:	01800713          	li	a4,24
1c009a0c:	4708                	lw	a0,8(a4)
1c009a0e:	01800793          	li	a5,24
1c009a12:	438c                	lw	a1,0(a5)
1c009a14:	c999                	beqz	a1,1c009a2a <__rt_thread_sleep+0x22>
1c009a16:	5d98                	lw	a4,56(a1)
1c009a18:	c398                	sw	a4,0(a5)
1c009a1a:	4705                	li	a4,1
1c009a1c:	0ce5aa23          	sw	a4,212(a1)
1c009a20:	00b50c63          	beq	a0,a1,1c009a38 <__rt_thread_sleep+0x30>
1c009a24:	c78c                	sw	a1,8(a5)
1c009a26:	8a1fe06f          	j	1c0082c6 <__rt_thread_switch>
1c009a2a:	10500073          	wfi
1c009a2e:	30045073          	csrwi	mstatus,8
1c009a32:	30047773          	csrrci	a4,mstatus,8
1c009a36:	bff1                	j	1c009a12 <__rt_thread_sleep+0xa>
1c009a38:	8082                	ret

1c009a3a <rt_thread_exit>:
1c009a3a:	300477f3          	csrrci	a5,mstatus,8
1c009a3e:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009a42:	4705                	li	a4,1
1c009a44:	c3e8                	sw	a0,68(a5)
1c009a46:	5fc8                	lw	a0,60(a5)
1c009a48:	c3b8                	sw	a4,64(a5)
1c009a4a:	c909                	beqz	a0,1c009a5c <rt_thread_exit+0x22>
1c009a4c:	0d452783          	lw	a5,212(a0)
1c009a50:	c791                	beqz	a5,1c009a5c <rt_thread_exit+0x22>
1c009a52:	1141                	addi	sp,sp,-16
1c009a54:	c606                	sw	ra,12(sp)
1c009a56:	3f51                	jal	1c0099ea <__rt_thread_enqueue_ready>
1c009a58:	40b2                	lw	ra,12(sp)
1c009a5a:	0141                	addi	sp,sp,16
1c009a5c:	b775                	j	1c009a08 <__rt_thread_sleep>

1c009a5e <__rt_thread_wakeup>:
1c009a5e:	5d18                	lw	a4,56(a0)
1c009a60:	eb09                	bnez	a4,1c009a72 <__rt_thread_wakeup+0x14>
1c009a62:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c009a66:	00a70663          	beq	a4,a0,1c009a72 <__rt_thread_wakeup+0x14>
1c009a6a:	0d452783          	lw	a5,212(a0)
1c009a6e:	c391                	beqz	a5,1c009a72 <__rt_thread_wakeup+0x14>
1c009a70:	bfad                	j	1c0099ea <__rt_thread_enqueue_ready>
1c009a72:	8082                	ret

1c009a74 <__rt_thread_sched_init>:
1c009a74:	1141                	addi	sp,sp,-16
1c009a76:	c422                	sw	s0,8(sp)
1c009a78:	1c0087b7          	lui	a5,0x1c008
1c009a7c:	1c001437          	lui	s0,0x1c001
1c009a80:	c226                	sw	s1,4(sp)
1c009a82:	c04a                	sw	s2,0(sp)
1c009a84:	c606                	sw	ra,12(sp)
1c009a86:	f0040413          	addi	s0,s0,-256 # 1c000f00 <__rt_thread_main>
1c009a8a:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009a8e:	c01c                	sw	a5,0(s0)
1c009a90:	1c00a7b7          	lui	a5,0x1c00a
1c009a94:	04840913          	addi	s2,s0,72
1c009a98:	a3a78793          	addi	a5,a5,-1478 # 1c009a3a <rt_thread_exit>
1c009a9c:	01800493          	li	s1,24
1c009aa0:	c45c                	sw	a5,12(s0)
1c009aa2:	854a                	mv	a0,s2
1c009aa4:	4785                	li	a5,1
1c009aa6:	e3ff6597          	auipc	a1,0xe3ff6
1c009aaa:	58258593          	addi	a1,a1,1410 # 28 <__rt_sched>
1c009aae:	0cf42a23          	sw	a5,212(s0)
1c009ab2:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa101fec>
1c009ab6:	02042a23          	sw	zero,52(s0)
1c009aba:	00042223          	sw	zero,4(s0)
1c009abe:	00042423          	sw	zero,8(s0)
1c009ac2:	2829                	jal	1c009adc <__rt_event_init>
1c009ac4:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009ac8:	c480                	sw	s0,8(s1)
1c009aca:	40b2                	lw	ra,12(sp)
1c009acc:	d03c                	sw	a5,96(s0)
1c009ace:	4422                	lw	s0,8(sp)
1c009ad0:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009ad4:	4492                	lw	s1,4(sp)
1c009ad6:	4902                	lw	s2,0(sp)
1c009ad8:	0141                	addi	sp,sp,16
1c009ada:	8082                	ret

1c009adc <__rt_event_init>:
1c009adc:	02052023          	sw	zero,32(a0)
1c009ae0:	02052223          	sw	zero,36(a0)
1c009ae4:	02052823          	sw	zero,48(a0)
1c009ae8:	00052023          	sw	zero,0(a0)
1c009aec:	8082                	ret

1c009aee <__rt_wait_event_prepare_blocking>:
1c009aee:	02400793          	li	a5,36
1c009af2:	4388                	lw	a0,0(a5)
1c009af4:	4d18                	lw	a4,24(a0)
1c009af6:	02052223          	sw	zero,36(a0)
1c009afa:	c398                	sw	a4,0(a5)
1c009afc:	4785                	li	a5,1
1c009afe:	d11c                	sw	a5,32(a0)
1c009b00:	00052023          	sw	zero,0(a0)
1c009b04:	8082                	ret

1c009b06 <rt_event_alloc>:
1c009b06:	1141                	addi	sp,sp,-16
1c009b08:	c422                	sw	s0,8(sp)
1c009b0a:	842e                	mv	s0,a1
1c009b0c:	c606                	sw	ra,12(sp)
1c009b0e:	c226                	sw	s1,4(sp)
1c009b10:	300474f3          	csrrci	s1,mstatus,8
1c009b14:	f14027f3          	csrr	a5,mhartid
1c009b18:	8795                	srai	a5,a5,0x5
1c009b1a:	03f7f793          	andi	a5,a5,63
1c009b1e:	477d                	li	a4,31
1c009b20:	00378513          	addi	a0,a5,3
1c009b24:	00e79363          	bne	a5,a4,1c009b2a <rt_event_alloc+0x24>
1c009b28:	4501                	li	a0,0
1c009b2a:	08c00593          	li	a1,140
1c009b2e:	02b405b3          	mul	a1,s0,a1
1c009b32:	882ff0ef          	jal	ra,1c008bb4 <rt_alloc>
1c009b36:	87aa                	mv	a5,a0
1c009b38:	557d                	li	a0,-1
1c009b3a:	cf91                	beqz	a5,1c009b56 <rt_event_alloc+0x50>
1c009b3c:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009b40:	4581                	li	a1,0
1c009b42:	4601                	li	a2,0
1c009b44:	02400713          	li	a4,36
1c009b48:	00864c63          	blt	a2,s0,1c009b60 <rt_event_alloc+0x5a>
1c009b4c:	c191                	beqz	a1,1c009b50 <rt_event_alloc+0x4a>
1c009b4e:	c314                	sw	a3,0(a4)
1c009b50:	30049073          	csrw	mstatus,s1
1c009b54:	4501                	li	a0,0
1c009b56:	40b2                	lw	ra,12(sp)
1c009b58:	4422                	lw	s0,8(sp)
1c009b5a:	4492                	lw	s1,4(sp)
1c009b5c:	0141                	addi	sp,sp,16
1c009b5e:	8082                	ret
1c009b60:	cf94                	sw	a3,24(a5)
1c009b62:	0207a023          	sw	zero,32(a5)
1c009b66:	0207a223          	sw	zero,36(a5)
1c009b6a:	0207a823          	sw	zero,48(a5)
1c009b6e:	0007a023          	sw	zero,0(a5)
1c009b72:	86be                	mv	a3,a5
1c009b74:	0605                	addi	a2,a2,1
1c009b76:	4585                	li	a1,1
1c009b78:	08c78793          	addi	a5,a5,140
1c009b7c:	b7f1                	j	1c009b48 <rt_event_alloc+0x42>

1c009b7e <rt_event_get>:
1c009b7e:	30047773          	csrrci	a4,mstatus,8
1c009b82:	02400793          	li	a5,36
1c009b86:	4388                	lw	a0,0(a5)
1c009b88:	c509                	beqz	a0,1c009b92 <rt_event_get+0x14>
1c009b8a:	4d14                	lw	a3,24(a0)
1c009b8c:	c150                	sw	a2,4(a0)
1c009b8e:	c394                	sw	a3,0(a5)
1c009b90:	c10c                	sw	a1,0(a0)
1c009b92:	30071073          	csrw	mstatus,a4
1c009b96:	8082                	ret

1c009b98 <rt_event_get_blocking>:
1c009b98:	30047773          	csrrci	a4,mstatus,8
1c009b9c:	02400793          	li	a5,36
1c009ba0:	4388                	lw	a0,0(a5)
1c009ba2:	c909                	beqz	a0,1c009bb4 <rt_event_get_blocking+0x1c>
1c009ba4:	4d14                	lw	a3,24(a0)
1c009ba6:	00052223          	sw	zero,4(a0)
1c009baa:	c394                	sw	a3,0(a5)
1c009bac:	4785                	li	a5,1
1c009bae:	00052023          	sw	zero,0(a0)
1c009bb2:	d11c                	sw	a5,32(a0)
1c009bb4:	30071073          	csrw	mstatus,a4
1c009bb8:	8082                	ret

1c009bba <rt_event_push>:
1c009bba:	30047773          	csrrci	a4,mstatus,8
1c009bbe:	02400693          	li	a3,36
1c009bc2:	42d4                	lw	a3,4(a3)
1c009bc4:	00052c23          	sw	zero,24(a0)
1c009bc8:	02400793          	li	a5,36
1c009bcc:	e691                	bnez	a3,1c009bd8 <rt_event_push+0x1e>
1c009bce:	c3c8                	sw	a0,4(a5)
1c009bd0:	c788                	sw	a0,8(a5)
1c009bd2:	30071073          	csrw	mstatus,a4
1c009bd6:	8082                	ret
1c009bd8:	4794                	lw	a3,8(a5)
1c009bda:	ce88                	sw	a0,24(a3)
1c009bdc:	bfd5                	j	1c009bd0 <rt_event_push+0x16>

1c009bde <__rt_event_execute>:
1c009bde:	1141                	addi	sp,sp,-16
1c009be0:	c422                	sw	s0,8(sp)
1c009be2:	02400793          	li	a5,36
1c009be6:	43dc                	lw	a5,4(a5)
1c009be8:	c606                	sw	ra,12(sp)
1c009bea:	c226                	sw	s1,4(sp)
1c009bec:	02400413          	li	s0,36
1c009bf0:	eb91                	bnez	a5,1c009c04 <__rt_event_execute+0x26>
1c009bf2:	c1a9                	beqz	a1,1c009c34 <__rt_event_execute+0x56>
1c009bf4:	10500073          	wfi
1c009bf8:	30045073          	csrwi	mstatus,8
1c009bfc:	300477f3          	csrrci	a5,mstatus,8
1c009c00:	405c                	lw	a5,4(s0)
1c009c02:	cb8d                	beqz	a5,1c009c34 <__rt_event_execute+0x56>
1c009c04:	4485                	li	s1,1
1c009c06:	4f98                	lw	a4,24(a5)
1c009c08:	53d4                	lw	a3,36(a5)
1c009c0a:	00978823          	sb	s1,16(a5)
1c009c0e:	c058                	sw	a4,4(s0)
1c009c10:	43c8                	lw	a0,4(a5)
1c009c12:	4398                	lw	a4,0(a5)
1c009c14:	e691                	bnez	a3,1c009c20 <__rt_event_execute+0x42>
1c009c16:	5394                	lw	a3,32(a5)
1c009c18:	e681                	bnez	a3,1c009c20 <__rt_event_execute+0x42>
1c009c1a:	4014                	lw	a3,0(s0)
1c009c1c:	c01c                	sw	a5,0(s0)
1c009c1e:	cf94                	sw	a3,24(a5)
1c009c20:	0207a023          	sw	zero,32(a5)
1c009c24:	c711                	beqz	a4,1c009c30 <__rt_event_execute+0x52>
1c009c26:	30045073          	csrwi	mstatus,8
1c009c2a:	9702                	jalr	a4
1c009c2c:	300477f3          	csrrci	a5,mstatus,8
1c009c30:	405c                	lw	a5,4(s0)
1c009c32:	fbf1                	bnez	a5,1c009c06 <__rt_event_execute+0x28>
1c009c34:	40b2                	lw	ra,12(sp)
1c009c36:	4422                	lw	s0,8(sp)
1c009c38:	4492                	lw	s1,4(sp)
1c009c3a:	0141                	addi	sp,sp,16
1c009c3c:	8082                	ret

1c009c3e <__rt_wait_event>:
1c009c3e:	1141                	addi	sp,sp,-16
1c009c40:	c422                	sw	s0,8(sp)
1c009c42:	c606                	sw	ra,12(sp)
1c009c44:	842a                	mv	s0,a0
1c009c46:	501c                	lw	a5,32(s0)
1c009c48:	ef81                	bnez	a5,1c009c60 <__rt_wait_event+0x22>
1c009c4a:	581c                	lw	a5,48(s0)
1c009c4c:	eb91                	bnez	a5,1c009c60 <__rt_wait_event+0x22>
1c009c4e:	02400793          	li	a5,36
1c009c52:	4398                	lw	a4,0(a5)
1c009c54:	40b2                	lw	ra,12(sp)
1c009c56:	c380                	sw	s0,0(a5)
1c009c58:	cc18                	sw	a4,24(s0)
1c009c5a:	4422                	lw	s0,8(sp)
1c009c5c:	0141                	addi	sp,sp,16
1c009c5e:	8082                	ret
1c009c60:	4585                	li	a1,1
1c009c62:	4501                	li	a0,0
1c009c64:	3fad                	jal	1c009bde <__rt_event_execute>
1c009c66:	b7c5                	j	1c009c46 <__rt_wait_event+0x8>

1c009c68 <rt_event_wait>:
1c009c68:	1141                	addi	sp,sp,-16
1c009c6a:	c606                	sw	ra,12(sp)
1c009c6c:	c422                	sw	s0,8(sp)
1c009c6e:	30047473          	csrrci	s0,mstatus,8
1c009c72:	37f1                	jal	1c009c3e <__rt_wait_event>
1c009c74:	30041073          	csrw	mstatus,s0
1c009c78:	40b2                	lw	ra,12(sp)
1c009c7a:	4422                	lw	s0,8(sp)
1c009c7c:	0141                	addi	sp,sp,16
1c009c7e:	8082                	ret

1c009c80 <__rt_event_sched_init>:
1c009c80:	02400513          	li	a0,36
1c009c84:	00052023          	sw	zero,0(a0)
1c009c88:	00052223          	sw	zero,4(a0)
1c009c8c:	4585                	li	a1,1
1c009c8e:	0511                	addi	a0,a0,4
1c009c90:	bd9d                	j	1c009b06 <rt_event_alloc>

1c009c92 <__rt_fll_set_freq>:
1c009c92:	1141                	addi	sp,sp,-16
1c009c94:	c422                	sw	s0,8(sp)
1c009c96:	c226                	sw	s1,4(sp)
1c009c98:	c606                	sw	ra,12(sp)
1c009c9a:	842a                	mv	s0,a0
1c009c9c:	84ae                	mv	s1,a1
1c009c9e:	e111                	bnez	a0,1c009ca2 <__rt_fll_set_freq+0x10>
1c009ca0:	3965                	jal	1c009958 <__rt_bridge_req_shutdown>
1c009ca2:	8526                	mv	a0,s1
1c009ca4:	851fe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009ca8:	1579                	addi	a0,a0,-2
1c009caa:	00155793          	srli	a5,a0,0x1
1c009cae:	e391                	bnez	a5,1c009cb2 <__rt_fll_set_freq+0x20>
1c009cb0:	4785                	li	a5,1
1c009cb2:	fff78713          	addi	a4,a5,-1
1c009cb6:	4505                	li	a0,1
1c009cb8:	00e51533          	sll	a0,a0,a4
1c009cbc:	00f494b3          	sll	s1,s1,a5
1c009cc0:	7761                	lui	a4,0xffff8
1c009cc2:	8f65                	and	a4,a4,s1
1c009cc4:	1c0016b7          	lui	a3,0x1c001
1c009cc8:	953a                	add	a0,a0,a4
1c009cca:	21068693          	addi	a3,a3,528 # 1c001210 <__rt_fll_freq>
1c009cce:	00241713          	slli	a4,s0,0x2
1c009cd2:	9736                	add	a4,a4,a3
1c009cd4:	00f55533          	srl	a0,a0,a5
1c009cd8:	c308                	sw	a0,0(a4)
1c009cda:	1c001737          	lui	a4,0x1c001
1c009cde:	1ac70713          	addi	a4,a4,428 # 1c0011ac <__rt_fll_is_on>
1c009ce2:	9722                	add	a4,a4,s0
1c009ce4:	00074703          	lbu	a4,0(a4)
1c009ce8:	c715                	beqz	a4,1c009d14 <__rt_fll_set_freq+0x82>
1c009cea:	1a100737          	lui	a4,0x1a100
1c009cee:	0711                	addi	a4,a4,4
1c009cf0:	0412                	slli	s0,s0,0x4
1c009cf2:	943a                	add	s0,s0,a4
1c009cf4:	4018                	lw	a4,0(s0)
1c009cf6:	80bd                	srli	s1,s1,0xf
1c009cf8:	76c1                	lui	a3,0xffff0
1c009cfa:	04c2                	slli	s1,s1,0x10
1c009cfc:	8f75                	and	a4,a4,a3
1c009cfe:	80c1                	srli	s1,s1,0x10
1c009d00:	0785                	addi	a5,a5,1
1c009d02:	c40006b7          	lui	a3,0xc4000
1c009d06:	8f45                	or	a4,a4,s1
1c009d08:	8bbd                	andi	a5,a5,15
1c009d0a:	16fd                	addi	a3,a3,-1
1c009d0c:	07ea                	slli	a5,a5,0x1a
1c009d0e:	8f75                	and	a4,a4,a3
1c009d10:	8fd9                	or	a5,a5,a4
1c009d12:	c01c                	sw	a5,0(s0)
1c009d14:	40b2                	lw	ra,12(sp)
1c009d16:	4422                	lw	s0,8(sp)
1c009d18:	4492                	lw	s1,4(sp)
1c009d1a:	0141                	addi	sp,sp,16
1c009d1c:	8082                	ret

1c009d1e <__rt_fll_init>:
1c009d1e:	1141                	addi	sp,sp,-16
1c009d20:	1a1005b7          	lui	a1,0x1a100
1c009d24:	00451613          	slli	a2,a0,0x4
1c009d28:	c226                	sw	s1,4(sp)
1c009d2a:	84aa                	mv	s1,a0
1c009d2c:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fdff0>
1c009d30:	9532                	add	a0,a0,a2
1c009d32:	4114                	lw	a3,0(a0)
1c009d34:	c606                	sw	ra,12(sp)
1c009d36:	c422                	sw	s0,8(sp)
1c009d38:	87b6                	mv	a5,a3
1c009d3a:	0406c963          	bltz	a3,1c009d8c <__rt_fll_init+0x6e>
1c009d3e:	00858793          	addi	a5,a1,8
1c009d42:	97b2                	add	a5,a5,a2
1c009d44:	4398                	lw	a4,0(a5)
1c009d46:	7841                	lui	a6,0xffff0
1c009d48:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009d4c:	01077733          	and	a4,a4,a6
1c009d50:	6809                	lui	a6,0x2
1c009d52:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009d56:	01076733          	or	a4,a4,a6
1c009d5a:	f0010837          	lui	a6,0xf0010
1c009d5e:	187d                	addi	a6,a6,-1
1c009d60:	01077733          	and	a4,a4,a6
1c009d64:	00500837          	lui	a6,0x500
1c009d68:	01076733          	or	a4,a4,a6
1c009d6c:	05b1                	addi	a1,a1,12
1c009d6e:	c398                	sw	a4,0(a5)
1c009d70:	962e                	add	a2,a2,a1
1c009d72:	421c                	lw	a5,0(a2)
1c009d74:	fc010737          	lui	a4,0xfc010
1c009d78:	177d                	addi	a4,a4,-1
1c009d7a:	8ff9                	and	a5,a5,a4
1c009d7c:	014c0737          	lui	a4,0x14c0
1c009d80:	8fd9                	or	a5,a5,a4
1c009d82:	c21c                	sw	a5,0(a2)
1c009d84:	c00007b7          	lui	a5,0xc0000
1c009d88:	8fd5                	or	a5,a5,a3
1c009d8a:	c11c                	sw	a5,0(a0)
1c009d8c:	1c001637          	lui	a2,0x1c001
1c009d90:	00249713          	slli	a4,s1,0x2
1c009d94:	21060613          	addi	a2,a2,528 # 1c001210 <__rt_fll_freq>
1c009d98:	9732                	add	a4,a4,a2
1c009d9a:	4300                	lw	s0,0(a4)
1c009d9c:	c015                	beqz	s0,1c009dc0 <__rt_fll_init+0xa2>
1c009d9e:	85a2                	mv	a1,s0
1c009da0:	8526                	mv	a0,s1
1c009da2:	3dc5                	jal	1c009c92 <__rt_fll_set_freq>
1c009da4:	1c001537          	lui	a0,0x1c001
1c009da8:	1ac50513          	addi	a0,a0,428 # 1c0011ac <__rt_fll_is_on>
1c009dac:	9526                	add	a0,a0,s1
1c009dae:	4785                	li	a5,1
1c009db0:	00f50023          	sb	a5,0(a0)
1c009db4:	40b2                	lw	ra,12(sp)
1c009db6:	8522                	mv	a0,s0
1c009db8:	4422                	lw	s0,8(sp)
1c009dba:	4492                	lw	s1,4(sp)
1c009dbc:	0141                	addi	sp,sp,16
1c009dbe:	8082                	ret
1c009dc0:	06c2                	slli	a3,a3,0x10
1c009dc2:	83e9                	srli	a5,a5,0x1a
1c009dc4:	82c1                	srli	a3,a3,0x10
1c009dc6:	8bbd                	andi	a5,a5,15
1c009dc8:	06be                	slli	a3,a3,0xf
1c009dca:	17fd                	addi	a5,a5,-1
1c009dcc:	00f6d433          	srl	s0,a3,a5
1c009dd0:	c300                	sw	s0,0(a4)
1c009dd2:	bfc9                	j	1c009da4 <__rt_fll_init+0x86>

1c009dd4 <__rt_fll_deinit>:
1c009dd4:	1c0017b7          	lui	a5,0x1c001
1c009dd8:	1ac78793          	addi	a5,a5,428 # 1c0011ac <__rt_fll_is_on>
1c009ddc:	953e                	add	a0,a0,a5
1c009dde:	00050023          	sb	zero,0(a0)
1c009de2:	8082                	ret

1c009de4 <__rt_flls_constructor>:
1c009de4:	1c0017b7          	lui	a5,0x1c001
1c009de8:	2007a823          	sw	zero,528(a5) # 1c001210 <__rt_fll_freq>
1c009dec:	21078793          	addi	a5,a5,528
1c009df0:	0007a223          	sw	zero,4(a5)
1c009df4:	1c0017b7          	lui	a5,0x1c001
1c009df8:	1a079623          	sh	zero,428(a5) # 1c0011ac <__rt_fll_is_on>
1c009dfc:	8082                	ret

1c009dfe <gcd>:
1c009dfe:	cd19                	beqz	a0,1c009e1c <gcd+0x1e>
1c009e00:	cd81                	beqz	a1,1c009e18 <gcd+0x1a>
1c009e02:	00054463          	bltz	a0,1c009e0a <gcd+0xc>
1c009e06:	0005d563          	bgez	a1,1c009e10 <gcd+0x12>
1c009e0a:	55fd                	li	a1,-1
1c009e0c:	a031                	j	1c009e18 <gcd+0x1a>
1c009e0e:	85be                	mv	a1,a5
1c009e10:	02b567b3          	rem	a5,a0,a1
1c009e14:	852e                	mv	a0,a1
1c009e16:	ffe5                	bnez	a5,1c009e0e <gcd+0x10>
1c009e18:	852e                	mv	a0,a1
1c009e1a:	8082                	ret
1c009e1c:	4581                	li	a1,0
1c009e1e:	bfed                	j	1c009e18 <gcd+0x1a>

1c009e20 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009e20:	1101                	addi	sp,sp,-32
1c009e22:	1c0017b7          	lui	a5,0x1c001
1c009e26:	c84a                	sw	s2,16(sp)
1c009e28:	1b07a903          	lw	s2,432(a5) # 1c0011b0 <__rt_periph_lcm>
1c009e2c:	c452                	sw	s4,8(sp)
1c009e2e:	8a2e                	mv	s4,a1
1c009e30:	85ca                	mv	a1,s2
1c009e32:	ce06                	sw	ra,28(sp)
1c009e34:	cc22                	sw	s0,24(sp)
1c009e36:	ca26                	sw	s1,20(sp)
1c009e38:	842a                	mv	s0,a0
1c009e3a:	c64e                	sw	s3,12(sp)
1c009e3c:	89aa                	mv	s3,a0
1c009e3e:	37c1                	jal	1c009dfe <gcd>
1c009e40:	02a44533          	div	a0,s0,a0
1c009e44:	03250933          	mul	s2,a0,s2
1c009e48:	4511                	li	a0,4
1c009e4a:	82dff0ef          	jal	ra,1c009676 <__rt_cbsys_exec>
1c009e4e:	1c0017b7          	lui	a5,0x1c001
1c009e52:	2107a783          	lw	a5,528(a5) # 1c001210 <__rt_fll_freq>
1c009e56:	028954b3          	divu	s1,s2,s0
1c009e5a:	0527f263          	bleu	s2,a5,1c009e9e <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009e5e:	1a1047b7          	lui	a5,0x1a104
1c009e62:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1020c0>
1c009e66:	4705                	li	a4,1
1c009e68:	0ce7ae23          	sw	a4,220(a5)
1c009e6c:	85a2                	mv	a1,s0
1c009e6e:	4501                	li	a0,0
1c009e70:	350d                	jal	1c009c92 <__rt_fll_set_freq>
1c009e72:	57fd                	li	a5,-1
1c009e74:	00fa0963          	beq	s4,a5,1c009e86 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009e78:	c099                	beqz	s1,1c009e7e <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009e7a:	029459b3          	divu	s3,s0,s1
1c009e7e:	1c0017b7          	lui	a5,0x1c001
1c009e82:	2137ac23          	sw	s3,536(a5) # 1c001218 <__rt_freq_domains>
1c009e86:	4515                	li	a0,5
1c009e88:	feeff0ef          	jal	ra,1c009676 <__rt_cbsys_exec>
1c009e8c:	40f2                	lw	ra,28(sp)
1c009e8e:	4462                	lw	s0,24(sp)
1c009e90:	44d2                	lw	s1,20(sp)
1c009e92:	4942                	lw	s2,16(sp)
1c009e94:	49b2                	lw	s3,12(sp)
1c009e96:	4a22                	lw	s4,8(sp)
1c009e98:	4501                	li	a0,0
1c009e9a:	6105                	addi	sp,sp,32
1c009e9c:	8082                	ret
1c009e9e:	85a2                	mv	a1,s0
1c009ea0:	4501                	li	a0,0
1c009ea2:	3bc5                	jal	1c009c92 <__rt_fll_set_freq>
1c009ea4:	1a1047b7          	lui	a5,0x1a104
1c009ea8:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1020c0>
1c009eac:	4705                	li	a4,1
1c009eae:	0ce7ae23          	sw	a4,220(a5)
1c009eb2:	b7c1                	j	1c009e72 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009eb4 <rt_freq_set_and_get>:
1c009eb4:	1141                	addi	sp,sp,-16
1c009eb6:	852e                	mv	a0,a1
1c009eb8:	c606                	sw	ra,12(sp)
1c009eba:	c422                	sw	s0,8(sp)
1c009ebc:	30047473          	csrrci	s0,mstatus,8
1c009ec0:	4581                	li	a1,0
1c009ec2:	3fb9                	jal	1c009e20 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009ec4:	30041073          	csrw	mstatus,s0
1c009ec8:	40b2                	lw	ra,12(sp)
1c009eca:	4422                	lw	s0,8(sp)
1c009ecc:	00a03533          	snez	a0,a0
1c009ed0:	40a00533          	neg	a0,a0
1c009ed4:	0141                	addi	sp,sp,16
1c009ed6:	8082                	ret

1c009ed8 <__rt_freq_init>:
1c009ed8:	1141                	addi	sp,sp,-16
1c009eda:	c422                	sw	s0,8(sp)
1c009edc:	c606                	sw	ra,12(sp)
1c009ede:	3719                	jal	1c009de4 <__rt_flls_constructor>
1c009ee0:	1c0017b7          	lui	a5,0x1c001
1c009ee4:	0bc7a703          	lw	a4,188(a5) # 1c0010bc <__rt_platform>
1c009ee8:	4785                	li	a5,1
1c009eea:	1c001437          	lui	s0,0x1c001
1c009eee:	02f70663          	beq	a4,a5,1c009f1a <__rt_freq_init+0x42>
1c009ef2:	4501                	li	a0,0
1c009ef4:	352d                	jal	1c009d1e <__rt_fll_init>
1c009ef6:	20a42c23          	sw	a0,536(s0) # 1c001218 <__rt_freq_domains>
1c009efa:	1a1047b7          	lui	a5,0x1a104
1c009efe:	4709                	li	a4,2
1c009f00:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1020bc>
1c009f04:	4705                	li	a4,1
1c009f06:	0ce7ac23          	sw	a4,216(a5)
1c009f0a:	40b2                	lw	ra,12(sp)
1c009f0c:	4422                	lw	s0,8(sp)
1c009f0e:	0ce7ae23          	sw	a4,220(a5)
1c009f12:	0ce7aa23          	sw	a4,212(a5)
1c009f16:	0141                	addi	sp,sp,16
1c009f18:	8082                	ret
1c009f1a:	026267b7          	lui	a5,0x2626
1c009f1e:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2617a14>
1c009f22:	20f42c23          	sw	a5,536(s0)
1c009f26:	bfd1                	j	1c009efa <__rt_freq_init+0x22>

1c009f28 <hal_itc_wait_for_event_noirq>:
1c009f28:	1a10a7b7          	lui	a5,0x1a10a
1c009f2c:	300476f3          	csrrci	a3,mstatus,8
1c009f30:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1077f8>
1c009f34:	8f69                	and	a4,a4,a0
1c009f36:	eb11                	bnez	a4,1c009f4a <hal_itc_wait_for_event_noirq+0x22>
1c009f38:	80a7a223          	sw	a0,-2044(a5)
1c009f3c:	10500073          	wfi
1c009f40:	80a7a423          	sw	a0,-2040(a5)
1c009f44:	30069073          	csrw	mstatus,a3
1c009f48:	b7d5                	j	1c009f2c <hal_itc_wait_for_event_noirq+0x4>
1c009f4a:	80a7aa23          	sw	a0,-2028(a5)
1c009f4e:	30069073          	csrw	mstatus,a3
1c009f52:	8082                	ret

1c009f54 <__rt_pmu_cluster_power_down>:
1c009f54:	1a1047b7          	lui	a5,0x1a104
1c009f58:	5bbc                	lw	a5,112(a5)
1c009f5a:	01079713          	slli	a4,a5,0x10
1c009f5e:	02074c63          	bltz	a4,1c009f96 <__rt_pmu_cluster_power_down+0x42>
1c009f62:	1141                	addi	sp,sp,-16
1c009f64:	c422                	sw	s0,8(sp)
1c009f66:	c606                	sw	ra,12(sp)
1c009f68:	c226                	sw	s1,4(sp)
1c009f6a:	1a104437          	lui	s0,0x1a104
1c009f6e:	547c                	lw	a5,108(s0)
1c009f70:	e385                	bnez	a5,1c009f90 <__rt_pmu_cluster_power_down+0x3c>
1c009f72:	4485                	li	s1,1
1c009f74:	c444                	sw	s1,12(s0)
1c009f76:	478d                	li	a5,3
1c009f78:	d83c                	sw	a5,112(s0)
1c009f7a:	00800537          	lui	a0,0x800
1c009f7e:	376d                	jal	1c009f28 <hal_itc_wait_for_event_noirq>
1c009f80:	d824                	sw	s1,112(s0)
1c009f82:	4422                	lw	s0,8(sp)
1c009f84:	40b2                	lw	ra,12(sp)
1c009f86:	4492                	lw	s1,4(sp)
1c009f88:	00400537          	lui	a0,0x400
1c009f8c:	0141                	addi	sp,sp,16
1c009f8e:	bf69                	j	1c009f28 <hal_itc_wait_for_event_noirq>
1c009f90:	4505                	li	a0,1
1c009f92:	2a11                	jal	1c00a0a6 <rt_time_wait_us>
1c009f94:	bfe9                	j	1c009f6e <__rt_pmu_cluster_power_down+0x1a>
1c009f96:	8082                	ret

1c009f98 <__rt_pmu_cluster_power_up>:
1c009f98:	1141                	addi	sp,sp,-16
1c009f9a:	c606                	sw	ra,12(sp)
1c009f9c:	c422                	sw	s0,8(sp)
1c009f9e:	478d                	li	a5,3
1c009fa0:	1a104437          	lui	s0,0x1a104
1c009fa4:	d83c                	sw	a5,112(s0)
1c009fa6:	00400537          	lui	a0,0x400
1c009faa:	3fbd                	jal	1c009f28 <hal_itc_wait_for_event_noirq>
1c009fac:	02700793          	li	a5,39
1c009fb0:	d83c                	sw	a5,112(s0)
1c009fb2:	00800537          	lui	a0,0x800
1c009fb6:	3f8d                	jal	1c009f28 <hal_itc_wait_for_event_noirq>
1c009fb8:	6791                	lui	a5,0x4
1c009fba:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa101ff8>
1c009fbe:	02778793          	addi	a5,a5,39 # 4027 <_l1_preload_size+0x2017>
1c009fc2:	d83c                	sw	a5,112(s0)
1c009fc4:	40b2                	lw	ra,12(sp)
1c009fc6:	4422                	lw	s0,8(sp)
1c009fc8:	4505                	li	a0,1
1c009fca:	0141                	addi	sp,sp,16
1c009fcc:	8082                	ret

1c009fce <__rt_pmu_init>:
1c009fce:	1a1077b7          	lui	a5,0x1a107
1c009fd2:	4741                	li	a4,16
1c009fd4:	cb98                	sw	a4,16(a5)
1c009fd6:	1a10a7b7          	lui	a5,0x1a10a
1c009fda:	02000737          	lui	a4,0x2000
1c009fde:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa107800>
1c009fe2:	4709                	li	a4,2
1c009fe4:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c009fe8:	8082                	ret

1c009fea <rt_padframe_set>:
1c009fea:	300476f3          	csrrci	a3,mstatus,8
1c009fee:	4158                	lw	a4,4(a0)
1c009ff0:	1a1047b7          	lui	a5,0x1a104
1c009ff4:	4310                	lw	a2,0(a4)
1c009ff6:	cb90                	sw	a2,16(a5)
1c009ff8:	4350                	lw	a2,4(a4)
1c009ffa:	cbd0                	sw	a2,20(a5)
1c009ffc:	4710                	lw	a2,8(a4)
1c009ffe:	cf90                	sw	a2,24(a5)
1c00a000:	4758                	lw	a4,12(a4)
1c00a002:	cfd8                	sw	a4,28(a5)
1c00a004:	30069073          	csrw	mstatus,a3
1c00a008:	8082                	ret

1c00a00a <__rt_padframe_init>:
1c00a00a:	1c001537          	lui	a0,0x1c001
1c00a00e:	fec50513          	addi	a0,a0,-20 # 1c000fec <__rt_padframe_profiles>
1c00a012:	bfe1                	j	1c009fea <rt_padframe_set>

1c00a014 <__rt_time_poweroff>:
1c00a014:	1a10b7b7          	lui	a5,0x1a10b
1c00a018:	47d8                	lw	a4,12(a5)
1c00a01a:	1c0017b7          	lui	a5,0x1c001
1c00a01e:	4501                	li	a0,0
1c00a020:	1ae7aa23          	sw	a4,436(a5) # 1c0011b4 <timer_count>
1c00a024:	8082                	ret

1c00a026 <__rt_time_poweron>:
1c00a026:	1c0017b7          	lui	a5,0x1c001
1c00a02a:	1b47a703          	lw	a4,436(a5) # 1c0011b4 <timer_count>
1c00a02e:	1a10b7b7          	lui	a5,0x1a10b
1c00a032:	4501                	li	a0,0
1c00a034:	c7d8                	sw	a4,12(a5)
1c00a036:	8082                	ret

1c00a038 <rt_event_push_delayed>:
1c00a038:	30047373          	csrrci	t1,mstatus,8
1c00a03c:	1a10b6b7          	lui	a3,0x1a10b
1c00a040:	46d0                	lw	a2,12(a3)
1c00a042:	1c001737          	lui	a4,0x1c001
1c00a046:	22072783          	lw	a5,544(a4) # 1c001220 <first_delayed>
1c00a04a:	86ba                	mv	a3,a4
1c00a04c:	0005d363          	bgez	a1,1c00a052 <rt_event_push_delayed+0x1a>
1c00a050:	4581                	li	a1,0
1c00a052:	4779                	li	a4,30
1c00a054:	02e5c5b3          	div	a1,a1,a4
1c00a058:	80000737          	lui	a4,0x80000
1c00a05c:	fff74713          	not	a4,a4
1c00a060:	00e67833          	and	a6,a2,a4
1c00a064:	0585                	addi	a1,a1,1
1c00a066:	962e                	add	a2,a2,a1
1c00a068:	d950                	sw	a2,52(a0)
1c00a06a:	982e                	add	a6,a6,a1
1c00a06c:	4601                	li	a2,0
1c00a06e:	c799                	beqz	a5,1c00a07c <rt_event_push_delayed+0x44>
1c00a070:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa109020>
1c00a074:	00e8f8b3          	and	a7,a7,a4
1c00a078:	0108e863          	bltu	a7,a6,1c00a088 <rt_event_push_delayed+0x50>
1c00a07c:	ca09                	beqz	a2,1c00a08e <rt_event_push_delayed+0x56>
1c00a07e:	ce08                	sw	a0,24(a2)
1c00a080:	cd1c                	sw	a5,24(a0)
1c00a082:	30031073          	csrw	mstatus,t1
1c00a086:	8082                	ret
1c00a088:	863e                	mv	a2,a5
1c00a08a:	4f9c                	lw	a5,24(a5)
1c00a08c:	b7cd                	j	1c00a06e <rt_event_push_delayed+0x36>
1c00a08e:	cd1c                	sw	a5,24(a0)
1c00a090:	1a10b7b7          	lui	a5,0x1a10b
1c00a094:	47d8                	lw	a4,12(a5)
1c00a096:	22a6a023          	sw	a0,544(a3) # 1a10b220 <__l1_end+0xa10920c>
1c00a09a:	95ba                	add	a1,a1,a4
1c00a09c:	cbcc                	sw	a1,20(a5)
1c00a09e:	08500713          	li	a4,133
1c00a0a2:	c3d8                	sw	a4,4(a5)
1c00a0a4:	bff9                	j	1c00a082 <rt_event_push_delayed+0x4a>

1c00a0a6 <rt_time_wait_us>:
1c00a0a6:	1101                	addi	sp,sp,-32
1c00a0a8:	85aa                	mv	a1,a0
1c00a0aa:	4501                	li	a0,0
1c00a0ac:	ce06                	sw	ra,28(sp)
1c00a0ae:	cc22                	sw	s0,24(sp)
1c00a0b0:	c62e                	sw	a1,12(sp)
1c00a0b2:	ae7ff0ef          	jal	ra,1c009b98 <rt_event_get_blocking>
1c00a0b6:	45b2                	lw	a1,12(sp)
1c00a0b8:	842a                	mv	s0,a0
1c00a0ba:	3fbd                	jal	1c00a038 <rt_event_push_delayed>
1c00a0bc:	8522                	mv	a0,s0
1c00a0be:	4462                	lw	s0,24(sp)
1c00a0c0:	40f2                	lw	ra,28(sp)
1c00a0c2:	6105                	addi	sp,sp,32
1c00a0c4:	b655                	j	1c009c68 <rt_event_wait>

1c00a0c6 <__rt_time_init>:
1c00a0c6:	1141                	addi	sp,sp,-16
1c00a0c8:	1c0017b7          	lui	a5,0x1c001
1c00a0cc:	2207a023          	sw	zero,544(a5) # 1c001220 <first_delayed>
1c00a0d0:	08300713          	li	a4,131
1c00a0d4:	1a10b7b7          	lui	a5,0x1a10b
1c00a0d8:	c606                	sw	ra,12(sp)
1c00a0da:	c422                	sw	s0,8(sp)
1c00a0dc:	1c00a5b7          	lui	a1,0x1c00a
1c00a0e0:	c3d8                	sw	a4,4(a5)
1c00a0e2:	15e58593          	addi	a1,a1,350 # 1c00a15e <__rt_timer_handler>
1c00a0e6:	452d                	li	a0,11
1c00a0e8:	bbeff0ef          	jal	ra,1c0094a6 <rt_irq_set_handler>
1c00a0ec:	f14027f3          	csrr	a5,mhartid
1c00a0f0:	8795                	srai	a5,a5,0x5
1c00a0f2:	6705                	lui	a4,0x1
1c00a0f4:	03f7f793          	andi	a5,a5,63
1c00a0f8:	46fd                	li	a3,31
1c00a0fa:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a0fe:	04d79863          	bne	a5,a3,1c00a14e <__rt_time_init+0x88>
1c00a102:	1a10a7b7          	lui	a5,0x1a10a
1c00a106:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c00a10a:	1c00a5b7          	lui	a1,0x1c00a
1c00a10e:	4601                	li	a2,0
1c00a110:	01458593          	addi	a1,a1,20 # 1c00a014 <__rt_time_poweroff>
1c00a114:	4509                	li	a0,2
1c00a116:	d20ff0ef          	jal	ra,1c009636 <__rt_cbsys_add>
1c00a11a:	1c00a5b7          	lui	a1,0x1c00a
1c00a11e:	842a                	mv	s0,a0
1c00a120:	4601                	li	a2,0
1c00a122:	02658593          	addi	a1,a1,38 # 1c00a026 <__rt_time_poweron>
1c00a126:	450d                	li	a0,3
1c00a128:	d0eff0ef          	jal	ra,1c009636 <__rt_cbsys_add>
1c00a12c:	8d41                	or	a0,a0,s0
1c00a12e:	c505                	beqz	a0,1c00a156 <__rt_time_init+0x90>
1c00a130:	f1402673          	csrr	a2,mhartid
1c00a134:	1c000537          	lui	a0,0x1c000
1c00a138:	40565593          	srai	a1,a2,0x5
1c00a13c:	03f5f593          	andi	a1,a1,63
1c00a140:	8a7d                	andi	a2,a2,31
1c00a142:	52c50513          	addi	a0,a0,1324 # 1c00052c <__DTOR_END__+0x240>
1c00a146:	015000ef          	jal	ra,1c00a95a <printf>
1c00a14a:	79c000ef          	jal	ra,1c00a8e6 <abort>
1c00a14e:	002047b7          	lui	a5,0x204
1c00a152:	cbd8                	sw	a4,20(a5)
1c00a154:	bf5d                	j	1c00a10a <__rt_time_init+0x44>
1c00a156:	40b2                	lw	ra,12(sp)
1c00a158:	4422                	lw	s0,8(sp)
1c00a15a:	0141                	addi	sp,sp,16
1c00a15c:	8082                	ret

1c00a15e <__rt_timer_handler>:
1c00a15e:	7179                	addi	sp,sp,-48
1c00a160:	ce36                	sw	a3,28(sp)
1c00a162:	cc3a                	sw	a4,24(sp)
1c00a164:	1a10b6b7          	lui	a3,0x1a10b
1c00a168:	1c001737          	lui	a4,0x1c001
1c00a16c:	d61a                	sw	t1,44(sp)
1c00a16e:	d032                	sw	a2,32(sp)
1c00a170:	ca3e                	sw	a5,20(sp)
1c00a172:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa108ff8>
1c00a176:	22072783          	lw	a5,544(a4) # 1c001220 <first_delayed>
1c00a17a:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a17e:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a182:	c842                	sw	a6,16(sp)
1c00a184:	80000837          	lui	a6,0x80000
1c00a188:	d42a                	sw	a0,40(sp)
1c00a18a:	d22e                	sw	a1,36(sp)
1c00a18c:	c646                	sw	a7,12(sp)
1c00a18e:	c472                	sw	t3,8(sp)
1c00a190:	4581                	li	a1,0
1c00a192:	4501                	li	a0,0
1c00a194:	ffe84813          	xori	a6,a6,-2
1c00a198:	efb9                	bnez	a5,1c00a1f6 <__rt_timer_handler+0x98>
1c00a19a:	c119                	beqz	a0,1c00a1a0 <__rt_timer_handler+0x42>
1c00a19c:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a1a0:	c199                	beqz	a1,1c00a1a6 <__rt_timer_handler+0x48>
1c00a1a2:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a1a6:	22072023          	sw	zero,544(a4)
1c00a1aa:	1a10b7b7          	lui	a5,0x1a10b
1c00a1ae:	08100713          	li	a4,129
1c00a1b2:	c3d8                	sw	a4,4(a5)
1c00a1b4:	6785                	lui	a5,0x1
1c00a1b6:	1a10a737          	lui	a4,0x1a10a
1c00a1ba:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a1be:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa107800>
1c00a1c2:	5332                	lw	t1,44(sp)
1c00a1c4:	5522                	lw	a0,40(sp)
1c00a1c6:	5592                	lw	a1,36(sp)
1c00a1c8:	5602                	lw	a2,32(sp)
1c00a1ca:	46f2                	lw	a3,28(sp)
1c00a1cc:	4762                	lw	a4,24(sp)
1c00a1ce:	47d2                	lw	a5,20(sp)
1c00a1d0:	4842                	lw	a6,16(sp)
1c00a1d2:	48b2                	lw	a7,12(sp)
1c00a1d4:	4e22                	lw	t3,8(sp)
1c00a1d6:	6145                	addi	sp,sp,48
1c00a1d8:	30200073          	mret
1c00a1dc:	0187a883          	lw	a7,24(a5)
1c00a1e0:	0007ac23          	sw	zero,24(a5)
1c00a1e4:	c611                	beqz	a2,1c00a1f0 <__rt_timer_handler+0x92>
1c00a1e6:	ce9c                	sw	a5,24(a3)
1c00a1e8:	86be                	mv	a3,a5
1c00a1ea:	4585                	li	a1,1
1c00a1ec:	87c6                	mv	a5,a7
1c00a1ee:	b76d                	j	1c00a198 <__rt_timer_handler+0x3a>
1c00a1f0:	863e                	mv	a2,a5
1c00a1f2:	4505                	li	a0,1
1c00a1f4:	bfd5                	j	1c00a1e8 <__rt_timer_handler+0x8a>
1c00a1f6:	0347a883          	lw	a7,52(a5)
1c00a1fa:	41130e33          	sub	t3,t1,a7
1c00a1fe:	fdc87fe3          	bleu	t3,a6,1c00a1dc <__rt_timer_handler+0x7e>
1c00a202:	c119                	beqz	a0,1c00a208 <__rt_timer_handler+0xaa>
1c00a204:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a208:	c199                	beqz	a1,1c00a20e <__rt_timer_handler+0xb0>
1c00a20a:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a20e:	22f72023          	sw	a5,544(a4)
1c00a212:	1a10b737          	lui	a4,0x1a10b
1c00a216:	475c                	lw	a5,12(a4)
1c00a218:	406787b3          	sub	a5,a5,t1
1c00a21c:	97c6                	add	a5,a5,a7
1c00a21e:	cb5c                	sw	a5,20(a4)
1c00a220:	08500793          	li	a5,133
1c00a224:	c35c                	sw	a5,4(a4)
1c00a226:	bf71                	j	1c00a1c2 <__rt_timer_handler+0x64>

1c00a228 <rt_periph_copy>:
1c00a228:	7179                	addi	sp,sp,-48
1c00a22a:	d422                	sw	s0,40(sp)
1c00a22c:	842a                	mv	s0,a0
1c00a22e:	d606                	sw	ra,44(sp)
1c00a230:	d226                	sw	s1,36(sp)
1c00a232:	d04a                	sw	s2,32(sp)
1c00a234:	30047973          	csrrci	s2,mstatus,8
1c00a238:	4015d493          	srai	s1,a1,0x1
1c00a23c:	1a102537          	lui	a0,0x1a102
1c00a240:	049e                	slli	s1,s1,0x7
1c00a242:	94aa                	add	s1,s1,a0
1c00a244:	00459513          	slli	a0,a1,0x4
1c00a248:	8941                	andi	a0,a0,16
1c00a24a:	94aa                	add	s1,s1,a0
1c00a24c:	853e                	mv	a0,a5
1c00a24e:	ef89                	bnez	a5,1c00a268 <rt_periph_copy+0x40>
1c00a250:	ce2e                	sw	a1,28(sp)
1c00a252:	cc32                	sw	a2,24(sp)
1c00a254:	ca36                	sw	a3,20(sp)
1c00a256:	c83a                	sw	a4,16(sp)
1c00a258:	c63e                	sw	a5,12(sp)
1c00a25a:	895ff0ef          	jal	ra,1c009aee <__rt_wait_event_prepare_blocking>
1c00a25e:	47b2                	lw	a5,12(sp)
1c00a260:	4742                	lw	a4,16(sp)
1c00a262:	46d2                	lw	a3,20(sp)
1c00a264:	4662                	lw	a2,24(sp)
1c00a266:	45f2                	lw	a1,28(sp)
1c00a268:	e419                	bnez	s0,1c00a276 <rt_periph_copy+0x4e>
1c00a26a:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa100020>
1c00a26e:	04052023          	sw	zero,64(a0)
1c00a272:	04052823          	sw	zero,80(a0)
1c00a276:	00c42803          	lw	a6,12(s0)
1c00a27a:	c054                	sw	a3,4(s0)
1c00a27c:	cc08                	sw	a0,24(s0)
1c00a27e:	00f87813          	andi	a6,a6,15
1c00a282:	4891                	li	a7,4
1c00a284:	01076713          	ori	a4,a4,16
1c00a288:	0708ec63          	bltu	a7,a6,1c00a300 <rt_periph_copy+0xd8>
1c00a28c:	04000893          	li	a7,64
1c00a290:	0596                	slli	a1,a1,0x5
1c00a292:	98ae                	add	a7,a7,a1
1c00a294:	0008a303          	lw	t1,0(a7)
1c00a298:	00042a23          	sw	zero,20(s0)
1c00a29c:	04000813          	li	a6,64
1c00a2a0:	02031663          	bnez	t1,1c00a2cc <rt_periph_copy+0xa4>
1c00a2a4:	0088a023          	sw	s0,0(a7)
1c00a2a8:	00b808b3          	add	a7,a6,a1
1c00a2ac:	0088a303          	lw	t1,8(a7)
1c00a2b0:	0088a223          	sw	s0,4(a7)
1c00a2b4:	02031163          	bnez	t1,1c00a2d6 <rt_periph_copy+0xae>
1c00a2b8:	0084a883          	lw	a7,8(s1)
1c00a2bc:	0208f893          	andi	a7,a7,32
1c00a2c0:	00089b63          	bnez	a7,1c00a2d6 <rt_periph_copy+0xae>
1c00a2c4:	c090                	sw	a2,0(s1)
1c00a2c6:	c0d4                	sw	a3,4(s1)
1c00a2c8:	c498                	sw	a4,8(s1)
1c00a2ca:	a005                	j	1c00a2ea <rt_periph_copy+0xc2>
1c00a2cc:	0048a883          	lw	a7,4(a7)
1c00a2d0:	0088aa23          	sw	s0,20(a7)
1c00a2d4:	bfd1                	j	1c00a2a8 <rt_periph_copy+0x80>
1c00a2d6:	00042823          	sw	zero,16(s0)
1c00a2da:	c010                	sw	a2,0(s0)
1c00a2dc:	c054                	sw	a3,4(s0)
1c00a2de:	c418                	sw	a4,8(s0)
1c00a2e0:	00031563          	bnez	t1,1c00a2ea <rt_periph_copy+0xc2>
1c00a2e4:	982e                	add	a6,a6,a1
1c00a2e6:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a2ea:	e399                	bnez	a5,1c00a2f0 <rt_periph_copy+0xc8>
1c00a2ec:	953ff0ef          	jal	ra,1c009c3e <__rt_wait_event>
1c00a2f0:	30091073          	csrw	mstatus,s2
1c00a2f4:	50b2                	lw	ra,44(sp)
1c00a2f6:	5422                	lw	s0,40(sp)
1c00a2f8:	5492                	lw	s1,36(sp)
1c00a2fa:	5902                	lw	s2,32(sp)
1c00a2fc:	6145                	addi	sp,sp,48
1c00a2fe:	8082                	ret
1c00a300:	4899                	li	a7,6
1c00a302:	ff1814e3          	bne	a6,a7,1c00a2ea <rt_periph_copy+0xc2>
1c00a306:	04000893          	li	a7,64
1c00a30a:	0596                	slli	a1,a1,0x5
1c00a30c:	98ae                	add	a7,a7,a1
1c00a30e:	0008a303          	lw	t1,0(a7)
1c00a312:	00042a23          	sw	zero,20(s0)
1c00a316:	04000813          	li	a6,64
1c00a31a:	00031f63          	bnez	t1,1c00a338 <rt_periph_copy+0x110>
1c00a31e:	0088a023          	sw	s0,0(a7)
1c00a322:	95c2                	add	a1,a1,a6
1c00a324:	c1c0                	sw	s0,4(a1)
1c00a326:	00031e63          	bnez	t1,1c00a342 <rt_periph_copy+0x11a>
1c00a32a:	02442803          	lw	a6,36(s0)
1c00a32e:	1a1025b7          	lui	a1,0x1a102
1c00a332:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa10010c>
1c00a336:	b779                	j	1c00a2c4 <rt_periph_copy+0x9c>
1c00a338:	0048a883          	lw	a7,4(a7)
1c00a33c:	0088aa23          	sw	s0,20(a7)
1c00a340:	b7cd                	j	1c00a322 <rt_periph_copy+0xfa>
1c00a342:	c418                	sw	a4,8(s0)
1c00a344:	4598                	lw	a4,8(a1)
1c00a346:	c010                	sw	a2,0(s0)
1c00a348:	c054                	sw	a3,4(s0)
1c00a34a:	00042823          	sw	zero,16(s0)
1c00a34e:	ff51                	bnez	a4,1c00a2ea <rt_periph_copy+0xc2>
1c00a350:	c580                	sw	s0,8(a1)
1c00a352:	bf61                	j	1c00a2ea <rt_periph_copy+0xc2>

1c00a354 <__rt_periph_init>:
1c00a354:	1c0085b7          	lui	a1,0x1c008
1c00a358:	04000693          	li	a3,64
1c00a35c:	4601                	li	a2,0
1c00a35e:	04000793          	li	a5,64
1c00a362:	1a1028b7          	lui	a7,0x1a102
1c00a366:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a36a:	4841                	li	a6,16
1c00a36c:	40165713          	srai	a4,a2,0x1
1c00a370:	00461513          	slli	a0,a2,0x4
1c00a374:	071e                	slli	a4,a4,0x7
1c00a376:	9746                	add	a4,a4,a7
1c00a378:	8941                	andi	a0,a0,16
1c00a37a:	972a                	add	a4,a4,a0
1c00a37c:	0006a023          	sw	zero,0(a3)
1c00a380:	0006a423          	sw	zero,8(a3)
1c00a384:	c6d8                	sw	a4,12(a3)
1c00a386:	cecc                	sw	a1,28(a3)
1c00a388:	0605                	addi	a2,a2,1
1c00a38a:	02068693          	addi	a3,a3,32
1c00a38e:	fd061fe3          	bne	a2,a6,1c00a36c <__rt_periph_init+0x18>
1c00a392:	1c008737          	lui	a4,0x1c008
1c00a396:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a39a:	2007a023          	sw	zero,512(a5)
1c00a39e:	20e7a423          	sw	a4,520(a5)
1c00a3a2:	20e7a623          	sw	a4,524(a5)
1c00a3a6:	20e7a823          	sw	a4,528(a5)
1c00a3aa:	20e7aa23          	sw	a4,532(a5)
1c00a3ae:	20e7ac23          	sw	a4,536(a5)
1c00a3b2:	20e7ae23          	sw	a4,540(a5)
1c00a3b6:	22e7a023          	sw	a4,544(a5)
1c00a3ba:	22e7a223          	sw	a4,548(a5)
1c00a3be:	2007a223          	sw	zero,516(a5)
1c00a3c2:	8082                	ret

1c00a3c4 <__rt_i2c_init>:
1c00a3c4:	1c0107b7          	lui	a5,0x1c010
1c00a3c8:	16878793          	addi	a5,a5,360 # 1c010168 <__cluster_text_end>
1c00a3cc:	00078223          	sb	zero,4(a5)
1c00a3d0:	00078a23          	sb	zero,20(a5)
1c00a3d4:	8082                	ret

1c00a3d6 <__rt_hyper_init>:
1c00a3d6:	1c001737          	lui	a4,0x1c001
1c00a3da:	26800793          	li	a5,616
1c00a3de:	1a072c23          	sw	zero,440(a4) # 1c0011b8 <__pi_hyper_cluster_reqs_first>
1c00a3e2:	577d                	li	a4,-1
1c00a3e4:	0007aa23          	sw	zero,20(a5)
1c00a3e8:	0207a823          	sw	zero,48(a5)
1c00a3ec:	cf98                	sw	a4,24(a5)
1c00a3ee:	8082                	ret

1c00a3f0 <__rt_spim_init>:
1c00a3f0:	1c0017b7          	lui	a5,0x1c001
1c00a3f4:	1a07ae23          	sw	zero,444(a5) # 1c0011bc <__rt_spim_open_count>
1c00a3f8:	8082                	ret

1c00a3fa <rt_is_fc>:
1c00a3fa:	f1402573          	csrr	a0,mhartid
1c00a3fe:	8515                	srai	a0,a0,0x5
1c00a400:	03f57513          	andi	a0,a0,63
1c00a404:	1505                	addi	a0,a0,-31
1c00a406:	00153513          	seqz	a0,a0
1c00a40a:	8082                	ret

1c00a40c <__rt_io_end_of_flush>:
1c00a40c:	1c0017b7          	lui	a5,0x1c001
1c00a410:	1c07a223          	sw	zero,452(a5) # 1c0011c4 <__rt_io_pending_flush>
1c00a414:	00052c23          	sw	zero,24(a0)
1c00a418:	8082                	ret

1c00a41a <__rt_io_uart_wait_req>:
1c00a41a:	1141                	addi	sp,sp,-16
1c00a41c:	c226                	sw	s1,4(sp)
1c00a41e:	84aa                	mv	s1,a0
1c00a420:	c606                	sw	ra,12(sp)
1c00a422:	c422                	sw	s0,8(sp)
1c00a424:	c04a                	sw	s2,0(sp)
1c00a426:	30047973          	csrrci	s2,mstatus,8
1c00a42a:	1c001437          	lui	s0,0x1c001
1c00a42e:	1c040413          	addi	s0,s0,448 # 1c0011c0 <__rt_io_event_current>
1c00a432:	4008                	lw	a0,0(s0)
1c00a434:	c509                	beqz	a0,1c00a43e <__rt_io_uart_wait_req+0x24>
1c00a436:	833ff0ef          	jal	ra,1c009c68 <rt_event_wait>
1c00a43a:	00042023          	sw	zero,0(s0)
1c00a43e:	4785                	li	a5,1
1c00a440:	08f48623          	sb	a5,140(s1)
1c00a444:	08d4c783          	lbu	a5,141(s1)
1c00a448:	00201737          	lui	a4,0x201
1c00a44c:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00a450:	04078793          	addi	a5,a5,64
1c00a454:	07da                	slli	a5,a5,0x16
1c00a456:	97ba                	add	a5,a5,a4
1c00a458:	0007a023          	sw	zero,0(a5)
1c00a45c:	30091073          	csrw	mstatus,s2
1c00a460:	40b2                	lw	ra,12(sp)
1c00a462:	4422                	lw	s0,8(sp)
1c00a464:	4492                	lw	s1,4(sp)
1c00a466:	4902                	lw	s2,0(sp)
1c00a468:	0141                	addi	sp,sp,16
1c00a46a:	8082                	ret

1c00a46c <__rt_io_start>:
1c00a46c:	1101                	addi	sp,sp,-32
1c00a46e:	0028                	addi	a0,sp,8
1c00a470:	ce06                	sw	ra,28(sp)
1c00a472:	cc22                	sw	s0,24(sp)
1c00a474:	7e1000ef          	jal	ra,1c00b454 <rt_uart_conf_init>
1c00a478:	4585                	li	a1,1
1c00a47a:	4501                	li	a0,0
1c00a47c:	e8aff0ef          	jal	ra,1c009b06 <rt_event_alloc>
1c00a480:	547d                	li	s0,-1
1c00a482:	ed1d                	bnez	a0,1c00a4c0 <__rt_io_start+0x54>
1c00a484:	1c0017b7          	lui	a5,0x1c001
1c00a488:	0c07a783          	lw	a5,192(a5) # 1c0010c0 <__rt_iodev_uart_baudrate>
1c00a48c:	842a                	mv	s0,a0
1c00a48e:	1c001537          	lui	a0,0x1c001
1c00a492:	e3ff6597          	auipc	a1,0xe3ff6
1c00a496:	b9658593          	addi	a1,a1,-1130 # 28 <__rt_sched>
1c00a49a:	10c50513          	addi	a0,a0,268 # 1c00110c <__rt_io_event>
1c00a49e:	c43e                	sw	a5,8(sp)
1c00a4a0:	e3cff0ef          	jal	ra,1c009adc <__rt_event_init>
1c00a4a4:	1c0017b7          	lui	a5,0x1c001
1c00a4a8:	1d07a503          	lw	a0,464(a5) # 1c0011d0 <__rt_iodev_uart_channel>
1c00a4ac:	4681                	li	a3,0
1c00a4ae:	4601                	li	a2,0
1c00a4b0:	002c                	addi	a1,sp,8
1c00a4b2:	050d                	addi	a0,a0,3
1c00a4b4:	7b1000ef          	jal	ra,1c00b464 <__rt_uart_open>
1c00a4b8:	1c0017b7          	lui	a5,0x1c001
1c00a4bc:	1ca7a423          	sw	a0,456(a5) # 1c0011c8 <_rt_io_uart>
1c00a4c0:	8522                	mv	a0,s0
1c00a4c2:	40f2                	lw	ra,28(sp)
1c00a4c4:	4462                	lw	s0,24(sp)
1c00a4c6:	6105                	addi	sp,sp,32
1c00a4c8:	8082                	ret

1c00a4ca <rt_event_execute.isra.2.constprop.11>:
1c00a4ca:	1141                	addi	sp,sp,-16
1c00a4cc:	c606                	sw	ra,12(sp)
1c00a4ce:	c422                	sw	s0,8(sp)
1c00a4d0:	30047473          	csrrci	s0,mstatus,8
1c00a4d4:	4585                	li	a1,1
1c00a4d6:	e3ff6517          	auipc	a0,0xe3ff6
1c00a4da:	b5250513          	addi	a0,a0,-1198 # 28 <__rt_sched>
1c00a4de:	f00ff0ef          	jal	ra,1c009bde <__rt_event_execute>
1c00a4e2:	30041073          	csrw	mstatus,s0
1c00a4e6:	40b2                	lw	ra,12(sp)
1c00a4e8:	4422                	lw	s0,8(sp)
1c00a4ea:	0141                	addi	sp,sp,16
1c00a4ec:	8082                	ret

1c00a4ee <__rt_io_lock>:
1c00a4ee:	1c0017b7          	lui	a5,0x1c001
1c00a4f2:	00c7a783          	lw	a5,12(a5) # 1c00100c <__hal_debug_struct+0x10>
1c00a4f6:	c791                	beqz	a5,1c00a502 <__rt_io_lock+0x14>
1c00a4f8:	1c0017b7          	lui	a5,0x1c001
1c00a4fc:	1c87a783          	lw	a5,456(a5) # 1c0011c8 <_rt_io_uart>
1c00a500:	c3a1                	beqz	a5,1c00a540 <__rt_io_lock+0x52>
1c00a502:	7171                	addi	sp,sp,-176
1c00a504:	d706                	sw	ra,172(sp)
1c00a506:	3dd5                	jal	1c00a3fa <rt_is_fc>
1c00a508:	1c0017b7          	lui	a5,0x1c001
1c00a50c:	c901                	beqz	a0,1c00a51c <__rt_io_lock+0x2e>
1c00a50e:	fdc78513          	addi	a0,a5,-36 # 1c000fdc <__rt_io_fc_lock>
1c00a512:	9b8ff0ef          	jal	ra,1c0096ca <__rt_fc_lock>
1c00a516:	50ba                	lw	ra,172(sp)
1c00a518:	614d                	addi	sp,sp,176
1c00a51a:	8082                	ret
1c00a51c:	002c                	addi	a1,sp,8
1c00a51e:	fdc78513          	addi	a0,a5,-36
1c00a522:	a1aff0ef          	jal	ra,1c00973c <__rt_fc_cluster_lock>
1c00a526:	4689                	li	a3,2
1c00a528:	00204737          	lui	a4,0x204
1c00a52c:	09c14783          	lbu	a5,156(sp)
1c00a530:	0ff7f793          	andi	a5,a5,255
1c00a534:	f3ed                	bnez	a5,1c00a516 <__rt_io_lock+0x28>
1c00a536:	c714                	sw	a3,8(a4)
1c00a538:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a53c:	c354                	sw	a3,4(a4)
1c00a53e:	b7fd                	j	1c00a52c <__rt_io_lock+0x3e>
1c00a540:	8082                	ret

1c00a542 <__rt_io_unlock>:
1c00a542:	1c0017b7          	lui	a5,0x1c001
1c00a546:	00c7a783          	lw	a5,12(a5) # 1c00100c <__hal_debug_struct+0x10>
1c00a54a:	c791                	beqz	a5,1c00a556 <__rt_io_unlock+0x14>
1c00a54c:	1c0017b7          	lui	a5,0x1c001
1c00a550:	1c87a783          	lw	a5,456(a5) # 1c0011c8 <_rt_io_uart>
1c00a554:	c3a1                	beqz	a5,1c00a594 <__rt_io_unlock+0x52>
1c00a556:	7171                	addi	sp,sp,-176
1c00a558:	d706                	sw	ra,172(sp)
1c00a55a:	3545                	jal	1c00a3fa <rt_is_fc>
1c00a55c:	1c0017b7          	lui	a5,0x1c001
1c00a560:	c901                	beqz	a0,1c00a570 <__rt_io_unlock+0x2e>
1c00a562:	fdc78513          	addi	a0,a5,-36 # 1c000fdc <__rt_io_fc_lock>
1c00a566:	9a0ff0ef          	jal	ra,1c009706 <__rt_fc_unlock>
1c00a56a:	50ba                	lw	ra,172(sp)
1c00a56c:	614d                	addi	sp,sp,176
1c00a56e:	8082                	ret
1c00a570:	002c                	addi	a1,sp,8
1c00a572:	fdc78513          	addi	a0,a5,-36
1c00a576:	9feff0ef          	jal	ra,1c009774 <__rt_fc_cluster_unlock>
1c00a57a:	4689                	li	a3,2
1c00a57c:	00204737          	lui	a4,0x204
1c00a580:	09c14783          	lbu	a5,156(sp)
1c00a584:	0ff7f793          	andi	a5,a5,255
1c00a588:	f3ed                	bnez	a5,1c00a56a <__rt_io_unlock+0x28>
1c00a58a:	c714                	sw	a3,8(a4)
1c00a58c:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a590:	c354                	sw	a3,4(a4)
1c00a592:	b7fd                	j	1c00a580 <__rt_io_unlock+0x3e>
1c00a594:	8082                	ret

1c00a596 <__rt_io_uart_wait_pending>:
1c00a596:	7135                	addi	sp,sp,-160
1c00a598:	cd22                	sw	s0,152(sp)
1c00a59a:	cf06                	sw	ra,156(sp)
1c00a59c:	cb26                	sw	s1,148(sp)
1c00a59e:	1c001437          	lui	s0,0x1c001
1c00a5a2:	1c442783          	lw	a5,452(s0) # 1c0011c4 <__rt_io_pending_flush>
1c00a5a6:	e39d                	bnez	a5,1c00a5cc <__rt_io_uart_wait_pending+0x36>
1c00a5a8:	1c001437          	lui	s0,0x1c001
1c00a5ac:	1c040413          	addi	s0,s0,448 # 1c0011c0 <__rt_io_event_current>
1c00a5b0:	4004                	lw	s1,0(s0)
1c00a5b2:	c881                	beqz	s1,1c00a5c2 <__rt_io_uart_wait_pending+0x2c>
1c00a5b4:	3599                	jal	1c00a3fa <rt_is_fc>
1c00a5b6:	cd19                	beqz	a0,1c00a5d4 <__rt_io_uart_wait_pending+0x3e>
1c00a5b8:	8526                	mv	a0,s1
1c00a5ba:	eaeff0ef          	jal	ra,1c009c68 <rt_event_wait>
1c00a5be:	00042023          	sw	zero,0(s0)
1c00a5c2:	40fa                	lw	ra,156(sp)
1c00a5c4:	446a                	lw	s0,152(sp)
1c00a5c6:	44da                	lw	s1,148(sp)
1c00a5c8:	610d                	addi	sp,sp,160
1c00a5ca:	8082                	ret
1c00a5cc:	3f9d                	jal	1c00a542 <__rt_io_unlock>
1c00a5ce:	3df5                	jal	1c00a4ca <rt_event_execute.isra.2.constprop.11>
1c00a5d0:	3f39                	jal	1c00a4ee <__rt_io_lock>
1c00a5d2:	bfc1                	j	1c00a5a2 <__rt_io_uart_wait_pending+0xc>
1c00a5d4:	f14027f3          	csrr	a5,mhartid
1c00a5d8:	8795                	srai	a5,a5,0x5
1c00a5da:	03f7f793          	andi	a5,a5,63
1c00a5de:	08f106a3          	sb	a5,141(sp)
1c00a5e2:	1c00a7b7          	lui	a5,0x1c00a
1c00a5e6:	41a78793          	addi	a5,a5,1050 # 1c00a41a <__rt_io_uart_wait_req>
1c00a5ea:	c03e                	sw	a5,0(sp)
1c00a5ec:	00010793          	mv	a5,sp
1c00a5f0:	4705                	li	a4,1
1c00a5f2:	c23e                	sw	a5,4(sp)
1c00a5f4:	850a                	mv	a0,sp
1c00a5f6:	1c0017b7          	lui	a5,0x1c001
1c00a5fa:	12e7a623          	sw	a4,300(a5) # 1c00112c <__rt_io_event+0x20>
1c00a5fe:	08010623          	sb	zero,140(sp)
1c00a602:	d002                	sw	zero,32(sp)
1c00a604:	d202                	sw	zero,36(sp)
1c00a606:	a15fe0ef          	jal	ra,1c00901a <__rt_cluster_push_fc_event>
1c00a60a:	4689                	li	a3,2
1c00a60c:	00204737          	lui	a4,0x204
1c00a610:	08c14783          	lbu	a5,140(sp)
1c00a614:	0ff7f793          	andi	a5,a5,255
1c00a618:	f7cd                	bnez	a5,1c00a5c2 <__rt_io_uart_wait_pending+0x2c>
1c00a61a:	c714                	sw	a3,8(a4)
1c00a61c:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a620:	c354                	sw	a3,4(a4)
1c00a622:	b7fd                	j	1c00a610 <__rt_io_uart_wait_pending+0x7a>

1c00a624 <__rt_io_stop>:
1c00a624:	1141                	addi	sp,sp,-16
1c00a626:	c422                	sw	s0,8(sp)
1c00a628:	1c001437          	lui	s0,0x1c001
1c00a62c:	c606                	sw	ra,12(sp)
1c00a62e:	1c840413          	addi	s0,s0,456 # 1c0011c8 <_rt_io_uart>
1c00a632:	3795                	jal	1c00a596 <__rt_io_uart_wait_pending>
1c00a634:	4008                	lw	a0,0(s0)
1c00a636:	4581                	li	a1,0
1c00a638:	6b5000ef          	jal	ra,1c00b4ec <rt_uart_close>
1c00a63c:	40b2                	lw	ra,12(sp)
1c00a63e:	00042023          	sw	zero,0(s0)
1c00a642:	4422                	lw	s0,8(sp)
1c00a644:	4501                	li	a0,0
1c00a646:	0141                	addi	sp,sp,16
1c00a648:	8082                	ret

1c00a64a <__rt_io_uart_flush.constprop.10>:
1c00a64a:	7131                	addi	sp,sp,-192
1c00a64c:	dd22                	sw	s0,184(sp)
1c00a64e:	df06                	sw	ra,188(sp)
1c00a650:	db26                	sw	s1,180(sp)
1c00a652:	d94a                	sw	s2,176(sp)
1c00a654:	d74e                	sw	s3,172(sp)
1c00a656:	d552                	sw	s4,168(sp)
1c00a658:	d356                	sw	s5,164(sp)
1c00a65a:	1c001437          	lui	s0,0x1c001
1c00a65e:	1c442783          	lw	a5,452(s0) # 1c0011c4 <__rt_io_pending_flush>
1c00a662:	1c440a13          	addi	s4,s0,452
1c00a666:	e7bd                	bnez	a5,1c00a6d4 <__rt_io_uart_flush.constprop.10+0x8a>
1c00a668:	1c0014b7          	lui	s1,0x1c001
1c00a66c:	ffc48793          	addi	a5,s1,-4 # 1c000ffc <__hal_debug_struct>
1c00a670:	4f80                	lw	s0,24(a5)
1c00a672:	ffc48a93          	addi	s5,s1,-4
1c00a676:	c431                	beqz	s0,1c00a6c2 <__rt_io_uart_flush.constprop.10+0x78>
1c00a678:	3349                	jal	1c00a3fa <rt_is_fc>
1c00a67a:	1c0017b7          	lui	a5,0x1c001
1c00a67e:	1c87a903          	lw	s2,456(a5) # 1c0011c8 <_rt_io_uart>
1c00a682:	1c0019b7          	lui	s3,0x1c001
1c00a686:	cd29                	beqz	a0,1c00a6e0 <__rt_io_uart_flush.constprop.10+0x96>
1c00a688:	1c00a5b7          	lui	a1,0x1c00a
1c00a68c:	4785                	li	a5,1
1c00a68e:	ffc48613          	addi	a2,s1,-4
1c00a692:	40c58593          	addi	a1,a1,1036 # 1c00a40c <__rt_io_end_of_flush>
1c00a696:	4501                	li	a0,0
1c00a698:	00fa2023          	sw	a5,0(s4)
1c00a69c:	ce2ff0ef          	jal	ra,1c009b7e <rt_event_get>
1c00a6a0:	00492583          	lw	a1,4(s2)
1c00a6a4:	87aa                	mv	a5,a0
1c00a6a6:	4701                	li	a4,0
1c00a6a8:	0586                	slli	a1,a1,0x1
1c00a6aa:	86a2                	mv	a3,s0
1c00a6ac:	01898613          	addi	a2,s3,24 # 1c001018 <__hal_debug_struct+0x1c>
1c00a6b0:	0585                	addi	a1,a1,1
1c00a6b2:	4501                	li	a0,0
1c00a6b4:	b75ff0ef          	jal	ra,1c00a228 <rt_periph_copy>
1c00a6b8:	3569                	jal	1c00a542 <__rt_io_unlock>
1c00a6ba:	000a2783          	lw	a5,0(s4)
1c00a6be:	ef99                	bnez	a5,1c00a6dc <__rt_io_uart_flush.constprop.10+0x92>
1c00a6c0:	353d                	jal	1c00a4ee <__rt_io_lock>
1c00a6c2:	50fa                	lw	ra,188(sp)
1c00a6c4:	546a                	lw	s0,184(sp)
1c00a6c6:	54da                	lw	s1,180(sp)
1c00a6c8:	594a                	lw	s2,176(sp)
1c00a6ca:	59ba                	lw	s3,172(sp)
1c00a6cc:	5a2a                	lw	s4,168(sp)
1c00a6ce:	5a9a                	lw	s5,164(sp)
1c00a6d0:	6129                	addi	sp,sp,192
1c00a6d2:	8082                	ret
1c00a6d4:	35bd                	jal	1c00a542 <__rt_io_unlock>
1c00a6d6:	3bd5                	jal	1c00a4ca <rt_event_execute.isra.2.constprop.11>
1c00a6d8:	3d19                	jal	1c00a4ee <__rt_io_lock>
1c00a6da:	b751                	j	1c00a65e <__rt_io_uart_flush.constprop.10+0x14>
1c00a6dc:	33fd                	jal	1c00a4ca <rt_event_execute.isra.2.constprop.11>
1c00a6de:	bff1                	j	1c00a6ba <__rt_io_uart_flush.constprop.10+0x70>
1c00a6e0:	0054                	addi	a3,sp,4
1c00a6e2:	8622                	mv	a2,s0
1c00a6e4:	01898593          	addi	a1,s3,24
1c00a6e8:	854a                	mv	a0,s2
1c00a6ea:	64d000ef          	jal	ra,1c00b536 <rt_uart_cluster_write>
1c00a6ee:	4689                	li	a3,2
1c00a6f0:	00204737          	lui	a4,0x204
1c00a6f4:	09c14783          	lbu	a5,156(sp)
1c00a6f8:	0ff7f793          	andi	a5,a5,255
1c00a6fc:	c781                	beqz	a5,1c00a704 <__rt_io_uart_flush.constprop.10+0xba>
1c00a6fe:	000aac23          	sw	zero,24(s5)
1c00a702:	b7c1                	j	1c00a6c2 <__rt_io_uart_flush.constprop.10+0x78>
1c00a704:	c714                	sw	a3,8(a4)
1c00a706:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a70a:	c354                	sw	a3,4(a4)
1c00a70c:	b7e5                	j	1c00a6f4 <__rt_io_uart_flush.constprop.10+0xaa>

1c00a70e <memset>:
1c00a70e:	962a                	add	a2,a2,a0
1c00a710:	87aa                	mv	a5,a0
1c00a712:	00c79363          	bne	a5,a2,1c00a718 <memset+0xa>
1c00a716:	8082                	ret
1c00a718:	0785                	addi	a5,a5,1
1c00a71a:	feb78fa3          	sb	a1,-1(a5)
1c00a71e:	bfd5                	j	1c00a712 <memset+0x4>

1c00a720 <memcpy>:
1c00a720:	962a                	add	a2,a2,a0
1c00a722:	87aa                	mv	a5,a0
1c00a724:	00c79363          	bne	a5,a2,1c00a72a <memcpy+0xa>
1c00a728:	8082                	ret
1c00a72a:	0585                	addi	a1,a1,1
1c00a72c:	fff5c703          	lbu	a4,-1(a1)
1c00a730:	0785                	addi	a5,a5,1
1c00a732:	fee78fa3          	sb	a4,-1(a5)
1c00a736:	b7fd                	j	1c00a724 <memcpy+0x4>

1c00a738 <memmove>:
1c00a738:	40b507b3          	sub	a5,a0,a1
1c00a73c:	00c7e763          	bltu	a5,a2,1c00a74a <memmove+0x12>
1c00a740:	962e                	add	a2,a2,a1
1c00a742:	87aa                	mv	a5,a0
1c00a744:	00c59e63          	bne	a1,a2,1c00a760 <memmove+0x28>
1c00a748:	8082                	ret
1c00a74a:	167d                	addi	a2,a2,-1
1c00a74c:	00c587b3          	add	a5,a1,a2
1c00a750:	0007c703          	lbu	a4,0(a5)
1c00a754:	00c507b3          	add	a5,a0,a2
1c00a758:	00e78023          	sb	a4,0(a5)
1c00a75c:	f67d                	bnez	a2,1c00a74a <memmove+0x12>
1c00a75e:	8082                	ret
1c00a760:	0005c703          	lbu	a4,0(a1)
1c00a764:	0785                	addi	a5,a5,1
1c00a766:	0585                	addi	a1,a1,1
1c00a768:	fee78fa3          	sb	a4,-1(a5)
1c00a76c:	bfe1                	j	1c00a744 <memmove+0xc>

1c00a76e <strchr>:
1c00a76e:	0ff5f593          	andi	a1,a1,255
1c00a772:	00054783          	lbu	a5,0(a0)
1c00a776:	00b78563          	beq	a5,a1,1c00a780 <strchr+0x12>
1c00a77a:	e781                	bnez	a5,1c00a782 <strchr+0x14>
1c00a77c:	c191                	beqz	a1,1c00a780 <strchr+0x12>
1c00a77e:	4501                	li	a0,0
1c00a780:	8082                	ret
1c00a782:	0505                	addi	a0,a0,1
1c00a784:	b7fd                	j	1c00a772 <strchr+0x4>

1c00a786 <__rt_putc_debug_bridge>:
1c00a786:	1141                	addi	sp,sp,-16
1c00a788:	c422                	sw	s0,8(sp)
1c00a78a:	1c001437          	lui	s0,0x1c001
1c00a78e:	c226                	sw	s1,4(sp)
1c00a790:	c606                	sw	ra,12(sp)
1c00a792:	84aa                	mv	s1,a0
1c00a794:	ffc40413          	addi	s0,s0,-4 # 1c000ffc <__hal_debug_struct>
1c00a798:	485c                	lw	a5,20(s0)
1c00a79a:	c791                	beqz	a5,1c00a7a6 <__rt_putc_debug_bridge+0x20>
1c00a79c:	06400513          	li	a0,100
1c00a7a0:	907ff0ef          	jal	ra,1c00a0a6 <rt_time_wait_us>
1c00a7a4:	bfd5                	j	1c00a798 <__rt_putc_debug_bridge+0x12>
1c00a7a6:	4c1c                	lw	a5,24(s0)
1c00a7a8:	00178713          	addi	a4,a5,1
1c00a7ac:	97a2                	add	a5,a5,s0
1c00a7ae:	00978e23          	sb	s1,28(a5)
1c00a7b2:	cc18                	sw	a4,24(s0)
1c00a7b4:	4c14                	lw	a3,24(s0)
1c00a7b6:	08000793          	li	a5,128
1c00a7ba:	00f68563          	beq	a3,a5,1c00a7c4 <__rt_putc_debug_bridge+0x3e>
1c00a7be:	47a9                	li	a5,10
1c00a7c0:	00f49663          	bne	s1,a5,1c00a7cc <__rt_putc_debug_bridge+0x46>
1c00a7c4:	c701                	beqz	a4,1c00a7cc <__rt_putc_debug_bridge+0x46>
1c00a7c6:	c858                	sw	a4,20(s0)
1c00a7c8:	00042c23          	sw	zero,24(s0)
1c00a7cc:	4c1c                	lw	a5,24(s0)
1c00a7ce:	e799                	bnez	a5,1c00a7dc <__rt_putc_debug_bridge+0x56>
1c00a7d0:	4422                	lw	s0,8(sp)
1c00a7d2:	40b2                	lw	ra,12(sp)
1c00a7d4:	4492                	lw	s1,4(sp)
1c00a7d6:	0141                	addi	sp,sp,16
1c00a7d8:	946ff06f          	j	1c00991e <__rt_bridge_printf_flush>
1c00a7dc:	40b2                	lw	ra,12(sp)
1c00a7de:	4422                	lw	s0,8(sp)
1c00a7e0:	4492                	lw	s1,4(sp)
1c00a7e2:	0141                	addi	sp,sp,16
1c00a7e4:	8082                	ret

1c00a7e6 <__rt_putc_uart>:
1c00a7e6:	1101                	addi	sp,sp,-32
1c00a7e8:	c62a                	sw	a0,12(sp)
1c00a7ea:	ce06                	sw	ra,28(sp)
1c00a7ec:	336d                	jal	1c00a596 <__rt_io_uart_wait_pending>
1c00a7ee:	1c0017b7          	lui	a5,0x1c001
1c00a7f2:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__hal_debug_struct>
1c00a7f6:	4f94                	lw	a3,24(a5)
1c00a7f8:	4532                	lw	a0,12(sp)
1c00a7fa:	00168713          	addi	a4,a3,1
1c00a7fe:	cf98                	sw	a4,24(a5)
1c00a800:	97b6                	add	a5,a5,a3
1c00a802:	00a78e23          	sb	a0,28(a5)
1c00a806:	08000793          	li	a5,128
1c00a80a:	00f70563          	beq	a4,a5,1c00a814 <__rt_putc_uart+0x2e>
1c00a80e:	47a9                	li	a5,10
1c00a810:	00f51563          	bne	a0,a5,1c00a81a <__rt_putc_uart+0x34>
1c00a814:	40f2                	lw	ra,28(sp)
1c00a816:	6105                	addi	sp,sp,32
1c00a818:	bd0d                	j	1c00a64a <__rt_io_uart_flush.constprop.10>
1c00a81a:	40f2                	lw	ra,28(sp)
1c00a81c:	6105                	addi	sp,sp,32
1c00a81e:	8082                	ret

1c00a820 <tfp_putc.isra.8>:
1c00a820:	1c0017b7          	lui	a5,0x1c001
1c00a824:	1c87a783          	lw	a5,456(a5) # 1c0011c8 <_rt_io_uart>
1c00a828:	c391                	beqz	a5,1c00a82c <tfp_putc.isra.8+0xc>
1c00a82a:	bf75                	j	1c00a7e6 <__rt_putc_uart>
1c00a82c:	1c0017b7          	lui	a5,0x1c001
1c00a830:	00c7a783          	lw	a5,12(a5) # 1c00100c <__hal_debug_struct+0x10>
1c00a834:	c395                	beqz	a5,1c00a858 <tfp_putc.isra.8+0x38>
1c00a836:	6689                	lui	a3,0x2
1c00a838:	f14027f3          	csrr	a5,mhartid
1c00a83c:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a840:	00379713          	slli	a4,a5,0x3
1c00a844:	078a                	slli	a5,a5,0x2
1c00a846:	0ff77713          	andi	a4,a4,255
1c00a84a:	8ff5                	and	a5,a5,a3
1c00a84c:	97ba                	add	a5,a5,a4
1c00a84e:	1a10f737          	lui	a4,0x1a10f
1c00a852:	97ba                	add	a5,a5,a4
1c00a854:	c388                	sw	a0,0(a5)
1c00a856:	8082                	ret
1c00a858:	b73d                	j	1c00a786 <__rt_putc_debug_bridge>

1c00a85a <puts>:
1c00a85a:	1141                	addi	sp,sp,-16
1c00a85c:	c422                	sw	s0,8(sp)
1c00a85e:	c606                	sw	ra,12(sp)
1c00a860:	842a                	mv	s0,a0
1c00a862:	3171                	jal	1c00a4ee <__rt_io_lock>
1c00a864:	00044503          	lbu	a0,0(s0)
1c00a868:	c501                	beqz	a0,1c00a870 <puts+0x16>
1c00a86a:	3f5d                	jal	1c00a820 <tfp_putc.isra.8>
1c00a86c:	0405                	addi	s0,s0,1
1c00a86e:	bfdd                	j	1c00a864 <puts+0xa>
1c00a870:	4529                	li	a0,10
1c00a872:	377d                	jal	1c00a820 <tfp_putc.isra.8>
1c00a874:	31f9                	jal	1c00a542 <__rt_io_unlock>
1c00a876:	40b2                	lw	ra,12(sp)
1c00a878:	4422                	lw	s0,8(sp)
1c00a87a:	4501                	li	a0,0
1c00a87c:	0141                	addi	sp,sp,16
1c00a87e:	8082                	ret

1c00a880 <fputc_locked>:
1c00a880:	1141                	addi	sp,sp,-16
1c00a882:	c422                	sw	s0,8(sp)
1c00a884:	842a                	mv	s0,a0
1c00a886:	0ff57513          	andi	a0,a0,255
1c00a88a:	c606                	sw	ra,12(sp)
1c00a88c:	3f51                	jal	1c00a820 <tfp_putc.isra.8>
1c00a88e:	8522                	mv	a0,s0
1c00a890:	40b2                	lw	ra,12(sp)
1c00a892:	4422                	lw	s0,8(sp)
1c00a894:	0141                	addi	sp,sp,16
1c00a896:	8082                	ret

1c00a898 <_prf_locked>:
1c00a898:	1101                	addi	sp,sp,-32
1c00a89a:	ce06                	sw	ra,28(sp)
1c00a89c:	c02a                	sw	a0,0(sp)
1c00a89e:	c62e                	sw	a1,12(sp)
1c00a8a0:	c432                	sw	a2,8(sp)
1c00a8a2:	c236                	sw	a3,4(sp)
1c00a8a4:	31a9                	jal	1c00a4ee <__rt_io_lock>
1c00a8a6:	4692                	lw	a3,4(sp)
1c00a8a8:	4622                	lw	a2,8(sp)
1c00a8aa:	45b2                	lw	a1,12(sp)
1c00a8ac:	4502                	lw	a0,0(sp)
1c00a8ae:	2ae9                	jal	1c00aa88 <_prf>
1c00a8b0:	c02a                	sw	a0,0(sp)
1c00a8b2:	3941                	jal	1c00a542 <__rt_io_unlock>
1c00a8b4:	40f2                	lw	ra,28(sp)
1c00a8b6:	4502                	lw	a0,0(sp)
1c00a8b8:	6105                	addi	sp,sp,32
1c00a8ba:	8082                	ret

1c00a8bc <exit>:
1c00a8bc:	1141                	addi	sp,sp,-16
1c00a8be:	c606                	sw	ra,12(sp)
1c00a8c0:	c422                	sw	s0,8(sp)
1c00a8c2:	842a                	mv	s0,a0
1c00a8c4:	85aff0ef          	jal	ra,1c00991e <__rt_bridge_printf_flush>
1c00a8c8:	80000537          	lui	a0,0x80000
1c00a8cc:	1c0017b7          	lui	a5,0x1c001
1c00a8d0:	8c49                	or	s0,s0,a0
1c00a8d2:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__hal_debug_struct>
1c00a8d6:	c7c0                	sw	s0,12(a5)
1c00a8d8:	816ff0ef          	jal	ra,1c0098ee <__rt_bridge_send_notif>
1c00a8dc:	1a1047b7          	lui	a5,0x1a104
1c00a8e0:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa10208c>
1c00a8e4:	a001                	j	1c00a8e4 <exit+0x28>

1c00a8e6 <abort>:
1c00a8e6:	1141                	addi	sp,sp,-16
1c00a8e8:	557d                	li	a0,-1
1c00a8ea:	c606                	sw	ra,12(sp)
1c00a8ec:	3fc1                	jal	1c00a8bc <exit>

1c00a8ee <__rt_io_init>:
1c00a8ee:	1c0017b7          	lui	a5,0x1c001
1c00a8f2:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__rt_io_fc_lock>
1c00a8f6:	0007a223          	sw	zero,4(a5)
1c00a8fa:	0007a023          	sw	zero,0(a5)
1c00a8fe:	0007a623          	sw	zero,12(a5)
1c00a902:	1c0017b7          	lui	a5,0x1c001
1c00a906:	1c07a423          	sw	zero,456(a5) # 1c0011c8 <_rt_io_uart>
1c00a90a:	1c0017b7          	lui	a5,0x1c001
1c00a90e:	1c07a023          	sw	zero,448(a5) # 1c0011c0 <__rt_io_event_current>
1c00a912:	1c0017b7          	lui	a5,0x1c001
1c00a916:	1cc7a703          	lw	a4,460(a5) # 1c0011cc <__rt_iodev>
1c00a91a:	4785                	li	a5,1
1c00a91c:	02f71e63          	bne	a4,a5,1c00a958 <__rt_io_init+0x6a>
1c00a920:	1c00a5b7          	lui	a1,0x1c00a
1c00a924:	1141                	addi	sp,sp,-16
1c00a926:	4601                	li	a2,0
1c00a928:	46c58593          	addi	a1,a1,1132 # 1c00a46c <__rt_io_start>
1c00a92c:	4501                	li	a0,0
1c00a92e:	c606                	sw	ra,12(sp)
1c00a930:	d07fe0ef          	jal	ra,1c009636 <__rt_cbsys_add>
1c00a934:	1c00a5b7          	lui	a1,0x1c00a
1c00a938:	62458593          	addi	a1,a1,1572 # 1c00a624 <__rt_io_stop>
1c00a93c:	4601                	li	a2,0
1c00a93e:	4505                	li	a0,1
1c00a940:	cf7fe0ef          	jal	ra,1c009636 <__rt_cbsys_add>
1c00a944:	40b2                	lw	ra,12(sp)
1c00a946:	1c0017b7          	lui	a5,0x1c001
1c00a94a:	1c07a223          	sw	zero,452(a5) # 1c0011c4 <__rt_io_pending_flush>
1c00a94e:	4585                	li	a1,1
1c00a950:	4501                	li	a0,0
1c00a952:	0141                	addi	sp,sp,16
1c00a954:	9b2ff06f          	j	1c009b06 <rt_event_alloc>
1c00a958:	8082                	ret

1c00a95a <printf>:
1c00a95a:	7139                	addi	sp,sp,-64
1c00a95c:	d432                	sw	a2,40(sp)
1c00a95e:	862a                	mv	a2,a0
1c00a960:	1c00b537          	lui	a0,0x1c00b
1c00a964:	d22e                	sw	a1,36(sp)
1c00a966:	d636                	sw	a3,44(sp)
1c00a968:	4589                	li	a1,2
1c00a96a:	1054                	addi	a3,sp,36
1c00a96c:	88050513          	addi	a0,a0,-1920 # 1c00a880 <fputc_locked>
1c00a970:	ce06                	sw	ra,28(sp)
1c00a972:	d83a                	sw	a4,48(sp)
1c00a974:	da3e                	sw	a5,52(sp)
1c00a976:	dc42                	sw	a6,56(sp)
1c00a978:	de46                	sw	a7,60(sp)
1c00a97a:	c636                	sw	a3,12(sp)
1c00a97c:	3f31                	jal	1c00a898 <_prf_locked>
1c00a97e:	40f2                	lw	ra,28(sp)
1c00a980:	6121                	addi	sp,sp,64
1c00a982:	8082                	ret

1c00a984 <_to_x>:
1c00a984:	872a                	mv	a4,a0
1c00a986:	87aa                	mv	a5,a0
1c00a988:	4325                	li	t1,9
1c00a98a:	02c5f8b3          	remu	a7,a1,a2
1c00a98e:	02700513          	li	a0,39
1c00a992:	02c5d5b3          	divu	a1,a1,a2
1c00a996:	0ff8f813          	andi	a6,a7,255
1c00a99a:	01136363          	bltu	t1,a7,1c00a9a0 <_to_x+0x1c>
1c00a99e:	4501                	li	a0,0
1c00a9a0:	03080813          	addi	a6,a6,48
1c00a9a4:	0785                	addi	a5,a5,1
1c00a9a6:	9542                	add	a0,a0,a6
1c00a9a8:	fea78fa3          	sb	a0,-1(a5)
1c00a9ac:	fdf9                	bnez	a1,1c00a98a <_to_x+0x6>
1c00a9ae:	03000613          	li	a2,48
1c00a9b2:	40e78533          	sub	a0,a5,a4
1c00a9b6:	00d54863          	blt	a0,a3,1c00a9c6 <_to_x+0x42>
1c00a9ba:	00078023          	sb	zero,0(a5)
1c00a9be:	17fd                	addi	a5,a5,-1
1c00a9c0:	00f76763          	bltu	a4,a5,1c00a9ce <_to_x+0x4a>
1c00a9c4:	8082                	ret
1c00a9c6:	0785                	addi	a5,a5,1
1c00a9c8:	fec78fa3          	sb	a2,-1(a5)
1c00a9cc:	b7dd                	j	1c00a9b2 <_to_x+0x2e>
1c00a9ce:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10cfec>
1c00a9d2:	0007c683          	lbu	a3,0(a5)
1c00a9d6:	0705                	addi	a4,a4,1
1c00a9d8:	00c78023          	sb	a2,0(a5)
1c00a9dc:	fed70fa3          	sb	a3,-1(a4)
1c00a9e0:	17fd                	addi	a5,a5,-1
1c00a9e2:	bff9                	j	1c00a9c0 <_to_x+0x3c>

1c00a9e4 <_rlrshift>:
1c00a9e4:	411c                	lw	a5,0(a0)
1c00a9e6:	4154                	lw	a3,4(a0)
1c00a9e8:	0017f713          	andi	a4,a5,1
1c00a9ec:	01f69613          	slli	a2,a3,0x1f
1c00a9f0:	8385                	srli	a5,a5,0x1
1c00a9f2:	8fd1                	or	a5,a5,a2
1c00a9f4:	97ba                	add	a5,a5,a4
1c00a9f6:	8285                	srli	a3,a3,0x1
1c00a9f8:	00e7b733          	sltu	a4,a5,a4
1c00a9fc:	9736                	add	a4,a4,a3
1c00a9fe:	c11c                	sw	a5,0(a0)
1c00aa00:	c158                	sw	a4,4(a0)
1c00aa02:	8082                	ret

1c00aa04 <_ldiv5>:
1c00aa04:	4118                	lw	a4,0(a0)
1c00aa06:	4154                	lw	a3,4(a0)
1c00aa08:	4615                	li	a2,5
1c00aa0a:	00270793          	addi	a5,a4,2
1c00aa0e:	00e7b733          	sltu	a4,a5,a4
1c00aa12:	9736                	add	a4,a4,a3
1c00aa14:	02c755b3          	divu	a1,a4,a2
1c00aa18:	02b606b3          	mul	a3,a2,a1
1c00aa1c:	8f15                	sub	a4,a4,a3
1c00aa1e:	01d71693          	slli	a3,a4,0x1d
1c00aa22:	0037d713          	srli	a4,a5,0x3
1c00aa26:	8f55                	or	a4,a4,a3
1c00aa28:	02c75733          	divu	a4,a4,a2
1c00aa2c:	01d75693          	srli	a3,a4,0x1d
1c00aa30:	070e                	slli	a4,a4,0x3
1c00aa32:	95b6                	add	a1,a1,a3
1c00aa34:	02e606b3          	mul	a3,a2,a4
1c00aa38:	8f95                	sub	a5,a5,a3
1c00aa3a:	02c7d7b3          	divu	a5,a5,a2
1c00aa3e:	973e                	add	a4,a4,a5
1c00aa40:	00f737b3          	sltu	a5,a4,a5
1c00aa44:	97ae                	add	a5,a5,a1
1c00aa46:	c118                	sw	a4,0(a0)
1c00aa48:	c15c                	sw	a5,4(a0)
1c00aa4a:	8082                	ret

1c00aa4c <_get_digit>:
1c00aa4c:	419c                	lw	a5,0(a1)
1c00aa4e:	03000713          	li	a4,48
1c00aa52:	02f05863          	blez	a5,1c00aa82 <_get_digit+0x36>
1c00aa56:	17fd                	addi	a5,a5,-1
1c00aa58:	4114                	lw	a3,0(a0)
1c00aa5a:	c19c                	sw	a5,0(a1)
1c00aa5c:	415c                	lw	a5,4(a0)
1c00aa5e:	4729                	li	a4,10
1c00aa60:	02d70633          	mul	a2,a4,a3
1c00aa64:	02f707b3          	mul	a5,a4,a5
1c00aa68:	c110                	sw	a2,0(a0)
1c00aa6a:	02d73733          	mulhu	a4,a4,a3
1c00aa6e:	100006b7          	lui	a3,0x10000
1c00aa72:	16fd                	addi	a3,a3,-1
1c00aa74:	97ba                	add	a5,a5,a4
1c00aa76:	01c7d713          	srli	a4,a5,0x1c
1c00aa7a:	8ff5                	and	a5,a5,a3
1c00aa7c:	03070713          	addi	a4,a4,48
1c00aa80:	c15c                	sw	a5,4(a0)
1c00aa82:	0ff77513          	andi	a0,a4,255
1c00aa86:	8082                	ret

1c00aa88 <_prf>:
1c00aa88:	714d                	addi	sp,sp,-336
1c00aa8a:	14912223          	sw	s1,324(sp)
1c00aa8e:	13312e23          	sw	s3,316(sp)
1c00aa92:	13812423          	sw	s8,296(sp)
1c00aa96:	14112623          	sw	ra,332(sp)
1c00aa9a:	14812423          	sw	s0,328(sp)
1c00aa9e:	15212023          	sw	s2,320(sp)
1c00aaa2:	13412c23          	sw	s4,312(sp)
1c00aaa6:	13512a23          	sw	s5,308(sp)
1c00aaaa:	13612823          	sw	s6,304(sp)
1c00aaae:	13712623          	sw	s7,300(sp)
1c00aab2:	13912223          	sw	s9,292(sp)
1c00aab6:	13a12023          	sw	s10,288(sp)
1c00aaba:	11b12e23          	sw	s11,284(sp)
1c00aabe:	cc2a                	sw	a0,24(sp)
1c00aac0:	ce2e                	sw	a1,28(sp)
1c00aac2:	84b2                	mv	s1,a2
1c00aac4:	8c36                	mv	s8,a3
1c00aac6:	4981                	li	s3,0
1c00aac8:	0004c503          	lbu	a0,0(s1)
1c00aacc:	00148b93          	addi	s7,s1,1
1c00aad0:	cd01                	beqz	a0,1c00aae8 <_prf+0x60>
1c00aad2:	02500793          	li	a5,37
1c00aad6:	14f50a63          	beq	a0,a5,1c00ac2a <_prf+0x1a2>
1c00aada:	45f2                	lw	a1,28(sp)
1c00aadc:	4762                	lw	a4,24(sp)
1c00aade:	9702                	jalr	a4
1c00aae0:	57fd                	li	a5,-1
1c00aae2:	04f51063          	bne	a0,a5,1c00ab22 <_prf+0x9a>
1c00aae6:	59fd                	li	s3,-1
1c00aae8:	14c12083          	lw	ra,332(sp)
1c00aaec:	14812403          	lw	s0,328(sp)
1c00aaf0:	854e                	mv	a0,s3
1c00aaf2:	14412483          	lw	s1,324(sp)
1c00aaf6:	14012903          	lw	s2,320(sp)
1c00aafa:	13c12983          	lw	s3,316(sp)
1c00aafe:	13812a03          	lw	s4,312(sp)
1c00ab02:	13412a83          	lw	s5,308(sp)
1c00ab06:	13012b03          	lw	s6,304(sp)
1c00ab0a:	12c12b83          	lw	s7,300(sp)
1c00ab0e:	12812c03          	lw	s8,296(sp)
1c00ab12:	12412c83          	lw	s9,292(sp)
1c00ab16:	12012d03          	lw	s10,288(sp)
1c00ab1a:	11c12d83          	lw	s11,284(sp)
1c00ab1e:	6171                	addi	sp,sp,336
1c00ab20:	8082                	ret
1c00ab22:	0985                	addi	s3,s3,1
1c00ab24:	8a62                	mv	s4,s8
1c00ab26:	84de                	mv	s1,s7
1c00ab28:	8c52                	mv	s8,s4
1c00ab2a:	bf79                	j	1c00aac8 <_prf+0x40>
1c00ab2c:	0f2a8663          	beq	s5,s2,1c00ac18 <_prf+0x190>
1c00ab30:	0d596963          	bltu	s2,s5,1c00ac02 <_prf+0x17a>
1c00ab34:	fa0a8ae3          	beqz	s5,1c00aae8 <_prf+0x60>
1c00ab38:	0dba8e63          	beq	s5,s11,1c00ac14 <_prf+0x18c>
1c00ab3c:	8ba6                	mv	s7,s1
1c00ab3e:	001b8493          	addi	s1,s7,1
1c00ab42:	fff4ca83          	lbu	s5,-1(s1)
1c00ab46:	1c0007b7          	lui	a5,0x1c000
1c00ab4a:	67c78513          	addi	a0,a5,1660 # 1c00067c <__DTOR_END__+0x390>
1c00ab4e:	85d6                	mv	a1,s5
1c00ab50:	c1fff0ef          	jal	ra,1c00a76e <strchr>
1c00ab54:	fd61                	bnez	a0,1c00ab2c <_prf+0xa4>
1c00ab56:	02a00693          	li	a3,42
1c00ab5a:	0eda9a63          	bne	s5,a3,1c00ac4e <_prf+0x1c6>
1c00ab5e:	000c2903          	lw	s2,0(s8)
1c00ab62:	004c0693          	addi	a3,s8,4
1c00ab66:	00095663          	bgez	s2,1c00ab72 <_prf+0xea>
1c00ab6a:	4705                	li	a4,1
1c00ab6c:	41200933          	neg	s2,s2
1c00ab70:	c63a                	sw	a4,12(sp)
1c00ab72:	0004ca83          	lbu	s5,0(s1)
1c00ab76:	8c36                	mv	s8,a3
1c00ab78:	002b8493          	addi	s1,s7,2
1c00ab7c:	0c800713          	li	a4,200
1c00ab80:	01277463          	bleu	s2,a4,1c00ab88 <_prf+0x100>
1c00ab84:	0c800913          	li	s2,200
1c00ab88:	02e00693          	li	a3,46
1c00ab8c:	5d7d                	li	s10,-1
1c00ab8e:	02da9463          	bne	s5,a3,1c00abb6 <_prf+0x12e>
1c00ab92:	0004c703          	lbu	a4,0(s1)
1c00ab96:	02a00793          	li	a5,42
1c00ab9a:	10f71063          	bne	a4,a5,1c00ac9a <_prf+0x212>
1c00ab9e:	000c2d03          	lw	s10,0(s8)
1c00aba2:	0485                	addi	s1,s1,1
1c00aba4:	0c11                	addi	s8,s8,4
1c00aba6:	0c800793          	li	a5,200
1c00abaa:	01a7d363          	ble	s10,a5,1c00abb0 <_prf+0x128>
1c00abae:	5d7d                	li	s10,-1
1c00abb0:	0004ca83          	lbu	s5,0(s1)
1c00abb4:	0485                	addi	s1,s1,1
1c00abb6:	1c0007b7          	lui	a5,0x1c000
1c00abba:	85d6                	mv	a1,s5
1c00abbc:	68478513          	addi	a0,a5,1668 # 1c000684 <__DTOR_END__+0x398>
1c00abc0:	bafff0ef          	jal	ra,1c00a76e <strchr>
1c00abc4:	c501                	beqz	a0,1c00abcc <_prf+0x144>
1c00abc6:	0004ca83          	lbu	s5,0(s1)
1c00abca:	0485                	addi	s1,s1,1
1c00abcc:	06700693          	li	a3,103
1c00abd0:	1356c263          	blt	a3,s5,1c00acf4 <_prf+0x26c>
1c00abd4:	06500693          	li	a3,101
1c00abd8:	1edadd63          	ble	a3,s5,1c00add2 <_prf+0x34a>
1c00abdc:	04700693          	li	a3,71
1c00abe0:	0d56c163          	blt	a3,s5,1c00aca2 <_prf+0x21a>
1c00abe4:	04500693          	li	a3,69
1c00abe8:	1edad563          	ble	a3,s5,1c00add2 <_prf+0x34a>
1c00abec:	ee0a8ee3          	beqz	s5,1c00aae8 <_prf+0x60>
1c00abf0:	02500713          	li	a4,37
1c00abf4:	68ea8263          	beq	s5,a4,1c00b278 <_prf+0x7f0>
1c00abf8:	0c800713          	li	a4,200
1c00abfc:	69575763          	ble	s5,a4,1c00b28a <_prf+0x802>
1c00ac00:	b5dd                	j	1c00aae6 <_prf+0x5e>
1c00ac02:	034a8163          	beq	s5,s4,1c00ac24 <_prf+0x19c>
1c00ac06:	016a8b63          	beq	s5,s6,1c00ac1c <_prf+0x194>
1c00ac0a:	f3aa99e3          	bne	s5,s10,1c00ab3c <_prf+0xb4>
1c00ac0e:	4785                	li	a5,1
1c00ac10:	ca3e                	sw	a5,20(sp)
1c00ac12:	b72d                	j	1c00ab3c <_prf+0xb4>
1c00ac14:	4405                	li	s0,1
1c00ac16:	b71d                	j	1c00ab3c <_prf+0xb4>
1c00ac18:	4c85                	li	s9,1
1c00ac1a:	b70d                	j	1c00ab3c <_prf+0xb4>
1c00ac1c:	03000713          	li	a4,48
1c00ac20:	c83a                	sw	a4,16(sp)
1c00ac22:	bf29                	j	1c00ab3c <_prf+0xb4>
1c00ac24:	4785                	li	a5,1
1c00ac26:	c63e                	sw	a5,12(sp)
1c00ac28:	bf11                	j	1c00ab3c <_prf+0xb4>
1c00ac2a:	02000713          	li	a4,32
1c00ac2e:	c83a                	sw	a4,16(sp)
1c00ac30:	4401                	li	s0,0
1c00ac32:	ca02                	sw	zero,20(sp)
1c00ac34:	c602                	sw	zero,12(sp)
1c00ac36:	4c81                	li	s9,0
1c00ac38:	02300913          	li	s2,35
1c00ac3c:	02d00a13          	li	s4,45
1c00ac40:	03000b13          	li	s6,48
1c00ac44:	02b00d13          	li	s10,43
1c00ac48:	02000d93          	li	s11,32
1c00ac4c:	bdcd                	j	1c00ab3e <_prf+0xb6>
1c00ac4e:	fd0a8693          	addi	a3,s5,-48
1c00ac52:	4625                	li	a2,9
1c00ac54:	4901                	li	s2,0
1c00ac56:	45a9                	li	a1,10
1c00ac58:	f2d662e3          	bltu	a2,a3,1c00ab7c <_prf+0xf4>
1c00ac5c:	000bc683          	lbu	a3,0(s7)
1c00ac60:	001b8493          	addi	s1,s7,1
1c00ac64:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xfff1fe4>
1c00ac68:	8ab6                	mv	s5,a3
1c00ac6a:	f0e669e3          	bltu	a2,a4,1c00ab7c <_prf+0xf4>
1c00ac6e:	02b90933          	mul	s2,s2,a1
1c00ac72:	8ba6                	mv	s7,s1
1c00ac74:	9936                	add	s2,s2,a3
1c00ac76:	fd090913          	addi	s2,s2,-48
1c00ac7a:	b7cd                	j	1c00ac5c <_prf+0x1d4>
1c00ac7c:	02ad0733          	mul	a4,s10,a0
1c00ac80:	84ae                	mv	s1,a1
1c00ac82:	973e                	add	a4,a4,a5
1c00ac84:	fd070d13          	addi	s10,a4,-48
1c00ac88:	0004c783          	lbu	a5,0(s1)
1c00ac8c:	00148593          	addi	a1,s1,1
1c00ac90:	fd078613          	addi	a2,a5,-48
1c00ac94:	fec6f4e3          	bleu	a2,a3,1c00ac7c <_prf+0x1f4>
1c00ac98:	b739                	j	1c00aba6 <_prf+0x11e>
1c00ac9a:	4d01                	li	s10,0
1c00ac9c:	46a5                	li	a3,9
1c00ac9e:	4529                	li	a0,10
1c00aca0:	b7e5                	j	1c00ac88 <_prf+0x200>
1c00aca2:	06300693          	li	a3,99
1c00aca6:	0cda8b63          	beq	s5,a3,1c00ad7c <_prf+0x2f4>
1c00acaa:	0756c563          	blt	a3,s5,1c00ad14 <_prf+0x28c>
1c00acae:	05800693          	li	a3,88
1c00acb2:	f4da93e3          	bne	s5,a3,1c00abf8 <_prf+0x170>
1c00acb6:	04410b93          	addi	s7,sp,68
1c00acba:	004c0a13          	addi	s4,s8,4
1c00acbe:	000c2583          	lw	a1,0(s8)
1c00acc2:	845e                	mv	s0,s7
1c00acc4:	000c8963          	beqz	s9,1c00acd6 <_prf+0x24e>
1c00acc8:	76e1                	lui	a3,0xffff8
1c00acca:	8306c693          	xori	a3,a3,-2000
1c00acce:	04d11223          	sh	a3,68(sp)
1c00acd2:	04610413          	addi	s0,sp,70
1c00acd6:	86ea                	mv	a3,s10
1c00acd8:	4641                	li	a2,16
1c00acda:	8522                	mv	a0,s0
1c00acdc:	3165                	jal	1c00a984 <_to_x>
1c00acde:	05800693          	li	a3,88
1c00ace2:	58da8863          	beq	s5,a3,1c00b272 <_prf+0x7ea>
1c00ace6:	41740433          	sub	s0,s0,s7
1c00acea:	9522                	add	a0,a0,s0
1c00acec:	01903433          	snez	s0,s9
1c00acf0:	0406                	slli	s0,s0,0x1
1c00acf2:	a8c9                	j	1c00adc4 <_prf+0x33c>
1c00acf4:	07000693          	li	a3,112
1c00acf8:	50da8163          	beq	s5,a3,1c00b1fa <_prf+0x772>
1c00acfc:	0556c163          	blt	a3,s5,1c00ad3e <_prf+0x2b6>
1c00ad00:	06e00693          	li	a3,110
1c00ad04:	46da8b63          	beq	s5,a3,1c00b17a <_prf+0x6f2>
1c00ad08:	4956c063          	blt	a3,s5,1c00b188 <_prf+0x700>
1c00ad0c:	06900693          	li	a3,105
1c00ad10:	eeda94e3          	bne	s5,a3,1c00abf8 <_prf+0x170>
1c00ad14:	000c2a83          	lw	s5,0(s8)
1c00ad18:	004c0a13          	addi	s4,s8,4
1c00ad1c:	04410b13          	addi	s6,sp,68
1c00ad20:	060ad963          	bgez	s5,1c00ad92 <_prf+0x30a>
1c00ad24:	02d00693          	li	a3,45
1c00ad28:	04d10223          	sb	a3,68(sp)
1c00ad2c:	800006b7          	lui	a3,0x80000
1c00ad30:	415005b3          	neg	a1,s5
1c00ad34:	06da9963          	bne	s5,a3,1c00ada6 <_prf+0x31e>
1c00ad38:	800005b7          	lui	a1,0x80000
1c00ad3c:	a0ad                	j	1c00ada6 <_prf+0x31e>
1c00ad3e:	07500693          	li	a3,117
1c00ad42:	50da8063          	beq	s5,a3,1c00b242 <_prf+0x7ba>
1c00ad46:	07800693          	li	a3,120
1c00ad4a:	f6da86e3          	beq	s5,a3,1c00acb6 <_prf+0x22e>
1c00ad4e:	07300693          	li	a3,115
1c00ad52:	eada93e3          	bne	s5,a3,1c00abf8 <_prf+0x170>
1c00ad56:	000c2583          	lw	a1,0(s8)
1c00ad5a:	004c0a13          	addi	s4,s8,4
1c00ad5e:	4c81                	li	s9,0
1c00ad60:	0c800793          	li	a5,200
1c00ad64:	019586b3          	add	a3,a1,s9
1c00ad68:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00ad6c:	4a068f63          	beqz	a3,1c00b22a <_prf+0x7a2>
1c00ad70:	0c85                	addi	s9,s9,1
1c00ad72:	fefc99e3          	bne	s9,a5,1c00ad64 <_prf+0x2dc>
1c00ad76:	4a0d5c63          	bgez	s10,1c00b22e <_prf+0x7a6>
1c00ad7a:	a97d                	j	1c00b238 <_prf+0x7b0>
1c00ad7c:	000c2783          	lw	a5,0(s8)
1c00ad80:	004c0a13          	addi	s4,s8,4
1c00ad84:	040102a3          	sb	zero,69(sp)
1c00ad88:	04f10223          	sb	a5,68(sp)
1c00ad8c:	4c85                	li	s9,1
1c00ad8e:	4401                	li	s0,0
1c00ad90:	a105                	j	1c00b1b0 <_prf+0x728>
1c00ad92:	4752                	lw	a4,20(sp)
1c00ad94:	02b00693          	li	a3,43
1c00ad98:	e701                	bnez	a4,1c00ada0 <_prf+0x318>
1c00ad9a:	c41d                	beqz	s0,1c00adc8 <_prf+0x340>
1c00ad9c:	02000693          	li	a3,32
1c00ada0:	04d10223          	sb	a3,68(sp)
1c00ada4:	85d6                	mv	a1,s5
1c00ada6:	04510c13          	addi	s8,sp,69
1c00adaa:	86ea                	mv	a3,s10
1c00adac:	4629                	li	a2,10
1c00adae:	8562                	mv	a0,s8
1c00adb0:	bd5ff0ef          	jal	ra,1c00a984 <_to_x>
1c00adb4:	47d2                	lw	a5,20(sp)
1c00adb6:	9562                	add	a0,a0,s8
1c00adb8:	41650533          	sub	a0,a0,s6
1c00adbc:	eb89                	bnez	a5,1c00adce <_prf+0x346>
1c00adbe:	e019                	bnez	s0,1c00adc4 <_prf+0x33c>
1c00adc0:	01fad413          	srli	s0,s5,0x1f
1c00adc4:	57fd                	li	a5,-1
1c00adc6:	a9a1                	j	1c00b21e <_prf+0x796>
1c00adc8:	85d6                	mv	a1,s5
1c00adca:	8c5a                	mv	s8,s6
1c00adcc:	bff9                	j	1c00adaa <_prf+0x322>
1c00adce:	4452                	lw	s0,20(sp)
1c00add0:	bfd5                	j	1c00adc4 <_prf+0x33c>
1c00add2:	0c1d                	addi	s8,s8,7
1c00add4:	ff8c7c13          	andi	s8,s8,-8
1c00add8:	000c2883          	lw	a7,0(s8)
1c00addc:	004c2303          	lw	t1,4(s8)
1c00ade0:	80000737          	lui	a4,0x80000
1c00ade4:	0158d593          	srli	a1,a7,0x15
1c00ade8:	00b31693          	slli	a3,t1,0xb
1c00adec:	8ecd                	or	a3,a3,a1
1c00adee:	fff74713          	not	a4,a4
1c00adf2:	01435613          	srli	a2,t1,0x14
1c00adf6:	08ae                	slli	a7,a7,0xb
1c00adf8:	8ef9                	and	a3,a3,a4
1c00adfa:	7ff67613          	andi	a2,a2,2047
1c00adfe:	d846                	sw	a7,48(sp)
1c00ae00:	da36                	sw	a3,52(sp)
1c00ae02:	7ff00593          	li	a1,2047
1c00ae06:	008c0a13          	addi	s4,s8,8
1c00ae0a:	08b61d63          	bne	a2,a1,1c00aea4 <_prf+0x41c>
1c00ae0e:	00d0                	addi	a2,sp,68
1c00ae10:	8732                	mv	a4,a2
1c00ae12:	00035863          	bgez	t1,1c00ae22 <_prf+0x39a>
1c00ae16:	02d00713          	li	a4,45
1c00ae1a:	04e10223          	sb	a4,68(sp)
1c00ae1e:	04510713          	addi	a4,sp,69
1c00ae22:	00d8e6b3          	or	a3,a7,a3
1c00ae26:	fbfa8793          	addi	a5,s5,-65
1c00ae2a:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00ae2e:	eaa1                	bnez	a3,1c00ae7e <_prf+0x3f6>
1c00ae30:	46e5                	li	a3,25
1c00ae32:	02f6ee63          	bltu	a3,a5,1c00ae6e <_prf+0x3e6>
1c00ae36:	6795                	lui	a5,0x5
1c00ae38:	e4978793          	addi	a5,a5,-439 # 4e49 <_l1_preload_size+0x2e39>
1c00ae3c:	00f71023          	sh	a5,0(a4)
1c00ae40:	04600793          	li	a5,70
1c00ae44:	00f70123          	sb	a5,2(a4)
1c00ae48:	000701a3          	sb	zero,3(a4)
1c00ae4c:	8d11                	sub	a0,a0,a2
1c00ae4e:	47d2                	lw	a5,20(sp)
1c00ae50:	48079f63          	bnez	a5,1c00b2ee <_prf+0x866>
1c00ae54:	e419                	bnez	s0,1c00ae62 <_prf+0x3da>
1c00ae56:	04414403          	lbu	s0,68(sp)
1c00ae5a:	fd340413          	addi	s0,s0,-45
1c00ae5e:	00143413          	seqz	s0,s0
1c00ae62:	0c800793          	li	a5,200
1c00ae66:	c8a7c0e3          	blt	a5,a0,1c00aae6 <_prf+0x5e>
1c00ae6a:	8caa                	mv	s9,a0
1c00ae6c:	a691                	j	1c00b1b0 <_prf+0x728>
1c00ae6e:	679d                	lui	a5,0x7
1c00ae70:	e6978793          	addi	a5,a5,-407 # 6e69 <_l1_preload_size+0x4e59>
1c00ae74:	00f71023          	sh	a5,0(a4)
1c00ae78:	06600793          	li	a5,102
1c00ae7c:	b7e1                	j	1c00ae44 <_prf+0x3bc>
1c00ae7e:	46e5                	li	a3,25
1c00ae80:	00f6ea63          	bltu	a3,a5,1c00ae94 <_prf+0x40c>
1c00ae84:	6791                	lui	a5,0x4
1c00ae86:	14e78793          	addi	a5,a5,334 # 414e <_l1_preload_size+0x213e>
1c00ae8a:	00f71023          	sh	a5,0(a4)
1c00ae8e:	04e00793          	li	a5,78
1c00ae92:	bf4d                	j	1c00ae44 <_prf+0x3bc>
1c00ae94:	6799                	lui	a5,0x6
1c00ae96:	16e78793          	addi	a5,a5,366 # 616e <_l1_preload_size+0x415e>
1c00ae9a:	00f71023          	sh	a5,0(a4)
1c00ae9e:	06e00793          	li	a5,110
1c00aea2:	b74d                	j	1c00ae44 <_prf+0x3bc>
1c00aea4:	04600593          	li	a1,70
1c00aea8:	00ba9463          	bne	s5,a1,1c00aeb0 <_prf+0x428>
1c00aeac:	06600a93          	li	s5,102
1c00aeb0:	011665b3          	or	a1,a2,a7
1c00aeb4:	8dd5                	or	a1,a1,a3
1c00aeb6:	c9c9                	beqz	a1,1c00af48 <_prf+0x4c0>
1c00aeb8:	800007b7          	lui	a5,0x80000
1c00aebc:	8edd                	or	a3,a3,a5
1c00aebe:	da36                	sw	a3,52(sp)
1c00aec0:	d846                	sw	a7,48(sp)
1c00aec2:	c0260c13          	addi	s8,a2,-1022
1c00aec6:	02d00693          	li	a3,45
1c00aeca:	00034b63          	bltz	t1,1c00aee0 <_prf+0x458>
1c00aece:	4752                	lw	a4,20(sp)
1c00aed0:	02b00693          	li	a3,43
1c00aed4:	e711                	bnez	a4,1c00aee0 <_prf+0x458>
1c00aed6:	04410b13          	addi	s6,sp,68
1c00aeda:	c419                	beqz	s0,1c00aee8 <_prf+0x460>
1c00aedc:	02000693          	li	a3,32
1c00aee0:	04d10223          	sb	a3,68(sp)
1c00aee4:	04510b13          	addi	s6,sp,69
1c00aee8:	4b81                	li	s7,0
1c00aeea:	55f9                	li	a1,-2
1c00aeec:	06bc4363          	blt	s8,a1,1c00af52 <_prf+0x4ca>
1c00aef0:	0b804a63          	bgtz	s8,1c00afa4 <_prf+0x51c>
1c00aef4:	4d91                	li	s11,4
1c00aef6:	1808                	addi	a0,sp,48
1c00aef8:	0c05                	addi	s8,s8,1
1c00aefa:	aebff0ef          	jal	ra,1c00a9e4 <_rlrshift>
1c00aefe:	ffbc1ce3          	bne	s8,s11,1c00aef6 <_prf+0x46e>
1c00af02:	000d5363          	bgez	s10,1c00af08 <_prf+0x480>
1c00af06:	4d19                	li	s10,6
1c00af08:	fdfaf593          	andi	a1,s5,-33
1c00af0c:	04700513          	li	a0,71
1c00af10:	0ca59663          	bne	a1,a0,1c00afdc <_prf+0x554>
1c00af14:	4c01                	li	s8,0
1c00af16:	000c9463          	bnez	s9,1c00af1e <_prf+0x496>
1c00af1a:	01a03c33          	snez	s8,s10
1c00af1e:	55f5                	li	a1,-3
1c00af20:	00bbc663          	blt	s7,a1,1c00af2c <_prf+0x4a4>
1c00af24:	001d0593          	addi	a1,s10,1
1c00af28:	0b75df63          	ble	s7,a1,1c00afe6 <_prf+0x55e>
1c00af2c:	06700593          	li	a1,103
1c00af30:	14ba8c63          	beq	s5,a1,1c00b088 <_prf+0x600>
1c00af34:	04500a93          	li	s5,69
1c00af38:	001d0593          	addi	a1,s10,1
1c00af3c:	4541                	li	a0,16
1c00af3e:	d62a                	sw	a0,44(sp)
1c00af40:	0ab55c63          	ble	a1,a0,1c00aff8 <_prf+0x570>
1c00af44:	45c1                	li	a1,16
1c00af46:	a84d                	j	1c00aff8 <_prf+0x570>
1c00af48:	4c01                	li	s8,0
1c00af4a:	b751                	j	1c00aece <_prf+0x446>
1c00af4c:	1808                	addi	a0,sp,48
1c00af4e:	a97ff0ef          	jal	ra,1c00a9e4 <_rlrshift>
1c00af52:	55d2                	lw	a1,52(sp)
1c00af54:	333337b7          	lui	a5,0x33333
1c00af58:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732119a>
1c00af5c:	5342                	lw	t1,48(sp)
1c00af5e:	0c05                	addi	s8,s8,1
1c00af60:	feb7e6e3          	bltu	a5,a1,1c00af4c <_prf+0x4c4>
1c00af64:	4895                	li	a7,5
1c00af66:	02b88533          	mul	a0,a7,a1
1c00af6a:	1bfd                	addi	s7,s7,-1
1c00af6c:	0268b5b3          	mulhu	a1,a7,t1
1c00af70:	026888b3          	mul	a7,a7,t1
1c00af74:	95aa                	add	a1,a1,a0
1c00af76:	da2e                	sw	a1,52(sp)
1c00af78:	4501                	li	a0,0
1c00af7a:	d846                	sw	a7,48(sp)
1c00af7c:	800006b7          	lui	a3,0x80000
1c00af80:	fff6c693          	not	a3,a3
1c00af84:	00b6f663          	bleu	a1,a3,1c00af90 <_prf+0x508>
1c00af88:	d12d                	beqz	a0,1c00aeea <_prf+0x462>
1c00af8a:	d846                	sw	a7,48(sp)
1c00af8c:	da2e                	sw	a1,52(sp)
1c00af8e:	bfb1                	j	1c00aeea <_prf+0x462>
1c00af90:	01f8d313          	srli	t1,a7,0x1f
1c00af94:	00159513          	slli	a0,a1,0x1
1c00af98:	00a365b3          	or	a1,t1,a0
1c00af9c:	0886                	slli	a7,a7,0x1
1c00af9e:	1c7d                	addi	s8,s8,-1
1c00afa0:	4505                	li	a0,1
1c00afa2:	bfe9                	j	1c00af7c <_prf+0x4f4>
1c00afa4:	1808                	addi	a0,sp,48
1c00afa6:	a5fff0ef          	jal	ra,1c00aa04 <_ldiv5>
1c00afaa:	58c2                	lw	a7,48(sp)
1c00afac:	55d2                	lw	a1,52(sp)
1c00afae:	1c7d                	addi	s8,s8,-1
1c00afb0:	0b85                	addi	s7,s7,1
1c00afb2:	4501                	li	a0,0
1c00afb4:	80000737          	lui	a4,0x80000
1c00afb8:	fff74713          	not	a4,a4
1c00afbc:	00b77663          	bleu	a1,a4,1c00afc8 <_prf+0x540>
1c00afc0:	d905                	beqz	a0,1c00aef0 <_prf+0x468>
1c00afc2:	d846                	sw	a7,48(sp)
1c00afc4:	da2e                	sw	a1,52(sp)
1c00afc6:	b72d                	j	1c00aef0 <_prf+0x468>
1c00afc8:	01f8d313          	srli	t1,a7,0x1f
1c00afcc:	00159513          	slli	a0,a1,0x1
1c00afd0:	00a365b3          	or	a1,t1,a0
1c00afd4:	0886                	slli	a7,a7,0x1
1c00afd6:	1c7d                	addi	s8,s8,-1
1c00afd8:	4505                	li	a0,1
1c00afda:	bfe9                	j	1c00afb4 <_prf+0x52c>
1c00afdc:	06600593          	li	a1,102
1c00afe0:	4c01                	li	s8,0
1c00afe2:	f4ba9be3          	bne	s5,a1,1c00af38 <_prf+0x4b0>
1c00afe6:	01ab85b3          	add	a1,s7,s10
1c00afea:	06600a93          	li	s5,102
1c00afee:	f405d7e3          	bgez	a1,1c00af3c <_prf+0x4b4>
1c00aff2:	45c1                	li	a1,16
1c00aff4:	d62e                	sw	a1,44(sp)
1c00aff6:	4581                	li	a1,0
1c00aff8:	4301                	li	t1,0
1c00affa:	080003b7          	lui	t2,0x8000
1c00affe:	dc1a                	sw	t1,56(sp)
1c00b000:	de1e                	sw	t2,60(sp)
1c00b002:	5dfd                	li	s11,-1
1c00b004:	15fd                	addi	a1,a1,-1
1c00b006:	09b59463          	bne	a1,s11,1c00b08e <_prf+0x606>
1c00b00a:	55c2                	lw	a1,48(sp)
1c00b00c:	5562                	lw	a0,56(sp)
1c00b00e:	58d2                	lw	a7,52(sp)
1c00b010:	5372                	lw	t1,60(sp)
1c00b012:	952e                	add	a0,a0,a1
1c00b014:	00b535b3          	sltu	a1,a0,a1
1c00b018:	989a                	add	a7,a7,t1
1c00b01a:	95c6                	add	a1,a1,a7
1c00b01c:	d82a                	sw	a0,48(sp)
1c00b01e:	f0000537          	lui	a0,0xf0000
1c00b022:	da2e                	sw	a1,52(sp)
1c00b024:	8de9                	and	a1,a1,a0
1c00b026:	c981                	beqz	a1,1c00b036 <_prf+0x5ae>
1c00b028:	1808                	addi	a0,sp,48
1c00b02a:	9dbff0ef          	jal	ra,1c00aa04 <_ldiv5>
1c00b02e:	1808                	addi	a0,sp,48
1c00b030:	9b5ff0ef          	jal	ra,1c00a9e4 <_rlrshift>
1c00b034:	0b85                	addi	s7,s7,1
1c00b036:	06600593          	li	a1,102
1c00b03a:	001b0d93          	addi	s11,s6,1
1c00b03e:	08ba9663          	bne	s5,a1,1c00b0ca <_prf+0x642>
1c00b042:	05705f63          	blez	s7,1c00b0a0 <_prf+0x618>
1c00b046:	017b0db3          	add	s11,s6,s7
1c00b04a:	106c                	addi	a1,sp,44
1c00b04c:	1808                	addi	a0,sp,48
1c00b04e:	0b05                	addi	s6,s6,1
1c00b050:	9fdff0ef          	jal	ra,1c00aa4c <_get_digit>
1c00b054:	feab0fa3          	sb	a0,-1(s6)
1c00b058:	ffbb19e3          	bne	s6,s11,1c00b04a <_prf+0x5c2>
1c00b05c:	4b81                	li	s7,0
1c00b05e:	000c9463          	bnez	s9,1c00b066 <_prf+0x5de>
1c00b062:	020d0063          	beqz	s10,1c00b082 <_prf+0x5fa>
1c00b066:	02e00613          	li	a2,46
1c00b06a:	00cd8023          	sb	a2,0(s11)
1c00b06e:	8b6e                	mv	s6,s11
1c00b070:	01ad8cb3          	add	s9,s11,s10
1c00b074:	03000313          	li	t1,48
1c00b078:	036c9963          	bne	s9,s6,1c00b0aa <_prf+0x622>
1c00b07c:	001d0713          	addi	a4,s10,1
1c00b080:	9dba                	add	s11,s11,a4
1c00b082:	060c1e63          	bnez	s8,1c00b0fe <_prf+0x676>
1c00b086:	a8d1                	j	1c00b15a <_prf+0x6d2>
1c00b088:	06500a93          	li	s5,101
1c00b08c:	b575                	j	1c00af38 <_prf+0x4b0>
1c00b08e:	1828                	addi	a0,sp,56
1c00b090:	c42e                	sw	a1,8(sp)
1c00b092:	973ff0ef          	jal	ra,1c00aa04 <_ldiv5>
1c00b096:	1828                	addi	a0,sp,56
1c00b098:	94dff0ef          	jal	ra,1c00a9e4 <_rlrshift>
1c00b09c:	45a2                	lw	a1,8(sp)
1c00b09e:	b79d                	j	1c00b004 <_prf+0x57c>
1c00b0a0:	03000593          	li	a1,48
1c00b0a4:	00bb0023          	sb	a1,0(s6)
1c00b0a8:	bf5d                	j	1c00b05e <_prf+0x5d6>
1c00b0aa:	000b8763          	beqz	s7,1c00b0b8 <_prf+0x630>
1c00b0ae:	006b00a3          	sb	t1,1(s6)
1c00b0b2:	0b85                	addi	s7,s7,1
1c00b0b4:	0b05                	addi	s6,s6,1
1c00b0b6:	b7c9                	j	1c00b078 <_prf+0x5f0>
1c00b0b8:	106c                	addi	a1,sp,44
1c00b0ba:	1808                	addi	a0,sp,48
1c00b0bc:	c41a                	sw	t1,8(sp)
1c00b0be:	98fff0ef          	jal	ra,1c00aa4c <_get_digit>
1c00b0c2:	00ab00a3          	sb	a0,1(s6)
1c00b0c6:	4322                	lw	t1,8(sp)
1c00b0c8:	b7f5                	j	1c00b0b4 <_prf+0x62c>
1c00b0ca:	106c                	addi	a1,sp,44
1c00b0cc:	1808                	addi	a0,sp,48
1c00b0ce:	97fff0ef          	jal	ra,1c00aa4c <_get_digit>
1c00b0d2:	00ab0023          	sb	a0,0(s6)
1c00b0d6:	03000593          	li	a1,48
1c00b0da:	00b50363          	beq	a0,a1,1c00b0e0 <_prf+0x658>
1c00b0de:	1bfd                	addi	s7,s7,-1
1c00b0e0:	000c9463          	bnez	s9,1c00b0e8 <_prf+0x660>
1c00b0e4:	000d0b63          	beqz	s10,1c00b0fa <_prf+0x672>
1c00b0e8:	002b0d93          	addi	s11,s6,2
1c00b0ec:	02e00593          	li	a1,46
1c00b0f0:	00bb00a3          	sb	a1,1(s6)
1c00b0f4:	9d6e                	add	s10,s10,s11
1c00b0f6:	07bd1863          	bne	s10,s11,1c00b166 <_prf+0x6de>
1c00b0fa:	000c0f63          	beqz	s8,1c00b118 <_prf+0x690>
1c00b0fe:	03000593          	li	a1,48
1c00b102:	fffdc603          	lbu	a2,-1(s11)
1c00b106:	fffd8713          	addi	a4,s11,-1
1c00b10a:	06b60663          	beq	a2,a1,1c00b176 <_prf+0x6ee>
1c00b10e:	02e00593          	li	a1,46
1c00b112:	00b61363          	bne	a2,a1,1c00b118 <_prf+0x690>
1c00b116:	8dba                	mv	s11,a4
1c00b118:	fdfaf713          	andi	a4,s5,-33
1c00b11c:	04500613          	li	a2,69
1c00b120:	02c71d63          	bne	a4,a2,1c00b15a <_prf+0x6d2>
1c00b124:	87d6                	mv	a5,s5
1c00b126:	00fd8023          	sb	a5,0(s11)
1c00b12a:	02b00793          	li	a5,43
1c00b12e:	000bd663          	bgez	s7,1c00b13a <_prf+0x6b2>
1c00b132:	41700bb3          	neg	s7,s7
1c00b136:	02d00793          	li	a5,45
1c00b13a:	00fd80a3          	sb	a5,1(s11)
1c00b13e:	47a9                	li	a5,10
1c00b140:	02fbc733          	div	a4,s7,a5
1c00b144:	0d91                	addi	s11,s11,4
1c00b146:	02fbe6b3          	rem	a3,s7,a5
1c00b14a:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b14e:	feed8f23          	sb	a4,-2(s11)
1c00b152:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b156:	fedd8fa3          	sb	a3,-1(s11)
1c00b15a:	00c8                	addi	a0,sp,68
1c00b15c:	000d8023          	sb	zero,0(s11)
1c00b160:	40ad8533          	sub	a0,s11,a0
1c00b164:	b1ed                	j	1c00ae4e <_prf+0x3c6>
1c00b166:	106c                	addi	a1,sp,44
1c00b168:	1808                	addi	a0,sp,48
1c00b16a:	0d85                	addi	s11,s11,1
1c00b16c:	8e1ff0ef          	jal	ra,1c00aa4c <_get_digit>
1c00b170:	fead8fa3          	sb	a0,-1(s11)
1c00b174:	b749                	j	1c00b0f6 <_prf+0x66e>
1c00b176:	8dba                	mv	s11,a4
1c00b178:	b769                	j	1c00b102 <_prf+0x67a>
1c00b17a:	000c2783          	lw	a5,0(s8)
1c00b17e:	004c0a13          	addi	s4,s8,4
1c00b182:	0137a023          	sw	s3,0(a5)
1c00b186:	b24d                	j	1c00ab28 <_prf+0xa0>
1c00b188:	004c0a13          	addi	s4,s8,4
1c00b18c:	000c2583          	lw	a1,0(s8)
1c00b190:	00dc                	addi	a5,sp,68
1c00b192:	040c8463          	beqz	s9,1c00b1da <_prf+0x752>
1c00b196:	03000693          	li	a3,48
1c00b19a:	04d10223          	sb	a3,68(sp)
1c00b19e:	04510513          	addi	a0,sp,69
1c00b1a2:	ed8d                	bnez	a1,1c00b1dc <_prf+0x754>
1c00b1a4:	040102a3          	sb	zero,69(sp)
1c00b1a8:	57fd                	li	a5,-1
1c00b1aa:	4401                	li	s0,0
1c00b1ac:	0efd1163          	bne	s10,a5,1c00b28e <_prf+0x806>
1c00b1b0:	0f2cc363          	blt	s9,s2,1c00b296 <_prf+0x80e>
1c00b1b4:	8966                	mv	s2,s9
1c00b1b6:	00c0                	addi	s0,sp,68
1c00b1b8:	40898ab3          	sub	s5,s3,s0
1c00b1bc:	5b7d                	li	s6,-1
1c00b1be:	015409b3          	add	s3,s0,s5
1c00b1c2:	960903e3          	beqz	s2,1c00ab28 <_prf+0xa0>
1c00b1c6:	45f2                	lw	a1,28(sp)
1c00b1c8:	00044503          	lbu	a0,0(s0)
1c00b1cc:	47e2                	lw	a5,24(sp)
1c00b1ce:	9782                	jalr	a5
1c00b1d0:	91650be3          	beq	a0,s6,1c00aae6 <_prf+0x5e>
1c00b1d4:	197d                	addi	s2,s2,-1
1c00b1d6:	0405                	addi	s0,s0,1
1c00b1d8:	b7dd                	j	1c00b1be <_prf+0x736>
1c00b1da:	853e                	mv	a0,a5
1c00b1dc:	86ea                	mv	a3,s10
1c00b1de:	4621                	li	a2,8
1c00b1e0:	40f50433          	sub	s0,a0,a5
1c00b1e4:	fa0ff0ef          	jal	ra,1c00a984 <_to_x>
1c00b1e8:	9522                	add	a0,a0,s0
1c00b1ea:	57fd                	li	a5,-1
1c00b1ec:	4401                	li	s0,0
1c00b1ee:	c6fd0ae3          	beq	s10,a5,1c00ae62 <_prf+0x3da>
1c00b1f2:	02000793          	li	a5,32
1c00b1f6:	c83e                	sw	a5,16(sp)
1c00b1f8:	b1ad                	j	1c00ae62 <_prf+0x3da>
1c00b1fa:	000c2583          	lw	a1,0(s8)
1c00b1fe:	77e1                	lui	a5,0xffff8
1c00b200:	8307c793          	xori	a5,a5,-2000
1c00b204:	46a1                	li	a3,8
1c00b206:	4641                	li	a2,16
1c00b208:	04610513          	addi	a0,sp,70
1c00b20c:	04f11223          	sh	a5,68(sp)
1c00b210:	f74ff0ef          	jal	ra,1c00a984 <_to_x>
1c00b214:	004c0a13          	addi	s4,s8,4
1c00b218:	0509                	addi	a0,a0,2
1c00b21a:	57fd                	li	a5,-1
1c00b21c:	4401                	li	s0,0
1c00b21e:	c4fd02e3          	beq	s10,a5,1c00ae62 <_prf+0x3da>
1c00b222:	02000713          	li	a4,32
1c00b226:	c83a                	sw	a4,16(sp)
1c00b228:	b92d                	j	1c00ae62 <_prf+0x3da>
1c00b22a:	000d4563          	bltz	s10,1c00b234 <_prf+0x7ac>
1c00b22e:	019d5363          	ble	s9,s10,1c00b234 <_prf+0x7ac>
1c00b232:	8cea                	mv	s9,s10
1c00b234:	8e0c8ae3          	beqz	s9,1c00ab28 <_prf+0xa0>
1c00b238:	8666                	mv	a2,s9
1c00b23a:	00c8                	addi	a0,sp,68
1c00b23c:	ce4ff0ef          	jal	ra,1c00a720 <memcpy>
1c00b240:	b6b9                	j	1c00ad8e <_prf+0x306>
1c00b242:	000c2583          	lw	a1,0(s8)
1c00b246:	86ea                	mv	a3,s10
1c00b248:	4629                	li	a2,10
1c00b24a:	00c8                	addi	a0,sp,68
1c00b24c:	004c0a13          	addi	s4,s8,4
1c00b250:	f34ff0ef          	jal	ra,1c00a984 <_to_x>
1c00b254:	bf59                	j	1c00b1ea <_prf+0x762>
1c00b256:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b25a:	0ff67613          	andi	a2,a2,255
1c00b25e:	00c5e563          	bltu	a1,a2,1c00b268 <_prf+0x7e0>
1c00b262:	1781                	addi	a5,a5,-32
1c00b264:	00f68023          	sb	a5,0(a3)
1c00b268:	0685                	addi	a3,a3,1
1c00b26a:	0006c783          	lbu	a5,0(a3)
1c00b26e:	f7e5                	bnez	a5,1c00b256 <_prf+0x7ce>
1c00b270:	bc9d                	j	1c00ace6 <_prf+0x25e>
1c00b272:	86de                	mv	a3,s7
1c00b274:	45e5                	li	a1,25
1c00b276:	bfd5                	j	1c00b26a <_prf+0x7e2>
1c00b278:	45f2                	lw	a1,28(sp)
1c00b27a:	4762                	lw	a4,24(sp)
1c00b27c:	02500513          	li	a0,37
1c00b280:	9702                	jalr	a4
1c00b282:	57fd                	li	a5,-1
1c00b284:	86f501e3          	beq	a0,a5,1c00aae6 <_prf+0x5e>
1c00b288:	0985                	addi	s3,s3,1
1c00b28a:	8a62                	mv	s4,s8
1c00b28c:	b871                	j	1c00ab28 <_prf+0xa0>
1c00b28e:	02000793          	li	a5,32
1c00b292:	c83e                	sw	a5,16(sp)
1c00b294:	bf31                	j	1c00b1b0 <_prf+0x728>
1c00b296:	4732                	lw	a4,12(sp)
1c00b298:	cf01                	beqz	a4,1c00b2b0 <_prf+0x828>
1c00b29a:	02000713          	li	a4,32
1c00b29e:	00d4                	addi	a3,sp,68
1c00b2a0:	019687b3          	add	a5,a3,s9
1c00b2a4:	00e78023          	sb	a4,0(a5)
1c00b2a8:	0c85                	addi	s9,s9,1
1c00b2aa:	ff991ae3          	bne	s2,s9,1c00b29e <_prf+0x816>
1c00b2ae:	b721                	j	1c00b1b6 <_prf+0x72e>
1c00b2b0:	00cc                	addi	a1,sp,68
1c00b2b2:	41990bb3          	sub	s7,s2,s9
1c00b2b6:	001c8613          	addi	a2,s9,1
1c00b2ba:	01758533          	add	a0,a1,s7
1c00b2be:	c7aff0ef          	jal	ra,1c00a738 <memmove>
1c00b2c2:	4742                	lw	a4,16(sp)
1c00b2c4:	02000793          	li	a5,32
1c00b2c8:	00f70363          	beq	a4,a5,1c00b2ce <_prf+0x846>
1c00b2cc:	c622                	sw	s0,12(sp)
1c00b2ce:	47b2                	lw	a5,12(sp)
1c00b2d0:	9bbe                	add	s7,s7,a5
1c00b2d2:	4732                	lw	a4,12(sp)
1c00b2d4:	ef7751e3          	ble	s7,a4,1c00b1b6 <_prf+0x72e>
1c00b2d8:	4732                	lw	a4,12(sp)
1c00b2da:	00d4                	addi	a3,sp,68
1c00b2dc:	00e687b3          	add	a5,a3,a4
1c00b2e0:	4742                	lw	a4,16(sp)
1c00b2e2:	00e78023          	sb	a4,0(a5)
1c00b2e6:	47b2                	lw	a5,12(sp)
1c00b2e8:	0785                	addi	a5,a5,1
1c00b2ea:	c63e                	sw	a5,12(sp)
1c00b2ec:	b7dd                	j	1c00b2d2 <_prf+0x84a>
1c00b2ee:	4452                	lw	s0,20(sp)
1c00b2f0:	be8d                	j	1c00ae62 <_prf+0x3da>

1c00b2f2 <__rt_uart_cluster_req_done>:
1c00b2f2:	300476f3          	csrrci	a3,mstatus,8
1c00b2f6:	4785                	li	a5,1
1c00b2f8:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b2fc:	09954783          	lbu	a5,153(a0)
1c00b300:	00201737          	lui	a4,0x201
1c00b304:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00b308:	04078793          	addi	a5,a5,64
1c00b30c:	07da                	slli	a5,a5,0x16
1c00b30e:	97ba                	add	a5,a5,a4
1c00b310:	0007a023          	sw	zero,0(a5)
1c00b314:	30069073          	csrw	mstatus,a3
1c00b318:	8082                	ret

1c00b31a <__rt_uart_setup.isra.6>:
1c00b31a:	1c001737          	lui	a4,0x1c001
1c00b31e:	21872703          	lw	a4,536(a4) # 1c001218 <__rt_freq_domains>
1c00b322:	00155793          	srli	a5,a0,0x1
1c00b326:	97ba                	add	a5,a5,a4
1c00b328:	02a7d7b3          	divu	a5,a5,a0
1c00b32c:	1a102737          	lui	a4,0x1a102
1c00b330:	17fd                	addi	a5,a5,-1
1c00b332:	07c2                	slli	a5,a5,0x10
1c00b334:	3067e793          	ori	a5,a5,774
1c00b338:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100190>
1c00b33c:	8082                	ret

1c00b33e <__rt_uart_setfreq_after>:
1c00b33e:	1c0017b7          	lui	a5,0x1c001
1c00b342:	19878793          	addi	a5,a5,408 # 1c001198 <__rt_uart>
1c00b346:	4398                	lw	a4,0(a5)
1c00b348:	cb09                	beqz	a4,1c00b35a <__rt_uart_setfreq_after+0x1c>
1c00b34a:	4788                	lw	a0,8(a5)
1c00b34c:	1141                	addi	sp,sp,-16
1c00b34e:	c606                	sw	ra,12(sp)
1c00b350:	37e9                	jal	1c00b31a <__rt_uart_setup.isra.6>
1c00b352:	40b2                	lw	ra,12(sp)
1c00b354:	4501                	li	a0,0
1c00b356:	0141                	addi	sp,sp,16
1c00b358:	8082                	ret
1c00b35a:	4501                	li	a0,0
1c00b35c:	8082                	ret

1c00b35e <__rt_uart_cluster_req>:
1c00b35e:	1141                	addi	sp,sp,-16
1c00b360:	c606                	sw	ra,12(sp)
1c00b362:	c422                	sw	s0,8(sp)
1c00b364:	30047473          	csrrci	s0,mstatus,8
1c00b368:	1c00b7b7          	lui	a5,0x1c00b
1c00b36c:	2f278793          	addi	a5,a5,754 # 1c00b2f2 <__rt_uart_cluster_req_done>
1c00b370:	c55c                	sw	a5,12(a0)
1c00b372:	4785                	li	a5,1
1c00b374:	d55c                	sw	a5,44(a0)
1c00b376:	411c                	lw	a5,0(a0)
1c00b378:	02052823          	sw	zero,48(a0)
1c00b37c:	c908                	sw	a0,16(a0)
1c00b37e:	43cc                	lw	a1,4(a5)
1c00b380:	4514                	lw	a3,8(a0)
1c00b382:	4150                	lw	a2,4(a0)
1c00b384:	0586                	slli	a1,a1,0x1
1c00b386:	00c50793          	addi	a5,a0,12
1c00b38a:	4701                	li	a4,0
1c00b38c:	0585                	addi	a1,a1,1
1c00b38e:	4501                	li	a0,0
1c00b390:	e99fe0ef          	jal	ra,1c00a228 <rt_periph_copy>
1c00b394:	30041073          	csrw	mstatus,s0
1c00b398:	40b2                	lw	ra,12(sp)
1c00b39a:	4422                	lw	s0,8(sp)
1c00b39c:	0141                	addi	sp,sp,16
1c00b39e:	8082                	ret

1c00b3a0 <__rt_uart_wait_tx_done.isra.5>:
1c00b3a0:	1a102737          	lui	a4,0x1a102
1c00b3a4:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa100184>
1c00b3a8:	8bc1                	andi	a5,a5,16
1c00b3aa:	e7b9                	bnez	a5,1c00b3f8 <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b3ac:	1a102737          	lui	a4,0x1a102
1c00b3b0:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa10018c>
1c00b3b4:	8b85                	andi	a5,a5,1
1c00b3b6:	ffed                	bnez	a5,1c00b3b0 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b3b8:	f14027f3          	csrr	a5,mhartid
1c00b3bc:	8795                	srai	a5,a5,0x5
1c00b3be:	1a10a637          	lui	a2,0x1a10a
1c00b3c2:	03f7f793          	andi	a5,a5,63
1c00b3c6:	03200693          	li	a3,50
1c00b3ca:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa107800>
1c00b3ce:	6711                	lui	a4,0x4
1c00b3d0:	6311                	lui	t1,0x4
1c00b3d2:	45fd                	li	a1,31
1c00b3d4:	00204537          	lui	a0,0x204
1c00b3d8:	88be                	mv	a7,a5
1c00b3da:	00682023          	sw	t1,0(a6)
1c00b3de:	02b79063          	bne	a5,a1,1c00b3fe <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b3e2:	80e62223          	sw	a4,-2044(a2)
1c00b3e6:	10500073          	wfi
1c00b3ea:	00b89c63          	bne	a7,a1,1c00b402 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b3ee:	80e62423          	sw	a4,-2040(a2)
1c00b3f2:	16fd                	addi	a3,a3,-1
1c00b3f4:	f2fd                	bnez	a3,1c00b3da <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b3f6:	8082                	ret
1c00b3f8:	10500073          	wfi
1c00b3fc:	b765                	j	1c00b3a4 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b3fe:	c958                	sw	a4,20(a0)
1c00b400:	b7dd                	j	1c00b3e6 <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b402:	c918                	sw	a4,16(a0)
1c00b404:	b7fd                	j	1c00b3f2 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b406 <__rt_uart_setfreq_before>:
1c00b406:	1c0017b7          	lui	a5,0x1c001
1c00b40a:	1987a783          	lw	a5,408(a5) # 1c001198 <__rt_uart>
1c00b40e:	cf99                	beqz	a5,1c00b42c <__rt_uart_setfreq_before+0x26>
1c00b410:	1141                	addi	sp,sp,-16
1c00b412:	c606                	sw	ra,12(sp)
1c00b414:	3771                	jal	1c00b3a0 <__rt_uart_wait_tx_done.isra.5>
1c00b416:	40b2                	lw	ra,12(sp)
1c00b418:	005007b7          	lui	a5,0x500
1c00b41c:	1a102737          	lui	a4,0x1a102
1c00b420:	0799                	addi	a5,a5,6
1c00b422:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100190>
1c00b426:	4501                	li	a0,0
1c00b428:	0141                	addi	sp,sp,16
1c00b42a:	8082                	ret
1c00b42c:	4501                	li	a0,0
1c00b42e:	8082                	ret

1c00b430 <soc_eu_fcEventMask_setEvent>:
1c00b430:	47fd                	li	a5,31
1c00b432:	4721                	li	a4,8
1c00b434:	00a7d463          	ble	a0,a5,1c00b43c <soc_eu_fcEventMask_setEvent+0xc>
1c00b438:	1501                	addi	a0,a0,-32
1c00b43a:	4711                	li	a4,4
1c00b43c:	1a1067b7          	lui	a5,0x1a106
1c00b440:	973e                	add	a4,a4,a5
1c00b442:	4314                	lw	a3,0(a4)
1c00b444:	4785                	li	a5,1
1c00b446:	00a79533          	sll	a0,a5,a0
1c00b44a:	fff54513          	not	a0,a0
1c00b44e:	8d75                	and	a0,a0,a3
1c00b450:	c308                	sw	a0,0(a4)
1c00b452:	8082                	ret

1c00b454 <rt_uart_conf_init>:
1c00b454:	000997b7          	lui	a5,0x99
1c00b458:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8a97c>
1c00b45c:	c11c                	sw	a5,0(a0)
1c00b45e:	57fd                	li	a5,-1
1c00b460:	c15c                	sw	a5,4(a0)
1c00b462:	8082                	ret

1c00b464 <__rt_uart_open>:
1c00b464:	1141                	addi	sp,sp,-16
1c00b466:	c606                	sw	ra,12(sp)
1c00b468:	c422                	sw	s0,8(sp)
1c00b46a:	c226                	sw	s1,4(sp)
1c00b46c:	c04a                	sw	s2,0(sp)
1c00b46e:	30047973          	csrrci	s2,mstatus,8
1c00b472:	cd8d                	beqz	a1,1c00b4ac <__rt_uart_open+0x48>
1c00b474:	4194                	lw	a3,0(a1)
1c00b476:	1c0017b7          	lui	a5,0x1c001
1c00b47a:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f6011>
1c00b47e:	19878413          	addi	s0,a5,408 # 1c001198 <__rt_uart>
1c00b482:	0712                	slli	a4,a4,0x4
1c00b484:	943a                	add	s0,s0,a4
1c00b486:	4010                	lw	a2,0(s0)
1c00b488:	19878793          	addi	a5,a5,408
1c00b48c:	c60d                	beqz	a2,1c00b4b6 <__rt_uart_open+0x52>
1c00b48e:	c589                	beqz	a1,1c00b498 <__rt_uart_open+0x34>
1c00b490:	418c                	lw	a1,0(a1)
1c00b492:	4414                	lw	a3,8(s0)
1c00b494:	04d59a63          	bne	a1,a3,1c00b4e8 <__rt_uart_open+0x84>
1c00b498:	97ba                	add	a5,a5,a4
1c00b49a:	0605                	addi	a2,a2,1
1c00b49c:	c390                	sw	a2,0(a5)
1c00b49e:	8522                	mv	a0,s0
1c00b4a0:	40b2                	lw	ra,12(sp)
1c00b4a2:	4422                	lw	s0,8(sp)
1c00b4a4:	4492                	lw	s1,4(sp)
1c00b4a6:	4902                	lw	s2,0(sp)
1c00b4a8:	0141                	addi	sp,sp,16
1c00b4aa:	8082                	ret
1c00b4ac:	000996b7          	lui	a3,0x99
1c00b4b0:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8a97c>
1c00b4b4:	b7c9                	j	1c00b476 <__rt_uart_open+0x12>
1c00b4b6:	4785                	li	a5,1
1c00b4b8:	1a102737          	lui	a4,0x1a102
1c00b4bc:	c01c                	sw	a5,0(s0)
1c00b4be:	c048                	sw	a0,4(s0)
1c00b4c0:	c414                	sw	a3,8(s0)
1c00b4c2:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa10076c>
1c00b4c6:	00a797b3          	sll	a5,a5,a0
1c00b4ca:	00151493          	slli	s1,a0,0x1
1c00b4ce:	8fd5                	or	a5,a5,a3
1c00b4d0:	78f72023          	sw	a5,1920(a4)
1c00b4d4:	8526                	mv	a0,s1
1c00b4d6:	3fa9                	jal	1c00b430 <soc_eu_fcEventMask_setEvent>
1c00b4d8:	00148513          	addi	a0,s1,1
1c00b4dc:	3f91                	jal	1c00b430 <soc_eu_fcEventMask_setEvent>
1c00b4de:	4408                	lw	a0,8(s0)
1c00b4e0:	3d2d                	jal	1c00b31a <__rt_uart_setup.isra.6>
1c00b4e2:	30091073          	csrw	mstatus,s2
1c00b4e6:	bf65                	j	1c00b49e <__rt_uart_open+0x3a>
1c00b4e8:	4401                	li	s0,0
1c00b4ea:	bf55                	j	1c00b49e <__rt_uart_open+0x3a>

1c00b4ec <rt_uart_close>:
1c00b4ec:	1141                	addi	sp,sp,-16
1c00b4ee:	c606                	sw	ra,12(sp)
1c00b4f0:	c422                	sw	s0,8(sp)
1c00b4f2:	c226                	sw	s1,4(sp)
1c00b4f4:	300474f3          	csrrci	s1,mstatus,8
1c00b4f8:	411c                	lw	a5,0(a0)
1c00b4fa:	17fd                	addi	a5,a5,-1
1c00b4fc:	c11c                	sw	a5,0(a0)
1c00b4fe:	e78d                	bnez	a5,1c00b528 <rt_uart_close+0x3c>
1c00b500:	842a                	mv	s0,a0
1c00b502:	3d79                	jal	1c00b3a0 <__rt_uart_wait_tx_done.isra.5>
1c00b504:	005007b7          	lui	a5,0x500
1c00b508:	1a102737          	lui	a4,0x1a102
1c00b50c:	0799                	addi	a5,a5,6
1c00b50e:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100190>
1c00b512:	4050                	lw	a2,4(s0)
1c00b514:	78072683          	lw	a3,1920(a4)
1c00b518:	4785                	li	a5,1
1c00b51a:	00c797b3          	sll	a5,a5,a2
1c00b51e:	fff7c793          	not	a5,a5
1c00b522:	8ff5                	and	a5,a5,a3
1c00b524:	78f72023          	sw	a5,1920(a4)
1c00b528:	30049073          	csrw	mstatus,s1
1c00b52c:	40b2                	lw	ra,12(sp)
1c00b52e:	4422                	lw	s0,8(sp)
1c00b530:	4492                	lw	s1,4(sp)
1c00b532:	0141                	addi	sp,sp,16
1c00b534:	8082                	ret

1c00b536 <rt_uart_cluster_write>:
1c00b536:	f14027f3          	csrr	a5,mhartid
1c00b53a:	8795                	srai	a5,a5,0x5
1c00b53c:	03f7f793          	andi	a5,a5,63
1c00b540:	08f68ca3          	sb	a5,153(a3)
1c00b544:	1c00b7b7          	lui	a5,0x1c00b
1c00b548:	35e78793          	addi	a5,a5,862 # 1c00b35e <__rt_uart_cluster_req>
1c00b54c:	c6dc                	sw	a5,12(a3)
1c00b54e:	4785                	li	a5,1
1c00b550:	c288                	sw	a0,0(a3)
1c00b552:	c2cc                	sw	a1,4(a3)
1c00b554:	c690                	sw	a2,8(a3)
1c00b556:	08068c23          	sb	zero,152(a3)
1c00b55a:	0206a823          	sw	zero,48(a3)
1c00b55e:	ca94                	sw	a3,16(a3)
1c00b560:	d6dc                	sw	a5,44(a3)
1c00b562:	00c68513          	addi	a0,a3,12
1c00b566:	ab5fd06f          	j	1c00901a <__rt_cluster_push_fc_event>

1c00b56a <__rt_uart_init>:
1c00b56a:	1c00b5b7          	lui	a1,0x1c00b
1c00b56e:	1141                	addi	sp,sp,-16
1c00b570:	4601                	li	a2,0
1c00b572:	40658593          	addi	a1,a1,1030 # 1c00b406 <__rt_uart_setfreq_before>
1c00b576:	4511                	li	a0,4
1c00b578:	c606                	sw	ra,12(sp)
1c00b57a:	c422                	sw	s0,8(sp)
1c00b57c:	8bafe0ef          	jal	ra,1c009636 <__rt_cbsys_add>
1c00b580:	1c00b5b7          	lui	a1,0x1c00b
1c00b584:	842a                	mv	s0,a0
1c00b586:	4601                	li	a2,0
1c00b588:	33e58593          	addi	a1,a1,830 # 1c00b33e <__rt_uart_setfreq_after>
1c00b58c:	4515                	li	a0,5
1c00b58e:	8a8fe0ef          	jal	ra,1c009636 <__rt_cbsys_add>
1c00b592:	1c0017b7          	lui	a5,0x1c001
1c00b596:	1807ac23          	sw	zero,408(a5) # 1c001198 <__rt_uart>
1c00b59a:	8d41                	or	a0,a0,s0
1c00b59c:	c105                	beqz	a0,1c00b5bc <__rt_uart_init+0x52>
1c00b59e:	f1402673          	csrr	a2,mhartid
1c00b5a2:	1c000537          	lui	a0,0x1c000
1c00b5a6:	40565593          	srai	a1,a2,0x5
1c00b5aa:	03f5f593          	andi	a1,a1,63
1c00b5ae:	8a7d                	andi	a2,a2,31
1c00b5b0:	68c50513          	addi	a0,a0,1676 # 1c00068c <__DTOR_END__+0x3a0>
1c00b5b4:	ba6ff0ef          	jal	ra,1c00a95a <printf>
1c00b5b8:	b2eff0ef          	jal	ra,1c00a8e6 <abort>
1c00b5bc:	40b2                	lw	ra,12(sp)
1c00b5be:	4422                	lw	s0,8(sp)
1c00b5c0:	0141                	addi	sp,sp,16
1c00b5c2:	8082                	ret

Disassembly of section .text.cluster:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x1f6014>
1c010016:	0e059863          	bnez	a1,1c010106 <__rt_slave_start>
1c01001a:	e3ff0417          	auipc	s0,0xe3ff0
1c01001e:	fea40413          	addi	s0,s0,-22 # 4 <__rt_bridge_flash_handle>
1c010022:	002049b7          	lui	s3,0x204
1c010026:	4a09                	li	s4,2
1c010028:	00000a97          	auipc	s5,0x0
1c01002c:	034a8a93          	addi	s5,s5,52 # 1c01005c <__rt_master_event>
1c010030:	ffff1b97          	auipc	s7,0xffff1
1c010034:	1b8b8b93          	addi	s7,s7,440 # 1c0011e8 <__rt_fc_cluster_data>
1c010038:	02800393          	li	t2,40
1c01003c:	02a383b3          	mul	t2,t2,a0
1c010040:	9b9e                	add	s7,s7,t2
1c010042:	0b91                	addi	s7,s7,4
1c010044:	1a10acb7          	lui	s9,0x1a10a
1c010048:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_end+0xa1077fc>
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
1c0100cc:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1f6098>
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
1c010124:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x1f6230>

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
