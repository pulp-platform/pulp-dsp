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
1c0080da:	202010ef          	jal	ra,1c0092dc <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00001397          	auipc	t2,0x1
1c0080ea:	9e238393          	addi	t2,t2,-1566 # 1c008ac8 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	35c010ef          	jal	ra,1c009450 <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	7a6020ef          	jal	ra,1c00a8a0 <exit>

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
1c00815e:	6b260613          	addi	a2,a2,1714 # 1c00980c <__rt_bridge_handle_notif>
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
1c00825e:	28650513          	addi	a0,a0,646 # 1c0094e0 <__rt_handle_illegal_instr>
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
1c00855a:	3e4020ef          	jal	ra,1c00a93e <printf>
1c00855e:	0028                	addi	a0,sp,8
1c008560:	545000ef          	jal	ra,1c0092a4 <rt_perf_init>
1c008564:	6585                	lui	a1,0x1
1c008566:	80058593          	addi	a1,a1,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00856a:	450d                	li	a0,3
1c00856c:	2535                	jal	1c008b98 <rt_alloc>
1c00856e:	1c050163          	beqz	a0,1c008730 <cluster_entry+0x200>
1c008572:	84aa                	mv	s1,a0
1c008574:	1c000537          	lui	a0,0x1c000
1c008578:	42450513          	addi	a0,a0,1060 # 1c000424 <__DTOR_END__+0x138>
1c00857c:	2c2020ef          	jal	ra,1c00a83e <puts>
1c008580:	65c1                	lui	a1,0x10
1c008582:	0599                	addi	a1,a1,6
1c008584:	0028                	addi	a0,sp,8
1c008586:	533000ef          	jal	ra,1c0092b8 <rt_perf_conf>
1c00858a:	47fd                	li	a5,31
1c00858c:	14f40e63          	beq	s0,a5,1c0086e8 <cluster_entry+0x1b8>
1c008590:	102007b7          	lui	a5,0x10200
1c008594:	4705                	li	a4,1
1c008596:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1febec>
1c00859a:	02e7a023          	sw	a4,32(a5)
1c00859e:	4781                	li	a5,0
1c0085a0:	79f79073          	csrw	pccr31,a5
1c0085a4:	f14027f3          	csrr	a5,mhartid
1c0085a8:	477d                	li	a4,31
1c0085aa:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085ae:	14e78c63          	beq	a5,a4,1c008706 <cluster_entry+0x1d6>
1c0085b2:	102007b7          	lui	a5,0x10200
1c0085b6:	4705                	li	a4,1
1c0085b8:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1febec>
1c0085bc:	00e7ac23          	sw	a4,24(a5)
1c0085c0:	478d                	li	a5,3
1c0085c2:	7a179073          	csrw	pcmr,a5
1c0085c6:	100015b7          	lui	a1,0x10001
1c0085ca:	10001537          	lui	a0,0x10001
1c0085ce:	87a6                	mv	a5,s1
1c0085d0:	02000713          	li	a4,32
1c0085d4:	02000693          	li	a3,32
1c0085d8:	02000613          	li	a2,32
1c0085dc:	81458593          	addi	a1,a1,-2028 # 10000814 <m_b>
1c0085e0:	01450513          	addi	a0,a0,20 # 10001014 <m_a>
1c0085e4:	22ad                	jal	1c00874e <plp_mat_mult_i16v_xpulpv2>
1c0085e6:	477d                	li	a4,31
1c0085e8:	f14027f3          	csrr	a5,mhartid
1c0085ec:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085f0:	14e78763          	beq	a5,a4,1c00873e <cluster_entry+0x20e>
1c0085f4:	102007b7          	lui	a5,0x10200
1c0085f8:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1febec>
1c0085fc:	0007a023          	sw	zero,0(a5)
1c008600:	4781                	li	a5,0
1c008602:	7a179073          	csrw	pcmr,a5
1c008606:	10000937          	lui	s2,0x10000
1c00860a:	01490913          	addi	s2,s2,20 # 10000014 <m_c>
1c00860e:	4a81                	li	s5,0
1c008610:	4401                	li	s0,0
1c008612:	1c000a37          	lui	s4,0x1c000
1c008616:	40000993          	li	s3,1024
1c00861a:	0024980b          	p.lh	a6,2(s1!)
1c00861e:	0029170b          	p.lh	a4,2(s2!)
1c008622:	85a2                	mv	a1,s0
1c008624:	8642                	mv	a2,a6
1c008626:	0405                	addi	s0,s0,1
1c008628:	86ba                	mv	a3,a4
1c00862a:	438a0513          	addi	a0,s4,1080 # 1c000438 <__DTOR_END__+0x14c>
1c00862e:	00e80563          	beq	a6,a4,1c008638 <cluster_entry+0x108>
1c008632:	30c020ef          	jal	ra,1c00a93e <printf>
1c008636:	0a85                	addi	s5,s5,1
1c008638:	ff3411e3          	bne	s0,s3,1c00861a <cluster_entry+0xea>
1c00863c:	0e0a8363          	beqz	s5,1c008722 <cluster_entry+0x1f2>
1c008640:	1c000537          	lui	a0,0x1c000
1c008644:	85d6                	mv	a1,s5
1c008646:	48450513          	addi	a0,a0,1156 # 1c000484 <__DTOR_END__+0x198>
1c00864a:	2f4020ef          	jal	ra,1c00a93e <printf>
1c00864e:	f14027f3          	csrr	a5,mhartid
1c008652:	477d                	li	a4,31
1c008654:	ca5797b3          	p.extractu	a5,a5,5,5
1c008658:	0ce78063          	beq	a5,a4,1c008718 <cluster_entry+0x1e8>
1c00865c:	10200437          	lui	s0,0x10200
1c008660:	40040413          	addi	s0,s0,1024 # 10200400 <__l1_end+0x1febec>
1c008664:	00842403          	lw	s0,8(s0)
1c008668:	781024f3          	csrr	s1,pccr1
1c00866c:	78202973          	csrr	s2,pccr2
1c008670:	1c000537          	lui	a0,0x1c000
1c008674:	85a2                	mv	a1,s0
1c008676:	49850513          	addi	a0,a0,1176 # 1c000498 <__DTOR_END__+0x1ac>
1c00867a:	2c4020ef          	jal	ra,1c00a93e <printf>
1c00867e:	1c000537          	lui	a0,0x1c000
1c008682:	85a6                	mv	a1,s1
1c008684:	4ac50513          	addi	a0,a0,1196 # 1c0004ac <__DTOR_END__+0x1c0>
1c008688:	2b6020ef          	jal	ra,1c00a93e <printf>
1c00868c:	1c000537          	lui	a0,0x1c000
1c008690:	85ca                	mv	a1,s2
1c008692:	4c050513          	addi	a0,a0,1216 # 1c0004c0 <__DTOR_END__+0x1d4>
1c008696:	2a8020ef          	jal	ra,1c00a93e <printf>
1c00869a:	1c000537          	lui	a0,0x1c000
1c00869e:	65c1                	lui	a1,0x10
1c0086a0:	4d050513          	addi	a0,a0,1232 # 1c0004d0 <__DTOR_END__+0x1e4>
1c0086a4:	29a020ef          	jal	ra,1c00a93e <printf>
1c0086a8:	006409b7          	lui	s3,0x640
1c0086ac:	6941                	lui	s2,0x10
1c0086ae:	0299d633          	divu	a2,s3,s1
1c0086b2:	1c000537          	lui	a0,0x1c000
1c0086b6:	4e050513          	addi	a0,a0,1248 # 1c0004e0 <__DTOR_END__+0x1f4>
1c0086ba:	029955b3          	divu	a1,s2,s1
1c0086be:	280020ef          	jal	ra,1c00a93e <printf>
1c0086c2:	0289d633          	divu	a2,s3,s0
1c0086c6:	1c000537          	lui	a0,0x1c000
1c0086ca:	50050513          	addi	a0,a0,1280 # 1c000500 <__DTOR_END__+0x214>
1c0086ce:	028955b3          	divu	a1,s2,s0
1c0086d2:	26c020ef          	jal	ra,1c00a93e <printf>
1c0086d6:	50b6                	lw	ra,108(sp)
1c0086d8:	5426                	lw	s0,104(sp)
1c0086da:	5496                	lw	s1,100(sp)
1c0086dc:	5906                	lw	s2,96(sp)
1c0086de:	49f6                	lw	s3,92(sp)
1c0086e0:	4a66                	lw	s4,88(sp)
1c0086e2:	4ad6                	lw	s5,84(sp)
1c0086e4:	6165                	addi	sp,sp,112
1c0086e6:	8082                	ret
1c0086e8:	4785                	li	a5,1
1c0086ea:	1a10b737          	lui	a4,0x1a10b
1c0086ee:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa10980c>
1c0086f2:	4781                	li	a5,0
1c0086f4:	79f79073          	csrw	pccr31,a5
1c0086f8:	f14027f3          	csrr	a5,mhartid
1c0086fc:	477d                	li	a4,31
1c0086fe:	ca5797b3          	p.extractu	a5,a5,5,5
1c008702:	eae798e3          	bne	a5,a4,1c0085b2 <cluster_entry+0x82>
1c008706:	4785                	li	a5,1
1c008708:	1a10b737          	lui	a4,0x1a10b
1c00870c:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa109804>
1c008710:	478d                	li	a5,3
1c008712:	7a179073          	csrw	pcmr,a5
1c008716:	bd45                	j	1c0085c6 <cluster_entry+0x96>
1c008718:	1a10b437          	lui	s0,0x1a10b
1c00871c:	00842403          	lw	s0,8(s0) # 1a10b008 <__l1_end+0xa1097f4>
1c008720:	b7a1                	j	1c008668 <cluster_entry+0x138>
1c008722:	1c000537          	lui	a0,0x1c000
1c008726:	47050513          	addi	a0,a0,1136 # 1c000470 <__DTOR_END__+0x184>
1c00872a:	114020ef          	jal	ra,1c00a83e <puts>
1c00872e:	b705                	j	1c00864e <cluster_entry+0x11e>
1c008730:	1c000537          	lui	a0,0x1c000
1c008734:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c008738:	106020ef          	jal	ra,1c00a83e <puts>
1c00873c:	bf09                	j	1c00864e <cluster_entry+0x11e>
1c00873e:	1a10b7b7          	lui	a5,0x1a10b
1c008742:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa1097ec>
1c008746:	4781                	li	a5,0
1c008748:	7a179073          	csrw	pcmr,a5
1c00874c:	bd6d                	j	1c008606 <cluster_entry+0xd6>

1c00874e <plp_mat_mult_i16v_xpulpv2>:
1c00874e:	711d                	addi	sp,sp,-96
1c008750:	d232                	sw	a2,36(sp)
1c008752:	5312                	lw	t1,36(sp)
1c008754:	460d                	li	a2,3
1c008756:	cea2                	sw	s0,92(sp)
1c008758:	02c35633          	divu	a2,t1,a2
1c00875c:	cca6                	sw	s1,88(sp)
1c00875e:	caca                	sw	s2,84(sp)
1c008760:	c8ce                	sw	s3,80(sp)
1c008762:	c6d2                	sw	s4,76(sp)
1c008764:	c4d6                	sw	s5,72(sp)
1c008766:	c2da                	sw	s6,68(sp)
1c008768:	c0de                	sw	s7,64(sp)
1c00876a:	de62                	sw	s8,60(sp)
1c00876c:	dc66                	sw	s9,56(sp)
1c00876e:	da6a                	sw	s10,52(sp)
1c008770:	d86e                	sw	s11,48(sp)
1c008772:	c42a                	sw	a0,8(sp)
1c008774:	c02e                	sw	a1,0(sp)
1c008776:	d43e                	sw	a5,40(sp)
1c008778:	c632                	sw	a2,12(sp)
1c00877a:	32060f63          	beqz	a2,1c008ab8 <plp_mat_mult_i16v_xpulpv2+0x36a>
1c00877e:	00171413          	slli	s0,a4,0x1
1c008782:	85be                	mv	a1,a5
1c008784:	00e407b3          	add	a5,s0,a4
1c008788:	0786                	slli	a5,a5,0x1
1c00878a:	00169c13          	slli	s8,a3,0x1
1c00878e:	d03e                	sw	a5,32(sp)
1c008790:	4782                	lw	a5,0(sp)
1c008792:	00dc0633          	add	a2,s8,a3
1c008796:	0606                	slli	a2,a2,0x1
1c008798:	0016db93          	srli	s7,a3,0x1
1c00879c:	01850d33          	add	s10,a0,s8
1c0087a0:	002b9c93          	slli	s9,s7,0x2
1c0087a4:	c832                	sw	a2,16(sp)
1c0087a6:	97a2                	add	a5,a5,s0
1c0087a8:	00858633          	add	a2,a1,s0
1c0087ac:	c222                	sw	s0,4(sp)
1c0087ae:	ce2e                	sw	a1,28(sp)
1c0087b0:	ca32                	sw	a2,20(sp)
1c0087b2:	8b2a                	mv	s6,a0
1c0087b4:	9c6a                	add	s8,s8,s10
1c0087b6:	9caa                	add	s9,s9,a0
1c0087b8:	d63e                	sw	a5,44(sp)
1c0087ba:	00271d93          	slli	s11,a4,0x2
1c0087be:	cc02                	sw	zero,24(sp)
1c0087c0:	16070b63          	beqz	a4,1c008936 <plp_mat_mult_i16v_xpulpv2+0x1e8>
1c0087c4:	4302                	lw	t1,0(sp)
1c0087c6:	57b2                	lw	a5,44(sp)
1c0087c8:	45d2                	lw	a1,20(sp)
1c0087ca:	4412                	lw	s0,4(sp)
1c0087cc:	406784b3          	sub	s1,a5,t1
1c0087d0:	14f9                	addi	s1,s1,-2
1c0087d2:	49f2                	lw	s3,28(sp)
1c0087d4:	8085                	srli	s1,s1,0x1
1c0087d6:	00b40ab3          	add	s5,s0,a1
1c0087da:	891a                	mv	s2,t1
1c0087dc:	8a2e                	mv	s4,a1
1c0087de:	0485                	addi	s1,s1,1
1c0087e0:	0344c07b          	lp.setup	x0,s1,1c008848 <plp_mat_mult_i16v_xpulpv2+0xfa>
1c0087e4:	140b8463          	beqz	s7,1c00892c <plp_mat_mult_i16v_xpulpv2+0x1de>
1c0087e8:	4312                	lw	t1,4(sp)
1c0087ea:	416c8633          	sub	a2,s9,s6
1c0087ee:	1671                	addi	a2,a2,-4
1c0087f0:	8209                	srli	a2,a2,0x2
1c0087f2:	012303b3          	add	t2,t1,s2
1c0087f6:	82ca                	mv	t0,s2
1c0087f8:	8fe2                	mv	t6,s8
1c0087fa:	8f6a                	mv	t5,s10
1c0087fc:	8eda                	mv	t4,s6
1c0087fe:	4e01                	li	t3,0
1c008800:	4301                	li	t1,0
1c008802:	4881                	li	a7,0
1c008804:	0605                	addi	a2,a2,1
1c008806:	012640fb          	lp.setup	x1,a2,1c00882a <plp_mat_mult_i16v_xpulpv2+0xdc>
1c00880a:	11b3f40b          	p.lh	s0,s11(t2!)
1c00880e:	11b2f78b          	p.lh	a5,s11(t0!)
1c008812:	004ea80b          	p.lw	a6,4(t4!)
1c008816:	004f250b          	p.lw	a0,4(t5!)
1c00881a:	004fa58b          	p.lw	a1,4(t6!)
1c00881e:	d0f407d7          	pv.pack.h	a5,s0,a5
1c008822:	b8f808d7          	pv.sdotsp.h	a7,a6,a5
1c008826:	b8f50357          	pv.sdotsp.h	t1,a0,a5
1c00882a:	b8f58e57          	pv.sdotsp.h	t3,a1,a5
1c00882e:	1008c8b3          	p.exths	a7,a7
1c008832:	10034333          	p.exths	t1,t1
1c008836:	100e4e33          	p.exths	t3,t3
1c00883a:	885e                	mv	a6,s7
1c00883c:	0119912b          	p.sh	a7,2(s3!) # 640002 <__l1_heap_size+0x631816>
1c008840:	006a112b          	p.sh	t1,2(s4!)
1c008844:	01ca912b          	p.sh	t3,2(s5!)
1c008848:	0909                	addi	s2,s2,2
1c00884a:	88ba                	mv	a7,a4
1c00884c:	5602                	lw	a2,32(sp)
1c00884e:	45f2                	lw	a1,28(sp)
1c008850:	47d2                	lw	a5,20(sp)
1c008852:	4462                	lw	s0,24(sp)
1c008854:	4342                	lw	t1,16(sp)
1c008856:	95b2                	add	a1,a1,a2
1c008858:	97b2                	add	a5,a5,a2
1c00885a:	4632                	lw	a2,12(sp)
1c00885c:	0405                	addi	s0,s0,1
1c00885e:	cc22                	sw	s0,24(sp)
1c008860:	ce2e                	sw	a1,28(sp)
1c008862:	ca3e                	sw	a5,20(sp)
1c008864:	9b1a                	add	s6,s6,t1
1c008866:	9d1a                	add	s10,s10,t1
1c008868:	9c1a                	add	s8,s8,t1
1c00886a:	9c9a                	add	s9,s9,t1
1c00886c:	f4c41ae3          	bne	s0,a2,1c0087c0 <plp_mat_mult_i16v_xpulpv2+0x72>
1c008870:	00161793          	slli	a5,a2,0x1
1c008874:	5c92                	lw	s9,36(sp)
1c008876:	963e                	add	a2,a2,a5
1c008878:	c632                	sw	a2,12(sp)
1c00887a:	0806                	slli	a6,a6,0x1
1c00887c:	0acc8f63          	beq	s9,a2,1c00893a <plp_mat_mult_i16v_xpulpv2+0x1ec>
1c008880:	0c089463          	bnez	a7,1c008948 <plp_mat_mult_i16v_xpulpv2+0x1fa>
1c008884:	4cb2                	lw	s9,12(sp)
1c008886:	5312                	lw	t1,36(sp)
1c008888:	086cf463          	bleu	t1,s9,1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c2>
1c00888c:	4e22                	lw	t3,8(sp)
1c00888e:	00169f93          	slli	t6,a3,0x1
1c008892:	001c8e93          	addi	t4,s9,1
1c008896:	02ec8f33          	mul	t5,s9,a4
1c00889a:	00171293          	slli	t0,a4,0x1
1c00889e:	43fe8e33          	p.mac	t3,t4,t6
1c0088a2:	02dc8333          	mul	t1,s9,a3
1c0088a6:	04e8fc63          	bleu	a4,a7,1c0088fe <plp_mat_mult_i16v_xpulpv2+0x1b0>
1c0088aa:	57a2                	lw	a5,40(sp)
1c0088ac:	01e883b3          	add	t2,a7,t5
1c0088b0:	0386                	slli	t2,t2,0x1
1c0088b2:	93be                	add	t2,t2,a5
1c0088b4:	41170533          	sub	a0,a4,a7
1c0088b8:	0225407b          	lp.setup	x0,a0,1c0088fc <plp_mat_mult_i16v_xpulpv2+0x1ae>
1c0088bc:	4581                	li	a1,0
1c0088be:	02d87d63          	bleu	a3,a6,1c0088f8 <plp_mat_mult_i16v_xpulpv2+0x1aa>
1c0088c2:	8646                	mv	a2,a7
1c0088c4:	43070633          	p.mac	a2,a4,a6
1c0088c8:	4422                	lw	s0,8(sp)
1c0088ca:	981a                	add	a6,a6,t1
1c0088cc:	0806                	slli	a6,a6,0x1
1c0088ce:	9822                	add	a6,a6,s0
1c0088d0:	410e07b3          	sub	a5,t3,a6
1c0088d4:	4c82                	lw	s9,0(sp)
1c0088d6:	17f9                	addi	a5,a5,-2
1c0088d8:	8385                	srli	a5,a5,0x1
1c0088da:	4581                	li	a1,0
1c0088dc:	0606                	slli	a2,a2,0x1
1c0088de:	0785                	addi	a5,a5,1
1c0088e0:	9666                	add	a2,a2,s9
1c0088e2:	0067c0fb          	lp.setup	x1,a5,1c0088ee <plp_mat_mult_i16v_xpulpv2+0x1a0>
1c0088e6:	0028140b          	p.lh	s0,2(a6!)
1c0088ea:	1056748b          	p.lh	s1,t0(a2!)
1c0088ee:	428485b3          	p.mac	a1,s1,s0
1c0088f2:	1005c5b3          	p.exths	a1,a1
1c0088f6:	8836                	mv	a6,a3
1c0088f8:	00b3912b          	p.sh	a1,2(t2!)
1c0088fc:	0885                	addi	a7,a7,1
1c0088fe:	c676                	sw	t4,12(sp)
1c008900:	5412                	lw	s0,36(sp)
1c008902:	4632                	lw	a2,12(sp)
1c008904:	9f3a                	add	t5,t5,a4
1c008906:	9e7e                	add	t3,t3,t6
1c008908:	9336                	add	t1,t1,a3
1c00890a:	0e85                	addi	t4,t4,1
1c00890c:	f8c41de3          	bne	s0,a2,1c0088a6 <plp_mat_mult_i16v_xpulpv2+0x158>
1c008910:	4476                	lw	s0,92(sp)
1c008912:	44e6                	lw	s1,88(sp)
1c008914:	4956                	lw	s2,84(sp)
1c008916:	49c6                	lw	s3,80(sp)
1c008918:	4a36                	lw	s4,76(sp)
1c00891a:	4aa6                	lw	s5,72(sp)
1c00891c:	4b16                	lw	s6,68(sp)
1c00891e:	4b86                	lw	s7,64(sp)
1c008920:	5c72                	lw	s8,60(sp)
1c008922:	5ce2                	lw	s9,56(sp)
1c008924:	5d52                	lw	s10,52(sp)
1c008926:	5dc2                	lw	s11,48(sp)
1c008928:	6125                	addi	sp,sp,96
1c00892a:	8082                	ret
1c00892c:	4801                	li	a6,0
1c00892e:	4e01                	li	t3,0
1c008930:	4301                	li	t1,0
1c008932:	4881                	li	a7,0
1c008934:	b721                	j	1c00883c <plp_mat_mult_i16v_xpulpv2+0xee>
1c008936:	4881                	li	a7,0
1c008938:	bf11                	j	1c00884c <plp_mat_mult_i16v_xpulpv2+0xfe>
1c00893a:	f4d813e3          	bne	a6,a3,1c008880 <plp_mat_mult_i16v_xpulpv2+0x132>
1c00893e:	fd1709e3          	beq	a4,a7,1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c2>
1c008942:	4632                	lw	a2,12(sp)
1c008944:	d671                	beqz	a2,1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c2>
1c008946:	bf2d                	j	1c008880 <plp_mat_mult_i16v_xpulpv2+0x132>
1c008948:	f2080ee3          	beqz	a6,1c008884 <plp_mat_mult_i16v_xpulpv2+0x136>
1c00894c:	4b02                	lw	s6,0(sp)
1c00894e:	00171993          	slli	s3,a4,0x1
1c008952:	5422                	lw	s0,40(sp)
1c008954:	43380b33          	p.mac	s6,a6,s3
1c008958:	4622                	lw	a2,8(sp)
1c00895a:	00189c13          	slli	s8,a7,0x1
1c00895e:	00169493          	slli	s1,a3,0x1
1c008962:	01840bb3          	add	s7,s0,s8
1c008966:	00181293          	slli	t0,a6,0x1
1c00896a:	00960433          	add	s0,a2,s1
1c00896e:	41100ab3          	neg	s5,a7
1c008972:	895e                	mv	s2,s7
1c008974:	92b2                	add	t0,t0,a2
1c008976:	0a86                	slli	s5,s5,0x1
1c008978:	83a2                	mv	t2,s0
1c00897a:	4a01                	li	s4,0
1c00897c:	012a8f33          	add	t5,s5,s2
1c008980:	41e90eb3          	sub	t4,s2,t5
1c008984:	1ef9                	addi	t4,t4,-2
1c008986:	001ede93          	srli	t4,t4,0x1
1c00898a:	8fda                	mv	t6,s6
1c00898c:	0e85                	addi	t4,t4,1
1c00898e:	01dec07b          	lp.setup	x0,t4,1c0089c8 <plp_mat_mult_i16v_xpulpv2+0x27a>
1c008992:	4601                	li	a2,0
1c008994:	02d87663          	bleu	a3,a6,1c0089c0 <plp_mat_mult_i16v_xpulpv2+0x272>
1c008998:	405387b3          	sub	a5,t2,t0
1c00899c:	17f9                	addi	a5,a5,-2
1c00899e:	8385                	srli	a5,a5,0x1
1c0089a0:	857e                	mv	a0,t6
1c0089a2:	8596                	mv	a1,t0
1c0089a4:	4601                	li	a2,0
1c0089a6:	0785                	addi	a5,a5,1
1c0089a8:	0097c0fb          	lp.setup	x1,a5,1c0089ba <plp_mat_mult_i16v_xpulpv2+0x26c>
1c0089ac:	0025930b          	p.lh	t1,2(a1!) # 10002 <__l1_heap_size+0x1816>
1c0089b0:	11357e0b          	p.lh	t3,s3(a0!)
1c0089b4:	8cb2                	mv	s9,a2
1c0089b6:	426e0cb3          	p.mac	s9,t3,t1
1c0089ba:	9666                	add	a2,a2,s9
1c0089bc:	10065633          	p.exthz	a2,a2
1c0089c0:	000f1783          	lh	a5,0(t5)
1c0089c4:	0f89                	addi	t6,t6,2
1c0089c6:	963e                	add	a2,a2,a5
1c0089c8:	00cf112b          	p.sh	a2,2(t5!)
1c0089cc:	4332                	lw	t1,12(sp)
1c0089ce:	0a05                	addi	s4,s4,1
1c0089d0:	994e                	add	s2,s2,s3
1c0089d2:	92a6                	add	t0,t0,s1
1c0089d4:	93a6                	add	t2,t2,s1
1c0089d6:	fa6a63e3          	bltu	s4,t1,1c00897c <plp_mat_mult_i16v_xpulpv2+0x22e>
1c0089da:	06e8f063          	bleu	a4,a7,1c008a3a <plp_mat_mult_i16v_xpulpv2+0x2ec>
1c0089de:	4582                	lw	a1,0(sp)
1c0089e0:	4ea2                	lw	t4,8(sp)
1c0089e2:	4f01                	li	t5,0
1c0089e4:	9c2e                	add	s8,s8,a1
1c0089e6:	01358fb3          	add	t6,a1,s3
1c0089ea:	418f88b3          	sub	a7,t6,s8
1c0089ee:	18f9                	addi	a7,a7,-2
1c0089f0:	0018d893          	srli	a7,a7,0x1
1c0089f4:	8362                	mv	t1,s8
1c0089f6:	8e5e                	mv	t3,s7
1c0089f8:	0885                	addi	a7,a7,1
1c0089fa:	0188c07b          	lp.setup	x0,a7,1c008a2a <plp_mat_mult_i16v_xpulpv2+0x2dc>
1c0089fe:	4601                	li	a2,0
1c008a00:	c29d                	beqz	a3,1c008a26 <plp_mat_mult_i16v_xpulpv2+0x2d8>
1c008a02:	41d407b3          	sub	a5,s0,t4
1c008a06:	17f9                	addi	a5,a5,-2
1c008a08:	8385                	srli	a5,a5,0x1
1c008a0a:	851a                	mv	a0,t1
1c008a0c:	85f6                	mv	a1,t4
1c008a0e:	4601                	li	a2,0
1c008a10:	0785                	addi	a5,a5,1
1c008a12:	0067c0fb          	lp.setup	x1,a5,1c008a1e <plp_mat_mult_i16v_xpulpv2+0x2d0>
1c008a16:	0025980b          	p.lh	a6,2(a1!)
1c008a1a:	1135728b          	p.lh	t0,s3(a0!)
1c008a1e:	43028633          	p.mac	a2,t0,a6
1c008a22:	10064633          	p.exths	a2,a2
1c008a26:	00ce112b          	p.sh	a2,2(t3!)
1c008a2a:	0309                	addi	t1,t1,2
1c008a2c:	4632                	lw	a2,12(sp)
1c008a2e:	0f05                	addi	t5,t5,1
1c008a30:	9bce                	add	s7,s7,s3
1c008a32:	9ea6                	add	t4,t4,s1
1c008a34:	9426                	add	s0,s0,s1
1c008a36:	facf6ae3          	bltu	t5,a2,1c0089ea <plp_mat_mult_i16v_xpulpv2+0x29c>
1c008a3a:	4cb2                	lw	s9,12(sp)
1c008a3c:	5312                	lw	t1,36(sp)
1c008a3e:	ec6cf9e3          	bleu	t1,s9,1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c2>
1c008a42:	ec0707e3          	beqz	a4,1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c2>
1c008a46:	5fa2                	lw	t6,40(sp)
1c008a48:	4f22                	lw	t5,8(sp)
1c008a4a:	43a2                	lw	t2,8(sp)
1c008a4c:	001c8e93          	addi	t4,s9,1
1c008a50:	433c8fb3          	p.mac	t6,s9,s3
1c008a54:	4402                	lw	s0,0(sp)
1c008a56:	013402b3          	add	t0,s0,s3
1c008a5a:	429c8f33          	p.mac	t5,s9,s1
1c008a5e:	429e83b3          	p.mac	t2,t4,s1
1c008a62:	4302                	lw	t1,0(sp)
1c008a64:	8e7e                	mv	t3,t6
1c008a66:	406288b3          	sub	a7,t0,t1
1c008a6a:	18f9                	addi	a7,a7,-2
1c008a6c:	0018d893          	srli	a7,a7,0x1
1c008a70:	0885                	addi	a7,a7,1
1c008a72:	0188c07b          	lp.setup	x0,a7,1c008aa2 <plp_mat_mult_i16v_xpulpv2+0x354>
1c008a76:	4701                	li	a4,0
1c008a78:	c29d                	beqz	a3,1c008a9e <plp_mat_mult_i16v_xpulpv2+0x350>
1c008a7a:	41e387b3          	sub	a5,t2,t5
1c008a7e:	17f9                	addi	a5,a5,-2
1c008a80:	8385                	srli	a5,a5,0x1
1c008a82:	859a                	mv	a1,t1
1c008a84:	867a                	mv	a2,t5
1c008a86:	4701                	li	a4,0
1c008a88:	0785                	addi	a5,a5,1
1c008a8a:	0067c0fb          	lp.setup	x1,a5,1c008a96 <plp_mat_mult_i16v_xpulpv2+0x348>
1c008a8e:	0026150b          	p.lh	a0,2(a2!) # 90000002 <pulp__FC+0x90000003>
1c008a92:	1135f80b          	p.lh	a6,s3(a1!)
1c008a96:	42a80733          	p.mac	a4,a6,a0
1c008a9a:	10074733          	p.exths	a4,a4
1c008a9e:	00ee112b          	p.sh	a4,2(t3!)
1c008aa2:	0309                	addi	t1,t1,2
1c008aa4:	c676                	sw	t4,12(sp)
1c008aa6:	5612                	lw	a2,36(sp)
1c008aa8:	4cb2                	lw	s9,12(sp)
1c008aaa:	9fce                	add	t6,t6,s3
1c008aac:	9f26                	add	t5,t5,s1
1c008aae:	93a6                	add	t2,t2,s1
1c008ab0:	0e85                	addi	t4,t4,1
1c008ab2:	fb9618e3          	bne	a2,s9,1c008a62 <plp_mat_mult_i16v_xpulpv2+0x314>
1c008ab6:	bda9                	j	1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c2>
1c008ab8:	841a                	mv	s0,t1
1c008aba:	4801                	li	a6,0
1c008abc:	dc0314e3          	bnez	t1,1c008884 <plp_mat_mult_i16v_xpulpv2+0x136>
1c008ac0:	e50698e3          	bne	a3,a6,1c008910 <plp_mat_mult_i16v_xpulpv2+0x1c2>
1c008ac4:	c622                	sw	s0,12(sp)
1c008ac6:	bda5                	j	1c00893e <plp_mat_mult_i16v_xpulpv2+0x1f0>

1c008ac8 <main>:
1c008ac8:	1101                	addi	sp,sp,-32
1c008aca:	4681                	li	a3,0
1c008acc:	4601                	li	a2,0
1c008ace:	4581                	li	a1,0
1c008ad0:	4505                	li	a0,1
1c008ad2:	ce06                	sw	ra,28(sp)
1c008ad4:	2559                	jal	1c00915a <rt_cluster_mount>
1c008ad6:	1c008637          	lui	a2,0x1c008
1c008ada:	4881                	li	a7,0
1c008adc:	4801                	li	a6,0
1c008ade:	4781                	li	a5,0
1c008ae0:	4701                	li	a4,0
1c008ae2:	4681                	li	a3,0
1c008ae4:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c008ae8:	4581                	li	a1,0
1c008aea:	c002                	sw	zero,0(sp)
1c008aec:	4501                	li	a0,0
1c008aee:	2bc9                	jal	1c0090c0 <rt_cluster_call>
1c008af0:	4501                	li	a0,0
1c008af2:	4681                	li	a3,0
1c008af4:	4601                	li	a2,0
1c008af6:	4581                	li	a1,0
1c008af8:	258d                	jal	1c00915a <rt_cluster_mount>
1c008afa:	40f2                	lw	ra,28(sp)
1c008afc:	4501                	li	a0,0
1c008afe:	6105                	addi	sp,sp,32
1c008b00:	8082                	ret

1c008b02 <rt_user_alloc_init>:
1c008b02:	00758793          	addi	a5,a1,7
1c008b06:	9be1                	andi	a5,a5,-8
1c008b08:	40b785b3          	sub	a1,a5,a1
1c008b0c:	c11c                	sw	a5,0(a0)
1c008b0e:	8e0d                	sub	a2,a2,a1
1c008b10:	00c05663          	blez	a2,1c008b1c <rt_user_alloc_init+0x1a>
1c008b14:	9a61                	andi	a2,a2,-8
1c008b16:	c390                	sw	a2,0(a5)
1c008b18:	0007a223          	sw	zero,4(a5)
1c008b1c:	8082                	ret

1c008b1e <rt_user_alloc>:
1c008b1e:	411c                	lw	a5,0(a0)
1c008b20:	059d                	addi	a1,a1,7
1c008b22:	99e1                	andi	a1,a1,-8
1c008b24:	4681                	li	a3,0
1c008b26:	cb89                	beqz	a5,1c008b38 <rt_user_alloc+0x1a>
1c008b28:	4398                	lw	a4,0(a5)
1c008b2a:	00b74963          	blt	a4,a1,1c008b3c <rt_user_alloc+0x1e>
1c008b2e:	00b71c63          	bne	a4,a1,1c008b46 <rt_user_alloc+0x28>
1c008b32:	43d8                	lw	a4,4(a5)
1c008b34:	c699                	beqz	a3,1c008b42 <rt_user_alloc+0x24>
1c008b36:	c2d8                	sw	a4,4(a3)
1c008b38:	853e                	mv	a0,a5
1c008b3a:	8082                	ret
1c008b3c:	86be                	mv	a3,a5
1c008b3e:	43dc                	lw	a5,4(a5)
1c008b40:	b7dd                	j	1c008b26 <rt_user_alloc+0x8>
1c008b42:	c118                	sw	a4,0(a0)
1c008b44:	bfd5                	j	1c008b38 <rt_user_alloc+0x1a>
1c008b46:	8f0d                	sub	a4,a4,a1
1c008b48:	c398                	sw	a4,0(a5)
1c008b4a:	97ba                	add	a5,a5,a4
1c008b4c:	b7f5                	j	1c008b38 <rt_user_alloc+0x1a>

