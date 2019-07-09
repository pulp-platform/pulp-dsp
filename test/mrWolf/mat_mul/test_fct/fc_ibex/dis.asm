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
1c008090:	100c                	addi	a1,sp,32
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
1c0080bc:	02028293          	addi	t0,t0,32 # 1c0010d8 <_bss_start>
1c0080c0:	ffff9317          	auipc	t1,0xffff9
1c0080c4:	17430313          	addi	t1,t1,372 # 1c001234 <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0)
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	e1e10113          	addi	sp,sp,-482 # 1c000ef0 <stack>
1c0080da:	7b3000ef          	jal	ra,1c00908c <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00000397          	auipc	t2,0x0
1c0080ea:	51e38393          	addi	t2,t2,1310 # 1c008604 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	10c010ef          	jal	ra,1c009200 <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	552020ef          	jal	ra,1c00a64c <exit>

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
1c00815e:	46260613          	addi	a2,a2,1122 # 1c0095bc <__rt_bridge_handle_notif>
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
1c008198:	06448493          	addi	s1,s1,100 # 1c0011f8 <__rt_fc_cluster_data>

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
1c0081fa:	00248493          	addi	s1,s1,2 # 1c0011f8 <__rt_fc_cluster_data>
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
1c00825e:	03650513          	addi	a0,a0,54 # 1c009290 <__rt_handle_illegal_instr>
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
1c008604:	7135                	addi	sp,sp,-160
1c008606:	c356                	sw	s5,132(sp)
1c008608:	f1402af3          	csrr	s5,mhartid
1c00860c:	405ada93          	srai	s5,s5,0x5
1c008610:	c15a                	sw	s6,128(sp)
1c008612:	dede                	sw	s7,124(sp)
1c008614:	dce2                	sw	s8,120(sp)
1c008616:	03fafa93          	andi	s5,s5,63
1c00861a:	0828                	addi	a0,sp,24
1c00861c:	1c010c37          	lui	s8,0x1c010
1c008620:	1c010bb7          	lui	s7,0x1c010
1c008624:	6b41                	lui	s6,0x10
1c008626:	cb26                	sw	s1,148(sp)
1c008628:	c94a                	sw	s2,144(sp)
1c00862a:	c74e                	sw	s3,140(sp)
1c00862c:	c552                	sw	s4,136(sp)
1c00862e:	cf06                	sw	ra,156(sp)
1c008630:	cd22                	sw	s0,152(sp)
1c008632:	dae6                	sw	s9,116(sp)
1c008634:	d8ea                	sw	s10,112(sp)
1c008636:	d6ee                	sw	s11,108(sp)
1c008638:	49a9                	li	s3,10
1c00863a:	21b000ef          	jal	ra,1c009054 <rt_perf_init>
1c00863e:	268c0c13          	addi	s8,s8,616 # 1c010268 <m_a>
1c008642:	368b8b93          	addi	s7,s7,872 # 1c010368 <m_c>
1c008646:	0b09                	addi	s6,s6,2
1c008648:	497d                	li	s2,31
1c00864a:	10200a37          	lui	s4,0x10200
1c00864e:	c456                	sw	s5,8(sp)
1c008650:	c656                	sw	s5,12(sp)
1c008652:	1c0004b7          	lui	s1,0x1c000
1c008656:	10000593          	li	a1,256
1c00865a:	4501                	li	a0,0
1c00865c:	24fd                	jal	1c00894a <rt_alloc>
1c00865e:	1c0007b7          	lui	a5,0x1c000
1c008662:	8daa                	mv	s11,a0
1c008664:	46878513          	addi	a0,a5,1128 # 1c000468 <__DTOR_END__+0x17c>
1c008668:	783010ef          	jal	ra,1c00a5ea <puts>
1c00866c:	85da                	mv	a1,s6
1c00866e:	0828                	addi	a0,sp,24
1c008670:	1f9000ef          	jal	ra,1c009068 <rt_perf_conf>
1c008674:	132a8863          	beq	s5,s2,1c0087a4 <main+0x1a0>
1c008678:	4785                	li	a5,1
1c00867a:	42fa2023          	sw	a5,1056(s4) # 10200420 <__l1_end+0x20040c>
1c00867e:	4781                	li	a5,0
1c008680:	79f79073          	csrw	pccr31,a5
1c008684:	4522                	lw	a0,8(sp)
1c008686:	11250763          	beq	a0,s2,1c008794 <main+0x190>
1c00868a:	4785                	li	a5,1
1c00868c:	40fa2c23          	sw	a5,1048(s4)
1c008690:	478d                	li	a5,3
1c008692:	7a179073          	csrw	pcmr,a5
1c008696:	1c010537          	lui	a0,0x1c010
1c00869a:	87ee                	mv	a5,s11
1c00869c:	16850593          	addi	a1,a0,360 # 1c010168 <__cluster_text_end>
1c0086a0:	4721                	li	a4,8
1c0086a2:	46a1                	li	a3,8
1c0086a4:	4621                	li	a2,8
1c0086a6:	8562                	mv	a0,s8
1c0086a8:	2a11                	jal	1c0087bc <plp_mat_mult_i32s_rv32im>
1c0086aa:	47b2                	lw	a5,12(sp)
1c0086ac:	0d278c63          	beq	a5,s2,1c008784 <main+0x180>
1c0086b0:	400a2023          	sw	zero,1024(s4)
1c0086b4:	4781                	li	a5,0
1c0086b6:	7a179073          	csrw	pcmr,a5
1c0086ba:	8d5e                	mv	s10,s7
1c0086bc:	4401                	li	s0,0
1c0086be:	04000c93          	li	s9,64
1c0086c2:	000da883          	lw	a7,0(s11)
1c0086c6:	000d2803          	lw	a6,0(s10)
1c0086ca:	85a2                	mv	a1,s0
1c0086cc:	8646                	mv	a2,a7
1c0086ce:	0405                	addi	s0,s0,1
1c0086d0:	86c2                	mv	a3,a6
1c0086d2:	47c48513          	addi	a0,s1,1148 # 1c00047c <__DTOR_END__+0x190>
1c0086d6:	01088463          	beq	a7,a6,1c0086de <main+0xda>
1c0086da:	010020ef          	jal	ra,1c00a6ea <printf>
1c0086de:	0d91                	addi	s11,s11,4
1c0086e0:	0d11                	addi	s10,s10,4
1c0086e2:	ff9410e3          	bne	s0,s9,1c0086c2 <main+0xbe>
1c0086e6:	1c0007b7          	lui	a5,0x1c000
1c0086ea:	19fd                	addi	s3,s3,-1
1c0086ec:	4b478513          	addi	a0,a5,1204 # 1c0004b4 <__DTOR_END__+0x1c8>
1c0086f0:	6fb010ef          	jal	ra,1c00a5ea <puts>
1c0086f4:	f60991e3          	bnez	s3,1c008656 <main+0x52>
1c0086f8:	f14027f3          	csrr	a5,mhartid
1c0086fc:	8795                	srai	a5,a5,0x5
1c0086fe:	03f7f793          	andi	a5,a5,63
1c008702:	477d                	li	a4,31
1c008704:	0ae78863          	beq	a5,a4,1c0087b4 <main+0x1b0>
1c008708:	102007b7          	lui	a5,0x10200
1c00870c:	4087a403          	lw	s0,1032(a5) # 10200408 <__l1_end+0x2003f4>
1c008710:	4505                	li	a0,1
1c008712:	3d39                	jal	1c008530 <cpu_perf_get>
1c008714:	892a                	mv	s2,a0
1c008716:	1c000537          	lui	a0,0x1c000
1c00871a:	85a2                	mv	a1,s0
1c00871c:	4c850513          	addi	a0,a0,1224 # 1c0004c8 <__DTOR_END__+0x1dc>
1c008720:	7cb010ef          	jal	ra,1c00a6ea <printf>
1c008724:	1c000537          	lui	a0,0x1c000
1c008728:	85ca                	mv	a1,s2
1c00872a:	4dc50513          	addi	a0,a0,1244 # 1c0004dc <__DTOR_END__+0x1f0>
1c00872e:	7bd010ef          	jal	ra,1c00a6ea <printf>
1c008732:	1c000537          	lui	a0,0x1c000
1c008736:	40000593          	li	a1,1024
1c00873a:	4f050513          	addi	a0,a0,1264 # 1c0004f0 <__DTOR_END__+0x204>
1c00873e:	7ad010ef          	jal	ra,1c00a6ea <printf>
1c008742:	64e5                	lui	s1,0x19
1c008744:	0324d5b3          	divu	a1,s1,s2
1c008748:	1c000537          	lui	a0,0x1c000
1c00874c:	50050513          	addi	a0,a0,1280 # 1c000500 <__DTOR_END__+0x214>
1c008750:	79b010ef          	jal	ra,1c00a6ea <printf>
1c008754:	0284d5b3          	divu	a1,s1,s0
1c008758:	1c000537          	lui	a0,0x1c000
1c00875c:	52050513          	addi	a0,a0,1312 # 1c000520 <__DTOR_END__+0x234>
1c008760:	78b010ef          	jal	ra,1c00a6ea <printf>
1c008764:	40fa                	lw	ra,156(sp)
1c008766:	446a                	lw	s0,152(sp)
1c008768:	44da                	lw	s1,148(sp)
1c00876a:	494a                	lw	s2,144(sp)
1c00876c:	49ba                	lw	s3,140(sp)
1c00876e:	4a2a                	lw	s4,136(sp)
1c008770:	4a9a                	lw	s5,132(sp)
1c008772:	4b0a                	lw	s6,128(sp)
1c008774:	5bf6                	lw	s7,124(sp)
1c008776:	5c66                	lw	s8,120(sp)
1c008778:	5cd6                	lw	s9,116(sp)
1c00877a:	5d46                	lw	s10,112(sp)
1c00877c:	5db6                	lw	s11,108(sp)
1c00877e:	4501                	li	a0,0
1c008780:	610d                	addi	sp,sp,160
1c008782:	8082                	ret
1c008784:	1a10b7b7          	lui	a5,0x1a10b
1c008788:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa10afec>
1c00878c:	4781                	li	a5,0
1c00878e:	7a179073          	csrw	pcmr,a5
1c008792:	b725                	j	1c0086ba <main+0xb6>
1c008794:	1a10b7b7          	lui	a5,0x1a10b
1c008798:	4705                	li	a4,1
1c00879a:	cf98                	sw	a4,24(a5)
1c00879c:	478d                	li	a5,3
1c00879e:	7a179073          	csrw	pcmr,a5
1c0087a2:	bdd5                	j	1c008696 <main+0x92>
1c0087a4:	1a10b7b7          	lui	a5,0x1a10b
1c0087a8:	4705                	li	a4,1
1c0087aa:	d398                	sw	a4,32(a5)
1c0087ac:	4781                	li	a5,0
1c0087ae:	79f79073          	csrw	pccr31,a5
1c0087b2:	bdc9                	j	1c008684 <main+0x80>
1c0087b4:	1a10b7b7          	lui	a5,0x1a10b
1c0087b8:	4780                	lw	s0,8(a5)
1c0087ba:	bf99                	j	1c008710 <main+0x10c>

1c0087bc <plp_mat_mult_i32s_rv32im>:
1c0087bc:	1101                	addi	sp,sp,-32
1c0087be:	ce22                	sw	s0,28(sp)
1c0087c0:	cc26                	sw	s1,24(sp)
1c0087c2:	ca4a                	sw	s2,20(sp)
1c0087c4:	c84e                	sw	s3,16(sp)
1c0087c6:	c652                	sw	s4,12(sp)
1c0087c8:	ca71                	beqz	a2,1c00889c <plp_mat_mult_i32s_rv32im+0xe0>
1c0087ca:	00271f93          	slli	t6,a4,0x2
1c0087ce:	00269a13          	slli	s4,a3,0x2
1c0087d2:	89be                	mv	s3,a5
1c0087d4:	842a                	mv	s0,a0
1c0087d6:	01450f33          	add	t5,a0,s4
1c0087da:	00bf84b3          	add	s1,t6,a1
1c0087de:	4901                	li	s2,0
1c0087e0:	82ae                	mv	t0,a1
1c0087e2:	83ce                	mv	t2,s3
1c0087e4:	4301                	li	t1,0
1c0087e6:	cb0d                	beqz	a4,1c008818 <plp_mat_mult_i32s_rv32im+0x5c>
1c0087e8:	4e01                	li	t3,0
1c0087ea:	ce99                	beqz	a3,1c008808 <plp_mat_mult_i32s_rv32im+0x4c>
1c0087ec:	8316                	mv	t1,t0
1c0087ee:	8822                	mv	a6,s0
1c0087f0:	4e01                	li	t3,0
1c0087f2:	00082883          	lw	a7,0(a6)
1c0087f6:	00032e83          	lw	t4,0(t1)
1c0087fa:	0811                	addi	a6,a6,4
1c0087fc:	937e                	add	t1,t1,t6
1c0087fe:	03d888b3          	mul	a7,a7,t4
1c008802:	9e46                	add	t3,t3,a7
1c008804:	ff0f17e3          	bne	t5,a6,1c0087f2 <plp_mat_mult_i32s_rv32im+0x36>
1c008808:	01c3a023          	sw	t3,0(t2)
1c00880c:	0291                	addi	t0,t0,4
1c00880e:	0391                	addi	t2,t2,4
1c008810:	fc549ce3          	bne	s1,t0,1c0087e8 <plp_mat_mult_i32s_rv32im+0x2c>
1c008814:	88b6                	mv	a7,a3
1c008816:	833a                	mv	t1,a4
1c008818:	0905                	addi	s2,s2,1
1c00881a:	99fe                	add	s3,s3,t6
1c00881c:	9452                	add	s0,s0,s4
1c00881e:	9f52                	add	t5,t5,s4
1c008820:	fd2610e3          	bne	a2,s2,1c0087e0 <plp_mat_mult_i32s_rv32im+0x24>
1c008824:	fff60e13          	addi	t3,a2,-1 # 8fffffff <pulp__FC+0x90000000>
1c008828:	fff30813          	addi	a6,t1,-1
1c00882c:	06670b63          	beq	a4,t1,1c0088a2 <plp_mat_mult_i32s_rv32im+0xe6>
1c008830:	04e87f63          	bleu	a4,a6,1c00888e <plp_mat_mult_i32s_rv32im+0xd2>
1c008834:	40000fb7          	lui	t6,0x40000
1c008838:	1ffd                	addi	t6,t6,-1
1c00883a:	9f9a                	add	t6,t6,t1
1c00883c:	02de0633          	mul	a2,t3,a3
1c008840:	002f9e93          	slli	t4,t6,0x2
1c008844:	00271893          	slli	a7,a4,0x2
1c008848:	9eae                	add	t4,t4,a1
1c00884a:	01158f33          	add	t5,a1,a7
1c00884e:	02ee0333          	mul	t1,t3,a4
1c008852:	00d60833          	add	a6,a2,a3
1c008856:	00261e13          	slli	t3,a2,0x2
1c00885a:	080a                	slli	a6,a6,0x2
1c00885c:	9e2a                	add	t3,t3,a0
1c00885e:	982a                	add	a6,a6,a0
1c008860:	937e                	add	t1,t1,t6
1c008862:	030a                	slli	t1,t1,0x2
1c008864:	933e                	add	t1,t1,a5
1c008866:	4581                	li	a1,0
1c008868:	ce89                	beqz	a3,1c008882 <plp_mat_mult_i32s_rv32im+0xc6>
1c00886a:	8676                	mv	a2,t4
1c00886c:	87f2                	mv	a5,t3
1c00886e:	4581                	li	a1,0
1c008870:	4398                	lw	a4,0(a5)
1c008872:	4208                	lw	a0,0(a2)
1c008874:	0791                	addi	a5,a5,4
1c008876:	9646                	add	a2,a2,a7
1c008878:	02a70733          	mul	a4,a4,a0
1c00887c:	95ba                	add	a1,a1,a4
1c00887e:	ff0799e3          	bne	a5,a6,1c008870 <plp_mat_mult_i32s_rv32im+0xb4>
1c008882:	00b32023          	sw	a1,0(t1)
1c008886:	0e91                	addi	t4,t4,4
1c008888:	0311                	addi	t1,t1,4
1c00888a:	fddf1ee3          	bne	t5,t4,1c008866 <plp_mat_mult_i32s_rv32im+0xaa>
1c00888e:	4472                	lw	s0,28(sp)
1c008890:	44e2                	lw	s1,24(sp)
1c008892:	4952                	lw	s2,20(sp)
1c008894:	49c2                	lw	s3,16(sp)
1c008896:	4a32                	lw	s4,12(sp)
1c008898:	6105                	addi	sp,sp,32
1c00889a:	8082                	ret
1c00889c:	4301                	li	t1,0
1c00889e:	fee318e3          	bne	t1,a4,1c00888e <plp_mat_mult_i32s_rv32im+0xd2>
1c0088a2:	ff1686e3          	beq	a3,a7,1c00888e <plp_mat_mult_i32s_rv32im+0xd2>
1c0088a6:	fff60e13          	addi	t3,a2,-1
1c0088aa:	fff30813          	addi	a6,t1,-1
1c0088ae:	f8ce61e3          	bltu	t3,a2,1c008830 <plp_mat_mult_i32s_rv32im+0x74>
1c0088b2:	bff1                	j	1c00888e <plp_mat_mult_i32s_rv32im+0xd2>

1c0088b4 <rt_user_alloc_init>:
1c0088b4:	00758793          	addi	a5,a1,7
1c0088b8:	9be1                	andi	a5,a5,-8
1c0088ba:	40b785b3          	sub	a1,a5,a1
1c0088be:	c11c                	sw	a5,0(a0)
1c0088c0:	8e0d                	sub	a2,a2,a1
1c0088c2:	00c05663          	blez	a2,1c0088ce <rt_user_alloc_init+0x1a>
1c0088c6:	9a61                	andi	a2,a2,-8
1c0088c8:	c390                	sw	a2,0(a5)
1c0088ca:	0007a223          	sw	zero,4(a5) # 1a10b004 <__l1_end+0xa10aff0>
1c0088ce:	8082                	ret

1c0088d0 <rt_user_alloc>:
1c0088d0:	411c                	lw	a5,0(a0)
1c0088d2:	059d                	addi	a1,a1,7
1c0088d4:	99e1                	andi	a1,a1,-8
1c0088d6:	4681                	li	a3,0
1c0088d8:	cb89                	beqz	a5,1c0088ea <rt_user_alloc+0x1a>
1c0088da:	4398                	lw	a4,0(a5)
1c0088dc:	00b74963          	blt	a4,a1,1c0088ee <rt_user_alloc+0x1e>
1c0088e0:	00b71c63          	bne	a4,a1,1c0088f8 <rt_user_alloc+0x28>
1c0088e4:	43d8                	lw	a4,4(a5)
1c0088e6:	c699                	beqz	a3,1c0088f4 <rt_user_alloc+0x24>
1c0088e8:	c2d8                	sw	a4,4(a3)
1c0088ea:	853e                	mv	a0,a5
1c0088ec:	8082                	ret
1c0088ee:	86be                	mv	a3,a5
1c0088f0:	43dc                	lw	a5,4(a5)
1c0088f2:	b7dd                	j	1c0088d8 <rt_user_alloc+0x8>
1c0088f4:	c118                	sw	a4,0(a0)
1c0088f6:	bfd5                	j	1c0088ea <rt_user_alloc+0x1a>
1c0088f8:	8f0d                	sub	a4,a4,a1
1c0088fa:	c398                	sw	a4,0(a5)
1c0088fc:	97ba                	add	a5,a5,a4
1c0088fe:	b7f5                	j	1c0088ea <rt_user_alloc+0x1a>

1c008900 <rt_user_free>:
1c008900:	411c                	lw	a5,0(a0)
1c008902:	061d                	addi	a2,a2,7
1c008904:	9a61                	andi	a2,a2,-8
1c008906:	4701                	li	a4,0
1c008908:	c399                	beqz	a5,1c00890e <rt_user_free+0xe>
1c00890a:	02b7e763          	bltu	a5,a1,1c008938 <rt_user_free+0x38>
1c00890e:	00c586b3          	add	a3,a1,a2
1c008912:	02d79663          	bne	a5,a3,1c00893e <rt_user_free+0x3e>
1c008916:	4394                	lw	a3,0(a5)
1c008918:	43dc                	lw	a5,4(a5)
1c00891a:	9636                	add	a2,a2,a3
1c00891c:	c190                	sw	a2,0(a1)
1c00891e:	c1dc                	sw	a5,4(a1)
1c008920:	c31d                	beqz	a4,1c008946 <rt_user_free+0x46>
1c008922:	4314                	lw	a3,0(a4)
1c008924:	00d707b3          	add	a5,a4,a3
1c008928:	00f59d63          	bne	a1,a5,1c008942 <rt_user_free+0x42>
1c00892c:	419c                	lw	a5,0(a1)
1c00892e:	97b6                	add	a5,a5,a3
1c008930:	c31c                	sw	a5,0(a4)
1c008932:	41dc                	lw	a5,4(a1)
1c008934:	c35c                	sw	a5,4(a4)
1c008936:	8082                	ret
1c008938:	873e                	mv	a4,a5
1c00893a:	43dc                	lw	a5,4(a5)
1c00893c:	b7f1                	j	1c008908 <rt_user_free+0x8>
1c00893e:	c190                	sw	a2,0(a1)
1c008940:	bff9                	j	1c00891e <rt_user_free+0x1e>
1c008942:	c34c                	sw	a1,4(a4)
1c008944:	8082                	ret
1c008946:	c10c                	sw	a1,0(a0)
1c008948:	8082                	ret

1c00894a <rt_alloc>:
1c00894a:	1101                	addi	sp,sp,-32
1c00894c:	cc22                	sw	s0,24(sp)
1c00894e:	ce06                	sw	ra,28(sp)
1c008950:	ca26                	sw	s1,20(sp)
1c008952:	c84a                	sw	s2,16(sp)
1c008954:	c64e                	sw	s3,12(sp)
1c008956:	c452                	sw	s4,8(sp)
1c008958:	4789                	li	a5,2
1c00895a:	842a                	mv	s0,a0
1c00895c:	02a7ed63          	bltu	a5,a0,1c008996 <rt_alloc+0x4c>
1c008960:	1c001937          	lui	s2,0x1c001
1c008964:	89ae                	mv	s3,a1
1c008966:	448d                	li	s1,3
1c008968:	1e890913          	addi	s2,s2,488 # 1c0011e8 <__rt_alloc_l2>
1c00896c:	4a0d                	li	s4,3
1c00896e:	00241513          	slli	a0,s0,0x2
1c008972:	85ce                	mv	a1,s3
1c008974:	954a                	add	a0,a0,s2
1c008976:	3fa9                	jal	1c0088d0 <rt_user_alloc>
1c008978:	e519                	bnez	a0,1c008986 <rt_alloc+0x3c>
1c00897a:	0405                	addi	s0,s0,1
1c00897c:	01441363          	bne	s0,s4,1c008982 <rt_alloc+0x38>
1c008980:	4401                	li	s0,0
1c008982:	14fd                	addi	s1,s1,-1
1c008984:	f4ed                	bnez	s1,1c00896e <rt_alloc+0x24>
1c008986:	40f2                	lw	ra,28(sp)
1c008988:	4462                	lw	s0,24(sp)
1c00898a:	44d2                	lw	s1,20(sp)
1c00898c:	4942                	lw	s2,16(sp)
1c00898e:	49b2                	lw	s3,12(sp)
1c008990:	4a22                	lw	s4,8(sp)
1c008992:	6105                	addi	sp,sp,32
1c008994:	8082                	ret
1c008996:	1c0017b7          	lui	a5,0x1c001
1c00899a:	ffd50413          	addi	s0,a0,-3
1c00899e:	1e47a503          	lw	a0,484(a5) # 1c0011e4 <__rt_alloc_l1>
1c0089a2:	040a                	slli	s0,s0,0x2
1c0089a4:	40f2                	lw	ra,28(sp)
1c0089a6:	9522                	add	a0,a0,s0
1c0089a8:	4462                	lw	s0,24(sp)
1c0089aa:	44d2                	lw	s1,20(sp)
1c0089ac:	4942                	lw	s2,16(sp)
1c0089ae:	49b2                	lw	s3,12(sp)
1c0089b0:	4a22                	lw	s4,8(sp)
1c0089b2:	6105                	addi	sp,sp,32
1c0089b4:	bf31                	j	1c0088d0 <rt_user_alloc>

1c0089b6 <__rt_alloc_init_l1>:
1c0089b6:	1c0017b7          	lui	a5,0x1c001
1c0089ba:	1e47a703          	lw	a4,484(a5) # 1c0011e4 <__rt_alloc_l1>
1c0089be:	100007b7          	lui	a5,0x10000
1c0089c2:	01651593          	slli	a1,a0,0x16
1c0089c6:	6641                	lui	a2,0x10
1c0089c8:	050a                	slli	a0,a0,0x2
1c0089ca:	01478793          	addi	a5,a5,20 # 10000014 <__l1_end>
1c0089ce:	fec60613          	addi	a2,a2,-20 # ffec <__l1_heap_size>
1c0089d2:	95be                	add	a1,a1,a5
1c0089d4:	953a                	add	a0,a0,a4
1c0089d6:	bdf9                	j	1c0088b4 <rt_user_alloc_init>

1c0089d8 <__rt_alloc_init_l1_for_fc>:
1c0089d8:	100005b7          	lui	a1,0x10000
1c0089dc:	01651793          	slli	a5,a0,0x16
1c0089e0:	01458593          	addi	a1,a1,20 # 10000014 <__l1_end>
1c0089e4:	00b78733          	add	a4,a5,a1
1c0089e8:	050a                	slli	a0,a0,0x2
1c0089ea:	0791                	addi	a5,a5,4
1c0089ec:	6641                	lui	a2,0x10
1c0089ee:	1c0016b7          	lui	a3,0x1c001
1c0089f2:	fe860613          	addi	a2,a2,-24 # ffe8 <__rt_hyper_pending_emu_stride+0xfd40>
1c0089f6:	95be                	add	a1,a1,a5
1c0089f8:	953a                	add	a0,a0,a4
1c0089fa:	1ee6a223          	sw	a4,484(a3) # 1c0011e4 <__rt_alloc_l1>
1c0089fe:	bd5d                	j	1c0088b4 <rt_user_alloc_init>

1c008a00 <__rt_allocs_init>:
1c008a00:	1141                	addi	sp,sp,-16
1c008a02:	1c0015b7          	lui	a1,0x1c001
1c008a06:	c606                	sw	ra,12(sp)
1c008a08:	23458793          	addi	a5,a1,564 # 1c001234 <__l2_priv0_end>
1c008a0c:	1c008637          	lui	a2,0x1c008
1c008a10:	06c7ca63          	blt	a5,a2,1c008a84 <__rt_allocs_init+0x84>
1c008a14:	4581                	li	a1,0
1c008a16:	4601                	li	a2,0
1c008a18:	1c001537          	lui	a0,0x1c001
1c008a1c:	1e850513          	addi	a0,a0,488 # 1c0011e8 <__rt_alloc_l2>
1c008a20:	3d51                	jal	1c0088b4 <rt_user_alloc_init>
1c008a22:	1c00b5b7          	lui	a1,0x1c00b
1c008a26:	35458793          	addi	a5,a1,852 # 1c00b354 <__l2_priv1_end>
1c008a2a:	1c010637          	lui	a2,0x1c010
1c008a2e:	04c7cf63          	blt	a5,a2,1c008a8c <__rt_allocs_init+0x8c>
1c008a32:	4581                	li	a1,0
1c008a34:	4601                	li	a2,0
1c008a36:	1c001537          	lui	a0,0x1c001
1c008a3a:	1ec50513          	addi	a0,a0,492 # 1c0011ec <__rt_alloc_l2+0x4>
1c008a3e:	3d9d                	jal	1c0088b4 <rt_user_alloc_init>
1c008a40:	1c0105b7          	lui	a1,0x1c010
1c008a44:	49858793          	addi	a5,a1,1176 # 1c010498 <__l2_shared_end>
1c008a48:	1c080637          	lui	a2,0x1c080
1c008a4c:	1c001537          	lui	a0,0x1c001
1c008a50:	8e1d                	sub	a2,a2,a5
1c008a52:	49858593          	addi	a1,a1,1176
1c008a56:	1f050513          	addi	a0,a0,496 # 1c0011f0 <__rt_alloc_l2+0x8>
1c008a5a:	3da9                	jal	1c0088b4 <rt_user_alloc_init>
1c008a5c:	f14027f3          	csrr	a5,mhartid
1c008a60:	8795                	srai	a5,a5,0x5
1c008a62:	03f7f793          	andi	a5,a5,63
1c008a66:	e789                	bnez	a5,1c008a70 <__rt_allocs_init+0x70>
1c008a68:	40b2                	lw	ra,12(sp)
1c008a6a:	4501                	li	a0,0
1c008a6c:	0141                	addi	sp,sp,16
1c008a6e:	b7ad                	j	1c0089d8 <__rt_alloc_init_l1_for_fc>
1c008a70:	4591                	li	a1,4
1c008a72:	4501                	li	a0,0
1c008a74:	3dd9                	jal	1c00894a <rt_alloc>
1c008a76:	40b2                	lw	ra,12(sp)
1c008a78:	1c0017b7          	lui	a5,0x1c001
1c008a7c:	1ea7a223          	sw	a0,484(a5) # 1c0011e4 <__rt_alloc_l1>
1c008a80:	0141                	addi	sp,sp,16
1c008a82:	8082                	ret
1c008a84:	8e1d                	sub	a2,a2,a5
1c008a86:	23458593          	addi	a1,a1,564
1c008a8a:	b779                	j	1c008a18 <__rt_allocs_init+0x18>
1c008a8c:	8e1d                	sub	a2,a2,a5
1c008a8e:	35458593          	addi	a1,a1,852
1c008a92:	b755                	j	1c008a36 <__rt_allocs_init+0x36>

1c008a94 <__rt_init_cluster_data>:
1c008a94:	04050793          	addi	a5,a0,64
1c008a98:	01679693          	slli	a3,a5,0x16
1c008a9c:	6705                	lui	a4,0x1
1c008a9e:	177d                	addi	a4,a4,-1
1c008aa0:	00400793          	li	a5,4
1c008aa4:	8ff9                	and	a5,a5,a4
1c008aa6:	1c010737          	lui	a4,0x1c010
1c008aaa:	97b6                	add	a5,a5,a3
1c008aac:	48870713          	addi	a4,a4,1160 # 1c010488 <_l1_preload_start_inL2>
1c008ab0:	01000613          	li	a2,16
1c008ab4:	8f99                	sub	a5,a5,a4
1c008ab6:	00f705b3          	add	a1,a4,a5
1c008aba:	02c04b63          	bgtz	a2,1c008af0 <__rt_init_cluster_data+0x5c>
1c008abe:	02800713          	li	a4,40
1c008ac2:	02e50733          	mul	a4,a0,a4
1c008ac6:	1c0017b7          	lui	a5,0x1c001
1c008aca:	1f878513          	addi	a0,a5,504 # 1c0011f8 <__rt_fc_cluster_data>
1c008ace:	002017b7          	lui	a5,0x201
1c008ad2:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c008ad6:	97b6                	add	a5,a5,a3
1c008ad8:	953a                	add	a0,a0,a4
1c008ada:	c91c                	sw	a5,16(a0)
1c008adc:	6705                	lui	a4,0x1
1c008ade:	00400793          	li	a5,4
1c008ae2:	177d                	addi	a4,a4,-1
1c008ae4:	8ff9                	and	a5,a5,a4
1c008ae6:	97b6                	add	a5,a5,a3
1c008ae8:	00052423          	sw	zero,8(a0)
1c008aec:	c95c                	sw	a5,20(a0)
1c008aee:	8082                	ret
1c008af0:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008af4:	1671                	addi	a2,a2,-4
1c008af6:	0711                	addi	a4,a4,4
1c008af8:	0105a023          	sw	a6,0(a1)
1c008afc:	bf6d                	j	1c008ab6 <__rt_init_cluster_data+0x22>