1c008b4e <rt_user_free>:
1c008b4e:	411c                	lw	a5,0(a0)
1c008b50:	061d                	addi	a2,a2,7
1c008b52:	9a61                	andi	a2,a2,-8
1c008b54:	4701                	li	a4,0
1c008b56:	c399                	beqz	a5,1c008b5c <rt_user_free+0xe>
1c008b58:	02b7e763          	bltu	a5,a1,1c008b86 <rt_user_free+0x38>
1c008b5c:	00c586b3          	add	a3,a1,a2
1c008b60:	02d79663          	bne	a5,a3,1c008b8c <rt_user_free+0x3e>
1c008b64:	4394                	lw	a3,0(a5)
1c008b66:	43dc                	lw	a5,4(a5)
1c008b68:	9636                	add	a2,a2,a3
1c008b6a:	c190                	sw	a2,0(a1)
1c008b6c:	c1dc                	sw	a5,4(a1)
1c008b6e:	c31d                	beqz	a4,1c008b94 <rt_user_free+0x46>
1c008b70:	4314                	lw	a3,0(a4)
1c008b72:	00d707b3          	add	a5,a4,a3
1c008b76:	00f59d63          	bne	a1,a5,1c008b90 <rt_user_free+0x42>
1c008b7a:	419c                	lw	a5,0(a1)
1c008b7c:	97b6                	add	a5,a5,a3
1c008b7e:	c31c                	sw	a5,0(a4)
1c008b80:	41dc                	lw	a5,4(a1)
1c008b82:	c35c                	sw	a5,4(a4)
1c008b84:	8082                	ret
1c008b86:	873e                	mv	a4,a5
1c008b88:	43dc                	lw	a5,4(a5)
1c008b8a:	b7f1                	j	1c008b56 <rt_user_free+0x8>
1c008b8c:	c190                	sw	a2,0(a1)
1c008b8e:	bff9                	j	1c008b6c <rt_user_free+0x1e>
1c008b90:	c34c                	sw	a1,4(a4)
1c008b92:	8082                	ret
1c008b94:	c10c                	sw	a1,0(a0)
1c008b96:	8082                	ret

1c008b98 <rt_alloc>:
1c008b98:	1101                	addi	sp,sp,-32
1c008b9a:	cc22                	sw	s0,24(sp)
1c008b9c:	ce06                	sw	ra,28(sp)
1c008b9e:	ca26                	sw	s1,20(sp)
1c008ba0:	c84a                	sw	s2,16(sp)
1c008ba2:	c64e                	sw	s3,12(sp)
1c008ba4:	c452                	sw	s4,8(sp)
1c008ba6:	4789                	li	a5,2
1c008ba8:	842a                	mv	s0,a0
1c008baa:	02a7ed63          	bltu	a5,a0,1c008be4 <rt_alloc+0x4c>
1c008bae:	1c001937          	lui	s2,0x1c001
1c008bb2:	89ae                	mv	s3,a1
1c008bb4:	448d                	li	s1,3
1c008bb6:	1c890913          	addi	s2,s2,456 # 1c0011c8 <__rt_alloc_l2>
1c008bba:	4a0d                	li	s4,3
1c008bbc:	00241513          	slli	a0,s0,0x2
1c008bc0:	85ce                	mv	a1,s3
1c008bc2:	954a                	add	a0,a0,s2
1c008bc4:	3fa9                	jal	1c008b1e <rt_user_alloc>
1c008bc6:	e519                	bnez	a0,1c008bd4 <rt_alloc+0x3c>
1c008bc8:	0405                	addi	s0,s0,1
1c008bca:	01441363          	bne	s0,s4,1c008bd0 <rt_alloc+0x38>
1c008bce:	4401                	li	s0,0
1c008bd0:	14fd                	addi	s1,s1,-1
1c008bd2:	f4ed                	bnez	s1,1c008bbc <rt_alloc+0x24>
1c008bd4:	40f2                	lw	ra,28(sp)
1c008bd6:	4462                	lw	s0,24(sp)
1c008bd8:	44d2                	lw	s1,20(sp)
1c008bda:	4942                	lw	s2,16(sp)
1c008bdc:	49b2                	lw	s3,12(sp)
1c008bde:	4a22                	lw	s4,8(sp)
1c008be0:	6105                	addi	sp,sp,32
1c008be2:	8082                	ret
1c008be4:	1c0017b7          	lui	a5,0x1c001
1c008be8:	ffd50413          	addi	s0,a0,-3
1c008bec:	1c47a503          	lw	a0,452(a5) # 1c0011c4 <__rt_alloc_l1>
1c008bf0:	040a                	slli	s0,s0,0x2
1c008bf2:	40f2                	lw	ra,28(sp)
1c008bf4:	9522                	add	a0,a0,s0
1c008bf6:	4462                	lw	s0,24(sp)
1c008bf8:	44d2                	lw	s1,20(sp)
1c008bfa:	4942                	lw	s2,16(sp)
1c008bfc:	49b2                	lw	s3,12(sp)
1c008bfe:	4a22                	lw	s4,8(sp)
1c008c00:	6105                	addi	sp,sp,32
1c008c02:	bf31                	j	1c008b1e <rt_user_alloc>

1c008c04 <__rt_alloc_init_l1>:
1c008c04:	1c0017b7          	lui	a5,0x1c001
1c008c08:	1c47a703          	lw	a4,452(a5) # 1c0011c4 <__rt_alloc_l1>
1c008c0c:	100027b7          	lui	a5,0x10002
1c008c10:	01651593          	slli	a1,a0,0x16
1c008c14:	6639                	lui	a2,0xe
1c008c16:	050a                	slli	a0,a0,0x2
1c008c18:	81478793          	addi	a5,a5,-2028 # 10001814 <__l1_end>
1c008c1c:	7ec60613          	addi	a2,a2,2028 # e7ec <__l1_heap_size>
1c008c20:	95be                	add	a1,a1,a5
1c008c22:	953a                	add	a0,a0,a4
1c008c24:	bdf9                	j	1c008b02 <rt_user_alloc_init>

1c008c26 <__rt_alloc_init_l1_for_fc>:
1c008c26:	100025b7          	lui	a1,0x10002
1c008c2a:	01651793          	slli	a5,a0,0x16
1c008c2e:	81458593          	addi	a1,a1,-2028 # 10001814 <__l1_end>
1c008c32:	00b78733          	add	a4,a5,a1
1c008c36:	050a                	slli	a0,a0,0x2
1c008c38:	0791                	addi	a5,a5,4
1c008c3a:	6639                	lui	a2,0xe
1c008c3c:	1c0016b7          	lui	a3,0x1c001
1c008c40:	7e860613          	addi	a2,a2,2024 # e7e8 <_l1_preload_size+0xcfd8>
1c008c44:	95be                	add	a1,a1,a5
1c008c46:	953a                	add	a0,a0,a4
1c008c48:	1ce6a223          	sw	a4,452(a3) # 1c0011c4 <__rt_alloc_l1>
1c008c4c:	bd5d                	j	1c008b02 <rt_user_alloc_init>

1c008c4e <__rt_allocs_init>:
1c008c4e:	1141                	addi	sp,sp,-16
1c008c50:	1c0015b7          	lui	a1,0x1c001
1c008c54:	c606                	sw	ra,12(sp)
1c008c56:	21458793          	addi	a5,a1,532 # 1c001214 <__l2_priv0_end>
1c008c5a:	1c008637          	lui	a2,0x1c008
1c008c5e:	06c7ca63          	blt	a5,a2,1c008cd2 <__rt_allocs_init+0x84>
1c008c62:	4581                	li	a1,0
1c008c64:	4601                	li	a2,0
1c008c66:	1c001537          	lui	a0,0x1c001
1c008c6a:	1c850513          	addi	a0,a0,456 # 1c0011c8 <__rt_alloc_l2>
1c008c6e:	3d51                	jal	1c008b02 <rt_user_alloc_init>
1c008c70:	1c00b5b7          	lui	a1,0x1c00b
1c008c74:	5a858793          	addi	a5,a1,1448 # 1c00b5a8 <__l2_priv1_end>
1c008c78:	1c010637          	lui	a2,0x1c010
1c008c7c:	04c7cf63          	blt	a5,a2,1c008cda <__rt_allocs_init+0x8c>
1c008c80:	4581                	li	a1,0
1c008c82:	4601                	li	a2,0
1c008c84:	1c001537          	lui	a0,0x1c001
1c008c88:	1cc50513          	addi	a0,a0,460 # 1c0011cc <__rt_alloc_l2+0x4>
1c008c8c:	3d9d                	jal	1c008b02 <rt_user_alloc_init>
1c008c8e:	1c0125b7          	lui	a1,0x1c012
1c008c92:	99858793          	addi	a5,a1,-1640 # 1c011998 <__l2_shared_end>
1c008c96:	1c080637          	lui	a2,0x1c080
1c008c9a:	1c001537          	lui	a0,0x1c001
1c008c9e:	8e1d                	sub	a2,a2,a5
1c008ca0:	99858593          	addi	a1,a1,-1640
1c008ca4:	1d050513          	addi	a0,a0,464 # 1c0011d0 <__rt_alloc_l2+0x8>
1c008ca8:	3da9                	jal	1c008b02 <rt_user_alloc_init>
1c008caa:	f14027f3          	csrr	a5,mhartid
1c008cae:	8795                	srai	a5,a5,0x5
1c008cb0:	03f7f793          	andi	a5,a5,63
1c008cb4:	e789                	bnez	a5,1c008cbe <__rt_allocs_init+0x70>
1c008cb6:	40b2                	lw	ra,12(sp)
1c008cb8:	4501                	li	a0,0
1c008cba:	0141                	addi	sp,sp,16
1c008cbc:	b7ad                	j	1c008c26 <__rt_alloc_init_l1_for_fc>
1c008cbe:	4591                	li	a1,4
1c008cc0:	4501                	li	a0,0
1c008cc2:	3dd9                	jal	1c008b98 <rt_alloc>
1c008cc4:	40b2                	lw	ra,12(sp)
1c008cc6:	1c0017b7          	lui	a5,0x1c001
1c008cca:	1ca7a223          	sw	a0,452(a5) # 1c0011c4 <__rt_alloc_l1>
1c008cce:	0141                	addi	sp,sp,16
1c008cd0:	8082                	ret
1c008cd2:	8e1d                	sub	a2,a2,a5
1c008cd4:	21458593          	addi	a1,a1,532
1c008cd8:	b779                	j	1c008c66 <__rt_allocs_init+0x18>
1c008cda:	8e1d                	sub	a2,a2,a5
1c008cdc:	5a858593          	addi	a1,a1,1448
1c008ce0:	b755                	j	1c008c84 <__rt_allocs_init+0x36>

1c008ce2 <__rt_init_cluster_data>:
1c008ce2:	04050793          	addi	a5,a0,64
1c008ce6:	01679693          	slli	a3,a5,0x16
1c008cea:	6705                	lui	a4,0x1
1c008cec:	177d                	addi	a4,a4,-1
1c008cee:	00400793          	li	a5,4
1c008cf2:	8ff9                	and	a5,a5,a4
1c008cf4:	1c010737          	lui	a4,0x1c010
1c008cf8:	97b6                	add	a5,a5,a3
1c008cfa:	6609                	lui	a2,0x2
1c008cfc:	18870713          	addi	a4,a4,392 # 1c010188 <_l1_preload_start_inL2>
1c008d00:	81060613          	addi	a2,a2,-2032 # 1810 <_l1_preload_size>
1c008d04:	8f99                	sub	a5,a5,a4
1c008d06:	00f705b3          	add	a1,a4,a5
1c008d0a:	02c04b63          	bgtz	a2,1c008d40 <__rt_init_cluster_data+0x5e>
1c008d0e:	02800713          	li	a4,40
1c008d12:	02e50733          	mul	a4,a0,a4
1c008d16:	1c0017b7          	lui	a5,0x1c001
1c008d1a:	1d878513          	addi	a0,a5,472 # 1c0011d8 <__rt_fc_cluster_data>
1c008d1e:	002017b7          	lui	a5,0x201
1c008d22:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c008d26:	97b6                	add	a5,a5,a3
1c008d28:	953a                	add	a0,a0,a4
1c008d2a:	c91c                	sw	a5,16(a0)
1c008d2c:	6705                	lui	a4,0x1
1c008d2e:	00400793          	li	a5,4
1c008d32:	177d                	addi	a4,a4,-1
1c008d34:	8ff9                	and	a5,a5,a4
1c008d36:	97b6                	add	a5,a5,a3
1c008d38:	00052423          	sw	zero,8(a0)
1c008d3c:	c95c                	sw	a5,20(a0)
1c008d3e:	8082                	ret
1c008d40:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008d44:	1671                	addi	a2,a2,-4
1c008d46:	0711                	addi	a4,a4,4
1c008d48:	0105a023          	sw	a6,0(a1)
1c008d4c:	bf6d                	j	1c008d06 <__rt_init_cluster_data+0x24>

1c008d4e <__rt_cluster_mount_step>:
1c008d4e:	7179                	addi	sp,sp,-48
1c008d50:	d04a                	sw	s2,32(sp)
1c008d52:	ce4e                	sw	s3,28(sp)
1c008d54:	6785                	lui	a5,0x1
1c008d56:	1c0089b7          	lui	s3,0x1c008
1c008d5a:	00400913          	li	s2,4
1c008d5e:	17fd                	addi	a5,a5,-1
1c008d60:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008d64:	d422                	sw	s0,40(sp)
1c008d66:	d606                	sw	ra,44(sp)
1c008d68:	d226                	sw	s1,36(sp)
1c008d6a:	cc52                	sw	s4,24(sp)
1c008d6c:	842a                	mv	s0,a0
1c008d6e:	00f97933          	and	s2,s2,a5
1c008d72:	f009f993          	andi	s3,s3,-256
1c008d76:	4c5c                	lw	a5,28(s0)
1c008d78:	4705                	li	a4,1
1c008d7a:	02e78d63          	beq	a5,a4,1c008db4 <__rt_cluster_mount_step+0x66>
1c008d7e:	4709                	li	a4,2
1c008d80:	0ae78d63          	beq	a5,a4,1c008e3a <__rt_cluster_mount_step+0xec>
1c008d84:	e7dd                	bnez	a5,1c008e32 <__rt_cluster_mount_step+0xe4>
1c008d86:	5018                	lw	a4,32(s0)
1c008d88:	00042c23          	sw	zero,24(s0)
1c008d8c:	eb01                	bnez	a4,1c008d9c <__rt_cluster_mount_step+0x4e>
1c008d8e:	5048                	lw	a0,36(s0)
1c008d90:	006c                	addi	a1,sp,12
1c008d92:	c602                	sw	zero,12(sp)
1c008d94:	1e8010ef          	jal	ra,1c009f7c <__rt_pmu_cluster_power_up>
1c008d98:	47b2                	lw	a5,12(sp)
1c008d9a:	cc08                	sw	a0,24(s0)
1c008d9c:	4c58                	lw	a4,28(s0)
1c008d9e:	0705                	addi	a4,a4,1
1c008da0:	cc58                	sw	a4,28(s0)
1c008da2:	dbf1                	beqz	a5,1c008d76 <__rt_cluster_mount_step+0x28>
1c008da4:	50b2                	lw	ra,44(sp)
1c008da6:	5422                	lw	s0,40(sp)
1c008da8:	5492                	lw	s1,36(sp)
1c008daa:	5902                	lw	s2,32(sp)
1c008dac:	49f2                	lw	s3,28(sp)
1c008dae:	4a62                	lw	s4,24(sp)
1c008db0:	6145                	addi	sp,sp,48
1c008db2:	8082                	ret
1c008db4:	02042a03          	lw	s4,32(s0)
1c008db8:	040a0493          	addi	s1,s4,64
1c008dbc:	04da                	slli	s1,s1,0x16
1c008dbe:	00990733          	add	a4,s2,s1
1c008dc2:	00072223          	sw	zero,4(a4)
1c008dc6:	00072423          	sw	zero,8(a4)
1c008dca:	00072023          	sw	zero,0(a4)
1c008dce:	1c001737          	lui	a4,0x1c001
1c008dd2:	0ac72703          	lw	a4,172(a4) # 1c0010ac <__rt_platform>
1c008dd6:	00f70f63          	beq	a4,a5,1c008df4 <__rt_cluster_mount_step+0xa6>
1c008dda:	4505                	li	a0,1
1c008ddc:	727000ef          	jal	ra,1c009d02 <__rt_fll_init>
1c008de0:	1c0017b7          	lui	a5,0x1c001
1c008de4:	20878793          	addi	a5,a5,520 # 1c001208 <__rt_freq_domains>
1c008de8:	43cc                	lw	a1,4(a5)
1c008dea:	c5b1                	beqz	a1,1c008e36 <__rt_cluster_mount_step+0xe8>
1c008dec:	4601                	li	a2,0
1c008dee:	4505                	li	a0,1
1c008df0:	0a8010ef          	jal	ra,1c009e98 <rt_freq_set_and_get>
1c008df4:	8552                	mv	a0,s4
1c008df6:	35f5                	jal	1c008ce2 <__rt_init_cluster_data>
1c008df8:	8552                	mv	a0,s4
1c008dfa:	3529                	jal	1c008c04 <__rt_alloc_init_l1>
1c008dfc:	002017b7          	lui	a5,0x201
1c008e00:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f2c14>
1c008e04:	97a6                	add	a5,a5,s1
1c008e06:	577d                	li	a4,-1
1c008e08:	c398                	sw	a4,0(a5)
1c008e0a:	002007b7          	lui	a5,0x200
1c008e0e:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f1854>
1c008e12:	06078793          	addi	a5,a5,96
1c008e16:	9726                	add	a4,a4,s1
1c008e18:	97a6                	add	a5,a5,s1
1c008e1a:	01372023          	sw	s3,0(a4)
1c008e1e:	0711                	addi	a4,a4,4
1c008e20:	fef71de3          	bne	a4,a5,1c008e1a <__rt_cluster_mount_step+0xcc>
1c008e24:	002007b7          	lui	a5,0x200
1c008e28:	07a1                	addi	a5,a5,8
1c008e2a:	94be                	add	s1,s1,a5
1c008e2c:	0ff00793          	li	a5,255
1c008e30:	c09c                	sw	a5,0(s1)
1c008e32:	4781                	li	a5,0
1c008e34:	b7a5                	j	1c008d9c <__rt_cluster_mount_step+0x4e>
1c008e36:	c3c8                	sw	a0,4(a5)
1c008e38:	bf75                	j	1c008df4 <__rt_cluster_mount_step+0xa6>
1c008e3a:	505c                	lw	a5,36(s0)
1c008e3c:	5b98                	lw	a4,48(a5)
1c008e3e:	d398                	sw	a4,32(a5)
1c008e40:	5798                	lw	a4,40(a5)
1c008e42:	c398                	sw	a4,0(a5)
1c008e44:	57d8                	lw	a4,44(a5)
1c008e46:	c3d8                	sw	a4,4(a5)
1c008e48:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f1844>
1c008e4c:	505c                	lw	a5,36(s0)
1c008e4e:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008e52:	0007ac23          	sw	zero,24(a5)
1c008e56:	cb01                	beqz	a4,1c008e66 <__rt_cluster_mount_step+0x118>
1c008e58:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008e5c:	cf1c                	sw	a5,24(a4)
1c008e5e:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008e62:	4785                	li	a5,1
1c008e64:	bf25                	j	1c008d9c <__rt_cluster_mount_step+0x4e>
1c008e66:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008e6a:	bfd5                	j	1c008e5e <__rt_cluster_mount_step+0x110>

1c008e6c <__rt_cluster_init>:
1c008e6c:	1c001537          	lui	a0,0x1c001
1c008e70:	1141                	addi	sp,sp,-16
1c008e72:	02800613          	li	a2,40
1c008e76:	4581                	li	a1,0
1c008e78:	1d850513          	addi	a0,a0,472 # 1c0011d8 <__rt_fc_cluster_data>
1c008e7c:	c606                	sw	ra,12(sp)
1c008e7e:	075010ef          	jal	ra,1c00a6f2 <memset>
1c008e82:	1c0085b7          	lui	a1,0x1c008
1c008e86:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008e8a:	4505                	li	a0,1
1c008e8c:	2bfd                	jal	1c00948a <rt_irq_set_handler>
1c008e8e:	f14027f3          	csrr	a5,mhartid
1c008e92:	8795                	srai	a5,a5,0x5
1c008e94:	03f7f793          	andi	a5,a5,63
1c008e98:	477d                	li	a4,31
1c008e9a:	02e79e63          	bne	a5,a4,1c008ed6 <__rt_cluster_init+0x6a>
1c008e9e:	1a10a7b7          	lui	a5,0x1a10a
1c008ea2:	4709                	li	a4,2
1c008ea4:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c008ea8:	1c0085b7          	lui	a1,0x1c008
1c008eac:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008eb0:	4511                	li	a0,4
1c008eb2:	2be1                	jal	1c00948a <rt_irq_set_handler>
1c008eb4:	f14027f3          	csrr	a5,mhartid
1c008eb8:	8795                	srai	a5,a5,0x5
1c008eba:	03f7f793          	andi	a5,a5,63
1c008ebe:	477d                	li	a4,31
1c008ec0:	02e79063          	bne	a5,a4,1c008ee0 <__rt_cluster_init+0x74>
1c008ec4:	1a10a7b7          	lui	a5,0x1a10a
1c008ec8:	4741                	li	a4,16
1c008eca:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c008ece:	40b2                	lw	ra,12(sp)
1c008ed0:	4501                	li	a0,0
1c008ed2:	0141                	addi	sp,sp,16
1c008ed4:	8082                	ret
1c008ed6:	002047b7          	lui	a5,0x204
1c008eda:	4709                	li	a4,2
1c008edc:	cbd8                	sw	a4,20(a5)
1c008ede:	b7e9                	j	1c008ea8 <__rt_cluster_init+0x3c>
1c008ee0:	002047b7          	lui	a5,0x204
1c008ee4:	4741                	li	a4,16
1c008ee6:	cbd8                	sw	a4,20(a5)
1c008ee8:	b7dd                	j	1c008ece <__rt_cluster_init+0x62>

1c008eea <pi_cluster_conf_init>:
1c008eea:	00052223          	sw	zero,4(a0)
1c008eee:	8082                	ret

1c008ef0 <pi_cluster_open>:
1c008ef0:	1101                	addi	sp,sp,-32
1c008ef2:	ce06                	sw	ra,28(sp)
1c008ef4:	cc22                	sw	s0,24(sp)
1c008ef6:	ca26                	sw	s1,20(sp)
1c008ef8:	c84a                	sw	s2,16(sp)
1c008efa:	c64e                	sw	s3,12(sp)
1c008efc:	30047973          	csrrci	s2,mstatus,8
1c008f00:	00452983          	lw	s3,4(a0)
1c008f04:	02800793          	li	a5,40
1c008f08:	0049a483          	lw	s1,4(s3)
1c008f0c:	02f484b3          	mul	s1,s1,a5
1c008f10:	1c0017b7          	lui	a5,0x1c001
1c008f14:	1d878793          	addi	a5,a5,472 # 1c0011d8 <__rt_fc_cluster_data>
1c008f18:	94be                	add	s1,s1,a5
1c008f1a:	c504                	sw	s1,8(a0)
1c008f1c:	3b7000ef          	jal	ra,1c009ad2 <__rt_wait_event_prepare_blocking>
1c008f20:	f14027f3          	csrr	a5,mhartid
1c008f24:	8795                	srai	a5,a5,0x5
1c008f26:	03f7f793          	andi	a5,a5,63
1c008f2a:	477d                	li	a4,31
1c008f2c:	842a                	mv	s0,a0
1c008f2e:	04e79463          	bne	a5,a4,1c008f76 <pi_cluster_open+0x86>
1c008f32:	511c                	lw	a5,32(a0)
1c008f34:	0004ae23          	sw	zero,28(s1)
1c008f38:	d0c8                	sw	a0,36(s1)
1c008f3a:	d91c                	sw	a5,48(a0)
1c008f3c:	411c                	lw	a5,0(a0)
1c008f3e:	02052223          	sw	zero,36(a0)
1c008f42:	d51c                	sw	a5,40(a0)
1c008f44:	415c                	lw	a5,4(a0)
1c008f46:	c144                	sw	s1,4(a0)
1c008f48:	d55c                	sw	a5,44(a0)
1c008f4a:	1c0097b7          	lui	a5,0x1c009
1c008f4e:	d4e78793          	addi	a5,a5,-690 # 1c008d4e <__rt_cluster_mount_step>
1c008f52:	c11c                	sw	a5,0(a0)
1c008f54:	4785                	li	a5,1
1c008f56:	d11c                	sw	a5,32(a0)
1c008f58:	8526                	mv	a0,s1
1c008f5a:	3bd5                	jal	1c008d4e <__rt_cluster_mount_step>
1c008f5c:	8522                	mv	a0,s0
1c008f5e:	4c5000ef          	jal	ra,1c009c22 <__rt_wait_event>
1c008f62:	30091073          	csrw	mstatus,s2
1c008f66:	40f2                	lw	ra,28(sp)
1c008f68:	4462                	lw	s0,24(sp)
1c008f6a:	44d2                	lw	s1,20(sp)
1c008f6c:	4942                	lw	s2,16(sp)
1c008f6e:	49b2                	lw	s3,12(sp)
1c008f70:	4501                	li	a0,0
1c008f72:	6105                	addi	sp,sp,32
1c008f74:	8082                	ret
1c008f76:	0049a483          	lw	s1,4(s3)
1c008f7a:	8526                	mv	a0,s1
1c008f7c:	339d                	jal	1c008ce2 <__rt_init_cluster_data>
1c008f7e:	04048513          	addi	a0,s1,64
1c008f82:	002017b7          	lui	a5,0x201
1c008f86:	055a                	slli	a0,a0,0x16
1c008f88:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f2c14>
1c008f8c:	97aa                	add	a5,a5,a0
1c008f8e:	577d                	li	a4,-1
1c008f90:	c398                	sw	a4,0(a5)
1c008f92:	1c0086b7          	lui	a3,0x1c008
1c008f96:	002007b7          	lui	a5,0x200
1c008f9a:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f1858>
1c008f9e:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c008fa2:	06078793          	addi	a5,a5,96
1c008fa6:	972a                	add	a4,a4,a0
1c008fa8:	97aa                	add	a5,a5,a0
1c008faa:	f006f693          	andi	a3,a3,-256
1c008fae:	c314                	sw	a3,0(a4)
1c008fb0:	0711                	addi	a4,a4,4
1c008fb2:	fef71ee3          	bne	a4,a5,1c008fae <pi_cluster_open+0xbe>
1c008fb6:	002007b7          	lui	a5,0x200
1c008fba:	07a1                	addi	a5,a5,8
1c008fbc:	953e                	add	a0,a0,a5
1c008fbe:	57fd                	li	a5,-1
1c008fc0:	c11c                	sw	a5,0(a0)
1c008fc2:	8522                	mv	a0,s0
1c008fc4:	3db000ef          	jal	ra,1c009b9e <rt_event_push>
1c008fc8:	bf51                	j	1c008f5c <pi_cluster_open+0x6c>

1c008fca <pi_cluster_close>:
1c008fca:	451c                	lw	a5,8(a0)
1c008fcc:	1101                	addi	sp,sp,-32
1c008fce:	cc22                	sw	s0,24(sp)
1c008fd0:	5380                	lw	s0,32(a5)
1c008fd2:	1c0017b7          	lui	a5,0x1c001
1c008fd6:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c008fda:	ce06                	sw	ra,28(sp)
1c008fdc:	4785                	li	a5,1
1c008fde:	00f70563          	beq	a4,a5,1c008fe8 <pi_cluster_close+0x1e>
1c008fe2:	4505                	li	a0,1
1c008fe4:	5d5000ef          	jal	ra,1c009db8 <__rt_fll_deinit>
1c008fe8:	c602                	sw	zero,12(sp)
1c008fea:	e409                	bnez	s0,1c008ff4 <pi_cluster_close+0x2a>
1c008fec:	006c                	addi	a1,sp,12
1c008fee:	4501                	li	a0,0
1c008ff0:	749000ef          	jal	ra,1c009f38 <__rt_pmu_cluster_power_down>
1c008ff4:	40f2                	lw	ra,28(sp)
1c008ff6:	4462                	lw	s0,24(sp)
1c008ff8:	4501                	li	a0,0
1c008ffa:	6105                	addi	sp,sp,32
1c008ffc:	8082                	ret

1c008ffe <__rt_cluster_push_fc_event>:
1c008ffe:	002047b7          	lui	a5,0x204
1c009002:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f58d4>
1c009006:	0007e703          	p.elw	a4,0(a5)
1c00900a:	f14027f3          	csrr	a5,mhartid
1c00900e:	8795                	srai	a5,a5,0x5
1c009010:	02800693          	li	a3,40
1c009014:	03f7f793          	andi	a5,a5,63
1c009018:	02d787b3          	mul	a5,a5,a3
1c00901c:	1c001737          	lui	a4,0x1c001
1c009020:	1d870713          	addi	a4,a4,472 # 1c0011d8 <__rt_fc_cluster_data>
1c009024:	4689                	li	a3,2
1c009026:	97ba                	add	a5,a5,a4
1c009028:	00204737          	lui	a4,0x204
1c00902c:	43d0                	lw	a2,4(a5)
1c00902e:	ee01                	bnez	a2,1c009046 <__rt_cluster_push_fc_event+0x48>
1c009030:	c3c8                	sw	a0,4(a5)
1c009032:	4709                	li	a4,2
1c009034:	1a10a7b7          	lui	a5,0x1a10a
1c009038:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa107ffc>
1c00903c:	002047b7          	lui	a5,0x204
1c009040:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f58d4>
1c009044:	8082                	ret
1c009046:	c714                	sw	a3,8(a4)
1c009048:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00904c:	c354                	sw	a3,4(a4)
1c00904e:	bff9                	j	1c00902c <__rt_cluster_push_fc_event+0x2e>

1c009050 <__rt_cluster_new>:
1c009050:	1c0095b7          	lui	a1,0x1c009
1c009054:	1141                	addi	sp,sp,-16
1c009056:	4601                	li	a2,0
1c009058:	e6c58593          	addi	a1,a1,-404 # 1c008e6c <__rt_cluster_init>
1c00905c:	4501                	li	a0,0
1c00905e:	c606                	sw	ra,12(sp)
1c009060:	2b6d                	jal	1c00961a <__rt_cbsys_add>
1c009062:	c105                	beqz	a0,1c009082 <__rt_cluster_new+0x32>
1c009064:	f1402673          	csrr	a2,mhartid
1c009068:	1c000537          	lui	a0,0x1c000
1c00906c:	40565593          	srai	a1,a2,0x5
1c009070:	03f5f593          	andi	a1,a1,63
1c009074:	8a7d                	andi	a2,a2,31
1c009076:	52850513          	addi	a0,a0,1320 # 1c000528 <__DTOR_END__+0x23c>
1c00907a:	0c5010ef          	jal	ra,1c00a93e <printf>
1c00907e:	04d010ef          	jal	ra,1c00a8ca <abort>
1c009082:	40b2                	lw	ra,12(sp)
1c009084:	0141                	addi	sp,sp,16
1c009086:	8082                	ret

1c009088 <__rt_cluster_pulpos_emu_init>:
1c009088:	1141                	addi	sp,sp,-16
1c00908a:	45b1                	li	a1,12
1c00908c:	4501                	li	a0,0
1c00908e:	c606                	sw	ra,12(sp)
1c009090:	3621                	jal	1c008b98 <rt_alloc>
1c009092:	1c0017b7          	lui	a5,0x1c001
1c009096:	18a7ac23          	sw	a0,408(a5) # 1c001198 <__rt_fc_cluster_device>
1c00909a:	e105                	bnez	a0,1c0090ba <__rt_cluster_pulpos_emu_init+0x32>
1c00909c:	f1402673          	csrr	a2,mhartid
1c0090a0:	1c000537          	lui	a0,0x1c000
1c0090a4:	40565593          	srai	a1,a2,0x5
1c0090a8:	03f5f593          	andi	a1,a1,63
1c0090ac:	8a7d                	andi	a2,a2,31
1c0090ae:	57050513          	addi	a0,a0,1392 # 1c000570 <__DTOR_END__+0x284>
1c0090b2:	08d010ef          	jal	ra,1c00a93e <printf>
1c0090b6:	015010ef          	jal	ra,1c00a8ca <abort>
1c0090ba:	40b2                	lw	ra,12(sp)
1c0090bc:	0141                	addi	sp,sp,16
1c0090be:	8082                	ret

1c0090c0 <rt_cluster_call>:
1c0090c0:	7139                	addi	sp,sp,-64
1c0090c2:	d84a                	sw	s2,48(sp)
1c0090c4:	4906                	lw	s2,64(sp)
1c0090c6:	dc22                	sw	s0,56(sp)
1c0090c8:	842e                	mv	s0,a1
1c0090ca:	de06                	sw	ra,60(sp)
1c0090cc:	da26                	sw	s1,52(sp)
1c0090ce:	d64e                	sw	s3,44(sp)
1c0090d0:	300479f3          	csrrci	s3,mstatus,8
1c0090d4:	84ca                	mv	s1,s2
1c0090d6:	02091163          	bnez	s2,1c0090f8 <rt_cluster_call+0x38>
1c0090da:	ce32                	sw	a2,28(sp)
1c0090dc:	cc36                	sw	a3,24(sp)
1c0090de:	ca3a                	sw	a4,20(sp)
1c0090e0:	c83e                	sw	a5,16(sp)
1c0090e2:	c642                	sw	a6,12(sp)
1c0090e4:	c446                	sw	a7,8(sp)
1c0090e6:	1ed000ef          	jal	ra,1c009ad2 <__rt_wait_event_prepare_blocking>
1c0090ea:	48a2                	lw	a7,8(sp)
1c0090ec:	4832                	lw	a6,12(sp)
1c0090ee:	47c2                	lw	a5,16(sp)
1c0090f0:	4752                	lw	a4,20(sp)
1c0090f2:	46e2                	lw	a3,24(sp)
1c0090f4:	4672                	lw	a2,28(sp)
1c0090f6:	84aa                	mv	s1,a0
1c0090f8:	4531                	li	a0,12
1c0090fa:	02a40433          	mul	s0,s0,a0
1c0090fe:	1c0015b7          	lui	a1,0x1c001
1c009102:	0d058313          	addi	t1,a1,208 # 1c0010d0 <__rt_pulpos_emu_global_cluster_task>
1c009106:	00f32623          	sw	a5,12(t1)
1c00910a:	1c0017b7          	lui	a5,0x1c001
1c00910e:	1987a503          	lw	a0,408(a5) # 1c001198 <__rt_fc_cluster_device>
1c009112:	00c32023          	sw	a2,0(t1)
1c009116:	0d058593          	addi	a1,a1,208
1c00911a:	8626                	mv	a2,s1
1c00911c:	00d32223          	sw	a3,4(t1)
1c009120:	9522                	add	a0,a0,s0
1c009122:	00e32423          	sw	a4,8(t1)
1c009126:	01032823          	sw	a6,16(t1)
1c00912a:	01132a23          	sw	a7,20(t1)
1c00912e:	2041                	jal	1c0091ae <pi_cluster_send_task_to_cl_async>
1c009130:	842a                	mv	s0,a0
1c009132:	cd01                	beqz	a0,1c00914a <rt_cluster_call+0x8a>
1c009134:	30099073          	csrw	mstatus,s3
1c009138:	547d                	li	s0,-1
1c00913a:	8522                	mv	a0,s0
1c00913c:	50f2                	lw	ra,60(sp)
1c00913e:	5462                	lw	s0,56(sp)
1c009140:	54d2                	lw	s1,52(sp)
1c009142:	5942                	lw	s2,48(sp)
1c009144:	59b2                	lw	s3,44(sp)
1c009146:	6121                	addi	sp,sp,64
1c009148:	8082                	ret
1c00914a:	00091563          	bnez	s2,1c009154 <rt_cluster_call+0x94>
1c00914e:	8526                	mv	a0,s1
1c009150:	2d3000ef          	jal	ra,1c009c22 <__rt_wait_event>
1c009154:	30099073          	csrw	mstatus,s3
1c009158:	b7cd                	j	1c00913a <rt_cluster_call+0x7a>

1c00915a <rt_cluster_mount>:
1c00915a:	7139                	addi	sp,sp,-64
1c00915c:	dc22                	sw	s0,56(sp)
1c00915e:	da26                	sw	s1,52(sp)
1c009160:	d84a                	sw	s2,48(sp)
1c009162:	4431                	li	s0,12
1c009164:	1c0014b7          	lui	s1,0x1c001
1c009168:	de06                	sw	ra,60(sp)
1c00916a:	d64e                	sw	s3,44(sp)
1c00916c:	8936                	mv	s2,a3
1c00916e:	02858433          	mul	s0,a1,s0
1c009172:	19848493          	addi	s1,s1,408 # 1c001198 <__rt_fc_cluster_device>
1c009176:	c905                	beqz	a0,1c0091a6 <rt_cluster_mount+0x4c>
1c009178:	0068                	addi	a0,sp,12
1c00917a:	89ae                	mv	s3,a1
1c00917c:	33bd                	jal	1c008eea <pi_cluster_conf_init>
1c00917e:	4088                	lw	a0,0(s1)
1c009180:	006c                	addi	a1,sp,12
1c009182:	9522                	add	a0,a0,s0
1c009184:	2609                	jal	1c009486 <pi_open_from_conf>
1c009186:	4088                	lw	a0,0(s1)
1c009188:	c84e                	sw	s3,16(sp)
1c00918a:	9522                	add	a0,a0,s0
1c00918c:	3395                	jal	1c008ef0 <pi_cluster_open>
1c00918e:	00090563          	beqz	s2,1c009198 <rt_cluster_mount+0x3e>
1c009192:	854a                	mv	a0,s2
1c009194:	20b000ef          	jal	ra,1c009b9e <rt_event_push>
1c009198:	50f2                	lw	ra,60(sp)
1c00919a:	5462                	lw	s0,56(sp)
1c00919c:	54d2                	lw	s1,52(sp)
1c00919e:	5942                	lw	s2,48(sp)
1c0091a0:	59b2                	lw	s3,44(sp)
1c0091a2:	6121                	addi	sp,sp,64
1c0091a4:	8082                	ret
1c0091a6:	4088                	lw	a0,0(s1)
1c0091a8:	9522                	add	a0,a0,s0
1c0091aa:	3505                	jal	1c008fca <pi_cluster_close>
1c0091ac:	b7cd                	j	1c00918e <rt_cluster_mount+0x34>

1c0091ae <pi_cluster_send_task_to_cl_async>:
1c0091ae:	1101                	addi	sp,sp,-32
1c0091b0:	ca26                	sw	s1,20(sp)
1c0091b2:	4504                	lw	s1,8(a0)
1c0091b4:	cc22                	sw	s0,24(sp)
1c0091b6:	c256                	sw	s5,4(sp)
1c0091b8:	842e                	mv	s0,a1
1c0091ba:	8ab2                	mv	s5,a2
1c0091bc:	ce06                	sw	ra,28(sp)
1c0091be:	c84a                	sw	s2,16(sp)
1c0091c0:	c64e                	sw	s3,12(sp)
1c0091c2:	c452                	sw	s4,8(sp)
1c0091c4:	30047a73          	csrrci	s4,mstatus,8
1c0091c8:	00060823          	sb	zero,16(a2)
1c0091cc:	4785                	li	a5,1
1c0091ce:	d1dc                	sw	a5,36(a1)
1c0091d0:	49dc                	lw	a5,20(a1)
1c0091d2:	0144a983          	lw	s3,20(s1)
1c0091d6:	e399                	bnez	a5,1c0091dc <pi_cluster_send_task_to_cl_async+0x2e>
1c0091d8:	47a1                	li	a5,8
1c0091da:	c9dc                	sw	a5,20(a1)
1c0091dc:	441c                	lw	a5,8(s0)
1c0091de:	eb8d                	bnez	a5,1c009210 <pi_cluster_send_task_to_cl_async+0x62>
1c0091e0:	445c                	lw	a5,12(s0)
1c0091e2:	e789                	bnez	a5,1c0091ec <pi_cluster_send_task_to_cl_async+0x3e>
1c0091e4:	40000793          	li	a5,1024
1c0091e8:	c45c                	sw	a5,12(s0)
1c0091ea:	c81c                	sw	a5,16(s0)
1c0091ec:	4818                	lw	a4,16(s0)
1c0091ee:	445c                	lw	a5,12(s0)
1c0091f0:	e311                	bnez	a4,1c0091f4 <pi_cluster_send_task_to_cl_async+0x46>
1c0091f2:	c81c                	sw	a5,16(s0)
1c0091f4:	01442903          	lw	s2,20(s0)
1c0091f8:	4818                	lw	a4,16(s0)
1c0091fa:	448c                	lw	a1,8(s1)
1c0091fc:	197d                	addi	s2,s2,-1
1c0091fe:	02e90933          	mul	s2,s2,a4
1c009202:	993e                	add	s2,s2,a5
1c009204:	c9bd                	beqz	a1,1c00927a <pi_cluster_send_task_to_cl_async+0xcc>
1c009206:	44d0                	lw	a2,12(s1)
1c009208:	07261063          	bne	a2,s2,1c009268 <pi_cluster_send_task_to_cl_async+0xba>
1c00920c:	449c                	lw	a5,8(s1)
1c00920e:	c41c                	sw	a5,8(s0)
1c009210:	4858                	lw	a4,20(s0)
1c009212:	4785                	li	a5,1
1c009214:	01542c23          	sw	s5,24(s0)
1c009218:	00e797b3          	sll	a5,a5,a4
1c00921c:	17fd                	addi	a5,a5,-1
1c00921e:	d41c                	sw	a5,40(s0)
1c009220:	02042023          	sw	zero,32(s0)
1c009224:	0089a783          	lw	a5,8(s3)
1c009228:	cbbd                	beqz	a5,1c00929e <pi_cluster_send_task_to_cl_async+0xf0>
1c00922a:	d380                	sw	s0,32(a5)
1c00922c:	0089a423          	sw	s0,8(s3)
1c009230:	0009a783          	lw	a5,0(s3)
1c009234:	e399                	bnez	a5,1c00923a <pi_cluster_send_task_to_cl_async+0x8c>
1c009236:	0089a023          	sw	s0,0(s3)
1c00923a:	509c                	lw	a5,32(s1)
1c00923c:	00201737          	lui	a4,0x201
1c009240:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c009244:	04078793          	addi	a5,a5,64
1c009248:	07da                	slli	a5,a5,0x16
1c00924a:	97ba                	add	a5,a5,a4
1c00924c:	0007a023          	sw	zero,0(a5)
1c009250:	300a1073          	csrw	mstatus,s4
1c009254:	4501                	li	a0,0
1c009256:	40f2                	lw	ra,28(sp)
1c009258:	4462                	lw	s0,24(sp)
1c00925a:	44d2                	lw	s1,20(sp)
1c00925c:	4942                	lw	s2,16(sp)
1c00925e:	49b2                	lw	s3,12(sp)
1c009260:	4a22                	lw	s4,8(sp)
1c009262:	4a92                	lw	s5,4(sp)
1c009264:	6105                	addi	sp,sp,32
1c009266:	8082                	ret
1c009268:	509c                	lw	a5,32(s1)
1c00926a:	1c001737          	lui	a4,0x1c001
1c00926e:	1c472503          	lw	a0,452(a4) # 1c0011c4 <__rt_alloc_l1>
1c009272:	078a                	slli	a5,a5,0x2
1c009274:	953e                	add	a0,a0,a5
1c009276:	8d9ff0ef          	jal	ra,1c008b4e <rt_user_free>
1c00927a:	509c                	lw	a5,32(s1)
1c00927c:	1c001737          	lui	a4,0x1c001
1c009280:	1c472503          	lw	a0,452(a4) # 1c0011c4 <__rt_alloc_l1>
1c009284:	078a                	slli	a5,a5,0x2
1c009286:	0124a623          	sw	s2,12(s1)
1c00928a:	85ca                	mv	a1,s2
1c00928c:	953e                	add	a0,a0,a5
1c00928e:	891ff0ef          	jal	ra,1c008b1e <rt_user_alloc>
1c009292:	c488                	sw	a0,8(s1)
1c009294:	fd25                	bnez	a0,1c00920c <pi_cluster_send_task_to_cl_async+0x5e>
1c009296:	300a1073          	csrw	mstatus,s4
1c00929a:	557d                	li	a0,-1
1c00929c:	bf6d                	j	1c009256 <pi_cluster_send_task_to_cl_async+0xa8>
1c00929e:	0089a223          	sw	s0,4(s3)
1c0092a2:	b769                	j	1c00922c <pi_cluster_send_task_to_cl_async+0x7e>

1c0092a4 <rt_perf_init>:
1c0092a4:	00450793          	addi	a5,a0,4
1c0092a8:	04850513          	addi	a0,a0,72
1c0092ac:	0007a023          	sw	zero,0(a5)
1c0092b0:	0791                	addi	a5,a5,4
1c0092b2:	fea79de3          	bne	a5,a0,1c0092ac <rt_perf_init+0x8>
1c0092b6:	8082                	ret

1c0092b8 <rt_perf_conf>:
1c0092b8:	c10c                	sw	a1,0(a0)
1c0092ba:	7a059073          	csrw	pcer,a1
1c0092be:	8082                	ret

1c0092c0 <cluster_start>:
1c0092c0:	002047b7          	lui	a5,0x204
1c0092c4:	00070737          	lui	a4,0x70
1c0092c8:	c798                	sw	a4,8(a5)
1c0092ca:	0ff00713          	li	a4,255
1c0092ce:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f5898>
1c0092d2:	20e7a023          	sw	a4,512(a5)
1c0092d6:	20e7a623          	sw	a4,524(a5)
1c0092da:	8082                	ret

1c0092dc <__rt_init>:
1c0092dc:	1101                	addi	sp,sp,-32
1c0092de:	ce06                	sw	ra,28(sp)
1c0092e0:	cc22                	sw	s0,24(sp)
1c0092e2:	23d5                	jal	1c0098c6 <__rt_bridge_set_available>
1c0092e4:	1c0017b7          	lui	a5,0x1c001
1c0092e8:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c0092ec:	478d                	li	a5,3
1c0092ee:	02f71263          	bne	a4,a5,1c009312 <__rt_init+0x36>
1c0092f2:	7d005073          	csrwi	0x7d0,0
1c0092f6:	1c0007b7          	lui	a5,0x1c000
1c0092fa:	6d078793          	addi	a5,a5,1744 # 1c0006d0 <.got>
1c0092fe:	7d179073          	csrw	0x7d1,a5
1c009302:	1c0017b7          	lui	a5,0x1c001
1c009306:	ed078793          	addi	a5,a5,-304 # 1c000ed0 <stack>
1c00930a:	7d279073          	csrw	0x7d2,a5
1c00930e:	7d00d073          	csrwi	0x7d0,1
1c009312:	2c29                	jal	1c00952c <__rt_irq_init>
1c009314:	1a1067b7          	lui	a5,0x1a106
1c009318:	577d                	li	a4,-1
1c00931a:	c3d8                	sw	a4,4(a5)
1c00931c:	1c0085b7          	lui	a1,0x1c008
1c009320:	c798                	sw	a4,8(a5)
1c009322:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c009326:	4569                	li	a0,26
1c009328:	228d                	jal	1c00948a <rt_irq_set_handler>
1c00932a:	f14027f3          	csrr	a5,mhartid
1c00932e:	8795                	srai	a5,a5,0x5
1c009330:	03f7f793          	andi	a5,a5,63
1c009334:	477d                	li	a4,31
1c009336:	0ae79e63          	bne	a5,a4,1c0093f2 <__rt_init+0x116>
1c00933a:	1a10a7b7          	lui	a5,0x1a10a
1c00933e:	04000737          	lui	a4,0x4000
1c009342:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c009346:	46d000ef          	jal	ra,1c009fb2 <__rt_pmu_init>
1c00934a:	373000ef          	jal	ra,1c009ebc <__rt_freq_init>
1c00934e:	f14027f3          	csrr	a5,mhartid
1c009352:	8795                	srai	a5,a5,0x5
1c009354:	03f7f793          	andi	a5,a5,63
1c009358:	477d                	li	a4,31
1c00935a:	00e78763          	beq	a5,a4,1c009368 <__rt_init+0x8c>
1c00935e:	002017b7          	lui	a5,0x201
1c009362:	577d                	li	a4,-1
1c009364:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f2c14>
1c009368:	1c000437          	lui	s0,0x1c000
1c00936c:	2605                	jal	1c00968c <__rt_utils_init>
1c00936e:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c009372:	8ddff0ef          	jal	ra,1c008c4e <__rt_allocs_init>
1c009376:	25cd                	jal	1c009a58 <__rt_thread_sched_init>
1c009378:	0ed000ef          	jal	ra,1c009c64 <__rt_event_sched_init>
1c00937c:	473000ef          	jal	ra,1c009fee <__rt_padframe_init>
1c009380:	401c                	lw	a5,0(s0)
1c009382:	efb5                	bnez	a5,1c0093fe <__rt_init+0x122>
1c009384:	30045073          	csrwi	mstatus,8
1c009388:	4501                	li	a0,0
1c00938a:	2cc1                	jal	1c00965a <__rt_cbsys_exec>
1c00938c:	e521                	bnez	a0,1c0093d4 <__rt_init+0xf8>
1c00938e:	f14027f3          	csrr	a5,mhartid
1c009392:	8795                	srai	a5,a5,0x5
1c009394:	03f7f793          	andi	a5,a5,63
1c009398:	477d                	li	a4,31
1c00939a:	0ae78763          	beq	a5,a4,1c009448 <__rt_init+0x16c>
1c00939e:	4681                	li	a3,0
1c0093a0:	4601                	li	a2,0
1c0093a2:	4581                	li	a1,0
1c0093a4:	4505                	li	a0,1
1c0093a6:	cfb9                	beqz	a5,1c009404 <__rt_init+0x128>
1c0093a8:	3b4d                	jal	1c00915a <rt_cluster_mount>
1c0093aa:	6591                	lui	a1,0x4
1c0093ac:	450d                	li	a0,3
1c0093ae:	feaff0ef          	jal	ra,1c008b98 <rt_alloc>
1c0093b2:	872a                	mv	a4,a0
1c0093b4:	c105                	beqz	a0,1c0093d4 <__rt_init+0xf8>
1c0093b6:	6805                	lui	a6,0x1
1c0093b8:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0093bc:	1c009637          	lui	a2,0x1c009
1c0093c0:	c002                	sw	zero,0(sp)
1c0093c2:	48a1                	li	a7,8
1c0093c4:	87c2                	mv	a5,a6
1c0093c6:	4681                	li	a3,0
1c0093c8:	2c060613          	addi	a2,a2,704 # 1c0092c0 <cluster_start>
1c0093cc:	4581                	li	a1,0
1c0093ce:	4501                	li	a0,0
1c0093d0:	39c5                	jal	1c0090c0 <rt_cluster_call>
1c0093d2:	c93d                	beqz	a0,1c009448 <__rt_init+0x16c>
1c0093d4:	f1402673          	csrr	a2,mhartid
1c0093d8:	1c000537          	lui	a0,0x1c000
1c0093dc:	40565593          	srai	a1,a2,0x5
1c0093e0:	03f5f593          	andi	a1,a1,63
1c0093e4:	8a7d                	andi	a2,a2,31
1c0093e6:	5c450513          	addi	a0,a0,1476 # 1c0005c4 <__DTOR_END__+0x2d8>
1c0093ea:	554010ef          	jal	ra,1c00a93e <printf>
1c0093ee:	4dc010ef          	jal	ra,1c00a8ca <abort>
1c0093f2:	002047b7          	lui	a5,0x204
1c0093f6:	04000737          	lui	a4,0x4000
1c0093fa:	cbd8                	sw	a4,20(a5)
1c0093fc:	b7a9                	j	1c009346 <__rt_init+0x6a>
1c0093fe:	9782                	jalr	a5
1c009400:	0411                	addi	s0,s0,4
1c009402:	bfbd                	j	1c009380 <__rt_init+0xa4>
1c009404:	3b99                	jal	1c00915a <rt_cluster_mount>
1c009406:	6591                	lui	a1,0x4
1c009408:	80058593          	addi	a1,a1,-2048 # 3800 <_l1_preload_size+0x1ff0>
1c00940c:	450d                	li	a0,3
1c00940e:	f8aff0ef          	jal	ra,1c008b98 <rt_alloc>
1c009412:	d169                	beqz	a0,1c0093d4 <__rt_init+0xf8>
1c009414:	00204737          	lui	a4,0x204
1c009418:	0ff00793          	li	a5,255
1c00941c:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f5898>
1c009420:	1c0107b7          	lui	a5,0x1c010
1c009424:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c009428:	0017e793          	ori	a5,a5,1
1c00942c:	08f72023          	sw	a5,128(a4)
1c009430:	6785                	lui	a5,0x1
1c009432:	4462                	lw	s0,24(sp)
1c009434:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009438:	08f72023          	sw	a5,128(a4)
1c00943c:	40f2                	lw	ra,28(sp)
1c00943e:	08a72023          	sw	a0,128(a4)
1c009442:	4501                	li	a0,0
1c009444:	6105                	addi	sp,sp,32
1c009446:	bdad                	j	1c0092c0 <cluster_start>
1c009448:	40f2                	lw	ra,28(sp)
1c00944a:	4462                	lw	s0,24(sp)
1c00944c:	6105                	addi	sp,sp,32
1c00944e:	8082                	ret

1c009450 <__rt_deinit>:
1c009450:	1c0017b7          	lui	a5,0x1c001
1c009454:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c009458:	1141                	addi	sp,sp,-16
1c00945a:	c606                	sw	ra,12(sp)
1c00945c:	c422                	sw	s0,8(sp)
1c00945e:	478d                	li	a5,3
1c009460:	00f71463          	bne	a4,a5,1c009468 <__rt_deinit+0x18>
1c009464:	7d005073          	csrwi	0x7d0,0
1c009468:	4505                	li	a0,1
1c00946a:	1c000437          	lui	s0,0x1c000
1c00946e:	22f5                	jal	1c00965a <__rt_cbsys_exec>
1c009470:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c009474:	401c                	lw	a5,0(s0)
1c009476:	e789                	bnez	a5,1c009480 <__rt_deinit+0x30>
1c009478:	40b2                	lw	ra,12(sp)
1c00947a:	4422                	lw	s0,8(sp)
1c00947c:	0141                	addi	sp,sp,16
1c00947e:	8082                	ret
1c009480:	9782                	jalr	a5
1c009482:	0411                	addi	s0,s0,4
1c009484:	bfc5                	j	1c009474 <__rt_deinit+0x24>

1c009486 <pi_open_from_conf>:
1c009486:	c14c                	sw	a1,4(a0)
1c009488:	8082                	ret

1c00948a <rt_irq_set_handler>:
1c00948a:	f14027f3          	csrr	a5,mhartid
1c00948e:	8795                	srai	a5,a5,0x5
1c009490:	03f7f793          	andi	a5,a5,63
1c009494:	477d                	li	a4,31
1c009496:	04e79063          	bne	a5,a4,1c0094d6 <rt_irq_set_handler+0x4c>
1c00949a:	1a1047b7          	lui	a5,0x1a104
1c00949e:	43dc                	lw	a5,4(a5)
1c0094a0:	050a                	slli	a0,a0,0x2
1c0094a2:	8d89                	sub	a1,a1,a0
1c0094a4:	8d9d                	sub	a1,a1,a5
1c0094a6:	000ff737          	lui	a4,0xff
1c0094aa:	00f506b3          	add	a3,a0,a5
1c0094ae:	8f6d                	and	a4,a4,a1
1c0094b0:	0145d793          	srli	a5,a1,0x14
1c0094b4:	06f76713          	ori	a4,a4,111
1c0094b8:	07fe                	slli	a5,a5,0x1f
1c0094ba:	8fd9                	or	a5,a5,a4
1c0094bc:	7fe00637          	lui	a2,0x7fe00
1c0094c0:	01459713          	slli	a4,a1,0x14
1c0094c4:	8f71                	and	a4,a4,a2
1c0094c6:	8fd9                	or	a5,a5,a4
1c0094c8:	05a6                	slli	a1,a1,0x9
1c0094ca:	00100737          	lui	a4,0x100
1c0094ce:	8df9                	and	a1,a1,a4
1c0094d0:	8ddd                	or	a1,a1,a5
1c0094d2:	c28c                	sw	a1,0(a3)
1c0094d4:	8082                	ret
1c0094d6:	002007b7          	lui	a5,0x200
1c0094da:	43bc                	lw	a5,64(a5)
1c0094dc:	b7d1                	j	1c0094a0 <rt_irq_set_handler+0x16>

1c0094de <illegal_insn_handler_c>:
1c0094de:	8082                	ret

1c0094e0 <__rt_handle_illegal_instr>:
1c0094e0:	1c0017b7          	lui	a5,0x1c001
1c0094e4:	ed47a703          	lw	a4,-300(a5) # 1c000ed4 <__rt_debug_config>
1c0094e8:	1141                	addi	sp,sp,-16
1c0094ea:	c422                	sw	s0,8(sp)
1c0094ec:	c606                	sw	ra,12(sp)
1c0094ee:	8b05                	andi	a4,a4,1
1c0094f0:	843e                	mv	s0,a5
1c0094f2:	c30d                	beqz	a4,1c009514 <__rt_handle_illegal_instr+0x34>
1c0094f4:	341026f3          	csrr	a3,mepc
1c0094f8:	f1402673          	csrr	a2,mhartid
1c0094fc:	1c000537          	lui	a0,0x1c000
1c009500:	4298                	lw	a4,0(a3)
1c009502:	40565593          	srai	a1,a2,0x5
1c009506:	03f5f593          	andi	a1,a1,63
1c00950a:	8a7d                	andi	a2,a2,31
1c00950c:	61c50513          	addi	a0,a0,1564 # 1c00061c <__DTOR_END__+0x330>
1c009510:	42e010ef          	jal	ra,1c00a93e <printf>
1c009514:	ed442783          	lw	a5,-300(s0)
1c009518:	8385                	srli	a5,a5,0x1
1c00951a:	8b85                	andi	a5,a5,1
1c00951c:	c399                	beqz	a5,1c009522 <__rt_handle_illegal_instr+0x42>
1c00951e:	3ac010ef          	jal	ra,1c00a8ca <abort>
1c009522:	4422                	lw	s0,8(sp)
1c009524:	40b2                	lw	ra,12(sp)
1c009526:	0141                	addi	sp,sp,16
1c009528:	fb7ff06f          	j	1c0094de <illegal_insn_handler_c>

1c00952c <__rt_irq_init>:
1c00952c:	f14027f3          	csrr	a5,mhartid
1c009530:	8795                	srai	a5,a5,0x5
1c009532:	03f7f793          	andi	a5,a5,63
1c009536:	477d                	li	a4,31
1c009538:	02e79763          	bne	a5,a4,1c009566 <__rt_irq_init+0x3a>
1c00953c:	1a10a7b7          	lui	a5,0x1a10a
1c009540:	577d                	li	a4,-1
1c009542:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa107ff4>
1c009546:	f14027f3          	csrr	a5,mhartid
1c00954a:	8795                	srai	a5,a5,0x5
1c00954c:	1c008737          	lui	a4,0x1c008
1c009550:	03f7f793          	andi	a5,a5,63
1c009554:	46fd                	li	a3,31
1c009556:	00070713          	mv	a4,a4
1c00955a:	00d79b63          	bne	a5,a3,1c009570 <__rt_irq_init+0x44>
1c00955e:	1a1047b7          	lui	a5,0x1a104
1c009562:	c3d8                	sw	a4,4(a5)
1c009564:	8082                	ret
1c009566:	002047b7          	lui	a5,0x204
1c00956a:	577d                	li	a4,-1
1c00956c:	cb98                	sw	a4,16(a5)
1c00956e:	bfe1                	j	1c009546 <__rt_irq_init+0x1a>
1c009570:	002007b7          	lui	a5,0x200
1c009574:	c3b8                	sw	a4,64(a5)
1c009576:	8082                	ret

1c009578 <__rt_fc_cluster_lock_req>:
1c009578:	1141                	addi	sp,sp,-16
1c00957a:	c606                	sw	ra,12(sp)
1c00957c:	c422                	sw	s0,8(sp)
1c00957e:	c226                	sw	s1,4(sp)
1c009580:	300474f3          	csrrci	s1,mstatus,8
1c009584:	09654703          	lbu	a4,150(a0)
1c009588:	411c                	lw	a5,0(a0)
1c00958a:	c729                	beqz	a4,1c0095d4 <__rt_fc_cluster_lock_req+0x5c>
1c00958c:	4398                	lw	a4,0(a5)
1c00958e:	c30d                	beqz	a4,1c0095b0 <__rt_fc_cluster_lock_req+0x38>
1c009590:	43d8                	lw	a4,4(a5)
1c009592:	cf09                	beqz	a4,1c0095ac <__rt_fc_cluster_lock_req+0x34>
1c009594:	4798                	lw	a4,8(a5)
1c009596:	c348                	sw	a0,4(a4)
1c009598:	c788                	sw	a0,8(a5)
1c00959a:	00052223          	sw	zero,4(a0)
1c00959e:	30049073          	csrw	mstatus,s1
1c0095a2:	40b2                	lw	ra,12(sp)
1c0095a4:	4422                	lw	s0,8(sp)
1c0095a6:	4492                	lw	s1,4(sp)
1c0095a8:	0141                	addi	sp,sp,16
1c0095aa:	8082                	ret
1c0095ac:	c3c8                	sw	a0,4(a5)
1c0095ae:	b7ed                	j	1c009598 <__rt_fc_cluster_lock_req+0x20>
1c0095b0:	4705                	li	a4,1
1c0095b2:	08e50a23          	sb	a4,148(a0)
1c0095b6:	4705                	li	a4,1
1c0095b8:	c398                	sw	a4,0(a5)
1c0095ba:	09554783          	lbu	a5,149(a0)
1c0095be:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f1854>
1c0095c2:	00201737          	lui	a4,0x201
1c0095c6:	07da                	slli	a5,a5,0x16
1c0095c8:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c0095cc:	97ba                	add	a5,a5,a4
1c0095ce:	0007a023          	sw	zero,0(a5)
1c0095d2:	b7f1                	j	1c00959e <__rt_fc_cluster_lock_req+0x26>
1c0095d4:	842a                	mv	s0,a0
1c0095d6:	47c8                	lw	a0,12(a5)
1c0095d8:	cd01                	beqz	a0,1c0095f0 <__rt_fc_cluster_lock_req+0x78>
1c0095da:	0007a023          	sw	zero,0(a5)
1c0095de:	0007a623          	sw	zero,12(a5)
1c0095e2:	2185                	jal	1c009a42 <__rt_thread_wakeup>
1c0095e4:	4785                	li	a5,1
1c0095e6:	08f40a23          	sb	a5,148(s0)
1c0095ea:	09544783          	lbu	a5,149(s0)
1c0095ee:	bfc1                	j	1c0095be <__rt_fc_cluster_lock_req+0x46>
1c0095f0:	43d8                	lw	a4,4(a5)
1c0095f2:	e701                	bnez	a4,1c0095fa <__rt_fc_cluster_lock_req+0x82>
1c0095f4:	0007a023          	sw	zero,0(a5)
1c0095f8:	b7f5                	j	1c0095e4 <__rt_fc_cluster_lock_req+0x6c>
1c0095fa:	4354                	lw	a3,4(a4)
1c0095fc:	c3d4                	sw	a3,4(a5)
1c0095fe:	4785                	li	a5,1
1c009600:	08f70a23          	sb	a5,148(a4)
1c009604:	09574783          	lbu	a5,149(a4)
1c009608:	00201737          	lui	a4,0x201
1c00960c:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c009610:	04078793          	addi	a5,a5,64
1c009614:	07da                	slli	a5,a5,0x16
1c009616:	97ba                	add	a5,a5,a4
1c009618:	bff1                	j	1c0095f4 <__rt_fc_cluster_lock_req+0x7c>

1c00961a <__rt_cbsys_add>:
1c00961a:	1101                	addi	sp,sp,-32
1c00961c:	cc22                	sw	s0,24(sp)
1c00961e:	ca26                	sw	s1,20(sp)
1c009620:	842a                	mv	s0,a0
1c009622:	84ae                	mv	s1,a1
1c009624:	4501                	li	a0,0
1c009626:	45b1                	li	a1,12
1c009628:	c632                	sw	a2,12(sp)
1c00962a:	ce06                	sw	ra,28(sp)
1c00962c:	d6cff0ef          	jal	ra,1c008b98 <rt_alloc>
1c009630:	4632                	lw	a2,12(sp)
1c009632:	c115                	beqz	a0,1c009656 <__rt_cbsys_add+0x3c>
1c009634:	1c0017b7          	lui	a5,0x1c001
1c009638:	040a                	slli	s0,s0,0x2
1c00963a:	ed878793          	addi	a5,a5,-296 # 1c000ed8 <cbsys_first>
1c00963e:	97a2                	add	a5,a5,s0
1c009640:	4398                	lw	a4,0(a5)
1c009642:	c104                	sw	s1,0(a0)
1c009644:	c150                	sw	a2,4(a0)
1c009646:	c518                	sw	a4,8(a0)
1c009648:	c388                	sw	a0,0(a5)
1c00964a:	4501                	li	a0,0
1c00964c:	40f2                	lw	ra,28(sp)
1c00964e:	4462                	lw	s0,24(sp)
1c009650:	44d2                	lw	s1,20(sp)
1c009652:	6105                	addi	sp,sp,32
1c009654:	8082                	ret
1c009656:	557d                	li	a0,-1
1c009658:	bfd5                	j	1c00964c <__rt_cbsys_add+0x32>

1c00965a <__rt_cbsys_exec>:
1c00965a:	00251793          	slli	a5,a0,0x2
1c00965e:	1c001537          	lui	a0,0x1c001
1c009662:	ed850513          	addi	a0,a0,-296 # 1c000ed8 <cbsys_first>
1c009666:	1141                	addi	sp,sp,-16
1c009668:	953e                	add	a0,a0,a5
1c00966a:	c422                	sw	s0,8(sp)
1c00966c:	4100                	lw	s0,0(a0)
1c00966e:	c606                	sw	ra,12(sp)
1c009670:	e411                	bnez	s0,1c00967c <__rt_cbsys_exec+0x22>
1c009672:	4501                	li	a0,0
1c009674:	40b2                	lw	ra,12(sp)
1c009676:	4422                	lw	s0,8(sp)
1c009678:	0141                	addi	sp,sp,16
1c00967a:	8082                	ret
1c00967c:	401c                	lw	a5,0(s0)
1c00967e:	4048                	lw	a0,4(s0)
1c009680:	9782                	jalr	a5
1c009682:	e119                	bnez	a0,1c009688 <__rt_cbsys_exec+0x2e>
1c009684:	4400                	lw	s0,8(s0)
1c009686:	b7ed                	j	1c009670 <__rt_cbsys_exec+0x16>
1c009688:	557d                	li	a0,-1
1c00968a:	b7ed                	j	1c009674 <__rt_cbsys_exec+0x1a>

1c00968c <__rt_utils_init>:
1c00968c:	1c0017b7          	lui	a5,0x1c001
1c009690:	ed878793          	addi	a5,a5,-296 # 1c000ed8 <cbsys_first>
1c009694:	0007a023          	sw	zero,0(a5)
1c009698:	0007a223          	sw	zero,4(a5)
1c00969c:	0007a423          	sw	zero,8(a5)
1c0096a0:	0007a623          	sw	zero,12(a5)
1c0096a4:	0007a823          	sw	zero,16(a5)
1c0096a8:	0007aa23          	sw	zero,20(a5)
1c0096ac:	8082                	ret

1c0096ae <__rt_fc_lock>:
1c0096ae:	1141                	addi	sp,sp,-16
1c0096b0:	c422                	sw	s0,8(sp)
1c0096b2:	842a                	mv	s0,a0
1c0096b4:	c606                	sw	ra,12(sp)
1c0096b6:	c226                	sw	s1,4(sp)
1c0096b8:	c04a                	sw	s2,0(sp)
1c0096ba:	300474f3          	csrrci	s1,mstatus,8
1c0096be:	401c                	lw	a5,0(s0)
1c0096c0:	eb99                	bnez	a5,1c0096d6 <__rt_fc_lock+0x28>
1c0096c2:	4785                	li	a5,1
1c0096c4:	c01c                	sw	a5,0(s0)
1c0096c6:	30049073          	csrw	mstatus,s1
1c0096ca:	40b2                	lw	ra,12(sp)
1c0096cc:	4422                	lw	s0,8(sp)
1c0096ce:	4492                	lw	s1,4(sp)
1c0096d0:	4902                	lw	s2,0(sp)
1c0096d2:	0141                	addi	sp,sp,16
1c0096d4:	8082                	ret
1c0096d6:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c0096da:	4585                	li	a1,1
1c0096dc:	e3ff7517          	auipc	a0,0xe3ff7
1c0096e0:	94c50513          	addi	a0,a0,-1716 # 28 <__rt_sched>
1c0096e4:	c45c                	sw	a5,12(s0)
1c0096e6:	29f1                	jal	1c009bc2 <__rt_event_execute>
1c0096e8:	bfd9                	j	1c0096be <__rt_fc_lock+0x10>

1c0096ea <__rt_fc_unlock>:
1c0096ea:	300476f3          	csrrci	a3,mstatus,8
1c0096ee:	415c                	lw	a5,4(a0)
1c0096f0:	e791                	bnez	a5,1c0096fc <__rt_fc_unlock+0x12>
1c0096f2:	00052023          	sw	zero,0(a0)
1c0096f6:	30069073          	csrw	mstatus,a3
1c0096fa:	8082                	ret
1c0096fc:	43d8                	lw	a4,4(a5)
1c0096fe:	c158                	sw	a4,4(a0)
1c009700:	4705                	li	a4,1
1c009702:	08e78a23          	sb	a4,148(a5)
1c009706:	0957c783          	lbu	a5,149(a5)
1c00970a:	00201737          	lui	a4,0x201
1c00970e:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c009712:	04078793          	addi	a5,a5,64
1c009716:	07da                	slli	a5,a5,0x16
1c009718:	97ba                	add	a5,a5,a4
1c00971a:	0007a023          	sw	zero,0(a5)
1c00971e:	bfe1                	j	1c0096f6 <__rt_fc_unlock+0xc>

1c009720 <__rt_fc_cluster_lock>:
1c009720:	f14027f3          	csrr	a5,mhartid
1c009724:	8795                	srai	a5,a5,0x5
1c009726:	03f7f793          	andi	a5,a5,63
1c00972a:	08f58aa3          	sb	a5,149(a1)
1c00972e:	4785                	li	a5,1
1c009730:	08f58b23          	sb	a5,150(a1)
1c009734:	1c0097b7          	lui	a5,0x1c009
1c009738:	57878793          	addi	a5,a5,1400 # 1c009578 <__rt_fc_cluster_lock_req>
1c00973c:	c188                	sw	a0,0(a1)
1c00973e:	08058a23          	sb	zero,148(a1)
1c009742:	0205a423          	sw	zero,40(a1)
1c009746:	0205a623          	sw	zero,44(a1)
1c00974a:	c59c                	sw	a5,8(a1)
1c00974c:	c5cc                	sw	a1,12(a1)
1c00974e:	05a1                	addi	a1,a1,8
1c009750:	0015e513          	ori	a0,a1,1
1c009754:	8abff06f          	j	1c008ffe <__rt_cluster_push_fc_event>