1c008afe <__rt_cluster_mount_step>:
1c008afe:	7179                	addi	sp,sp,-48
1c008b00:	d04a                	sw	s2,32(sp)
1c008b02:	ce4e                	sw	s3,28(sp)
1c008b04:	6785                	lui	a5,0x1
1c008b06:	1c0089b7          	lui	s3,0x1c008
1c008b0a:	00400913          	li	s2,4
1c008b0e:	17fd                	addi	a5,a5,-1
1c008b10:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008b14:	d422                	sw	s0,40(sp)
1c008b16:	d606                	sw	ra,44(sp)
1c008b18:	d226                	sw	s1,36(sp)
1c008b1a:	cc52                	sw	s4,24(sp)
1c008b1c:	842a                	mv	s0,a0
1c008b1e:	00f97933          	and	s2,s2,a5
1c008b22:	f009f993          	andi	s3,s3,-256
1c008b26:	4c5c                	lw	a5,28(s0)
1c008b28:	4705                	li	a4,1
1c008b2a:	02e78d63          	beq	a5,a4,1c008b64 <__rt_cluster_mount_step+0x66>
1c008b2e:	4709                	li	a4,2
1c008b30:	0ae78d63          	beq	a5,a4,1c008bea <__rt_cluster_mount_step+0xec>
1c008b34:	e7dd                	bnez	a5,1c008be2 <__rt_cluster_mount_step+0xe4>
1c008b36:	5018                	lw	a4,32(s0)
1c008b38:	00042c23          	sw	zero,24(s0)
1c008b3c:	eb01                	bnez	a4,1c008b4c <__rt_cluster_mount_step+0x4e>
1c008b3e:	5048                	lw	a0,36(s0)
1c008b40:	006c                	addi	a1,sp,12
1c008b42:	c602                	sw	zero,12(sp)
1c008b44:	1e8010ef          	jal	ra,1c009d2c <__rt_pmu_cluster_power_up>
1c008b48:	47b2                	lw	a5,12(sp)
1c008b4a:	cc08                	sw	a0,24(s0)
1c008b4c:	4c58                	lw	a4,28(s0)
1c008b4e:	0705                	addi	a4,a4,1
1c008b50:	cc58                	sw	a4,28(s0)
1c008b52:	dbf1                	beqz	a5,1c008b26 <__rt_cluster_mount_step+0x28>
1c008b54:	50b2                	lw	ra,44(sp)
1c008b56:	5422                	lw	s0,40(sp)
1c008b58:	5492                	lw	s1,36(sp)
1c008b5a:	5902                	lw	s2,32(sp)
1c008b5c:	49f2                	lw	s3,28(sp)
1c008b5e:	4a62                	lw	s4,24(sp)
1c008b60:	6145                	addi	sp,sp,48
1c008b62:	8082                	ret
1c008b64:	02042a03          	lw	s4,32(s0)
1c008b68:	040a0493          	addi	s1,s4,64
1c008b6c:	04da                	slli	s1,s1,0x16
1c008b6e:	00990733          	add	a4,s2,s1
1c008b72:	00072223          	sw	zero,4(a4)
1c008b76:	00072423          	sw	zero,8(a4)
1c008b7a:	00072023          	sw	zero,0(a4)
1c008b7e:	1c001737          	lui	a4,0x1c001
1c008b82:	0cc72703          	lw	a4,204(a4) # 1c0010cc <__rt_platform>
1c008b86:	00f70f63          	beq	a4,a5,1c008ba4 <__rt_cluster_mount_step+0xa6>
1c008b8a:	4505                	li	a0,1
1c008b8c:	727000ef          	jal	ra,1c009ab2 <__rt_fll_init>
1c008b90:	1c0017b7          	lui	a5,0x1c001
1c008b94:	22878793          	addi	a5,a5,552 # 1c001228 <__rt_freq_domains>
1c008b98:	43cc                	lw	a1,4(a5)
1c008b9a:	c5b1                	beqz	a1,1c008be6 <__rt_cluster_mount_step+0xe8>
1c008b9c:	4601                	li	a2,0
1c008b9e:	4505                	li	a0,1
1c008ba0:	0a8010ef          	jal	ra,1c009c48 <rt_freq_set_and_get>
1c008ba4:	8552                	mv	a0,s4
1c008ba6:	35fd                	jal	1c008a94 <__rt_init_cluster_data>
1c008ba8:	8552                	mv	a0,s4
1c008baa:	3531                	jal	1c0089b6 <__rt_alloc_init_l1>
1c008bac:	002017b7          	lui	a5,0x201
1c008bb0:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1414>
1c008bb4:	97a6                	add	a5,a5,s1
1c008bb6:	577d                	li	a4,-1
1c008bb8:	c398                	sw	a4,0(a5)
1c008bba:	002007b7          	lui	a5,0x200
1c008bbe:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f0054>
1c008bc2:	06078793          	addi	a5,a5,96
1c008bc6:	9726                	add	a4,a4,s1
1c008bc8:	97a6                	add	a5,a5,s1
1c008bca:	01372023          	sw	s3,0(a4)
1c008bce:	0711                	addi	a4,a4,4
1c008bd0:	fef71de3          	bne	a4,a5,1c008bca <__rt_cluster_mount_step+0xcc>
1c008bd4:	002007b7          	lui	a5,0x200
1c008bd8:	07a1                	addi	a5,a5,8
1c008bda:	94be                	add	s1,s1,a5
1c008bdc:	0ff00793          	li	a5,255
1c008be0:	c09c                	sw	a5,0(s1)
1c008be2:	4781                	li	a5,0
1c008be4:	b7a5                	j	1c008b4c <__rt_cluster_mount_step+0x4e>
1c008be6:	c3c8                	sw	a0,4(a5)
1c008be8:	bf75                	j	1c008ba4 <__rt_cluster_mount_step+0xa6>
1c008bea:	505c                	lw	a5,36(s0)
1c008bec:	5b98                	lw	a4,48(a5)
1c008bee:	d398                	sw	a4,32(a5)
1c008bf0:	5798                	lw	a4,40(a5)
1c008bf2:	c398                	sw	a4,0(a5)
1c008bf4:	57d8                	lw	a4,44(a5)
1c008bf6:	c3d8                	sw	a4,4(a5)
1c008bf8:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f0044>
1c008bfc:	505c                	lw	a5,36(s0)
1c008bfe:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008c02:	0007ac23          	sw	zero,24(a5)
1c008c06:	cb01                	beqz	a4,1c008c16 <__rt_cluster_mount_step+0x118>
1c008c08:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008c0c:	cf1c                	sw	a5,24(a4)
1c008c0e:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008c12:	4785                	li	a5,1
1c008c14:	bf25                	j	1c008b4c <__rt_cluster_mount_step+0x4e>
1c008c16:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008c1a:	bfd5                	j	1c008c0e <__rt_cluster_mount_step+0x110>

1c008c1c <__rt_cluster_init>:
1c008c1c:	1c001537          	lui	a0,0x1c001
1c008c20:	1141                	addi	sp,sp,-16
1c008c22:	02800613          	li	a2,40
1c008c26:	4581                	li	a1,0
1c008c28:	1f850513          	addi	a0,a0,504 # 1c0011f8 <__rt_fc_cluster_data>
1c008c2c:	c606                	sw	ra,12(sp)
1c008c2e:	071010ef          	jal	ra,1c00a49e <memset>
1c008c32:	1c0085b7          	lui	a1,0x1c008
1c008c36:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008c3a:	4505                	li	a0,1
1c008c3c:	2bfd                	jal	1c00923a <rt_irq_set_handler>
1c008c3e:	f14027f3          	csrr	a5,mhartid
1c008c42:	8795                	srai	a5,a5,0x5
1c008c44:	03f7f793          	andi	a5,a5,63
1c008c48:	477d                	li	a4,31
1c008c4a:	02e79e63          	bne	a5,a4,1c008c86 <__rt_cluster_init+0x6a>
1c008c4e:	1a10a7b7          	lui	a5,0x1a10a
1c008c52:	4709                	li	a4,2
1c008c54:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c008c58:	1c0085b7          	lui	a1,0x1c008
1c008c5c:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008c60:	4511                	li	a0,4
1c008c62:	2be1                	jal	1c00923a <rt_irq_set_handler>
1c008c64:	f14027f3          	csrr	a5,mhartid
1c008c68:	8795                	srai	a5,a5,0x5
1c008c6a:	03f7f793          	andi	a5,a5,63
1c008c6e:	477d                	li	a4,31
1c008c70:	02e79063          	bne	a5,a4,1c008c90 <__rt_cluster_init+0x74>
1c008c74:	1a10a7b7          	lui	a5,0x1a10a
1c008c78:	4741                	li	a4,16
1c008c7a:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c008c7e:	40b2                	lw	ra,12(sp)
1c008c80:	4501                	li	a0,0
1c008c82:	0141                	addi	sp,sp,16
1c008c84:	8082                	ret
1c008c86:	002047b7          	lui	a5,0x204
1c008c8a:	4709                	li	a4,2
1c008c8c:	cbd8                	sw	a4,20(a5)
1c008c8e:	b7e9                	j	1c008c58 <__rt_cluster_init+0x3c>
1c008c90:	002047b7          	lui	a5,0x204
1c008c94:	4741                	li	a4,16
1c008c96:	cbd8                	sw	a4,20(a5)
1c008c98:	b7dd                	j	1c008c7e <__rt_cluster_init+0x62>

1c008c9a <pi_cluster_conf_init>:
1c008c9a:	00052223          	sw	zero,4(a0)
1c008c9e:	8082                	ret

1c008ca0 <pi_cluster_open>:
1c008ca0:	1101                	addi	sp,sp,-32
1c008ca2:	ce06                	sw	ra,28(sp)
1c008ca4:	cc22                	sw	s0,24(sp)
1c008ca6:	ca26                	sw	s1,20(sp)
1c008ca8:	c84a                	sw	s2,16(sp)
1c008caa:	c64e                	sw	s3,12(sp)
1c008cac:	30047973          	csrrci	s2,mstatus,8
1c008cb0:	00452983          	lw	s3,4(a0)
1c008cb4:	02800793          	li	a5,40
1c008cb8:	0049a483          	lw	s1,4(s3)
1c008cbc:	02f484b3          	mul	s1,s1,a5
1c008cc0:	1c0017b7          	lui	a5,0x1c001
1c008cc4:	1f878793          	addi	a5,a5,504 # 1c0011f8 <__rt_fc_cluster_data>
1c008cc8:	94be                	add	s1,s1,a5
1c008cca:	c504                	sw	s1,8(a0)
1c008ccc:	3b7000ef          	jal	ra,1c009882 <__rt_wait_event_prepare_blocking>
1c008cd0:	f14027f3          	csrr	a5,mhartid
1c008cd4:	8795                	srai	a5,a5,0x5
1c008cd6:	03f7f793          	andi	a5,a5,63
1c008cda:	477d                	li	a4,31
1c008cdc:	842a                	mv	s0,a0
1c008cde:	04e79463          	bne	a5,a4,1c008d26 <pi_cluster_open+0x86>
1c008ce2:	511c                	lw	a5,32(a0)
1c008ce4:	0004ae23          	sw	zero,28(s1) # 1901c <__l1_heap_size+0x9030>
1c008ce8:	d0c8                	sw	a0,36(s1)
1c008cea:	d91c                	sw	a5,48(a0)
1c008cec:	411c                	lw	a5,0(a0)
1c008cee:	02052223          	sw	zero,36(a0)
1c008cf2:	d51c                	sw	a5,40(a0)
1c008cf4:	415c                	lw	a5,4(a0)
1c008cf6:	c144                	sw	s1,4(a0)
1c008cf8:	d55c                	sw	a5,44(a0)
1c008cfa:	1c0097b7          	lui	a5,0x1c009
1c008cfe:	afe78793          	addi	a5,a5,-1282 # 1c008afe <__rt_cluster_mount_step>
1c008d02:	c11c                	sw	a5,0(a0)
1c008d04:	4785                	li	a5,1
1c008d06:	d11c                	sw	a5,32(a0)
1c008d08:	8526                	mv	a0,s1
1c008d0a:	3bd5                	jal	1c008afe <__rt_cluster_mount_step>
1c008d0c:	8522                	mv	a0,s0
1c008d0e:	4c5000ef          	jal	ra,1c0099d2 <__rt_wait_event>
1c008d12:	30091073          	csrw	mstatus,s2
1c008d16:	40f2                	lw	ra,28(sp)
1c008d18:	4462                	lw	s0,24(sp)
1c008d1a:	44d2                	lw	s1,20(sp)
1c008d1c:	4942                	lw	s2,16(sp)
1c008d1e:	49b2                	lw	s3,12(sp)
1c008d20:	4501                	li	a0,0
1c008d22:	6105                	addi	sp,sp,32
1c008d24:	8082                	ret
1c008d26:	0049a483          	lw	s1,4(s3)
1c008d2a:	8526                	mv	a0,s1
1c008d2c:	33a5                	jal	1c008a94 <__rt_init_cluster_data>
1c008d2e:	04048513          	addi	a0,s1,64
1c008d32:	002017b7          	lui	a5,0x201
1c008d36:	055a                	slli	a0,a0,0x16
1c008d38:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1414>
1c008d3c:	97aa                	add	a5,a5,a0
1c008d3e:	577d                	li	a4,-1
1c008d40:	c398                	sw	a4,0(a5)
1c008d42:	1c0086b7          	lui	a3,0x1c008
1c008d46:	002007b7          	lui	a5,0x200
1c008d4a:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f0058>
1c008d4e:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c008d52:	06078793          	addi	a5,a5,96
1c008d56:	972a                	add	a4,a4,a0
1c008d58:	97aa                	add	a5,a5,a0
1c008d5a:	f006f693          	andi	a3,a3,-256
1c008d5e:	c314                	sw	a3,0(a4)
1c008d60:	0711                	addi	a4,a4,4
1c008d62:	fef71ee3          	bne	a4,a5,1c008d5e <pi_cluster_open+0xbe>
1c008d66:	002007b7          	lui	a5,0x200
1c008d6a:	07a1                	addi	a5,a5,8
1c008d6c:	953e                	add	a0,a0,a5
1c008d6e:	57fd                	li	a5,-1
1c008d70:	c11c                	sw	a5,0(a0)
1c008d72:	8522                	mv	a0,s0
1c008d74:	3db000ef          	jal	ra,1c00994e <rt_event_push>
1c008d78:	bf51                	j	1c008d0c <pi_cluster_open+0x6c>

1c008d7a <pi_cluster_close>:
1c008d7a:	451c                	lw	a5,8(a0)
1c008d7c:	1101                	addi	sp,sp,-32
1c008d7e:	cc22                	sw	s0,24(sp)
1c008d80:	5380                	lw	s0,32(a5)
1c008d82:	1c0017b7          	lui	a5,0x1c001
1c008d86:	0cc7a703          	lw	a4,204(a5) # 1c0010cc <__rt_platform>
1c008d8a:	ce06                	sw	ra,28(sp)
1c008d8c:	4785                	li	a5,1
1c008d8e:	00f70563          	beq	a4,a5,1c008d98 <pi_cluster_close+0x1e>
1c008d92:	4505                	li	a0,1
1c008d94:	5d5000ef          	jal	ra,1c009b68 <__rt_fll_deinit>
1c008d98:	c602                	sw	zero,12(sp)
1c008d9a:	e409                	bnez	s0,1c008da4 <pi_cluster_close+0x2a>
1c008d9c:	006c                	addi	a1,sp,12
1c008d9e:	4501                	li	a0,0
1c008da0:	749000ef          	jal	ra,1c009ce8 <__rt_pmu_cluster_power_down>
1c008da4:	40f2                	lw	ra,28(sp)
1c008da6:	4462                	lw	s0,24(sp)
1c008da8:	4501                	li	a0,0
1c008daa:	6105                	addi	sp,sp,32
1c008dac:	8082                	ret

1c008dae <__rt_cluster_push_fc_event>:
1c008dae:	002047b7          	lui	a5,0x204
1c008db2:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f40d4>
1c008db6:	0007e703          	p.elw	a4,0(a5)
1c008dba:	f14027f3          	csrr	a5,mhartid
1c008dbe:	8795                	srai	a5,a5,0x5
1c008dc0:	02800693          	li	a3,40
1c008dc4:	03f7f793          	andi	a5,a5,63
1c008dc8:	02d787b3          	mul	a5,a5,a3
1c008dcc:	1c001737          	lui	a4,0x1c001
1c008dd0:	1f870713          	addi	a4,a4,504 # 1c0011f8 <__rt_fc_cluster_data>
1c008dd4:	4689                	li	a3,2
1c008dd6:	97ba                	add	a5,a5,a4
1c008dd8:	00204737          	lui	a4,0x204
1c008ddc:	43d0                	lw	a2,4(a5)
1c008dde:	ee01                	bnez	a2,1c008df6 <__rt_cluster_push_fc_event+0x48>
1c008de0:	c3c8                	sw	a0,4(a5)
1c008de2:	4709                	li	a4,2
1c008de4:	1a10a7b7          	lui	a5,0x1a10a
1c008de8:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1097fc>
1c008dec:	002047b7          	lui	a5,0x204
1c008df0:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f40d4>
1c008df4:	8082                	ret
1c008df6:	c714                	sw	a3,8(a4)
1c008df8:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c008dfc:	c354                	sw	a3,4(a4)
1c008dfe:	bff9                	j	1c008ddc <__rt_cluster_push_fc_event+0x2e>

1c008e00 <__rt_cluster_new>:
1c008e00:	1c0095b7          	lui	a1,0x1c009
1c008e04:	1141                	addi	sp,sp,-16
1c008e06:	4601                	li	a2,0
1c008e08:	c1c58593          	addi	a1,a1,-996 # 1c008c1c <__rt_cluster_init>
1c008e0c:	4501                	li	a0,0
1c008e0e:	c606                	sw	ra,12(sp)
1c008e10:	2b6d                	jal	1c0093ca <__rt_cbsys_add>
1c008e12:	c105                	beqz	a0,1c008e32 <__rt_cluster_new+0x32>
1c008e14:	f1402673          	csrr	a2,mhartid
1c008e18:	1c000537          	lui	a0,0x1c000
1c008e1c:	40565593          	srai	a1,a2,0x5
1c008e20:	03f5f593          	andi	a1,a1,63
1c008e24:	8a7d                	andi	a2,a2,31
1c008e26:	54850513          	addi	a0,a0,1352 # 1c000548 <__DTOR_END__+0x25c>
1c008e2a:	0c1010ef          	jal	ra,1c00a6ea <printf>
1c008e2e:	049010ef          	jal	ra,1c00a676 <abort>
1c008e32:	40b2                	lw	ra,12(sp)
1c008e34:	0141                	addi	sp,sp,16
1c008e36:	8082                	ret

1c008e38 <__rt_cluster_pulpos_emu_init>:
1c008e38:	1141                	addi	sp,sp,-16
1c008e3a:	45b1                	li	a1,12
1c008e3c:	4501                	li	a0,0
1c008e3e:	c606                	sw	ra,12(sp)
1c008e40:	3629                	jal	1c00894a <rt_alloc>
1c008e42:	1c0017b7          	lui	a5,0x1c001
1c008e46:	1aa7ac23          	sw	a0,440(a5) # 1c0011b8 <__rt_fc_cluster_device>
1c008e4a:	e105                	bnez	a0,1c008e6a <__rt_cluster_pulpos_emu_init+0x32>
1c008e4c:	f1402673          	csrr	a2,mhartid
1c008e50:	1c000537          	lui	a0,0x1c000
1c008e54:	40565593          	srai	a1,a2,0x5
1c008e58:	03f5f593          	andi	a1,a1,63
1c008e5c:	8a7d                	andi	a2,a2,31
1c008e5e:	59050513          	addi	a0,a0,1424 # 1c000590 <__DTOR_END__+0x2a4>
1c008e62:	089010ef          	jal	ra,1c00a6ea <printf>
1c008e66:	011010ef          	jal	ra,1c00a676 <abort>
1c008e6a:	40b2                	lw	ra,12(sp)
1c008e6c:	0141                	addi	sp,sp,16
1c008e6e:	8082                	ret

1c008e70 <rt_cluster_call>:
1c008e70:	7139                	addi	sp,sp,-64
1c008e72:	d84a                	sw	s2,48(sp)
1c008e74:	4906                	lw	s2,64(sp)
1c008e76:	dc22                	sw	s0,56(sp)
1c008e78:	842e                	mv	s0,a1
1c008e7a:	de06                	sw	ra,60(sp)
1c008e7c:	da26                	sw	s1,52(sp)
1c008e7e:	d64e                	sw	s3,44(sp)
1c008e80:	300479f3          	csrrci	s3,mstatus,8
1c008e84:	84ca                	mv	s1,s2
1c008e86:	02091163          	bnez	s2,1c008ea8 <rt_cluster_call+0x38>
1c008e8a:	ce32                	sw	a2,28(sp)
1c008e8c:	cc36                	sw	a3,24(sp)
1c008e8e:	ca3a                	sw	a4,20(sp)
1c008e90:	c83e                	sw	a5,16(sp)
1c008e92:	c642                	sw	a6,12(sp)
1c008e94:	c446                	sw	a7,8(sp)
1c008e96:	1ed000ef          	jal	ra,1c009882 <__rt_wait_event_prepare_blocking>
1c008e9a:	48a2                	lw	a7,8(sp)
1c008e9c:	4832                	lw	a6,12(sp)
1c008e9e:	47c2                	lw	a5,16(sp)
1c008ea0:	4752                	lw	a4,20(sp)
1c008ea2:	46e2                	lw	a3,24(sp)
1c008ea4:	4672                	lw	a2,28(sp)
1c008ea6:	84aa                	mv	s1,a0
1c008ea8:	4531                	li	a0,12
1c008eaa:	02a40433          	mul	s0,s0,a0
1c008eae:	1c0015b7          	lui	a1,0x1c001
1c008eb2:	0f058313          	addi	t1,a1,240 # 1c0010f0 <__rt_pulpos_emu_global_cluster_task>
1c008eb6:	00f32623          	sw	a5,12(t1)
1c008eba:	1c0017b7          	lui	a5,0x1c001
1c008ebe:	1b87a503          	lw	a0,440(a5) # 1c0011b8 <__rt_fc_cluster_device>
1c008ec2:	00c32023          	sw	a2,0(t1)
1c008ec6:	0f058593          	addi	a1,a1,240
1c008eca:	8626                	mv	a2,s1
1c008ecc:	00d32223          	sw	a3,4(t1)
1c008ed0:	9522                	add	a0,a0,s0
1c008ed2:	00e32423          	sw	a4,8(t1)
1c008ed6:	01032823          	sw	a6,16(t1)
1c008eda:	01132a23          	sw	a7,20(t1)
1c008ede:	2041                	jal	1c008f5e <pi_cluster_send_task_to_cl_async>
1c008ee0:	842a                	mv	s0,a0
1c008ee2:	cd01                	beqz	a0,1c008efa <rt_cluster_call+0x8a>
1c008ee4:	30099073          	csrw	mstatus,s3
1c008ee8:	547d                	li	s0,-1
1c008eea:	8522                	mv	a0,s0
1c008eec:	50f2                	lw	ra,60(sp)
1c008eee:	5462                	lw	s0,56(sp)
1c008ef0:	54d2                	lw	s1,52(sp)
1c008ef2:	5942                	lw	s2,48(sp)
1c008ef4:	59b2                	lw	s3,44(sp)
1c008ef6:	6121                	addi	sp,sp,64
1c008ef8:	8082                	ret
1c008efa:	00091563          	bnez	s2,1c008f04 <rt_cluster_call+0x94>
1c008efe:	8526                	mv	a0,s1
1c008f00:	2d3000ef          	jal	ra,1c0099d2 <__rt_wait_event>
1c008f04:	30099073          	csrw	mstatus,s3
1c008f08:	b7cd                	j	1c008eea <rt_cluster_call+0x7a>

1c008f0a <rt_cluster_mount>:
1c008f0a:	7139                	addi	sp,sp,-64
1c008f0c:	dc22                	sw	s0,56(sp)
1c008f0e:	da26                	sw	s1,52(sp)
1c008f10:	d84a                	sw	s2,48(sp)
1c008f12:	4431                	li	s0,12
1c008f14:	1c0014b7          	lui	s1,0x1c001
1c008f18:	de06                	sw	ra,60(sp)
1c008f1a:	d64e                	sw	s3,44(sp)
1c008f1c:	8936                	mv	s2,a3
1c008f1e:	02858433          	mul	s0,a1,s0
1c008f22:	1b848493          	addi	s1,s1,440 # 1c0011b8 <__rt_fc_cluster_device>
1c008f26:	c905                	beqz	a0,1c008f56 <rt_cluster_mount+0x4c>
1c008f28:	0068                	addi	a0,sp,12
1c008f2a:	89ae                	mv	s3,a1
1c008f2c:	33bd                	jal	1c008c9a <pi_cluster_conf_init>
1c008f2e:	4088                	lw	a0,0(s1)
1c008f30:	006c                	addi	a1,sp,12
1c008f32:	9522                	add	a0,a0,s0
1c008f34:	2609                	jal	1c009236 <pi_open_from_conf>
1c008f36:	4088                	lw	a0,0(s1)
1c008f38:	c84e                	sw	s3,16(sp)
1c008f3a:	9522                	add	a0,a0,s0
1c008f3c:	3395                	jal	1c008ca0 <pi_cluster_open>
1c008f3e:	00090563          	beqz	s2,1c008f48 <rt_cluster_mount+0x3e>
1c008f42:	854a                	mv	a0,s2
1c008f44:	20b000ef          	jal	ra,1c00994e <rt_event_push>
1c008f48:	50f2                	lw	ra,60(sp)
1c008f4a:	5462                	lw	s0,56(sp)
1c008f4c:	54d2                	lw	s1,52(sp)
1c008f4e:	5942                	lw	s2,48(sp)
1c008f50:	59b2                	lw	s3,44(sp)
1c008f52:	6121                	addi	sp,sp,64
1c008f54:	8082                	ret
1c008f56:	4088                	lw	a0,0(s1)
1c008f58:	9522                	add	a0,a0,s0
1c008f5a:	3505                	jal	1c008d7a <pi_cluster_close>
1c008f5c:	b7cd                	j	1c008f3e <rt_cluster_mount+0x34>

1c008f5e <pi_cluster_send_task_to_cl_async>:
1c008f5e:	1101                	addi	sp,sp,-32
1c008f60:	ca26                	sw	s1,20(sp)
1c008f62:	4504                	lw	s1,8(a0)
1c008f64:	cc22                	sw	s0,24(sp)
1c008f66:	c256                	sw	s5,4(sp)
1c008f68:	842e                	mv	s0,a1
1c008f6a:	8ab2                	mv	s5,a2
1c008f6c:	ce06                	sw	ra,28(sp)
1c008f6e:	c84a                	sw	s2,16(sp)
1c008f70:	c64e                	sw	s3,12(sp)
1c008f72:	c452                	sw	s4,8(sp)
1c008f74:	30047a73          	csrrci	s4,mstatus,8
1c008f78:	00060823          	sb	zero,16(a2) # 1c080010 <__l2_shared_end+0x6fb78>
1c008f7c:	4785                	li	a5,1
1c008f7e:	d1dc                	sw	a5,36(a1)
1c008f80:	49dc                	lw	a5,20(a1)
1c008f82:	0144a983          	lw	s3,20(s1)
1c008f86:	e399                	bnez	a5,1c008f8c <pi_cluster_send_task_to_cl_async+0x2e>
1c008f88:	47a1                	li	a5,8
1c008f8a:	c9dc                	sw	a5,20(a1)
1c008f8c:	441c                	lw	a5,8(s0)
1c008f8e:	eb8d                	bnez	a5,1c008fc0 <pi_cluster_send_task_to_cl_async+0x62>
1c008f90:	445c                	lw	a5,12(s0)
1c008f92:	e789                	bnez	a5,1c008f9c <pi_cluster_send_task_to_cl_async+0x3e>
1c008f94:	40000793          	li	a5,1024
1c008f98:	c45c                	sw	a5,12(s0)
1c008f9a:	c81c                	sw	a5,16(s0)
1c008f9c:	4818                	lw	a4,16(s0)
1c008f9e:	445c                	lw	a5,12(s0)
1c008fa0:	e311                	bnez	a4,1c008fa4 <pi_cluster_send_task_to_cl_async+0x46>
1c008fa2:	c81c                	sw	a5,16(s0)
1c008fa4:	01442903          	lw	s2,20(s0)
1c008fa8:	4818                	lw	a4,16(s0)
1c008faa:	448c                	lw	a1,8(s1)
1c008fac:	197d                	addi	s2,s2,-1
1c008fae:	02e90933          	mul	s2,s2,a4
1c008fb2:	993e                	add	s2,s2,a5
1c008fb4:	c9bd                	beqz	a1,1c00902a <pi_cluster_send_task_to_cl_async+0xcc>
1c008fb6:	44d0                	lw	a2,12(s1)
1c008fb8:	07261063          	bne	a2,s2,1c009018 <pi_cluster_send_task_to_cl_async+0xba>
1c008fbc:	449c                	lw	a5,8(s1)
1c008fbe:	c41c                	sw	a5,8(s0)
1c008fc0:	4858                	lw	a4,20(s0)
1c008fc2:	4785                	li	a5,1
1c008fc4:	01542c23          	sw	s5,24(s0)
1c008fc8:	00e797b3          	sll	a5,a5,a4
1c008fcc:	17fd                	addi	a5,a5,-1
1c008fce:	d41c                	sw	a5,40(s0)
1c008fd0:	02042023          	sw	zero,32(s0)
1c008fd4:	0089a783          	lw	a5,8(s3)
1c008fd8:	cbbd                	beqz	a5,1c00904e <pi_cluster_send_task_to_cl_async+0xf0>
1c008fda:	d380                	sw	s0,32(a5)
1c008fdc:	0089a423          	sw	s0,8(s3)
1c008fe0:	0009a783          	lw	a5,0(s3)
1c008fe4:	e399                	bnez	a5,1c008fea <pi_cluster_send_task_to_cl_async+0x8c>
1c008fe6:	0089a023          	sw	s0,0(s3)
1c008fea:	509c                	lw	a5,32(s1)
1c008fec:	00201737          	lui	a4,0x201
1c008ff0:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c008ff4:	04078793          	addi	a5,a5,64
1c008ff8:	07da                	slli	a5,a5,0x16
1c008ffa:	97ba                	add	a5,a5,a4
1c008ffc:	0007a023          	sw	zero,0(a5)
1c009000:	300a1073          	csrw	mstatus,s4
1c009004:	4501                	li	a0,0
1c009006:	40f2                	lw	ra,28(sp)
1c009008:	4462                	lw	s0,24(sp)
1c00900a:	44d2                	lw	s1,20(sp)
1c00900c:	4942                	lw	s2,16(sp)
1c00900e:	49b2                	lw	s3,12(sp)
1c009010:	4a22                	lw	s4,8(sp)
1c009012:	4a92                	lw	s5,4(sp)
1c009014:	6105                	addi	sp,sp,32
1c009016:	8082                	ret
1c009018:	509c                	lw	a5,32(s1)
1c00901a:	1c001737          	lui	a4,0x1c001
1c00901e:	1e472503          	lw	a0,484(a4) # 1c0011e4 <__rt_alloc_l1>
1c009022:	078a                	slli	a5,a5,0x2
1c009024:	953e                	add	a0,a0,a5
1c009026:	8dbff0ef          	jal	ra,1c008900 <rt_user_free>
1c00902a:	509c                	lw	a5,32(s1)
1c00902c:	1c001737          	lui	a4,0x1c001
1c009030:	1e472503          	lw	a0,484(a4) # 1c0011e4 <__rt_alloc_l1>
1c009034:	078a                	slli	a5,a5,0x2
1c009036:	0124a623          	sw	s2,12(s1)
1c00903a:	85ca                	mv	a1,s2
1c00903c:	953e                	add	a0,a0,a5
1c00903e:	893ff0ef          	jal	ra,1c0088d0 <rt_user_alloc>
1c009042:	c488                	sw	a0,8(s1)
1c009044:	fd25                	bnez	a0,1c008fbc <pi_cluster_send_task_to_cl_async+0x5e>
1c009046:	300a1073          	csrw	mstatus,s4
1c00904a:	557d                	li	a0,-1
1c00904c:	bf6d                	j	1c009006 <pi_cluster_send_task_to_cl_async+0xa8>
1c00904e:	0089a223          	sw	s0,4(s3)
1c009052:	b769                	j	1c008fdc <pi_cluster_send_task_to_cl_async+0x7e>

1c009054 <rt_perf_init>:
1c009054:	00450793          	addi	a5,a0,4
1c009058:	04850513          	addi	a0,a0,72
1c00905c:	0007a023          	sw	zero,0(a5)
1c009060:	0791                	addi	a5,a5,4
1c009062:	fea79de3          	bne	a5,a0,1c00905c <rt_perf_init+0x8>
1c009066:	8082                	ret

1c009068 <rt_perf_conf>:
1c009068:	c10c                	sw	a1,0(a0)
1c00906a:	7a059073          	csrw	pcer,a1
1c00906e:	8082                	ret

1c009070 <cluster_start>:
1c009070:	002047b7          	lui	a5,0x204
1c009074:	00070737          	lui	a4,0x70
1c009078:	c798                	sw	a4,8(a5)
1c00907a:	0ff00713          	li	a4,255
1c00907e:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f4098>
1c009082:	20e7a023          	sw	a4,512(a5)
1c009086:	20e7a623          	sw	a4,524(a5)
1c00908a:	8082                	ret