1c009758 <__rt_fc_cluster_unlock>:
1c009758:	f14027f3          	csrr	a5,mhartid
1c00975c:	8795                	srai	a5,a5,0x5
1c00975e:	03f7f793          	andi	a5,a5,63
1c009762:	08f58aa3          	sb	a5,149(a1)
1c009766:	1c0097b7          	lui	a5,0x1c009
1c00976a:	57878793          	addi	a5,a5,1400 # 1c009578 <__rt_fc_cluster_lock_req>
1c00976e:	c188                	sw	a0,0(a1)
1c009770:	08058a23          	sb	zero,148(a1)
1c009774:	08058b23          	sb	zero,150(a1)
1c009778:	0205a423          	sw	zero,40(a1)
1c00977c:	0205a623          	sw	zero,44(a1)
1c009780:	c59c                	sw	a5,8(a1)
1c009782:	c5cc                	sw	a1,12(a1)
1c009784:	05a1                	addi	a1,a1,8
1c009786:	0015e513          	ori	a0,a1,1
1c00978a:	875ff06f          	j	1c008ffe <__rt_cluster_push_fc_event>

1c00978e <__rt_event_enqueue>:
1c00978e:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c009792:	00052c23          	sw	zero,24(a0)
1c009796:	c799                	beqz	a5,1c0097a4 <__rt_event_enqueue+0x16>
1c009798:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c00979c:	cf88                	sw	a0,24(a5)
1c00979e:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c0097a2:	8082                	ret
1c0097a4:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c0097a8:	bfdd                	j	1c00979e <__rt_event_enqueue+0x10>

1c0097aa <__rt_bridge_check_bridge_req.part.5>:
1c0097aa:	1c001737          	lui	a4,0x1c001
1c0097ae:	fec70793          	addi	a5,a4,-20 # 1c000fec <__hal_debug_struct>
1c0097b2:	0a47a783          	lw	a5,164(a5)
1c0097b6:	fec70713          	addi	a4,a4,-20
1c0097ba:	c789                	beqz	a5,1c0097c4 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c0097bc:	4f94                	lw	a3,24(a5)
1c0097be:	e681                	bnez	a3,1c0097c6 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c0097c0:	0af72623          	sw	a5,172(a4)
1c0097c4:	8082                	ret
1c0097c6:	479c                	lw	a5,8(a5)
1c0097c8:	bfcd                	j	1c0097ba <__rt_bridge_check_bridge_req.part.5+0x10>

1c0097ca <__rt_bridge_wait>:
1c0097ca:	f14027f3          	csrr	a5,mhartid
1c0097ce:	8795                	srai	a5,a5,0x5
1c0097d0:	03f7f793          	andi	a5,a5,63
1c0097d4:	477d                	li	a4,31
1c0097d6:	02e79a63          	bne	a5,a4,1c00980a <__rt_bridge_wait+0x40>
1c0097da:	1a10a7b7          	lui	a5,0x1a10a
1c0097de:	6711                	lui	a4,0x4
1c0097e0:	300476f3          	csrrci	a3,mstatus,8
1c0097e4:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa107ff8>
1c0097e8:	01161593          	slli	a1,a2,0x11
1c0097ec:	0005cb63          	bltz	a1,1c009802 <__rt_bridge_wait+0x38>
1c0097f0:	80e7a223          	sw	a4,-2044(a5)
1c0097f4:	10500073          	wfi
1c0097f8:	80e7a423          	sw	a4,-2040(a5)
1c0097fc:	30069073          	csrw	mstatus,a3
1c009800:	b7c5                	j	1c0097e0 <__rt_bridge_wait+0x16>
1c009802:	80e7aa23          	sw	a4,-2028(a5)
1c009806:	30069073          	csrw	mstatus,a3
1c00980a:	8082                	ret

1c00980c <__rt_bridge_handle_notif>:
1c00980c:	1141                	addi	sp,sp,-16
1c00980e:	c422                	sw	s0,8(sp)
1c009810:	1c001437          	lui	s0,0x1c001
1c009814:	fec40793          	addi	a5,s0,-20 # 1c000fec <__hal_debug_struct>
1c009818:	0a47a783          	lw	a5,164(a5)
1c00981c:	c606                	sw	ra,12(sp)
1c00981e:	c226                	sw	s1,4(sp)
1c009820:	c04a                	sw	s2,0(sp)
1c009822:	fec40413          	addi	s0,s0,-20
1c009826:	c399                	beqz	a5,1c00982c <__rt_bridge_handle_notif+0x20>
1c009828:	4bd8                	lw	a4,20(a5)
1c00982a:	e30d                	bnez	a4,1c00984c <__rt_bridge_handle_notif+0x40>
1c00982c:	0b442783          	lw	a5,180(s0)
1c009830:	c789                	beqz	a5,1c00983a <__rt_bridge_handle_notif+0x2e>
1c009832:	43a8                	lw	a0,64(a5)
1c009834:	0a042a23          	sw	zero,180(s0)
1c009838:	3f99                	jal	1c00978e <__rt_event_enqueue>
1c00983a:	0ac42783          	lw	a5,172(s0)
1c00983e:	eb95                	bnez	a5,1c009872 <__rt_bridge_handle_notif+0x66>
1c009840:	4422                	lw	s0,8(sp)
1c009842:	40b2                	lw	ra,12(sp)
1c009844:	4492                	lw	s1,4(sp)
1c009846:	4902                	lw	s2,0(sp)
1c009848:	0141                	addi	sp,sp,16
1c00984a:	b785                	j	1c0097aa <__rt_bridge_check_bridge_req.part.5>
1c00984c:	4784                	lw	s1,8(a5)
1c00984e:	4fd8                	lw	a4,28(a5)
1c009850:	0a942223          	sw	s1,164(s0)
1c009854:	cb01                	beqz	a4,1c009864 <__rt_bridge_handle_notif+0x58>
1c009856:	0b042703          	lw	a4,176(s0)
1c00985a:	c798                	sw	a4,8(a5)
1c00985c:	0af42823          	sw	a5,176(s0)
1c009860:	87a6                	mv	a5,s1
1c009862:	b7d1                	j	1c009826 <__rt_bridge_handle_notif+0x1a>
1c009864:	43a8                	lw	a0,64(a5)
1c009866:	30047973          	csrrci	s2,mstatus,8
1c00986a:	3715                	jal	1c00978e <__rt_event_enqueue>
1c00986c:	30091073          	csrw	mstatus,s2
1c009870:	bfc5                	j	1c009860 <__rt_bridge_handle_notif+0x54>
1c009872:	40b2                	lw	ra,12(sp)
1c009874:	4422                	lw	s0,8(sp)
1c009876:	4492                	lw	s1,4(sp)
1c009878:	4902                	lw	s2,0(sp)
1c00987a:	0141                	addi	sp,sp,16
1c00987c:	8082                	ret

1c00987e <__rt_bridge_check_connection>:
1c00987e:	1c001737          	lui	a4,0x1c001
1c009882:	fec70713          	addi	a4,a4,-20 # 1c000fec <__hal_debug_struct>
1c009886:	471c                	lw	a5,8(a4)
1c009888:	ef95                	bnez	a5,1c0098c4 <__rt_bridge_check_connection+0x46>
1c00988a:	1a1047b7          	lui	a5,0x1a104
1c00988e:	5bfc                	lw	a5,116(a5)
1c009890:	469d                	li	a3,7
1c009892:	83a5                	srli	a5,a5,0x9
1c009894:	8b9d                	andi	a5,a5,7
1c009896:	02d79763          	bne	a5,a3,1c0098c4 <__rt_bridge_check_connection+0x46>
1c00989a:	1141                	addi	sp,sp,-16
1c00989c:	c422                	sw	s0,8(sp)
1c00989e:	c226                	sw	s1,4(sp)
1c0098a0:	c606                	sw	ra,12(sp)
1c0098a2:	4785                	li	a5,1
1c0098a4:	c71c                	sw	a5,8(a4)
1c0098a6:	1a1044b7          	lui	s1,0x1a104
1c0098aa:	441d                	li	s0,7
1c0098ac:	58fc                	lw	a5,116(s1)
1c0098ae:	83a5                	srli	a5,a5,0x9
1c0098b0:	8b9d                	andi	a5,a5,7
1c0098b2:	00878763          	beq	a5,s0,1c0098c0 <__rt_bridge_check_connection+0x42>
1c0098b6:	40b2                	lw	ra,12(sp)
1c0098b8:	4422                	lw	s0,8(sp)
1c0098ba:	4492                	lw	s1,4(sp)
1c0098bc:	0141                	addi	sp,sp,16
1c0098be:	8082                	ret
1c0098c0:	3729                	jal	1c0097ca <__rt_bridge_wait>
1c0098c2:	b7ed                	j	1c0098ac <__rt_bridge_check_connection+0x2e>
1c0098c4:	8082                	ret

1c0098c6 <__rt_bridge_set_available>:
1c0098c6:	1c0017b7          	lui	a5,0x1c001
1c0098ca:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c0098ce:	479c                	lw	a5,8(a5)
1c0098d0:	8082                	ret

1c0098d2 <__rt_bridge_send_notif>:
1c0098d2:	1141                	addi	sp,sp,-16
1c0098d4:	c606                	sw	ra,12(sp)
1c0098d6:	3765                	jal	1c00987e <__rt_bridge_check_connection>
1c0098d8:	40b2                	lw	ra,12(sp)
1c0098da:	1c0017b7          	lui	a5,0x1c001
1c0098de:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c0098e2:	479c                	lw	a5,8(a5)
1c0098e4:	0141                	addi	sp,sp,16
1c0098e6:	8082                	ret

1c0098e8 <__rt_bridge_clear_notif>:
1c0098e8:	1141                	addi	sp,sp,-16
1c0098ea:	c606                	sw	ra,12(sp)
1c0098ec:	3f49                	jal	1c00987e <__rt_bridge_check_connection>
1c0098ee:	1c0017b7          	lui	a5,0x1c001
1c0098f2:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c0098f6:	4798                	lw	a4,8(a5)
1c0098f8:	c311                	beqz	a4,1c0098fc <__rt_bridge_clear_notif+0x14>
1c0098fa:	479c                	lw	a5,8(a5)
1c0098fc:	40b2                	lw	ra,12(sp)
1c0098fe:	0141                	addi	sp,sp,16
1c009900:	8082                	ret

1c009902 <__rt_bridge_printf_flush>:
1c009902:	1141                	addi	sp,sp,-16
1c009904:	c422                	sw	s0,8(sp)
1c009906:	c606                	sw	ra,12(sp)
1c009908:	1c001437          	lui	s0,0x1c001
1c00990c:	3f8d                	jal	1c00987e <__rt_bridge_check_connection>
1c00990e:	fec40793          	addi	a5,s0,-20 # 1c000fec <__hal_debug_struct>
1c009912:	479c                	lw	a5,8(a5)
1c009914:	c385                	beqz	a5,1c009934 <__rt_bridge_printf_flush+0x32>
1c009916:	fec40413          	addi	s0,s0,-20
1c00991a:	485c                	lw	a5,20(s0)
1c00991c:	e399                	bnez	a5,1c009922 <__rt_bridge_printf_flush+0x20>
1c00991e:	4c1c                	lw	a5,24(s0)
1c009920:	cb91                	beqz	a5,1c009934 <__rt_bridge_printf_flush+0x32>
1c009922:	3f45                	jal	1c0098d2 <__rt_bridge_send_notif>
1c009924:	485c                	lw	a5,20(s0)
1c009926:	e789                	bnez	a5,1c009930 <__rt_bridge_printf_flush+0x2e>
1c009928:	4422                	lw	s0,8(sp)
1c00992a:	40b2                	lw	ra,12(sp)
1c00992c:	0141                	addi	sp,sp,16
1c00992e:	bf6d                	j	1c0098e8 <__rt_bridge_clear_notif>
1c009930:	3d69                	jal	1c0097ca <__rt_bridge_wait>
1c009932:	bfcd                	j	1c009924 <__rt_bridge_printf_flush+0x22>
1c009934:	40b2                	lw	ra,12(sp)
1c009936:	4422                	lw	s0,8(sp)
1c009938:	0141                	addi	sp,sp,16
1c00993a:	8082                	ret

1c00993c <__rt_bridge_req_shutdown>:
1c00993c:	1141                	addi	sp,sp,-16
1c00993e:	c606                	sw	ra,12(sp)
1c009940:	c422                	sw	s0,8(sp)
1c009942:	c226                	sw	s1,4(sp)
1c009944:	3f2d                	jal	1c00987e <__rt_bridge_check_connection>
1c009946:	1c0017b7          	lui	a5,0x1c001
1c00994a:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c00994e:	479c                	lw	a5,8(a5)
1c009950:	cb95                	beqz	a5,1c009984 <__rt_bridge_req_shutdown+0x48>
1c009952:	3f45                	jal	1c009902 <__rt_bridge_printf_flush>
1c009954:	1a1044b7          	lui	s1,0x1a104
1c009958:	441d                	li	s0,7
1c00995a:	58fc                	lw	a5,116(s1)
1c00995c:	83a5                	srli	a5,a5,0x9
1c00995e:	8b9d                	andi	a5,a5,7
1c009960:	02878763          	beq	a5,s0,1c00998e <__rt_bridge_req_shutdown+0x52>
1c009964:	1a1044b7          	lui	s1,0x1a104
1c009968:	441d                	li	s0,7
1c00996a:	58fc                	lw	a5,116(s1)
1c00996c:	83a5                	srli	a5,a5,0x9
1c00996e:	8b9d                	andi	a5,a5,7
1c009970:	02879163          	bne	a5,s0,1c009992 <__rt_bridge_req_shutdown+0x56>
1c009974:	1a1044b7          	lui	s1,0x1a104
1c009978:	441d                	li	s0,7
1c00997a:	58fc                	lw	a5,116(s1)
1c00997c:	83a5                	srli	a5,a5,0x9
1c00997e:	8b9d                	andi	a5,a5,7
1c009980:	00878b63          	beq	a5,s0,1c009996 <__rt_bridge_req_shutdown+0x5a>
1c009984:	40b2                	lw	ra,12(sp)
1c009986:	4422                	lw	s0,8(sp)
1c009988:	4492                	lw	s1,4(sp)
1c00998a:	0141                	addi	sp,sp,16
1c00998c:	8082                	ret
1c00998e:	3d35                	jal	1c0097ca <__rt_bridge_wait>
1c009990:	b7e9                	j	1c00995a <__rt_bridge_req_shutdown+0x1e>
1c009992:	3d25                	jal	1c0097ca <__rt_bridge_wait>
1c009994:	bfd9                	j	1c00996a <__rt_bridge_req_shutdown+0x2e>
1c009996:	3d15                	jal	1c0097ca <__rt_bridge_wait>
1c009998:	b7cd                	j	1c00997a <__rt_bridge_req_shutdown+0x3e>

1c00999a <__rt_bridge_init>:
1c00999a:	1c0017b7          	lui	a5,0x1c001
1c00999e:	1a10a737          	lui	a4,0x1a10a
1c0099a2:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c0099a6:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa107ffc>
1c0099aa:	0ae7ac23          	sw	a4,184(a5)
1c0099ae:	4741                	li	a4,16
1c0099b0:	0a07a223          	sw	zero,164(a5)
1c0099b4:	0a07a623          	sw	zero,172(a5)
1c0099b8:	0a07aa23          	sw	zero,180(a5)
1c0099bc:	0ae7ae23          	sw	a4,188(a5)
1c0099c0:	00400793          	li	a5,4
1c0099c4:	0007a823          	sw	zero,16(a5)
1c0099c8:	0007a023          	sw	zero,0(a5)
1c0099cc:	8082                	ret

1c0099ce <__rt_thread_enqueue_ready>:
1c0099ce:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c0099d2:	02052c23          	sw	zero,56(a0)
1c0099d6:	01800793          	li	a5,24
1c0099da:	e711                	bnez	a4,1c0099e6 <__rt_thread_enqueue_ready+0x18>
1c0099dc:	c388                	sw	a0,0(a5)
1c0099de:	c3c8                	sw	a0,4(a5)
1c0099e0:	0c052a23          	sw	zero,212(a0)
1c0099e4:	8082                	ret
1c0099e6:	43d8                	lw	a4,4(a5)
1c0099e8:	df08                	sw	a0,56(a4)
1c0099ea:	bfd5                	j	1c0099de <__rt_thread_enqueue_ready+0x10>

1c0099ec <__rt_thread_sleep>:
1c0099ec:	01800713          	li	a4,24
1c0099f0:	4708                	lw	a0,8(a4)
1c0099f2:	01800793          	li	a5,24
1c0099f6:	438c                	lw	a1,0(a5)
1c0099f8:	c999                	beqz	a1,1c009a0e <__rt_thread_sleep+0x22>
1c0099fa:	5d98                	lw	a4,56(a1)
1c0099fc:	c398                	sw	a4,0(a5)
1c0099fe:	4705                	li	a4,1
1c009a00:	0ce5aa23          	sw	a4,212(a1)
1c009a04:	00b50c63          	beq	a0,a1,1c009a1c <__rt_thread_sleep+0x30>
1c009a08:	c78c                	sw	a1,8(a5)
1c009a0a:	8bdfe06f          	j	1c0082c6 <__rt_thread_switch>
1c009a0e:	10500073          	wfi
1c009a12:	30045073          	csrwi	mstatus,8
1c009a16:	30047773          	csrrci	a4,mstatus,8
1c009a1a:	bff1                	j	1c0099f6 <__rt_thread_sleep+0xa>
1c009a1c:	8082                	ret

1c009a1e <rt_thread_exit>:
1c009a1e:	300477f3          	csrrci	a5,mstatus,8
1c009a22:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009a26:	4705                	li	a4,1
1c009a28:	c3e8                	sw	a0,68(a5)
1c009a2a:	5fc8                	lw	a0,60(a5)
1c009a2c:	c3b8                	sw	a4,64(a5)
1c009a2e:	c909                	beqz	a0,1c009a40 <rt_thread_exit+0x22>
1c009a30:	0d452783          	lw	a5,212(a0)
1c009a34:	c791                	beqz	a5,1c009a40 <rt_thread_exit+0x22>
1c009a36:	1141                	addi	sp,sp,-16
1c009a38:	c606                	sw	ra,12(sp)
1c009a3a:	3f51                	jal	1c0099ce <__rt_thread_enqueue_ready>
1c009a3c:	40b2                	lw	ra,12(sp)
1c009a3e:	0141                	addi	sp,sp,16
1c009a40:	b775                	j	1c0099ec <__rt_thread_sleep>

1c009a42 <__rt_thread_wakeup>:
1c009a42:	5d18                	lw	a4,56(a0)
1c009a44:	eb09                	bnez	a4,1c009a56 <__rt_thread_wakeup+0x14>
1c009a46:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c009a4a:	00a70663          	beq	a4,a0,1c009a56 <__rt_thread_wakeup+0x14>
1c009a4e:	0d452783          	lw	a5,212(a0)
1c009a52:	c391                	beqz	a5,1c009a56 <__rt_thread_wakeup+0x14>
1c009a54:	bfad                	j	1c0099ce <__rt_thread_enqueue_ready>
1c009a56:	8082                	ret

1c009a58 <__rt_thread_sched_init>:
1c009a58:	1141                	addi	sp,sp,-16
1c009a5a:	c422                	sw	s0,8(sp)
1c009a5c:	1c0087b7          	lui	a5,0x1c008
1c009a60:	1c001437          	lui	s0,0x1c001
1c009a64:	c226                	sw	s1,4(sp)
1c009a66:	c04a                	sw	s2,0(sp)
1c009a68:	c606                	sw	ra,12(sp)
1c009a6a:	ef040413          	addi	s0,s0,-272 # 1c000ef0 <__rt_thread_main>
1c009a6e:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009a72:	c01c                	sw	a5,0(s0)
1c009a74:	1c00a7b7          	lui	a5,0x1c00a
1c009a78:	04840913          	addi	s2,s0,72
1c009a7c:	a1e78793          	addi	a5,a5,-1506 # 1c009a1e <rt_thread_exit>
1c009a80:	01800493          	li	s1,24
1c009a84:	c45c                	sw	a5,12(s0)
1c009a86:	854a                	mv	a0,s2
1c009a88:	4785                	li	a5,1
1c009a8a:	e3ff6597          	auipc	a1,0xe3ff6
1c009a8e:	59e58593          	addi	a1,a1,1438 # 28 <__rt_sched>
1c009a92:	0cf42a23          	sw	a5,212(s0)
1c009a96:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa1027ec>
1c009a9a:	02042a23          	sw	zero,52(s0)
1c009a9e:	00042223          	sw	zero,4(s0)
1c009aa2:	00042423          	sw	zero,8(s0)
1c009aa6:	2829                	jal	1c009ac0 <__rt_event_init>
1c009aa8:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009aac:	c480                	sw	s0,8(s1)
1c009aae:	40b2                	lw	ra,12(sp)
1c009ab0:	d03c                	sw	a5,96(s0)
1c009ab2:	4422                	lw	s0,8(sp)
1c009ab4:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009ab8:	4492                	lw	s1,4(sp)
1c009aba:	4902                	lw	s2,0(sp)
1c009abc:	0141                	addi	sp,sp,16
1c009abe:	8082                	ret

1c009ac0 <__rt_event_init>:
1c009ac0:	02052023          	sw	zero,32(a0)
1c009ac4:	02052223          	sw	zero,36(a0)
1c009ac8:	02052823          	sw	zero,48(a0)
1c009acc:	00052023          	sw	zero,0(a0)
1c009ad0:	8082                	ret

1c009ad2 <__rt_wait_event_prepare_blocking>:
1c009ad2:	02400793          	li	a5,36
1c009ad6:	4388                	lw	a0,0(a5)
1c009ad8:	4d18                	lw	a4,24(a0)
1c009ada:	02052223          	sw	zero,36(a0)
1c009ade:	c398                	sw	a4,0(a5)
1c009ae0:	4785                	li	a5,1
1c009ae2:	d11c                	sw	a5,32(a0)
1c009ae4:	00052023          	sw	zero,0(a0)
1c009ae8:	8082                	ret

1c009aea <rt_event_alloc>:
1c009aea:	1141                	addi	sp,sp,-16
1c009aec:	c422                	sw	s0,8(sp)
1c009aee:	842e                	mv	s0,a1
1c009af0:	c606                	sw	ra,12(sp)
1c009af2:	c226                	sw	s1,4(sp)
1c009af4:	300474f3          	csrrci	s1,mstatus,8
1c009af8:	f14027f3          	csrr	a5,mhartid
1c009afc:	8795                	srai	a5,a5,0x5
1c009afe:	03f7f793          	andi	a5,a5,63
1c009b02:	477d                	li	a4,31
1c009b04:	00378513          	addi	a0,a5,3
1c009b08:	00e79363          	bne	a5,a4,1c009b0e <rt_event_alloc+0x24>
1c009b0c:	4501                	li	a0,0
1c009b0e:	08c00593          	li	a1,140
1c009b12:	02b405b3          	mul	a1,s0,a1
1c009b16:	882ff0ef          	jal	ra,1c008b98 <rt_alloc>
1c009b1a:	87aa                	mv	a5,a0
1c009b1c:	557d                	li	a0,-1
1c009b1e:	cf91                	beqz	a5,1c009b3a <rt_event_alloc+0x50>
1c009b20:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009b24:	4581                	li	a1,0
1c009b26:	4601                	li	a2,0
1c009b28:	02400713          	li	a4,36
1c009b2c:	00864c63          	blt	a2,s0,1c009b44 <rt_event_alloc+0x5a>
1c009b30:	c191                	beqz	a1,1c009b34 <rt_event_alloc+0x4a>
1c009b32:	c314                	sw	a3,0(a4)
1c009b34:	30049073          	csrw	mstatus,s1
1c009b38:	4501                	li	a0,0
1c009b3a:	40b2                	lw	ra,12(sp)
1c009b3c:	4422                	lw	s0,8(sp)
1c009b3e:	4492                	lw	s1,4(sp)
1c009b40:	0141                	addi	sp,sp,16
1c009b42:	8082                	ret
1c009b44:	cf94                	sw	a3,24(a5)
1c009b46:	0207a023          	sw	zero,32(a5)
1c009b4a:	0207a223          	sw	zero,36(a5)
1c009b4e:	0207a823          	sw	zero,48(a5)
1c009b52:	0007a023          	sw	zero,0(a5)
1c009b56:	86be                	mv	a3,a5
1c009b58:	0605                	addi	a2,a2,1
1c009b5a:	4585                	li	a1,1
1c009b5c:	08c78793          	addi	a5,a5,140
1c009b60:	b7f1                	j	1c009b2c <rt_event_alloc+0x42>

1c009b62 <rt_event_get>:
1c009b62:	30047773          	csrrci	a4,mstatus,8
1c009b66:	02400793          	li	a5,36
1c009b6a:	4388                	lw	a0,0(a5)
1c009b6c:	c509                	beqz	a0,1c009b76 <rt_event_get+0x14>
1c009b6e:	4d14                	lw	a3,24(a0)
1c009b70:	c150                	sw	a2,4(a0)
1c009b72:	c394                	sw	a3,0(a5)
1c009b74:	c10c                	sw	a1,0(a0)
1c009b76:	30071073          	csrw	mstatus,a4
1c009b7a:	8082                	ret

1c009b7c <rt_event_get_blocking>:
1c009b7c:	30047773          	csrrci	a4,mstatus,8
1c009b80:	02400793          	li	a5,36
1c009b84:	4388                	lw	a0,0(a5)
1c009b86:	c909                	beqz	a0,1c009b98 <rt_event_get_blocking+0x1c>
1c009b88:	4d14                	lw	a3,24(a0)
1c009b8a:	00052223          	sw	zero,4(a0)
1c009b8e:	c394                	sw	a3,0(a5)
1c009b90:	4785                	li	a5,1
1c009b92:	00052023          	sw	zero,0(a0)
1c009b96:	d11c                	sw	a5,32(a0)
1c009b98:	30071073          	csrw	mstatus,a4
1c009b9c:	8082                	ret

1c009b9e <rt_event_push>:
1c009b9e:	30047773          	csrrci	a4,mstatus,8
1c009ba2:	02400693          	li	a3,36
1c009ba6:	42d4                	lw	a3,4(a3)
1c009ba8:	00052c23          	sw	zero,24(a0)
1c009bac:	02400793          	li	a5,36
1c009bb0:	e691                	bnez	a3,1c009bbc <rt_event_push+0x1e>
1c009bb2:	c3c8                	sw	a0,4(a5)
1c009bb4:	c788                	sw	a0,8(a5)
1c009bb6:	30071073          	csrw	mstatus,a4
1c009bba:	8082                	ret
1c009bbc:	4794                	lw	a3,8(a5)
1c009bbe:	ce88                	sw	a0,24(a3)
1c009bc0:	bfd5                	j	1c009bb4 <rt_event_push+0x16>

1c009bc2 <__rt_event_execute>:
1c009bc2:	1141                	addi	sp,sp,-16
1c009bc4:	c422                	sw	s0,8(sp)
1c009bc6:	02400793          	li	a5,36
1c009bca:	43dc                	lw	a5,4(a5)
1c009bcc:	c606                	sw	ra,12(sp)
1c009bce:	c226                	sw	s1,4(sp)
1c009bd0:	02400413          	li	s0,36
1c009bd4:	eb91                	bnez	a5,1c009be8 <__rt_event_execute+0x26>
1c009bd6:	c1a9                	beqz	a1,1c009c18 <__rt_event_execute+0x56>
1c009bd8:	10500073          	wfi
1c009bdc:	30045073          	csrwi	mstatus,8
1c009be0:	300477f3          	csrrci	a5,mstatus,8
1c009be4:	405c                	lw	a5,4(s0)
1c009be6:	cb8d                	beqz	a5,1c009c18 <__rt_event_execute+0x56>
1c009be8:	4485                	li	s1,1
1c009bea:	4f98                	lw	a4,24(a5)
1c009bec:	53d4                	lw	a3,36(a5)
1c009bee:	00978823          	sb	s1,16(a5)
1c009bf2:	c058                	sw	a4,4(s0)
1c009bf4:	43c8                	lw	a0,4(a5)
1c009bf6:	4398                	lw	a4,0(a5)
1c009bf8:	e691                	bnez	a3,1c009c04 <__rt_event_execute+0x42>
1c009bfa:	5394                	lw	a3,32(a5)
1c009bfc:	e681                	bnez	a3,1c009c04 <__rt_event_execute+0x42>
1c009bfe:	4014                	lw	a3,0(s0)
1c009c00:	c01c                	sw	a5,0(s0)
1c009c02:	cf94                	sw	a3,24(a5)
1c009c04:	0207a023          	sw	zero,32(a5)
1c009c08:	c711                	beqz	a4,1c009c14 <__rt_event_execute+0x52>
1c009c0a:	30045073          	csrwi	mstatus,8
1c009c0e:	9702                	jalr	a4
1c009c10:	300477f3          	csrrci	a5,mstatus,8
1c009c14:	405c                	lw	a5,4(s0)
1c009c16:	fbf1                	bnez	a5,1c009bea <__rt_event_execute+0x28>
1c009c18:	40b2                	lw	ra,12(sp)
1c009c1a:	4422                	lw	s0,8(sp)
1c009c1c:	4492                	lw	s1,4(sp)
1c009c1e:	0141                	addi	sp,sp,16
1c009c20:	8082                	ret

1c009c22 <__rt_wait_event>:
1c009c22:	1141                	addi	sp,sp,-16
1c009c24:	c422                	sw	s0,8(sp)
1c009c26:	c606                	sw	ra,12(sp)
1c009c28:	842a                	mv	s0,a0
1c009c2a:	501c                	lw	a5,32(s0)
1c009c2c:	ef81                	bnez	a5,1c009c44 <__rt_wait_event+0x22>
1c009c2e:	581c                	lw	a5,48(s0)
1c009c30:	eb91                	bnez	a5,1c009c44 <__rt_wait_event+0x22>
1c009c32:	02400793          	li	a5,36
1c009c36:	4398                	lw	a4,0(a5)
1c009c38:	40b2                	lw	ra,12(sp)
1c009c3a:	c380                	sw	s0,0(a5)
1c009c3c:	cc18                	sw	a4,24(s0)
1c009c3e:	4422                	lw	s0,8(sp)
1c009c40:	0141                	addi	sp,sp,16
1c009c42:	8082                	ret
1c009c44:	4585                	li	a1,1
1c009c46:	4501                	li	a0,0
1c009c48:	3fad                	jal	1c009bc2 <__rt_event_execute>
1c009c4a:	b7c5                	j	1c009c2a <__rt_wait_event+0x8>

1c009c4c <rt_event_wait>:
1c009c4c:	1141                	addi	sp,sp,-16
1c009c4e:	c606                	sw	ra,12(sp)
1c009c50:	c422                	sw	s0,8(sp)
1c009c52:	30047473          	csrrci	s0,mstatus,8
1c009c56:	37f1                	jal	1c009c22 <__rt_wait_event>
1c009c58:	30041073          	csrw	mstatus,s0
1c009c5c:	40b2                	lw	ra,12(sp)
1c009c5e:	4422                	lw	s0,8(sp)
1c009c60:	0141                	addi	sp,sp,16
1c009c62:	8082                	ret

1c009c64 <__rt_event_sched_init>:
1c009c64:	02400513          	li	a0,36
1c009c68:	00052023          	sw	zero,0(a0)
1c009c6c:	00052223          	sw	zero,4(a0)
1c009c70:	4585                	li	a1,1
1c009c72:	0511                	addi	a0,a0,4
1c009c74:	bd9d                	j	1c009aea <rt_event_alloc>

1c009c76 <__rt_fll_set_freq>:
1c009c76:	1141                	addi	sp,sp,-16
1c009c78:	c422                	sw	s0,8(sp)
1c009c7a:	c226                	sw	s1,4(sp)
1c009c7c:	c606                	sw	ra,12(sp)
1c009c7e:	842a                	mv	s0,a0
1c009c80:	84ae                	mv	s1,a1
1c009c82:	e111                	bnez	a0,1c009c86 <__rt_fll_set_freq+0x10>
1c009c84:	3965                	jal	1c00993c <__rt_bridge_req_shutdown>
1c009c86:	8526                	mv	a0,s1
1c009c88:	86dfe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009c8c:	1579                	addi	a0,a0,-2
1c009c8e:	00155793          	srli	a5,a0,0x1
1c009c92:	e391                	bnez	a5,1c009c96 <__rt_fll_set_freq+0x20>
1c009c94:	4785                	li	a5,1
1c009c96:	fff78713          	addi	a4,a5,-1
1c009c9a:	4505                	li	a0,1
1c009c9c:	00e51533          	sll	a0,a0,a4
1c009ca0:	00f494b3          	sll	s1,s1,a5
1c009ca4:	7761                	lui	a4,0xffff8
1c009ca6:	8f65                	and	a4,a4,s1
1c009ca8:	1c0016b7          	lui	a3,0x1c001
1c009cac:	953a                	add	a0,a0,a4
1c009cae:	20068693          	addi	a3,a3,512 # 1c001200 <__rt_fll_freq>
1c009cb2:	00241713          	slli	a4,s0,0x2
1c009cb6:	9736                	add	a4,a4,a3
1c009cb8:	00f55533          	srl	a0,a0,a5
1c009cbc:	c308                	sw	a0,0(a4)
1c009cbe:	1c001737          	lui	a4,0x1c001
1c009cc2:	19c70713          	addi	a4,a4,412 # 1c00119c <__rt_fll_is_on>
1c009cc6:	9722                	add	a4,a4,s0
1c009cc8:	00074703          	lbu	a4,0(a4)
1c009ccc:	c715                	beqz	a4,1c009cf8 <__rt_fll_set_freq+0x82>
1c009cce:	1a100737          	lui	a4,0x1a100
1c009cd2:	0711                	addi	a4,a4,4
1c009cd4:	0412                	slli	s0,s0,0x4
1c009cd6:	943a                	add	s0,s0,a4
1c009cd8:	4018                	lw	a4,0(s0)
1c009cda:	80bd                	srli	s1,s1,0xf
1c009cdc:	76c1                	lui	a3,0xffff0
1c009cde:	04c2                	slli	s1,s1,0x10
1c009ce0:	8f75                	and	a4,a4,a3
1c009ce2:	80c1                	srli	s1,s1,0x10
1c009ce4:	0785                	addi	a5,a5,1
1c009ce6:	c40006b7          	lui	a3,0xc4000
1c009cea:	8f45                	or	a4,a4,s1
1c009cec:	8bbd                	andi	a5,a5,15
1c009cee:	16fd                	addi	a3,a3,-1
1c009cf0:	07ea                	slli	a5,a5,0x1a
1c009cf2:	8f75                	and	a4,a4,a3
1c009cf4:	8fd9                	or	a5,a5,a4
1c009cf6:	c01c                	sw	a5,0(s0)
1c009cf8:	40b2                	lw	ra,12(sp)
1c009cfa:	4422                	lw	s0,8(sp)
1c009cfc:	4492                	lw	s1,4(sp)
1c009cfe:	0141                	addi	sp,sp,16
1c009d00:	8082                	ret