1c00908c <__rt_init>:
1c00908c:	1101                	addi	sp,sp,-32
1c00908e:	ce06                	sw	ra,28(sp)
1c009090:	cc22                	sw	s0,24(sp)
1c009092:	23d5                	jal	1c009676 <__rt_bridge_set_available>
1c009094:	1c0017b7          	lui	a5,0x1c001
1c009098:	0cc7a703          	lw	a4,204(a5) # 1c0010cc <__rt_platform>
1c00909c:	478d                	li	a5,3
1c00909e:	02f71263          	bne	a4,a5,1c0090c2 <__rt_init+0x36>
1c0090a2:	7d005073          	csrwi	0x7d0,0
1c0090a6:	1c0007b7          	lui	a5,0x1c000
1c0090aa:	6f078793          	addi	a5,a5,1776 # 1c0006f0 <stack_start>
1c0090ae:	7d179073          	csrw	0x7d1,a5
1c0090b2:	1c0017b7          	lui	a5,0x1c001
1c0090b6:	ef078793          	addi	a5,a5,-272 # 1c000ef0 <stack>
1c0090ba:	7d279073          	csrw	0x7d2,a5
1c0090be:	7d00d073          	csrwi	0x7d0,1
1c0090c2:	2c29                	jal	1c0092dc <__rt_irq_init>
1c0090c4:	1a1067b7          	lui	a5,0x1a106
1c0090c8:	577d                	li	a4,-1
1c0090ca:	c3d8                	sw	a4,4(a5)
1c0090cc:	1c0085b7          	lui	a1,0x1c008
1c0090d0:	c798                	sw	a4,8(a5)
1c0090d2:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c0090d6:	4569                	li	a0,26
1c0090d8:	228d                	jal	1c00923a <rt_irq_set_handler>
1c0090da:	f14027f3          	csrr	a5,mhartid
1c0090de:	8795                	srai	a5,a5,0x5
1c0090e0:	03f7f793          	andi	a5,a5,63
1c0090e4:	477d                	li	a4,31
1c0090e6:	0ae79e63          	bne	a5,a4,1c0091a2 <__rt_init+0x116>
1c0090ea:	1a10a7b7          	lui	a5,0x1a10a
1c0090ee:	04000737          	lui	a4,0x4000
1c0090f2:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c0090f6:	46d000ef          	jal	ra,1c009d62 <__rt_pmu_init>
1c0090fa:	373000ef          	jal	ra,1c009c6c <__rt_freq_init>
1c0090fe:	f14027f3          	csrr	a5,mhartid
1c009102:	8795                	srai	a5,a5,0x5
1c009104:	03f7f793          	andi	a5,a5,63
1c009108:	477d                	li	a4,31
1c00910a:	00e78763          	beq	a5,a4,1c009118 <__rt_init+0x8c>
1c00910e:	002017b7          	lui	a5,0x201
1c009112:	577d                	li	a4,-1
1c009114:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f1414>
1c009118:	1c000437          	lui	s0,0x1c000
1c00911c:	2605                	jal	1c00943c <__rt_utils_init>
1c00911e:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c009122:	8dfff0ef          	jal	ra,1c008a00 <__rt_allocs_init>
1c009126:	25cd                	jal	1c009808 <__rt_thread_sched_init>
1c009128:	0ed000ef          	jal	ra,1c009a14 <__rt_event_sched_init>
1c00912c:	473000ef          	jal	ra,1c009d9e <__rt_padframe_init>
1c009130:	401c                	lw	a5,0(s0)
1c009132:	efb5                	bnez	a5,1c0091ae <__rt_init+0x122>
1c009134:	30045073          	csrwi	mstatus,8
1c009138:	4501                	li	a0,0
1c00913a:	2cc1                	jal	1c00940a <__rt_cbsys_exec>
1c00913c:	e521                	bnez	a0,1c009184 <__rt_init+0xf8>
1c00913e:	f14027f3          	csrr	a5,mhartid
1c009142:	8795                	srai	a5,a5,0x5
1c009144:	03f7f793          	andi	a5,a5,63
1c009148:	477d                	li	a4,31
1c00914a:	0ae78763          	beq	a5,a4,1c0091f8 <__rt_init+0x16c>
1c00914e:	4681                	li	a3,0
1c009150:	4601                	li	a2,0
1c009152:	4581                	li	a1,0
1c009154:	4505                	li	a0,1
1c009156:	cfb9                	beqz	a5,1c0091b4 <__rt_init+0x128>
1c009158:	3b4d                	jal	1c008f0a <rt_cluster_mount>
1c00915a:	6591                	lui	a1,0x4
1c00915c:	450d                	li	a0,3
1c00915e:	fecff0ef          	jal	ra,1c00894a <rt_alloc>
1c009162:	872a                	mv	a4,a0
1c009164:	c105                	beqz	a0,1c009184 <__rt_init+0xf8>
1c009166:	6805                	lui	a6,0x1
1c009168:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00916c:	1c009637          	lui	a2,0x1c009
1c009170:	c002                	sw	zero,0(sp)
1c009172:	48a1                	li	a7,8
1c009174:	87c2                	mv	a5,a6
1c009176:	4681                	li	a3,0
1c009178:	07060613          	addi	a2,a2,112 # 1c009070 <cluster_start>
1c00917c:	4581                	li	a1,0
1c00917e:	4501                	li	a0,0
1c009180:	39c5                	jal	1c008e70 <rt_cluster_call>
1c009182:	c93d                	beqz	a0,1c0091f8 <__rt_init+0x16c>
1c009184:	f1402673          	csrr	a2,mhartid
1c009188:	1c000537          	lui	a0,0x1c000
1c00918c:	40565593          	srai	a1,a2,0x5
1c009190:	03f5f593          	andi	a1,a1,63
1c009194:	8a7d                	andi	a2,a2,31
1c009196:	5e450513          	addi	a0,a0,1508 # 1c0005e4 <__DTOR_END__+0x2f8>
1c00919a:	550010ef          	jal	ra,1c00a6ea <printf>
1c00919e:	4d8010ef          	jal	ra,1c00a676 <abort>
1c0091a2:	002047b7          	lui	a5,0x204
1c0091a6:	04000737          	lui	a4,0x4000
1c0091aa:	cbd8                	sw	a4,20(a5)
1c0091ac:	b7a9                	j	1c0090f6 <__rt_init+0x6a>
1c0091ae:	9782                	jalr	a5
1c0091b0:	0411                	addi	s0,s0,4
1c0091b2:	bfbd                	j	1c009130 <__rt_init+0xa4>
1c0091b4:	3b99                	jal	1c008f0a <rt_cluster_mount>
1c0091b6:	6591                	lui	a1,0x4
1c0091b8:	80058593          	addi	a1,a1,-2048 # 3800 <__rt_hyper_pending_emu_stride+0x3558>
1c0091bc:	450d                	li	a0,3
1c0091be:	f8cff0ef          	jal	ra,1c00894a <rt_alloc>
1c0091c2:	d169                	beqz	a0,1c009184 <__rt_init+0xf8>
1c0091c4:	00204737          	lui	a4,0x204
1c0091c8:	0ff00793          	li	a5,255
1c0091cc:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f4098>
1c0091d0:	1c0107b7          	lui	a5,0x1c010
1c0091d4:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c0091d8:	0017e793          	ori	a5,a5,1
1c0091dc:	08f72023          	sw	a5,128(a4)
1c0091e0:	6785                	lui	a5,0x1
1c0091e2:	4462                	lw	s0,24(sp)
1c0091e4:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0091e8:	08f72023          	sw	a5,128(a4)
1c0091ec:	40f2                	lw	ra,28(sp)
1c0091ee:	08a72023          	sw	a0,128(a4)
1c0091f2:	4501                	li	a0,0
1c0091f4:	6105                	addi	sp,sp,32
1c0091f6:	bdad                	j	1c009070 <cluster_start>
1c0091f8:	40f2                	lw	ra,28(sp)
1c0091fa:	4462                	lw	s0,24(sp)
1c0091fc:	6105                	addi	sp,sp,32
1c0091fe:	8082                	ret

1c009200 <__rt_deinit>:
1c009200:	1c0017b7          	lui	a5,0x1c001
1c009204:	0cc7a703          	lw	a4,204(a5) # 1c0010cc <__rt_platform>
1c009208:	1141                	addi	sp,sp,-16
1c00920a:	c606                	sw	ra,12(sp)
1c00920c:	c422                	sw	s0,8(sp)
1c00920e:	478d                	li	a5,3
1c009210:	00f71463          	bne	a4,a5,1c009218 <__rt_deinit+0x18>
1c009214:	7d005073          	csrwi	0x7d0,0
1c009218:	4505                	li	a0,1
1c00921a:	1c000437          	lui	s0,0x1c000
1c00921e:	22f5                	jal	1c00940a <__rt_cbsys_exec>
1c009220:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c009224:	401c                	lw	a5,0(s0)
1c009226:	e789                	bnez	a5,1c009230 <__rt_deinit+0x30>
1c009228:	40b2                	lw	ra,12(sp)
1c00922a:	4422                	lw	s0,8(sp)
1c00922c:	0141                	addi	sp,sp,16
1c00922e:	8082                	ret
1c009230:	9782                	jalr	a5
1c009232:	0411                	addi	s0,s0,4
1c009234:	bfc5                	j	1c009224 <__rt_deinit+0x24>

1c009236 <pi_open_from_conf>:
1c009236:	c14c                	sw	a1,4(a0)
1c009238:	8082                	ret

1c00923a <rt_irq_set_handler>:
1c00923a:	f14027f3          	csrr	a5,mhartid
1c00923e:	8795                	srai	a5,a5,0x5
1c009240:	03f7f793          	andi	a5,a5,63
1c009244:	477d                	li	a4,31
1c009246:	04e79063          	bne	a5,a4,1c009286 <rt_irq_set_handler+0x4c>
1c00924a:	1a1047b7          	lui	a5,0x1a104
1c00924e:	43dc                	lw	a5,4(a5)
1c009250:	050a                	slli	a0,a0,0x2
1c009252:	8d89                	sub	a1,a1,a0
1c009254:	8d9d                	sub	a1,a1,a5
1c009256:	000ff737          	lui	a4,0xff
1c00925a:	00f506b3          	add	a3,a0,a5
1c00925e:	8f6d                	and	a4,a4,a1
1c009260:	0145d793          	srli	a5,a1,0x14
1c009264:	06f76713          	ori	a4,a4,111
1c009268:	07fe                	slli	a5,a5,0x1f
1c00926a:	8fd9                	or	a5,a5,a4
1c00926c:	7fe00637          	lui	a2,0x7fe00
1c009270:	01459713          	slli	a4,a1,0x14
1c009274:	8f71                	and	a4,a4,a2
1c009276:	8fd9                	or	a5,a5,a4
1c009278:	05a6                	slli	a1,a1,0x9
1c00927a:	00100737          	lui	a4,0x100
1c00927e:	8df9                	and	a1,a1,a4
1c009280:	8ddd                	or	a1,a1,a5
1c009282:	c28c                	sw	a1,0(a3)
1c009284:	8082                	ret
1c009286:	002007b7          	lui	a5,0x200
1c00928a:	43bc                	lw	a5,64(a5)
1c00928c:	b7d1                	j	1c009250 <rt_irq_set_handler+0x16>

1c00928e <illegal_insn_handler_c>:
1c00928e:	8082                	ret

1c009290 <__rt_handle_illegal_instr>:
1c009290:	1c0017b7          	lui	a5,0x1c001
1c009294:	ef47a703          	lw	a4,-268(a5) # 1c000ef4 <__rt_debug_config>
1c009298:	1141                	addi	sp,sp,-16
1c00929a:	c422                	sw	s0,8(sp)
1c00929c:	c606                	sw	ra,12(sp)
1c00929e:	8b05                	andi	a4,a4,1
1c0092a0:	843e                	mv	s0,a5
1c0092a2:	c30d                	beqz	a4,1c0092c4 <__rt_handle_illegal_instr+0x34>
1c0092a4:	341026f3          	csrr	a3,mepc
1c0092a8:	f1402673          	csrr	a2,mhartid
1c0092ac:	1c000537          	lui	a0,0x1c000
1c0092b0:	4298                	lw	a4,0(a3)
1c0092b2:	40565593          	srai	a1,a2,0x5
1c0092b6:	03f5f593          	andi	a1,a1,63
1c0092ba:	8a7d                	andi	a2,a2,31
1c0092bc:	63c50513          	addi	a0,a0,1596 # 1c00063c <__DTOR_END__+0x350>
1c0092c0:	42a010ef          	jal	ra,1c00a6ea <printf>
1c0092c4:	ef442783          	lw	a5,-268(s0)
1c0092c8:	8385                	srli	a5,a5,0x1
1c0092ca:	8b85                	andi	a5,a5,1
1c0092cc:	c399                	beqz	a5,1c0092d2 <__rt_handle_illegal_instr+0x42>
1c0092ce:	3a8010ef          	jal	ra,1c00a676 <abort>
1c0092d2:	4422                	lw	s0,8(sp)
1c0092d4:	40b2                	lw	ra,12(sp)
1c0092d6:	0141                	addi	sp,sp,16
1c0092d8:	fb7ff06f          	j	1c00928e <illegal_insn_handler_c>

1c0092dc <__rt_irq_init>:
1c0092dc:	f14027f3          	csrr	a5,mhartid
1c0092e0:	8795                	srai	a5,a5,0x5
1c0092e2:	03f7f793          	andi	a5,a5,63
1c0092e6:	477d                	li	a4,31
1c0092e8:	02e79763          	bne	a5,a4,1c009316 <__rt_irq_init+0x3a>
1c0092ec:	1a10a7b7          	lui	a5,0x1a10a
1c0092f0:	577d                	li	a4,-1
1c0092f2:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1097f4>
1c0092f6:	f14027f3          	csrr	a5,mhartid
1c0092fa:	8795                	srai	a5,a5,0x5
1c0092fc:	1c008737          	lui	a4,0x1c008
1c009300:	03f7f793          	andi	a5,a5,63
1c009304:	46fd                	li	a3,31
1c009306:	00070713          	mv	a4,a4
1c00930a:	00d79b63          	bne	a5,a3,1c009320 <__rt_irq_init+0x44>
1c00930e:	1a1047b7          	lui	a5,0x1a104
1c009312:	c3d8                	sw	a4,4(a5)
1c009314:	8082                	ret
1c009316:	002047b7          	lui	a5,0x204
1c00931a:	577d                	li	a4,-1
1c00931c:	cb98                	sw	a4,16(a5)
1c00931e:	bfe1                	j	1c0092f6 <__rt_irq_init+0x1a>
1c009320:	002007b7          	lui	a5,0x200
1c009324:	c3b8                	sw	a4,64(a5)
1c009326:	8082                	ret

1c009328 <__rt_fc_cluster_lock_req>:
1c009328:	1141                	addi	sp,sp,-16
1c00932a:	c606                	sw	ra,12(sp)
1c00932c:	c422                	sw	s0,8(sp)
1c00932e:	c226                	sw	s1,4(sp)
1c009330:	300474f3          	csrrci	s1,mstatus,8
1c009334:	09654703          	lbu	a4,150(a0)
1c009338:	411c                	lw	a5,0(a0)
1c00933a:	c729                	beqz	a4,1c009384 <__rt_fc_cluster_lock_req+0x5c>
1c00933c:	4398                	lw	a4,0(a5)
1c00933e:	c30d                	beqz	a4,1c009360 <__rt_fc_cluster_lock_req+0x38>
1c009340:	43d8                	lw	a4,4(a5)
1c009342:	cf09                	beqz	a4,1c00935c <__rt_fc_cluster_lock_req+0x34>
1c009344:	4798                	lw	a4,8(a5)
1c009346:	c348                	sw	a0,4(a4)
1c009348:	c788                	sw	a0,8(a5)
1c00934a:	00052223          	sw	zero,4(a0)
1c00934e:	30049073          	csrw	mstatus,s1
1c009352:	40b2                	lw	ra,12(sp)
1c009354:	4422                	lw	s0,8(sp)
1c009356:	4492                	lw	s1,4(sp)
1c009358:	0141                	addi	sp,sp,16
1c00935a:	8082                	ret
1c00935c:	c3c8                	sw	a0,4(a5)
1c00935e:	b7ed                	j	1c009348 <__rt_fc_cluster_lock_req+0x20>
1c009360:	4705                	li	a4,1
1c009362:	08e50a23          	sb	a4,148(a0)
1c009366:	4705                	li	a4,1
1c009368:	c398                	sw	a4,0(a5)
1c00936a:	09554783          	lbu	a5,149(a0)
1c00936e:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f0054>
1c009372:	00201737          	lui	a4,0x201
1c009376:	07da                	slli	a5,a5,0x16
1c009378:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c00937c:	97ba                	add	a5,a5,a4
1c00937e:	0007a023          	sw	zero,0(a5)
1c009382:	b7f1                	j	1c00934e <__rt_fc_cluster_lock_req+0x26>
1c009384:	842a                	mv	s0,a0
1c009386:	47c8                	lw	a0,12(a5)
1c009388:	cd01                	beqz	a0,1c0093a0 <__rt_fc_cluster_lock_req+0x78>
1c00938a:	0007a023          	sw	zero,0(a5)
1c00938e:	0007a623          	sw	zero,12(a5)
1c009392:	2185                	jal	1c0097f2 <__rt_thread_wakeup>
1c009394:	4785                	li	a5,1
1c009396:	08f40a23          	sb	a5,148(s0)
1c00939a:	09544783          	lbu	a5,149(s0)
1c00939e:	bfc1                	j	1c00936e <__rt_fc_cluster_lock_req+0x46>
1c0093a0:	43d8                	lw	a4,4(a5)
1c0093a2:	e701                	bnez	a4,1c0093aa <__rt_fc_cluster_lock_req+0x82>
1c0093a4:	0007a023          	sw	zero,0(a5)
1c0093a8:	b7f5                	j	1c009394 <__rt_fc_cluster_lock_req+0x6c>
1c0093aa:	4354                	lw	a3,4(a4)
1c0093ac:	c3d4                	sw	a3,4(a5)
1c0093ae:	4785                	li	a5,1
1c0093b0:	08f70a23          	sb	a5,148(a4)
1c0093b4:	09574783          	lbu	a5,149(a4)
1c0093b8:	00201737          	lui	a4,0x201
1c0093bc:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c0093c0:	04078793          	addi	a5,a5,64
1c0093c4:	07da                	slli	a5,a5,0x16
1c0093c6:	97ba                	add	a5,a5,a4
1c0093c8:	bff1                	j	1c0093a4 <__rt_fc_cluster_lock_req+0x7c>

1c0093ca <__rt_cbsys_add>:
1c0093ca:	1101                	addi	sp,sp,-32
1c0093cc:	cc22                	sw	s0,24(sp)
1c0093ce:	ca26                	sw	s1,20(sp)
1c0093d0:	842a                	mv	s0,a0
1c0093d2:	84ae                	mv	s1,a1
1c0093d4:	4501                	li	a0,0
1c0093d6:	45b1                	li	a1,12
1c0093d8:	c632                	sw	a2,12(sp)
1c0093da:	ce06                	sw	ra,28(sp)
1c0093dc:	d6eff0ef          	jal	ra,1c00894a <rt_alloc>
1c0093e0:	4632                	lw	a2,12(sp)
1c0093e2:	c115                	beqz	a0,1c009406 <__rt_cbsys_add+0x3c>
1c0093e4:	1c0017b7          	lui	a5,0x1c001
1c0093e8:	040a                	slli	s0,s0,0x2
1c0093ea:	ef878793          	addi	a5,a5,-264 # 1c000ef8 <cbsys_first>
1c0093ee:	97a2                	add	a5,a5,s0
1c0093f0:	4398                	lw	a4,0(a5)
1c0093f2:	c104                	sw	s1,0(a0)
1c0093f4:	c150                	sw	a2,4(a0)
1c0093f6:	c518                	sw	a4,8(a0)
1c0093f8:	c388                	sw	a0,0(a5)
1c0093fa:	4501                	li	a0,0
1c0093fc:	40f2                	lw	ra,28(sp)
1c0093fe:	4462                	lw	s0,24(sp)
1c009400:	44d2                	lw	s1,20(sp)
1c009402:	6105                	addi	sp,sp,32
1c009404:	8082                	ret
1c009406:	557d                	li	a0,-1
1c009408:	bfd5                	j	1c0093fc <__rt_cbsys_add+0x32>

1c00940a <__rt_cbsys_exec>:
1c00940a:	00251793          	slli	a5,a0,0x2
1c00940e:	1c001537          	lui	a0,0x1c001
1c009412:	ef850513          	addi	a0,a0,-264 # 1c000ef8 <cbsys_first>
1c009416:	1141                	addi	sp,sp,-16
1c009418:	953e                	add	a0,a0,a5
1c00941a:	c422                	sw	s0,8(sp)
1c00941c:	4100                	lw	s0,0(a0)
1c00941e:	c606                	sw	ra,12(sp)
1c009420:	e411                	bnez	s0,1c00942c <__rt_cbsys_exec+0x22>
1c009422:	4501                	li	a0,0
1c009424:	40b2                	lw	ra,12(sp)
1c009426:	4422                	lw	s0,8(sp)
1c009428:	0141                	addi	sp,sp,16
1c00942a:	8082                	ret
1c00942c:	401c                	lw	a5,0(s0)
1c00942e:	4048                	lw	a0,4(s0)
1c009430:	9782                	jalr	a5
1c009432:	e119                	bnez	a0,1c009438 <__rt_cbsys_exec+0x2e>
1c009434:	4400                	lw	s0,8(s0)
1c009436:	b7ed                	j	1c009420 <__rt_cbsys_exec+0x16>
1c009438:	557d                	li	a0,-1
1c00943a:	b7ed                	j	1c009424 <__rt_cbsys_exec+0x1a>

1c00943c <__rt_utils_init>:
1c00943c:	1c0017b7          	lui	a5,0x1c001
1c009440:	ef878793          	addi	a5,a5,-264 # 1c000ef8 <cbsys_first>
1c009444:	0007a023          	sw	zero,0(a5)
1c009448:	0007a223          	sw	zero,4(a5)
1c00944c:	0007a423          	sw	zero,8(a5)
1c009450:	0007a623          	sw	zero,12(a5)
1c009454:	0007a823          	sw	zero,16(a5)
1c009458:	0007aa23          	sw	zero,20(a5)
1c00945c:	8082                	ret

1c00945e <__rt_fc_lock>:
1c00945e:	1141                	addi	sp,sp,-16
1c009460:	c422                	sw	s0,8(sp)
1c009462:	842a                	mv	s0,a0
1c009464:	c606                	sw	ra,12(sp)
1c009466:	c226                	sw	s1,4(sp)
1c009468:	c04a                	sw	s2,0(sp)
1c00946a:	300474f3          	csrrci	s1,mstatus,8
1c00946e:	401c                	lw	a5,0(s0)
1c009470:	eb99                	bnez	a5,1c009486 <__rt_fc_lock+0x28>
1c009472:	4785                	li	a5,1
1c009474:	c01c                	sw	a5,0(s0)
1c009476:	30049073          	csrw	mstatus,s1
1c00947a:	40b2                	lw	ra,12(sp)
1c00947c:	4422                	lw	s0,8(sp)
1c00947e:	4492                	lw	s1,4(sp)
1c009480:	4902                	lw	s2,0(sp)
1c009482:	0141                	addi	sp,sp,16
1c009484:	8082                	ret
1c009486:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c00948a:	4585                	li	a1,1
1c00948c:	e3ff7517          	auipc	a0,0xe3ff7
1c009490:	b9c50513          	addi	a0,a0,-1124 # 28 <__rt_sched>
1c009494:	c45c                	sw	a5,12(s0)
1c009496:	29f1                	jal	1c009972 <__rt_event_execute>
1c009498:	bfd9                	j	1c00946e <__rt_fc_lock+0x10>

1c00949a <__rt_fc_unlock>:
1c00949a:	300476f3          	csrrci	a3,mstatus,8
1c00949e:	415c                	lw	a5,4(a0)
1c0094a0:	e791                	bnez	a5,1c0094ac <__rt_fc_unlock+0x12>
1c0094a2:	00052023          	sw	zero,0(a0)
1c0094a6:	30069073          	csrw	mstatus,a3
1c0094aa:	8082                	ret
1c0094ac:	43d8                	lw	a4,4(a5)
1c0094ae:	c158                	sw	a4,4(a0)
1c0094b0:	4705                	li	a4,1
1c0094b2:	08e78a23          	sb	a4,148(a5)
1c0094b6:	0957c783          	lbu	a5,149(a5)
1c0094ba:	00201737          	lui	a4,0x201
1c0094be:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c0094c2:	04078793          	addi	a5,a5,64
1c0094c6:	07da                	slli	a5,a5,0x16
1c0094c8:	97ba                	add	a5,a5,a4
1c0094ca:	0007a023          	sw	zero,0(a5)
1c0094ce:	bfe1                	j	1c0094a6 <__rt_fc_unlock+0xc>

1c0094d0 <__rt_fc_cluster_lock>:
1c0094d0:	f14027f3          	csrr	a5,mhartid
1c0094d4:	8795                	srai	a5,a5,0x5
1c0094d6:	03f7f793          	andi	a5,a5,63
1c0094da:	08f58aa3          	sb	a5,149(a1)
1c0094de:	4785                	li	a5,1
1c0094e0:	08f58b23          	sb	a5,150(a1)
1c0094e4:	1c0097b7          	lui	a5,0x1c009
1c0094e8:	32878793          	addi	a5,a5,808 # 1c009328 <__rt_fc_cluster_lock_req>
1c0094ec:	c188                	sw	a0,0(a1)
1c0094ee:	08058a23          	sb	zero,148(a1)
1c0094f2:	0205a423          	sw	zero,40(a1)
1c0094f6:	0205a623          	sw	zero,44(a1)
1c0094fa:	c59c                	sw	a5,8(a1)
1c0094fc:	c5cc                	sw	a1,12(a1)
1c0094fe:	05a1                	addi	a1,a1,8
1c009500:	0015e513          	ori	a0,a1,1
1c009504:	8abff06f          	j	1c008dae <__rt_cluster_push_fc_event>

1c009508 <__rt_fc_cluster_unlock>:
1c009508:	f14027f3          	csrr	a5,mhartid
1c00950c:	8795                	srai	a5,a5,0x5
1c00950e:	03f7f793          	andi	a5,a5,63
1c009512:	08f58aa3          	sb	a5,149(a1)
1c009516:	1c0097b7          	lui	a5,0x1c009
1c00951a:	32878793          	addi	a5,a5,808 # 1c009328 <__rt_fc_cluster_lock_req>
1c00951e:	c188                	sw	a0,0(a1)
1c009520:	08058a23          	sb	zero,148(a1)
1c009524:	08058b23          	sb	zero,150(a1)
1c009528:	0205a423          	sw	zero,40(a1)
1c00952c:	0205a623          	sw	zero,44(a1)
1c009530:	c59c                	sw	a5,8(a1)
1c009532:	c5cc                	sw	a1,12(a1)
1c009534:	05a1                	addi	a1,a1,8
1c009536:	0015e513          	ori	a0,a1,1
1c00953a:	875ff06f          	j	1c008dae <__rt_cluster_push_fc_event>

1c00953e <__rt_event_enqueue>:
1c00953e:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c009542:	00052c23          	sw	zero,24(a0)
1c009546:	c799                	beqz	a5,1c009554 <__rt_event_enqueue+0x16>
1c009548:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c00954c:	cf88                	sw	a0,24(a5)
1c00954e:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c009552:	8082                	ret
1c009554:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c009558:	bfdd                	j	1c00954e <__rt_event_enqueue+0x10>

1c00955a <__rt_bridge_check_bridge_req.part.5>:
1c00955a:	1c001737          	lui	a4,0x1c001
1c00955e:	00c70793          	addi	a5,a4,12 # 1c00100c <__hal_debug_struct>
1c009562:	0a47a783          	lw	a5,164(a5)
1c009566:	00c70713          	addi	a4,a4,12
1c00956a:	c789                	beqz	a5,1c009574 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c00956c:	4f94                	lw	a3,24(a5)
1c00956e:	e681                	bnez	a3,1c009576 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c009570:	0af72623          	sw	a5,172(a4)
1c009574:	8082                	ret
1c009576:	479c                	lw	a5,8(a5)
1c009578:	bfcd                	j	1c00956a <__rt_bridge_check_bridge_req.part.5+0x10>

1c00957a <__rt_bridge_wait>:
1c00957a:	f14027f3          	csrr	a5,mhartid
1c00957e:	8795                	srai	a5,a5,0x5
1c009580:	03f7f793          	andi	a5,a5,63
1c009584:	477d                	li	a4,31
1c009586:	02e79a63          	bne	a5,a4,1c0095ba <__rt_bridge_wait+0x40>
1c00958a:	1a10a7b7          	lui	a5,0x1a10a
1c00958e:	6711                	lui	a4,0x4
1c009590:	300476f3          	csrrci	a3,mstatus,8
1c009594:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1097f8>
1c009598:	01161593          	slli	a1,a2,0x11
1c00959c:	0005cb63          	bltz	a1,1c0095b2 <__rt_bridge_wait+0x38>
1c0095a0:	80e7a223          	sw	a4,-2044(a5)
1c0095a4:	10500073          	wfi
1c0095a8:	80e7a423          	sw	a4,-2040(a5)
1c0095ac:	30069073          	csrw	mstatus,a3
1c0095b0:	b7c5                	j	1c009590 <__rt_bridge_wait+0x16>
1c0095b2:	80e7aa23          	sw	a4,-2028(a5)
1c0095b6:	30069073          	csrw	mstatus,a3
1c0095ba:	8082                	ret

1c0095bc <__rt_bridge_handle_notif>:
1c0095bc:	1141                	addi	sp,sp,-16
1c0095be:	c422                	sw	s0,8(sp)
1c0095c0:	1c001437          	lui	s0,0x1c001
1c0095c4:	00c40793          	addi	a5,s0,12 # 1c00100c <__hal_debug_struct>
1c0095c8:	0a47a783          	lw	a5,164(a5)
1c0095cc:	c606                	sw	ra,12(sp)
1c0095ce:	c226                	sw	s1,4(sp)
1c0095d0:	c04a                	sw	s2,0(sp)
1c0095d2:	00c40413          	addi	s0,s0,12
1c0095d6:	c399                	beqz	a5,1c0095dc <__rt_bridge_handle_notif+0x20>
1c0095d8:	4bd8                	lw	a4,20(a5)
1c0095da:	e30d                	bnez	a4,1c0095fc <__rt_bridge_handle_notif+0x40>
1c0095dc:	0b442783          	lw	a5,180(s0)
1c0095e0:	c789                	beqz	a5,1c0095ea <__rt_bridge_handle_notif+0x2e>
1c0095e2:	43a8                	lw	a0,64(a5)
1c0095e4:	0a042a23          	sw	zero,180(s0)
1c0095e8:	3f99                	jal	1c00953e <__rt_event_enqueue>
1c0095ea:	0ac42783          	lw	a5,172(s0)
1c0095ee:	eb95                	bnez	a5,1c009622 <__rt_bridge_handle_notif+0x66>
1c0095f0:	4422                	lw	s0,8(sp)
1c0095f2:	40b2                	lw	ra,12(sp)
1c0095f4:	4492                	lw	s1,4(sp)
1c0095f6:	4902                	lw	s2,0(sp)
1c0095f8:	0141                	addi	sp,sp,16
1c0095fa:	b785                	j	1c00955a <__rt_bridge_check_bridge_req.part.5>
1c0095fc:	4784                	lw	s1,8(a5)
1c0095fe:	4fd8                	lw	a4,28(a5)
1c009600:	0a942223          	sw	s1,164(s0)
1c009604:	cb01                	beqz	a4,1c009614 <__rt_bridge_handle_notif+0x58>
1c009606:	0b042703          	lw	a4,176(s0)
1c00960a:	c798                	sw	a4,8(a5)
1c00960c:	0af42823          	sw	a5,176(s0)
1c009610:	87a6                	mv	a5,s1
1c009612:	b7d1                	j	1c0095d6 <__rt_bridge_handle_notif+0x1a>
1c009614:	43a8                	lw	a0,64(a5)
1c009616:	30047973          	csrrci	s2,mstatus,8
1c00961a:	3715                	jal	1c00953e <__rt_event_enqueue>
1c00961c:	30091073          	csrw	mstatus,s2
1c009620:	bfc5                	j	1c009610 <__rt_bridge_handle_notif+0x54>
1c009622:	40b2                	lw	ra,12(sp)
1c009624:	4422                	lw	s0,8(sp)
1c009626:	4492                	lw	s1,4(sp)
1c009628:	4902                	lw	s2,0(sp)
1c00962a:	0141                	addi	sp,sp,16
1c00962c:	8082                	ret

1c00962e <__rt_bridge_check_connection>:
1c00962e:	1c001737          	lui	a4,0x1c001
1c009632:	00c70713          	addi	a4,a4,12 # 1c00100c <__hal_debug_struct>
1c009636:	471c                	lw	a5,8(a4)
1c009638:	ef95                	bnez	a5,1c009674 <__rt_bridge_check_connection+0x46>
1c00963a:	1a1047b7          	lui	a5,0x1a104
1c00963e:	5bfc                	lw	a5,116(a5)
1c009640:	469d                	li	a3,7
1c009642:	83a5                	srli	a5,a5,0x9
1c009644:	8b9d                	andi	a5,a5,7
1c009646:	02d79763          	bne	a5,a3,1c009674 <__rt_bridge_check_connection+0x46>
1c00964a:	1141                	addi	sp,sp,-16
1c00964c:	c422                	sw	s0,8(sp)
1c00964e:	c226                	sw	s1,4(sp)
1c009650:	c606                	sw	ra,12(sp)
1c009652:	4785                	li	a5,1
1c009654:	c71c                	sw	a5,8(a4)
1c009656:	1a1044b7          	lui	s1,0x1a104
1c00965a:	441d                	li	s0,7
1c00965c:	58fc                	lw	a5,116(s1)
1c00965e:	83a5                	srli	a5,a5,0x9
1c009660:	8b9d                	andi	a5,a5,7
1c009662:	00878763          	beq	a5,s0,1c009670 <__rt_bridge_check_connection+0x42>
1c009666:	40b2                	lw	ra,12(sp)
1c009668:	4422                	lw	s0,8(sp)
1c00966a:	4492                	lw	s1,4(sp)
1c00966c:	0141                	addi	sp,sp,16
1c00966e:	8082                	ret
1c009670:	3729                	jal	1c00957a <__rt_bridge_wait>
1c009672:	b7ed                	j	1c00965c <__rt_bridge_check_connection+0x2e>
1c009674:	8082                	ret

1c009676 <__rt_bridge_set_available>:
1c009676:	1c0017b7          	lui	a5,0x1c001
1c00967a:	00c78793          	addi	a5,a5,12 # 1c00100c <__hal_debug_struct>
1c00967e:	479c                	lw	a5,8(a5)
1c009680:	8082                	ret

1c009682 <__rt_bridge_send_notif>:
1c009682:	1141                	addi	sp,sp,-16
1c009684:	c606                	sw	ra,12(sp)
1c009686:	3765                	jal	1c00962e <__rt_bridge_check_connection>
1c009688:	40b2                	lw	ra,12(sp)
1c00968a:	1c0017b7          	lui	a5,0x1c001
1c00968e:	00c78793          	addi	a5,a5,12 # 1c00100c <__hal_debug_struct>
1c009692:	479c                	lw	a5,8(a5)
1c009694:	0141                	addi	sp,sp,16
1c009696:	8082                	ret

1c009698 <__rt_bridge_clear_notif>:
1c009698:	1141                	addi	sp,sp,-16
1c00969a:	c606                	sw	ra,12(sp)
1c00969c:	3f49                	jal	1c00962e <__rt_bridge_check_connection>
1c00969e:	1c0017b7          	lui	a5,0x1c001
1c0096a2:	00c78793          	addi	a5,a5,12 # 1c00100c <__hal_debug_struct>
1c0096a6:	4798                	lw	a4,8(a5)
1c0096a8:	c311                	beqz	a4,1c0096ac <__rt_bridge_clear_notif+0x14>
1c0096aa:	479c                	lw	a5,8(a5)
1c0096ac:	40b2                	lw	ra,12(sp)
1c0096ae:	0141                	addi	sp,sp,16
1c0096b0:	8082                	ret