1c009d02 <__rt_fll_init>:
1c009d02:	1141                	addi	sp,sp,-16
1c009d04:	1a1005b7          	lui	a1,0x1a100
1c009d08:	00451613          	slli	a2,a0,0x4
1c009d0c:	c226                	sw	s1,4(sp)
1c009d0e:	84aa                	mv	s1,a0
1c009d10:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fe7f0>
1c009d14:	9532                	add	a0,a0,a2
1c009d16:	4114                	lw	a3,0(a0)
1c009d18:	c606                	sw	ra,12(sp)
1c009d1a:	c422                	sw	s0,8(sp)
1c009d1c:	87b6                	mv	a5,a3
1c009d1e:	0406c963          	bltz	a3,1c009d70 <__rt_fll_init+0x6e>
1c009d22:	00858793          	addi	a5,a1,8
1c009d26:	97b2                	add	a5,a5,a2
1c009d28:	4398                	lw	a4,0(a5)
1c009d2a:	7841                	lui	a6,0xffff0
1c009d2c:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009d30:	01077733          	and	a4,a4,a6
1c009d34:	6809                	lui	a6,0x2
1c009d36:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009d3a:	01076733          	or	a4,a4,a6
1c009d3e:	f0010837          	lui	a6,0xf0010
1c009d42:	187d                	addi	a6,a6,-1
1c009d44:	01077733          	and	a4,a4,a6
1c009d48:	00500837          	lui	a6,0x500
1c009d4c:	01076733          	or	a4,a4,a6
1c009d50:	05b1                	addi	a1,a1,12
1c009d52:	c398                	sw	a4,0(a5)
1c009d54:	962e                	add	a2,a2,a1
1c009d56:	421c                	lw	a5,0(a2)
1c009d58:	fc010737          	lui	a4,0xfc010
1c009d5c:	177d                	addi	a4,a4,-1
1c009d5e:	8ff9                	and	a5,a5,a4
1c009d60:	014c0737          	lui	a4,0x14c0
1c009d64:	8fd9                	or	a5,a5,a4
1c009d66:	c21c                	sw	a5,0(a2)
1c009d68:	c00007b7          	lui	a5,0xc0000
1c009d6c:	8fd5                	or	a5,a5,a3
1c009d6e:	c11c                	sw	a5,0(a0)
1c009d70:	1c001637          	lui	a2,0x1c001
1c009d74:	00249713          	slli	a4,s1,0x2
1c009d78:	20060613          	addi	a2,a2,512 # 1c001200 <__rt_fll_freq>
1c009d7c:	9732                	add	a4,a4,a2
1c009d7e:	4300                	lw	s0,0(a4)
1c009d80:	c015                	beqz	s0,1c009da4 <__rt_fll_init+0xa2>
1c009d82:	85a2                	mv	a1,s0
1c009d84:	8526                	mv	a0,s1
1c009d86:	3dc5                	jal	1c009c76 <__rt_fll_set_freq>
1c009d88:	1c001537          	lui	a0,0x1c001
1c009d8c:	19c50513          	addi	a0,a0,412 # 1c00119c <__rt_fll_is_on>
1c009d90:	9526                	add	a0,a0,s1
1c009d92:	4785                	li	a5,1
1c009d94:	00f50023          	sb	a5,0(a0)
1c009d98:	40b2                	lw	ra,12(sp)
1c009d9a:	8522                	mv	a0,s0
1c009d9c:	4422                	lw	s0,8(sp)
1c009d9e:	4492                	lw	s1,4(sp)
1c009da0:	0141                	addi	sp,sp,16
1c009da2:	8082                	ret
1c009da4:	06c2                	slli	a3,a3,0x10
1c009da6:	83e9                	srli	a5,a5,0x1a
1c009da8:	82c1                	srli	a3,a3,0x10
1c009daa:	8bbd                	andi	a5,a5,15
1c009dac:	06be                	slli	a3,a3,0xf
1c009dae:	17fd                	addi	a5,a5,-1
1c009db0:	00f6d433          	srl	s0,a3,a5
1c009db4:	c300                	sw	s0,0(a4)
1c009db6:	bfc9                	j	1c009d88 <__rt_fll_init+0x86>

1c009db8 <__rt_fll_deinit>:
1c009db8:	1c0017b7          	lui	a5,0x1c001
1c009dbc:	19c78793          	addi	a5,a5,412 # 1c00119c <__rt_fll_is_on>
1c009dc0:	953e                	add	a0,a0,a5
1c009dc2:	00050023          	sb	zero,0(a0)
1c009dc6:	8082                	ret

1c009dc8 <__rt_flls_constructor>:
1c009dc8:	1c0017b7          	lui	a5,0x1c001
1c009dcc:	2007a023          	sw	zero,512(a5) # 1c001200 <__rt_fll_freq>
1c009dd0:	20078793          	addi	a5,a5,512
1c009dd4:	0007a223          	sw	zero,4(a5)
1c009dd8:	1c0017b7          	lui	a5,0x1c001
1c009ddc:	18079e23          	sh	zero,412(a5) # 1c00119c <__rt_fll_is_on>
1c009de0:	8082                	ret

1c009de2 <gcd>:
1c009de2:	cd19                	beqz	a0,1c009e00 <gcd+0x1e>
1c009de4:	cd81                	beqz	a1,1c009dfc <gcd+0x1a>
1c009de6:	00054463          	bltz	a0,1c009dee <gcd+0xc>
1c009dea:	0005d563          	bgez	a1,1c009df4 <gcd+0x12>
1c009dee:	55fd                	li	a1,-1
1c009df0:	a031                	j	1c009dfc <gcd+0x1a>
1c009df2:	85be                	mv	a1,a5
1c009df4:	02b567b3          	rem	a5,a0,a1
1c009df8:	852e                	mv	a0,a1
1c009dfa:	ffe5                	bnez	a5,1c009df2 <gcd+0x10>
1c009dfc:	852e                	mv	a0,a1
1c009dfe:	8082                	ret
1c009e00:	4581                	li	a1,0
1c009e02:	bfed                	j	1c009dfc <gcd+0x1a>

1c009e04 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009e04:	1101                	addi	sp,sp,-32
1c009e06:	1c0017b7          	lui	a5,0x1c001
1c009e0a:	c84a                	sw	s2,16(sp)
1c009e0c:	1a07a903          	lw	s2,416(a5) # 1c0011a0 <__rt_periph_lcm>
1c009e10:	c452                	sw	s4,8(sp)
1c009e12:	8a2e                	mv	s4,a1
1c009e14:	85ca                	mv	a1,s2
1c009e16:	ce06                	sw	ra,28(sp)
1c009e18:	cc22                	sw	s0,24(sp)
1c009e1a:	ca26                	sw	s1,20(sp)
1c009e1c:	842a                	mv	s0,a0
1c009e1e:	c64e                	sw	s3,12(sp)
1c009e20:	89aa                	mv	s3,a0
1c009e22:	37c1                	jal	1c009de2 <gcd>
1c009e24:	02a44533          	div	a0,s0,a0
1c009e28:	03250933          	mul	s2,a0,s2
1c009e2c:	4511                	li	a0,4
1c009e2e:	82dff0ef          	jal	ra,1c00965a <__rt_cbsys_exec>
1c009e32:	1c0017b7          	lui	a5,0x1c001
1c009e36:	2007a783          	lw	a5,512(a5) # 1c001200 <__rt_fll_freq>
1c009e3a:	028954b3          	divu	s1,s2,s0
1c009e3e:	0527f263          	bleu	s2,a5,1c009e82 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009e42:	1a1047b7          	lui	a5,0x1a104
1c009e46:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1028c0>
1c009e4a:	4705                	li	a4,1
1c009e4c:	0ce7ae23          	sw	a4,220(a5)
1c009e50:	85a2                	mv	a1,s0
1c009e52:	4501                	li	a0,0
1c009e54:	350d                	jal	1c009c76 <__rt_fll_set_freq>
1c009e56:	57fd                	li	a5,-1
1c009e58:	00fa0963          	beq	s4,a5,1c009e6a <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009e5c:	c099                	beqz	s1,1c009e62 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009e5e:	029459b3          	divu	s3,s0,s1
1c009e62:	1c0017b7          	lui	a5,0x1c001
1c009e66:	2137a423          	sw	s3,520(a5) # 1c001208 <__rt_freq_domains>
1c009e6a:	4515                	li	a0,5
1c009e6c:	feeff0ef          	jal	ra,1c00965a <__rt_cbsys_exec>
1c009e70:	40f2                	lw	ra,28(sp)
1c009e72:	4462                	lw	s0,24(sp)
1c009e74:	44d2                	lw	s1,20(sp)
1c009e76:	4942                	lw	s2,16(sp)
1c009e78:	49b2                	lw	s3,12(sp)
1c009e7a:	4a22                	lw	s4,8(sp)
1c009e7c:	4501                	li	a0,0
1c009e7e:	6105                	addi	sp,sp,32
1c009e80:	8082                	ret
1c009e82:	85a2                	mv	a1,s0
1c009e84:	4501                	li	a0,0
1c009e86:	3bc5                	jal	1c009c76 <__rt_fll_set_freq>
1c009e88:	1a1047b7          	lui	a5,0x1a104
1c009e8c:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1028c0>
1c009e90:	4705                	li	a4,1
1c009e92:	0ce7ae23          	sw	a4,220(a5)
1c009e96:	b7c1                	j	1c009e56 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009e98 <rt_freq_set_and_get>:
1c009e98:	1141                	addi	sp,sp,-16
1c009e9a:	852e                	mv	a0,a1
1c009e9c:	c606                	sw	ra,12(sp)
1c009e9e:	c422                	sw	s0,8(sp)
1c009ea0:	30047473          	csrrci	s0,mstatus,8
1c009ea4:	4581                	li	a1,0
1c009ea6:	3fb9                	jal	1c009e04 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009ea8:	30041073          	csrw	mstatus,s0
1c009eac:	40b2                	lw	ra,12(sp)
1c009eae:	4422                	lw	s0,8(sp)
1c009eb0:	00a03533          	snez	a0,a0
1c009eb4:	40a00533          	neg	a0,a0
1c009eb8:	0141                	addi	sp,sp,16
1c009eba:	8082                	ret

1c009ebc <__rt_freq_init>:
1c009ebc:	1141                	addi	sp,sp,-16
1c009ebe:	c422                	sw	s0,8(sp)
1c009ec0:	c606                	sw	ra,12(sp)
1c009ec2:	3719                	jal	1c009dc8 <__rt_flls_constructor>
1c009ec4:	1c0017b7          	lui	a5,0x1c001
1c009ec8:	0ac7a703          	lw	a4,172(a5) # 1c0010ac <__rt_platform>
1c009ecc:	4785                	li	a5,1
1c009ece:	1c001437          	lui	s0,0x1c001
1c009ed2:	02f70663          	beq	a4,a5,1c009efe <__rt_freq_init+0x42>
1c009ed6:	4501                	li	a0,0
1c009ed8:	352d                	jal	1c009d02 <__rt_fll_init>
1c009eda:	20a42423          	sw	a0,520(s0) # 1c001208 <__rt_freq_domains>
1c009ede:	1a1047b7          	lui	a5,0x1a104
1c009ee2:	4709                	li	a4,2
1c009ee4:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1028bc>
1c009ee8:	4705                	li	a4,1
1c009eea:	0ce7ac23          	sw	a4,216(a5)
1c009eee:	40b2                	lw	ra,12(sp)
1c009ef0:	4422                	lw	s0,8(sp)
1c009ef2:	0ce7ae23          	sw	a4,220(a5)
1c009ef6:	0ce7aa23          	sw	a4,212(a5)
1c009efa:	0141                	addi	sp,sp,16
1c009efc:	8082                	ret
1c009efe:	026267b7          	lui	a5,0x2626
1c009f02:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2617214>
1c009f06:	20f42423          	sw	a5,520(s0)
1c009f0a:	bfd1                	j	1c009ede <__rt_freq_init+0x22>

1c009f0c <hal_itc_wait_for_event_noirq>:
1c009f0c:	1a10a7b7          	lui	a5,0x1a10a
1c009f10:	300476f3          	csrrci	a3,mstatus,8
1c009f14:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa107ff8>
1c009f18:	8f69                	and	a4,a4,a0
1c009f1a:	eb11                	bnez	a4,1c009f2e <hal_itc_wait_for_event_noirq+0x22>
1c009f1c:	80a7a223          	sw	a0,-2044(a5)
1c009f20:	10500073          	wfi
1c009f24:	80a7a423          	sw	a0,-2040(a5)
1c009f28:	30069073          	csrw	mstatus,a3
1c009f2c:	b7d5                	j	1c009f10 <hal_itc_wait_for_event_noirq+0x4>
1c009f2e:	80a7aa23          	sw	a0,-2028(a5)
1c009f32:	30069073          	csrw	mstatus,a3
1c009f36:	8082                	ret

1c009f38 <__rt_pmu_cluster_power_down>:
1c009f38:	1a1047b7          	lui	a5,0x1a104
1c009f3c:	5bbc                	lw	a5,112(a5)
1c009f3e:	01079713          	slli	a4,a5,0x10
1c009f42:	02074c63          	bltz	a4,1c009f7a <__rt_pmu_cluster_power_down+0x42>
1c009f46:	1141                	addi	sp,sp,-16
1c009f48:	c422                	sw	s0,8(sp)
1c009f4a:	c606                	sw	ra,12(sp)
1c009f4c:	c226                	sw	s1,4(sp)
1c009f4e:	1a104437          	lui	s0,0x1a104
1c009f52:	547c                	lw	a5,108(s0)
1c009f54:	e385                	bnez	a5,1c009f74 <__rt_pmu_cluster_power_down+0x3c>
1c009f56:	4485                	li	s1,1
1c009f58:	c444                	sw	s1,12(s0)
1c009f5a:	478d                	li	a5,3
1c009f5c:	d83c                	sw	a5,112(s0)
1c009f5e:	00800537          	lui	a0,0x800
1c009f62:	376d                	jal	1c009f0c <hal_itc_wait_for_event_noirq>
1c009f64:	d824                	sw	s1,112(s0)
1c009f66:	4422                	lw	s0,8(sp)
1c009f68:	40b2                	lw	ra,12(sp)
1c009f6a:	4492                	lw	s1,4(sp)
1c009f6c:	00400537          	lui	a0,0x400
1c009f70:	0141                	addi	sp,sp,16
1c009f72:	bf69                	j	1c009f0c <hal_itc_wait_for_event_noirq>
1c009f74:	4505                	li	a0,1
1c009f76:	2a11                	jal	1c00a08a <rt_time_wait_us>
1c009f78:	bfe9                	j	1c009f52 <__rt_pmu_cluster_power_down+0x1a>
1c009f7a:	8082                	ret

1c009f7c <__rt_pmu_cluster_power_up>:
1c009f7c:	1141                	addi	sp,sp,-16
1c009f7e:	c606                	sw	ra,12(sp)
1c009f80:	c422                	sw	s0,8(sp)
1c009f82:	478d                	li	a5,3
1c009f84:	1a104437          	lui	s0,0x1a104
1c009f88:	d83c                	sw	a5,112(s0)
1c009f8a:	00400537          	lui	a0,0x400
1c009f8e:	3fbd                	jal	1c009f0c <hal_itc_wait_for_event_noirq>
1c009f90:	02700793          	li	a5,39
1c009f94:	d83c                	sw	a5,112(s0)
1c009f96:	00800537          	lui	a0,0x800
1c009f9a:	3f8d                	jal	1c009f0c <hal_itc_wait_for_event_noirq>
1c009f9c:	6791                	lui	a5,0x4
1c009f9e:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa1027f8>
1c009fa2:	02778793          	addi	a5,a5,39 # 4027 <_l1_preload_size+0x2817>
1c009fa6:	d83c                	sw	a5,112(s0)
1c009fa8:	40b2                	lw	ra,12(sp)
1c009faa:	4422                	lw	s0,8(sp)
1c009fac:	4505                	li	a0,1
1c009fae:	0141                	addi	sp,sp,16
1c009fb0:	8082                	ret

1c009fb2 <__rt_pmu_init>:
1c009fb2:	1a1077b7          	lui	a5,0x1a107
1c009fb6:	4741                	li	a4,16
1c009fb8:	cb98                	sw	a4,16(a5)
1c009fba:	1a10a7b7          	lui	a5,0x1a10a
1c009fbe:	02000737          	lui	a4,0x2000
1c009fc2:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa108000>
1c009fc6:	4709                	li	a4,2
1c009fc8:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c009fcc:	8082                	ret

1c009fce <rt_padframe_set>:
1c009fce:	300476f3          	csrrci	a3,mstatus,8
1c009fd2:	4158                	lw	a4,4(a0)
1c009fd4:	1a1047b7          	lui	a5,0x1a104
1c009fd8:	4310                	lw	a2,0(a4)
1c009fda:	cb90                	sw	a2,16(a5)
1c009fdc:	4350                	lw	a2,4(a4)
1c009fde:	cbd0                	sw	a2,20(a5)
1c009fe0:	4710                	lw	a2,8(a4)
1c009fe2:	cf90                	sw	a2,24(a5)
1c009fe4:	4758                	lw	a4,12(a4)
1c009fe6:	cfd8                	sw	a4,28(a5)
1c009fe8:	30069073          	csrw	mstatus,a3
1c009fec:	8082                	ret

1c009fee <__rt_padframe_init>:
1c009fee:	1c001537          	lui	a0,0x1c001
1c009ff2:	fdc50513          	addi	a0,a0,-36 # 1c000fdc <__rt_padframe_profiles>
1c009ff6:	bfe1                	j	1c009fce <rt_padframe_set>

1c009ff8 <__rt_time_poweroff>:
1c009ff8:	1a10b7b7          	lui	a5,0x1a10b
1c009ffc:	47d8                	lw	a4,12(a5)
1c009ffe:	1c0017b7          	lui	a5,0x1c001
1c00a002:	4501                	li	a0,0
1c00a004:	1ae7a223          	sw	a4,420(a5) # 1c0011a4 <timer_count>
1c00a008:	8082                	ret

1c00a00a <__rt_time_poweron>:
1c00a00a:	1c0017b7          	lui	a5,0x1c001
1c00a00e:	1a47a703          	lw	a4,420(a5) # 1c0011a4 <timer_count>
1c00a012:	1a10b7b7          	lui	a5,0x1a10b
1c00a016:	4501                	li	a0,0
1c00a018:	c7d8                	sw	a4,12(a5)
1c00a01a:	8082                	ret

1c00a01c <rt_event_push_delayed>:
1c00a01c:	30047373          	csrrci	t1,mstatus,8
1c00a020:	1a10b6b7          	lui	a3,0x1a10b
1c00a024:	46d0                	lw	a2,12(a3)
1c00a026:	1c001737          	lui	a4,0x1c001
1c00a02a:	21072783          	lw	a5,528(a4) # 1c001210 <first_delayed>
1c00a02e:	86ba                	mv	a3,a4
1c00a030:	0005d363          	bgez	a1,1c00a036 <rt_event_push_delayed+0x1a>
1c00a034:	4581                	li	a1,0
1c00a036:	4779                	li	a4,30
1c00a038:	02e5c5b3          	div	a1,a1,a4
1c00a03c:	80000737          	lui	a4,0x80000
1c00a040:	fff74713          	not	a4,a4
1c00a044:	00e67833          	and	a6,a2,a4
1c00a048:	0585                	addi	a1,a1,1
1c00a04a:	962e                	add	a2,a2,a1
1c00a04c:	d950                	sw	a2,52(a0)
1c00a04e:	982e                	add	a6,a6,a1
1c00a050:	4601                	li	a2,0
1c00a052:	c799                	beqz	a5,1c00a060 <rt_event_push_delayed+0x44>
1c00a054:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa109820>
1c00a058:	00e8f8b3          	and	a7,a7,a4
1c00a05c:	0108e863          	bltu	a7,a6,1c00a06c <rt_event_push_delayed+0x50>
1c00a060:	ca09                	beqz	a2,1c00a072 <rt_event_push_delayed+0x56>
1c00a062:	ce08                	sw	a0,24(a2)
1c00a064:	cd1c                	sw	a5,24(a0)
1c00a066:	30031073          	csrw	mstatus,t1
1c00a06a:	8082                	ret
1c00a06c:	863e                	mv	a2,a5
1c00a06e:	4f9c                	lw	a5,24(a5)
1c00a070:	b7cd                	j	1c00a052 <rt_event_push_delayed+0x36>
1c00a072:	cd1c                	sw	a5,24(a0)
1c00a074:	1a10b7b7          	lui	a5,0x1a10b
1c00a078:	47d8                	lw	a4,12(a5)
1c00a07a:	20a6a823          	sw	a0,528(a3) # 1a10b210 <__l1_end+0xa1099fc>
1c00a07e:	95ba                	add	a1,a1,a4
1c00a080:	cbcc                	sw	a1,20(a5)
1c00a082:	08500713          	li	a4,133
1c00a086:	c3d8                	sw	a4,4(a5)
1c00a088:	bff9                	j	1c00a066 <rt_event_push_delayed+0x4a>

1c00a08a <rt_time_wait_us>:
1c00a08a:	1101                	addi	sp,sp,-32
1c00a08c:	85aa                	mv	a1,a0
1c00a08e:	4501                	li	a0,0
1c00a090:	ce06                	sw	ra,28(sp)
1c00a092:	cc22                	sw	s0,24(sp)
1c00a094:	c62e                	sw	a1,12(sp)
1c00a096:	ae7ff0ef          	jal	ra,1c009b7c <rt_event_get_blocking>
1c00a09a:	45b2                	lw	a1,12(sp)
1c00a09c:	842a                	mv	s0,a0
1c00a09e:	3fbd                	jal	1c00a01c <rt_event_push_delayed>
1c00a0a0:	8522                	mv	a0,s0
1c00a0a2:	4462                	lw	s0,24(sp)
1c00a0a4:	40f2                	lw	ra,28(sp)
1c00a0a6:	6105                	addi	sp,sp,32
1c00a0a8:	b655                	j	1c009c4c <rt_event_wait>

1c00a0aa <__rt_time_init>:
1c00a0aa:	1141                	addi	sp,sp,-16
1c00a0ac:	1c0017b7          	lui	a5,0x1c001
1c00a0b0:	2007a823          	sw	zero,528(a5) # 1c001210 <first_delayed>
1c00a0b4:	08300713          	li	a4,131
1c00a0b8:	1a10b7b7          	lui	a5,0x1a10b
1c00a0bc:	c606                	sw	ra,12(sp)
1c00a0be:	c422                	sw	s0,8(sp)
1c00a0c0:	1c00a5b7          	lui	a1,0x1c00a
1c00a0c4:	c3d8                	sw	a4,4(a5)
1c00a0c6:	14258593          	addi	a1,a1,322 # 1c00a142 <__rt_timer_handler>
1c00a0ca:	452d                	li	a0,11
1c00a0cc:	bbeff0ef          	jal	ra,1c00948a <rt_irq_set_handler>
1c00a0d0:	f14027f3          	csrr	a5,mhartid
1c00a0d4:	8795                	srai	a5,a5,0x5
1c00a0d6:	6705                	lui	a4,0x1
1c00a0d8:	03f7f793          	andi	a5,a5,63
1c00a0dc:	46fd                	li	a3,31
1c00a0de:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a0e2:	04d79863          	bne	a5,a3,1c00a132 <__rt_time_init+0x88>
1c00a0e6:	1a10a7b7          	lui	a5,0x1a10a
1c00a0ea:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa107ff0>
1c00a0ee:	1c00a5b7          	lui	a1,0x1c00a
1c00a0f2:	4601                	li	a2,0
1c00a0f4:	ff858593          	addi	a1,a1,-8 # 1c009ff8 <__rt_time_poweroff>
1c00a0f8:	4509                	li	a0,2
1c00a0fa:	d20ff0ef          	jal	ra,1c00961a <__rt_cbsys_add>
1c00a0fe:	1c00a5b7          	lui	a1,0x1c00a
1c00a102:	842a                	mv	s0,a0
1c00a104:	4601                	li	a2,0
1c00a106:	00a58593          	addi	a1,a1,10 # 1c00a00a <__rt_time_poweron>
1c00a10a:	450d                	li	a0,3
1c00a10c:	d0eff0ef          	jal	ra,1c00961a <__rt_cbsys_add>
1c00a110:	8d41                	or	a0,a0,s0
1c00a112:	c505                	beqz	a0,1c00a13a <__rt_time_init+0x90>
1c00a114:	f1402673          	csrr	a2,mhartid
1c00a118:	1c000537          	lui	a0,0x1c000
1c00a11c:	40565593          	srai	a1,a2,0x5
1c00a120:	03f5f593          	andi	a1,a1,63
1c00a124:	8a7d                	andi	a2,a2,31
1c00a126:	52850513          	addi	a0,a0,1320 # 1c000528 <__DTOR_END__+0x23c>
1c00a12a:	015000ef          	jal	ra,1c00a93e <printf>
1c00a12e:	79c000ef          	jal	ra,1c00a8ca <abort>
1c00a132:	002047b7          	lui	a5,0x204
1c00a136:	cbd8                	sw	a4,20(a5)
1c00a138:	bf5d                	j	1c00a0ee <__rt_time_init+0x44>
1c00a13a:	40b2                	lw	ra,12(sp)
1c00a13c:	4422                	lw	s0,8(sp)
1c00a13e:	0141                	addi	sp,sp,16
1c00a140:	8082                	ret

1c00a142 <__rt_timer_handler>:
1c00a142:	7179                	addi	sp,sp,-48
1c00a144:	ce36                	sw	a3,28(sp)
1c00a146:	cc3a                	sw	a4,24(sp)
1c00a148:	1a10b6b7          	lui	a3,0x1a10b
1c00a14c:	1c001737          	lui	a4,0x1c001
1c00a150:	d61a                	sw	t1,44(sp)
1c00a152:	d032                	sw	a2,32(sp)
1c00a154:	ca3e                	sw	a5,20(sp)
1c00a156:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa1097f8>
1c00a15a:	21072783          	lw	a5,528(a4) # 1c001210 <first_delayed>
1c00a15e:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a162:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a166:	c842                	sw	a6,16(sp)
1c00a168:	80000837          	lui	a6,0x80000
1c00a16c:	d42a                	sw	a0,40(sp)
1c00a16e:	d22e                	sw	a1,36(sp)
1c00a170:	c646                	sw	a7,12(sp)
1c00a172:	c472                	sw	t3,8(sp)
1c00a174:	4581                	li	a1,0
1c00a176:	4501                	li	a0,0
1c00a178:	ffe84813          	xori	a6,a6,-2
1c00a17c:	efb9                	bnez	a5,1c00a1da <__rt_timer_handler+0x98>
1c00a17e:	c119                	beqz	a0,1c00a184 <__rt_timer_handler+0x42>
1c00a180:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a184:	c199                	beqz	a1,1c00a18a <__rt_timer_handler+0x48>
1c00a186:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a18a:	20072823          	sw	zero,528(a4)
1c00a18e:	1a10b7b7          	lui	a5,0x1a10b
1c00a192:	08100713          	li	a4,129
1c00a196:	c3d8                	sw	a4,4(a5)
1c00a198:	6785                	lui	a5,0x1
1c00a19a:	1a10a737          	lui	a4,0x1a10a
1c00a19e:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a1a2:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa108000>
1c00a1a6:	5332                	lw	t1,44(sp)
1c00a1a8:	5522                	lw	a0,40(sp)
1c00a1aa:	5592                	lw	a1,36(sp)
1c00a1ac:	5602                	lw	a2,32(sp)
1c00a1ae:	46f2                	lw	a3,28(sp)
1c00a1b0:	4762                	lw	a4,24(sp)
1c00a1b2:	47d2                	lw	a5,20(sp)
1c00a1b4:	4842                	lw	a6,16(sp)
1c00a1b6:	48b2                	lw	a7,12(sp)
1c00a1b8:	4e22                	lw	t3,8(sp)
1c00a1ba:	6145                	addi	sp,sp,48
1c00a1bc:	30200073          	mret
1c00a1c0:	0187a883          	lw	a7,24(a5)
1c00a1c4:	0007ac23          	sw	zero,24(a5)
1c00a1c8:	c611                	beqz	a2,1c00a1d4 <__rt_timer_handler+0x92>
1c00a1ca:	ce9c                	sw	a5,24(a3)
1c00a1cc:	86be                	mv	a3,a5
1c00a1ce:	4585                	li	a1,1
1c00a1d0:	87c6                	mv	a5,a7
1c00a1d2:	b76d                	j	1c00a17c <__rt_timer_handler+0x3a>
1c00a1d4:	863e                	mv	a2,a5
1c00a1d6:	4505                	li	a0,1
1c00a1d8:	bfd5                	j	1c00a1cc <__rt_timer_handler+0x8a>
1c00a1da:	0347a883          	lw	a7,52(a5)
1c00a1de:	41130e33          	sub	t3,t1,a7
1c00a1e2:	fdc87fe3          	bleu	t3,a6,1c00a1c0 <__rt_timer_handler+0x7e>
1c00a1e6:	c119                	beqz	a0,1c00a1ec <__rt_timer_handler+0xaa>
1c00a1e8:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a1ec:	c199                	beqz	a1,1c00a1f2 <__rt_timer_handler+0xb0>
1c00a1ee:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a1f2:	20f72823          	sw	a5,528(a4)
1c00a1f6:	1a10b737          	lui	a4,0x1a10b
1c00a1fa:	475c                	lw	a5,12(a4)
1c00a1fc:	406787b3          	sub	a5,a5,t1
1c00a200:	97c6                	add	a5,a5,a7
1c00a202:	cb5c                	sw	a5,20(a4)
1c00a204:	08500793          	li	a5,133
1c00a208:	c35c                	sw	a5,4(a4)
1c00a20a:	bf71                	j	1c00a1a6 <__rt_timer_handler+0x64>

1c00a20c <rt_periph_copy>:
1c00a20c:	7179                	addi	sp,sp,-48
1c00a20e:	d422                	sw	s0,40(sp)
1c00a210:	842a                	mv	s0,a0
1c00a212:	d606                	sw	ra,44(sp)
1c00a214:	d226                	sw	s1,36(sp)
1c00a216:	d04a                	sw	s2,32(sp)
1c00a218:	30047973          	csrrci	s2,mstatus,8
1c00a21c:	4015d493          	srai	s1,a1,0x1
1c00a220:	1a102537          	lui	a0,0x1a102
1c00a224:	049e                	slli	s1,s1,0x7
1c00a226:	94aa                	add	s1,s1,a0
1c00a228:	00459513          	slli	a0,a1,0x4
1c00a22c:	8941                	andi	a0,a0,16
1c00a22e:	94aa                	add	s1,s1,a0
1c00a230:	853e                	mv	a0,a5
1c00a232:	ef89                	bnez	a5,1c00a24c <rt_periph_copy+0x40>
1c00a234:	ce2e                	sw	a1,28(sp)
1c00a236:	cc32                	sw	a2,24(sp)
1c00a238:	ca36                	sw	a3,20(sp)
1c00a23a:	c83a                	sw	a4,16(sp)
1c00a23c:	c63e                	sw	a5,12(sp)
1c00a23e:	895ff0ef          	jal	ra,1c009ad2 <__rt_wait_event_prepare_blocking>
1c00a242:	47b2                	lw	a5,12(sp)
1c00a244:	4742                	lw	a4,16(sp)
1c00a246:	46d2                	lw	a3,20(sp)
1c00a248:	4662                	lw	a2,24(sp)
1c00a24a:	45f2                	lw	a1,28(sp)
1c00a24c:	e419                	bnez	s0,1c00a25a <rt_periph_copy+0x4e>
1c00a24e:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa100820>
1c00a252:	04052023          	sw	zero,64(a0)
1c00a256:	04052823          	sw	zero,80(a0)
1c00a25a:	00c42803          	lw	a6,12(s0)
1c00a25e:	c054                	sw	a3,4(s0)
1c00a260:	cc08                	sw	a0,24(s0)
1c00a262:	00f87813          	andi	a6,a6,15
1c00a266:	4891                	li	a7,4
1c00a268:	01076713          	ori	a4,a4,16
1c00a26c:	0708ec63          	bltu	a7,a6,1c00a2e4 <rt_periph_copy+0xd8>
1c00a270:	04000893          	li	a7,64
1c00a274:	0596                	slli	a1,a1,0x5
1c00a276:	98ae                	add	a7,a7,a1
1c00a278:	0008a303          	lw	t1,0(a7)
1c00a27c:	00042a23          	sw	zero,20(s0)
1c00a280:	04000813          	li	a6,64
1c00a284:	02031663          	bnez	t1,1c00a2b0 <rt_periph_copy+0xa4>
1c00a288:	0088a023          	sw	s0,0(a7)
1c00a28c:	00b808b3          	add	a7,a6,a1
1c00a290:	0088a303          	lw	t1,8(a7)
1c00a294:	0088a223          	sw	s0,4(a7)
1c00a298:	02031163          	bnez	t1,1c00a2ba <rt_periph_copy+0xae>
1c00a29c:	0084a883          	lw	a7,8(s1)
1c00a2a0:	0208f893          	andi	a7,a7,32
1c00a2a4:	00089b63          	bnez	a7,1c00a2ba <rt_periph_copy+0xae>
1c00a2a8:	c090                	sw	a2,0(s1)
1c00a2aa:	c0d4                	sw	a3,4(s1)
1c00a2ac:	c498                	sw	a4,8(s1)
1c00a2ae:	a005                	j	1c00a2ce <rt_periph_copy+0xc2>
1c00a2b0:	0048a883          	lw	a7,4(a7)
1c00a2b4:	0088aa23          	sw	s0,20(a7)
1c00a2b8:	bfd1                	j	1c00a28c <rt_periph_copy+0x80>
1c00a2ba:	00042823          	sw	zero,16(s0)
1c00a2be:	c010                	sw	a2,0(s0)
1c00a2c0:	c054                	sw	a3,4(s0)
1c00a2c2:	c418                	sw	a4,8(s0)
1c00a2c4:	00031563          	bnez	t1,1c00a2ce <rt_periph_copy+0xc2>
1c00a2c8:	982e                	add	a6,a6,a1
1c00a2ca:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a2ce:	e399                	bnez	a5,1c00a2d4 <rt_periph_copy+0xc8>
1c00a2d0:	953ff0ef          	jal	ra,1c009c22 <__rt_wait_event>
1c00a2d4:	30091073          	csrw	mstatus,s2
1c00a2d8:	50b2                	lw	ra,44(sp)
1c00a2da:	5422                	lw	s0,40(sp)
1c00a2dc:	5492                	lw	s1,36(sp)
1c00a2de:	5902                	lw	s2,32(sp)
1c00a2e0:	6145                	addi	sp,sp,48
1c00a2e2:	8082                	ret
1c00a2e4:	4899                	li	a7,6
1c00a2e6:	ff1814e3          	bne	a6,a7,1c00a2ce <rt_periph_copy+0xc2>
1c00a2ea:	04000893          	li	a7,64
1c00a2ee:	0596                	slli	a1,a1,0x5
1c00a2f0:	98ae                	add	a7,a7,a1
1c00a2f2:	0008a303          	lw	t1,0(a7)
1c00a2f6:	00042a23          	sw	zero,20(s0)
1c00a2fa:	04000813          	li	a6,64
1c00a2fe:	00031f63          	bnez	t1,1c00a31c <rt_periph_copy+0x110>
1c00a302:	0088a023          	sw	s0,0(a7)
1c00a306:	95c2                	add	a1,a1,a6
1c00a308:	c1c0                	sw	s0,4(a1)
1c00a30a:	00031e63          	bnez	t1,1c00a326 <rt_periph_copy+0x11a>
1c00a30e:	02442803          	lw	a6,36(s0)
1c00a312:	1a1025b7          	lui	a1,0x1a102
1c00a316:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa10090c>
1c00a31a:	b779                	j	1c00a2a8 <rt_periph_copy+0x9c>
1c00a31c:	0048a883          	lw	a7,4(a7)
1c00a320:	0088aa23          	sw	s0,20(a7)
1c00a324:	b7cd                	j	1c00a306 <rt_periph_copy+0xfa>
1c00a326:	c418                	sw	a4,8(s0)
1c00a328:	4598                	lw	a4,8(a1)
1c00a32a:	c010                	sw	a2,0(s0)
1c00a32c:	c054                	sw	a3,4(s0)
1c00a32e:	00042823          	sw	zero,16(s0)
1c00a332:	ff51                	bnez	a4,1c00a2ce <rt_periph_copy+0xc2>
1c00a334:	c580                	sw	s0,8(a1)
1c00a336:	bf61                	j	1c00a2ce <rt_periph_copy+0xc2>