1c0096b2 <__rt_bridge_printf_flush>:
1c0096b2:	1141                	addi	sp,sp,-16
1c0096b4:	c422                	sw	s0,8(sp)
1c0096b6:	c606                	sw	ra,12(sp)
1c0096b8:	1c001437          	lui	s0,0x1c001
1c0096bc:	3f8d                	jal	1c00962e <__rt_bridge_check_connection>
1c0096be:	00c40793          	addi	a5,s0,12 # 1c00100c <__hal_debug_struct>
1c0096c2:	479c                	lw	a5,8(a5)
1c0096c4:	c385                	beqz	a5,1c0096e4 <__rt_bridge_printf_flush+0x32>
1c0096c6:	00c40413          	addi	s0,s0,12
1c0096ca:	485c                	lw	a5,20(s0)
1c0096cc:	e399                	bnez	a5,1c0096d2 <__rt_bridge_printf_flush+0x20>
1c0096ce:	4c1c                	lw	a5,24(s0)
1c0096d0:	cb91                	beqz	a5,1c0096e4 <__rt_bridge_printf_flush+0x32>
1c0096d2:	3f45                	jal	1c009682 <__rt_bridge_send_notif>
1c0096d4:	485c                	lw	a5,20(s0)
1c0096d6:	e789                	bnez	a5,1c0096e0 <__rt_bridge_printf_flush+0x2e>
1c0096d8:	4422                	lw	s0,8(sp)
1c0096da:	40b2                	lw	ra,12(sp)
1c0096dc:	0141                	addi	sp,sp,16
1c0096de:	bf6d                	j	1c009698 <__rt_bridge_clear_notif>
1c0096e0:	3d69                	jal	1c00957a <__rt_bridge_wait>
1c0096e2:	bfcd                	j	1c0096d4 <__rt_bridge_printf_flush+0x22>
1c0096e4:	40b2                	lw	ra,12(sp)
1c0096e6:	4422                	lw	s0,8(sp)
1c0096e8:	0141                	addi	sp,sp,16
1c0096ea:	8082                	ret

1c0096ec <__rt_bridge_req_shutdown>:
1c0096ec:	1141                	addi	sp,sp,-16
1c0096ee:	c606                	sw	ra,12(sp)
1c0096f0:	c422                	sw	s0,8(sp)
1c0096f2:	c226                	sw	s1,4(sp)
1c0096f4:	3f2d                	jal	1c00962e <__rt_bridge_check_connection>
1c0096f6:	1c0017b7          	lui	a5,0x1c001
1c0096fa:	00c78793          	addi	a5,a5,12 # 1c00100c <__hal_debug_struct>
1c0096fe:	479c                	lw	a5,8(a5)
1c009700:	cb95                	beqz	a5,1c009734 <__rt_bridge_req_shutdown+0x48>
1c009702:	3f45                	jal	1c0096b2 <__rt_bridge_printf_flush>
1c009704:	1a1044b7          	lui	s1,0x1a104
1c009708:	441d                	li	s0,7
1c00970a:	58fc                	lw	a5,116(s1)
1c00970c:	83a5                	srli	a5,a5,0x9
1c00970e:	8b9d                	andi	a5,a5,7
1c009710:	02878763          	beq	a5,s0,1c00973e <__rt_bridge_req_shutdown+0x52>
1c009714:	1a1044b7          	lui	s1,0x1a104
1c009718:	441d                	li	s0,7
1c00971a:	58fc                	lw	a5,116(s1)
1c00971c:	83a5                	srli	a5,a5,0x9
1c00971e:	8b9d                	andi	a5,a5,7
1c009720:	02879163          	bne	a5,s0,1c009742 <__rt_bridge_req_shutdown+0x56>
1c009724:	1a1044b7          	lui	s1,0x1a104
1c009728:	441d                	li	s0,7
1c00972a:	58fc                	lw	a5,116(s1)
1c00972c:	83a5                	srli	a5,a5,0x9
1c00972e:	8b9d                	andi	a5,a5,7
1c009730:	00878b63          	beq	a5,s0,1c009746 <__rt_bridge_req_shutdown+0x5a>
1c009734:	40b2                	lw	ra,12(sp)
1c009736:	4422                	lw	s0,8(sp)
1c009738:	4492                	lw	s1,4(sp)
1c00973a:	0141                	addi	sp,sp,16
1c00973c:	8082                	ret
1c00973e:	3d35                	jal	1c00957a <__rt_bridge_wait>
1c009740:	b7e9                	j	1c00970a <__rt_bridge_req_shutdown+0x1e>
1c009742:	3d25                	jal	1c00957a <__rt_bridge_wait>
1c009744:	bfd9                	j	1c00971a <__rt_bridge_req_shutdown+0x2e>
1c009746:	3d15                	jal	1c00957a <__rt_bridge_wait>
1c009748:	b7cd                	j	1c00972a <__rt_bridge_req_shutdown+0x3e>

1c00974a <__rt_bridge_init>:
1c00974a:	1c0017b7          	lui	a5,0x1c001
1c00974e:	1a10a737          	lui	a4,0x1a10a
1c009752:	00c78793          	addi	a5,a5,12 # 1c00100c <__hal_debug_struct>
1c009756:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1097fc>
1c00975a:	0ae7ac23          	sw	a4,184(a5)
1c00975e:	4741                	li	a4,16
1c009760:	0a07a223          	sw	zero,164(a5)
1c009764:	0a07a623          	sw	zero,172(a5)
1c009768:	0a07aa23          	sw	zero,180(a5)
1c00976c:	0ae7ae23          	sw	a4,188(a5)
1c009770:	00400793          	li	a5,4
1c009774:	0007a823          	sw	zero,16(a5)
1c009778:	0007a023          	sw	zero,0(a5)
1c00977c:	8082                	ret

1c00977e <__rt_thread_enqueue_ready>:
1c00977e:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c009782:	02052c23          	sw	zero,56(a0)
1c009786:	01800793          	li	a5,24
1c00978a:	e711                	bnez	a4,1c009796 <__rt_thread_enqueue_ready+0x18>
1c00978c:	c388                	sw	a0,0(a5)
1c00978e:	c3c8                	sw	a0,4(a5)
1c009790:	0c052a23          	sw	zero,212(a0)
1c009794:	8082                	ret
1c009796:	43d8                	lw	a4,4(a5)
1c009798:	df08                	sw	a0,56(a4)
1c00979a:	bfd5                	j	1c00978e <__rt_thread_enqueue_ready+0x10>

1c00979c <__rt_thread_sleep>:
1c00979c:	01800713          	li	a4,24
1c0097a0:	4708                	lw	a0,8(a4)
1c0097a2:	01800793          	li	a5,24
1c0097a6:	438c                	lw	a1,0(a5)
1c0097a8:	c999                	beqz	a1,1c0097be <__rt_thread_sleep+0x22>
1c0097aa:	5d98                	lw	a4,56(a1)
1c0097ac:	c398                	sw	a4,0(a5)
1c0097ae:	4705                	li	a4,1
1c0097b0:	0ce5aa23          	sw	a4,212(a1)
1c0097b4:	00b50c63          	beq	a0,a1,1c0097cc <__rt_thread_sleep+0x30>
1c0097b8:	c78c                	sw	a1,8(a5)
1c0097ba:	b0dfe06f          	j	1c0082c6 <__rt_thread_switch>
1c0097be:	10500073          	wfi
1c0097c2:	30045073          	csrwi	mstatus,8
1c0097c6:	30047773          	csrrci	a4,mstatus,8
1c0097ca:	bff1                	j	1c0097a6 <__rt_thread_sleep+0xa>
1c0097cc:	8082                	ret

1c0097ce <rt_thread_exit>:
1c0097ce:	300477f3          	csrrci	a5,mstatus,8
1c0097d2:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c0097d6:	4705                	li	a4,1
1c0097d8:	c3e8                	sw	a0,68(a5)
1c0097da:	5fc8                	lw	a0,60(a5)
1c0097dc:	c3b8                	sw	a4,64(a5)
1c0097de:	c909                	beqz	a0,1c0097f0 <rt_thread_exit+0x22>
1c0097e0:	0d452783          	lw	a5,212(a0)
1c0097e4:	c791                	beqz	a5,1c0097f0 <rt_thread_exit+0x22>
1c0097e6:	1141                	addi	sp,sp,-16
1c0097e8:	c606                	sw	ra,12(sp)
1c0097ea:	3f51                	jal	1c00977e <__rt_thread_enqueue_ready>
1c0097ec:	40b2                	lw	ra,12(sp)
1c0097ee:	0141                	addi	sp,sp,16
1c0097f0:	b775                	j	1c00979c <__rt_thread_sleep>

1c0097f2 <__rt_thread_wakeup>:
1c0097f2:	5d18                	lw	a4,56(a0)
1c0097f4:	eb09                	bnez	a4,1c009806 <__rt_thread_wakeup+0x14>
1c0097f6:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c0097fa:	00a70663          	beq	a4,a0,1c009806 <__rt_thread_wakeup+0x14>
1c0097fe:	0d452783          	lw	a5,212(a0)
1c009802:	c391                	beqz	a5,1c009806 <__rt_thread_wakeup+0x14>
1c009804:	bfad                	j	1c00977e <__rt_thread_enqueue_ready>
1c009806:	8082                	ret

1c009808 <__rt_thread_sched_init>:
1c009808:	1141                	addi	sp,sp,-16
1c00980a:	c422                	sw	s0,8(sp)
1c00980c:	1c0087b7          	lui	a5,0x1c008
1c009810:	1c001437          	lui	s0,0x1c001
1c009814:	c226                	sw	s1,4(sp)
1c009816:	c04a                	sw	s2,0(sp)
1c009818:	c606                	sw	ra,12(sp)
1c00981a:	f1040413          	addi	s0,s0,-240 # 1c000f10 <__rt_thread_main>
1c00981e:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009822:	c01c                	sw	a5,0(s0)
1c009824:	1c0097b7          	lui	a5,0x1c009
1c009828:	04840913          	addi	s2,s0,72
1c00982c:	7ce78793          	addi	a5,a5,1998 # 1c0097ce <rt_thread_exit>
1c009830:	01800493          	li	s1,24
1c009834:	c45c                	sw	a5,12(s0)
1c009836:	854a                	mv	a0,s2
1c009838:	4785                	li	a5,1
1c00983a:	e3ff6597          	auipc	a1,0xe3ff6
1c00983e:	7ee58593          	addi	a1,a1,2030 # 28 <__rt_sched>
1c009842:	0cf42a23          	sw	a5,212(s0)
1c009846:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa103fec>
1c00984a:	02042a23          	sw	zero,52(s0)
1c00984e:	00042223          	sw	zero,4(s0)
1c009852:	00042423          	sw	zero,8(s0)
1c009856:	2829                	jal	1c009870 <__rt_event_init>
1c009858:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c00985c:	c480                	sw	s0,8(s1)
1c00985e:	40b2                	lw	ra,12(sp)
1c009860:	d03c                	sw	a5,96(s0)
1c009862:	4422                	lw	s0,8(sp)
1c009864:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009868:	4492                	lw	s1,4(sp)
1c00986a:	4902                	lw	s2,0(sp)
1c00986c:	0141                	addi	sp,sp,16
1c00986e:	8082                	ret

1c009870 <__rt_event_init>:
1c009870:	02052023          	sw	zero,32(a0)
1c009874:	02052223          	sw	zero,36(a0)
1c009878:	02052823          	sw	zero,48(a0)
1c00987c:	00052023          	sw	zero,0(a0)
1c009880:	8082                	ret

1c009882 <__rt_wait_event_prepare_blocking>:
1c009882:	02400793          	li	a5,36
1c009886:	4388                	lw	a0,0(a5)
1c009888:	4d18                	lw	a4,24(a0)
1c00988a:	02052223          	sw	zero,36(a0)
1c00988e:	c398                	sw	a4,0(a5)
1c009890:	4785                	li	a5,1
1c009892:	d11c                	sw	a5,32(a0)
1c009894:	00052023          	sw	zero,0(a0)
1c009898:	8082                	ret

1c00989a <rt_event_alloc>:
1c00989a:	1141                	addi	sp,sp,-16
1c00989c:	c422                	sw	s0,8(sp)
1c00989e:	842e                	mv	s0,a1
1c0098a0:	c606                	sw	ra,12(sp)
1c0098a2:	c226                	sw	s1,4(sp)
1c0098a4:	300474f3          	csrrci	s1,mstatus,8
1c0098a8:	f14027f3          	csrr	a5,mhartid
1c0098ac:	8795                	srai	a5,a5,0x5
1c0098ae:	03f7f793          	andi	a5,a5,63
1c0098b2:	477d                	li	a4,31
1c0098b4:	00378513          	addi	a0,a5,3
1c0098b8:	00e79363          	bne	a5,a4,1c0098be <rt_event_alloc+0x24>
1c0098bc:	4501                	li	a0,0
1c0098be:	08c00593          	li	a1,140
1c0098c2:	02b405b3          	mul	a1,s0,a1
1c0098c6:	884ff0ef          	jal	ra,1c00894a <rt_alloc>
1c0098ca:	87aa                	mv	a5,a0
1c0098cc:	557d                	li	a0,-1
1c0098ce:	cf91                	beqz	a5,1c0098ea <rt_event_alloc+0x50>
1c0098d0:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c0098d4:	4581                	li	a1,0
1c0098d6:	4601                	li	a2,0
1c0098d8:	02400713          	li	a4,36
1c0098dc:	00864c63          	blt	a2,s0,1c0098f4 <rt_event_alloc+0x5a>
1c0098e0:	c191                	beqz	a1,1c0098e4 <rt_event_alloc+0x4a>
1c0098e2:	c314                	sw	a3,0(a4)
1c0098e4:	30049073          	csrw	mstatus,s1
1c0098e8:	4501                	li	a0,0
1c0098ea:	40b2                	lw	ra,12(sp)
1c0098ec:	4422                	lw	s0,8(sp)
1c0098ee:	4492                	lw	s1,4(sp)
1c0098f0:	0141                	addi	sp,sp,16
1c0098f2:	8082                	ret
1c0098f4:	cf94                	sw	a3,24(a5)
1c0098f6:	0207a023          	sw	zero,32(a5)
1c0098fa:	0207a223          	sw	zero,36(a5)
1c0098fe:	0207a823          	sw	zero,48(a5)
1c009902:	0007a023          	sw	zero,0(a5)
1c009906:	86be                	mv	a3,a5
1c009908:	0605                	addi	a2,a2,1
1c00990a:	4585                	li	a1,1
1c00990c:	08c78793          	addi	a5,a5,140
1c009910:	b7f1                	j	1c0098dc <rt_event_alloc+0x42>

1c009912 <rt_event_get>:
1c009912:	30047773          	csrrci	a4,mstatus,8
1c009916:	02400793          	li	a5,36
1c00991a:	4388                	lw	a0,0(a5)
1c00991c:	c509                	beqz	a0,1c009926 <rt_event_get+0x14>
1c00991e:	4d14                	lw	a3,24(a0)
1c009920:	c150                	sw	a2,4(a0)
1c009922:	c394                	sw	a3,0(a5)
1c009924:	c10c                	sw	a1,0(a0)
1c009926:	30071073          	csrw	mstatus,a4
1c00992a:	8082                	ret

1c00992c <rt_event_get_blocking>:
1c00992c:	30047773          	csrrci	a4,mstatus,8
1c009930:	02400793          	li	a5,36
1c009934:	4388                	lw	a0,0(a5)
1c009936:	c909                	beqz	a0,1c009948 <rt_event_get_blocking+0x1c>
1c009938:	4d14                	lw	a3,24(a0)
1c00993a:	00052223          	sw	zero,4(a0)
1c00993e:	c394                	sw	a3,0(a5)
1c009940:	4785                	li	a5,1
1c009942:	00052023          	sw	zero,0(a0)
1c009946:	d11c                	sw	a5,32(a0)
1c009948:	30071073          	csrw	mstatus,a4
1c00994c:	8082                	ret

1c00994e <rt_event_push>:
1c00994e:	30047773          	csrrci	a4,mstatus,8
1c009952:	02400693          	li	a3,36
1c009956:	42d4                	lw	a3,4(a3)
1c009958:	00052c23          	sw	zero,24(a0)
1c00995c:	02400793          	li	a5,36
1c009960:	e691                	bnez	a3,1c00996c <rt_event_push+0x1e>
1c009962:	c3c8                	sw	a0,4(a5)
1c009964:	c788                	sw	a0,8(a5)
1c009966:	30071073          	csrw	mstatus,a4
1c00996a:	8082                	ret
1c00996c:	4794                	lw	a3,8(a5)
1c00996e:	ce88                	sw	a0,24(a3)
1c009970:	bfd5                	j	1c009964 <rt_event_push+0x16>

1c009972 <__rt_event_execute>:
1c009972:	1141                	addi	sp,sp,-16
1c009974:	c422                	sw	s0,8(sp)
1c009976:	02400793          	li	a5,36
1c00997a:	43dc                	lw	a5,4(a5)
1c00997c:	c606                	sw	ra,12(sp)
1c00997e:	c226                	sw	s1,4(sp)
1c009980:	02400413          	li	s0,36
1c009984:	eb91                	bnez	a5,1c009998 <__rt_event_execute+0x26>
1c009986:	c1a9                	beqz	a1,1c0099c8 <__rt_event_execute+0x56>
1c009988:	10500073          	wfi
1c00998c:	30045073          	csrwi	mstatus,8
1c009990:	300477f3          	csrrci	a5,mstatus,8
1c009994:	405c                	lw	a5,4(s0)
1c009996:	cb8d                	beqz	a5,1c0099c8 <__rt_event_execute+0x56>
1c009998:	4485                	li	s1,1
1c00999a:	4f98                	lw	a4,24(a5)
1c00999c:	53d4                	lw	a3,36(a5)
1c00999e:	00978823          	sb	s1,16(a5)
1c0099a2:	c058                	sw	a4,4(s0)
1c0099a4:	43c8                	lw	a0,4(a5)
1c0099a6:	4398                	lw	a4,0(a5)
1c0099a8:	e691                	bnez	a3,1c0099b4 <__rt_event_execute+0x42>
1c0099aa:	5394                	lw	a3,32(a5)
1c0099ac:	e681                	bnez	a3,1c0099b4 <__rt_event_execute+0x42>
1c0099ae:	4014                	lw	a3,0(s0)
1c0099b0:	c01c                	sw	a5,0(s0)
1c0099b2:	cf94                	sw	a3,24(a5)
1c0099b4:	0207a023          	sw	zero,32(a5)
1c0099b8:	c711                	beqz	a4,1c0099c4 <__rt_event_execute+0x52>
1c0099ba:	30045073          	csrwi	mstatus,8
1c0099be:	9702                	jalr	a4
1c0099c0:	300477f3          	csrrci	a5,mstatus,8
1c0099c4:	405c                	lw	a5,4(s0)
1c0099c6:	fbf1                	bnez	a5,1c00999a <__rt_event_execute+0x28>
1c0099c8:	40b2                	lw	ra,12(sp)
1c0099ca:	4422                	lw	s0,8(sp)
1c0099cc:	4492                	lw	s1,4(sp)
1c0099ce:	0141                	addi	sp,sp,16
1c0099d0:	8082                	ret

1c0099d2 <__rt_wait_event>:
1c0099d2:	1141                	addi	sp,sp,-16
1c0099d4:	c422                	sw	s0,8(sp)
1c0099d6:	c606                	sw	ra,12(sp)
1c0099d8:	842a                	mv	s0,a0
1c0099da:	501c                	lw	a5,32(s0)
1c0099dc:	ef81                	bnez	a5,1c0099f4 <__rt_wait_event+0x22>
1c0099de:	581c                	lw	a5,48(s0)
1c0099e0:	eb91                	bnez	a5,1c0099f4 <__rt_wait_event+0x22>
1c0099e2:	02400793          	li	a5,36
1c0099e6:	4398                	lw	a4,0(a5)
1c0099e8:	40b2                	lw	ra,12(sp)
1c0099ea:	c380                	sw	s0,0(a5)
1c0099ec:	cc18                	sw	a4,24(s0)
1c0099ee:	4422                	lw	s0,8(sp)
1c0099f0:	0141                	addi	sp,sp,16
1c0099f2:	8082                	ret
1c0099f4:	4585                	li	a1,1
1c0099f6:	4501                	li	a0,0
1c0099f8:	3fad                	jal	1c009972 <__rt_event_execute>
1c0099fa:	b7c5                	j	1c0099da <__rt_wait_event+0x8>

1c0099fc <rt_event_wait>:
1c0099fc:	1141                	addi	sp,sp,-16
1c0099fe:	c606                	sw	ra,12(sp)
1c009a00:	c422                	sw	s0,8(sp)
1c009a02:	30047473          	csrrci	s0,mstatus,8
1c009a06:	37f1                	jal	1c0099d2 <__rt_wait_event>
1c009a08:	30041073          	csrw	mstatus,s0
1c009a0c:	40b2                	lw	ra,12(sp)
1c009a0e:	4422                	lw	s0,8(sp)
1c009a10:	0141                	addi	sp,sp,16
1c009a12:	8082                	ret

1c009a14 <__rt_event_sched_init>:
1c009a14:	02400513          	li	a0,36
1c009a18:	00052023          	sw	zero,0(a0)
1c009a1c:	00052223          	sw	zero,4(a0)
1c009a20:	4585                	li	a1,1
1c009a22:	0511                	addi	a0,a0,4
1c009a24:	bd9d                	j	1c00989a <rt_event_alloc>

1c009a26 <__rt_fll_set_freq>:
1c009a26:	1141                	addi	sp,sp,-16
1c009a28:	c422                	sw	s0,8(sp)
1c009a2a:	c226                	sw	s1,4(sp)
1c009a2c:	c606                	sw	ra,12(sp)
1c009a2e:	842a                	mv	s0,a0
1c009a30:	84ae                	mv	s1,a1
1c009a32:	e111                	bnez	a0,1c009a36 <__rt_fll_set_freq+0x10>
1c009a34:	3965                	jal	1c0096ec <__rt_bridge_req_shutdown>
1c009a36:	8526                	mv	a0,s1
1c009a38:	abdfe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009a3c:	1579                	addi	a0,a0,-2
1c009a3e:	00155793          	srli	a5,a0,0x1
1c009a42:	e391                	bnez	a5,1c009a46 <__rt_fll_set_freq+0x20>
1c009a44:	4785                	li	a5,1
1c009a46:	fff78713          	addi	a4,a5,-1
1c009a4a:	4505                	li	a0,1
1c009a4c:	00e51533          	sll	a0,a0,a4
1c009a50:	00f494b3          	sll	s1,s1,a5
1c009a54:	7761                	lui	a4,0xffff8
1c009a56:	8f65                	and	a4,a4,s1
1c009a58:	1c0016b7          	lui	a3,0x1c001
1c009a5c:	953a                	add	a0,a0,a4
1c009a5e:	22068693          	addi	a3,a3,544 # 1c001220 <__rt_fll_freq>
1c009a62:	00241713          	slli	a4,s0,0x2
1c009a66:	9736                	add	a4,a4,a3
1c009a68:	00f55533          	srl	a0,a0,a5
1c009a6c:	c308                	sw	a0,0(a4)
1c009a6e:	1c001737          	lui	a4,0x1c001
1c009a72:	1bc70713          	addi	a4,a4,444 # 1c0011bc <__rt_fll_is_on>
1c009a76:	9722                	add	a4,a4,s0
1c009a78:	00074703          	lbu	a4,0(a4)
1c009a7c:	c715                	beqz	a4,1c009aa8 <__rt_fll_set_freq+0x82>
1c009a7e:	1a100737          	lui	a4,0x1a100
1c009a82:	0711                	addi	a4,a4,4
1c009a84:	0412                	slli	s0,s0,0x4
1c009a86:	943a                	add	s0,s0,a4
1c009a88:	4018                	lw	a4,0(s0)
1c009a8a:	80bd                	srli	s1,s1,0xf
1c009a8c:	76c1                	lui	a3,0xffff0
1c009a8e:	04c2                	slli	s1,s1,0x10
1c009a90:	8f75                	and	a4,a4,a3
1c009a92:	80c1                	srli	s1,s1,0x10
1c009a94:	0785                	addi	a5,a5,1
1c009a96:	c40006b7          	lui	a3,0xc4000
1c009a9a:	8f45                	or	a4,a4,s1
1c009a9c:	8bbd                	andi	a5,a5,15
1c009a9e:	16fd                	addi	a3,a3,-1
1c009aa0:	07ea                	slli	a5,a5,0x1a
1c009aa2:	8f75                	and	a4,a4,a3
1c009aa4:	8fd9                	or	a5,a5,a4
1c009aa6:	c01c                	sw	a5,0(s0)
1c009aa8:	40b2                	lw	ra,12(sp)
1c009aaa:	4422                	lw	s0,8(sp)
1c009aac:	4492                	lw	s1,4(sp)
1c009aae:	0141                	addi	sp,sp,16
1c009ab0:	8082                	ret

1c009ab2 <__rt_fll_init>:
1c009ab2:	1141                	addi	sp,sp,-16
1c009ab4:	1a1005b7          	lui	a1,0x1a100
1c009ab8:	00451613          	slli	a2,a0,0x4
1c009abc:	c226                	sw	s1,4(sp)
1c009abe:	84aa                	mv	s1,a0
1c009ac0:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0ffff0>
1c009ac4:	9532                	add	a0,a0,a2
1c009ac6:	4114                	lw	a3,0(a0)
1c009ac8:	c606                	sw	ra,12(sp)
1c009aca:	c422                	sw	s0,8(sp)
1c009acc:	87b6                	mv	a5,a3
1c009ace:	0406c963          	bltz	a3,1c009b20 <__rt_fll_init+0x6e>
1c009ad2:	00858793          	addi	a5,a1,8
1c009ad6:	97b2                	add	a5,a5,a2
1c009ad8:	4398                	lw	a4,0(a5)
1c009ada:	7841                	lui	a6,0xffff0
1c009adc:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009ae0:	01077733          	and	a4,a4,a6
1c009ae4:	6809                	lui	a6,0x2
1c009ae6:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009aea:	01076733          	or	a4,a4,a6
1c009aee:	f0010837          	lui	a6,0xf0010
1c009af2:	187d                	addi	a6,a6,-1
1c009af4:	01077733          	and	a4,a4,a6
1c009af8:	00500837          	lui	a6,0x500
1c009afc:	01076733          	or	a4,a4,a6
1c009b00:	05b1                	addi	a1,a1,12
1c009b02:	c398                	sw	a4,0(a5)
1c009b04:	962e                	add	a2,a2,a1
1c009b06:	421c                	lw	a5,0(a2)
1c009b08:	fc010737          	lui	a4,0xfc010
1c009b0c:	177d                	addi	a4,a4,-1
1c009b0e:	8ff9                	and	a5,a5,a4
1c009b10:	014c0737          	lui	a4,0x14c0
1c009b14:	8fd9                	or	a5,a5,a4
1c009b16:	c21c                	sw	a5,0(a2)
1c009b18:	c00007b7          	lui	a5,0xc0000
1c009b1c:	8fd5                	or	a5,a5,a3
1c009b1e:	c11c                	sw	a5,0(a0)
1c009b20:	1c001637          	lui	a2,0x1c001
1c009b24:	00249713          	slli	a4,s1,0x2
1c009b28:	22060613          	addi	a2,a2,544 # 1c001220 <__rt_fll_freq>
1c009b2c:	9732                	add	a4,a4,a2
1c009b2e:	4300                	lw	s0,0(a4)
1c009b30:	c015                	beqz	s0,1c009b54 <__rt_fll_init+0xa2>
1c009b32:	85a2                	mv	a1,s0
1c009b34:	8526                	mv	a0,s1
1c009b36:	3dc5                	jal	1c009a26 <__rt_fll_set_freq>
1c009b38:	1c001537          	lui	a0,0x1c001
1c009b3c:	1bc50513          	addi	a0,a0,444 # 1c0011bc <__rt_fll_is_on>
1c009b40:	9526                	add	a0,a0,s1
1c009b42:	4785                	li	a5,1
1c009b44:	00f50023          	sb	a5,0(a0)
1c009b48:	40b2                	lw	ra,12(sp)
1c009b4a:	8522                	mv	a0,s0
1c009b4c:	4422                	lw	s0,8(sp)
1c009b4e:	4492                	lw	s1,4(sp)
1c009b50:	0141                	addi	sp,sp,16
1c009b52:	8082                	ret
1c009b54:	06c2                	slli	a3,a3,0x10
1c009b56:	83e9                	srli	a5,a5,0x1a
1c009b58:	82c1                	srli	a3,a3,0x10
1c009b5a:	8bbd                	andi	a5,a5,15
1c009b5c:	06be                	slli	a3,a3,0xf
1c009b5e:	17fd                	addi	a5,a5,-1
1c009b60:	00f6d433          	srl	s0,a3,a5
1c009b64:	c300                	sw	s0,0(a4)
1c009b66:	bfc9                	j	1c009b38 <__rt_fll_init+0x86>

1c009b68 <__rt_fll_deinit>:
1c009b68:	1c0017b7          	lui	a5,0x1c001
1c009b6c:	1bc78793          	addi	a5,a5,444 # 1c0011bc <__rt_fll_is_on>
1c009b70:	953e                	add	a0,a0,a5
1c009b72:	00050023          	sb	zero,0(a0)
1c009b76:	8082                	ret

1c009b78 <__rt_flls_constructor>:
1c009b78:	1c0017b7          	lui	a5,0x1c001
1c009b7c:	2207a023          	sw	zero,544(a5) # 1c001220 <__rt_fll_freq>
1c009b80:	22078793          	addi	a5,a5,544
1c009b84:	0007a223          	sw	zero,4(a5)
1c009b88:	1c0017b7          	lui	a5,0x1c001
1c009b8c:	1a079e23          	sh	zero,444(a5) # 1c0011bc <__rt_fll_is_on>
1c009b90:	8082                	ret

1c009b92 <gcd>:
1c009b92:	cd19                	beqz	a0,1c009bb0 <gcd+0x1e>
1c009b94:	cd81                	beqz	a1,1c009bac <gcd+0x1a>
1c009b96:	00054463          	bltz	a0,1c009b9e <gcd+0xc>
1c009b9a:	0005d563          	bgez	a1,1c009ba4 <gcd+0x12>
1c009b9e:	55fd                	li	a1,-1
1c009ba0:	a031                	j	1c009bac <gcd+0x1a>
1c009ba2:	85be                	mv	a1,a5
1c009ba4:	02b567b3          	rem	a5,a0,a1
1c009ba8:	852e                	mv	a0,a1
1c009baa:	ffe5                	bnez	a5,1c009ba2 <gcd+0x10>
1c009bac:	852e                	mv	a0,a1
1c009bae:	8082                	ret
1c009bb0:	4581                	li	a1,0
1c009bb2:	bfed                	j	1c009bac <gcd+0x1a>

1c009bb4 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009bb4:	1101                	addi	sp,sp,-32
1c009bb6:	1c0017b7          	lui	a5,0x1c001
1c009bba:	c84a                	sw	s2,16(sp)
1c009bbc:	1c07a903          	lw	s2,448(a5) # 1c0011c0 <__rt_periph_lcm>
1c009bc0:	c452                	sw	s4,8(sp)
1c009bc2:	8a2e                	mv	s4,a1
1c009bc4:	85ca                	mv	a1,s2
1c009bc6:	ce06                	sw	ra,28(sp)
1c009bc8:	cc22                	sw	s0,24(sp)
1c009bca:	ca26                	sw	s1,20(sp)
1c009bcc:	842a                	mv	s0,a0
1c009bce:	c64e                	sw	s3,12(sp)
1c009bd0:	89aa                	mv	s3,a0
1c009bd2:	37c1                	jal	1c009b92 <gcd>
1c009bd4:	02a44533          	div	a0,s0,a0
1c009bd8:	03250933          	mul	s2,a0,s2
1c009bdc:	4511                	li	a0,4
1c009bde:	82dff0ef          	jal	ra,1c00940a <__rt_cbsys_exec>
1c009be2:	1c0017b7          	lui	a5,0x1c001
1c009be6:	2207a783          	lw	a5,544(a5) # 1c001220 <__rt_fll_freq>
1c009bea:	028954b3          	divu	s1,s2,s0
1c009bee:	0527f263          	bleu	s2,a5,1c009c32 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009bf2:	1a1047b7          	lui	a5,0x1a104
1c009bf6:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040c0>
1c009bfa:	4705                	li	a4,1
1c009bfc:	0ce7ae23          	sw	a4,220(a5)
1c009c00:	85a2                	mv	a1,s0
1c009c02:	4501                	li	a0,0
1c009c04:	350d                	jal	1c009a26 <__rt_fll_set_freq>
1c009c06:	57fd                	li	a5,-1
1c009c08:	00fa0963          	beq	s4,a5,1c009c1a <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009c0c:	c099                	beqz	s1,1c009c12 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009c0e:	029459b3          	divu	s3,s0,s1
1c009c12:	1c0017b7          	lui	a5,0x1c001
1c009c16:	2337a423          	sw	s3,552(a5) # 1c001228 <__rt_freq_domains>
1c009c1a:	4515                	li	a0,5
1c009c1c:	feeff0ef          	jal	ra,1c00940a <__rt_cbsys_exec>
1c009c20:	40f2                	lw	ra,28(sp)
1c009c22:	4462                	lw	s0,24(sp)
1c009c24:	44d2                	lw	s1,20(sp)
1c009c26:	4942                	lw	s2,16(sp)
1c009c28:	49b2                	lw	s3,12(sp)
1c009c2a:	4a22                	lw	s4,8(sp)
1c009c2c:	4501                	li	a0,0
1c009c2e:	6105                	addi	sp,sp,32
1c009c30:	8082                	ret
1c009c32:	85a2                	mv	a1,s0
1c009c34:	4501                	li	a0,0
1c009c36:	3bc5                	jal	1c009a26 <__rt_fll_set_freq>
1c009c38:	1a1047b7          	lui	a5,0x1a104
1c009c3c:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040c0>
1c009c40:	4705                	li	a4,1
1c009c42:	0ce7ae23          	sw	a4,220(a5)
1c009c46:	b7c1                	j	1c009c06 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009c48 <rt_freq_set_and_get>:
1c009c48:	1141                	addi	sp,sp,-16
1c009c4a:	852e                	mv	a0,a1
1c009c4c:	c606                	sw	ra,12(sp)
1c009c4e:	c422                	sw	s0,8(sp)
1c009c50:	30047473          	csrrci	s0,mstatus,8
1c009c54:	4581                	li	a1,0
1c009c56:	3fb9                	jal	1c009bb4 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009c58:	30041073          	csrw	mstatus,s0
1c009c5c:	40b2                	lw	ra,12(sp)
1c009c5e:	4422                	lw	s0,8(sp)
1c009c60:	00a03533          	snez	a0,a0
1c009c64:	40a00533          	neg	a0,a0
1c009c68:	0141                	addi	sp,sp,16
1c009c6a:	8082                	ret

1c009c6c <__rt_freq_init>:
1c009c6c:	1141                	addi	sp,sp,-16
1c009c6e:	c422                	sw	s0,8(sp)
1c009c70:	c606                	sw	ra,12(sp)
1c009c72:	3719                	jal	1c009b78 <__rt_flls_constructor>
1c009c74:	1c0017b7          	lui	a5,0x1c001
1c009c78:	0cc7a703          	lw	a4,204(a5) # 1c0010cc <__rt_platform>
1c009c7c:	4785                	li	a5,1
1c009c7e:	1c001437          	lui	s0,0x1c001
1c009c82:	02f70663          	beq	a4,a5,1c009cae <__rt_freq_init+0x42>
1c009c86:	4501                	li	a0,0
1c009c88:	352d                	jal	1c009ab2 <__rt_fll_init>
1c009c8a:	22a42423          	sw	a0,552(s0) # 1c001228 <__rt_freq_domains>
1c009c8e:	1a1047b7          	lui	a5,0x1a104
1c009c92:	4709                	li	a4,2
1c009c94:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1040bc>
1c009c98:	4705                	li	a4,1
1c009c9a:	0ce7ac23          	sw	a4,216(a5)
1c009c9e:	40b2                	lw	ra,12(sp)
1c009ca0:	4422                	lw	s0,8(sp)
1c009ca2:	0ce7ae23          	sw	a4,220(a5)
1c009ca6:	0ce7aa23          	sw	a4,212(a5)
1c009caa:	0141                	addi	sp,sp,16
1c009cac:	8082                	ret
1c009cae:	026267b7          	lui	a5,0x2626
1c009cb2:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2615a14>
1c009cb6:	22f42423          	sw	a5,552(s0)
1c009cba:	bfd1                	j	1c009c8e <__rt_freq_init+0x22>

1c009cbc <hal_itc_wait_for_event_noirq>:
1c009cbc:	1a10a7b7          	lui	a5,0x1a10a
1c009cc0:	300476f3          	csrrci	a3,mstatus,8
1c009cc4:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1097f8>
1c009cc8:	8f69                	and	a4,a4,a0
1c009cca:	eb11                	bnez	a4,1c009cde <hal_itc_wait_for_event_noirq+0x22>
1c009ccc:	80a7a223          	sw	a0,-2044(a5)
1c009cd0:	10500073          	wfi
1c009cd4:	80a7a423          	sw	a0,-2040(a5)
1c009cd8:	30069073          	csrw	mstatus,a3
1c009cdc:	b7d5                	j	1c009cc0 <hal_itc_wait_for_event_noirq+0x4>
1c009cde:	80a7aa23          	sw	a0,-2028(a5)
1c009ce2:	30069073          	csrw	mstatus,a3
1c009ce6:	8082                	ret

1c009ce8 <__rt_pmu_cluster_power_down>:
1c009ce8:	1a1047b7          	lui	a5,0x1a104
1c009cec:	5bbc                	lw	a5,112(a5)
1c009cee:	01079713          	slli	a4,a5,0x10
1c009cf2:	02074c63          	bltz	a4,1c009d2a <__rt_pmu_cluster_power_down+0x42>
1c009cf6:	1141                	addi	sp,sp,-16
1c009cf8:	c422                	sw	s0,8(sp)
1c009cfa:	c606                	sw	ra,12(sp)
1c009cfc:	c226                	sw	s1,4(sp)
1c009cfe:	1a104437          	lui	s0,0x1a104
1c009d02:	547c                	lw	a5,108(s0)
1c009d04:	e385                	bnez	a5,1c009d24 <__rt_pmu_cluster_power_down+0x3c>
1c009d06:	4485                	li	s1,1
1c009d08:	c444                	sw	s1,12(s0)
1c009d0a:	478d                	li	a5,3
1c009d0c:	d83c                	sw	a5,112(s0)
1c009d0e:	00800537          	lui	a0,0x800
1c009d12:	376d                	jal	1c009cbc <hal_itc_wait_for_event_noirq>
1c009d14:	d824                	sw	s1,112(s0)
1c009d16:	4422                	lw	s0,8(sp)
1c009d18:	40b2                	lw	ra,12(sp)
1c009d1a:	4492                	lw	s1,4(sp)
1c009d1c:	00400537          	lui	a0,0x400
1c009d20:	0141                	addi	sp,sp,16
1c009d22:	bf69                	j	1c009cbc <hal_itc_wait_for_event_noirq>
1c009d24:	4505                	li	a0,1
1c009d26:	2a11                	jal	1c009e3a <rt_time_wait_us>
1c009d28:	bfe9                	j	1c009d02 <__rt_pmu_cluster_power_down+0x1a>
1c009d2a:	8082                	ret

1c009d2c <__rt_pmu_cluster_power_up>:
1c009d2c:	1141                	addi	sp,sp,-16
1c009d2e:	c606                	sw	ra,12(sp)
1c009d30:	c422                	sw	s0,8(sp)
1c009d32:	478d                	li	a5,3
1c009d34:	1a104437          	lui	s0,0x1a104
1c009d38:	d83c                	sw	a5,112(s0)
1c009d3a:	00400537          	lui	a0,0x400
1c009d3e:	3fbd                	jal	1c009cbc <hal_itc_wait_for_event_noirq>
1c009d40:	02700793          	li	a5,39
1c009d44:	d83c                	sw	a5,112(s0)
1c009d46:	00800537          	lui	a0,0x800
1c009d4a:	3f8d                	jal	1c009cbc <hal_itc_wait_for_event_noirq>
1c009d4c:	6791                	lui	a5,0x4
1c009d4e:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa103ff8>
1c009d52:	02778793          	addi	a5,a5,39 # 4027 <__rt_hyper_pending_emu_stride+0x3d7f>
1c009d56:	d83c                	sw	a5,112(s0)
1c009d58:	40b2                	lw	ra,12(sp)
1c009d5a:	4422                	lw	s0,8(sp)
1c009d5c:	4505                	li	a0,1
1c009d5e:	0141                	addi	sp,sp,16
1c009d60:	8082                	ret

1c009d62 <__rt_pmu_init>:
1c009d62:	1a1077b7          	lui	a5,0x1a107
1c009d66:	4741                	li	a4,16
1c009d68:	cb98                	sw	a4,16(a5)
1c009d6a:	1a10a7b7          	lui	a5,0x1a10a
1c009d6e:	02000737          	lui	a4,0x2000
1c009d72:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa109800>
1c009d76:	4709                	li	a4,2
1c009d78:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c009d7c:	8082                	ret

1c009d7e <rt_padframe_set>:
1c009d7e:	300476f3          	csrrci	a3,mstatus,8
1c009d82:	4158                	lw	a4,4(a0)
1c009d84:	1a1047b7          	lui	a5,0x1a104
1c009d88:	4310                	lw	a2,0(a4)
1c009d8a:	cb90                	sw	a2,16(a5)
1c009d8c:	4350                	lw	a2,4(a4)
1c009d8e:	cbd0                	sw	a2,20(a5)
1c009d90:	4710                	lw	a2,8(a4)
1c009d92:	cf90                	sw	a2,24(a5)
1c009d94:	4758                	lw	a4,12(a4)
1c009d96:	cfd8                	sw	a4,28(a5)
1c009d98:	30069073          	csrw	mstatus,a3
1c009d9c:	8082                	ret

1c009d9e <__rt_padframe_init>:
1c009d9e:	1c001537          	lui	a0,0x1c001
1c009da2:	ffc50513          	addi	a0,a0,-4 # 1c000ffc <__rt_padframe_profiles>
1c009da6:	bfe1                	j	1c009d7e <rt_padframe_set>

1c009da8 <__rt_time_poweroff>:
1c009da8:	1a10b7b7          	lui	a5,0x1a10b
1c009dac:	47d8                	lw	a4,12(a5)
1c009dae:	1c0017b7          	lui	a5,0x1c001
1c009db2:	4501                	li	a0,0
1c009db4:	1ce7a223          	sw	a4,452(a5) # 1c0011c4 <timer_count>
1c009db8:	8082                	ret

1c009dba <__rt_time_poweron>:
1c009dba:	1c0017b7          	lui	a5,0x1c001
1c009dbe:	1c47a703          	lw	a4,452(a5) # 1c0011c4 <timer_count>
1c009dc2:	1a10b7b7          	lui	a5,0x1a10b
1c009dc6:	4501                	li	a0,0
1c009dc8:	c7d8                	sw	a4,12(a5)
1c009dca:	8082                	ret

1c009dcc <rt_event_push_delayed>:
1c009dcc:	30047373          	csrrci	t1,mstatus,8
1c009dd0:	1a10b6b7          	lui	a3,0x1a10b
1c009dd4:	46d0                	lw	a2,12(a3)
1c009dd6:	1c001737          	lui	a4,0x1c001
1c009dda:	23072783          	lw	a5,560(a4) # 1c001230 <first_delayed>
1c009dde:	86ba                	mv	a3,a4
1c009de0:	0005d363          	bgez	a1,1c009de6 <rt_event_push_delayed+0x1a>
1c009de4:	4581                	li	a1,0
1c009de6:	4779                	li	a4,30
1c009de8:	02e5c5b3          	div	a1,a1,a4
1c009dec:	80000737          	lui	a4,0x80000
1c009df0:	fff74713          	not	a4,a4
1c009df4:	00e67833          	and	a6,a2,a4
1c009df8:	0585                	addi	a1,a1,1
1c009dfa:	962e                	add	a2,a2,a1
1c009dfc:	d950                	sw	a2,52(a0)
1c009dfe:	982e                	add	a6,a6,a1
1c009e00:	4601                	li	a2,0
1c009e02:	c799                	beqz	a5,1c009e10 <rt_event_push_delayed+0x44>
1c009e04:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa10b020>
1c009e08:	00e8f8b3          	and	a7,a7,a4
1c009e0c:	0108e863          	bltu	a7,a6,1c009e1c <rt_event_push_delayed+0x50>
1c009e10:	ca09                	beqz	a2,1c009e22 <rt_event_push_delayed+0x56>
1c009e12:	ce08                	sw	a0,24(a2)
1c009e14:	cd1c                	sw	a5,24(a0)
1c009e16:	30031073          	csrw	mstatus,t1
1c009e1a:	8082                	ret
1c009e1c:	863e                	mv	a2,a5
1c009e1e:	4f9c                	lw	a5,24(a5)
1c009e20:	b7cd                	j	1c009e02 <rt_event_push_delayed+0x36>
1c009e22:	cd1c                	sw	a5,24(a0)
1c009e24:	1a10b7b7          	lui	a5,0x1a10b
1c009e28:	47d8                	lw	a4,12(a5)
1c009e2a:	22a6a823          	sw	a0,560(a3) # 1a10b230 <__l1_end+0xa10b21c>
1c009e2e:	95ba                	add	a1,a1,a4
1c009e30:	cbcc                	sw	a1,20(a5)
1c009e32:	08500713          	li	a4,133
1c009e36:	c3d8                	sw	a4,4(a5)
1c009e38:	bff9                	j	1c009e16 <rt_event_push_delayed+0x4a>

1c009e3a <rt_time_wait_us>:
1c009e3a:	1101                	addi	sp,sp,-32
1c009e3c:	85aa                	mv	a1,a0
1c009e3e:	4501                	li	a0,0
1c009e40:	ce06                	sw	ra,28(sp)
1c009e42:	cc22                	sw	s0,24(sp)
1c009e44:	c62e                	sw	a1,12(sp)
1c009e46:	34dd                	jal	1c00992c <rt_event_get_blocking>
1c009e48:	45b2                	lw	a1,12(sp)
1c009e4a:	842a                	mv	s0,a0
1c009e4c:	3741                	jal	1c009dcc <rt_event_push_delayed>
1c009e4e:	8522                	mv	a0,s0
1c009e50:	4462                	lw	s0,24(sp)
1c009e52:	40f2                	lw	ra,28(sp)
1c009e54:	6105                	addi	sp,sp,32
1c009e56:	b65d                	j	1c0099fc <rt_event_wait>

1c009e58 <__rt_time_init>:
1c009e58:	1141                	addi	sp,sp,-16
1c009e5a:	1c0017b7          	lui	a5,0x1c001
1c009e5e:	2207a823          	sw	zero,560(a5) # 1c001230 <first_delayed>
1c009e62:	08300713          	li	a4,131
1c009e66:	1a10b7b7          	lui	a5,0x1a10b
1c009e6a:	c606                	sw	ra,12(sp)
1c009e6c:	c422                	sw	s0,8(sp)
1c009e6e:	1c00a5b7          	lui	a1,0x1c00a
1c009e72:	c3d8                	sw	a4,4(a5)
1c009e74:	ef058593          	addi	a1,a1,-272 # 1c009ef0 <__rt_timer_handler>
1c009e78:	452d                	li	a0,11
1c009e7a:	bc0ff0ef          	jal	ra,1c00923a <rt_irq_set_handler>
1c009e7e:	f14027f3          	csrr	a5,mhartid
1c009e82:	8795                	srai	a5,a5,0x5
1c009e84:	6705                	lui	a4,0x1
1c009e86:	03f7f793          	andi	a5,a5,63
1c009e8a:	46fd                	li	a3,31
1c009e8c:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009e90:	04d79863          	bne	a5,a3,1c009ee0 <__rt_time_init+0x88>
1c009e94:	1a10a7b7          	lui	a5,0x1a10a
1c009e98:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097f0>
1c009e9c:	1c00a5b7          	lui	a1,0x1c00a
1c009ea0:	4601                	li	a2,0
1c009ea2:	da858593          	addi	a1,a1,-600 # 1c009da8 <__rt_time_poweroff>
1c009ea6:	4509                	li	a0,2
1c009ea8:	d22ff0ef          	jal	ra,1c0093ca <__rt_cbsys_add>
1c009eac:	1c00a5b7          	lui	a1,0x1c00a
1c009eb0:	842a                	mv	s0,a0
1c009eb2:	4601                	li	a2,0
1c009eb4:	dba58593          	addi	a1,a1,-582 # 1c009dba <__rt_time_poweron>
1c009eb8:	450d                	li	a0,3
1c009eba:	d10ff0ef          	jal	ra,1c0093ca <__rt_cbsys_add>
1c009ebe:	8d41                	or	a0,a0,s0
1c009ec0:	c505                	beqz	a0,1c009ee8 <__rt_time_init+0x90>
1c009ec2:	f1402673          	csrr	a2,mhartid
1c009ec6:	1c000537          	lui	a0,0x1c000
1c009eca:	40565593          	srai	a1,a2,0x5
1c009ece:	03f5f593          	andi	a1,a1,63
1c009ed2:	8a7d                	andi	a2,a2,31
1c009ed4:	54850513          	addi	a0,a0,1352 # 1c000548 <__DTOR_END__+0x25c>
1c009ed8:	013000ef          	jal	ra,1c00a6ea <printf>
1c009edc:	79a000ef          	jal	ra,1c00a676 <abort>
1c009ee0:	002047b7          	lui	a5,0x204
1c009ee4:	cbd8                	sw	a4,20(a5)
1c009ee6:	bf5d                	j	1c009e9c <__rt_time_init+0x44>
1c009ee8:	40b2                	lw	ra,12(sp)
1c009eea:	4422                	lw	s0,8(sp)
1c009eec:	0141                	addi	sp,sp,16
1c009eee:	8082                	ret

1c009ef0 <__rt_timer_handler>:
1c009ef0:	7179                	addi	sp,sp,-48
1c009ef2:	ce36                	sw	a3,28(sp)
1c009ef4:	cc3a                	sw	a4,24(sp)
1c009ef6:	1a10b6b7          	lui	a3,0x1a10b
1c009efa:	1c001737          	lui	a4,0x1c001
1c009efe:	d61a                	sw	t1,44(sp)
1c009f00:	d032                	sw	a2,32(sp)
1c009f02:	ca3e                	sw	a5,20(sp)
1c009f04:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa10aff8>
1c009f08:	23072783          	lw	a5,560(a4) # 1c001230 <first_delayed>
1c009f0c:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c009f10:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c009f14:	c842                	sw	a6,16(sp)
1c009f16:	80000837          	lui	a6,0x80000
1c009f1a:	d42a                	sw	a0,40(sp)
1c009f1c:	d22e                	sw	a1,36(sp)
1c009f1e:	c646                	sw	a7,12(sp)
1c009f20:	c472                	sw	t3,8(sp)
1c009f22:	4581                	li	a1,0
1c009f24:	4501                	li	a0,0
1c009f26:	ffe84813          	xori	a6,a6,-2
1c009f2a:	efb9                	bnez	a5,1c009f88 <__rt_timer_handler+0x98>
1c009f2c:	c119                	beqz	a0,1c009f32 <__rt_timer_handler+0x42>
1c009f2e:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c009f32:	c199                	beqz	a1,1c009f38 <__rt_timer_handler+0x48>
1c009f34:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c009f38:	22072823          	sw	zero,560(a4)
1c009f3c:	1a10b7b7          	lui	a5,0x1a10b
1c009f40:	08100713          	li	a4,129
1c009f44:	c3d8                	sw	a4,4(a5)
1c009f46:	6785                	lui	a5,0x1
1c009f48:	1a10a737          	lui	a4,0x1a10a
1c009f4c:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009f50:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa109800>
1c009f54:	5332                	lw	t1,44(sp)
1c009f56:	5522                	lw	a0,40(sp)
1c009f58:	5592                	lw	a1,36(sp)
1c009f5a:	5602                	lw	a2,32(sp)
1c009f5c:	46f2                	lw	a3,28(sp)
1c009f5e:	4762                	lw	a4,24(sp)
1c009f60:	47d2                	lw	a5,20(sp)
1c009f62:	4842                	lw	a6,16(sp)
1c009f64:	48b2                	lw	a7,12(sp)
1c009f66:	4e22                	lw	t3,8(sp)
1c009f68:	6145                	addi	sp,sp,48
1c009f6a:	30200073          	mret
1c009f6e:	0187a883          	lw	a7,24(a5)
1c009f72:	0007ac23          	sw	zero,24(a5)
1c009f76:	c611                	beqz	a2,1c009f82 <__rt_timer_handler+0x92>
1c009f78:	ce9c                	sw	a5,24(a3)
1c009f7a:	86be                	mv	a3,a5
1c009f7c:	4585                	li	a1,1
1c009f7e:	87c6                	mv	a5,a7
1c009f80:	b76d                	j	1c009f2a <__rt_timer_handler+0x3a>
1c009f82:	863e                	mv	a2,a5
1c009f84:	4505                	li	a0,1
1c009f86:	bfd5                	j	1c009f7a <__rt_timer_handler+0x8a>
1c009f88:	0347a883          	lw	a7,52(a5)
1c009f8c:	41130e33          	sub	t3,t1,a7
1c009f90:	fdc87fe3          	bleu	t3,a6,1c009f6e <__rt_timer_handler+0x7e>
1c009f94:	c119                	beqz	a0,1c009f9a <__rt_timer_handler+0xaa>
1c009f96:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c009f9a:	c199                	beqz	a1,1c009fa0 <__rt_timer_handler+0xb0>
1c009f9c:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c009fa0:	22f72823          	sw	a5,560(a4)
1c009fa4:	1a10b737          	lui	a4,0x1a10b
1c009fa8:	475c                	lw	a5,12(a4)
1c009faa:	406787b3          	sub	a5,a5,t1
1c009fae:	97c6                	add	a5,a5,a7
1c009fb0:	cb5c                	sw	a5,20(a4)
1c009fb2:	08500793          	li	a5,133
1c009fb6:	c35c                	sw	a5,4(a4)
1c009fb8:	bf71                	j	1c009f54 <__rt_timer_handler+0x64>

1c009fba <rt_periph_copy>:
1c009fba:	7179                	addi	sp,sp,-48
1c009fbc:	d422                	sw	s0,40(sp)
1c009fbe:	842a                	mv	s0,a0
1c009fc0:	d606                	sw	ra,44(sp)
1c009fc2:	d226                	sw	s1,36(sp)
1c009fc4:	d04a                	sw	s2,32(sp)
1c009fc6:	30047973          	csrrci	s2,mstatus,8
1c009fca:	4015d493          	srai	s1,a1,0x1
1c009fce:	1a102537          	lui	a0,0x1a102
1c009fd2:	049e                	slli	s1,s1,0x7
1c009fd4:	94aa                	add	s1,s1,a0
1c009fd6:	00459513          	slli	a0,a1,0x4
1c009fda:	8941                	andi	a0,a0,16
1c009fdc:	94aa                	add	s1,s1,a0
1c009fde:	853e                	mv	a0,a5
1c009fe0:	ef89                	bnez	a5,1c009ffa <rt_periph_copy+0x40>
1c009fe2:	ce2e                	sw	a1,28(sp)
1c009fe4:	cc32                	sw	a2,24(sp)
1c009fe6:	ca36                	sw	a3,20(sp)
1c009fe8:	c83a                	sw	a4,16(sp)
1c009fea:	c63e                	sw	a5,12(sp)
1c009fec:	897ff0ef          	jal	ra,1c009882 <__rt_wait_event_prepare_blocking>
1c009ff0:	47b2                	lw	a5,12(sp)
1c009ff2:	4742                	lw	a4,16(sp)
1c009ff4:	46d2                	lw	a3,20(sp)
1c009ff6:	4662                	lw	a2,24(sp)
1c009ff8:	45f2                	lw	a1,28(sp)
1c009ffa:	e419                	bnez	s0,1c00a008 <rt_periph_copy+0x4e>
1c009ffc:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa102020>
1c00a000:	04052023          	sw	zero,64(a0)
1c00a004:	04052823          	sw	zero,80(a0)
1c00a008:	00c42803          	lw	a6,12(s0)
1c00a00c:	c054                	sw	a3,4(s0)
1c00a00e:	cc08                	sw	a0,24(s0)
1c00a010:	00f87813          	andi	a6,a6,15
1c00a014:	4891                	li	a7,4
1c00a016:	01076713          	ori	a4,a4,16
1c00a01a:	0708ec63          	bltu	a7,a6,1c00a092 <rt_periph_copy+0xd8>
1c00a01e:	04000893          	li	a7,64
1c00a022:	0596                	slli	a1,a1,0x5
1c00a024:	98ae                	add	a7,a7,a1
1c00a026:	0008a303          	lw	t1,0(a7)
1c00a02a:	00042a23          	sw	zero,20(s0)
1c00a02e:	04000813          	li	a6,64
1c00a032:	02031663          	bnez	t1,1c00a05e <rt_periph_copy+0xa4>
1c00a036:	0088a023          	sw	s0,0(a7)
1c00a03a:	00b808b3          	add	a7,a6,a1
1c00a03e:	0088a303          	lw	t1,8(a7)
1c00a042:	0088a223          	sw	s0,4(a7)
1c00a046:	02031163          	bnez	t1,1c00a068 <rt_periph_copy+0xae>
1c00a04a:	0084a883          	lw	a7,8(s1)
1c00a04e:	0208f893          	andi	a7,a7,32
1c00a052:	00089b63          	bnez	a7,1c00a068 <rt_periph_copy+0xae>
1c00a056:	c090                	sw	a2,0(s1)
1c00a058:	c0d4                	sw	a3,4(s1)
1c00a05a:	c498                	sw	a4,8(s1)
1c00a05c:	a005                	j	1c00a07c <rt_periph_copy+0xc2>
1c00a05e:	0048a883          	lw	a7,4(a7)
1c00a062:	0088aa23          	sw	s0,20(a7)
1c00a066:	bfd1                	j	1c00a03a <rt_periph_copy+0x80>
1c00a068:	00042823          	sw	zero,16(s0)
1c00a06c:	c010                	sw	a2,0(s0)
1c00a06e:	c054                	sw	a3,4(s0)
1c00a070:	c418                	sw	a4,8(s0)
1c00a072:	00031563          	bnez	t1,1c00a07c <rt_periph_copy+0xc2>
1c00a076:	982e                	add	a6,a6,a1
1c00a078:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a07c:	e399                	bnez	a5,1c00a082 <rt_periph_copy+0xc8>
1c00a07e:	955ff0ef          	jal	ra,1c0099d2 <__rt_wait_event>
1c00a082:	30091073          	csrw	mstatus,s2
1c00a086:	50b2                	lw	ra,44(sp)
1c00a088:	5422                	lw	s0,40(sp)
1c00a08a:	5492                	lw	s1,36(sp)
1c00a08c:	5902                	lw	s2,32(sp)
1c00a08e:	6145                	addi	sp,sp,48
1c00a090:	8082                	ret
1c00a092:	4899                	li	a7,6
1c00a094:	ff1814e3          	bne	a6,a7,1c00a07c <rt_periph_copy+0xc2>
1c00a098:	04000893          	li	a7,64
1c00a09c:	0596                	slli	a1,a1,0x5
1c00a09e:	98ae                	add	a7,a7,a1
1c00a0a0:	0008a303          	lw	t1,0(a7)
1c00a0a4:	00042a23          	sw	zero,20(s0)
1c00a0a8:	04000813          	li	a6,64
1c00a0ac:	00031f63          	bnez	t1,1c00a0ca <rt_periph_copy+0x110>
1c00a0b0:	0088a023          	sw	s0,0(a7)
1c00a0b4:	95c2                	add	a1,a1,a6
1c00a0b6:	c1c0                	sw	s0,4(a1)
1c00a0b8:	00031e63          	bnez	t1,1c00a0d4 <rt_periph_copy+0x11a>
1c00a0bc:	02442803          	lw	a6,36(s0)
1c00a0c0:	1a1025b7          	lui	a1,0x1a102
1c00a0c4:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa10210c>
1c00a0c8:	b779                	j	1c00a056 <rt_periph_copy+0x9c>
1c00a0ca:	0048a883          	lw	a7,4(a7)
1c00a0ce:	0088aa23          	sw	s0,20(a7)
1c00a0d2:	b7cd                	j	1c00a0b4 <rt_periph_copy+0xfa>
1c00a0d4:	c418                	sw	a4,8(s0)
1c00a0d6:	4598                	lw	a4,8(a1)
1c00a0d8:	c010                	sw	a2,0(s0)
1c00a0da:	c054                	sw	a3,4(s0)
1c00a0dc:	00042823          	sw	zero,16(s0)
1c00a0e0:	ff51                	bnez	a4,1c00a07c <rt_periph_copy+0xc2>
1c00a0e2:	c580                	sw	s0,8(a1)
1c00a0e4:	bf61                	j	1c00a07c <rt_periph_copy+0xc2>

1c00a0e6 <__rt_periph_init>:
1c00a0e6:	1c0085b7          	lui	a1,0x1c008
1c00a0ea:	04000693          	li	a3,64
1c00a0ee:	4601                	li	a2,0
1c00a0f0:	04000793          	li	a5,64
1c00a0f4:	1a1028b7          	lui	a7,0x1a102
1c00a0f8:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a0fc:	4841                	li	a6,16
1c00a0fe:	40165713          	srai	a4,a2,0x1
1c00a102:	00461513          	slli	a0,a2,0x4
1c00a106:	071e                	slli	a4,a4,0x7
1c00a108:	9746                	add	a4,a4,a7
1c00a10a:	8941                	andi	a0,a0,16
1c00a10c:	972a                	add	a4,a4,a0
1c00a10e:	0006a023          	sw	zero,0(a3)
1c00a112:	0006a423          	sw	zero,8(a3)
1c00a116:	c6d8                	sw	a4,12(a3)
1c00a118:	cecc                	sw	a1,28(a3)
1c00a11a:	0605                	addi	a2,a2,1
1c00a11c:	02068693          	addi	a3,a3,32
1c00a120:	fd061fe3          	bne	a2,a6,1c00a0fe <__rt_periph_init+0x18>
1c00a124:	1c008737          	lui	a4,0x1c008
1c00a128:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a12c:	2007a023          	sw	zero,512(a5)
1c00a130:	20e7a423          	sw	a4,520(a5)
1c00a134:	20e7a623          	sw	a4,524(a5)
1c00a138:	20e7a823          	sw	a4,528(a5)
1c00a13c:	20e7aa23          	sw	a4,532(a5)
1c00a140:	20e7ac23          	sw	a4,536(a5)
1c00a144:	20e7ae23          	sw	a4,540(a5)
1c00a148:	22e7a023          	sw	a4,544(a5)
1c00a14c:	22e7a223          	sw	a4,548(a5)
1c00a150:	2007a223          	sw	zero,516(a5)
1c00a154:	8082                	ret

1c00a156 <__rt_i2c_init>:
1c00a156:	1c0107b7          	lui	a5,0x1c010
1c00a15a:	46878793          	addi	a5,a5,1128 # 1c010468 <__rt_i2c>
1c00a15e:	00078223          	sb	zero,4(a5)
1c00a162:	00078a23          	sb	zero,20(a5)
1c00a166:	8082                	ret

1c00a168 <__rt_hyper_init>:
1c00a168:	1c001737          	lui	a4,0x1c001
1c00a16c:	26800793          	li	a5,616
1c00a170:	1c072423          	sw	zero,456(a4) # 1c0011c8 <__pi_hyper_cluster_reqs_first>
1c00a174:	577d                	li	a4,-1
1c00a176:	0007aa23          	sw	zero,20(a5)
1c00a17a:	0207a823          	sw	zero,48(a5)
1c00a17e:	cf98                	sw	a4,24(a5)
1c00a180:	8082                	ret

1c00a182 <__rt_spim_init>:
1c00a182:	1c0017b7          	lui	a5,0x1c001
1c00a186:	1c07a623          	sw	zero,460(a5) # 1c0011cc <__rt_spim_open_count>
1c00a18a:	8082                	ret

1c00a18c <rt_is_fc>:
1c00a18c:	f1402573          	csrr	a0,mhartid
1c00a190:	8515                	srai	a0,a0,0x5
1c00a192:	03f57513          	andi	a0,a0,63
1c00a196:	1505                	addi	a0,a0,-31
1c00a198:	00153513          	seqz	a0,a0
1c00a19c:	8082                	ret

1c00a19e <__rt_io_end_of_flush>:
1c00a19e:	1c0017b7          	lui	a5,0x1c001
1c00a1a2:	1c07aa23          	sw	zero,468(a5) # 1c0011d4 <__rt_io_pending_flush>
1c00a1a6:	00052c23          	sw	zero,24(a0)
1c00a1aa:	8082                	ret

1c00a1ac <__rt_io_uart_wait_req>:
1c00a1ac:	1141                	addi	sp,sp,-16
1c00a1ae:	c226                	sw	s1,4(sp)
1c00a1b0:	84aa                	mv	s1,a0
1c00a1b2:	c606                	sw	ra,12(sp)
1c00a1b4:	c422                	sw	s0,8(sp)
1c00a1b6:	c04a                	sw	s2,0(sp)
1c00a1b8:	30047973          	csrrci	s2,mstatus,8
1c00a1bc:	1c001437          	lui	s0,0x1c001
1c00a1c0:	1d040413          	addi	s0,s0,464 # 1c0011d0 <__rt_io_event_current>
1c00a1c4:	4008                	lw	a0,0(s0)
1c00a1c6:	c509                	beqz	a0,1c00a1d0 <__rt_io_uart_wait_req+0x24>
1c00a1c8:	835ff0ef          	jal	ra,1c0099fc <rt_event_wait>
1c00a1cc:	00042023          	sw	zero,0(s0)
1c00a1d0:	4785                	li	a5,1
1c00a1d2:	08f48623          	sb	a5,140(s1)
1c00a1d6:	08d4c783          	lbu	a5,141(s1)
1c00a1da:	00201737          	lui	a4,0x201
1c00a1de:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c00a1e2:	04078793          	addi	a5,a5,64
1c00a1e6:	07da                	slli	a5,a5,0x16
1c00a1e8:	97ba                	add	a5,a5,a4
1c00a1ea:	0007a023          	sw	zero,0(a5)
1c00a1ee:	30091073          	csrw	mstatus,s2
1c00a1f2:	40b2                	lw	ra,12(sp)
1c00a1f4:	4422                	lw	s0,8(sp)
1c00a1f6:	4492                	lw	s1,4(sp)
1c00a1f8:	4902                	lw	s2,0(sp)
1c00a1fa:	0141                	addi	sp,sp,16
1c00a1fc:	8082                	ret

1c00a1fe <__rt_io_start>:
1c00a1fe:	1101                	addi	sp,sp,-32
1c00a200:	0028                	addi	a0,sp,8
1c00a202:	ce06                	sw	ra,28(sp)
1c00a204:	cc22                	sw	s0,24(sp)
1c00a206:	7dd000ef          	jal	ra,1c00b1e2 <rt_uart_conf_init>
1c00a20a:	4585                	li	a1,1
1c00a20c:	4501                	li	a0,0
1c00a20e:	e8cff0ef          	jal	ra,1c00989a <rt_event_alloc>
1c00a212:	547d                	li	s0,-1
1c00a214:	ed1d                	bnez	a0,1c00a252 <__rt_io_start+0x54>
1c00a216:	1c0017b7          	lui	a5,0x1c001
1c00a21a:	0d07a783          	lw	a5,208(a5) # 1c0010d0 <__rt_iodev_uart_baudrate>
1c00a21e:	842a                	mv	s0,a0
1c00a220:	1c001537          	lui	a0,0x1c001
1c00a224:	e3ff6597          	auipc	a1,0xe3ff6
1c00a228:	e0458593          	addi	a1,a1,-508 # 28 <__rt_sched>
1c00a22c:	11c50513          	addi	a0,a0,284 # 1c00111c <__rt_io_event>
1c00a230:	c43e                	sw	a5,8(sp)
1c00a232:	e3eff0ef          	jal	ra,1c009870 <__rt_event_init>
1c00a236:	1c0017b7          	lui	a5,0x1c001
1c00a23a:	1e07a503          	lw	a0,480(a5) # 1c0011e0 <__rt_iodev_uart_channel>
1c00a23e:	4681                	li	a3,0
1c00a240:	4601                	li	a2,0
1c00a242:	002c                	addi	a1,sp,8
1c00a244:	050d                	addi	a0,a0,3
1c00a246:	7ad000ef          	jal	ra,1c00b1f2 <__rt_uart_open>
1c00a24a:	1c0017b7          	lui	a5,0x1c001
1c00a24e:	1ca7ac23          	sw	a0,472(a5) # 1c0011d8 <_rt_io_uart>
1c00a252:	8522                	mv	a0,s0
1c00a254:	40f2                	lw	ra,28(sp)
1c00a256:	4462                	lw	s0,24(sp)
1c00a258:	6105                	addi	sp,sp,32
1c00a25a:	8082                	ret