1c00a338 <__rt_periph_init>:
1c00a338:	1c0085b7          	lui	a1,0x1c008
1c00a33c:	04000693          	li	a3,64
1c00a340:	4601                	li	a2,0
1c00a342:	04000793          	li	a5,64
1c00a346:	1a1028b7          	lui	a7,0x1a102
1c00a34a:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a34e:	4841                	li	a6,16
1c00a350:	40165713          	srai	a4,a2,0x1
1c00a354:	00461513          	slli	a0,a2,0x4
1c00a358:	071e                	slli	a4,a4,0x7
1c00a35a:	9746                	add	a4,a4,a7
1c00a35c:	8941                	andi	a0,a0,16
1c00a35e:	972a                	add	a4,a4,a0
1c00a360:	0006a023          	sw	zero,0(a3)
1c00a364:	0006a423          	sw	zero,8(a3)
1c00a368:	c6d8                	sw	a4,12(a3)
1c00a36a:	cecc                	sw	a1,28(a3)
1c00a36c:	0605                	addi	a2,a2,1
1c00a36e:	02068693          	addi	a3,a3,32
1c00a372:	fd061fe3          	bne	a2,a6,1c00a350 <__rt_periph_init+0x18>
1c00a376:	1c008737          	lui	a4,0x1c008
1c00a37a:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a37e:	2007a023          	sw	zero,512(a5)
1c00a382:	20e7a423          	sw	a4,520(a5)
1c00a386:	20e7a623          	sw	a4,524(a5)
1c00a38a:	20e7a823          	sw	a4,528(a5)
1c00a38e:	20e7aa23          	sw	a4,532(a5)
1c00a392:	20e7ac23          	sw	a4,536(a5)
1c00a396:	20e7ae23          	sw	a4,540(a5)
1c00a39a:	22e7a023          	sw	a4,544(a5)
1c00a39e:	22e7a223          	sw	a4,548(a5)
1c00a3a2:	2007a223          	sw	zero,516(a5)
1c00a3a6:	8082                	ret

1c00a3a8 <__rt_i2c_init>:
1c00a3a8:	1c0107b7          	lui	a5,0x1c010
1c00a3ac:	16878793          	addi	a5,a5,360 # 1c010168 <__cluster_text_end>
1c00a3b0:	00078223          	sb	zero,4(a5)
1c00a3b4:	00078a23          	sb	zero,20(a5)
1c00a3b8:	8082                	ret

1c00a3ba <__rt_hyper_init>:
1c00a3ba:	1c001737          	lui	a4,0x1c001
1c00a3be:	26800793          	li	a5,616
1c00a3c2:	1a072423          	sw	zero,424(a4) # 1c0011a8 <__pi_hyper_cluster_reqs_first>
1c00a3c6:	577d                	li	a4,-1
1c00a3c8:	0007aa23          	sw	zero,20(a5)
1c00a3cc:	0207a823          	sw	zero,48(a5)
1c00a3d0:	cf98                	sw	a4,24(a5)
1c00a3d2:	8082                	ret

1c00a3d4 <__rt_spim_init>:
1c00a3d4:	1c0017b7          	lui	a5,0x1c001
1c00a3d8:	1a07a623          	sw	zero,428(a5) # 1c0011ac <__rt_spim_open_count>
1c00a3dc:	8082                	ret

1c00a3de <rt_is_fc>:
1c00a3de:	f1402573          	csrr	a0,mhartid
1c00a3e2:	8515                	srai	a0,a0,0x5
1c00a3e4:	03f57513          	andi	a0,a0,63
1c00a3e8:	1505                	addi	a0,a0,-31
1c00a3ea:	00153513          	seqz	a0,a0
1c00a3ee:	8082                	ret

1c00a3f0 <__rt_io_end_of_flush>:
1c00a3f0:	1c0017b7          	lui	a5,0x1c001
1c00a3f4:	1a07aa23          	sw	zero,436(a5) # 1c0011b4 <__rt_io_pending_flush>
1c00a3f8:	00052c23          	sw	zero,24(a0)
1c00a3fc:	8082                	ret

1c00a3fe <__rt_io_uart_wait_req>:
1c00a3fe:	1141                	addi	sp,sp,-16
1c00a400:	c226                	sw	s1,4(sp)
1c00a402:	84aa                	mv	s1,a0
1c00a404:	c606                	sw	ra,12(sp)
1c00a406:	c422                	sw	s0,8(sp)
1c00a408:	c04a                	sw	s2,0(sp)
1c00a40a:	30047973          	csrrci	s2,mstatus,8
1c00a40e:	1c001437          	lui	s0,0x1c001
1c00a412:	1b040413          	addi	s0,s0,432 # 1c0011b0 <__rt_io_event_current>
1c00a416:	4008                	lw	a0,0(s0)
1c00a418:	c509                	beqz	a0,1c00a422 <__rt_io_uart_wait_req+0x24>
1c00a41a:	833ff0ef          	jal	ra,1c009c4c <rt_event_wait>
1c00a41e:	00042023          	sw	zero,0(s0)
1c00a422:	4785                	li	a5,1
1c00a424:	08f48623          	sb	a5,140(s1)
1c00a428:	08d4c783          	lbu	a5,141(s1)
1c00a42c:	00201737          	lui	a4,0x201
1c00a430:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c00a434:	04078793          	addi	a5,a5,64
1c00a438:	07da                	slli	a5,a5,0x16
1c00a43a:	97ba                	add	a5,a5,a4
1c00a43c:	0007a023          	sw	zero,0(a5)
1c00a440:	30091073          	csrw	mstatus,s2
1c00a444:	40b2                	lw	ra,12(sp)
1c00a446:	4422                	lw	s0,8(sp)
1c00a448:	4492                	lw	s1,4(sp)
1c00a44a:	4902                	lw	s2,0(sp)
1c00a44c:	0141                	addi	sp,sp,16
1c00a44e:	8082                	ret

1c00a450 <__rt_io_start>:
1c00a450:	1101                	addi	sp,sp,-32
1c00a452:	0028                	addi	a0,sp,8
1c00a454:	ce06                	sw	ra,28(sp)
1c00a456:	cc22                	sw	s0,24(sp)
1c00a458:	7e1000ef          	jal	ra,1c00b438 <rt_uart_conf_init>
1c00a45c:	4585                	li	a1,1
1c00a45e:	4501                	li	a0,0
1c00a460:	e8aff0ef          	jal	ra,1c009aea <rt_event_alloc>
1c00a464:	547d                	li	s0,-1
1c00a466:	ed1d                	bnez	a0,1c00a4a4 <__rt_io_start+0x54>
1c00a468:	1c0017b7          	lui	a5,0x1c001
1c00a46c:	0b07a783          	lw	a5,176(a5) # 1c0010b0 <__rt_iodev_uart_baudrate>
1c00a470:	842a                	mv	s0,a0
1c00a472:	1c001537          	lui	a0,0x1c001
1c00a476:	e3ff6597          	auipc	a1,0xe3ff6
1c00a47a:	bb258593          	addi	a1,a1,-1102 # 28 <__rt_sched>
1c00a47e:	0fc50513          	addi	a0,a0,252 # 1c0010fc <__rt_io_event>
1c00a482:	c43e                	sw	a5,8(sp)
1c00a484:	e3cff0ef          	jal	ra,1c009ac0 <__rt_event_init>
1c00a488:	1c0017b7          	lui	a5,0x1c001
1c00a48c:	1c07a503          	lw	a0,448(a5) # 1c0011c0 <__rt_iodev_uart_channel>
1c00a490:	4681                	li	a3,0
1c00a492:	4601                	li	a2,0
1c00a494:	002c                	addi	a1,sp,8
1c00a496:	050d                	addi	a0,a0,3
1c00a498:	7b1000ef          	jal	ra,1c00b448 <__rt_uart_open>
1c00a49c:	1c0017b7          	lui	a5,0x1c001
1c00a4a0:	1aa7ac23          	sw	a0,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a4a4:	8522                	mv	a0,s0
1c00a4a6:	40f2                	lw	ra,28(sp)
1c00a4a8:	4462                	lw	s0,24(sp)
1c00a4aa:	6105                	addi	sp,sp,32
1c00a4ac:	8082                	ret

1c00a4ae <rt_event_execute.isra.2.constprop.11>:
1c00a4ae:	1141                	addi	sp,sp,-16
1c00a4b0:	c606                	sw	ra,12(sp)
1c00a4b2:	c422                	sw	s0,8(sp)
1c00a4b4:	30047473          	csrrci	s0,mstatus,8
1c00a4b8:	4585                	li	a1,1
1c00a4ba:	e3ff6517          	auipc	a0,0xe3ff6
1c00a4be:	b6e50513          	addi	a0,a0,-1170 # 28 <__rt_sched>
1c00a4c2:	f00ff0ef          	jal	ra,1c009bc2 <__rt_event_execute>
1c00a4c6:	30041073          	csrw	mstatus,s0
1c00a4ca:	40b2                	lw	ra,12(sp)
1c00a4cc:	4422                	lw	s0,8(sp)
1c00a4ce:	0141                	addi	sp,sp,16
1c00a4d0:	8082                	ret

1c00a4d2 <__rt_io_lock>:
1c00a4d2:	1c0017b7          	lui	a5,0x1c001
1c00a4d6:	ffc7a783          	lw	a5,-4(a5) # 1c000ffc <__hal_debug_struct+0x10>
1c00a4da:	c791                	beqz	a5,1c00a4e6 <__rt_io_lock+0x14>
1c00a4dc:	1c0017b7          	lui	a5,0x1c001
1c00a4e0:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a4e4:	c3a1                	beqz	a5,1c00a524 <__rt_io_lock+0x52>
1c00a4e6:	7171                	addi	sp,sp,-176
1c00a4e8:	d706                	sw	ra,172(sp)
1c00a4ea:	3dd5                	jal	1c00a3de <rt_is_fc>
1c00a4ec:	1c0017b7          	lui	a5,0x1c001
1c00a4f0:	c901                	beqz	a0,1c00a500 <__rt_io_lock+0x2e>
1c00a4f2:	fcc78513          	addi	a0,a5,-52 # 1c000fcc <__rt_io_fc_lock>
1c00a4f6:	9b8ff0ef          	jal	ra,1c0096ae <__rt_fc_lock>
1c00a4fa:	50ba                	lw	ra,172(sp)
1c00a4fc:	614d                	addi	sp,sp,176
1c00a4fe:	8082                	ret
1c00a500:	002c                	addi	a1,sp,8
1c00a502:	fcc78513          	addi	a0,a5,-52
1c00a506:	a1aff0ef          	jal	ra,1c009720 <__rt_fc_cluster_lock>
1c00a50a:	4689                	li	a3,2
1c00a50c:	00204737          	lui	a4,0x204
1c00a510:	09c14783          	lbu	a5,156(sp)
1c00a514:	0ff7f793          	andi	a5,a5,255
1c00a518:	f3ed                	bnez	a5,1c00a4fa <__rt_io_lock+0x28>
1c00a51a:	c714                	sw	a3,8(a4)
1c00a51c:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a520:	c354                	sw	a3,4(a4)
1c00a522:	b7fd                	j	1c00a510 <__rt_io_lock+0x3e>
1c00a524:	8082                	ret

1c00a526 <__rt_io_unlock>:
1c00a526:	1c0017b7          	lui	a5,0x1c001
1c00a52a:	ffc7a783          	lw	a5,-4(a5) # 1c000ffc <__hal_debug_struct+0x10>
1c00a52e:	c791                	beqz	a5,1c00a53a <__rt_io_unlock+0x14>
1c00a530:	1c0017b7          	lui	a5,0x1c001
1c00a534:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a538:	c3a1                	beqz	a5,1c00a578 <__rt_io_unlock+0x52>
1c00a53a:	7171                	addi	sp,sp,-176
1c00a53c:	d706                	sw	ra,172(sp)
1c00a53e:	3545                	jal	1c00a3de <rt_is_fc>
1c00a540:	1c0017b7          	lui	a5,0x1c001
1c00a544:	c901                	beqz	a0,1c00a554 <__rt_io_unlock+0x2e>
1c00a546:	fcc78513          	addi	a0,a5,-52 # 1c000fcc <__rt_io_fc_lock>
1c00a54a:	9a0ff0ef          	jal	ra,1c0096ea <__rt_fc_unlock>
1c00a54e:	50ba                	lw	ra,172(sp)
1c00a550:	614d                	addi	sp,sp,176
1c00a552:	8082                	ret
1c00a554:	002c                	addi	a1,sp,8
1c00a556:	fcc78513          	addi	a0,a5,-52
1c00a55a:	9feff0ef          	jal	ra,1c009758 <__rt_fc_cluster_unlock>
1c00a55e:	4689                	li	a3,2
1c00a560:	00204737          	lui	a4,0x204
1c00a564:	09c14783          	lbu	a5,156(sp)
1c00a568:	0ff7f793          	andi	a5,a5,255
1c00a56c:	f3ed                	bnez	a5,1c00a54e <__rt_io_unlock+0x28>
1c00a56e:	c714                	sw	a3,8(a4)
1c00a570:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a574:	c354                	sw	a3,4(a4)
1c00a576:	b7fd                	j	1c00a564 <__rt_io_unlock+0x3e>
1c00a578:	8082                	ret

1c00a57a <__rt_io_uart_wait_pending>:
1c00a57a:	7135                	addi	sp,sp,-160
1c00a57c:	cd22                	sw	s0,152(sp)
1c00a57e:	cf06                	sw	ra,156(sp)
1c00a580:	cb26                	sw	s1,148(sp)
1c00a582:	1c001437          	lui	s0,0x1c001
1c00a586:	1b442783          	lw	a5,436(s0) # 1c0011b4 <__rt_io_pending_flush>
1c00a58a:	e39d                	bnez	a5,1c00a5b0 <__rt_io_uart_wait_pending+0x36>
1c00a58c:	1c001437          	lui	s0,0x1c001
1c00a590:	1b040413          	addi	s0,s0,432 # 1c0011b0 <__rt_io_event_current>
1c00a594:	4004                	lw	s1,0(s0)
1c00a596:	c881                	beqz	s1,1c00a5a6 <__rt_io_uart_wait_pending+0x2c>
1c00a598:	3599                	jal	1c00a3de <rt_is_fc>
1c00a59a:	cd19                	beqz	a0,1c00a5b8 <__rt_io_uart_wait_pending+0x3e>
1c00a59c:	8526                	mv	a0,s1
1c00a59e:	eaeff0ef          	jal	ra,1c009c4c <rt_event_wait>
1c00a5a2:	00042023          	sw	zero,0(s0)
1c00a5a6:	40fa                	lw	ra,156(sp)
1c00a5a8:	446a                	lw	s0,152(sp)
1c00a5aa:	44da                	lw	s1,148(sp)
1c00a5ac:	610d                	addi	sp,sp,160
1c00a5ae:	8082                	ret
1c00a5b0:	3f9d                	jal	1c00a526 <__rt_io_unlock>
1c00a5b2:	3df5                	jal	1c00a4ae <rt_event_execute.isra.2.constprop.11>
1c00a5b4:	3f39                	jal	1c00a4d2 <__rt_io_lock>
1c00a5b6:	bfc1                	j	1c00a586 <__rt_io_uart_wait_pending+0xc>
1c00a5b8:	f14027f3          	csrr	a5,mhartid
1c00a5bc:	8795                	srai	a5,a5,0x5
1c00a5be:	03f7f793          	andi	a5,a5,63
1c00a5c2:	08f106a3          	sb	a5,141(sp)
1c00a5c6:	1c00a7b7          	lui	a5,0x1c00a
1c00a5ca:	3fe78793          	addi	a5,a5,1022 # 1c00a3fe <__rt_io_uart_wait_req>
1c00a5ce:	c03e                	sw	a5,0(sp)
1c00a5d0:	00010793          	mv	a5,sp
1c00a5d4:	4705                	li	a4,1
1c00a5d6:	c23e                	sw	a5,4(sp)
1c00a5d8:	850a                	mv	a0,sp
1c00a5da:	1c0017b7          	lui	a5,0x1c001
1c00a5de:	10e7ae23          	sw	a4,284(a5) # 1c00111c <__rt_io_event+0x20>
1c00a5e2:	08010623          	sb	zero,140(sp)
1c00a5e6:	d002                	sw	zero,32(sp)
1c00a5e8:	d202                	sw	zero,36(sp)
1c00a5ea:	a15fe0ef          	jal	ra,1c008ffe <__rt_cluster_push_fc_event>
1c00a5ee:	4689                	li	a3,2
1c00a5f0:	00204737          	lui	a4,0x204
1c00a5f4:	08c14783          	lbu	a5,140(sp)
1c00a5f8:	0ff7f793          	andi	a5,a5,255
1c00a5fc:	f7cd                	bnez	a5,1c00a5a6 <__rt_io_uart_wait_pending+0x2c>
1c00a5fe:	c714                	sw	a3,8(a4)
1c00a600:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a604:	c354                	sw	a3,4(a4)
1c00a606:	b7fd                	j	1c00a5f4 <__rt_io_uart_wait_pending+0x7a>

1c00a608 <__rt_io_stop>:
1c00a608:	1141                	addi	sp,sp,-16
1c00a60a:	c422                	sw	s0,8(sp)
1c00a60c:	1c001437          	lui	s0,0x1c001
1c00a610:	c606                	sw	ra,12(sp)
1c00a612:	1b840413          	addi	s0,s0,440 # 1c0011b8 <_rt_io_uart>
1c00a616:	3795                	jal	1c00a57a <__rt_io_uart_wait_pending>
1c00a618:	4008                	lw	a0,0(s0)
1c00a61a:	4581                	li	a1,0
1c00a61c:	6b5000ef          	jal	ra,1c00b4d0 <rt_uart_close>
1c00a620:	40b2                	lw	ra,12(sp)
1c00a622:	00042023          	sw	zero,0(s0)
1c00a626:	4422                	lw	s0,8(sp)
1c00a628:	4501                	li	a0,0
1c00a62a:	0141                	addi	sp,sp,16
1c00a62c:	8082                	ret

1c00a62e <__rt_io_uart_flush.constprop.10>:
1c00a62e:	7131                	addi	sp,sp,-192
1c00a630:	dd22                	sw	s0,184(sp)
1c00a632:	df06                	sw	ra,188(sp)
1c00a634:	db26                	sw	s1,180(sp)
1c00a636:	d94a                	sw	s2,176(sp)
1c00a638:	d74e                	sw	s3,172(sp)
1c00a63a:	d552                	sw	s4,168(sp)
1c00a63c:	d356                	sw	s5,164(sp)
1c00a63e:	1c001437          	lui	s0,0x1c001
1c00a642:	1b442783          	lw	a5,436(s0) # 1c0011b4 <__rt_io_pending_flush>
1c00a646:	1b440a13          	addi	s4,s0,436
1c00a64a:	e7bd                	bnez	a5,1c00a6b8 <__rt_io_uart_flush.constprop.10+0x8a>
1c00a64c:	1c0014b7          	lui	s1,0x1c001
1c00a650:	fec48793          	addi	a5,s1,-20 # 1c000fec <__hal_debug_struct>
1c00a654:	4f80                	lw	s0,24(a5)
1c00a656:	fec48a93          	addi	s5,s1,-20
1c00a65a:	c431                	beqz	s0,1c00a6a6 <__rt_io_uart_flush.constprop.10+0x78>
1c00a65c:	3349                	jal	1c00a3de <rt_is_fc>
1c00a65e:	1c0017b7          	lui	a5,0x1c001
1c00a662:	1b87a903          	lw	s2,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a666:	1c0019b7          	lui	s3,0x1c001
1c00a66a:	cd29                	beqz	a0,1c00a6c4 <__rt_io_uart_flush.constprop.10+0x96>
1c00a66c:	1c00a5b7          	lui	a1,0x1c00a
1c00a670:	4785                	li	a5,1
1c00a672:	fec48613          	addi	a2,s1,-20
1c00a676:	3f058593          	addi	a1,a1,1008 # 1c00a3f0 <__rt_io_end_of_flush>
1c00a67a:	4501                	li	a0,0
1c00a67c:	00fa2023          	sw	a5,0(s4)
1c00a680:	ce2ff0ef          	jal	ra,1c009b62 <rt_event_get>
1c00a684:	00492583          	lw	a1,4(s2)
1c00a688:	87aa                	mv	a5,a0
1c00a68a:	4701                	li	a4,0
1c00a68c:	0586                	slli	a1,a1,0x1
1c00a68e:	86a2                	mv	a3,s0
1c00a690:	00898613          	addi	a2,s3,8 # 1c001008 <__hal_debug_struct+0x1c>
1c00a694:	0585                	addi	a1,a1,1
1c00a696:	4501                	li	a0,0
1c00a698:	b75ff0ef          	jal	ra,1c00a20c <rt_periph_copy>
1c00a69c:	3569                	jal	1c00a526 <__rt_io_unlock>
1c00a69e:	000a2783          	lw	a5,0(s4)
1c00a6a2:	ef99                	bnez	a5,1c00a6c0 <__rt_io_uart_flush.constprop.10+0x92>
1c00a6a4:	353d                	jal	1c00a4d2 <__rt_io_lock>
1c00a6a6:	50fa                	lw	ra,188(sp)
1c00a6a8:	546a                	lw	s0,184(sp)
1c00a6aa:	54da                	lw	s1,180(sp)
1c00a6ac:	594a                	lw	s2,176(sp)
1c00a6ae:	59ba                	lw	s3,172(sp)
1c00a6b0:	5a2a                	lw	s4,168(sp)
1c00a6b2:	5a9a                	lw	s5,164(sp)
1c00a6b4:	6129                	addi	sp,sp,192
1c00a6b6:	8082                	ret
1c00a6b8:	35bd                	jal	1c00a526 <__rt_io_unlock>
1c00a6ba:	3bd5                	jal	1c00a4ae <rt_event_execute.isra.2.constprop.11>
1c00a6bc:	3d19                	jal	1c00a4d2 <__rt_io_lock>
1c00a6be:	b751                	j	1c00a642 <__rt_io_uart_flush.constprop.10+0x14>
1c00a6c0:	33fd                	jal	1c00a4ae <rt_event_execute.isra.2.constprop.11>
1c00a6c2:	bff1                	j	1c00a69e <__rt_io_uart_flush.constprop.10+0x70>
1c00a6c4:	0054                	addi	a3,sp,4
1c00a6c6:	8622                	mv	a2,s0
1c00a6c8:	00898593          	addi	a1,s3,8
1c00a6cc:	854a                	mv	a0,s2
1c00a6ce:	64d000ef          	jal	ra,1c00b51a <rt_uart_cluster_write>
1c00a6d2:	4689                	li	a3,2
1c00a6d4:	00204737          	lui	a4,0x204
1c00a6d8:	09c14783          	lbu	a5,156(sp)
1c00a6dc:	0ff7f793          	andi	a5,a5,255
1c00a6e0:	c781                	beqz	a5,1c00a6e8 <__rt_io_uart_flush.constprop.10+0xba>
1c00a6e2:	000aac23          	sw	zero,24(s5)
1c00a6e6:	b7c1                	j	1c00a6a6 <__rt_io_uart_flush.constprop.10+0x78>
1c00a6e8:	c714                	sw	a3,8(a4)
1c00a6ea:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f5850>
1c00a6ee:	c354                	sw	a3,4(a4)
1c00a6f0:	b7e5                	j	1c00a6d8 <__rt_io_uart_flush.constprop.10+0xaa>

1c00a6f2 <memset>:
1c00a6f2:	962a                	add	a2,a2,a0
1c00a6f4:	87aa                	mv	a5,a0
1c00a6f6:	00c79363          	bne	a5,a2,1c00a6fc <memset+0xa>
1c00a6fa:	8082                	ret
1c00a6fc:	0785                	addi	a5,a5,1
1c00a6fe:	feb78fa3          	sb	a1,-1(a5)
1c00a702:	bfd5                	j	1c00a6f6 <memset+0x4>

1c00a704 <memcpy>:
1c00a704:	962a                	add	a2,a2,a0
1c00a706:	87aa                	mv	a5,a0
1c00a708:	00c79363          	bne	a5,a2,1c00a70e <memcpy+0xa>
1c00a70c:	8082                	ret
1c00a70e:	0585                	addi	a1,a1,1
1c00a710:	fff5c703          	lbu	a4,-1(a1)
1c00a714:	0785                	addi	a5,a5,1
1c00a716:	fee78fa3          	sb	a4,-1(a5)
1c00a71a:	b7fd                	j	1c00a708 <memcpy+0x4>

1c00a71c <memmove>:
1c00a71c:	40b507b3          	sub	a5,a0,a1
1c00a720:	00c7e763          	bltu	a5,a2,1c00a72e <memmove+0x12>
1c00a724:	962e                	add	a2,a2,a1
1c00a726:	87aa                	mv	a5,a0
1c00a728:	00c59e63          	bne	a1,a2,1c00a744 <memmove+0x28>
1c00a72c:	8082                	ret
1c00a72e:	167d                	addi	a2,a2,-1
1c00a730:	00c587b3          	add	a5,a1,a2
1c00a734:	0007c703          	lbu	a4,0(a5)
1c00a738:	00c507b3          	add	a5,a0,a2
1c00a73c:	00e78023          	sb	a4,0(a5)
1c00a740:	f67d                	bnez	a2,1c00a72e <memmove+0x12>
1c00a742:	8082                	ret
1c00a744:	0005c703          	lbu	a4,0(a1)
1c00a748:	0785                	addi	a5,a5,1
1c00a74a:	0585                	addi	a1,a1,1
1c00a74c:	fee78fa3          	sb	a4,-1(a5)
1c00a750:	bfe1                	j	1c00a728 <memmove+0xc>

1c00a752 <strchr>:
1c00a752:	0ff5f593          	andi	a1,a1,255
1c00a756:	00054783          	lbu	a5,0(a0)
1c00a75a:	00b78563          	beq	a5,a1,1c00a764 <strchr+0x12>
1c00a75e:	e781                	bnez	a5,1c00a766 <strchr+0x14>
1c00a760:	c191                	beqz	a1,1c00a764 <strchr+0x12>
1c00a762:	4501                	li	a0,0
1c00a764:	8082                	ret
1c00a766:	0505                	addi	a0,a0,1
1c00a768:	b7fd                	j	1c00a756 <strchr+0x4>

1c00a76a <__rt_putc_debug_bridge>:
1c00a76a:	1141                	addi	sp,sp,-16
1c00a76c:	c422                	sw	s0,8(sp)
1c00a76e:	1c001437          	lui	s0,0x1c001
1c00a772:	c226                	sw	s1,4(sp)
1c00a774:	c606                	sw	ra,12(sp)
1c00a776:	84aa                	mv	s1,a0
1c00a778:	fec40413          	addi	s0,s0,-20 # 1c000fec <__hal_debug_struct>
1c00a77c:	485c                	lw	a5,20(s0)
1c00a77e:	c791                	beqz	a5,1c00a78a <__rt_putc_debug_bridge+0x20>
1c00a780:	06400513          	li	a0,100
1c00a784:	907ff0ef          	jal	ra,1c00a08a <rt_time_wait_us>
1c00a788:	bfd5                	j	1c00a77c <__rt_putc_debug_bridge+0x12>
1c00a78a:	4c1c                	lw	a5,24(s0)
1c00a78c:	00178713          	addi	a4,a5,1
1c00a790:	97a2                	add	a5,a5,s0
1c00a792:	00978e23          	sb	s1,28(a5)
1c00a796:	cc18                	sw	a4,24(s0)
1c00a798:	4c14                	lw	a3,24(s0)
1c00a79a:	08000793          	li	a5,128
1c00a79e:	00f68563          	beq	a3,a5,1c00a7a8 <__rt_putc_debug_bridge+0x3e>
1c00a7a2:	47a9                	li	a5,10
1c00a7a4:	00f49663          	bne	s1,a5,1c00a7b0 <__rt_putc_debug_bridge+0x46>
1c00a7a8:	c701                	beqz	a4,1c00a7b0 <__rt_putc_debug_bridge+0x46>
1c00a7aa:	c858                	sw	a4,20(s0)
1c00a7ac:	00042c23          	sw	zero,24(s0)
1c00a7b0:	4c1c                	lw	a5,24(s0)
1c00a7b2:	e799                	bnez	a5,1c00a7c0 <__rt_putc_debug_bridge+0x56>
1c00a7b4:	4422                	lw	s0,8(sp)
1c00a7b6:	40b2                	lw	ra,12(sp)
1c00a7b8:	4492                	lw	s1,4(sp)
1c00a7ba:	0141                	addi	sp,sp,16
1c00a7bc:	946ff06f          	j	1c009902 <__rt_bridge_printf_flush>
1c00a7c0:	40b2                	lw	ra,12(sp)
1c00a7c2:	4422                	lw	s0,8(sp)
1c00a7c4:	4492                	lw	s1,4(sp)
1c00a7c6:	0141                	addi	sp,sp,16
1c00a7c8:	8082                	ret

1c00a7ca <__rt_putc_uart>:
1c00a7ca:	1101                	addi	sp,sp,-32
1c00a7cc:	c62a                	sw	a0,12(sp)
1c00a7ce:	ce06                	sw	ra,28(sp)
1c00a7d0:	336d                	jal	1c00a57a <__rt_io_uart_wait_pending>
1c00a7d2:	1c0017b7          	lui	a5,0x1c001
1c00a7d6:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c00a7da:	4f94                	lw	a3,24(a5)
1c00a7dc:	4532                	lw	a0,12(sp)
1c00a7de:	00168713          	addi	a4,a3,1
1c00a7e2:	cf98                	sw	a4,24(a5)
1c00a7e4:	97b6                	add	a5,a5,a3
1c00a7e6:	00a78e23          	sb	a0,28(a5)
1c00a7ea:	08000793          	li	a5,128
1c00a7ee:	00f70563          	beq	a4,a5,1c00a7f8 <__rt_putc_uart+0x2e>
1c00a7f2:	47a9                	li	a5,10
1c00a7f4:	00f51563          	bne	a0,a5,1c00a7fe <__rt_putc_uart+0x34>
1c00a7f8:	40f2                	lw	ra,28(sp)
1c00a7fa:	6105                	addi	sp,sp,32
1c00a7fc:	bd0d                	j	1c00a62e <__rt_io_uart_flush.constprop.10>
1c00a7fe:	40f2                	lw	ra,28(sp)
1c00a800:	6105                	addi	sp,sp,32
1c00a802:	8082                	ret

1c00a804 <tfp_putc.isra.8>:
1c00a804:	1c0017b7          	lui	a5,0x1c001
1c00a808:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a80c:	c391                	beqz	a5,1c00a810 <tfp_putc.isra.8+0xc>
1c00a80e:	bf75                	j	1c00a7ca <__rt_putc_uart>
1c00a810:	1c0017b7          	lui	a5,0x1c001
1c00a814:	ffc7a783          	lw	a5,-4(a5) # 1c000ffc <__hal_debug_struct+0x10>
1c00a818:	c395                	beqz	a5,1c00a83c <tfp_putc.isra.8+0x38>
1c00a81a:	6689                	lui	a3,0x2
1c00a81c:	f14027f3          	csrr	a5,mhartid
1c00a820:	f8068693          	addi	a3,a3,-128 # 1f80 <_l1_preload_size+0x770>
1c00a824:	00379713          	slli	a4,a5,0x3
1c00a828:	078a                	slli	a5,a5,0x2
1c00a82a:	0ff77713          	andi	a4,a4,255
1c00a82e:	8ff5                	and	a5,a5,a3
1c00a830:	97ba                	add	a5,a5,a4
1c00a832:	1a10f737          	lui	a4,0x1a10f
1c00a836:	97ba                	add	a5,a5,a4
1c00a838:	c388                	sw	a0,0(a5)
1c00a83a:	8082                	ret
1c00a83c:	b73d                	j	1c00a76a <__rt_putc_debug_bridge>

1c00a83e <puts>:
1c00a83e:	1141                	addi	sp,sp,-16
1c00a840:	c422                	sw	s0,8(sp)
1c00a842:	c606                	sw	ra,12(sp)
1c00a844:	842a                	mv	s0,a0
1c00a846:	3171                	jal	1c00a4d2 <__rt_io_lock>
1c00a848:	00044503          	lbu	a0,0(s0)
1c00a84c:	c501                	beqz	a0,1c00a854 <puts+0x16>
1c00a84e:	3f5d                	jal	1c00a804 <tfp_putc.isra.8>
1c00a850:	0405                	addi	s0,s0,1
1c00a852:	bfdd                	j	1c00a848 <puts+0xa>
1c00a854:	4529                	li	a0,10
1c00a856:	377d                	jal	1c00a804 <tfp_putc.isra.8>
1c00a858:	31f9                	jal	1c00a526 <__rt_io_unlock>
1c00a85a:	40b2                	lw	ra,12(sp)
1c00a85c:	4422                	lw	s0,8(sp)
1c00a85e:	4501                	li	a0,0
1c00a860:	0141                	addi	sp,sp,16
1c00a862:	8082                	ret

1c00a864 <fputc_locked>:
1c00a864:	1141                	addi	sp,sp,-16
1c00a866:	c422                	sw	s0,8(sp)
1c00a868:	842a                	mv	s0,a0
1c00a86a:	0ff57513          	andi	a0,a0,255
1c00a86e:	c606                	sw	ra,12(sp)
1c00a870:	3f51                	jal	1c00a804 <tfp_putc.isra.8>
1c00a872:	8522                	mv	a0,s0
1c00a874:	40b2                	lw	ra,12(sp)
1c00a876:	4422                	lw	s0,8(sp)
1c00a878:	0141                	addi	sp,sp,16
1c00a87a:	8082                	ret

1c00a87c <_prf_locked>:
1c00a87c:	1101                	addi	sp,sp,-32
1c00a87e:	ce06                	sw	ra,28(sp)
1c00a880:	c02a                	sw	a0,0(sp)
1c00a882:	c62e                	sw	a1,12(sp)
1c00a884:	c432                	sw	a2,8(sp)
1c00a886:	c236                	sw	a3,4(sp)
1c00a888:	31a9                	jal	1c00a4d2 <__rt_io_lock>
1c00a88a:	4692                	lw	a3,4(sp)
1c00a88c:	4622                	lw	a2,8(sp)
1c00a88e:	45b2                	lw	a1,12(sp)
1c00a890:	4502                	lw	a0,0(sp)
1c00a892:	2ae9                	jal	1c00aa6c <_prf>
1c00a894:	c02a                	sw	a0,0(sp)
1c00a896:	3941                	jal	1c00a526 <__rt_io_unlock>
1c00a898:	40f2                	lw	ra,28(sp)
1c00a89a:	4502                	lw	a0,0(sp)
1c00a89c:	6105                	addi	sp,sp,32
1c00a89e:	8082                	ret

1c00a8a0 <exit>:
1c00a8a0:	1141                	addi	sp,sp,-16
1c00a8a2:	c606                	sw	ra,12(sp)
1c00a8a4:	c422                	sw	s0,8(sp)
1c00a8a6:	842a                	mv	s0,a0
1c00a8a8:	85aff0ef          	jal	ra,1c009902 <__rt_bridge_printf_flush>
1c00a8ac:	80000537          	lui	a0,0x80000
1c00a8b0:	1c0017b7          	lui	a5,0x1c001
1c00a8b4:	8c49                	or	s0,s0,a0
1c00a8b6:	fec78793          	addi	a5,a5,-20 # 1c000fec <__hal_debug_struct>
1c00a8ba:	c7c0                	sw	s0,12(a5)
1c00a8bc:	816ff0ef          	jal	ra,1c0098d2 <__rt_bridge_send_notif>
1c00a8c0:	1a1047b7          	lui	a5,0x1a104
1c00a8c4:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa10288c>
1c00a8c8:	a001                	j	1c00a8c8 <exit+0x28>

1c00a8ca <abort>:
1c00a8ca:	1141                	addi	sp,sp,-16
1c00a8cc:	557d                	li	a0,-1
1c00a8ce:	c606                	sw	ra,12(sp)
1c00a8d0:	3fc1                	jal	1c00a8a0 <exit>