1c00a25c <rt_event_execute.isra.2.constprop.11>:
1c00a25c:	1141                	addi	sp,sp,-16
1c00a25e:	c606                	sw	ra,12(sp)
1c00a260:	c422                	sw	s0,8(sp)
1c00a262:	30047473          	csrrci	s0,mstatus,8
1c00a266:	4585                	li	a1,1
1c00a268:	e3ff6517          	auipc	a0,0xe3ff6
1c00a26c:	dc050513          	addi	a0,a0,-576 # 28 <__rt_sched>
1c00a270:	f02ff0ef          	jal	ra,1c009972 <__rt_event_execute>
1c00a274:	30041073          	csrw	mstatus,s0
1c00a278:	40b2                	lw	ra,12(sp)
1c00a27a:	4422                	lw	s0,8(sp)
1c00a27c:	0141                	addi	sp,sp,16
1c00a27e:	8082                	ret

1c00a280 <__rt_io_lock>:
1c00a280:	1c0017b7          	lui	a5,0x1c001
1c00a284:	01c7a783          	lw	a5,28(a5) # 1c00101c <__hal_debug_struct+0x10>
1c00a288:	c791                	beqz	a5,1c00a294 <__rt_io_lock+0x14>
1c00a28a:	1c0017b7          	lui	a5,0x1c001
1c00a28e:	1d87a783          	lw	a5,472(a5) # 1c0011d8 <_rt_io_uart>
1c00a292:	c3a1                	beqz	a5,1c00a2d2 <__rt_io_lock+0x52>
1c00a294:	7171                	addi	sp,sp,-176
1c00a296:	d706                	sw	ra,172(sp)
1c00a298:	3dd5                	jal	1c00a18c <rt_is_fc>
1c00a29a:	1c0017b7          	lui	a5,0x1c001
1c00a29e:	c901                	beqz	a0,1c00a2ae <__rt_io_lock+0x2e>
1c00a2a0:	fec78513          	addi	a0,a5,-20 # 1c000fec <__rt_io_fc_lock>
1c00a2a4:	9baff0ef          	jal	ra,1c00945e <__rt_fc_lock>
1c00a2a8:	50ba                	lw	ra,172(sp)
1c00a2aa:	614d                	addi	sp,sp,176
1c00a2ac:	8082                	ret
1c00a2ae:	002c                	addi	a1,sp,8
1c00a2b0:	fec78513          	addi	a0,a5,-20
1c00a2b4:	a1cff0ef          	jal	ra,1c0094d0 <__rt_fc_cluster_lock>
1c00a2b8:	4689                	li	a3,2
1c00a2ba:	00204737          	lui	a4,0x204
1c00a2be:	09c14783          	lbu	a5,156(sp)
1c00a2c2:	0ff7f793          	andi	a5,a5,255
1c00a2c6:	f3ed                	bnez	a5,1c00a2a8 <__rt_io_lock+0x28>
1c00a2c8:	c714                	sw	a3,8(a4)
1c00a2ca:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a2ce:	c354                	sw	a3,4(a4)
1c00a2d0:	b7fd                	j	1c00a2be <__rt_io_lock+0x3e>
1c00a2d2:	8082                	ret

1c00a2d4 <__rt_io_unlock>:
1c00a2d4:	1c0017b7          	lui	a5,0x1c001
1c00a2d8:	01c7a783          	lw	a5,28(a5) # 1c00101c <__hal_debug_struct+0x10>
1c00a2dc:	c791                	beqz	a5,1c00a2e8 <__rt_io_unlock+0x14>
1c00a2de:	1c0017b7          	lui	a5,0x1c001
1c00a2e2:	1d87a783          	lw	a5,472(a5) # 1c0011d8 <_rt_io_uart>
1c00a2e6:	c3a1                	beqz	a5,1c00a326 <__rt_io_unlock+0x52>
1c00a2e8:	7171                	addi	sp,sp,-176
1c00a2ea:	d706                	sw	ra,172(sp)
1c00a2ec:	3545                	jal	1c00a18c <rt_is_fc>
1c00a2ee:	1c0017b7          	lui	a5,0x1c001
1c00a2f2:	c901                	beqz	a0,1c00a302 <__rt_io_unlock+0x2e>
1c00a2f4:	fec78513          	addi	a0,a5,-20 # 1c000fec <__rt_io_fc_lock>
1c00a2f8:	9a2ff0ef          	jal	ra,1c00949a <__rt_fc_unlock>
1c00a2fc:	50ba                	lw	ra,172(sp)
1c00a2fe:	614d                	addi	sp,sp,176
1c00a300:	8082                	ret
1c00a302:	002c                	addi	a1,sp,8
1c00a304:	fec78513          	addi	a0,a5,-20
1c00a308:	a00ff0ef          	jal	ra,1c009508 <__rt_fc_cluster_unlock>
1c00a30c:	4689                	li	a3,2
1c00a30e:	00204737          	lui	a4,0x204
1c00a312:	09c14783          	lbu	a5,156(sp)
1c00a316:	0ff7f793          	andi	a5,a5,255
1c00a31a:	f3ed                	bnez	a5,1c00a2fc <__rt_io_unlock+0x28>
1c00a31c:	c714                	sw	a3,8(a4)
1c00a31e:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a322:	c354                	sw	a3,4(a4)
1c00a324:	b7fd                	j	1c00a312 <__rt_io_unlock+0x3e>
1c00a326:	8082                	ret

1c00a328 <__rt_io_uart_wait_pending>:
1c00a328:	7135                	addi	sp,sp,-160
1c00a32a:	cd22                	sw	s0,152(sp)
1c00a32c:	cf06                	sw	ra,156(sp)
1c00a32e:	cb26                	sw	s1,148(sp)
1c00a330:	1c001437          	lui	s0,0x1c001
1c00a334:	1d442783          	lw	a5,468(s0) # 1c0011d4 <__rt_io_pending_flush>
1c00a338:	e39d                	bnez	a5,1c00a35e <__rt_io_uart_wait_pending+0x36>
1c00a33a:	1c001437          	lui	s0,0x1c001
1c00a33e:	1d040413          	addi	s0,s0,464 # 1c0011d0 <__rt_io_event_current>
1c00a342:	4004                	lw	s1,0(s0)
1c00a344:	c881                	beqz	s1,1c00a354 <__rt_io_uart_wait_pending+0x2c>
1c00a346:	3599                	jal	1c00a18c <rt_is_fc>
1c00a348:	cd19                	beqz	a0,1c00a366 <__rt_io_uart_wait_pending+0x3e>
1c00a34a:	8526                	mv	a0,s1
1c00a34c:	eb0ff0ef          	jal	ra,1c0099fc <rt_event_wait>
1c00a350:	00042023          	sw	zero,0(s0)
1c00a354:	40fa                	lw	ra,156(sp)
1c00a356:	446a                	lw	s0,152(sp)
1c00a358:	44da                	lw	s1,148(sp)
1c00a35a:	610d                	addi	sp,sp,160
1c00a35c:	8082                	ret
1c00a35e:	3f9d                	jal	1c00a2d4 <__rt_io_unlock>
1c00a360:	3df5                	jal	1c00a25c <rt_event_execute.isra.2.constprop.11>
1c00a362:	3f39                	jal	1c00a280 <__rt_io_lock>
1c00a364:	bfc1                	j	1c00a334 <__rt_io_uart_wait_pending+0xc>
1c00a366:	f14027f3          	csrr	a5,mhartid
1c00a36a:	8795                	srai	a5,a5,0x5
1c00a36c:	03f7f793          	andi	a5,a5,63
1c00a370:	08f106a3          	sb	a5,141(sp)
1c00a374:	1c00a7b7          	lui	a5,0x1c00a
1c00a378:	1ac78793          	addi	a5,a5,428 # 1c00a1ac <__rt_io_uart_wait_req>
1c00a37c:	c03e                	sw	a5,0(sp)
1c00a37e:	00010793          	mv	a5,sp
1c00a382:	4705                	li	a4,1
1c00a384:	c23e                	sw	a5,4(sp)
1c00a386:	850a                	mv	a0,sp
1c00a388:	1c0017b7          	lui	a5,0x1c001
1c00a38c:	12e7ae23          	sw	a4,316(a5) # 1c00113c <__rt_io_event+0x20>
1c00a390:	08010623          	sb	zero,140(sp)
1c00a394:	d002                	sw	zero,32(sp)
1c00a396:	d202                	sw	zero,36(sp)
1c00a398:	a17fe0ef          	jal	ra,1c008dae <__rt_cluster_push_fc_event>
1c00a39c:	4689                	li	a3,2
1c00a39e:	00204737          	lui	a4,0x204
1c00a3a2:	08c14783          	lbu	a5,140(sp)
1c00a3a6:	0ff7f793          	andi	a5,a5,255
1c00a3aa:	f7cd                	bnez	a5,1c00a354 <__rt_io_uart_wait_pending+0x2c>
1c00a3ac:	c714                	sw	a3,8(a4)
1c00a3ae:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a3b2:	c354                	sw	a3,4(a4)
1c00a3b4:	b7fd                	j	1c00a3a2 <__rt_io_uart_wait_pending+0x7a>

1c00a3b6 <__rt_io_stop>:
1c00a3b6:	1141                	addi	sp,sp,-16
1c00a3b8:	c422                	sw	s0,8(sp)
1c00a3ba:	1c001437          	lui	s0,0x1c001
1c00a3be:	c606                	sw	ra,12(sp)
1c00a3c0:	1d840413          	addi	s0,s0,472 # 1c0011d8 <_rt_io_uart>
1c00a3c4:	3795                	jal	1c00a328 <__rt_io_uart_wait_pending>
1c00a3c6:	4008                	lw	a0,0(s0)
1c00a3c8:	4581                	li	a1,0
1c00a3ca:	6b1000ef          	jal	ra,1c00b27a <rt_uart_close>
1c00a3ce:	40b2                	lw	ra,12(sp)
1c00a3d0:	00042023          	sw	zero,0(s0)
1c00a3d4:	4422                	lw	s0,8(sp)
1c00a3d6:	4501                	li	a0,0
1c00a3d8:	0141                	addi	sp,sp,16
1c00a3da:	8082                	ret

1c00a3dc <__rt_io_uart_flush.constprop.10>:
1c00a3dc:	7131                	addi	sp,sp,-192
1c00a3de:	dd22                	sw	s0,184(sp)
1c00a3e0:	df06                	sw	ra,188(sp)
1c00a3e2:	db26                	sw	s1,180(sp)
1c00a3e4:	d94a                	sw	s2,176(sp)
1c00a3e6:	d74e                	sw	s3,172(sp)
1c00a3e8:	d552                	sw	s4,168(sp)
1c00a3ea:	d356                	sw	s5,164(sp)
1c00a3ec:	1c001437          	lui	s0,0x1c001
1c00a3f0:	1d442783          	lw	a5,468(s0) # 1c0011d4 <__rt_io_pending_flush>
1c00a3f4:	1d440a13          	addi	s4,s0,468
1c00a3f8:	e7b5                	bnez	a5,1c00a464 <__rt_io_uart_flush.constprop.10+0x88>
1c00a3fa:	1c0014b7          	lui	s1,0x1c001
1c00a3fe:	00c48793          	addi	a5,s1,12 # 1c00100c <__hal_debug_struct>
1c00a402:	4f80                	lw	s0,24(a5)
1c00a404:	00c48a93          	addi	s5,s1,12
1c00a408:	c429                	beqz	s0,1c00a452 <__rt_io_uart_flush.constprop.10+0x76>
1c00a40a:	3349                	jal	1c00a18c <rt_is_fc>
1c00a40c:	1c0017b7          	lui	a5,0x1c001
1c00a410:	1d87a903          	lw	s2,472(a5) # 1c0011d8 <_rt_io_uart>
1c00a414:	1c0019b7          	lui	s3,0x1c001
1c00a418:	cd21                	beqz	a0,1c00a470 <__rt_io_uart_flush.constprop.10+0x94>
1c00a41a:	1c00a5b7          	lui	a1,0x1c00a
1c00a41e:	4785                	li	a5,1
1c00a420:	00c48613          	addi	a2,s1,12
1c00a424:	19e58593          	addi	a1,a1,414 # 1c00a19e <__rt_io_end_of_flush>
1c00a428:	4501                	li	a0,0
1c00a42a:	00fa2023          	sw	a5,0(s4)
1c00a42e:	ce4ff0ef          	jal	ra,1c009912 <rt_event_get>
1c00a432:	00492583          	lw	a1,4(s2)
1c00a436:	87aa                	mv	a5,a0
1c00a438:	4701                	li	a4,0
1c00a43a:	0586                	slli	a1,a1,0x1
1c00a43c:	86a2                	mv	a3,s0
1c00a43e:	02898613          	addi	a2,s3,40 # 1c001028 <__hal_debug_struct+0x1c>
1c00a442:	0585                	addi	a1,a1,1
1c00a444:	4501                	li	a0,0
1c00a446:	3e95                	jal	1c009fba <rt_periph_copy>
1c00a448:	3571                	jal	1c00a2d4 <__rt_io_unlock>
1c00a44a:	000a2783          	lw	a5,0(s4)
1c00a44e:	ef99                	bnez	a5,1c00a46c <__rt_io_uart_flush.constprop.10+0x90>
1c00a450:	3d05                	jal	1c00a280 <__rt_io_lock>
1c00a452:	50fa                	lw	ra,188(sp)
1c00a454:	546a                	lw	s0,184(sp)
1c00a456:	54da                	lw	s1,180(sp)
1c00a458:	594a                	lw	s2,176(sp)
1c00a45a:	59ba                	lw	s3,172(sp)
1c00a45c:	5a2a                	lw	s4,168(sp)
1c00a45e:	5a9a                	lw	s5,164(sp)
1c00a460:	6129                	addi	sp,sp,192
1c00a462:	8082                	ret
1c00a464:	3d85                	jal	1c00a2d4 <__rt_io_unlock>
1c00a466:	3bdd                	jal	1c00a25c <rt_event_execute.isra.2.constprop.11>
1c00a468:	3d21                	jal	1c00a280 <__rt_io_lock>
1c00a46a:	b759                	j	1c00a3f0 <__rt_io_uart_flush.constprop.10+0x14>
1c00a46c:	3bc5                	jal	1c00a25c <rt_event_execute.isra.2.constprop.11>
1c00a46e:	bff1                	j	1c00a44a <__rt_io_uart_flush.constprop.10+0x6e>
1c00a470:	0054                	addi	a3,sp,4
1c00a472:	8622                	mv	a2,s0
1c00a474:	02898593          	addi	a1,s3,40
1c00a478:	854a                	mv	a0,s2
1c00a47a:	64b000ef          	jal	ra,1c00b2c4 <rt_uart_cluster_write>
1c00a47e:	4689                	li	a3,2
1c00a480:	00204737          	lui	a4,0x204
1c00a484:	09c14783          	lbu	a5,156(sp)
1c00a488:	0ff7f793          	andi	a5,a5,255
1c00a48c:	c781                	beqz	a5,1c00a494 <__rt_io_uart_flush.constprop.10+0xb8>
1c00a48e:	000aac23          	sw	zero,24(s5)
1c00a492:	b7c1                	j	1c00a452 <__rt_io_uart_flush.constprop.10+0x76>
1c00a494:	c714                	sw	a3,8(a4)
1c00a496:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f4050>
1c00a49a:	c354                	sw	a3,4(a4)
1c00a49c:	b7e5                	j	1c00a484 <__rt_io_uart_flush.constprop.10+0xa8>

1c00a49e <memset>:
1c00a49e:	962a                	add	a2,a2,a0
1c00a4a0:	87aa                	mv	a5,a0
1c00a4a2:	00c79363          	bne	a5,a2,1c00a4a8 <memset+0xa>
1c00a4a6:	8082                	ret
1c00a4a8:	0785                	addi	a5,a5,1
1c00a4aa:	feb78fa3          	sb	a1,-1(a5)
1c00a4ae:	bfd5                	j	1c00a4a2 <memset+0x4>

1c00a4b0 <memcpy>:
1c00a4b0:	962a                	add	a2,a2,a0
1c00a4b2:	87aa                	mv	a5,a0
1c00a4b4:	00c79363          	bne	a5,a2,1c00a4ba <memcpy+0xa>
1c00a4b8:	8082                	ret
1c00a4ba:	0585                	addi	a1,a1,1
1c00a4bc:	fff5c703          	lbu	a4,-1(a1)
1c00a4c0:	0785                	addi	a5,a5,1
1c00a4c2:	fee78fa3          	sb	a4,-1(a5)
1c00a4c6:	b7fd                	j	1c00a4b4 <memcpy+0x4>

1c00a4c8 <memmove>:
1c00a4c8:	40b507b3          	sub	a5,a0,a1
1c00a4cc:	00c7e763          	bltu	a5,a2,1c00a4da <memmove+0x12>
1c00a4d0:	962e                	add	a2,a2,a1
1c00a4d2:	87aa                	mv	a5,a0
1c00a4d4:	00c59e63          	bne	a1,a2,1c00a4f0 <memmove+0x28>
1c00a4d8:	8082                	ret
1c00a4da:	167d                	addi	a2,a2,-1
1c00a4dc:	00c587b3          	add	a5,a1,a2
1c00a4e0:	0007c703          	lbu	a4,0(a5)
1c00a4e4:	00c507b3          	add	a5,a0,a2
1c00a4e8:	00e78023          	sb	a4,0(a5)
1c00a4ec:	f67d                	bnez	a2,1c00a4da <memmove+0x12>
1c00a4ee:	8082                	ret
1c00a4f0:	0005c703          	lbu	a4,0(a1)
1c00a4f4:	0785                	addi	a5,a5,1
1c00a4f6:	0585                	addi	a1,a1,1
1c00a4f8:	fee78fa3          	sb	a4,-1(a5)
1c00a4fc:	bfe1                	j	1c00a4d4 <memmove+0xc>

1c00a4fe <strchr>:
1c00a4fe:	0ff5f593          	andi	a1,a1,255
1c00a502:	00054783          	lbu	a5,0(a0)
1c00a506:	00b78563          	beq	a5,a1,1c00a510 <strchr+0x12>
1c00a50a:	e781                	bnez	a5,1c00a512 <strchr+0x14>
1c00a50c:	c191                	beqz	a1,1c00a510 <strchr+0x12>
1c00a50e:	4501                	li	a0,0
1c00a510:	8082                	ret
1c00a512:	0505                	addi	a0,a0,1
1c00a514:	b7fd                	j	1c00a502 <strchr+0x4>

1c00a516 <__rt_putc_debug_bridge>:
1c00a516:	1141                	addi	sp,sp,-16
1c00a518:	c422                	sw	s0,8(sp)
1c00a51a:	1c001437          	lui	s0,0x1c001
1c00a51e:	c226                	sw	s1,4(sp)
1c00a520:	c606                	sw	ra,12(sp)
1c00a522:	84aa                	mv	s1,a0
1c00a524:	00c40413          	addi	s0,s0,12 # 1c00100c <__hal_debug_struct>
1c00a528:	485c                	lw	a5,20(s0)
1c00a52a:	c791                	beqz	a5,1c00a536 <__rt_putc_debug_bridge+0x20>
1c00a52c:	06400513          	li	a0,100
1c00a530:	90bff0ef          	jal	ra,1c009e3a <rt_time_wait_us>
1c00a534:	bfd5                	j	1c00a528 <__rt_putc_debug_bridge+0x12>
1c00a536:	4c1c                	lw	a5,24(s0)
1c00a538:	00178713          	addi	a4,a5,1
1c00a53c:	97a2                	add	a5,a5,s0
1c00a53e:	00978e23          	sb	s1,28(a5)
1c00a542:	cc18                	sw	a4,24(s0)
1c00a544:	4c14                	lw	a3,24(s0)
1c00a546:	08000793          	li	a5,128
1c00a54a:	00f68563          	beq	a3,a5,1c00a554 <__rt_putc_debug_bridge+0x3e>
1c00a54e:	47a9                	li	a5,10
1c00a550:	00f49663          	bne	s1,a5,1c00a55c <__rt_putc_debug_bridge+0x46>
1c00a554:	c701                	beqz	a4,1c00a55c <__rt_putc_debug_bridge+0x46>
1c00a556:	c858                	sw	a4,20(s0)
1c00a558:	00042c23          	sw	zero,24(s0)
1c00a55c:	4c1c                	lw	a5,24(s0)
1c00a55e:	e799                	bnez	a5,1c00a56c <__rt_putc_debug_bridge+0x56>
1c00a560:	4422                	lw	s0,8(sp)
1c00a562:	40b2                	lw	ra,12(sp)
1c00a564:	4492                	lw	s1,4(sp)
1c00a566:	0141                	addi	sp,sp,16
1c00a568:	94aff06f          	j	1c0096b2 <__rt_bridge_printf_flush>
1c00a56c:	40b2                	lw	ra,12(sp)
1c00a56e:	4422                	lw	s0,8(sp)
1c00a570:	4492                	lw	s1,4(sp)
1c00a572:	0141                	addi	sp,sp,16
1c00a574:	8082                	ret

1c00a576 <__rt_putc_uart>:
1c00a576:	1101                	addi	sp,sp,-32
1c00a578:	c62a                	sw	a0,12(sp)
1c00a57a:	ce06                	sw	ra,28(sp)
1c00a57c:	3375                	jal	1c00a328 <__rt_io_uart_wait_pending>
1c00a57e:	1c0017b7          	lui	a5,0x1c001
1c00a582:	00c78793          	addi	a5,a5,12 # 1c00100c <__hal_debug_struct>
1c00a586:	4f94                	lw	a3,24(a5)
1c00a588:	4532                	lw	a0,12(sp)
1c00a58a:	00168713          	addi	a4,a3,1
1c00a58e:	cf98                	sw	a4,24(a5)
1c00a590:	97b6                	add	a5,a5,a3
1c00a592:	00a78e23          	sb	a0,28(a5)
1c00a596:	08000793          	li	a5,128
1c00a59a:	00f70563          	beq	a4,a5,1c00a5a4 <__rt_putc_uart+0x2e>
1c00a59e:	47a9                	li	a5,10
1c00a5a0:	00f51563          	bne	a0,a5,1c00a5aa <__rt_putc_uart+0x34>
1c00a5a4:	40f2                	lw	ra,28(sp)
1c00a5a6:	6105                	addi	sp,sp,32
1c00a5a8:	bd15                	j	1c00a3dc <__rt_io_uart_flush.constprop.10>
1c00a5aa:	40f2                	lw	ra,28(sp)
1c00a5ac:	6105                	addi	sp,sp,32
1c00a5ae:	8082                	ret

1c00a5b0 <tfp_putc.isra.8>:
1c00a5b0:	1c0017b7          	lui	a5,0x1c001
1c00a5b4:	1d87a783          	lw	a5,472(a5) # 1c0011d8 <_rt_io_uart>
1c00a5b8:	c391                	beqz	a5,1c00a5bc <tfp_putc.isra.8+0xc>
1c00a5ba:	bf75                	j	1c00a576 <__rt_putc_uart>
1c00a5bc:	1c0017b7          	lui	a5,0x1c001
1c00a5c0:	01c7a783          	lw	a5,28(a5) # 1c00101c <__hal_debug_struct+0x10>
1c00a5c4:	c395                	beqz	a5,1c00a5e8 <tfp_putc.isra.8+0x38>
1c00a5c6:	6689                	lui	a3,0x2
1c00a5c8:	f14027f3          	csrr	a5,mhartid
1c00a5cc:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a5d0:	00379713          	slli	a4,a5,0x3
1c00a5d4:	078a                	slli	a5,a5,0x2
1c00a5d6:	0ff77713          	andi	a4,a4,255
1c00a5da:	8ff5                	and	a5,a5,a3
1c00a5dc:	97ba                	add	a5,a5,a4
1c00a5de:	1a10f737          	lui	a4,0x1a10f
1c00a5e2:	97ba                	add	a5,a5,a4
1c00a5e4:	c388                	sw	a0,0(a5)
1c00a5e6:	8082                	ret
1c00a5e8:	b73d                	j	1c00a516 <__rt_putc_debug_bridge>

1c00a5ea <puts>:
1c00a5ea:	1141                	addi	sp,sp,-16
1c00a5ec:	c422                	sw	s0,8(sp)
1c00a5ee:	c606                	sw	ra,12(sp)
1c00a5f0:	842a                	mv	s0,a0
1c00a5f2:	3179                	jal	1c00a280 <__rt_io_lock>
1c00a5f4:	00044503          	lbu	a0,0(s0)
1c00a5f8:	c501                	beqz	a0,1c00a600 <puts+0x16>
1c00a5fa:	3f5d                	jal	1c00a5b0 <tfp_putc.isra.8>
1c00a5fc:	0405                	addi	s0,s0,1
1c00a5fe:	bfdd                	j	1c00a5f4 <puts+0xa>
1c00a600:	4529                	li	a0,10
1c00a602:	377d                	jal	1c00a5b0 <tfp_putc.isra.8>
1c00a604:	39c1                	jal	1c00a2d4 <__rt_io_unlock>
1c00a606:	40b2                	lw	ra,12(sp)
1c00a608:	4422                	lw	s0,8(sp)
1c00a60a:	4501                	li	a0,0
1c00a60c:	0141                	addi	sp,sp,16
1c00a60e:	8082                	ret

1c00a610 <fputc_locked>:
1c00a610:	1141                	addi	sp,sp,-16
1c00a612:	c422                	sw	s0,8(sp)
1c00a614:	842a                	mv	s0,a0
1c00a616:	0ff57513          	andi	a0,a0,255
1c00a61a:	c606                	sw	ra,12(sp)
1c00a61c:	3f51                	jal	1c00a5b0 <tfp_putc.isra.8>
1c00a61e:	8522                	mv	a0,s0
1c00a620:	40b2                	lw	ra,12(sp)
1c00a622:	4422                	lw	s0,8(sp)
1c00a624:	0141                	addi	sp,sp,16
1c00a626:	8082                	ret

1c00a628 <_prf_locked>:
1c00a628:	1101                	addi	sp,sp,-32
1c00a62a:	ce06                	sw	ra,28(sp)
1c00a62c:	c02a                	sw	a0,0(sp)
1c00a62e:	c62e                	sw	a1,12(sp)
1c00a630:	c432                	sw	a2,8(sp)
1c00a632:	c236                	sw	a3,4(sp)
1c00a634:	31b1                	jal	1c00a280 <__rt_io_lock>
1c00a636:	4692                	lw	a3,4(sp)
1c00a638:	4622                	lw	a2,8(sp)
1c00a63a:	45b2                	lw	a1,12(sp)
1c00a63c:	4502                	lw	a0,0(sp)
1c00a63e:	2ae9                	jal	1c00a818 <_prf>
1c00a640:	c02a                	sw	a0,0(sp)
1c00a642:	3949                	jal	1c00a2d4 <__rt_io_unlock>
1c00a644:	40f2                	lw	ra,28(sp)
1c00a646:	4502                	lw	a0,0(sp)
1c00a648:	6105                	addi	sp,sp,32
1c00a64a:	8082                	ret

1c00a64c <exit>:
1c00a64c:	1141                	addi	sp,sp,-16
1c00a64e:	c606                	sw	ra,12(sp)
1c00a650:	c422                	sw	s0,8(sp)
1c00a652:	842a                	mv	s0,a0
1c00a654:	85eff0ef          	jal	ra,1c0096b2 <__rt_bridge_printf_flush>
1c00a658:	80000537          	lui	a0,0x80000
1c00a65c:	1c0017b7          	lui	a5,0x1c001
1c00a660:	8c49                	or	s0,s0,a0
1c00a662:	00c78793          	addi	a5,a5,12 # 1c00100c <__hal_debug_struct>
1c00a666:	c7c0                	sw	s0,12(a5)
1c00a668:	81aff0ef          	jal	ra,1c009682 <__rt_bridge_send_notif>
1c00a66c:	1a1047b7          	lui	a5,0x1a104
1c00a670:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa10408c>
1c00a674:	a001                	j	1c00a674 <exit+0x28>

1c00a676 <abort>:
1c00a676:	1141                	addi	sp,sp,-16
1c00a678:	557d                	li	a0,-1
1c00a67a:	c606                	sw	ra,12(sp)
1c00a67c:	3fc1                	jal	1c00a64c <exit>

1c00a67e <__rt_io_init>:
1c00a67e:	1c0017b7          	lui	a5,0x1c001
1c00a682:	fec78793          	addi	a5,a5,-20 # 1c000fec <__rt_io_fc_lock>
1c00a686:	0007a223          	sw	zero,4(a5)
1c00a68a:	0007a023          	sw	zero,0(a5)
1c00a68e:	0007a623          	sw	zero,12(a5)
1c00a692:	1c0017b7          	lui	a5,0x1c001
1c00a696:	1c07ac23          	sw	zero,472(a5) # 1c0011d8 <_rt_io_uart>
1c00a69a:	1c0017b7          	lui	a5,0x1c001
1c00a69e:	1c07a823          	sw	zero,464(a5) # 1c0011d0 <__rt_io_event_current>
1c00a6a2:	1c0017b7          	lui	a5,0x1c001
1c00a6a6:	1dc7a703          	lw	a4,476(a5) # 1c0011dc <__rt_iodev>
1c00a6aa:	4785                	li	a5,1
1c00a6ac:	02f71e63          	bne	a4,a5,1c00a6e8 <__rt_io_init+0x6a>
1c00a6b0:	1c00a5b7          	lui	a1,0x1c00a
1c00a6b4:	1141                	addi	sp,sp,-16
1c00a6b6:	4601                	li	a2,0
1c00a6b8:	1fe58593          	addi	a1,a1,510 # 1c00a1fe <__rt_io_start>
1c00a6bc:	4501                	li	a0,0
1c00a6be:	c606                	sw	ra,12(sp)
1c00a6c0:	d0bfe0ef          	jal	ra,1c0093ca <__rt_cbsys_add>
1c00a6c4:	1c00a5b7          	lui	a1,0x1c00a
1c00a6c8:	3b658593          	addi	a1,a1,950 # 1c00a3b6 <__rt_io_stop>
1c00a6cc:	4601                	li	a2,0
1c00a6ce:	4505                	li	a0,1
1c00a6d0:	cfbfe0ef          	jal	ra,1c0093ca <__rt_cbsys_add>
1c00a6d4:	40b2                	lw	ra,12(sp)
1c00a6d6:	1c0017b7          	lui	a5,0x1c001
1c00a6da:	1c07aa23          	sw	zero,468(a5) # 1c0011d4 <__rt_io_pending_flush>
1c00a6de:	4585                	li	a1,1
1c00a6e0:	4501                	li	a0,0
1c00a6e2:	0141                	addi	sp,sp,16
1c00a6e4:	9b6ff06f          	j	1c00989a <rt_event_alloc>
1c00a6e8:	8082                	ret

1c00a6ea <printf>:
1c00a6ea:	7139                	addi	sp,sp,-64
1c00a6ec:	d432                	sw	a2,40(sp)
1c00a6ee:	862a                	mv	a2,a0
1c00a6f0:	1c00a537          	lui	a0,0x1c00a
1c00a6f4:	d22e                	sw	a1,36(sp)
1c00a6f6:	d636                	sw	a3,44(sp)
1c00a6f8:	4589                	li	a1,2
1c00a6fa:	1054                	addi	a3,sp,36
1c00a6fc:	61050513          	addi	a0,a0,1552 # 1c00a610 <fputc_locked>
1c00a700:	ce06                	sw	ra,28(sp)
1c00a702:	d83a                	sw	a4,48(sp)
1c00a704:	da3e                	sw	a5,52(sp)
1c00a706:	dc42                	sw	a6,56(sp)
1c00a708:	de46                	sw	a7,60(sp)
1c00a70a:	c636                	sw	a3,12(sp)
1c00a70c:	3f31                	jal	1c00a628 <_prf_locked>
1c00a70e:	40f2                	lw	ra,28(sp)
1c00a710:	6121                	addi	sp,sp,64
1c00a712:	8082                	ret

1c00a714 <_to_x>:
1c00a714:	872a                	mv	a4,a0
1c00a716:	87aa                	mv	a5,a0
1c00a718:	4325                	li	t1,9
1c00a71a:	02c5f8b3          	remu	a7,a1,a2
1c00a71e:	02700513          	li	a0,39
1c00a722:	02c5d5b3          	divu	a1,a1,a2
1c00a726:	0ff8f813          	andi	a6,a7,255
1c00a72a:	01136363          	bltu	t1,a7,1c00a730 <_to_x+0x1c>
1c00a72e:	4501                	li	a0,0
1c00a730:	03080813          	addi	a6,a6,48
1c00a734:	0785                	addi	a5,a5,1
1c00a736:	9542                	add	a0,a0,a6
1c00a738:	fea78fa3          	sb	a0,-1(a5)
1c00a73c:	fdf9                	bnez	a1,1c00a71a <_to_x+0x6>
1c00a73e:	03000613          	li	a2,48
1c00a742:	40e78533          	sub	a0,a5,a4
1c00a746:	00d54863          	blt	a0,a3,1c00a756 <_to_x+0x42>
1c00a74a:	00078023          	sb	zero,0(a5)
1c00a74e:	17fd                	addi	a5,a5,-1
1c00a750:	00f76763          	bltu	a4,a5,1c00a75e <_to_x+0x4a>
1c00a754:	8082                	ret
1c00a756:	0785                	addi	a5,a5,1
1c00a758:	fec78fa3          	sb	a2,-1(a5)
1c00a75c:	b7dd                	j	1c00a742 <_to_x+0x2e>
1c00a75e:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10efec>
1c00a762:	0007c683          	lbu	a3,0(a5)
1c00a766:	0705                	addi	a4,a4,1
1c00a768:	00c78023          	sb	a2,0(a5)
1c00a76c:	fed70fa3          	sb	a3,-1(a4)
1c00a770:	17fd                	addi	a5,a5,-1
1c00a772:	bff9                	j	1c00a750 <_to_x+0x3c>

1c00a774 <_rlrshift>:
1c00a774:	411c                	lw	a5,0(a0)
1c00a776:	4154                	lw	a3,4(a0)
1c00a778:	0017f713          	andi	a4,a5,1
1c00a77c:	01f69613          	slli	a2,a3,0x1f
1c00a780:	8385                	srli	a5,a5,0x1
1c00a782:	8fd1                	or	a5,a5,a2
1c00a784:	97ba                	add	a5,a5,a4
1c00a786:	8285                	srli	a3,a3,0x1
1c00a788:	00e7b733          	sltu	a4,a5,a4
1c00a78c:	9736                	add	a4,a4,a3
1c00a78e:	c11c                	sw	a5,0(a0)
1c00a790:	c158                	sw	a4,4(a0)
1c00a792:	8082                	ret

1c00a794 <_ldiv5>:
1c00a794:	4118                	lw	a4,0(a0)
1c00a796:	4154                	lw	a3,4(a0)
1c00a798:	4615                	li	a2,5
1c00a79a:	00270793          	addi	a5,a4,2
1c00a79e:	00e7b733          	sltu	a4,a5,a4
1c00a7a2:	9736                	add	a4,a4,a3
1c00a7a4:	02c755b3          	divu	a1,a4,a2
1c00a7a8:	02b606b3          	mul	a3,a2,a1
1c00a7ac:	8f15                	sub	a4,a4,a3
1c00a7ae:	01d71693          	slli	a3,a4,0x1d
1c00a7b2:	0037d713          	srli	a4,a5,0x3
1c00a7b6:	8f55                	or	a4,a4,a3
1c00a7b8:	02c75733          	divu	a4,a4,a2
1c00a7bc:	01d75693          	srli	a3,a4,0x1d
1c00a7c0:	070e                	slli	a4,a4,0x3
1c00a7c2:	95b6                	add	a1,a1,a3
1c00a7c4:	02e606b3          	mul	a3,a2,a4
1c00a7c8:	8f95                	sub	a5,a5,a3
1c00a7ca:	02c7d7b3          	divu	a5,a5,a2
1c00a7ce:	973e                	add	a4,a4,a5
1c00a7d0:	00f737b3          	sltu	a5,a4,a5
1c00a7d4:	97ae                	add	a5,a5,a1
1c00a7d6:	c118                	sw	a4,0(a0)
1c00a7d8:	c15c                	sw	a5,4(a0)
1c00a7da:	8082                	ret

1c00a7dc <_get_digit>:
1c00a7dc:	419c                	lw	a5,0(a1)
1c00a7de:	03000713          	li	a4,48
1c00a7e2:	02f05863          	blez	a5,1c00a812 <_get_digit+0x36>
1c00a7e6:	17fd                	addi	a5,a5,-1
1c00a7e8:	4114                	lw	a3,0(a0)
1c00a7ea:	c19c                	sw	a5,0(a1)
1c00a7ec:	415c                	lw	a5,4(a0)
1c00a7ee:	4729                	li	a4,10
1c00a7f0:	02d70633          	mul	a2,a4,a3
1c00a7f4:	02f707b3          	mul	a5,a4,a5
1c00a7f8:	c110                	sw	a2,0(a0)
1c00a7fa:	02d73733          	mulhu	a4,a4,a3
1c00a7fe:	100006b7          	lui	a3,0x10000
1c00a802:	16fd                	addi	a3,a3,-1
1c00a804:	97ba                	add	a5,a5,a4
1c00a806:	01c7d713          	srli	a4,a5,0x1c
1c00a80a:	8ff5                	and	a5,a5,a3
1c00a80c:	03070713          	addi	a4,a4,48
1c00a810:	c15c                	sw	a5,4(a0)
1c00a812:	0ff77513          	andi	a0,a4,255
1c00a816:	8082                	ret

1c00a818 <_prf>:
1c00a818:	714d                	addi	sp,sp,-336
1c00a81a:	14912223          	sw	s1,324(sp)
1c00a81e:	13312e23          	sw	s3,316(sp)
1c00a822:	13812423          	sw	s8,296(sp)
1c00a826:	14112623          	sw	ra,332(sp)
1c00a82a:	14812423          	sw	s0,328(sp)
1c00a82e:	15212023          	sw	s2,320(sp)
1c00a832:	13412c23          	sw	s4,312(sp)
1c00a836:	13512a23          	sw	s5,308(sp)
1c00a83a:	13612823          	sw	s6,304(sp)
1c00a83e:	13712623          	sw	s7,300(sp)
1c00a842:	13912223          	sw	s9,292(sp)
1c00a846:	13a12023          	sw	s10,288(sp)
1c00a84a:	11b12e23          	sw	s11,284(sp)
1c00a84e:	cc2a                	sw	a0,24(sp)
1c00a850:	ce2e                	sw	a1,28(sp)
1c00a852:	84b2                	mv	s1,a2
1c00a854:	8c36                	mv	s8,a3
1c00a856:	4981                	li	s3,0
1c00a858:	0004c503          	lbu	a0,0(s1)
1c00a85c:	00148b93          	addi	s7,s1,1
1c00a860:	cd01                	beqz	a0,1c00a878 <_prf+0x60>
1c00a862:	02500793          	li	a5,37
1c00a866:	14f50963          	beq	a0,a5,1c00a9b8 <_prf+0x1a0>
1c00a86a:	45f2                	lw	a1,28(sp)
1c00a86c:	4762                	lw	a4,24(sp)
1c00a86e:	9702                	jalr	a4
1c00a870:	57fd                	li	a5,-1
1c00a872:	04f51063          	bne	a0,a5,1c00a8b2 <_prf+0x9a>
1c00a876:	59fd                	li	s3,-1
1c00a878:	14c12083          	lw	ra,332(sp)
1c00a87c:	14812403          	lw	s0,328(sp)
1c00a880:	854e                	mv	a0,s3
1c00a882:	14412483          	lw	s1,324(sp)
1c00a886:	14012903          	lw	s2,320(sp)
1c00a88a:	13c12983          	lw	s3,316(sp)
1c00a88e:	13812a03          	lw	s4,312(sp)
1c00a892:	13412a83          	lw	s5,308(sp)
1c00a896:	13012b03          	lw	s6,304(sp)
1c00a89a:	12c12b83          	lw	s7,300(sp)
1c00a89e:	12812c03          	lw	s8,296(sp)
1c00a8a2:	12412c83          	lw	s9,292(sp)
1c00a8a6:	12012d03          	lw	s10,288(sp)
1c00a8aa:	11c12d83          	lw	s11,284(sp)
1c00a8ae:	6171                	addi	sp,sp,336
1c00a8b0:	8082                	ret
1c00a8b2:	0985                	addi	s3,s3,1
1c00a8b4:	8a62                	mv	s4,s8
1c00a8b6:	84de                	mv	s1,s7
1c00a8b8:	8c52                	mv	s8,s4
1c00a8ba:	bf79                	j	1c00a858 <_prf+0x40>
1c00a8bc:	0f2a8563          	beq	s5,s2,1c00a9a6 <_prf+0x18e>
1c00a8c0:	0d596863          	bltu	s2,s5,1c00a990 <_prf+0x178>
1c00a8c4:	fa0a8ae3          	beqz	s5,1c00a878 <_prf+0x60>
1c00a8c8:	0dba8d63          	beq	s5,s11,1c00a9a2 <_prf+0x18a>
1c00a8cc:	8ba6                	mv	s7,s1
1c00a8ce:	001b8493          	addi	s1,s7,1
1c00a8d2:	fff4ca83          	lbu	s5,-1(s1)
1c00a8d6:	1c0007b7          	lui	a5,0x1c000
1c00a8da:	69878513          	addi	a0,a5,1688 # 1c000698 <__DTOR_END__+0x3ac>
1c00a8de:	85d6                	mv	a1,s5
1c00a8e0:	3939                	jal	1c00a4fe <strchr>
1c00a8e2:	fd69                	bnez	a0,1c00a8bc <_prf+0xa4>
1c00a8e4:	02a00693          	li	a3,42
1c00a8e8:	0eda9a63          	bne	s5,a3,1c00a9dc <_prf+0x1c4>
1c00a8ec:	000c2903          	lw	s2,0(s8)
1c00a8f0:	004c0693          	addi	a3,s8,4
1c00a8f4:	00095663          	bgez	s2,1c00a900 <_prf+0xe8>
1c00a8f8:	4705                	li	a4,1
1c00a8fa:	41200933          	neg	s2,s2
1c00a8fe:	c63a                	sw	a4,12(sp)
1c00a900:	0004ca83          	lbu	s5,0(s1)
1c00a904:	8c36                	mv	s8,a3
1c00a906:	002b8493          	addi	s1,s7,2
1c00a90a:	0c800713          	li	a4,200
1c00a90e:	01277463          	bleu	s2,a4,1c00a916 <_prf+0xfe>
1c00a912:	0c800913          	li	s2,200
1c00a916:	02e00693          	li	a3,46
1c00a91a:	5d7d                	li	s10,-1
1c00a91c:	02da9463          	bne	s5,a3,1c00a944 <_prf+0x12c>
1c00a920:	0004c703          	lbu	a4,0(s1)
1c00a924:	02a00793          	li	a5,42
1c00a928:	10f71063          	bne	a4,a5,1c00aa28 <_prf+0x210>
1c00a92c:	000c2d03          	lw	s10,0(s8)
1c00a930:	0485                	addi	s1,s1,1
1c00a932:	0c11                	addi	s8,s8,4
1c00a934:	0c800793          	li	a5,200
1c00a938:	01a7d363          	ble	s10,a5,1c00a93e <_prf+0x126>
1c00a93c:	5d7d                	li	s10,-1
1c00a93e:	0004ca83          	lbu	s5,0(s1)
1c00a942:	0485                	addi	s1,s1,1
1c00a944:	1c0007b7          	lui	a5,0x1c000
1c00a948:	85d6                	mv	a1,s5
1c00a94a:	6a078513          	addi	a0,a5,1696 # 1c0006a0 <__DTOR_END__+0x3b4>
1c00a94e:	bb1ff0ef          	jal	ra,1c00a4fe <strchr>
1c00a952:	c501                	beqz	a0,1c00a95a <_prf+0x142>
1c00a954:	0004ca83          	lbu	s5,0(s1)
1c00a958:	0485                	addi	s1,s1,1
1c00a95a:	06700693          	li	a3,103
1c00a95e:	1356c263          	blt	a3,s5,1c00aa82 <_prf+0x26a>
1c00a962:	06500693          	li	a3,101
1c00a966:	1edadd63          	ble	a3,s5,1c00ab60 <_prf+0x348>
1c00a96a:	04700693          	li	a3,71
1c00a96e:	0d56c163          	blt	a3,s5,1c00aa30 <_prf+0x218>
1c00a972:	04500693          	li	a3,69
1c00a976:	1edad563          	ble	a3,s5,1c00ab60 <_prf+0x348>
1c00a97a:	ee0a8fe3          	beqz	s5,1c00a878 <_prf+0x60>
1c00a97e:	02500713          	li	a4,37
1c00a982:	68ea8263          	beq	s5,a4,1c00b006 <_prf+0x7ee>
1c00a986:	0c800713          	li	a4,200
1c00a98a:	69575763          	ble	s5,a4,1c00b018 <_prf+0x800>
1c00a98e:	b5e5                	j	1c00a876 <_prf+0x5e>
1c00a990:	034a8163          	beq	s5,s4,1c00a9b2 <_prf+0x19a>
1c00a994:	016a8b63          	beq	s5,s6,1c00a9aa <_prf+0x192>
1c00a998:	f3aa9ae3          	bne	s5,s10,1c00a8cc <_prf+0xb4>
1c00a99c:	4785                	li	a5,1
1c00a99e:	ca3e                	sw	a5,20(sp)
1c00a9a0:	b735                	j	1c00a8cc <_prf+0xb4>
1c00a9a2:	4405                	li	s0,1
1c00a9a4:	b725                	j	1c00a8cc <_prf+0xb4>
1c00a9a6:	4c85                	li	s9,1
1c00a9a8:	b715                	j	1c00a8cc <_prf+0xb4>
1c00a9aa:	03000713          	li	a4,48
1c00a9ae:	c83a                	sw	a4,16(sp)
1c00a9b0:	bf31                	j	1c00a8cc <_prf+0xb4>
1c00a9b2:	4785                	li	a5,1
1c00a9b4:	c63e                	sw	a5,12(sp)
1c00a9b6:	bf19                	j	1c00a8cc <_prf+0xb4>
1c00a9b8:	02000713          	li	a4,32
1c00a9bc:	c83a                	sw	a4,16(sp)
1c00a9be:	4401                	li	s0,0
1c00a9c0:	ca02                	sw	zero,20(sp)
1c00a9c2:	c602                	sw	zero,12(sp)
1c00a9c4:	4c81                	li	s9,0
1c00a9c6:	02300913          	li	s2,35
1c00a9ca:	02d00a13          	li	s4,45
1c00a9ce:	03000b13          	li	s6,48
1c00a9d2:	02b00d13          	li	s10,43
1c00a9d6:	02000d93          	li	s11,32
1c00a9da:	bdd5                	j	1c00a8ce <_prf+0xb6>
1c00a9dc:	fd0a8693          	addi	a3,s5,-48
1c00a9e0:	4625                	li	a2,9
1c00a9e2:	4901                	li	s2,0
1c00a9e4:	45a9                	li	a1,10
1c00a9e6:	f2d662e3          	bltu	a2,a3,1c00a90a <_prf+0xf2>
1c00a9ea:	000bc683          	lbu	a3,0(s7)
1c00a9ee:	001b8493          	addi	s1,s7,1
1c00a9f2:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xffeffe4>
1c00a9f6:	8ab6                	mv	s5,a3
1c00a9f8:	f0e669e3          	bltu	a2,a4,1c00a90a <_prf+0xf2>
1c00a9fc:	02b90933          	mul	s2,s2,a1
1c00aa00:	8ba6                	mv	s7,s1
1c00aa02:	9936                	add	s2,s2,a3
1c00aa04:	fd090913          	addi	s2,s2,-48
1c00aa08:	b7cd                	j	1c00a9ea <_prf+0x1d2>
1c00aa0a:	02ad0733          	mul	a4,s10,a0
1c00aa0e:	84ae                	mv	s1,a1
1c00aa10:	973e                	add	a4,a4,a5
1c00aa12:	fd070d13          	addi	s10,a4,-48
1c00aa16:	0004c783          	lbu	a5,0(s1)
1c00aa1a:	00148593          	addi	a1,s1,1
1c00aa1e:	fd078613          	addi	a2,a5,-48
1c00aa22:	fec6f4e3          	bleu	a2,a3,1c00aa0a <_prf+0x1f2>
1c00aa26:	b739                	j	1c00a934 <_prf+0x11c>
1c00aa28:	4d01                	li	s10,0
1c00aa2a:	46a5                	li	a3,9
1c00aa2c:	4529                	li	a0,10
1c00aa2e:	b7e5                	j	1c00aa16 <_prf+0x1fe>
1c00aa30:	06300693          	li	a3,99
1c00aa34:	0cda8b63          	beq	s5,a3,1c00ab0a <_prf+0x2f2>
1c00aa38:	0756c563          	blt	a3,s5,1c00aaa2 <_prf+0x28a>
1c00aa3c:	05800693          	li	a3,88
1c00aa40:	f4da93e3          	bne	s5,a3,1c00a986 <_prf+0x16e>
1c00aa44:	04410b93          	addi	s7,sp,68
1c00aa48:	004c0a13          	addi	s4,s8,4
1c00aa4c:	000c2583          	lw	a1,0(s8)
1c00aa50:	845e                	mv	s0,s7
1c00aa52:	000c8963          	beqz	s9,1c00aa64 <_prf+0x24c>
1c00aa56:	76e1                	lui	a3,0xffff8
1c00aa58:	8306c693          	xori	a3,a3,-2000
1c00aa5c:	04d11223          	sh	a3,68(sp)
1c00aa60:	04610413          	addi	s0,sp,70
1c00aa64:	86ea                	mv	a3,s10
1c00aa66:	4641                	li	a2,16
1c00aa68:	8522                	mv	a0,s0
1c00aa6a:	316d                	jal	1c00a714 <_to_x>
1c00aa6c:	05800693          	li	a3,88
1c00aa70:	58da8863          	beq	s5,a3,1c00b000 <_prf+0x7e8>
1c00aa74:	41740433          	sub	s0,s0,s7
1c00aa78:	9522                	add	a0,a0,s0
1c00aa7a:	01903433          	snez	s0,s9
1c00aa7e:	0406                	slli	s0,s0,0x1
1c00aa80:	a8c9                	j	1c00ab52 <_prf+0x33a>
1c00aa82:	07000693          	li	a3,112
1c00aa86:	50da8163          	beq	s5,a3,1c00af88 <_prf+0x770>
1c00aa8a:	0556c163          	blt	a3,s5,1c00aacc <_prf+0x2b4>
1c00aa8e:	06e00693          	li	a3,110
1c00aa92:	46da8b63          	beq	s5,a3,1c00af08 <_prf+0x6f0>
1c00aa96:	4956c063          	blt	a3,s5,1c00af16 <_prf+0x6fe>
1c00aa9a:	06900693          	li	a3,105
1c00aa9e:	eeda94e3          	bne	s5,a3,1c00a986 <_prf+0x16e>
1c00aaa2:	000c2a83          	lw	s5,0(s8)
1c00aaa6:	004c0a13          	addi	s4,s8,4
1c00aaaa:	04410b13          	addi	s6,sp,68
1c00aaae:	060ad963          	bgez	s5,1c00ab20 <_prf+0x308>
1c00aab2:	02d00693          	li	a3,45
1c00aab6:	04d10223          	sb	a3,68(sp)
1c00aaba:	800006b7          	lui	a3,0x80000
1c00aabe:	415005b3          	neg	a1,s5
1c00aac2:	06da9963          	bne	s5,a3,1c00ab34 <_prf+0x31c>
1c00aac6:	800005b7          	lui	a1,0x80000
1c00aaca:	a0ad                	j	1c00ab34 <_prf+0x31c>
1c00aacc:	07500693          	li	a3,117
1c00aad0:	50da8063          	beq	s5,a3,1c00afd0 <_prf+0x7b8>
1c00aad4:	07800693          	li	a3,120
1c00aad8:	f6da86e3          	beq	s5,a3,1c00aa44 <_prf+0x22c>
1c00aadc:	07300693          	li	a3,115
1c00aae0:	eada93e3          	bne	s5,a3,1c00a986 <_prf+0x16e>
1c00aae4:	000c2583          	lw	a1,0(s8)
1c00aae8:	004c0a13          	addi	s4,s8,4
1c00aaec:	4c81                	li	s9,0
1c00aaee:	0c800793          	li	a5,200
1c00aaf2:	019586b3          	add	a3,a1,s9
1c00aaf6:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00aafa:	4a068f63          	beqz	a3,1c00afb8 <_prf+0x7a0>
1c00aafe:	0c85                	addi	s9,s9,1
1c00ab00:	fefc99e3          	bne	s9,a5,1c00aaf2 <_prf+0x2da>
1c00ab04:	4a0d5c63          	bgez	s10,1c00afbc <_prf+0x7a4>
1c00ab08:	a97d                	j	1c00afc6 <_prf+0x7ae>
1c00ab0a:	000c2783          	lw	a5,0(s8)
1c00ab0e:	004c0a13          	addi	s4,s8,4
1c00ab12:	040102a3          	sb	zero,69(sp)
1c00ab16:	04f10223          	sb	a5,68(sp)
1c00ab1a:	4c85                	li	s9,1
1c00ab1c:	4401                	li	s0,0
1c00ab1e:	a105                	j	1c00af3e <_prf+0x726>
1c00ab20:	4752                	lw	a4,20(sp)
1c00ab22:	02b00693          	li	a3,43
1c00ab26:	e701                	bnez	a4,1c00ab2e <_prf+0x316>
1c00ab28:	c41d                	beqz	s0,1c00ab56 <_prf+0x33e>
1c00ab2a:	02000693          	li	a3,32
1c00ab2e:	04d10223          	sb	a3,68(sp)
1c00ab32:	85d6                	mv	a1,s5
1c00ab34:	04510c13          	addi	s8,sp,69
1c00ab38:	86ea                	mv	a3,s10
1c00ab3a:	4629                	li	a2,10
1c00ab3c:	8562                	mv	a0,s8
1c00ab3e:	bd7ff0ef          	jal	ra,1c00a714 <_to_x>
1c00ab42:	47d2                	lw	a5,20(sp)
1c00ab44:	9562                	add	a0,a0,s8
1c00ab46:	41650533          	sub	a0,a0,s6
1c00ab4a:	eb89                	bnez	a5,1c00ab5c <_prf+0x344>
1c00ab4c:	e019                	bnez	s0,1c00ab52 <_prf+0x33a>
1c00ab4e:	01fad413          	srli	s0,s5,0x1f
1c00ab52:	57fd                	li	a5,-1
1c00ab54:	a9a1                	j	1c00afac <_prf+0x794>
1c00ab56:	85d6                	mv	a1,s5
1c00ab58:	8c5a                	mv	s8,s6
1c00ab5a:	bff9                	j	1c00ab38 <_prf+0x320>
1c00ab5c:	4452                	lw	s0,20(sp)
1c00ab5e:	bfd5                	j	1c00ab52 <_prf+0x33a>
1c00ab60:	0c1d                	addi	s8,s8,7
1c00ab62:	ff8c7c13          	andi	s8,s8,-8
1c00ab66:	000c2883          	lw	a7,0(s8)
1c00ab6a:	004c2303          	lw	t1,4(s8)
1c00ab6e:	80000737          	lui	a4,0x80000
1c00ab72:	0158d593          	srli	a1,a7,0x15
1c00ab76:	00b31693          	slli	a3,t1,0xb
1c00ab7a:	8ecd                	or	a3,a3,a1
1c00ab7c:	fff74713          	not	a4,a4
1c00ab80:	01435613          	srli	a2,t1,0x14
1c00ab84:	08ae                	slli	a7,a7,0xb
1c00ab86:	8ef9                	and	a3,a3,a4
1c00ab88:	7ff67613          	andi	a2,a2,2047
1c00ab8c:	d846                	sw	a7,48(sp)
1c00ab8e:	da36                	sw	a3,52(sp)
1c00ab90:	7ff00593          	li	a1,2047
1c00ab94:	008c0a13          	addi	s4,s8,8
1c00ab98:	08b61d63          	bne	a2,a1,1c00ac32 <_prf+0x41a>
1c00ab9c:	00d0                	addi	a2,sp,68
1c00ab9e:	8732                	mv	a4,a2
1c00aba0:	00035863          	bgez	t1,1c00abb0 <_prf+0x398>
1c00aba4:	02d00713          	li	a4,45
1c00aba8:	04e10223          	sb	a4,68(sp)
1c00abac:	04510713          	addi	a4,sp,69
1c00abb0:	00d8e6b3          	or	a3,a7,a3
1c00abb4:	fbfa8793          	addi	a5,s5,-65
1c00abb8:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00abbc:	eaa1                	bnez	a3,1c00ac0c <_prf+0x3f4>
1c00abbe:	46e5                	li	a3,25
1c00abc0:	02f6ee63          	bltu	a3,a5,1c00abfc <_prf+0x3e4>
1c00abc4:	6795                	lui	a5,0x5
1c00abc6:	e4978793          	addi	a5,a5,-439 # 4e49 <__rt_hyper_pending_emu_stride+0x4ba1>
1c00abca:	00f71023          	sh	a5,0(a4)
1c00abce:	04600793          	li	a5,70
1c00abd2:	00f70123          	sb	a5,2(a4)
1c00abd6:	000701a3          	sb	zero,3(a4)
1c00abda:	8d11                	sub	a0,a0,a2
1c00abdc:	47d2                	lw	a5,20(sp)
1c00abde:	48079f63          	bnez	a5,1c00b07c <_prf+0x864>
1c00abe2:	e419                	bnez	s0,1c00abf0 <_prf+0x3d8>
1c00abe4:	04414403          	lbu	s0,68(sp)
1c00abe8:	fd340413          	addi	s0,s0,-45
1c00abec:	00143413          	seqz	s0,s0
1c00abf0:	0c800793          	li	a5,200
1c00abf4:	c8a7c1e3          	blt	a5,a0,1c00a876 <_prf+0x5e>
1c00abf8:	8caa                	mv	s9,a0
1c00abfa:	a691                	j	1c00af3e <_prf+0x726>
1c00abfc:	679d                	lui	a5,0x7
1c00abfe:	e6978793          	addi	a5,a5,-407 # 6e69 <__rt_hyper_pending_emu_stride+0x6bc1>
1c00ac02:	00f71023          	sh	a5,0(a4)
1c00ac06:	06600793          	li	a5,102
1c00ac0a:	b7e1                	j	1c00abd2 <_prf+0x3ba>
1c00ac0c:	46e5                	li	a3,25
1c00ac0e:	00f6ea63          	bltu	a3,a5,1c00ac22 <_prf+0x40a>
1c00ac12:	6791                	lui	a5,0x4
1c00ac14:	14e78793          	addi	a5,a5,334 # 414e <__rt_hyper_pending_emu_stride+0x3ea6>
1c00ac18:	00f71023          	sh	a5,0(a4)
1c00ac1c:	04e00793          	li	a5,78
1c00ac20:	bf4d                	j	1c00abd2 <_prf+0x3ba>
1c00ac22:	6799                	lui	a5,0x6
1c00ac24:	16e78793          	addi	a5,a5,366 # 616e <__rt_hyper_pending_emu_stride+0x5ec6>
1c00ac28:	00f71023          	sh	a5,0(a4)
1c00ac2c:	06e00793          	li	a5,110
1c00ac30:	b74d                	j	1c00abd2 <_prf+0x3ba>
1c00ac32:	04600593          	li	a1,70
1c00ac36:	00ba9463          	bne	s5,a1,1c00ac3e <_prf+0x426>
1c00ac3a:	06600a93          	li	s5,102
1c00ac3e:	011665b3          	or	a1,a2,a7
1c00ac42:	8dd5                	or	a1,a1,a3
1c00ac44:	c9c9                	beqz	a1,1c00acd6 <_prf+0x4be>
1c00ac46:	800007b7          	lui	a5,0x80000
1c00ac4a:	8edd                	or	a3,a3,a5
1c00ac4c:	da36                	sw	a3,52(sp)
1c00ac4e:	d846                	sw	a7,48(sp)
1c00ac50:	c0260c13          	addi	s8,a2,-1022
1c00ac54:	02d00693          	li	a3,45
1c00ac58:	00034b63          	bltz	t1,1c00ac6e <_prf+0x456>
1c00ac5c:	4752                	lw	a4,20(sp)
1c00ac5e:	02b00693          	li	a3,43
1c00ac62:	e711                	bnez	a4,1c00ac6e <_prf+0x456>
1c00ac64:	04410b13          	addi	s6,sp,68
1c00ac68:	c419                	beqz	s0,1c00ac76 <_prf+0x45e>
1c00ac6a:	02000693          	li	a3,32
1c00ac6e:	04d10223          	sb	a3,68(sp)
1c00ac72:	04510b13          	addi	s6,sp,69
1c00ac76:	4b81                	li	s7,0
1c00ac78:	55f9                	li	a1,-2
1c00ac7a:	06bc4363          	blt	s8,a1,1c00ace0 <_prf+0x4c8>
1c00ac7e:	0b804a63          	bgtz	s8,1c00ad32 <_prf+0x51a>
1c00ac82:	4d91                	li	s11,4
1c00ac84:	1808                	addi	a0,sp,48
1c00ac86:	0c05                	addi	s8,s8,1
1c00ac88:	aedff0ef          	jal	ra,1c00a774 <_rlrshift>
1c00ac8c:	ffbc1ce3          	bne	s8,s11,1c00ac84 <_prf+0x46c>
1c00ac90:	000d5363          	bgez	s10,1c00ac96 <_prf+0x47e>
1c00ac94:	4d19                	li	s10,6
1c00ac96:	fdfaf593          	andi	a1,s5,-33
1c00ac9a:	04700513          	li	a0,71
1c00ac9e:	0ca59663          	bne	a1,a0,1c00ad6a <_prf+0x552>
1c00aca2:	4c01                	li	s8,0
1c00aca4:	000c9463          	bnez	s9,1c00acac <_prf+0x494>
1c00aca8:	01a03c33          	snez	s8,s10
1c00acac:	55f5                	li	a1,-3
1c00acae:	00bbc663          	blt	s7,a1,1c00acba <_prf+0x4a2>
1c00acb2:	001d0593          	addi	a1,s10,1
1c00acb6:	0b75df63          	ble	s7,a1,1c00ad74 <_prf+0x55c>
1c00acba:	06700593          	li	a1,103
1c00acbe:	14ba8c63          	beq	s5,a1,1c00ae16 <_prf+0x5fe>
1c00acc2:	04500a93          	li	s5,69
1c00acc6:	001d0593          	addi	a1,s10,1
1c00acca:	4541                	li	a0,16
1c00accc:	d62a                	sw	a0,44(sp)
1c00acce:	0ab55c63          	ble	a1,a0,1c00ad86 <_prf+0x56e>
1c00acd2:	45c1                	li	a1,16
1c00acd4:	a84d                	j	1c00ad86 <_prf+0x56e>
1c00acd6:	4c01                	li	s8,0
1c00acd8:	b751                	j	1c00ac5c <_prf+0x444>
1c00acda:	1808                	addi	a0,sp,48
1c00acdc:	a99ff0ef          	jal	ra,1c00a774 <_rlrshift>
1c00ace0:	55d2                	lw	a1,52(sp)
1c00ace2:	333337b7          	lui	a5,0x33333
1c00ace6:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x17322e9a>
1c00acea:	5342                	lw	t1,48(sp)
1c00acec:	0c05                	addi	s8,s8,1
1c00acee:	feb7e6e3          	bltu	a5,a1,1c00acda <_prf+0x4c2>
1c00acf2:	4895                	li	a7,5
1c00acf4:	02b88533          	mul	a0,a7,a1
1c00acf8:	1bfd                	addi	s7,s7,-1
1c00acfa:	0268b5b3          	mulhu	a1,a7,t1
1c00acfe:	026888b3          	mul	a7,a7,t1
1c00ad02:	95aa                	add	a1,a1,a0
1c00ad04:	da2e                	sw	a1,52(sp)
1c00ad06:	4501                	li	a0,0
1c00ad08:	d846                	sw	a7,48(sp)
1c00ad0a:	800006b7          	lui	a3,0x80000
1c00ad0e:	fff6c693          	not	a3,a3
1c00ad12:	00b6f663          	bleu	a1,a3,1c00ad1e <_prf+0x506>
1c00ad16:	d12d                	beqz	a0,1c00ac78 <_prf+0x460>
1c00ad18:	d846                	sw	a7,48(sp)
1c00ad1a:	da2e                	sw	a1,52(sp)
1c00ad1c:	bfb1                	j	1c00ac78 <_prf+0x460>
1c00ad1e:	01f8d313          	srli	t1,a7,0x1f
1c00ad22:	00159513          	slli	a0,a1,0x1
1c00ad26:	00a365b3          	or	a1,t1,a0
1c00ad2a:	0886                	slli	a7,a7,0x1
1c00ad2c:	1c7d                	addi	s8,s8,-1
1c00ad2e:	4505                	li	a0,1
1c00ad30:	bfe9                	j	1c00ad0a <_prf+0x4f2>
1c00ad32:	1808                	addi	a0,sp,48
1c00ad34:	a61ff0ef          	jal	ra,1c00a794 <_ldiv5>
1c00ad38:	58c2                	lw	a7,48(sp)
1c00ad3a:	55d2                	lw	a1,52(sp)
1c00ad3c:	1c7d                	addi	s8,s8,-1
1c00ad3e:	0b85                	addi	s7,s7,1
1c00ad40:	4501                	li	a0,0
1c00ad42:	80000737          	lui	a4,0x80000
1c00ad46:	fff74713          	not	a4,a4
1c00ad4a:	00b77663          	bleu	a1,a4,1c00ad56 <_prf+0x53e>
1c00ad4e:	d905                	beqz	a0,1c00ac7e <_prf+0x466>
1c00ad50:	d846                	sw	a7,48(sp)
1c00ad52:	da2e                	sw	a1,52(sp)
1c00ad54:	b72d                	j	1c00ac7e <_prf+0x466>
1c00ad56:	01f8d313          	srli	t1,a7,0x1f
1c00ad5a:	00159513          	slli	a0,a1,0x1
1c00ad5e:	00a365b3          	or	a1,t1,a0
1c00ad62:	0886                	slli	a7,a7,0x1
1c00ad64:	1c7d                	addi	s8,s8,-1
1c00ad66:	4505                	li	a0,1
1c00ad68:	bfe9                	j	1c00ad42 <_prf+0x52a>
1c00ad6a:	06600593          	li	a1,102
1c00ad6e:	4c01                	li	s8,0
1c00ad70:	f4ba9be3          	bne	s5,a1,1c00acc6 <_prf+0x4ae>
1c00ad74:	01ab85b3          	add	a1,s7,s10
1c00ad78:	06600a93          	li	s5,102
1c00ad7c:	f405d7e3          	bgez	a1,1c00acca <_prf+0x4b2>
1c00ad80:	45c1                	li	a1,16
1c00ad82:	d62e                	sw	a1,44(sp)
1c00ad84:	4581                	li	a1,0
1c00ad86:	4301                	li	t1,0
1c00ad88:	080003b7          	lui	t2,0x8000
1c00ad8c:	dc1a                	sw	t1,56(sp)
1c00ad8e:	de1e                	sw	t2,60(sp)
1c00ad90:	5dfd                	li	s11,-1
1c00ad92:	15fd                	addi	a1,a1,-1
1c00ad94:	09b59463          	bne	a1,s11,1c00ae1c <_prf+0x604>
1c00ad98:	55c2                	lw	a1,48(sp)
1c00ad9a:	5562                	lw	a0,56(sp)
1c00ad9c:	58d2                	lw	a7,52(sp)
1c00ad9e:	5372                	lw	t1,60(sp)
1c00ada0:	952e                	add	a0,a0,a1
1c00ada2:	00b535b3          	sltu	a1,a0,a1
1c00ada6:	989a                	add	a7,a7,t1
1c00ada8:	95c6                	add	a1,a1,a7
1c00adaa:	d82a                	sw	a0,48(sp)
1c00adac:	f0000537          	lui	a0,0xf0000
1c00adb0:	da2e                	sw	a1,52(sp)
1c00adb2:	8de9                	and	a1,a1,a0
1c00adb4:	c981                	beqz	a1,1c00adc4 <_prf+0x5ac>
1c00adb6:	1808                	addi	a0,sp,48
1c00adb8:	9ddff0ef          	jal	ra,1c00a794 <_ldiv5>
1c00adbc:	1808                	addi	a0,sp,48
1c00adbe:	9b7ff0ef          	jal	ra,1c00a774 <_rlrshift>
1c00adc2:	0b85                	addi	s7,s7,1
1c00adc4:	06600593          	li	a1,102
1c00adc8:	001b0d93          	addi	s11,s6,1 # 10001 <__l1_heap_size+0x15>
1c00adcc:	08ba9663          	bne	s5,a1,1c00ae58 <_prf+0x640>
1c00add0:	05705f63          	blez	s7,1c00ae2e <_prf+0x616>
1c00add4:	017b0db3          	add	s11,s6,s7
1c00add8:	106c                	addi	a1,sp,44
1c00adda:	1808                	addi	a0,sp,48
1c00addc:	0b05                	addi	s6,s6,1
1c00adde:	9ffff0ef          	jal	ra,1c00a7dc <_get_digit>
1c00ade2:	feab0fa3          	sb	a0,-1(s6)
1c00ade6:	ffbb19e3          	bne	s6,s11,1c00add8 <_prf+0x5c0>
1c00adea:	4b81                	li	s7,0
1c00adec:	000c9463          	bnez	s9,1c00adf4 <_prf+0x5dc>
1c00adf0:	020d0063          	beqz	s10,1c00ae10 <_prf+0x5f8>
1c00adf4:	02e00613          	li	a2,46
1c00adf8:	00cd8023          	sb	a2,0(s11)
1c00adfc:	8b6e                	mv	s6,s11
1c00adfe:	01ad8cb3          	add	s9,s11,s10
1c00ae02:	03000313          	li	t1,48
1c00ae06:	036c9963          	bne	s9,s6,1c00ae38 <_prf+0x620>
1c00ae0a:	001d0713          	addi	a4,s10,1
1c00ae0e:	9dba                	add	s11,s11,a4
1c00ae10:	060c1e63          	bnez	s8,1c00ae8c <_prf+0x674>
1c00ae14:	a8d1                	j	1c00aee8 <_prf+0x6d0>
1c00ae16:	06500a93          	li	s5,101
1c00ae1a:	b575                	j	1c00acc6 <_prf+0x4ae>
1c00ae1c:	1828                	addi	a0,sp,56
1c00ae1e:	c42e                	sw	a1,8(sp)
1c00ae20:	975ff0ef          	jal	ra,1c00a794 <_ldiv5>
1c00ae24:	1828                	addi	a0,sp,56
1c00ae26:	94fff0ef          	jal	ra,1c00a774 <_rlrshift>
1c00ae2a:	45a2                	lw	a1,8(sp)
1c00ae2c:	b79d                	j	1c00ad92 <_prf+0x57a>
1c00ae2e:	03000593          	li	a1,48
1c00ae32:	00bb0023          	sb	a1,0(s6)
1c00ae36:	bf5d                	j	1c00adec <_prf+0x5d4>
1c00ae38:	000b8763          	beqz	s7,1c00ae46 <_prf+0x62e>
1c00ae3c:	006b00a3          	sb	t1,1(s6)
1c00ae40:	0b85                	addi	s7,s7,1
1c00ae42:	0b05                	addi	s6,s6,1
1c00ae44:	b7c9                	j	1c00ae06 <_prf+0x5ee>
1c00ae46:	106c                	addi	a1,sp,44
1c00ae48:	1808                	addi	a0,sp,48
1c00ae4a:	c41a                	sw	t1,8(sp)
1c00ae4c:	991ff0ef          	jal	ra,1c00a7dc <_get_digit>
1c00ae50:	00ab00a3          	sb	a0,1(s6)
1c00ae54:	4322                	lw	t1,8(sp)
1c00ae56:	b7f5                	j	1c00ae42 <_prf+0x62a>
1c00ae58:	106c                	addi	a1,sp,44
1c00ae5a:	1808                	addi	a0,sp,48
1c00ae5c:	981ff0ef          	jal	ra,1c00a7dc <_get_digit>
1c00ae60:	00ab0023          	sb	a0,0(s6)
1c00ae64:	03000593          	li	a1,48
1c00ae68:	00b50363          	beq	a0,a1,1c00ae6e <_prf+0x656>
1c00ae6c:	1bfd                	addi	s7,s7,-1
1c00ae6e:	000c9463          	bnez	s9,1c00ae76 <_prf+0x65e>
1c00ae72:	000d0b63          	beqz	s10,1c00ae88 <_prf+0x670>
1c00ae76:	002b0d93          	addi	s11,s6,2
1c00ae7a:	02e00593          	li	a1,46
1c00ae7e:	00bb00a3          	sb	a1,1(s6)
1c00ae82:	9d6e                	add	s10,s10,s11
1c00ae84:	07bd1863          	bne	s10,s11,1c00aef4 <_prf+0x6dc>
1c00ae88:	000c0f63          	beqz	s8,1c00aea6 <_prf+0x68e>
1c00ae8c:	03000593          	li	a1,48
1c00ae90:	fffdc603          	lbu	a2,-1(s11)
1c00ae94:	fffd8713          	addi	a4,s11,-1
1c00ae98:	06b60663          	beq	a2,a1,1c00af04 <_prf+0x6ec>
1c00ae9c:	02e00593          	li	a1,46
1c00aea0:	00b61363          	bne	a2,a1,1c00aea6 <_prf+0x68e>
1c00aea4:	8dba                	mv	s11,a4
1c00aea6:	fdfaf713          	andi	a4,s5,-33
1c00aeaa:	04500613          	li	a2,69
1c00aeae:	02c71d63          	bne	a4,a2,1c00aee8 <_prf+0x6d0>
1c00aeb2:	87d6                	mv	a5,s5
1c00aeb4:	00fd8023          	sb	a5,0(s11)
1c00aeb8:	02b00793          	li	a5,43
1c00aebc:	000bd663          	bgez	s7,1c00aec8 <_prf+0x6b0>
1c00aec0:	41700bb3          	neg	s7,s7
1c00aec4:	02d00793          	li	a5,45
1c00aec8:	00fd80a3          	sb	a5,1(s11)
1c00aecc:	47a9                	li	a5,10
1c00aece:	02fbc733          	div	a4,s7,a5
1c00aed2:	0d91                	addi	s11,s11,4
1c00aed4:	02fbe6b3          	rem	a3,s7,a5
1c00aed8:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00aedc:	feed8f23          	sb	a4,-2(s11)
1c00aee0:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00aee4:	fedd8fa3          	sb	a3,-1(s11)
1c00aee8:	00c8                	addi	a0,sp,68
1c00aeea:	000d8023          	sb	zero,0(s11)
1c00aeee:	40ad8533          	sub	a0,s11,a0
1c00aef2:	b1ed                	j	1c00abdc <_prf+0x3c4>
1c00aef4:	106c                	addi	a1,sp,44
1c00aef6:	1808                	addi	a0,sp,48
1c00aef8:	0d85                	addi	s11,s11,1
1c00aefa:	8e3ff0ef          	jal	ra,1c00a7dc <_get_digit>
1c00aefe:	fead8fa3          	sb	a0,-1(s11)
1c00af02:	b749                	j	1c00ae84 <_prf+0x66c>
1c00af04:	8dba                	mv	s11,a4
1c00af06:	b769                	j	1c00ae90 <_prf+0x678>
1c00af08:	000c2783          	lw	a5,0(s8)
1c00af0c:	004c0a13          	addi	s4,s8,4
1c00af10:	0137a023          	sw	s3,0(a5)
1c00af14:	b255                	j	1c00a8b8 <_prf+0xa0>
1c00af16:	004c0a13          	addi	s4,s8,4
1c00af1a:	000c2583          	lw	a1,0(s8)
1c00af1e:	00dc                	addi	a5,sp,68
1c00af20:	040c8463          	beqz	s9,1c00af68 <_prf+0x750>
1c00af24:	03000693          	li	a3,48
1c00af28:	04d10223          	sb	a3,68(sp)
1c00af2c:	04510513          	addi	a0,sp,69
1c00af30:	ed8d                	bnez	a1,1c00af6a <_prf+0x752>
1c00af32:	040102a3          	sb	zero,69(sp)
1c00af36:	57fd                	li	a5,-1
1c00af38:	4401                	li	s0,0
1c00af3a:	0efd1163          	bne	s10,a5,1c00b01c <_prf+0x804>
1c00af3e:	0f2cc363          	blt	s9,s2,1c00b024 <_prf+0x80c>
1c00af42:	8966                	mv	s2,s9
1c00af44:	00c0                	addi	s0,sp,68
1c00af46:	40898ab3          	sub	s5,s3,s0
1c00af4a:	5b7d                	li	s6,-1
1c00af4c:	015409b3          	add	s3,s0,s5
1c00af50:	960904e3          	beqz	s2,1c00a8b8 <_prf+0xa0>
1c00af54:	45f2                	lw	a1,28(sp)
1c00af56:	00044503          	lbu	a0,0(s0)
1c00af5a:	47e2                	lw	a5,24(sp)
1c00af5c:	9782                	jalr	a5
1c00af5e:	91650ce3          	beq	a0,s6,1c00a876 <_prf+0x5e>
1c00af62:	197d                	addi	s2,s2,-1
1c00af64:	0405                	addi	s0,s0,1
1c00af66:	b7dd                	j	1c00af4c <_prf+0x734>
1c00af68:	853e                	mv	a0,a5
1c00af6a:	86ea                	mv	a3,s10
1c00af6c:	4621                	li	a2,8
1c00af6e:	40f50433          	sub	s0,a0,a5
1c00af72:	fa2ff0ef          	jal	ra,1c00a714 <_to_x>
1c00af76:	9522                	add	a0,a0,s0
1c00af78:	57fd                	li	a5,-1
1c00af7a:	4401                	li	s0,0
1c00af7c:	c6fd0ae3          	beq	s10,a5,1c00abf0 <_prf+0x3d8>
1c00af80:	02000793          	li	a5,32
1c00af84:	c83e                	sw	a5,16(sp)
1c00af86:	b1ad                	j	1c00abf0 <_prf+0x3d8>
1c00af88:	000c2583          	lw	a1,0(s8)
1c00af8c:	77e1                	lui	a5,0xffff8
1c00af8e:	8307c793          	xori	a5,a5,-2000
1c00af92:	46a1                	li	a3,8
1c00af94:	4641                	li	a2,16
1c00af96:	04610513          	addi	a0,sp,70
1c00af9a:	04f11223          	sh	a5,68(sp)
1c00af9e:	f76ff0ef          	jal	ra,1c00a714 <_to_x>
1c00afa2:	004c0a13          	addi	s4,s8,4
1c00afa6:	0509                	addi	a0,a0,2
1c00afa8:	57fd                	li	a5,-1
1c00afaa:	4401                	li	s0,0
1c00afac:	c4fd02e3          	beq	s10,a5,1c00abf0 <_prf+0x3d8>
1c00afb0:	02000713          	li	a4,32
1c00afb4:	c83a                	sw	a4,16(sp)
1c00afb6:	b92d                	j	1c00abf0 <_prf+0x3d8>
1c00afb8:	000d4563          	bltz	s10,1c00afc2 <_prf+0x7aa>
1c00afbc:	019d5363          	ble	s9,s10,1c00afc2 <_prf+0x7aa>
1c00afc0:	8cea                	mv	s9,s10
1c00afc2:	8e0c8be3          	beqz	s9,1c00a8b8 <_prf+0xa0>
1c00afc6:	8666                	mv	a2,s9
1c00afc8:	00c8                	addi	a0,sp,68
1c00afca:	ce6ff0ef          	jal	ra,1c00a4b0 <memcpy>
1c00afce:	b6b9                	j	1c00ab1c <_prf+0x304>
1c00afd0:	000c2583          	lw	a1,0(s8)
1c00afd4:	86ea                	mv	a3,s10
1c00afd6:	4629                	li	a2,10
1c00afd8:	00c8                	addi	a0,sp,68
1c00afda:	004c0a13          	addi	s4,s8,4
1c00afde:	f36ff0ef          	jal	ra,1c00a714 <_to_x>
1c00afe2:	bf59                	j	1c00af78 <_prf+0x760>
1c00afe4:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00afe8:	0ff67613          	andi	a2,a2,255
1c00afec:	00c5e563          	bltu	a1,a2,1c00aff6 <_prf+0x7de>
1c00aff0:	1781                	addi	a5,a5,-32
1c00aff2:	00f68023          	sb	a5,0(a3)
1c00aff6:	0685                	addi	a3,a3,1
1c00aff8:	0006c783          	lbu	a5,0(a3)
1c00affc:	f7e5                	bnez	a5,1c00afe4 <_prf+0x7cc>
1c00affe:	bc9d                	j	1c00aa74 <_prf+0x25c>
1c00b000:	86de                	mv	a3,s7
1c00b002:	45e5                	li	a1,25
1c00b004:	bfd5                	j	1c00aff8 <_prf+0x7e0>
1c00b006:	45f2                	lw	a1,28(sp)
1c00b008:	4762                	lw	a4,24(sp)
1c00b00a:	02500513          	li	a0,37
1c00b00e:	9702                	jalr	a4
1c00b010:	57fd                	li	a5,-1
1c00b012:	86f502e3          	beq	a0,a5,1c00a876 <_prf+0x5e>
1c00b016:	0985                	addi	s3,s3,1
1c00b018:	8a62                	mv	s4,s8
1c00b01a:	b879                	j	1c00a8b8 <_prf+0xa0>
1c00b01c:	02000793          	li	a5,32
1c00b020:	c83e                	sw	a5,16(sp)
1c00b022:	bf31                	j	1c00af3e <_prf+0x726>
1c00b024:	4732                	lw	a4,12(sp)
1c00b026:	cf01                	beqz	a4,1c00b03e <_prf+0x826>
1c00b028:	02000713          	li	a4,32
1c00b02c:	00d4                	addi	a3,sp,68
1c00b02e:	019687b3          	add	a5,a3,s9
1c00b032:	00e78023          	sb	a4,0(a5)
1c00b036:	0c85                	addi	s9,s9,1
1c00b038:	ff991ae3          	bne	s2,s9,1c00b02c <_prf+0x814>
1c00b03c:	b721                	j	1c00af44 <_prf+0x72c>
1c00b03e:	00cc                	addi	a1,sp,68
1c00b040:	41990bb3          	sub	s7,s2,s9
1c00b044:	001c8613          	addi	a2,s9,1
1c00b048:	01758533          	add	a0,a1,s7
1c00b04c:	c7cff0ef          	jal	ra,1c00a4c8 <memmove>
1c00b050:	4742                	lw	a4,16(sp)
1c00b052:	02000793          	li	a5,32
1c00b056:	00f70363          	beq	a4,a5,1c00b05c <_prf+0x844>
1c00b05a:	c622                	sw	s0,12(sp)
1c00b05c:	47b2                	lw	a5,12(sp)
1c00b05e:	9bbe                	add	s7,s7,a5
1c00b060:	4732                	lw	a4,12(sp)
1c00b062:	ef7751e3          	ble	s7,a4,1c00af44 <_prf+0x72c>
1c00b066:	4732                	lw	a4,12(sp)
1c00b068:	00d4                	addi	a3,sp,68
1c00b06a:	00e687b3          	add	a5,a3,a4
1c00b06e:	4742                	lw	a4,16(sp)
1c00b070:	00e78023          	sb	a4,0(a5)
1c00b074:	47b2                	lw	a5,12(sp)
1c00b076:	0785                	addi	a5,a5,1
1c00b078:	c63e                	sw	a5,12(sp)
1c00b07a:	b7dd                	j	1c00b060 <_prf+0x848>
1c00b07c:	4452                	lw	s0,20(sp)
1c00b07e:	be8d                	j	1c00abf0 <_prf+0x3d8>