1c00a8d2 <__rt_io_init>:
1c00a8d2:	1c0017b7          	lui	a5,0x1c001
1c00a8d6:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__rt_io_fc_lock>
1c00a8da:	0007a223          	sw	zero,4(a5)
1c00a8de:	0007a023          	sw	zero,0(a5)
1c00a8e2:	0007a623          	sw	zero,12(a5)
1c00a8e6:	1c0017b7          	lui	a5,0x1c001
1c00a8ea:	1a07ac23          	sw	zero,440(a5) # 1c0011b8 <_rt_io_uart>
1c00a8ee:	1c0017b7          	lui	a5,0x1c001
1c00a8f2:	1a07a823          	sw	zero,432(a5) # 1c0011b0 <__rt_io_event_current>
1c00a8f6:	1c0017b7          	lui	a5,0x1c001
1c00a8fa:	1bc7a703          	lw	a4,444(a5) # 1c0011bc <__rt_iodev>
1c00a8fe:	4785                	li	a5,1
1c00a900:	02f71e63          	bne	a4,a5,1c00a93c <__rt_io_init+0x6a>
1c00a904:	1c00a5b7          	lui	a1,0x1c00a
1c00a908:	1141                	addi	sp,sp,-16
1c00a90a:	4601                	li	a2,0
1c00a90c:	45058593          	addi	a1,a1,1104 # 1c00a450 <__rt_io_start>
1c00a910:	4501                	li	a0,0
1c00a912:	c606                	sw	ra,12(sp)
1c00a914:	d07fe0ef          	jal	ra,1c00961a <__rt_cbsys_add>
1c00a918:	1c00a5b7          	lui	a1,0x1c00a
1c00a91c:	60858593          	addi	a1,a1,1544 # 1c00a608 <__rt_io_stop>
1c00a920:	4601                	li	a2,0
1c00a922:	4505                	li	a0,1
1c00a924:	cf7fe0ef          	jal	ra,1c00961a <__rt_cbsys_add>
1c00a928:	40b2                	lw	ra,12(sp)
1c00a92a:	1c0017b7          	lui	a5,0x1c001
1c00a92e:	1a07aa23          	sw	zero,436(a5) # 1c0011b4 <__rt_io_pending_flush>
1c00a932:	4585                	li	a1,1
1c00a934:	4501                	li	a0,0
1c00a936:	0141                	addi	sp,sp,16
1c00a938:	9b2ff06f          	j	1c009aea <rt_event_alloc>
1c00a93c:	8082                	ret

1c00a93e <printf>:
1c00a93e:	7139                	addi	sp,sp,-64
1c00a940:	d432                	sw	a2,40(sp)
1c00a942:	862a                	mv	a2,a0
1c00a944:	1c00b537          	lui	a0,0x1c00b
1c00a948:	d22e                	sw	a1,36(sp)
1c00a94a:	d636                	sw	a3,44(sp)
1c00a94c:	4589                	li	a1,2
1c00a94e:	1054                	addi	a3,sp,36
1c00a950:	86450513          	addi	a0,a0,-1948 # 1c00a864 <fputc_locked>
1c00a954:	ce06                	sw	ra,28(sp)
1c00a956:	d83a                	sw	a4,48(sp)
1c00a958:	da3e                	sw	a5,52(sp)
1c00a95a:	dc42                	sw	a6,56(sp)
1c00a95c:	de46                	sw	a7,60(sp)
1c00a95e:	c636                	sw	a3,12(sp)
1c00a960:	3f31                	jal	1c00a87c <_prf_locked>
1c00a962:	40f2                	lw	ra,28(sp)
1c00a964:	6121                	addi	sp,sp,64
1c00a966:	8082                	ret

1c00a968 <_to_x>:
1c00a968:	872a                	mv	a4,a0
1c00a96a:	87aa                	mv	a5,a0
1c00a96c:	4325                	li	t1,9
1c00a96e:	02c5f8b3          	remu	a7,a1,a2
1c00a972:	02700513          	li	a0,39
1c00a976:	02c5d5b3          	divu	a1,a1,a2
1c00a97a:	0ff8f813          	andi	a6,a7,255
1c00a97e:	01136363          	bltu	t1,a7,1c00a984 <_to_x+0x1c>
1c00a982:	4501                	li	a0,0
1c00a984:	03080813          	addi	a6,a6,48
1c00a988:	0785                	addi	a5,a5,1
1c00a98a:	9542                	add	a0,a0,a6
1c00a98c:	fea78fa3          	sb	a0,-1(a5)
1c00a990:	fdf9                	bnez	a1,1c00a96e <_to_x+0x6>
1c00a992:	03000613          	li	a2,48
1c00a996:	40e78533          	sub	a0,a5,a4
1c00a99a:	00d54863          	blt	a0,a3,1c00a9aa <_to_x+0x42>
1c00a99e:	00078023          	sb	zero,0(a5)
1c00a9a2:	17fd                	addi	a5,a5,-1
1c00a9a4:	00f76763          	bltu	a4,a5,1c00a9b2 <_to_x+0x4a>
1c00a9a8:	8082                	ret
1c00a9aa:	0785                	addi	a5,a5,1
1c00a9ac:	fec78fa3          	sb	a2,-1(a5)
1c00a9b0:	b7dd                	j	1c00a996 <_to_x+0x2e>
1c00a9b2:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10d7ec>
1c00a9b6:	0007c683          	lbu	a3,0(a5)
1c00a9ba:	0705                	addi	a4,a4,1
1c00a9bc:	00c78023          	sb	a2,0(a5)
1c00a9c0:	fed70fa3          	sb	a3,-1(a4)
1c00a9c4:	17fd                	addi	a5,a5,-1
1c00a9c6:	bff9                	j	1c00a9a4 <_to_x+0x3c>

1c00a9c8 <_rlrshift>:
1c00a9c8:	411c                	lw	a5,0(a0)
1c00a9ca:	4154                	lw	a3,4(a0)
1c00a9cc:	0017f713          	andi	a4,a5,1
1c00a9d0:	01f69613          	slli	a2,a3,0x1f
1c00a9d4:	8385                	srli	a5,a5,0x1
1c00a9d6:	8fd1                	or	a5,a5,a2
1c00a9d8:	97ba                	add	a5,a5,a4
1c00a9da:	8285                	srli	a3,a3,0x1
1c00a9dc:	00e7b733          	sltu	a4,a5,a4
1c00a9e0:	9736                	add	a4,a4,a3
1c00a9e2:	c11c                	sw	a5,0(a0)
1c00a9e4:	c158                	sw	a4,4(a0)
1c00a9e6:	8082                	ret

1c00a9e8 <_ldiv5>:
1c00a9e8:	4118                	lw	a4,0(a0)
1c00a9ea:	4154                	lw	a3,4(a0)
1c00a9ec:	4615                	li	a2,5
1c00a9ee:	00270793          	addi	a5,a4,2
1c00a9f2:	00e7b733          	sltu	a4,a5,a4
1c00a9f6:	9736                	add	a4,a4,a3
1c00a9f8:	02c755b3          	divu	a1,a4,a2
1c00a9fc:	02b606b3          	mul	a3,a2,a1
1c00aa00:	8f15                	sub	a4,a4,a3
1c00aa02:	01d71693          	slli	a3,a4,0x1d
1c00aa06:	0037d713          	srli	a4,a5,0x3
1c00aa0a:	8f55                	or	a4,a4,a3
1c00aa0c:	02c75733          	divu	a4,a4,a2
1c00aa10:	01d75693          	srli	a3,a4,0x1d
1c00aa14:	070e                	slli	a4,a4,0x3
1c00aa16:	95b6                	add	a1,a1,a3
1c00aa18:	02e606b3          	mul	a3,a2,a4
1c00aa1c:	8f95                	sub	a5,a5,a3
1c00aa1e:	02c7d7b3          	divu	a5,a5,a2
1c00aa22:	973e                	add	a4,a4,a5
1c00aa24:	00f737b3          	sltu	a5,a4,a5
1c00aa28:	97ae                	add	a5,a5,a1
1c00aa2a:	c118                	sw	a4,0(a0)
1c00aa2c:	c15c                	sw	a5,4(a0)
1c00aa2e:	8082                	ret

1c00aa30 <_get_digit>:
1c00aa30:	419c                	lw	a5,0(a1)
1c00aa32:	03000713          	li	a4,48
1c00aa36:	02f05863          	blez	a5,1c00aa66 <_get_digit+0x36>
1c00aa3a:	17fd                	addi	a5,a5,-1
1c00aa3c:	4114                	lw	a3,0(a0)
1c00aa3e:	c19c                	sw	a5,0(a1)
1c00aa40:	415c                	lw	a5,4(a0)
1c00aa42:	4729                	li	a4,10
1c00aa44:	02d70633          	mul	a2,a4,a3
1c00aa48:	02f707b3          	mul	a5,a4,a5
1c00aa4c:	c110                	sw	a2,0(a0)
1c00aa4e:	02d73733          	mulhu	a4,a4,a3
1c00aa52:	100006b7          	lui	a3,0x10000
1c00aa56:	16fd                	addi	a3,a3,-1
1c00aa58:	97ba                	add	a5,a5,a4
1c00aa5a:	01c7d713          	srli	a4,a5,0x1c
1c00aa5e:	8ff5                	and	a5,a5,a3
1c00aa60:	03070713          	addi	a4,a4,48
1c00aa64:	c15c                	sw	a5,4(a0)
1c00aa66:	0ff77513          	andi	a0,a4,255
1c00aa6a:	8082                	ret

1c00aa6c <_prf>:
1c00aa6c:	714d                	addi	sp,sp,-336
1c00aa6e:	14912223          	sw	s1,324(sp)
1c00aa72:	13312e23          	sw	s3,316(sp)
1c00aa76:	13812423          	sw	s8,296(sp)
1c00aa7a:	14112623          	sw	ra,332(sp)
1c00aa7e:	14812423          	sw	s0,328(sp)
1c00aa82:	15212023          	sw	s2,320(sp)
1c00aa86:	13412c23          	sw	s4,312(sp)
1c00aa8a:	13512a23          	sw	s5,308(sp)
1c00aa8e:	13612823          	sw	s6,304(sp)
1c00aa92:	13712623          	sw	s7,300(sp)
1c00aa96:	13912223          	sw	s9,292(sp)
1c00aa9a:	13a12023          	sw	s10,288(sp)
1c00aa9e:	11b12e23          	sw	s11,284(sp)
1c00aaa2:	cc2a                	sw	a0,24(sp)
1c00aaa4:	ce2e                	sw	a1,28(sp)
1c00aaa6:	84b2                	mv	s1,a2
1c00aaa8:	8c36                	mv	s8,a3
1c00aaaa:	4981                	li	s3,0
1c00aaac:	0004c503          	lbu	a0,0(s1)
1c00aab0:	00148b93          	addi	s7,s1,1
1c00aab4:	cd01                	beqz	a0,1c00aacc <_prf+0x60>
1c00aab6:	02500793          	li	a5,37
1c00aaba:	14f50a63          	beq	a0,a5,1c00ac0e <_prf+0x1a2>
1c00aabe:	45f2                	lw	a1,28(sp)
1c00aac0:	4762                	lw	a4,24(sp)
1c00aac2:	9702                	jalr	a4
1c00aac4:	57fd                	li	a5,-1
1c00aac6:	04f51063          	bne	a0,a5,1c00ab06 <_prf+0x9a>
1c00aaca:	59fd                	li	s3,-1
1c00aacc:	14c12083          	lw	ra,332(sp)
1c00aad0:	14812403          	lw	s0,328(sp)
1c00aad4:	854e                	mv	a0,s3
1c00aad6:	14412483          	lw	s1,324(sp)
1c00aada:	14012903          	lw	s2,320(sp)
1c00aade:	13c12983          	lw	s3,316(sp)
1c00aae2:	13812a03          	lw	s4,312(sp)
1c00aae6:	13412a83          	lw	s5,308(sp)
1c00aaea:	13012b03          	lw	s6,304(sp)
1c00aaee:	12c12b83          	lw	s7,300(sp)
1c00aaf2:	12812c03          	lw	s8,296(sp)
1c00aaf6:	12412c83          	lw	s9,292(sp)
1c00aafa:	12012d03          	lw	s10,288(sp)
1c00aafe:	11c12d83          	lw	s11,284(sp)
1c00ab02:	6171                	addi	sp,sp,336
1c00ab04:	8082                	ret
1c00ab06:	0985                	addi	s3,s3,1
1c00ab08:	8a62                	mv	s4,s8
1c00ab0a:	84de                	mv	s1,s7
1c00ab0c:	8c52                	mv	s8,s4
1c00ab0e:	bf79                	j	1c00aaac <_prf+0x40>
1c00ab10:	0f2a8663          	beq	s5,s2,1c00abfc <_prf+0x190>
1c00ab14:	0d596963          	bltu	s2,s5,1c00abe6 <_prf+0x17a>
1c00ab18:	fa0a8ae3          	beqz	s5,1c00aacc <_prf+0x60>
1c00ab1c:	0dba8e63          	beq	s5,s11,1c00abf8 <_prf+0x18c>
1c00ab20:	8ba6                	mv	s7,s1
1c00ab22:	001b8493          	addi	s1,s7,1
1c00ab26:	fff4ca83          	lbu	s5,-1(s1)
1c00ab2a:	1c0007b7          	lui	a5,0x1c000
1c00ab2e:	67878513          	addi	a0,a5,1656 # 1c000678 <__DTOR_END__+0x38c>
1c00ab32:	85d6                	mv	a1,s5
1c00ab34:	c1fff0ef          	jal	ra,1c00a752 <strchr>
1c00ab38:	fd61                	bnez	a0,1c00ab10 <_prf+0xa4>
1c00ab3a:	02a00693          	li	a3,42
1c00ab3e:	0eda9a63          	bne	s5,a3,1c00ac32 <_prf+0x1c6>
1c00ab42:	000c2903          	lw	s2,0(s8)
1c00ab46:	004c0693          	addi	a3,s8,4
1c00ab4a:	00095663          	bgez	s2,1c00ab56 <_prf+0xea>
1c00ab4e:	4705                	li	a4,1
1c00ab50:	41200933          	neg	s2,s2
1c00ab54:	c63a                	sw	a4,12(sp)
1c00ab56:	0004ca83          	lbu	s5,0(s1)
1c00ab5a:	8c36                	mv	s8,a3
1c00ab5c:	002b8493          	addi	s1,s7,2
1c00ab60:	0c800713          	li	a4,200
1c00ab64:	01277463          	bleu	s2,a4,1c00ab6c <_prf+0x100>
1c00ab68:	0c800913          	li	s2,200
1c00ab6c:	02e00693          	li	a3,46
1c00ab70:	5d7d                	li	s10,-1
1c00ab72:	02da9463          	bne	s5,a3,1c00ab9a <_prf+0x12e>
1c00ab76:	0004c703          	lbu	a4,0(s1)
1c00ab7a:	02a00793          	li	a5,42
1c00ab7e:	10f71063          	bne	a4,a5,1c00ac7e <_prf+0x212>
1c00ab82:	000c2d03          	lw	s10,0(s8)
1c00ab86:	0485                	addi	s1,s1,1
1c00ab88:	0c11                	addi	s8,s8,4
1c00ab8a:	0c800793          	li	a5,200
1c00ab8e:	01a7d363          	ble	s10,a5,1c00ab94 <_prf+0x128>
1c00ab92:	5d7d                	li	s10,-1
1c00ab94:	0004ca83          	lbu	s5,0(s1)
1c00ab98:	0485                	addi	s1,s1,1
1c00ab9a:	1c0007b7          	lui	a5,0x1c000
1c00ab9e:	85d6                	mv	a1,s5
1c00aba0:	68078513          	addi	a0,a5,1664 # 1c000680 <__DTOR_END__+0x394>
1c00aba4:	bafff0ef          	jal	ra,1c00a752 <strchr>
1c00aba8:	c501                	beqz	a0,1c00abb0 <_prf+0x144>
1c00abaa:	0004ca83          	lbu	s5,0(s1)
1c00abae:	0485                	addi	s1,s1,1
1c00abb0:	06700693          	li	a3,103
1c00abb4:	1356c263          	blt	a3,s5,1c00acd8 <_prf+0x26c>
1c00abb8:	06500693          	li	a3,101
1c00abbc:	1edadd63          	ble	a3,s5,1c00adb6 <_prf+0x34a>
1c00abc0:	04700693          	li	a3,71
1c00abc4:	0d56c163          	blt	a3,s5,1c00ac86 <_prf+0x21a>
1c00abc8:	04500693          	li	a3,69
1c00abcc:	1edad563          	ble	a3,s5,1c00adb6 <_prf+0x34a>
1c00abd0:	ee0a8ee3          	beqz	s5,1c00aacc <_prf+0x60>
1c00abd4:	02500713          	li	a4,37
1c00abd8:	68ea8263          	beq	s5,a4,1c00b25c <_prf+0x7f0>
1c00abdc:	0c800713          	li	a4,200
1c00abe0:	69575763          	ble	s5,a4,1c00b26e <_prf+0x802>
1c00abe4:	b5dd                	j	1c00aaca <_prf+0x5e>
1c00abe6:	034a8163          	beq	s5,s4,1c00ac08 <_prf+0x19c>
1c00abea:	016a8b63          	beq	s5,s6,1c00ac00 <_prf+0x194>
1c00abee:	f3aa99e3          	bne	s5,s10,1c00ab20 <_prf+0xb4>
1c00abf2:	4785                	li	a5,1
1c00abf4:	ca3e                	sw	a5,20(sp)
1c00abf6:	b72d                	j	1c00ab20 <_prf+0xb4>
1c00abf8:	4405                	li	s0,1
1c00abfa:	b71d                	j	1c00ab20 <_prf+0xb4>
1c00abfc:	4c85                	li	s9,1
1c00abfe:	b70d                	j	1c00ab20 <_prf+0xb4>
1c00ac00:	03000713          	li	a4,48
1c00ac04:	c83a                	sw	a4,16(sp)
1c00ac06:	bf29                	j	1c00ab20 <_prf+0xb4>
1c00ac08:	4785                	li	a5,1
1c00ac0a:	c63e                	sw	a5,12(sp)
1c00ac0c:	bf11                	j	1c00ab20 <_prf+0xb4>
1c00ac0e:	02000713          	li	a4,32
1c00ac12:	c83a                	sw	a4,16(sp)
1c00ac14:	4401                	li	s0,0
1c00ac16:	ca02                	sw	zero,20(sp)
1c00ac18:	c602                	sw	zero,12(sp)
1c00ac1a:	4c81                	li	s9,0
1c00ac1c:	02300913          	li	s2,35
1c00ac20:	02d00a13          	li	s4,45
1c00ac24:	03000b13          	li	s6,48
1c00ac28:	02b00d13          	li	s10,43
1c00ac2c:	02000d93          	li	s11,32
1c00ac30:	bdcd                	j	1c00ab22 <_prf+0xb6>
1c00ac32:	fd0a8693          	addi	a3,s5,-48
1c00ac36:	4625                	li	a2,9
1c00ac38:	4901                	li	s2,0
1c00ac3a:	45a9                	li	a1,10
1c00ac3c:	f2d662e3          	bltu	a2,a3,1c00ab60 <_prf+0xf4>
1c00ac40:	000bc683          	lbu	a3,0(s7)
1c00ac44:	001b8493          	addi	s1,s7,1
1c00ac48:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xfff17e4>
1c00ac4c:	8ab6                	mv	s5,a3
1c00ac4e:	f0e669e3          	bltu	a2,a4,1c00ab60 <_prf+0xf4>
1c00ac52:	02b90933          	mul	s2,s2,a1
1c00ac56:	8ba6                	mv	s7,s1
1c00ac58:	9936                	add	s2,s2,a3
1c00ac5a:	fd090913          	addi	s2,s2,-48
1c00ac5e:	b7cd                	j	1c00ac40 <_prf+0x1d4>
1c00ac60:	02ad0733          	mul	a4,s10,a0
1c00ac64:	84ae                	mv	s1,a1
1c00ac66:	973e                	add	a4,a4,a5
1c00ac68:	fd070d13          	addi	s10,a4,-48
1c00ac6c:	0004c783          	lbu	a5,0(s1)
1c00ac70:	00148593          	addi	a1,s1,1
1c00ac74:	fd078613          	addi	a2,a5,-48
1c00ac78:	fec6f4e3          	bleu	a2,a3,1c00ac60 <_prf+0x1f4>
1c00ac7c:	b739                	j	1c00ab8a <_prf+0x11e>
1c00ac7e:	4d01                	li	s10,0
1c00ac80:	46a5                	li	a3,9
1c00ac82:	4529                	li	a0,10
1c00ac84:	b7e5                	j	1c00ac6c <_prf+0x200>
1c00ac86:	06300693          	li	a3,99
1c00ac8a:	0cda8b63          	beq	s5,a3,1c00ad60 <_prf+0x2f4>
1c00ac8e:	0756c563          	blt	a3,s5,1c00acf8 <_prf+0x28c>
1c00ac92:	05800693          	li	a3,88
1c00ac96:	f4da93e3          	bne	s5,a3,1c00abdc <_prf+0x170>
1c00ac9a:	04410b93          	addi	s7,sp,68
1c00ac9e:	004c0a13          	addi	s4,s8,4
1c00aca2:	000c2583          	lw	a1,0(s8)
1c00aca6:	845e                	mv	s0,s7
1c00aca8:	000c8963          	beqz	s9,1c00acba <_prf+0x24e>
1c00acac:	76e1                	lui	a3,0xffff8
1c00acae:	8306c693          	xori	a3,a3,-2000
1c00acb2:	04d11223          	sh	a3,68(sp)
1c00acb6:	04610413          	addi	s0,sp,70
1c00acba:	86ea                	mv	a3,s10
1c00acbc:	4641                	li	a2,16
1c00acbe:	8522                	mv	a0,s0
1c00acc0:	3165                	jal	1c00a968 <_to_x>
1c00acc2:	05800693          	li	a3,88
1c00acc6:	58da8863          	beq	s5,a3,1c00b256 <_prf+0x7ea>
1c00acca:	41740433          	sub	s0,s0,s7
1c00acce:	9522                	add	a0,a0,s0
1c00acd0:	01903433          	snez	s0,s9
1c00acd4:	0406                	slli	s0,s0,0x1
1c00acd6:	a8c9                	j	1c00ada8 <_prf+0x33c>
1c00acd8:	07000693          	li	a3,112
1c00acdc:	50da8163          	beq	s5,a3,1c00b1de <_prf+0x772>
1c00ace0:	0556c163          	blt	a3,s5,1c00ad22 <_prf+0x2b6>
1c00ace4:	06e00693          	li	a3,110
1c00ace8:	46da8b63          	beq	s5,a3,1c00b15e <_prf+0x6f2>
1c00acec:	4956c063          	blt	a3,s5,1c00b16c <_prf+0x700>
1c00acf0:	06900693          	li	a3,105
1c00acf4:	eeda94e3          	bne	s5,a3,1c00abdc <_prf+0x170>
1c00acf8:	000c2a83          	lw	s5,0(s8)
1c00acfc:	004c0a13          	addi	s4,s8,4
1c00ad00:	04410b13          	addi	s6,sp,68
1c00ad04:	060ad963          	bgez	s5,1c00ad76 <_prf+0x30a>
1c00ad08:	02d00693          	li	a3,45
1c00ad0c:	04d10223          	sb	a3,68(sp)
1c00ad10:	800006b7          	lui	a3,0x80000
1c00ad14:	415005b3          	neg	a1,s5
1c00ad18:	06da9963          	bne	s5,a3,1c00ad8a <_prf+0x31e>
1c00ad1c:	800005b7          	lui	a1,0x80000
1c00ad20:	a0ad                	j	1c00ad8a <_prf+0x31e>
1c00ad22:	07500693          	li	a3,117
1c00ad26:	50da8063          	beq	s5,a3,1c00b226 <_prf+0x7ba>
1c00ad2a:	07800693          	li	a3,120
1c00ad2e:	f6da86e3          	beq	s5,a3,1c00ac9a <_prf+0x22e>
1c00ad32:	07300693          	li	a3,115
1c00ad36:	eada93e3          	bne	s5,a3,1c00abdc <_prf+0x170>
1c00ad3a:	000c2583          	lw	a1,0(s8)
1c00ad3e:	004c0a13          	addi	s4,s8,4
1c00ad42:	4c81                	li	s9,0
1c00ad44:	0c800793          	li	a5,200
1c00ad48:	019586b3          	add	a3,a1,s9
1c00ad4c:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00ad50:	4a068f63          	beqz	a3,1c00b20e <_prf+0x7a2>
1c00ad54:	0c85                	addi	s9,s9,1
1c00ad56:	fefc99e3          	bne	s9,a5,1c00ad48 <_prf+0x2dc>
1c00ad5a:	4a0d5c63          	bgez	s10,1c00b212 <_prf+0x7a6>
1c00ad5e:	a97d                	j	1c00b21c <_prf+0x7b0>
1c00ad60:	000c2783          	lw	a5,0(s8)
1c00ad64:	004c0a13          	addi	s4,s8,4
1c00ad68:	040102a3          	sb	zero,69(sp)
1c00ad6c:	04f10223          	sb	a5,68(sp)
1c00ad70:	4c85                	li	s9,1
1c00ad72:	4401                	li	s0,0
1c00ad74:	a105                	j	1c00b194 <_prf+0x728>
1c00ad76:	4752                	lw	a4,20(sp)
1c00ad78:	02b00693          	li	a3,43
1c00ad7c:	e701                	bnez	a4,1c00ad84 <_prf+0x318>
1c00ad7e:	c41d                	beqz	s0,1c00adac <_prf+0x340>
1c00ad80:	02000693          	li	a3,32
1c00ad84:	04d10223          	sb	a3,68(sp)
1c00ad88:	85d6                	mv	a1,s5
1c00ad8a:	04510c13          	addi	s8,sp,69
1c00ad8e:	86ea                	mv	a3,s10
1c00ad90:	4629                	li	a2,10
1c00ad92:	8562                	mv	a0,s8
1c00ad94:	bd5ff0ef          	jal	ra,1c00a968 <_to_x>
1c00ad98:	47d2                	lw	a5,20(sp)
1c00ad9a:	9562                	add	a0,a0,s8
1c00ad9c:	41650533          	sub	a0,a0,s6
1c00ada0:	eb89                	bnez	a5,1c00adb2 <_prf+0x346>
1c00ada2:	e019                	bnez	s0,1c00ada8 <_prf+0x33c>
1c00ada4:	01fad413          	srli	s0,s5,0x1f
1c00ada8:	57fd                	li	a5,-1
1c00adaa:	a9a1                	j	1c00b202 <_prf+0x796>
1c00adac:	85d6                	mv	a1,s5
1c00adae:	8c5a                	mv	s8,s6
1c00adb0:	bff9                	j	1c00ad8e <_prf+0x322>
1c00adb2:	4452                	lw	s0,20(sp)
1c00adb4:	bfd5                	j	1c00ada8 <_prf+0x33c>
1c00adb6:	0c1d                	addi	s8,s8,7
1c00adb8:	ff8c7c13          	andi	s8,s8,-8
1c00adbc:	000c2883          	lw	a7,0(s8)
1c00adc0:	004c2303          	lw	t1,4(s8)
1c00adc4:	80000737          	lui	a4,0x80000
1c00adc8:	0158d593          	srli	a1,a7,0x15
1c00adcc:	00b31693          	slli	a3,t1,0xb
1c00add0:	8ecd                	or	a3,a3,a1
1c00add2:	fff74713          	not	a4,a4
1c00add6:	01435613          	srli	a2,t1,0x14
1c00adda:	08ae                	slli	a7,a7,0xb
1c00addc:	8ef9                	and	a3,a3,a4
1c00adde:	7ff67613          	andi	a2,a2,2047
1c00ade2:	d846                	sw	a7,48(sp)
1c00ade4:	da36                	sw	a3,52(sp)
1c00ade6:	7ff00593          	li	a1,2047
1c00adea:	008c0a13          	addi	s4,s8,8
1c00adee:	08b61d63          	bne	a2,a1,1c00ae88 <_prf+0x41c>
1c00adf2:	00d0                	addi	a2,sp,68
1c00adf4:	8732                	mv	a4,a2
1c00adf6:	00035863          	bgez	t1,1c00ae06 <_prf+0x39a>
1c00adfa:	02d00713          	li	a4,45
1c00adfe:	04e10223          	sb	a4,68(sp)
1c00ae02:	04510713          	addi	a4,sp,69
1c00ae06:	00d8e6b3          	or	a3,a7,a3
1c00ae0a:	fbfa8793          	addi	a5,s5,-65
1c00ae0e:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00ae12:	eaa1                	bnez	a3,1c00ae62 <_prf+0x3f6>
1c00ae14:	46e5                	li	a3,25
1c00ae16:	02f6ee63          	bltu	a3,a5,1c00ae52 <_prf+0x3e6>
1c00ae1a:	6795                	lui	a5,0x5
1c00ae1c:	e4978793          	addi	a5,a5,-439 # 4e49 <_l1_preload_size+0x3639>
1c00ae20:	00f71023          	sh	a5,0(a4)
1c00ae24:	04600793          	li	a5,70
1c00ae28:	00f70123          	sb	a5,2(a4)
1c00ae2c:	000701a3          	sb	zero,3(a4)
1c00ae30:	8d11                	sub	a0,a0,a2
1c00ae32:	47d2                	lw	a5,20(sp)
1c00ae34:	48079f63          	bnez	a5,1c00b2d2 <_prf+0x866>
1c00ae38:	e419                	bnez	s0,1c00ae46 <_prf+0x3da>
1c00ae3a:	04414403          	lbu	s0,68(sp)
1c00ae3e:	fd340413          	addi	s0,s0,-45
1c00ae42:	00143413          	seqz	s0,s0
1c00ae46:	0c800793          	li	a5,200
1c00ae4a:	c8a7c0e3          	blt	a5,a0,1c00aaca <_prf+0x5e>
1c00ae4e:	8caa                	mv	s9,a0
1c00ae50:	a691                	j	1c00b194 <_prf+0x728>
1c00ae52:	679d                	lui	a5,0x7
1c00ae54:	e6978793          	addi	a5,a5,-407 # 6e69 <_l1_preload_size+0x5659>
1c00ae58:	00f71023          	sh	a5,0(a4)
1c00ae5c:	06600793          	li	a5,102
1c00ae60:	b7e1                	j	1c00ae28 <_prf+0x3bc>
1c00ae62:	46e5                	li	a3,25
1c00ae64:	00f6ea63          	bltu	a3,a5,1c00ae78 <_prf+0x40c>
1c00ae68:	6791                	lui	a5,0x4
1c00ae6a:	14e78793          	addi	a5,a5,334 # 414e <_l1_preload_size+0x293e>
1c00ae6e:	00f71023          	sh	a5,0(a4)
1c00ae72:	04e00793          	li	a5,78
1c00ae76:	bf4d                	j	1c00ae28 <_prf+0x3bc>
1c00ae78:	6799                	lui	a5,0x6
1c00ae7a:	16e78793          	addi	a5,a5,366 # 616e <_l1_preload_size+0x495e>
1c00ae7e:	00f71023          	sh	a5,0(a4)
1c00ae82:	06e00793          	li	a5,110
1c00ae86:	b74d                	j	1c00ae28 <_prf+0x3bc>
1c00ae88:	04600593          	li	a1,70
1c00ae8c:	00ba9463          	bne	s5,a1,1c00ae94 <_prf+0x428>
1c00ae90:	06600a93          	li	s5,102
1c00ae94:	011665b3          	or	a1,a2,a7
1c00ae98:	8dd5                	or	a1,a1,a3
1c00ae9a:	c9c9                	beqz	a1,1c00af2c <_prf+0x4c0>
1c00ae9c:	800007b7          	lui	a5,0x80000
1c00aea0:	8edd                	or	a3,a3,a5
1c00aea2:	da36                	sw	a3,52(sp)
1c00aea4:	d846                	sw	a7,48(sp)
1c00aea6:	c0260c13          	addi	s8,a2,-1022
1c00aeaa:	02d00693          	li	a3,45
1c00aeae:	00034b63          	bltz	t1,1c00aec4 <_prf+0x458>
1c00aeb2:	4752                	lw	a4,20(sp)
1c00aeb4:	02b00693          	li	a3,43
1c00aeb8:	e711                	bnez	a4,1c00aec4 <_prf+0x458>
1c00aeba:	04410b13          	addi	s6,sp,68
1c00aebe:	c419                	beqz	s0,1c00aecc <_prf+0x460>
1c00aec0:	02000693          	li	a3,32
1c00aec4:	04d10223          	sb	a3,68(sp)
1c00aec8:	04510b13          	addi	s6,sp,69
1c00aecc:	4b81                	li	s7,0
1c00aece:	55f9                	li	a1,-2
1c00aed0:	06bc4363          	blt	s8,a1,1c00af36 <_prf+0x4ca>
1c00aed4:	0b804a63          	bgtz	s8,1c00af88 <_prf+0x51c>
1c00aed8:	4d91                	li	s11,4
1c00aeda:	1808                	addi	a0,sp,48
1c00aedc:	0c05                	addi	s8,s8,1
1c00aede:	aebff0ef          	jal	ra,1c00a9c8 <_rlrshift>
1c00aee2:	ffbc1ce3          	bne	s8,s11,1c00aeda <_prf+0x46e>
1c00aee6:	000d5363          	bgez	s10,1c00aeec <_prf+0x480>
1c00aeea:	4d19                	li	s10,6
1c00aeec:	fdfaf593          	andi	a1,s5,-33
1c00aef0:	04700513          	li	a0,71
1c00aef4:	0ca59663          	bne	a1,a0,1c00afc0 <_prf+0x554>
1c00aef8:	4c01                	li	s8,0
1c00aefa:	000c9463          	bnez	s9,1c00af02 <_prf+0x496>
1c00aefe:	01a03c33          	snez	s8,s10
1c00af02:	55f5                	li	a1,-3
1c00af04:	00bbc663          	blt	s7,a1,1c00af10 <_prf+0x4a4>
1c00af08:	001d0593          	addi	a1,s10,1
1c00af0c:	0b75df63          	ble	s7,a1,1c00afca <_prf+0x55e>
1c00af10:	06700593          	li	a1,103
1c00af14:	14ba8c63          	beq	s5,a1,1c00b06c <_prf+0x600>
1c00af18:	04500a93          	li	s5,69
1c00af1c:	001d0593          	addi	a1,s10,1
1c00af20:	4541                	li	a0,16
1c00af22:	d62a                	sw	a0,44(sp)
1c00af24:	0ab55c63          	ble	a1,a0,1c00afdc <_prf+0x570>
1c00af28:	45c1                	li	a1,16
1c00af2a:	a84d                	j	1c00afdc <_prf+0x570>
1c00af2c:	4c01                	li	s8,0
1c00af2e:	b751                	j	1c00aeb2 <_prf+0x446>
1c00af30:	1808                	addi	a0,sp,48
1c00af32:	a97ff0ef          	jal	ra,1c00a9c8 <_rlrshift>
1c00af36:	55d2                	lw	a1,52(sp)
1c00af38:	333337b7          	lui	a5,0x33333
1c00af3c:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732199a>
1c00af40:	5342                	lw	t1,48(sp)
1c00af42:	0c05                	addi	s8,s8,1
1c00af44:	feb7e6e3          	bltu	a5,a1,1c00af30 <_prf+0x4c4>
1c00af48:	4895                	li	a7,5
1c00af4a:	02b88533          	mul	a0,a7,a1
1c00af4e:	1bfd                	addi	s7,s7,-1
1c00af50:	0268b5b3          	mulhu	a1,a7,t1
1c00af54:	026888b3          	mul	a7,a7,t1
1c00af58:	95aa                	add	a1,a1,a0
1c00af5a:	da2e                	sw	a1,52(sp)
1c00af5c:	4501                	li	a0,0
1c00af5e:	d846                	sw	a7,48(sp)
1c00af60:	800006b7          	lui	a3,0x80000
1c00af64:	fff6c693          	not	a3,a3
1c00af68:	00b6f663          	bleu	a1,a3,1c00af74 <_prf+0x508>
1c00af6c:	d12d                	beqz	a0,1c00aece <_prf+0x462>
1c00af6e:	d846                	sw	a7,48(sp)
1c00af70:	da2e                	sw	a1,52(sp)
1c00af72:	bfb1                	j	1c00aece <_prf+0x462>
1c00af74:	01f8d313          	srli	t1,a7,0x1f
1c00af78:	00159513          	slli	a0,a1,0x1
1c00af7c:	00a365b3          	or	a1,t1,a0
1c00af80:	0886                	slli	a7,a7,0x1
1c00af82:	1c7d                	addi	s8,s8,-1
1c00af84:	4505                	li	a0,1
1c00af86:	bfe9                	j	1c00af60 <_prf+0x4f4>
1c00af88:	1808                	addi	a0,sp,48
1c00af8a:	a5fff0ef          	jal	ra,1c00a9e8 <_ldiv5>
1c00af8e:	58c2                	lw	a7,48(sp)
1c00af90:	55d2                	lw	a1,52(sp)
1c00af92:	1c7d                	addi	s8,s8,-1
1c00af94:	0b85                	addi	s7,s7,1
1c00af96:	4501                	li	a0,0
1c00af98:	80000737          	lui	a4,0x80000
1c00af9c:	fff74713          	not	a4,a4
1c00afa0:	00b77663          	bleu	a1,a4,1c00afac <_prf+0x540>
1c00afa4:	d905                	beqz	a0,1c00aed4 <_prf+0x468>
1c00afa6:	d846                	sw	a7,48(sp)
1c00afa8:	da2e                	sw	a1,52(sp)
1c00afaa:	b72d                	j	1c00aed4 <_prf+0x468>
1c00afac:	01f8d313          	srli	t1,a7,0x1f
1c00afb0:	00159513          	slli	a0,a1,0x1
1c00afb4:	00a365b3          	or	a1,t1,a0
1c00afb8:	0886                	slli	a7,a7,0x1
1c00afba:	1c7d                	addi	s8,s8,-1
1c00afbc:	4505                	li	a0,1
1c00afbe:	bfe9                	j	1c00af98 <_prf+0x52c>
1c00afc0:	06600593          	li	a1,102
1c00afc4:	4c01                	li	s8,0
1c00afc6:	f4ba9be3          	bne	s5,a1,1c00af1c <_prf+0x4b0>
1c00afca:	01ab85b3          	add	a1,s7,s10
1c00afce:	06600a93          	li	s5,102
1c00afd2:	f405d7e3          	bgez	a1,1c00af20 <_prf+0x4b4>
1c00afd6:	45c1                	li	a1,16
1c00afd8:	d62e                	sw	a1,44(sp)
1c00afda:	4581                	li	a1,0
1c00afdc:	4301                	li	t1,0
1c00afde:	080003b7          	lui	t2,0x8000
1c00afe2:	dc1a                	sw	t1,56(sp)
1c00afe4:	de1e                	sw	t2,60(sp)
1c00afe6:	5dfd                	li	s11,-1
1c00afe8:	15fd                	addi	a1,a1,-1
1c00afea:	09b59463          	bne	a1,s11,1c00b072 <_prf+0x606>
1c00afee:	55c2                	lw	a1,48(sp)
1c00aff0:	5562                	lw	a0,56(sp)
1c00aff2:	58d2                	lw	a7,52(sp)
1c00aff4:	5372                	lw	t1,60(sp)
1c00aff6:	952e                	add	a0,a0,a1
1c00aff8:	00b535b3          	sltu	a1,a0,a1
1c00affc:	989a                	add	a7,a7,t1
1c00affe:	95c6                	add	a1,a1,a7
1c00b000:	d82a                	sw	a0,48(sp)
1c00b002:	f0000537          	lui	a0,0xf0000
1c00b006:	da2e                	sw	a1,52(sp)
1c00b008:	8de9                	and	a1,a1,a0
1c00b00a:	c981                	beqz	a1,1c00b01a <_prf+0x5ae>
1c00b00c:	1808                	addi	a0,sp,48
1c00b00e:	9dbff0ef          	jal	ra,1c00a9e8 <_ldiv5>
1c00b012:	1808                	addi	a0,sp,48
1c00b014:	9b5ff0ef          	jal	ra,1c00a9c8 <_rlrshift>
1c00b018:	0b85                	addi	s7,s7,1
1c00b01a:	06600593          	li	a1,102
1c00b01e:	001b0d93          	addi	s11,s6,1
1c00b022:	08ba9663          	bne	s5,a1,1c00b0ae <_prf+0x642>
1c00b026:	05705f63          	blez	s7,1c00b084 <_prf+0x618>
1c00b02a:	017b0db3          	add	s11,s6,s7
1c00b02e:	106c                	addi	a1,sp,44
1c00b030:	1808                	addi	a0,sp,48
1c00b032:	0b05                	addi	s6,s6,1
1c00b034:	9fdff0ef          	jal	ra,1c00aa30 <_get_digit>
1c00b038:	feab0fa3          	sb	a0,-1(s6)
1c00b03c:	ffbb19e3          	bne	s6,s11,1c00b02e <_prf+0x5c2>
1c00b040:	4b81                	li	s7,0
1c00b042:	000c9463          	bnez	s9,1c00b04a <_prf+0x5de>
1c00b046:	020d0063          	beqz	s10,1c00b066 <_prf+0x5fa>
1c00b04a:	02e00613          	li	a2,46
1c00b04e:	00cd8023          	sb	a2,0(s11)
1c00b052:	8b6e                	mv	s6,s11
1c00b054:	01ad8cb3          	add	s9,s11,s10
1c00b058:	03000313          	li	t1,48
1c00b05c:	036c9963          	bne	s9,s6,1c00b08e <_prf+0x622>
1c00b060:	001d0713          	addi	a4,s10,1
1c00b064:	9dba                	add	s11,s11,a4
1c00b066:	060c1e63          	bnez	s8,1c00b0e2 <_prf+0x676>
1c00b06a:	a8d1                	j	1c00b13e <_prf+0x6d2>
1c00b06c:	06500a93          	li	s5,101
1c00b070:	b575                	j	1c00af1c <_prf+0x4b0>
1c00b072:	1828                	addi	a0,sp,56
1c00b074:	c42e                	sw	a1,8(sp)
1c00b076:	973ff0ef          	jal	ra,1c00a9e8 <_ldiv5>
1c00b07a:	1828                	addi	a0,sp,56
1c00b07c:	94dff0ef          	jal	ra,1c00a9c8 <_rlrshift>
1c00b080:	45a2                	lw	a1,8(sp)
1c00b082:	b79d                	j	1c00afe8 <_prf+0x57c>
1c00b084:	03000593          	li	a1,48
1c00b088:	00bb0023          	sb	a1,0(s6)
1c00b08c:	bf5d                	j	1c00b042 <_prf+0x5d6>
1c00b08e:	000b8763          	beqz	s7,1c00b09c <_prf+0x630>
1c00b092:	006b00a3          	sb	t1,1(s6)
1c00b096:	0b85                	addi	s7,s7,1
1c00b098:	0b05                	addi	s6,s6,1
1c00b09a:	b7c9                	j	1c00b05c <_prf+0x5f0>
1c00b09c:	106c                	addi	a1,sp,44
1c00b09e:	1808                	addi	a0,sp,48
1c00b0a0:	c41a                	sw	t1,8(sp)
1c00b0a2:	98fff0ef          	jal	ra,1c00aa30 <_get_digit>
1c00b0a6:	00ab00a3          	sb	a0,1(s6)
1c00b0aa:	4322                	lw	t1,8(sp)
1c00b0ac:	b7f5                	j	1c00b098 <_prf+0x62c>
1c00b0ae:	106c                	addi	a1,sp,44
1c00b0b0:	1808                	addi	a0,sp,48
1c00b0b2:	97fff0ef          	jal	ra,1c00aa30 <_get_digit>
1c00b0b6:	00ab0023          	sb	a0,0(s6)
1c00b0ba:	03000593          	li	a1,48
1c00b0be:	00b50363          	beq	a0,a1,1c00b0c4 <_prf+0x658>
1c00b0c2:	1bfd                	addi	s7,s7,-1
1c00b0c4:	000c9463          	bnez	s9,1c00b0cc <_prf+0x660>
1c00b0c8:	000d0b63          	beqz	s10,1c00b0de <_prf+0x672>
1c00b0cc:	002b0d93          	addi	s11,s6,2
1c00b0d0:	02e00593          	li	a1,46
1c00b0d4:	00bb00a3          	sb	a1,1(s6)
1c00b0d8:	9d6e                	add	s10,s10,s11
1c00b0da:	07bd1863          	bne	s10,s11,1c00b14a <_prf+0x6de>
1c00b0de:	000c0f63          	beqz	s8,1c00b0fc <_prf+0x690>
1c00b0e2:	03000593          	li	a1,48
1c00b0e6:	fffdc603          	lbu	a2,-1(s11)
1c00b0ea:	fffd8713          	addi	a4,s11,-1
1c00b0ee:	06b60663          	beq	a2,a1,1c00b15a <_prf+0x6ee>
1c00b0f2:	02e00593          	li	a1,46
1c00b0f6:	00b61363          	bne	a2,a1,1c00b0fc <_prf+0x690>
1c00b0fa:	8dba                	mv	s11,a4
1c00b0fc:	fdfaf713          	andi	a4,s5,-33
1c00b100:	04500613          	li	a2,69
1c00b104:	02c71d63          	bne	a4,a2,1c00b13e <_prf+0x6d2>
1c00b108:	87d6                	mv	a5,s5
1c00b10a:	00fd8023          	sb	a5,0(s11)
1c00b10e:	02b00793          	li	a5,43
1c00b112:	000bd663          	bgez	s7,1c00b11e <_prf+0x6b2>
1c00b116:	41700bb3          	neg	s7,s7
1c00b11a:	02d00793          	li	a5,45
1c00b11e:	00fd80a3          	sb	a5,1(s11)
1c00b122:	47a9                	li	a5,10
1c00b124:	02fbc733          	div	a4,s7,a5
1c00b128:	0d91                	addi	s11,s11,4
1c00b12a:	02fbe6b3          	rem	a3,s7,a5
1c00b12e:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b132:	feed8f23          	sb	a4,-2(s11)
1c00b136:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b13a:	fedd8fa3          	sb	a3,-1(s11)
1c00b13e:	00c8                	addi	a0,sp,68
1c00b140:	000d8023          	sb	zero,0(s11)
1c00b144:	40ad8533          	sub	a0,s11,a0
1c00b148:	b1ed                	j	1c00ae32 <_prf+0x3c6>
1c00b14a:	106c                	addi	a1,sp,44
1c00b14c:	1808                	addi	a0,sp,48
1c00b14e:	0d85                	addi	s11,s11,1
1c00b150:	8e1ff0ef          	jal	ra,1c00aa30 <_get_digit>
1c00b154:	fead8fa3          	sb	a0,-1(s11)
1c00b158:	b749                	j	1c00b0da <_prf+0x66e>
1c00b15a:	8dba                	mv	s11,a4
1c00b15c:	b769                	j	1c00b0e6 <_prf+0x67a>
1c00b15e:	000c2783          	lw	a5,0(s8)
1c00b162:	004c0a13          	addi	s4,s8,4
1c00b166:	0137a023          	sw	s3,0(a5)
1c00b16a:	b24d                	j	1c00ab0c <_prf+0xa0>
1c00b16c:	004c0a13          	addi	s4,s8,4
1c00b170:	000c2583          	lw	a1,0(s8)
1c00b174:	00dc                	addi	a5,sp,68
1c00b176:	040c8463          	beqz	s9,1c00b1be <_prf+0x752>
1c00b17a:	03000693          	li	a3,48
1c00b17e:	04d10223          	sb	a3,68(sp)
1c00b182:	04510513          	addi	a0,sp,69
1c00b186:	ed8d                	bnez	a1,1c00b1c0 <_prf+0x754>
1c00b188:	040102a3          	sb	zero,69(sp)
1c00b18c:	57fd                	li	a5,-1
1c00b18e:	4401                	li	s0,0
1c00b190:	0efd1163          	bne	s10,a5,1c00b272 <_prf+0x806>
1c00b194:	0f2cc363          	blt	s9,s2,1c00b27a <_prf+0x80e>
1c00b198:	8966                	mv	s2,s9
1c00b19a:	00c0                	addi	s0,sp,68
1c00b19c:	40898ab3          	sub	s5,s3,s0
1c00b1a0:	5b7d                	li	s6,-1
1c00b1a2:	015409b3          	add	s3,s0,s5
1c00b1a6:	960903e3          	beqz	s2,1c00ab0c <_prf+0xa0>
1c00b1aa:	45f2                	lw	a1,28(sp)
1c00b1ac:	00044503          	lbu	a0,0(s0)
1c00b1b0:	47e2                	lw	a5,24(sp)
1c00b1b2:	9782                	jalr	a5
1c00b1b4:	91650be3          	beq	a0,s6,1c00aaca <_prf+0x5e>
1c00b1b8:	197d                	addi	s2,s2,-1
1c00b1ba:	0405                	addi	s0,s0,1
1c00b1bc:	b7dd                	j	1c00b1a2 <_prf+0x736>
1c00b1be:	853e                	mv	a0,a5
1c00b1c0:	86ea                	mv	a3,s10
1c00b1c2:	4621                	li	a2,8
1c00b1c4:	40f50433          	sub	s0,a0,a5
1c00b1c8:	fa0ff0ef          	jal	ra,1c00a968 <_to_x>
1c00b1cc:	9522                	add	a0,a0,s0
1c00b1ce:	57fd                	li	a5,-1
1c00b1d0:	4401                	li	s0,0
1c00b1d2:	c6fd0ae3          	beq	s10,a5,1c00ae46 <_prf+0x3da>
1c00b1d6:	02000793          	li	a5,32
1c00b1da:	c83e                	sw	a5,16(sp)
1c00b1dc:	b1ad                	j	1c00ae46 <_prf+0x3da>
1c00b1de:	000c2583          	lw	a1,0(s8)
1c00b1e2:	77e1                	lui	a5,0xffff8
1c00b1e4:	8307c793          	xori	a5,a5,-2000
1c00b1e8:	46a1                	li	a3,8
1c00b1ea:	4641                	li	a2,16
1c00b1ec:	04610513          	addi	a0,sp,70
1c00b1f0:	04f11223          	sh	a5,68(sp)
1c00b1f4:	f74ff0ef          	jal	ra,1c00a968 <_to_x>
1c00b1f8:	004c0a13          	addi	s4,s8,4
1c00b1fc:	0509                	addi	a0,a0,2
1c00b1fe:	57fd                	li	a5,-1
1c00b200:	4401                	li	s0,0
1c00b202:	c4fd02e3          	beq	s10,a5,1c00ae46 <_prf+0x3da>
1c00b206:	02000713          	li	a4,32
1c00b20a:	c83a                	sw	a4,16(sp)
1c00b20c:	b92d                	j	1c00ae46 <_prf+0x3da>
1c00b20e:	000d4563          	bltz	s10,1c00b218 <_prf+0x7ac>
1c00b212:	019d5363          	ble	s9,s10,1c00b218 <_prf+0x7ac>
1c00b216:	8cea                	mv	s9,s10
1c00b218:	8e0c8ae3          	beqz	s9,1c00ab0c <_prf+0xa0>
1c00b21c:	8666                	mv	a2,s9
1c00b21e:	00c8                	addi	a0,sp,68
1c00b220:	ce4ff0ef          	jal	ra,1c00a704 <memcpy>
1c00b224:	b6b9                	j	1c00ad72 <_prf+0x306>
1c00b226:	000c2583          	lw	a1,0(s8)
1c00b22a:	86ea                	mv	a3,s10
1c00b22c:	4629                	li	a2,10
1c00b22e:	00c8                	addi	a0,sp,68
1c00b230:	004c0a13          	addi	s4,s8,4
1c00b234:	f34ff0ef          	jal	ra,1c00a968 <_to_x>
1c00b238:	bf59                	j	1c00b1ce <_prf+0x762>
1c00b23a:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b23e:	0ff67613          	andi	a2,a2,255
1c00b242:	00c5e563          	bltu	a1,a2,1c00b24c <_prf+0x7e0>
1c00b246:	1781                	addi	a5,a5,-32
1c00b248:	00f68023          	sb	a5,0(a3)
1c00b24c:	0685                	addi	a3,a3,1
1c00b24e:	0006c783          	lbu	a5,0(a3)
1c00b252:	f7e5                	bnez	a5,1c00b23a <_prf+0x7ce>
1c00b254:	bc9d                	j	1c00acca <_prf+0x25e>
1c00b256:	86de                	mv	a3,s7
1c00b258:	45e5                	li	a1,25
1c00b25a:	bfd5                	j	1c00b24e <_prf+0x7e2>
1c00b25c:	45f2                	lw	a1,28(sp)
1c00b25e:	4762                	lw	a4,24(sp)
1c00b260:	02500513          	li	a0,37
1c00b264:	9702                	jalr	a4
1c00b266:	57fd                	li	a5,-1
1c00b268:	86f501e3          	beq	a0,a5,1c00aaca <_prf+0x5e>
1c00b26c:	0985                	addi	s3,s3,1
1c00b26e:	8a62                	mv	s4,s8
1c00b270:	b871                	j	1c00ab0c <_prf+0xa0>
1c00b272:	02000793          	li	a5,32
1c00b276:	c83e                	sw	a5,16(sp)
1c00b278:	bf31                	j	1c00b194 <_prf+0x728>
1c00b27a:	4732                	lw	a4,12(sp)
1c00b27c:	cf01                	beqz	a4,1c00b294 <_prf+0x828>
1c00b27e:	02000713          	li	a4,32
1c00b282:	00d4                	addi	a3,sp,68
1c00b284:	019687b3          	add	a5,a3,s9
1c00b288:	00e78023          	sb	a4,0(a5)
1c00b28c:	0c85                	addi	s9,s9,1
1c00b28e:	ff991ae3          	bne	s2,s9,1c00b282 <_prf+0x816>
1c00b292:	b721                	j	1c00b19a <_prf+0x72e>
1c00b294:	00cc                	addi	a1,sp,68
1c00b296:	41990bb3          	sub	s7,s2,s9
1c00b29a:	001c8613          	addi	a2,s9,1
1c00b29e:	01758533          	add	a0,a1,s7
1c00b2a2:	c7aff0ef          	jal	ra,1c00a71c <memmove>
1c00b2a6:	4742                	lw	a4,16(sp)
1c00b2a8:	02000793          	li	a5,32
1c00b2ac:	00f70363          	beq	a4,a5,1c00b2b2 <_prf+0x846>
1c00b2b0:	c622                	sw	s0,12(sp)
1c00b2b2:	47b2                	lw	a5,12(sp)
1c00b2b4:	9bbe                	add	s7,s7,a5
1c00b2b6:	4732                	lw	a4,12(sp)
1c00b2b8:	ef7751e3          	ble	s7,a4,1c00b19a <_prf+0x72e>
1c00b2bc:	4732                	lw	a4,12(sp)
1c00b2be:	00d4                	addi	a3,sp,68
1c00b2c0:	00e687b3          	add	a5,a3,a4
1c00b2c4:	4742                	lw	a4,16(sp)
1c00b2c6:	00e78023          	sb	a4,0(a5)
1c00b2ca:	47b2                	lw	a5,12(sp)
1c00b2cc:	0785                	addi	a5,a5,1
1c00b2ce:	c63e                	sw	a5,12(sp)
1c00b2d0:	b7dd                	j	1c00b2b6 <_prf+0x84a>
1c00b2d2:	4452                	lw	s0,20(sp)
1c00b2d4:	be8d                	j	1c00ae46 <_prf+0x3da>