1c00b080 <__rt_uart_cluster_req_done>:
1c00b080:	300476f3          	csrrci	a3,mstatus,8
1c00b084:	4785                	li	a5,1
1c00b086:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b08a:	09954783          	lbu	a5,153(a0)
1c00b08e:	00201737          	lui	a4,0x201
1c00b092:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e18>
1c00b096:	04078793          	addi	a5,a5,64
1c00b09a:	07da                	slli	a5,a5,0x16
1c00b09c:	97ba                	add	a5,a5,a4
1c00b09e:	0007a023          	sw	zero,0(a5)
1c00b0a2:	30069073          	csrw	mstatus,a3
1c00b0a6:	8082                	ret

1c00b0a8 <__rt_uart_setup.isra.6>:
1c00b0a8:	1c001737          	lui	a4,0x1c001
1c00b0ac:	22872703          	lw	a4,552(a4) # 1c001228 <__rt_freq_domains>
1c00b0b0:	00155793          	srli	a5,a0,0x1
1c00b0b4:	97ba                	add	a5,a5,a4
1c00b0b6:	02a7d7b3          	divu	a5,a5,a0
1c00b0ba:	1a102737          	lui	a4,0x1a102
1c00b0be:	17fd                	addi	a5,a5,-1
1c00b0c0:	07c2                	slli	a5,a5,0x10
1c00b0c2:	3067e793          	ori	a5,a5,774
1c00b0c6:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102190>
1c00b0ca:	8082                	ret

1c00b0cc <__rt_uart_setfreq_after>:
1c00b0cc:	1c0017b7          	lui	a5,0x1c001
1c00b0d0:	1a878793          	addi	a5,a5,424 # 1c0011a8 <__rt_uart>
1c00b0d4:	4398                	lw	a4,0(a5)
1c00b0d6:	cb09                	beqz	a4,1c00b0e8 <__rt_uart_setfreq_after+0x1c>
1c00b0d8:	4788                	lw	a0,8(a5)
1c00b0da:	1141                	addi	sp,sp,-16
1c00b0dc:	c606                	sw	ra,12(sp)
1c00b0de:	37e9                	jal	1c00b0a8 <__rt_uart_setup.isra.6>
1c00b0e0:	40b2                	lw	ra,12(sp)
1c00b0e2:	4501                	li	a0,0
1c00b0e4:	0141                	addi	sp,sp,16
1c00b0e6:	8082                	ret
1c00b0e8:	4501                	li	a0,0
1c00b0ea:	8082                	ret

1c00b0ec <__rt_uart_cluster_req>:
1c00b0ec:	1141                	addi	sp,sp,-16
1c00b0ee:	c606                	sw	ra,12(sp)
1c00b0f0:	c422                	sw	s0,8(sp)
1c00b0f2:	30047473          	csrrci	s0,mstatus,8
1c00b0f6:	1c00b7b7          	lui	a5,0x1c00b
1c00b0fa:	08078793          	addi	a5,a5,128 # 1c00b080 <__rt_uart_cluster_req_done>
1c00b0fe:	c55c                	sw	a5,12(a0)
1c00b100:	4785                	li	a5,1
1c00b102:	d55c                	sw	a5,44(a0)
1c00b104:	411c                	lw	a5,0(a0)
1c00b106:	02052823          	sw	zero,48(a0)
1c00b10a:	c908                	sw	a0,16(a0)
1c00b10c:	43cc                	lw	a1,4(a5)
1c00b10e:	4514                	lw	a3,8(a0)
1c00b110:	4150                	lw	a2,4(a0)
1c00b112:	0586                	slli	a1,a1,0x1
1c00b114:	00c50793          	addi	a5,a0,12
1c00b118:	4701                	li	a4,0
1c00b11a:	0585                	addi	a1,a1,1
1c00b11c:	4501                	li	a0,0
1c00b11e:	e9dfe0ef          	jal	ra,1c009fba <rt_periph_copy>
1c00b122:	30041073          	csrw	mstatus,s0
1c00b126:	40b2                	lw	ra,12(sp)
1c00b128:	4422                	lw	s0,8(sp)
1c00b12a:	0141                	addi	sp,sp,16
1c00b12c:	8082                	ret

1c00b12e <__rt_uart_wait_tx_done.isra.5>:
1c00b12e:	1a102737          	lui	a4,0x1a102
1c00b132:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa102184>
1c00b136:	8bc1                	andi	a5,a5,16
1c00b138:	e7b9                	bnez	a5,1c00b186 <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b13a:	1a102737          	lui	a4,0x1a102
1c00b13e:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa10218c>
1c00b142:	8b85                	andi	a5,a5,1
1c00b144:	ffed                	bnez	a5,1c00b13e <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b146:	f14027f3          	csrr	a5,mhartid
1c00b14a:	8795                	srai	a5,a5,0x5
1c00b14c:	1a10a637          	lui	a2,0x1a10a
1c00b150:	03f7f793          	andi	a5,a5,63
1c00b154:	03200693          	li	a3,50
1c00b158:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa109800>
1c00b15c:	6711                	lui	a4,0x4
1c00b15e:	6311                	lui	t1,0x4
1c00b160:	45fd                	li	a1,31
1c00b162:	00204537          	lui	a0,0x204
1c00b166:	88be                	mv	a7,a5
1c00b168:	00682023          	sw	t1,0(a6)
1c00b16c:	02b79063          	bne	a5,a1,1c00b18c <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b170:	80e62223          	sw	a4,-2044(a2)
1c00b174:	10500073          	wfi
1c00b178:	00b89c63          	bne	a7,a1,1c00b190 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b17c:	80e62423          	sw	a4,-2040(a2)
1c00b180:	16fd                	addi	a3,a3,-1
1c00b182:	f2fd                	bnez	a3,1c00b168 <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b184:	8082                	ret
1c00b186:	10500073          	wfi
1c00b18a:	b765                	j	1c00b132 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b18c:	c958                	sw	a4,20(a0)
1c00b18e:	b7dd                	j	1c00b174 <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b190:	c918                	sw	a4,16(a0)
1c00b192:	b7fd                	j	1c00b180 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b194 <__rt_uart_setfreq_before>:
1c00b194:	1c0017b7          	lui	a5,0x1c001
1c00b198:	1a87a783          	lw	a5,424(a5) # 1c0011a8 <__rt_uart>
1c00b19c:	cf99                	beqz	a5,1c00b1ba <__rt_uart_setfreq_before+0x26>
1c00b19e:	1141                	addi	sp,sp,-16
1c00b1a0:	c606                	sw	ra,12(sp)
1c00b1a2:	3771                	jal	1c00b12e <__rt_uart_wait_tx_done.isra.5>
1c00b1a4:	40b2                	lw	ra,12(sp)
1c00b1a6:	005007b7          	lui	a5,0x500
1c00b1aa:	1a102737          	lui	a4,0x1a102
1c00b1ae:	0799                	addi	a5,a5,6
1c00b1b0:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102190>
1c00b1b4:	4501                	li	a0,0
1c00b1b6:	0141                	addi	sp,sp,16
1c00b1b8:	8082                	ret
1c00b1ba:	4501                	li	a0,0
1c00b1bc:	8082                	ret

1c00b1be <soc_eu_fcEventMask_setEvent>:
1c00b1be:	47fd                	li	a5,31
1c00b1c0:	4721                	li	a4,8
1c00b1c2:	00a7d463          	ble	a0,a5,1c00b1ca <soc_eu_fcEventMask_setEvent+0xc>
1c00b1c6:	1501                	addi	a0,a0,-32
1c00b1c8:	4711                	li	a4,4
1c00b1ca:	1a1067b7          	lui	a5,0x1a106
1c00b1ce:	973e                	add	a4,a4,a5
1c00b1d0:	4314                	lw	a3,0(a4)
1c00b1d2:	4785                	li	a5,1
1c00b1d4:	00a79533          	sll	a0,a5,a0
1c00b1d8:	fff54513          	not	a0,a0
1c00b1dc:	8d75                	and	a0,a0,a3
1c00b1de:	c308                	sw	a0,0(a4)
1c00b1e0:	8082                	ret

1c00b1e2 <rt_uart_conf_init>:
1c00b1e2:	000997b7          	lui	a5,0x99
1c00b1e6:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8897c>
1c00b1ea:	c11c                	sw	a5,0(a0)
1c00b1ec:	57fd                	li	a5,-1
1c00b1ee:	c15c                	sw	a5,4(a0)
1c00b1f0:	8082                	ret

1c00b1f2 <__rt_uart_open>:
1c00b1f2:	1141                	addi	sp,sp,-16
1c00b1f4:	c606                	sw	ra,12(sp)
1c00b1f6:	c422                	sw	s0,8(sp)
1c00b1f8:	c226                	sw	s1,4(sp)
1c00b1fa:	c04a                	sw	s2,0(sp)
1c00b1fc:	30047973          	csrrci	s2,mstatus,8
1c00b200:	cd8d                	beqz	a1,1c00b23a <__rt_uart_open+0x48>
1c00b202:	4194                	lw	a3,0(a1)
1c00b204:	1c0017b7          	lui	a5,0x1c001
1c00b208:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f4011>
1c00b20c:	1a878413          	addi	s0,a5,424 # 1c0011a8 <__rt_uart>
1c00b210:	0712                	slli	a4,a4,0x4
1c00b212:	943a                	add	s0,s0,a4
1c00b214:	4010                	lw	a2,0(s0)
1c00b216:	1a878793          	addi	a5,a5,424
1c00b21a:	c60d                	beqz	a2,1c00b244 <__rt_uart_open+0x52>
1c00b21c:	c589                	beqz	a1,1c00b226 <__rt_uart_open+0x34>
1c00b21e:	418c                	lw	a1,0(a1)
1c00b220:	4414                	lw	a3,8(s0)
1c00b222:	04d59a63          	bne	a1,a3,1c00b276 <__rt_uart_open+0x84>
1c00b226:	97ba                	add	a5,a5,a4
1c00b228:	0605                	addi	a2,a2,1
1c00b22a:	c390                	sw	a2,0(a5)
1c00b22c:	8522                	mv	a0,s0
1c00b22e:	40b2                	lw	ra,12(sp)
1c00b230:	4422                	lw	s0,8(sp)
1c00b232:	4492                	lw	s1,4(sp)
1c00b234:	4902                	lw	s2,0(sp)
1c00b236:	0141                	addi	sp,sp,16
1c00b238:	8082                	ret
1c00b23a:	000996b7          	lui	a3,0x99
1c00b23e:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8897c>
1c00b242:	b7c9                	j	1c00b204 <__rt_uart_open+0x12>
1c00b244:	4785                	li	a5,1
1c00b246:	1a102737          	lui	a4,0x1a102
1c00b24a:	c01c                	sw	a5,0(s0)
1c00b24c:	c048                	sw	a0,4(s0)
1c00b24e:	c414                	sw	a3,8(s0)
1c00b250:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa10276c>
1c00b254:	00a797b3          	sll	a5,a5,a0
1c00b258:	00151493          	slli	s1,a0,0x1
1c00b25c:	8fd5                	or	a5,a5,a3
1c00b25e:	78f72023          	sw	a5,1920(a4)
1c00b262:	8526                	mv	a0,s1
1c00b264:	3fa9                	jal	1c00b1be <soc_eu_fcEventMask_setEvent>
1c00b266:	00148513          	addi	a0,s1,1
1c00b26a:	3f91                	jal	1c00b1be <soc_eu_fcEventMask_setEvent>
1c00b26c:	4408                	lw	a0,8(s0)
1c00b26e:	3d2d                	jal	1c00b0a8 <__rt_uart_setup.isra.6>
1c00b270:	30091073          	csrw	mstatus,s2
1c00b274:	bf65                	j	1c00b22c <__rt_uart_open+0x3a>
1c00b276:	4401                	li	s0,0
1c00b278:	bf55                	j	1c00b22c <__rt_uart_open+0x3a>

1c00b27a <rt_uart_close>:
1c00b27a:	1141                	addi	sp,sp,-16
1c00b27c:	c606                	sw	ra,12(sp)
1c00b27e:	c422                	sw	s0,8(sp)
1c00b280:	c226                	sw	s1,4(sp)
1c00b282:	300474f3          	csrrci	s1,mstatus,8
1c00b286:	411c                	lw	a5,0(a0)
1c00b288:	17fd                	addi	a5,a5,-1
1c00b28a:	c11c                	sw	a5,0(a0)
1c00b28c:	e78d                	bnez	a5,1c00b2b6 <rt_uart_close+0x3c>
1c00b28e:	842a                	mv	s0,a0
1c00b290:	3d79                	jal	1c00b12e <__rt_uart_wait_tx_done.isra.5>
1c00b292:	005007b7          	lui	a5,0x500
1c00b296:	1a102737          	lui	a4,0x1a102
1c00b29a:	0799                	addi	a5,a5,6
1c00b29c:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102190>
1c00b2a0:	4050                	lw	a2,4(s0)
1c00b2a2:	78072683          	lw	a3,1920(a4)
1c00b2a6:	4785                	li	a5,1
1c00b2a8:	00c797b3          	sll	a5,a5,a2
1c00b2ac:	fff7c793          	not	a5,a5
1c00b2b0:	8ff5                	and	a5,a5,a3
1c00b2b2:	78f72023          	sw	a5,1920(a4)
1c00b2b6:	30049073          	csrw	mstatus,s1
1c00b2ba:	40b2                	lw	ra,12(sp)
1c00b2bc:	4422                	lw	s0,8(sp)
1c00b2be:	4492                	lw	s1,4(sp)
1c00b2c0:	0141                	addi	sp,sp,16
1c00b2c2:	8082                	ret

1c00b2c4 <rt_uart_cluster_write>:
1c00b2c4:	f14027f3          	csrr	a5,mhartid
1c00b2c8:	8795                	srai	a5,a5,0x5
1c00b2ca:	03f7f793          	andi	a5,a5,63
1c00b2ce:	08f68ca3          	sb	a5,153(a3)
1c00b2d2:	1c00b7b7          	lui	a5,0x1c00b
1c00b2d6:	0ec78793          	addi	a5,a5,236 # 1c00b0ec <__rt_uart_cluster_req>
1c00b2da:	c6dc                	sw	a5,12(a3)
1c00b2dc:	4785                	li	a5,1
1c00b2de:	c288                	sw	a0,0(a3)
1c00b2e0:	c2cc                	sw	a1,4(a3)
1c00b2e2:	c690                	sw	a2,8(a3)
1c00b2e4:	08068c23          	sb	zero,152(a3)
1c00b2e8:	0206a823          	sw	zero,48(a3)
1c00b2ec:	ca94                	sw	a3,16(a3)
1c00b2ee:	d6dc                	sw	a5,44(a3)
1c00b2f0:	00c68513          	addi	a0,a3,12
1c00b2f4:	abbfd06f          	j	1c008dae <__rt_cluster_push_fc_event>

1c00b2f8 <__rt_uart_init>:
1c00b2f8:	1c00b5b7          	lui	a1,0x1c00b
1c00b2fc:	1141                	addi	sp,sp,-16
1c00b2fe:	4601                	li	a2,0
1c00b300:	19458593          	addi	a1,a1,404 # 1c00b194 <__rt_uart_setfreq_before>
1c00b304:	4511                	li	a0,4
1c00b306:	c606                	sw	ra,12(sp)
1c00b308:	c422                	sw	s0,8(sp)
1c00b30a:	8c0fe0ef          	jal	ra,1c0093ca <__rt_cbsys_add>
1c00b30e:	1c00b5b7          	lui	a1,0x1c00b
1c00b312:	842a                	mv	s0,a0
1c00b314:	4601                	li	a2,0
1c00b316:	0cc58593          	addi	a1,a1,204 # 1c00b0cc <__rt_uart_setfreq_after>
1c00b31a:	4515                	li	a0,5
1c00b31c:	8aefe0ef          	jal	ra,1c0093ca <__rt_cbsys_add>
1c00b320:	1c0017b7          	lui	a5,0x1c001
1c00b324:	1a07a423          	sw	zero,424(a5) # 1c0011a8 <__rt_uart>
1c00b328:	8d41                	or	a0,a0,s0
1c00b32a:	c105                	beqz	a0,1c00b34a <__rt_uart_init+0x52>
1c00b32c:	f1402673          	csrr	a2,mhartid
1c00b330:	1c000537          	lui	a0,0x1c000
1c00b334:	40565593          	srai	a1,a2,0x5
1c00b338:	03f5f593          	andi	a1,a1,63
1c00b33c:	8a7d                	andi	a2,a2,31
1c00b33e:	6a850513          	addi	a0,a0,1704 # 1c0006a8 <__DTOR_END__+0x3bc>
1c00b342:	ba8ff0ef          	jal	ra,1c00a6ea <printf>
1c00b346:	b30ff0ef          	jal	ra,1c00a676 <abort>
1c00b34a:	40b2                	lw	ra,12(sp)
1c00b34c:	4422                	lw	s0,8(sp)
1c00b34e:	0141                	addi	sp,sp,16
1c00b350:	8082                	ret

1c00b352 <_endtext>:
	...

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
1c010034:	1c8b8b93          	addi	s7,s7,456 # 1c0011f8 <__rt_fc_cluster_data>
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