1c00b2d6 <__rt_uart_cluster_req_done>:
1c00b2d6:	300476f3          	csrrci	a3,mstatus,8
1c00b2da:	4785                	li	a5,1
1c00b2dc:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b2e0:	09954783          	lbu	a5,153(a0)
1c00b2e4:	00201737          	lui	a4,0x201
1c00b2e8:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2618>
1c00b2ec:	04078793          	addi	a5,a5,64
1c00b2f0:	07da                	slli	a5,a5,0x16
1c00b2f2:	97ba                	add	a5,a5,a4
1c00b2f4:	0007a023          	sw	zero,0(a5)
1c00b2f8:	30069073          	csrw	mstatus,a3
1c00b2fc:	8082                	ret

1c00b2fe <__rt_uart_setup.isra.6>:
1c00b2fe:	1c001737          	lui	a4,0x1c001
1c00b302:	20872703          	lw	a4,520(a4) # 1c001208 <__rt_freq_domains>
1c00b306:	00155793          	srli	a5,a0,0x1
1c00b30a:	97ba                	add	a5,a5,a4
1c00b30c:	02a7d7b3          	divu	a5,a5,a0
1c00b310:	1a102737          	lui	a4,0x1a102
1c00b314:	17fd                	addi	a5,a5,-1
1c00b316:	07c2                	slli	a5,a5,0x10
1c00b318:	3067e793          	ori	a5,a5,774
1c00b31c:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100990>
1c00b320:	8082                	ret

1c00b322 <__rt_uart_setfreq_after>:
1c00b322:	1c0017b7          	lui	a5,0x1c001
1c00b326:	18878793          	addi	a5,a5,392 # 1c001188 <__rt_uart>
1c00b32a:	4398                	lw	a4,0(a5)
1c00b32c:	cb09                	beqz	a4,1c00b33e <__rt_uart_setfreq_after+0x1c>
1c00b32e:	4788                	lw	a0,8(a5)
1c00b330:	1141                	addi	sp,sp,-16
1c00b332:	c606                	sw	ra,12(sp)
1c00b334:	37e9                	jal	1c00b2fe <__rt_uart_setup.isra.6>
1c00b336:	40b2                	lw	ra,12(sp)
1c00b338:	4501                	li	a0,0
1c00b33a:	0141                	addi	sp,sp,16
1c00b33c:	8082                	ret
1c00b33e:	4501                	li	a0,0
1c00b340:	8082                	ret

1c00b342 <__rt_uart_cluster_req>:
1c00b342:	1141                	addi	sp,sp,-16
1c00b344:	c606                	sw	ra,12(sp)
1c00b346:	c422                	sw	s0,8(sp)
1c00b348:	30047473          	csrrci	s0,mstatus,8
1c00b34c:	1c00b7b7          	lui	a5,0x1c00b
1c00b350:	2d678793          	addi	a5,a5,726 # 1c00b2d6 <__rt_uart_cluster_req_done>
1c00b354:	c55c                	sw	a5,12(a0)
1c00b356:	4785                	li	a5,1
1c00b358:	d55c                	sw	a5,44(a0)
1c00b35a:	411c                	lw	a5,0(a0)
1c00b35c:	02052823          	sw	zero,48(a0)
1c00b360:	c908                	sw	a0,16(a0)
1c00b362:	43cc                	lw	a1,4(a5)
1c00b364:	4514                	lw	a3,8(a0)
1c00b366:	4150                	lw	a2,4(a0)
1c00b368:	0586                	slli	a1,a1,0x1
1c00b36a:	00c50793          	addi	a5,a0,12
1c00b36e:	4701                	li	a4,0
1c00b370:	0585                	addi	a1,a1,1
1c00b372:	4501                	li	a0,0
1c00b374:	e99fe0ef          	jal	ra,1c00a20c <rt_periph_copy>
1c00b378:	30041073          	csrw	mstatus,s0
1c00b37c:	40b2                	lw	ra,12(sp)
1c00b37e:	4422                	lw	s0,8(sp)
1c00b380:	0141                	addi	sp,sp,16
1c00b382:	8082                	ret

1c00b384 <__rt_uart_wait_tx_done.isra.5>:
1c00b384:	1a102737          	lui	a4,0x1a102
1c00b388:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa100984>
1c00b38c:	8bc1                	andi	a5,a5,16
1c00b38e:	e7b9                	bnez	a5,1c00b3dc <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b390:	1a102737          	lui	a4,0x1a102
1c00b394:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa10098c>
1c00b398:	8b85                	andi	a5,a5,1
1c00b39a:	ffed                	bnez	a5,1c00b394 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b39c:	f14027f3          	csrr	a5,mhartid
1c00b3a0:	8795                	srai	a5,a5,0x5
1c00b3a2:	1a10a637          	lui	a2,0x1a10a
1c00b3a6:	03f7f793          	andi	a5,a5,63
1c00b3aa:	03200693          	li	a3,50
1c00b3ae:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa108000>
1c00b3b2:	6711                	lui	a4,0x4
1c00b3b4:	6311                	lui	t1,0x4
1c00b3b6:	45fd                	li	a1,31
1c00b3b8:	00204537          	lui	a0,0x204
1c00b3bc:	88be                	mv	a7,a5
1c00b3be:	00682023          	sw	t1,0(a6)
1c00b3c2:	02b79063          	bne	a5,a1,1c00b3e2 <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b3c6:	80e62223          	sw	a4,-2044(a2)
1c00b3ca:	10500073          	wfi
1c00b3ce:	00b89c63          	bne	a7,a1,1c00b3e6 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b3d2:	80e62423          	sw	a4,-2040(a2)
1c00b3d6:	16fd                	addi	a3,a3,-1
1c00b3d8:	f2fd                	bnez	a3,1c00b3be <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b3da:	8082                	ret
1c00b3dc:	10500073          	wfi
1c00b3e0:	b765                	j	1c00b388 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b3e2:	c958                	sw	a4,20(a0)
1c00b3e4:	b7dd                	j	1c00b3ca <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b3e6:	c918                	sw	a4,16(a0)
1c00b3e8:	b7fd                	j	1c00b3d6 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b3ea <__rt_uart_setfreq_before>:
1c00b3ea:	1c0017b7          	lui	a5,0x1c001
1c00b3ee:	1887a783          	lw	a5,392(a5) # 1c001188 <__rt_uart>
1c00b3f2:	cf99                	beqz	a5,1c00b410 <__rt_uart_setfreq_before+0x26>
1c00b3f4:	1141                	addi	sp,sp,-16
1c00b3f6:	c606                	sw	ra,12(sp)
1c00b3f8:	3771                	jal	1c00b384 <__rt_uart_wait_tx_done.isra.5>
1c00b3fa:	40b2                	lw	ra,12(sp)
1c00b3fc:	005007b7          	lui	a5,0x500
1c00b400:	1a102737          	lui	a4,0x1a102
1c00b404:	0799                	addi	a5,a5,6
1c00b406:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100990>
1c00b40a:	4501                	li	a0,0
1c00b40c:	0141                	addi	sp,sp,16
1c00b40e:	8082                	ret
1c00b410:	4501                	li	a0,0
1c00b412:	8082                	ret

1c00b414 <soc_eu_fcEventMask_setEvent>:
1c00b414:	47fd                	li	a5,31
1c00b416:	4721                	li	a4,8
1c00b418:	00a7d463          	ble	a0,a5,1c00b420 <soc_eu_fcEventMask_setEvent+0xc>
1c00b41c:	1501                	addi	a0,a0,-32
1c00b41e:	4711                	li	a4,4
1c00b420:	1a1067b7          	lui	a5,0x1a106
1c00b424:	973e                	add	a4,a4,a5
1c00b426:	4314                	lw	a3,0(a4)
1c00b428:	4785                	li	a5,1
1c00b42a:	00a79533          	sll	a0,a5,a0
1c00b42e:	fff54513          	not	a0,a0
1c00b432:	8d75                	and	a0,a0,a3
1c00b434:	c308                	sw	a0,0(a4)
1c00b436:	8082                	ret

1c00b438 <rt_uart_conf_init>:
1c00b438:	000997b7          	lui	a5,0x99
1c00b43c:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8a17c>
1c00b440:	c11c                	sw	a5,0(a0)
1c00b442:	57fd                	li	a5,-1
1c00b444:	c15c                	sw	a5,4(a0)
1c00b446:	8082                	ret

1c00b448 <__rt_uart_open>:
1c00b448:	1141                	addi	sp,sp,-16
1c00b44a:	c606                	sw	ra,12(sp)
1c00b44c:	c422                	sw	s0,8(sp)
1c00b44e:	c226                	sw	s1,4(sp)
1c00b450:	c04a                	sw	s2,0(sp)
1c00b452:	30047973          	csrrci	s2,mstatus,8
1c00b456:	cd8d                	beqz	a1,1c00b490 <__rt_uart_open+0x48>
1c00b458:	4194                	lw	a3,0(a1)
1c00b45a:	1c0017b7          	lui	a5,0x1c001
1c00b45e:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f5811>
1c00b462:	18878413          	addi	s0,a5,392 # 1c001188 <__rt_uart>
1c00b466:	0712                	slli	a4,a4,0x4
1c00b468:	943a                	add	s0,s0,a4
1c00b46a:	4010                	lw	a2,0(s0)
1c00b46c:	18878793          	addi	a5,a5,392
1c00b470:	c60d                	beqz	a2,1c00b49a <__rt_uart_open+0x52>
1c00b472:	c589                	beqz	a1,1c00b47c <__rt_uart_open+0x34>
1c00b474:	418c                	lw	a1,0(a1)
1c00b476:	4414                	lw	a3,8(s0)
1c00b478:	04d59a63          	bne	a1,a3,1c00b4cc <__rt_uart_open+0x84>
1c00b47c:	97ba                	add	a5,a5,a4
1c00b47e:	0605                	addi	a2,a2,1
1c00b480:	c390                	sw	a2,0(a5)
1c00b482:	8522                	mv	a0,s0
1c00b484:	40b2                	lw	ra,12(sp)
1c00b486:	4422                	lw	s0,8(sp)
1c00b488:	4492                	lw	s1,4(sp)
1c00b48a:	4902                	lw	s2,0(sp)
1c00b48c:	0141                	addi	sp,sp,16
1c00b48e:	8082                	ret
1c00b490:	000996b7          	lui	a3,0x99
1c00b494:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8a17c>
1c00b498:	b7c9                	j	1c00b45a <__rt_uart_open+0x12>
1c00b49a:	4785                	li	a5,1
1c00b49c:	1a102737          	lui	a4,0x1a102
1c00b4a0:	c01c                	sw	a5,0(s0)
1c00b4a2:	c048                	sw	a0,4(s0)
1c00b4a4:	c414                	sw	a3,8(s0)
1c00b4a6:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa100f6c>
1c00b4aa:	00a797b3          	sll	a5,a5,a0
1c00b4ae:	00151493          	slli	s1,a0,0x1
1c00b4b2:	8fd5                	or	a5,a5,a3
1c00b4b4:	78f72023          	sw	a5,1920(a4)
1c00b4b8:	8526                	mv	a0,s1
1c00b4ba:	3fa9                	jal	1c00b414 <soc_eu_fcEventMask_setEvent>
1c00b4bc:	00148513          	addi	a0,s1,1
1c00b4c0:	3f91                	jal	1c00b414 <soc_eu_fcEventMask_setEvent>
1c00b4c2:	4408                	lw	a0,8(s0)
1c00b4c4:	3d2d                	jal	1c00b2fe <__rt_uart_setup.isra.6>
1c00b4c6:	30091073          	csrw	mstatus,s2
1c00b4ca:	bf65                	j	1c00b482 <__rt_uart_open+0x3a>
1c00b4cc:	4401                	li	s0,0
1c00b4ce:	bf55                	j	1c00b482 <__rt_uart_open+0x3a>

1c00b4d0 <rt_uart_close>:
1c00b4d0:	1141                	addi	sp,sp,-16
1c00b4d2:	c606                	sw	ra,12(sp)
1c00b4d4:	c422                	sw	s0,8(sp)
1c00b4d6:	c226                	sw	s1,4(sp)
1c00b4d8:	300474f3          	csrrci	s1,mstatus,8
1c00b4dc:	411c                	lw	a5,0(a0)
1c00b4de:	17fd                	addi	a5,a5,-1
1c00b4e0:	c11c                	sw	a5,0(a0)
1c00b4e2:	e78d                	bnez	a5,1c00b50c <rt_uart_close+0x3c>
1c00b4e4:	842a                	mv	s0,a0
1c00b4e6:	3d79                	jal	1c00b384 <__rt_uart_wait_tx_done.isra.5>
1c00b4e8:	005007b7          	lui	a5,0x500
1c00b4ec:	1a102737          	lui	a4,0x1a102
1c00b4f0:	0799                	addi	a5,a5,6
1c00b4f2:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100990>
1c00b4f6:	4050                	lw	a2,4(s0)
1c00b4f8:	78072683          	lw	a3,1920(a4)
1c00b4fc:	4785                	li	a5,1
1c00b4fe:	00c797b3          	sll	a5,a5,a2
1c00b502:	fff7c793          	not	a5,a5
1c00b506:	8ff5                	and	a5,a5,a3
1c00b508:	78f72023          	sw	a5,1920(a4)
1c00b50c:	30049073          	csrw	mstatus,s1
1c00b510:	40b2                	lw	ra,12(sp)
1c00b512:	4422                	lw	s0,8(sp)
1c00b514:	4492                	lw	s1,4(sp)
1c00b516:	0141                	addi	sp,sp,16
1c00b518:	8082                	ret

1c00b51a <rt_uart_cluster_write>:
1c00b51a:	f14027f3          	csrr	a5,mhartid
1c00b51e:	8795                	srai	a5,a5,0x5
1c00b520:	03f7f793          	andi	a5,a5,63
1c00b524:	08f68ca3          	sb	a5,153(a3)
1c00b528:	1c00b7b7          	lui	a5,0x1c00b
1c00b52c:	34278793          	addi	a5,a5,834 # 1c00b342 <__rt_uart_cluster_req>
1c00b530:	c6dc                	sw	a5,12(a3)
1c00b532:	4785                	li	a5,1
1c00b534:	c288                	sw	a0,0(a3)
1c00b536:	c2cc                	sw	a1,4(a3)
1c00b538:	c690                	sw	a2,8(a3)
1c00b53a:	08068c23          	sb	zero,152(a3)
1c00b53e:	0206a823          	sw	zero,48(a3)
1c00b542:	ca94                	sw	a3,16(a3)
1c00b544:	d6dc                	sw	a5,44(a3)
1c00b546:	00c68513          	addi	a0,a3,12
1c00b54a:	ab5fd06f          	j	1c008ffe <__rt_cluster_push_fc_event>

1c00b54e <__rt_uart_init>:
1c00b54e:	1c00b5b7          	lui	a1,0x1c00b
1c00b552:	1141                	addi	sp,sp,-16
1c00b554:	4601                	li	a2,0
1c00b556:	3ea58593          	addi	a1,a1,1002 # 1c00b3ea <__rt_uart_setfreq_before>
1c00b55a:	4511                	li	a0,4
1c00b55c:	c606                	sw	ra,12(sp)
1c00b55e:	c422                	sw	s0,8(sp)
1c00b560:	8bafe0ef          	jal	ra,1c00961a <__rt_cbsys_add>
1c00b564:	1c00b5b7          	lui	a1,0x1c00b
1c00b568:	842a                	mv	s0,a0
1c00b56a:	4601                	li	a2,0
1c00b56c:	32258593          	addi	a1,a1,802 # 1c00b322 <__rt_uart_setfreq_after>
1c00b570:	4515                	li	a0,5
1c00b572:	8a8fe0ef          	jal	ra,1c00961a <__rt_cbsys_add>
1c00b576:	1c0017b7          	lui	a5,0x1c001
1c00b57a:	1807a423          	sw	zero,392(a5) # 1c001188 <__rt_uart>
1c00b57e:	8d41                	or	a0,a0,s0
1c00b580:	c105                	beqz	a0,1c00b5a0 <__rt_uart_init+0x52>
1c00b582:	f1402673          	csrr	a2,mhartid
1c00b586:	1c000537          	lui	a0,0x1c000
1c00b58a:	40565593          	srai	a1,a2,0x5
1c00b58e:	03f5f593          	andi	a1,a1,63
1c00b592:	8a7d                	andi	a2,a2,31
1c00b594:	68850513          	addi	a0,a0,1672 # 1c000688 <__DTOR_END__+0x39c>
1c00b598:	ba6ff0ef          	jal	ra,1c00a93e <printf>
1c00b59c:	b2eff0ef          	jal	ra,1c00a8ca <abort>
1c00b5a0:	40b2                	lw	ra,12(sp)
1c00b5a2:	4422                	lw	s0,8(sp)
1c00b5a4:	0141                	addi	sp,sp,16
1c00b5a6:	8082                	ret

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
