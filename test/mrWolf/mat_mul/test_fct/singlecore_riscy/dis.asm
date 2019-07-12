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
1c008090:	0fcc                	addi	a1,sp,980
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
1c0080bc:	fe028293          	addi	t0,t0,-32 # 1c001098 <_bss_start>
1c0080c0:	ffff9317          	auipc	t1,0xffff9
1c0080c4:	13430313          	addi	t1,t1,308 # 1c0011f4 <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0)
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	dde10113          	addi	sp,sp,-546 # 1c000eb0 <stack>
1c0080da:	2fc010ef          	jal	ra,1c0093d6 <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00001397          	auipc	t2,0x1
1c0080ea:	adc38393          	addi	t2,t2,-1316 # 1c008bc2 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	456010ef          	jal	ra,1c00954a <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	09f020ef          	jal	ra,1c00a998 <exit>

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
1c00815e:	7ac60613          	addi	a2,a2,1964 # 1c009906 <__rt_bridge_handle_notif>
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
1c008198:	02448493          	addi	s1,s1,36 # 1c0011b8 <__rt_fc_cluster_data>

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
1c0081fa:	fc248493          	addi	s1,s1,-62 # 1c0011b8 <__rt_fc_cluster_data>
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
1c00825e:	38050513          	addi	a0,a0,896 # 1c0095da <__rt_handle_illegal_instr>
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
1c00855a:	4dc020ef          	jal	ra,1c00aa36 <printf>
1c00855e:	0028                	addi	a0,sp,8
1c008560:	63f000ef          	jal	ra,1c00939e <rt_perf_init>
1c008564:	6585                	lui	a1,0x1
1c008566:	450d                	li	a0,3
1c008568:	272d                	jal	1c008c92 <rt_alloc>
1c00856a:	1a050263          	beqz	a0,1c00870e <cluster_entry+0x1de>
1c00856e:	84aa                	mv	s1,a0
1c008570:	1c000537          	lui	a0,0x1c000
1c008574:	42450513          	addi	a0,a0,1060 # 1c000424 <__DTOR_END__+0x138>
1c008578:	3be020ef          	jal	ra,1c00a936 <puts>
1c00857c:	65e1                	lui	a1,0x18
1c00857e:	0599                	addi	a1,a1,6
1c008580:	0028                	addi	a0,sp,8
1c008582:	631000ef          	jal	ra,1c0093b2 <rt_perf_conf>
1c008586:	47fd                	li	a5,31
1c008588:	12f40f63          	beq	s0,a5,1c0086c6 <cluster_entry+0x196>
1c00858c:	102007b7          	lui	a5,0x10200
1c008590:	4705                	li	a4,1
1c008592:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fe3ec>
1c008596:	02e7a023          	sw	a4,32(a5)
1c00859a:	4781                	li	a5,0
1c00859c:	79f79073          	csrw	pccr31,a5
1c0085a0:	f14027f3          	csrr	a5,mhartid
1c0085a4:	477d                	li	a4,31
1c0085a6:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085aa:	12e78d63          	beq	a5,a4,1c0086e4 <cluster_entry+0x1b4>
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
1c0085e0:	22b1                	jal	1c00872c <plp_mat_mult_i16v_xpulpv2>
1c0085e2:	477d                	li	a4,31
1c0085e4:	f14027f3          	csrr	a5,mhartid
1c0085e8:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085ec:	12e78863          	beq	a5,a4,1c00871c <cluster_entry+0x1ec>
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
1c00862e:	408020ef          	jal	ra,1c00aa36 <printf>
1c008632:	0a85                	addi	s5,s5,1
1c008634:	ff3411e3          	bne	s0,s3,1c008616 <cluster_entry+0xe6>
1c008638:	0c0a8463          	beqz	s5,1c008700 <cluster_entry+0x1d0>
1c00863c:	1c000537          	lui	a0,0x1c000
1c008640:	85d6                	mv	a1,s5
1c008642:	48850513          	addi	a0,a0,1160 # 1c000488 <__DTOR_END__+0x19c>
1c008646:	3f0020ef          	jal	ra,1c00aa36 <printf>
1c00864a:	f14027f3          	csrr	a5,mhartid
1c00864e:	477d                	li	a4,31
1c008650:	ca5797b3          	p.extractu	a5,a5,5,5
1c008654:	0ae78163          	beq	a5,a4,1c0086f6 <cluster_entry+0x1c6>
1c008658:	102005b7          	lui	a1,0x10200
1c00865c:	40058593          	addi	a1,a1,1024 # 10200400 <__l1_end+0x1fe3ec>
1c008660:	0085a583          	lw	a1,8(a1)
1c008664:	78102973          	csrr	s2,pccr1
1c008668:	782024f3          	csrr	s1,pccr2
1c00866c:	78f02473          	csrr	s0,pccr15
1c008670:	1c000537          	lui	a0,0x1c000
1c008674:	49c50513          	addi	a0,a0,1180 # 1c00049c <__DTOR_END__+0x1b0>
1c008678:	3be020ef          	jal	ra,1c00aa36 <printf>
1c00867c:	1c000537          	lui	a0,0x1c000
1c008680:	85ca                	mv	a1,s2
1c008682:	4b050513          	addi	a0,a0,1200 # 1c0004b0 <__DTOR_END__+0x1c4>
1c008686:	3b0020ef          	jal	ra,1c00aa36 <printf>
1c00868a:	1c000537          	lui	a0,0x1c000
1c00868e:	85a6                	mv	a1,s1
1c008690:	4c450513          	addi	a0,a0,1220 # 1c0004c4 <__DTOR_END__+0x1d8>
1c008694:	3a2020ef          	jal	ra,1c00aa36 <printf>
1c008698:	1c000537          	lui	a0,0x1c000
1c00869c:	85a2                	mv	a1,s0
1c00869e:	4d450513          	addi	a0,a0,1236 # 1c0004d4 <__DTOR_END__+0x1e8>
1c0086a2:	394020ef          	jal	ra,1c00aa36 <printf>
1c0086a6:	1c000537          	lui	a0,0x1c000
1c0086aa:	65c1                	lui	a1,0x10
1c0086ac:	4e050513          	addi	a0,a0,1248 # 1c0004e0 <__DTOR_END__+0x1f4>
1c0086b0:	386020ef          	jal	ra,1c00aa36 <printf>
1c0086b4:	50b6                	lw	ra,108(sp)
1c0086b6:	5426                	lw	s0,104(sp)
1c0086b8:	5496                	lw	s1,100(sp)
1c0086ba:	5906                	lw	s2,96(sp)
1c0086bc:	49f6                	lw	s3,92(sp)
1c0086be:	4a66                	lw	s4,88(sp)
1c0086c0:	4ad6                	lw	s5,84(sp)
1c0086c2:	6165                	addi	sp,sp,112
1c0086c4:	8082                	ret
1c0086c6:	4785                	li	a5,1
1c0086c8:	1a10b737          	lui	a4,0x1a10b
1c0086cc:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa10900c>
1c0086d0:	4781                	li	a5,0
1c0086d2:	79f79073          	csrw	pccr31,a5
1c0086d6:	f14027f3          	csrr	a5,mhartid
1c0086da:	477d                	li	a4,31
1c0086dc:	ca5797b3          	p.extractu	a5,a5,5,5
1c0086e0:	ece797e3          	bne	a5,a4,1c0085ae <cluster_entry+0x7e>
1c0086e4:	4785                	li	a5,1
1c0086e6:	1a10b737          	lui	a4,0x1a10b
1c0086ea:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa109004>
1c0086ee:	478d                	li	a5,3
1c0086f0:	7a179073          	csrw	pcmr,a5
1c0086f4:	b5f9                	j	1c0085c2 <cluster_entry+0x92>
1c0086f6:	1a10b5b7          	lui	a1,0x1a10b
1c0086fa:	0085a583          	lw	a1,8(a1) # 1a10b008 <__l1_end+0xa108ff4>
1c0086fe:	b79d                	j	1c008664 <cluster_entry+0x134>
1c008700:	1c000537          	lui	a0,0x1c000
1c008704:	47450513          	addi	a0,a0,1140 # 1c000474 <__DTOR_END__+0x188>
1c008708:	22e020ef          	jal	ra,1c00a936 <puts>
1c00870c:	bf3d                	j	1c00864a <cluster_entry+0x11a>
1c00870e:	1c000537          	lui	a0,0x1c000
1c008712:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c008716:	220020ef          	jal	ra,1c00a936 <puts>
1c00871a:	bf05                	j	1c00864a <cluster_entry+0x11a>
1c00871c:	1a10b7b7          	lui	a5,0x1a10b
1c008720:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa108fec>
1c008724:	4781                	li	a5,0
1c008726:	7a179073          	csrw	pcmr,a5
1c00872a:	bde1                	j	1c008602 <cluster_entry+0xd2>

1c00872c <plp_mat_mult_i16v_xpulpv2>:
1c00872c:	7171                	addi	sp,sp,-176
1c00872e:	d6b2                	sw	a2,108(sp)
1c008730:	8209                	srli	a2,a2,0x2
1c008732:	d722                	sw	s0,172(sp)
1c008734:	d526                	sw	s1,168(sp)
1c008736:	d34a                	sw	s2,164(sp)
1c008738:	d14e                	sw	s3,160(sp)
1c00873a:	cf52                	sw	s4,156(sp)
1c00873c:	cd56                	sw	s5,152(sp)
1c00873e:	cb5a                	sw	s6,148(sp)
1c008740:	c95e                	sw	s7,144(sp)
1c008742:	c762                	sw	s8,140(sp)
1c008744:	c566                	sw	s9,136(sp)
1c008746:	c36a                	sw	s10,132(sp)
1c008748:	c16e                	sw	s11,128(sp)
1c00874a:	ccb2                	sw	a2,88(sp)
1c00874c:	c8aa                	sw	a0,80(sp)
1c00874e:	c2ae                	sw	a1,68(sp)
1c008750:	c636                	sw	a3,12(sp)
1c008752:	d83a                	sw	a4,48(sp)
1c008754:	d8be                	sw	a5,112(sp)
1c008756:	44060c63          	beqz	a2,1c008bae <plp_mat_mult_i16v_xpulpv2+0x482>
1c00875a:	85ba                	mv	a1,a4
1c00875c:	00169793          	slli	a5,a3,0x1
1c008760:	00175693          	srli	a3,a4,0x1
1c008764:	4732                	lw	a4,12(sp)
1c008766:	00f50ab3          	add	s5,a0,a5
1c00876a:	00fa8633          	add	a2,s5,a5
1c00876e:	8305                	srli	a4,a4,0x1
1c008770:	00259d93          	slli	s11,a1,0x2
1c008774:	da32                	sw	a2,52(sp)
1c008776:	d63a                	sw	a4,44(sp)
1c008778:	00271613          	slli	a2,a4,0x2
1c00877c:	dc56                	sw	s5,56(sp)
1c00877e:	00359713          	slli	a4,a1,0x3
1c008782:	00459a93          	slli	s5,a1,0x4
1c008786:	55c6                	lw	a1,112(sp)
1c008788:	d4d6                	sw	s5,104(sp)
1c00878a:	962a                	add	a2,a2,a0
1c00878c:	01b58ab3          	add	s5,a1,s11
1c008790:	ceae                	sw	a1,92(sp)
1c008792:	c4d6                	sw	s5,72(sp)
1c008794:	45b2                	lw	a1,12(sp)
1c008796:	5ad2                	lw	s5,52(sp)
1c008798:	de32                	sw	a2,60(sp)
1c00879a:	058e                	slli	a1,a1,0x3
1c00879c:	97d6                	add	a5,a5,s5
1c00879e:	c6ae                	sw	a1,76(sp)
1c0087a0:	c0be                	sw	a5,64(sp)
1c0087a2:	4596                	lw	a1,68(sp)
1c0087a4:	00470793          	addi	a5,a4,4
1c0087a8:	5642                	lw	a2,48(sp)
1c0087aa:	debe                	sw	a5,124(sp)
1c0087ac:	1c0007b7          	lui	a5,0x1c000
1c0087b0:	d2b6                	sw	a3,100(sp)
1c0087b2:	4f07ac03          	lw	s8,1264(a5) # 1c0004f0 <__DTOR_END__+0x204>
1c0087b6:	068a                	slli	a3,a3,0x2
1c0087b8:	1c0007b7          	lui	a5,0x1c000
1c0087bc:	96ae                	add	a3,a3,a1
1c0087be:	4f47ab83          	lw	s7,1268(a5) # 1c0004f4 <__DTOR_END__+0x208>
1c0087c2:	dab6                	sw	a3,116(sp)
1c0087c4:	0606                	slli	a2,a2,0x1
1c0087c6:	004d8693          	addi	a3,s11,4
1c0087ca:	d42a                	sw	a0,40(sp)
1c0087cc:	cab2                	sw	a2,84(sp)
1c0087ce:	d082                	sw	zero,96(sp)
1c0087d0:	dcb6                	sw	a3,120(sp)
1c0087d2:	5616                	lw	a2,100(sp)
1c0087d4:	20060d63          	beqz	a2,1c0089ee <plp_mat_mult_i16v_xpulpv2+0x2c2>
1c0087d8:	4816                	lw	a6,68(sp)
1c0087da:	56d6                	lw	a3,116(sp)
1c0087dc:	4aa6                	lw	s5,72(sp)
1c0087de:	45f6                	lw	a1,92(sp)
1c0087e0:	410687b3          	sub	a5,a3,a6
1c0087e4:	5776                	lw	a4,124(sp)
1c0087e6:	56e6                	lw	a3,120(sp)
1c0087e8:	17f1                	addi	a5,a5,-4
1c0087ea:	c242                	sw	a6,4(sp)
1c0087ec:	4876                	lw	a6,92(sp)
1c0087ee:	8389                	srli	a5,a5,0x2
1c0087f0:	015d8cb3          	add	s9,s11,s5
1c0087f4:	0591                	addi	a1,a1,4
1c0087f6:	004a8613          	addi	a2,s5,4
1c0087fa:	96d6                	add	a3,a3,s5
1c0087fc:	9756                	add	a4,a4,s5
1c0087fe:	0785                	addi	a5,a5,1
1c008800:	019d8d33          	add	s10,s11,s9
1c008804:	ce2e                	sw	a1,28(sp)
1c008806:	cc32                	sw	a2,24(sp)
1c008808:	ca36                	sw	a3,20(sp)
1c00880a:	c83a                	sw	a4,16(sp)
1c00880c:	d056                	sw	s5,32(sp)
1c00880e:	d242                	sw	a6,36(sp)
1c008810:	c43e                	sw	a5,8(sp)
1c008812:	5732                	lw	a4,44(sp)
1c008814:	1c070163          	beqz	a4,1c0089d6 <plp_mat_mult_i16v_xpulpv2+0x2aa>
1c008818:	57a2                	lw	a5,40(sp)
1c00881a:	5772                	lw	a4,60(sp)
1c00881c:	4a92                	lw	s5,4(sp)
1c00881e:	45d6                	lw	a1,84(sp)
1c008820:	40f70833          	sub	a6,a4,a5
1c008824:	1871                	addi	a6,a6,-4
1c008826:	4a06                	lw	s4,64(sp)
1c008828:	59d2                	lw	s3,52(sp)
1c00882a:	5962                	lw	s2,56(sp)
1c00882c:	00285813          	srli	a6,a6,0x2
1c008830:	00ba8b33          	add	s6,s5,a1
1c008834:	84be                	mv	s1,a5
1c008836:	4401                	li	s0,0
1c008838:	4381                	li	t2,0
1c00883a:	4281                	li	t0,0
1c00883c:	4f81                	li	t6,0
1c00883e:	4f01                	li	t5,0
1c008840:	4e81                	li	t4,0
1c008842:	4e01                	li	t3,0
1c008844:	4301                	li	t1,0
1c008846:	0805                	addi	a6,a6,1
1c008848:	021840fb          	lp.setup	x1,a6,1c00888a <plp_mat_mult_i16v_xpulpv2+0x15e>
1c00884c:	21baf78b          	p.lw	a5,s11(s5!)
1c008850:	21bb788b          	p.lw	a7,s11(s6!)
1c008854:	0044a50b          	p.lw	a0,4(s1!)
1c008858:	0049258b          	p.lw	a1,4(s2!)
1c00885c:	0049a60b          	p.lw	a2,4(s3!)
1c008860:	004a268b          	p.lw	a3,4(s4!)
1c008864:	873e                	mv	a4,a5
1c008866:	c9888757          	pv.shuffle2.h	a4,a7,s8
1c00886a:	c97887d7          	pv.shuffle2.h	a5,a7,s7
1c00886e:	b8e50357          	pv.sdotsp.h	t1,a0,a4
1c008872:	b8f50e57          	pv.sdotsp.h	t3,a0,a5
1c008876:	b8e58ed7          	pv.sdotsp.h	t4,a1,a4
1c00887a:	b8f58f57          	pv.sdotsp.h	t5,a1,a5
1c00887e:	b8e60fd7          	pv.sdotsp.h	t6,a2,a4
1c008882:	b8f602d7          	pv.sdotsp.h	t0,a2,a5
1c008886:	b8e683d7          	pv.sdotsp.h	t2,a3,a4
1c00888a:	b8f68457          	pv.sdotsp.h	s0,a3,a5
1c00888e:	5832                	lw	a6,44(sp)
1c008890:	5612                	lw	a2,36(sp)
1c008892:	46f2                	lw	a3,28(sp)
1c008894:	5702                	lw	a4,32(sp)
1c008896:	0066242b          	p.sw	t1,8(a2!) # 90000008 <pulp__FC+0x90000009>
1c00889a:	47e2                	lw	a5,24(sp)
1c00889c:	01c6a42b          	p.sw	t3,8(a3!)
1c0088a0:	01d7242b          	p.sw	t4,8(a4!)
1c0088a4:	4ad2                	lw	s5,20(sp)
1c0088a6:	01e7a42b          	p.sw	t5,8(a5!)
1c0088aa:	01fca42b          	p.sw	t6,8(s9!)
1c0088ae:	45c2                	lw	a1,16(sp)
1c0088b0:	d232                	sw	a2,36(sp)
1c0088b2:	ce36                	sw	a3,28(sp)
1c0088b4:	4612                	lw	a2,4(sp)
1c0088b6:	46a2                	lw	a3,8(sp)
1c0088b8:	005aa42b          	p.sw	t0,8(s5!)
1c0088bc:	007d242b          	p.sw	t2,8(s10!)
1c0088c0:	0085a42b          	p.sw	s0,8(a1!)
1c0088c4:	0611                	addi	a2,a2,4
1c0088c6:	16fd                	addi	a3,a3,-1
1c0088c8:	d03a                	sw	a4,32(sp)
1c0088ca:	cc3e                	sw	a5,24(sp)
1c0088cc:	ca56                	sw	s5,20(sp)
1c0088ce:	c82e                	sw	a1,16(sp)
1c0088d0:	c232                	sw	a2,4(sp)
1c0088d2:	c436                	sw	a3,8(sp)
1c0088d4:	fe9d                	bnez	a3,1c008812 <plp_mat_mult_i16v_xpulpv2+0xe6>
1c0088d6:	5796                	lw	a5,100(sp)
1c0088d8:	5a86                	lw	s5,96(sp)
1c0088da:	5626                	lw	a2,104(sp)
1c0088dc:	45f6                	lw	a1,92(sp)
1c0088de:	0a85                	addi	s5,s5,1
1c0088e0:	d0d6                	sw	s5,96(sp)
1c0088e2:	46a6                	lw	a3,72(sp)
1c0088e4:	4ab6                	lw	s5,76(sp)
1c0088e6:	5722                	lw	a4,40(sp)
1c0088e8:	95b2                	add	a1,a1,a2
1c0088ea:	96b2                	add	a3,a3,a2
1c0088ec:	9756                	add	a4,a4,s5
1c0088ee:	ceae                	sw	a1,92(sp)
1c0088f0:	55e2                	lw	a1,56(sp)
1c0088f2:	5652                	lw	a2,52(sp)
1c0088f4:	c4b6                	sw	a3,72(sp)
1c0088f6:	d43a                	sw	a4,40(sp)
1c0088f8:	4686                	lw	a3,64(sp)
1c0088fa:	5772                	lw	a4,60(sp)
1c0088fc:	95d6                	add	a1,a1,s5
1c0088fe:	9656                	add	a2,a2,s5
1c008900:	96d6                	add	a3,a3,s5
1c008902:	9756                	add	a4,a4,s5
1c008904:	dc2e                	sw	a1,56(sp)
1c008906:	4ae6                	lw	s5,88(sp)
1c008908:	5586                	lw	a1,96(sp)
1c00890a:	da32                	sw	a2,52(sp)
1c00890c:	c0b6                	sw	a3,64(sp)
1c00890e:	de3a                	sw	a4,60(sp)
1c008910:	ecba91e3          	bne	s5,a1,1c0087d2 <plp_mat_mult_i16v_xpulpv2+0xa6>
1c008914:	5636                	lw	a2,108(sp)
1c008916:	0a8a                	slli	s5,s5,0x2
1c008918:	ccd6                	sw	s5,88(sp)
1c00891a:	0806                	slli	a6,a6,0x1
1c00891c:	0786                	slli	a5,a5,0x1
1c00891e:	0d560a63          	beq	a2,s5,1c0089f2 <plp_mat_mult_i16v_xpulpv2+0x2c6>
1c008922:	e3f5                	bnez	a5,1c008a06 <plp_mat_mult_i16v_xpulpv2+0x2da>
1c008924:	4666                	lw	a2,88(sp)
1c008926:	5ab6                	lw	s5,108(sp)
1c008928:	09567963          	bleu	s5,a2,1c0089ba <plp_mat_mult_i16v_xpulpv2+0x28e>
1c00892c:	45b2                	lw	a1,12(sp)
1c00892e:	56c2                	lw	a3,48(sp)
1c008930:	4346                	lw	t1,80(sp)
1c008932:	00159f13          	slli	t5,a1,0x1
1c008936:	00160e13          	addi	t3,a2,1
1c00893a:	02d60eb3          	mul	t4,a2,a3
1c00893e:	00169f93          	slli	t6,a3,0x1
1c008942:	43ee0333          	p.mac	t1,t3,t5
1c008946:	02b608b3          	mul	a7,a2,a1
1c00894a:	56c2                	lw	a3,48(sp)
1c00894c:	04d7fc63          	bleu	a3,a5,1c0089a4 <plp_mat_mult_i16v_xpulpv2+0x278>
1c008950:	5746                	lw	a4,112(sp)
1c008952:	01d782b3          	add	t0,a5,t4
1c008956:	028a                	slli	t0,t0,0x2
1c008958:	92ba                	add	t0,t0,a4
1c00895a:	40f68533          	sub	a0,a3,a5
1c00895e:	0225407b          	lp.setup	x0,a0,1c0089a2 <plp_mat_mult_i16v_xpulpv2+0x276>
1c008962:	45b2                	lw	a1,12(sp)
1c008964:	08b87363          	bleu	a1,a6,1c0089ea <plp_mat_mult_i16v_xpulpv2+0x2be>
1c008968:	5742                	lw	a4,48(sp)
1c00896a:	863e                	mv	a2,a5
1c00896c:	4a96                	lw	s5,68(sp)
1c00896e:	43070633          	p.mac	a2,a4,a6
1c008972:	9846                	add	a6,a6,a7
1c008974:	00181693          	slli	a3,a6,0x1
1c008978:	4846                	lw	a6,80(sp)
1c00897a:	4581                	li	a1,0
1c00897c:	96c2                	add	a3,a3,a6
1c00897e:	40d30733          	sub	a4,t1,a3
1c008982:	1779                	addi	a4,a4,-2
1c008984:	8305                	srli	a4,a4,0x1
1c008986:	0606                	slli	a2,a2,0x1
1c008988:	0705                	addi	a4,a4,1
1c00898a:	9656                	add	a2,a2,s5
1c00898c:	006740fb          	lp.setup	x1,a4,1c008998 <plp_mat_mult_i16v_xpulpv2+0x26c>
1c008990:	0026980b          	p.lh	a6,2(a3!)
1c008994:	11f6738b          	p.lh	t2,t6(a2!)
1c008998:	430385b3          	p.mac	a1,t2,a6
1c00899c:	4832                	lw	a6,12(sp)
1c00899e:	00b2a22b          	p.sw	a1,4(t0!)
1c0089a2:	0785                	addi	a5,a5,1
1c0089a4:	5642                	lw	a2,48(sp)
1c0089a6:	ccf2                	sw	t3,88(sp)
1c0089a8:	46b2                	lw	a3,12(sp)
1c0089aa:	9eb2                	add	t4,t4,a2
1c0089ac:	5ab6                	lw	s5,108(sp)
1c0089ae:	4666                	lw	a2,88(sp)
1c0089b0:	937a                	add	t1,t1,t5
1c0089b2:	98b6                	add	a7,a7,a3
1c0089b4:	0e05                	addi	t3,t3,1
1c0089b6:	f8ca9ae3          	bne	s5,a2,1c00894a <plp_mat_mult_i16v_xpulpv2+0x21e>
1c0089ba:	543a                	lw	s0,172(sp)
1c0089bc:	54aa                	lw	s1,168(sp)
1c0089be:	591a                	lw	s2,164(sp)
1c0089c0:	598a                	lw	s3,160(sp)
1c0089c2:	4a7a                	lw	s4,156(sp)
1c0089c4:	4aea                	lw	s5,152(sp)
1c0089c6:	4b5a                	lw	s6,148(sp)
1c0089c8:	4bca                	lw	s7,144(sp)
1c0089ca:	4c3a                	lw	s8,140(sp)
1c0089cc:	4caa                	lw	s9,136(sp)
1c0089ce:	4d1a                	lw	s10,132(sp)
1c0089d0:	4d8a                	lw	s11,128(sp)
1c0089d2:	614d                	addi	sp,sp,176
1c0089d4:	8082                	ret
1c0089d6:	4801                	li	a6,0
1c0089d8:	4401                	li	s0,0
1c0089da:	4381                	li	t2,0
1c0089dc:	4281                	li	t0,0
1c0089de:	4f81                	li	t6,0
1c0089e0:	4f01                	li	t5,0
1c0089e2:	4e81                	li	t4,0
1c0089e4:	4e01                	li	t3,0
1c0089e6:	4301                	li	t1,0
1c0089e8:	b565                	j	1c008890 <plp_mat_mult_i16v_xpulpv2+0x164>
1c0089ea:	4581                	li	a1,0
1c0089ec:	bf4d                	j	1c00899e <plp_mat_mult_i16v_xpulpv2+0x272>
1c0089ee:	4781                	li	a5,0
1c0089f0:	b5e5                	j	1c0088d8 <plp_mat_mult_i16v_xpulpv2+0x1ac>
1c0089f2:	46b2                	lw	a3,12(sp)
1c0089f4:	f2d817e3          	bne	a6,a3,1c008922 <plp_mat_mult_i16v_xpulpv2+0x1f6>
1c0089f8:	55c2                	lw	a1,48(sp)
1c0089fa:	fcf580e3          	beq	a1,a5,1c0089ba <plp_mat_mult_i16v_xpulpv2+0x28e>
1c0089fe:	4ae6                	lw	s5,88(sp)
1c008a00:	fa0a8de3          	beqz	s5,1c0089ba <plp_mat_mult_i16v_xpulpv2+0x28e>
1c008a04:	bf39                	j	1c008922 <plp_mat_mult_i16v_xpulpv2+0x1f6>
1c008a06:	f0080fe3          	beqz	a6,1c008924 <plp_mat_mult_i16v_xpulpv2+0x1f8>
1c008a0a:	4ab2                	lw	s5,12(sp)
1c008a0c:	09580863          	beq	a6,s5,1c008a9c <plp_mat_mult_i16v_xpulpv2+0x370>
1c008a10:	55c2                	lw	a1,48(sp)
1c008a12:	4496                	lw	s1,68(sp)
1c008a14:	001a9413          	slli	s0,s5,0x1
1c008a18:	00159993          	slli	s3,a1,0x1
1c008a1c:	430984b3          	p.mac	s1,s3,a6
1c008a20:	4ac6                	lw	s5,80(sp)
1c008a22:	5646                	lw	a2,112(sp)
1c008a24:	00279f93          	slli	t6,a5,0x2
1c008a28:	00181e93          	slli	t4,a6,0x1
1c008a2c:	40f003b3          	neg	t2,a5
1c008a30:	00259913          	slli	s2,a1,0x2
1c008a34:	9fb2                	add	t6,t6,a2
1c008a36:	9ed6                	add	t4,t4,s5
1c008a38:	008a8f33          	add	t5,s5,s0
1c008a3c:	038a                	slli	t2,t2,0x2
1c008a3e:	4281                	li	t0,0
1c008a40:	01f38333          	add	t1,t2,t6
1c008a44:	406f88b3          	sub	a7,t6,t1
1c008a48:	18f1                	addi	a7,a7,-4
1c008a4a:	0028d893          	srli	a7,a7,0x2
1c008a4e:	8e26                	mv	t3,s1
1c008a50:	0885                	addi	a7,a7,1
1c008a52:	01c8c07b          	lp.setup	x0,a7,1c008a8a <plp_mat_mult_i16v_xpulpv2+0x35e>
1c008a56:	45b2                	lw	a1,12(sp)
1c008a58:	4681                	li	a3,0
1c008a5a:	02b87463          	bleu	a1,a6,1c008a82 <plp_mat_mult_i16v_xpulpv2+0x356>
1c008a5e:	41df0733          	sub	a4,t5,t4
1c008a62:	1779                	addi	a4,a4,-2
1c008a64:	8305                	srli	a4,a4,0x1
1c008a66:	85f2                	mv	a1,t3
1c008a68:	8676                	mv	a2,t4
1c008a6a:	4681                	li	a3,0
1c008a6c:	0705                	addi	a4,a4,1
1c008a6e:	009740fb          	lp.setup	x1,a4,1c008a80 <plp_mat_mult_i16v_xpulpv2+0x354>
1c008a72:	0026150b          	p.lh	a0,2(a2!)
1c008a76:	1135fa0b          	p.lh	s4,s3(a1!)
1c008a7a:	8ab6                	mv	s5,a3
1c008a7c:	42aa0ab3          	p.mac	s5,s4,a0
1c008a80:	96d6                	add	a3,a3,s5
1c008a82:	00032703          	lw	a4,0(t1)
1c008a86:	0e09                	addi	t3,t3,2
1c008a88:	96ba                	add	a3,a3,a4
1c008a8a:	00d3222b          	p.sw	a3,4(t1!)
1c008a8e:	4666                	lw	a2,88(sp)
1c008a90:	0285                	addi	t0,t0,1
1c008a92:	9fca                	add	t6,t6,s2
1c008a94:	9ea2                	add	t4,t4,s0
1c008a96:	9f22                	add	t5,t5,s0
1c008a98:	fac2e4e3          	bltu	t0,a2,1c008a40 <plp_mat_mult_i16v_xpulpv2+0x314>
1c008a9c:	56c2                	lw	a3,48(sp)
1c008a9e:	08d78063          	beq	a5,a3,1c008b1e <plp_mat_mult_i16v_xpulpv2+0x3f2>
1c008aa2:	06d7fe63          	bleu	a3,a5,1c008b1e <plp_mat_mult_i16v_xpulpv2+0x3f2>
1c008aa6:	45b2                	lw	a1,12(sp)
1c008aa8:	4816                	lw	a6,68(sp)
1c008aaa:	5646                	lw	a2,112(sp)
1c008aac:	48c6                	lw	a7,80(sp)
1c008aae:	00279e93          	slli	t4,a5,0x2
1c008ab2:	00159293          	slli	t0,a1,0x1
1c008ab6:	0786                	slli	a5,a5,0x1
1c008ab8:	00169413          	slli	s0,a3,0x1
1c008abc:	00269493          	slli	s1,a3,0x2
1c008ac0:	9eb2                	add	t4,t4,a2
1c008ac2:	00588e33          	add	t3,a7,t0
1c008ac6:	00f80f33          	add	t5,a6,a5
1c008aca:	008803b3          	add	t2,a6,s0
1c008ace:	4f81                	li	t6,0
1c008ad0:	41e38533          	sub	a0,t2,t5
1c008ad4:	1579                	addi	a0,a0,-2
1c008ad6:	8105                	srli	a0,a0,0x1
1c008ad8:	887a                	mv	a6,t5
1c008ada:	8376                	mv	t1,t4
1c008adc:	0505                	addi	a0,a0,1
1c008ade:	0185407b          	lp.setup	x0,a0,1c008b0e <plp_mat_mult_i16v_xpulpv2+0x3e2>
1c008ae2:	4ab2                	lw	s5,12(sp)
1c008ae4:	4701                	li	a4,0
1c008ae6:	020a8263          	beqz	s5,1c008b0a <plp_mat_mult_i16v_xpulpv2+0x3de>
1c008aea:	411e07b3          	sub	a5,t3,a7
1c008aee:	17f9                	addi	a5,a5,-2
1c008af0:	8385                	srli	a5,a5,0x1
1c008af2:	8642                	mv	a2,a6
1c008af4:	86c6                	mv	a3,a7
1c008af6:	4701                	li	a4,0
1c008af8:	0785                	addi	a5,a5,1
1c008afa:	0067c0fb          	lp.setup	x1,a5,1c008b06 <plp_mat_mult_i16v_xpulpv2+0x3da>
1c008afe:	0026958b          	p.lh	a1,2(a3!)
1c008b02:	1086790b          	p.lh	s2,s0(a2!)
1c008b06:	42b90733          	p.mac	a4,s2,a1
1c008b0a:	00e3222b          	p.sw	a4,4(t1!)
1c008b0e:	0809                	addi	a6,a6,2
1c008b10:	4666                	lw	a2,88(sp)
1c008b12:	0f85                	addi	t6,t6,1
1c008b14:	9ea6                	add	t4,t4,s1
1c008b16:	9896                	add	a7,a7,t0
1c008b18:	9e16                	add	t3,t3,t0
1c008b1a:	facfebe3          	bltu	t6,a2,1c008ad0 <plp_mat_mult_i16v_xpulpv2+0x3a4>
1c008b1e:	5836                	lw	a6,108(sp)
1c008b20:	4ae6                	lw	s5,88(sp)
1c008b22:	e90afce3          	bleu	a6,s5,1c0089ba <plp_mat_mult_i16v_xpulpv2+0x28e>
1c008b26:	55c2                	lw	a1,48(sp)
1c008b28:	e80589e3          	beqz	a1,1c0089ba <plp_mat_mult_i16v_xpulpv2+0x28e>
1c008b2c:	4632                	lw	a2,12(sp)
1c008b2e:	5fc6                	lw	t6,112(sp)
1c008b30:	4ec6                	lw	t4,80(sp)
1c008b32:	44c6                	lw	s1,80(sp)
1c008b34:	00161f13          	slli	t5,a2,0x1
1c008b38:	00259293          	slli	t0,a1,0x2
1c008b3c:	001a8e13          	addi	t3,s5,1
1c008b40:	425a8fb3          	p.mac	t6,s5,t0
1c008b44:	4816                	lw	a6,68(sp)
1c008b46:	00159393          	slli	t2,a1,0x1
1c008b4a:	00780433          	add	s0,a6,t2
1c008b4e:	43ea8eb3          	p.mac	t4,s5,t5
1c008b52:	43ee04b3          	p.mac	s1,t3,t5
1c008b56:	4a96                	lw	s5,68(sp)
1c008b58:	837e                	mv	t1,t6
1c008b5a:	41540833          	sub	a6,s0,s5
1c008b5e:	1879                	addi	a6,a6,-2
1c008b60:	00185813          	srli	a6,a6,0x1
1c008b64:	88d6                	mv	a7,s5
1c008b66:	0805                	addi	a6,a6,1
1c008b68:	0188407b          	lp.setup	x0,a6,1c008b98 <plp_mat_mult_i16v_xpulpv2+0x46c>
1c008b6c:	4ab2                	lw	s5,12(sp)
1c008b6e:	4701                	li	a4,0
1c008b70:	020a8263          	beqz	s5,1c008b94 <plp_mat_mult_i16v_xpulpv2+0x468>
1c008b74:	41d487b3          	sub	a5,s1,t4
1c008b78:	17f9                	addi	a5,a5,-2
1c008b7a:	8385                	srli	a5,a5,0x1
1c008b7c:	8646                	mv	a2,a7
1c008b7e:	86f6                	mv	a3,t4
1c008b80:	4701                	li	a4,0
1c008b82:	0785                	addi	a5,a5,1
1c008b84:	0067c0fb          	lp.setup	x1,a5,1c008b90 <plp_mat_mult_i16v_xpulpv2+0x464>
1c008b88:	0026958b          	p.lh	a1,2(a3!)
1c008b8c:	1076750b          	p.lh	a0,t2(a2!)
1c008b90:	42b50733          	p.mac	a4,a0,a1
1c008b94:	00e3222b          	p.sw	a4,4(t1!)
1c008b98:	0889                	addi	a7,a7,2
1c008b9a:	ccf2                	sw	t3,88(sp)
1c008b9c:	5636                	lw	a2,108(sp)
1c008b9e:	4866                	lw	a6,88(sp)
1c008ba0:	9f96                	add	t6,t6,t0
1c008ba2:	9efa                	add	t4,t4,t5
1c008ba4:	94fa                	add	s1,s1,t5
1c008ba6:	0e05                	addi	t3,t3,1
1c008ba8:	fb0617e3          	bne	a2,a6,1c008b56 <plp_mat_mult_i16v_xpulpv2+0x42a>
1c008bac:	b539                	j	1c0089ba <plp_mat_mult_i16v_xpulpv2+0x28e>
1c008bae:	5636                	lw	a2,108(sp)
1c008bb0:	4801                	li	a6,0
1c008bb2:	4781                	li	a5,0
1c008bb4:	d60618e3          	bnez	a2,1c008924 <plp_mat_mult_i16v_xpulpv2+0x1f8>
1c008bb8:	e10691e3          	bne	a3,a6,1c0089ba <plp_mat_mult_i16v_xpulpv2+0x28e>
1c008bbc:	ccb2                	sw	a2,88(sp)
1c008bbe:	85ba                	mv	a1,a4
1c008bc0:	bd2d                	j	1c0089fa <plp_mat_mult_i16v_xpulpv2+0x2ce>

1c008bc2 <main>:
1c008bc2:	1101                	addi	sp,sp,-32
1c008bc4:	4681                	li	a3,0
1c008bc6:	4601                	li	a2,0
1c008bc8:	4581                	li	a1,0
1c008bca:	4505                	li	a0,1
1c008bcc:	ce06                	sw	ra,28(sp)
1c008bce:	2559                	jal	1c009254 <rt_cluster_mount>
1c008bd0:	1c008637          	lui	a2,0x1c008
1c008bd4:	4881                	li	a7,0
1c008bd6:	4801                	li	a6,0
1c008bd8:	4781                	li	a5,0
1c008bda:	4701                	li	a4,0
1c008bdc:	4681                	li	a3,0
1c008bde:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c008be2:	4581                	li	a1,0
1c008be4:	c002                	sw	zero,0(sp)
1c008be6:	4501                	li	a0,0
1c008be8:	2bc9                	jal	1c0091ba <rt_cluster_call>
1c008bea:	4501                	li	a0,0
1c008bec:	4681                	li	a3,0
1c008bee:	4601                	li	a2,0
1c008bf0:	4581                	li	a1,0
1c008bf2:	258d                	jal	1c009254 <rt_cluster_mount>
1c008bf4:	40f2                	lw	ra,28(sp)
1c008bf6:	4501                	li	a0,0
1c008bf8:	6105                	addi	sp,sp,32
1c008bfa:	8082                	ret

1c008bfc <rt_user_alloc_init>:
1c008bfc:	00758793          	addi	a5,a1,7
1c008c00:	9be1                	andi	a5,a5,-8
1c008c02:	40b785b3          	sub	a1,a5,a1
1c008c06:	c11c                	sw	a5,0(a0)
1c008c08:	8e0d                	sub	a2,a2,a1
1c008c0a:	00c05663          	blez	a2,1c008c16 <rt_user_alloc_init+0x1a>
1c008c0e:	9a61                	andi	a2,a2,-8
1c008c10:	c390                	sw	a2,0(a5)
1c008c12:	0007a223          	sw	zero,4(a5)
1c008c16:	8082                	ret

1c008c18 <rt_user_alloc>:
1c008c18:	411c                	lw	a5,0(a0)
1c008c1a:	059d                	addi	a1,a1,7
1c008c1c:	99e1                	andi	a1,a1,-8
1c008c1e:	4681                	li	a3,0
1c008c20:	cb89                	beqz	a5,1c008c32 <rt_user_alloc+0x1a>
1c008c22:	4398                	lw	a4,0(a5)
1c008c24:	00b74963          	blt	a4,a1,1c008c36 <rt_user_alloc+0x1e>
1c008c28:	00b71c63          	bne	a4,a1,1c008c40 <rt_user_alloc+0x28>
1c008c2c:	43d8                	lw	a4,4(a5)
1c008c2e:	c699                	beqz	a3,1c008c3c <rt_user_alloc+0x24>
1c008c30:	c2d8                	sw	a4,4(a3)
1c008c32:	853e                	mv	a0,a5
1c008c34:	8082                	ret
1c008c36:	86be                	mv	a3,a5
1c008c38:	43dc                	lw	a5,4(a5)
1c008c3a:	b7dd                	j	1c008c20 <rt_user_alloc+0x8>
1c008c3c:	c118                	sw	a4,0(a0)
1c008c3e:	bfd5                	j	1c008c32 <rt_user_alloc+0x1a>
1c008c40:	8f0d                	sub	a4,a4,a1
1c008c42:	c398                	sw	a4,0(a5)
1c008c44:	97ba                	add	a5,a5,a4
1c008c46:	b7f5                	j	1c008c32 <rt_user_alloc+0x1a>

1c008c48 <rt_user_free>:
1c008c48:	411c                	lw	a5,0(a0)
1c008c4a:	061d                	addi	a2,a2,7
1c008c4c:	9a61                	andi	a2,a2,-8
1c008c4e:	4701                	li	a4,0
1c008c50:	c399                	beqz	a5,1c008c56 <rt_user_free+0xe>
1c008c52:	02b7e763          	bltu	a5,a1,1c008c80 <rt_user_free+0x38>
1c008c56:	00c586b3          	add	a3,a1,a2
1c008c5a:	02d79663          	bne	a5,a3,1c008c86 <rt_user_free+0x3e>
1c008c5e:	4394                	lw	a3,0(a5)
1c008c60:	43dc                	lw	a5,4(a5)
1c008c62:	9636                	add	a2,a2,a3
1c008c64:	c190                	sw	a2,0(a1)
1c008c66:	c1dc                	sw	a5,4(a1)
1c008c68:	c31d                	beqz	a4,1c008c8e <rt_user_free+0x46>
1c008c6a:	4314                	lw	a3,0(a4)
1c008c6c:	00d707b3          	add	a5,a4,a3
1c008c70:	00f59d63          	bne	a1,a5,1c008c8a <rt_user_free+0x42>
1c008c74:	419c                	lw	a5,0(a1)
1c008c76:	97b6                	add	a5,a5,a3
1c008c78:	c31c                	sw	a5,0(a4)
1c008c7a:	41dc                	lw	a5,4(a1)
1c008c7c:	c35c                	sw	a5,4(a4)
1c008c7e:	8082                	ret
1c008c80:	873e                	mv	a4,a5
1c008c82:	43dc                	lw	a5,4(a5)
1c008c84:	b7f1                	j	1c008c50 <rt_user_free+0x8>
1c008c86:	c190                	sw	a2,0(a1)
1c008c88:	bff9                	j	1c008c66 <rt_user_free+0x1e>
1c008c8a:	c34c                	sw	a1,4(a4)
1c008c8c:	8082                	ret
1c008c8e:	c10c                	sw	a1,0(a0)
1c008c90:	8082                	ret

1c008c92 <rt_alloc>:
1c008c92:	1101                	addi	sp,sp,-32
1c008c94:	cc22                	sw	s0,24(sp)
1c008c96:	ce06                	sw	ra,28(sp)
1c008c98:	ca26                	sw	s1,20(sp)
1c008c9a:	c84a                	sw	s2,16(sp)
1c008c9c:	c64e                	sw	s3,12(sp)
1c008c9e:	c452                	sw	s4,8(sp)
1c008ca0:	4789                	li	a5,2
1c008ca2:	842a                	mv	s0,a0
1c008ca4:	02a7ed63          	bltu	a5,a0,1c008cde <rt_alloc+0x4c>
1c008ca8:	1c001937          	lui	s2,0x1c001
1c008cac:	89ae                	mv	s3,a1
1c008cae:	448d                	li	s1,3
1c008cb0:	1a890913          	addi	s2,s2,424 # 1c0011a8 <__rt_alloc_l2>
1c008cb4:	4a0d                	li	s4,3
1c008cb6:	00241513          	slli	a0,s0,0x2
1c008cba:	85ce                	mv	a1,s3
1c008cbc:	954a                	add	a0,a0,s2
1c008cbe:	3fa9                	jal	1c008c18 <rt_user_alloc>
1c008cc0:	e519                	bnez	a0,1c008cce <rt_alloc+0x3c>
1c008cc2:	0405                	addi	s0,s0,1
1c008cc4:	01441363          	bne	s0,s4,1c008cca <rt_alloc+0x38>
1c008cc8:	4401                	li	s0,0
1c008cca:	14fd                	addi	s1,s1,-1
1c008ccc:	f4ed                	bnez	s1,1c008cb6 <rt_alloc+0x24>
1c008cce:	40f2                	lw	ra,28(sp)
1c008cd0:	4462                	lw	s0,24(sp)
1c008cd2:	44d2                	lw	s1,20(sp)
1c008cd4:	4942                	lw	s2,16(sp)
1c008cd6:	49b2                	lw	s3,12(sp)
1c008cd8:	4a22                	lw	s4,8(sp)
1c008cda:	6105                	addi	sp,sp,32
1c008cdc:	8082                	ret
1c008cde:	1c0017b7          	lui	a5,0x1c001
1c008ce2:	ffd50413          	addi	s0,a0,-3
1c008ce6:	1a47a503          	lw	a0,420(a5) # 1c0011a4 <__rt_alloc_l1>
1c008cea:	040a                	slli	s0,s0,0x2
1c008cec:	40f2                	lw	ra,28(sp)
1c008cee:	9522                	add	a0,a0,s0
1c008cf0:	4462                	lw	s0,24(sp)
1c008cf2:	44d2                	lw	s1,20(sp)
1c008cf4:	4942                	lw	s2,16(sp)
1c008cf6:	49b2                	lw	s3,12(sp)
1c008cf8:	4a22                	lw	s4,8(sp)
1c008cfa:	6105                	addi	sp,sp,32
1c008cfc:	bf31                	j	1c008c18 <rt_user_alloc>

1c008cfe <__rt_alloc_init_l1>:
1c008cfe:	1c0017b7          	lui	a5,0x1c001
1c008d02:	1a47a703          	lw	a4,420(a5) # 1c0011a4 <__rt_alloc_l1>
1c008d06:	100027b7          	lui	a5,0x10002
1c008d0a:	01651593          	slli	a1,a0,0x16
1c008d0e:	6639                	lui	a2,0xe
1c008d10:	050a                	slli	a0,a0,0x2
1c008d12:	01478793          	addi	a5,a5,20 # 10002014 <__l1_end>
1c008d16:	fec60613          	addi	a2,a2,-20 # dfec <__l1_heap_size>
1c008d1a:	95be                	add	a1,a1,a5
1c008d1c:	953a                	add	a0,a0,a4
1c008d1e:	bdf9                	j	1c008bfc <rt_user_alloc_init>

1c008d20 <__rt_alloc_init_l1_for_fc>:
1c008d20:	100025b7          	lui	a1,0x10002
1c008d24:	01651793          	slli	a5,a0,0x16
1c008d28:	01458593          	addi	a1,a1,20 # 10002014 <__l1_end>
1c008d2c:	00b78733          	add	a4,a5,a1
1c008d30:	050a                	slli	a0,a0,0x2
1c008d32:	0791                	addi	a5,a5,4
1c008d34:	6639                	lui	a2,0xe
1c008d36:	1c0016b7          	lui	a3,0x1c001
1c008d3a:	fe860613          	addi	a2,a2,-24 # dfe8 <_l1_preload_size+0xbfd8>
1c008d3e:	95be                	add	a1,a1,a5
1c008d40:	953a                	add	a0,a0,a4
1c008d42:	1ae6a223          	sw	a4,420(a3) # 1c0011a4 <__rt_alloc_l1>
1c008d46:	bd5d                	j	1c008bfc <rt_user_alloc_init>

1c008d48 <__rt_allocs_init>:
1c008d48:	1141                	addi	sp,sp,-16
1c008d4a:	1c0015b7          	lui	a1,0x1c001
1c008d4e:	c606                	sw	ra,12(sp)
1c008d50:	1f458793          	addi	a5,a1,500 # 1c0011f4 <__l2_priv0_end>
1c008d54:	1c008637          	lui	a2,0x1c008
1c008d58:	06c7ca63          	blt	a5,a2,1c008dcc <__rt_allocs_init+0x84>
1c008d5c:	4581                	li	a1,0
1c008d5e:	4601                	li	a2,0
1c008d60:	1c001537          	lui	a0,0x1c001
1c008d64:	1a850513          	addi	a0,a0,424 # 1c0011a8 <__rt_alloc_l2>
1c008d68:	3d51                	jal	1c008bfc <rt_user_alloc_init>
1c008d6a:	1c00b5b7          	lui	a1,0x1c00b
1c008d6e:	6a058793          	addi	a5,a1,1696 # 1c00b6a0 <__l2_priv1_end>
1c008d72:	1c010637          	lui	a2,0x1c010
1c008d76:	04c7cf63          	blt	a5,a2,1c008dd4 <__rt_allocs_init+0x8c>
1c008d7a:	4581                	li	a1,0
1c008d7c:	4601                	li	a2,0
1c008d7e:	1c001537          	lui	a0,0x1c001
1c008d82:	1ac50513          	addi	a0,a0,428 # 1c0011ac <__rt_alloc_l2+0x4>
1c008d86:	3d9d                	jal	1c008bfc <rt_user_alloc_init>
1c008d88:	1c0125b7          	lui	a1,0x1c012
1c008d8c:	19858793          	addi	a5,a1,408 # 1c012198 <__l2_shared_end>
1c008d90:	1c080637          	lui	a2,0x1c080
1c008d94:	1c001537          	lui	a0,0x1c001
1c008d98:	8e1d                	sub	a2,a2,a5
1c008d9a:	19858593          	addi	a1,a1,408
1c008d9e:	1b050513          	addi	a0,a0,432 # 1c0011b0 <__rt_alloc_l2+0x8>
1c008da2:	3da9                	jal	1c008bfc <rt_user_alloc_init>
1c008da4:	f14027f3          	csrr	a5,mhartid
1c008da8:	8795                	srai	a5,a5,0x5
1c008daa:	03f7f793          	andi	a5,a5,63
1c008dae:	e789                	bnez	a5,1c008db8 <__rt_allocs_init+0x70>
1c008db0:	40b2                	lw	ra,12(sp)
1c008db2:	4501                	li	a0,0
1c008db4:	0141                	addi	sp,sp,16
1c008db6:	b7ad                	j	1c008d20 <__rt_alloc_init_l1_for_fc>
1c008db8:	4591                	li	a1,4
1c008dba:	4501                	li	a0,0
1c008dbc:	3dd9                	jal	1c008c92 <rt_alloc>
1c008dbe:	40b2                	lw	ra,12(sp)
1c008dc0:	1c0017b7          	lui	a5,0x1c001
1c008dc4:	1aa7a223          	sw	a0,420(a5) # 1c0011a4 <__rt_alloc_l1>
1c008dc8:	0141                	addi	sp,sp,16
1c008dca:	8082                	ret
1c008dcc:	8e1d                	sub	a2,a2,a5
1c008dce:	1f458593          	addi	a1,a1,500
1c008dd2:	b779                	j	1c008d60 <__rt_allocs_init+0x18>
1c008dd4:	8e1d                	sub	a2,a2,a5
1c008dd6:	6a058593          	addi	a1,a1,1696
1c008dda:	b755                	j	1c008d7e <__rt_allocs_init+0x36>

1c008ddc <__rt_init_cluster_data>:
1c008ddc:	04050793          	addi	a5,a0,64
1c008de0:	01679693          	slli	a3,a5,0x16
1c008de4:	6705                	lui	a4,0x1
1c008de6:	177d                	addi	a4,a4,-1
1c008de8:	00400793          	li	a5,4
1c008dec:	8ff9                	and	a5,a5,a4
1c008dee:	1c010737          	lui	a4,0x1c010
1c008df2:	97b6                	add	a5,a5,a3
1c008df4:	6609                	lui	a2,0x2
1c008df6:	18870713          	addi	a4,a4,392 # 1c010188 <_l1_preload_start_inL2>
1c008dfa:	01060613          	addi	a2,a2,16 # 2010 <_l1_preload_size>
1c008dfe:	8f99                	sub	a5,a5,a4
1c008e00:	00f705b3          	add	a1,a4,a5
1c008e04:	02c04b63          	bgtz	a2,1c008e3a <__rt_init_cluster_data+0x5e>
1c008e08:	02800713          	li	a4,40
1c008e0c:	02e50733          	mul	a4,a0,a4
1c008e10:	1c0017b7          	lui	a5,0x1c001
1c008e14:	1b878513          	addi	a0,a5,440 # 1c0011b8 <__rt_fc_cluster_data>
1c008e18:	002017b7          	lui	a5,0x201
1c008e1c:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c008e20:	97b6                	add	a5,a5,a3
1c008e22:	953a                	add	a0,a0,a4
1c008e24:	c91c                	sw	a5,16(a0)
1c008e26:	6705                	lui	a4,0x1
1c008e28:	00400793          	li	a5,4
1c008e2c:	177d                	addi	a4,a4,-1
1c008e2e:	8ff9                	and	a5,a5,a4
1c008e30:	97b6                	add	a5,a5,a3
1c008e32:	00052423          	sw	zero,8(a0)
1c008e36:	c95c                	sw	a5,20(a0)
1c008e38:	8082                	ret
1c008e3a:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008e3e:	1671                	addi	a2,a2,-4
1c008e40:	0711                	addi	a4,a4,4
1c008e42:	0105a023          	sw	a6,0(a1)
1c008e46:	bf6d                	j	1c008e00 <__rt_init_cluster_data+0x24>

1c008e48 <__rt_cluster_mount_step>:
1c008e48:	7179                	addi	sp,sp,-48
1c008e4a:	d04a                	sw	s2,32(sp)
1c008e4c:	ce4e                	sw	s3,28(sp)
1c008e4e:	6785                	lui	a5,0x1
1c008e50:	1c0089b7          	lui	s3,0x1c008
1c008e54:	00400913          	li	s2,4
1c008e58:	17fd                	addi	a5,a5,-1
1c008e5a:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008e5e:	d422                	sw	s0,40(sp)
1c008e60:	d606                	sw	ra,44(sp)
1c008e62:	d226                	sw	s1,36(sp)
1c008e64:	cc52                	sw	s4,24(sp)
1c008e66:	842a                	mv	s0,a0
1c008e68:	00f97933          	and	s2,s2,a5
1c008e6c:	f009f993          	andi	s3,s3,-256
1c008e70:	4c5c                	lw	a5,28(s0)
1c008e72:	4705                	li	a4,1
1c008e74:	02e78d63          	beq	a5,a4,1c008eae <__rt_cluster_mount_step+0x66>
1c008e78:	4709                	li	a4,2
1c008e7a:	0ae78d63          	beq	a5,a4,1c008f34 <__rt_cluster_mount_step+0xec>
1c008e7e:	e7dd                	bnez	a5,1c008f2c <__rt_cluster_mount_step+0xe4>
1c008e80:	5018                	lw	a4,32(s0)
1c008e82:	00042c23          	sw	zero,24(s0)
1c008e86:	eb01                	bnez	a4,1c008e96 <__rt_cluster_mount_step+0x4e>
1c008e88:	5048                	lw	a0,36(s0)
1c008e8a:	006c                	addi	a1,sp,12
1c008e8c:	c602                	sw	zero,12(sp)
1c008e8e:	1e8010ef          	jal	ra,1c00a076 <__rt_pmu_cluster_power_up>
1c008e92:	47b2                	lw	a5,12(sp)
1c008e94:	cc08                	sw	a0,24(s0)
1c008e96:	4c58                	lw	a4,28(s0)
1c008e98:	0705                	addi	a4,a4,1
1c008e9a:	cc58                	sw	a4,28(s0)
1c008e9c:	dbf1                	beqz	a5,1c008e70 <__rt_cluster_mount_step+0x28>
1c008e9e:	50b2                	lw	ra,44(sp)
1c008ea0:	5422                	lw	s0,40(sp)
1c008ea2:	5492                	lw	s1,36(sp)
1c008ea4:	5902                	lw	s2,32(sp)
1c008ea6:	49f2                	lw	s3,28(sp)
1c008ea8:	4a62                	lw	s4,24(sp)
1c008eaa:	6145                	addi	sp,sp,48
1c008eac:	8082                	ret
1c008eae:	02042a03          	lw	s4,32(s0)
1c008eb2:	040a0493          	addi	s1,s4,64
1c008eb6:	04da                	slli	s1,s1,0x16
1c008eb8:	00990733          	add	a4,s2,s1
1c008ebc:	00072223          	sw	zero,4(a4)
1c008ec0:	00072423          	sw	zero,8(a4)
1c008ec4:	00072023          	sw	zero,0(a4)
1c008ec8:	1c001737          	lui	a4,0x1c001
1c008ecc:	08c72703          	lw	a4,140(a4) # 1c00108c <__rt_platform>
1c008ed0:	00f70f63          	beq	a4,a5,1c008eee <__rt_cluster_mount_step+0xa6>
1c008ed4:	4505                	li	a0,1
1c008ed6:	727000ef          	jal	ra,1c009dfc <__rt_fll_init>
1c008eda:	1c0017b7          	lui	a5,0x1c001
1c008ede:	1e878793          	addi	a5,a5,488 # 1c0011e8 <__rt_freq_domains>
1c008ee2:	43cc                	lw	a1,4(a5)
1c008ee4:	c5b1                	beqz	a1,1c008f30 <__rt_cluster_mount_step+0xe8>
1c008ee6:	4601                	li	a2,0
1c008ee8:	4505                	li	a0,1
1c008eea:	0a8010ef          	jal	ra,1c009f92 <rt_freq_set_and_get>
1c008eee:	8552                	mv	a0,s4
1c008ef0:	35f5                	jal	1c008ddc <__rt_init_cluster_data>
1c008ef2:	8552                	mv	a0,s4
1c008ef4:	3529                	jal	1c008cfe <__rt_alloc_init_l1>
1c008ef6:	002017b7          	lui	a5,0x201
1c008efa:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f3414>
1c008efe:	97a6                	add	a5,a5,s1
1c008f00:	577d                	li	a4,-1
1c008f02:	c398                	sw	a4,0(a5)
1c008f04:	002007b7          	lui	a5,0x200
1c008f08:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f2054>
1c008f0c:	06078793          	addi	a5,a5,96
1c008f10:	9726                	add	a4,a4,s1
1c008f12:	97a6                	add	a5,a5,s1
1c008f14:	01372023          	sw	s3,0(a4)
1c008f18:	0711                	addi	a4,a4,4
1c008f1a:	fef71de3          	bne	a4,a5,1c008f14 <__rt_cluster_mount_step+0xcc>
1c008f1e:	002007b7          	lui	a5,0x200
1c008f22:	07a1                	addi	a5,a5,8
1c008f24:	94be                	add	s1,s1,a5
1c008f26:	0ff00793          	li	a5,255
1c008f2a:	c09c                	sw	a5,0(s1)
1c008f2c:	4781                	li	a5,0
1c008f2e:	b7a5                	j	1c008e96 <__rt_cluster_mount_step+0x4e>
1c008f30:	c3c8                	sw	a0,4(a5)
1c008f32:	bf75                	j	1c008eee <__rt_cluster_mount_step+0xa6>
1c008f34:	505c                	lw	a5,36(s0)
1c008f36:	5b98                	lw	a4,48(a5)
1c008f38:	d398                	sw	a4,32(a5)
1c008f3a:	5798                	lw	a4,40(a5)
1c008f3c:	c398                	sw	a4,0(a5)
1c008f3e:	57d8                	lw	a4,44(a5)
1c008f40:	c3d8                	sw	a4,4(a5)
1c008f42:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f2044>
1c008f46:	505c                	lw	a5,36(s0)
1c008f48:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008f4c:	0007ac23          	sw	zero,24(a5)
1c008f50:	cb01                	beqz	a4,1c008f60 <__rt_cluster_mount_step+0x118>
1c008f52:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008f56:	cf1c                	sw	a5,24(a4)
1c008f58:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008f5c:	4785                	li	a5,1
1c008f5e:	bf25                	j	1c008e96 <__rt_cluster_mount_step+0x4e>
1c008f60:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008f64:	bfd5                	j	1c008f58 <__rt_cluster_mount_step+0x110>

1c008f66 <__rt_cluster_init>:
1c008f66:	1c001537          	lui	a0,0x1c001
1c008f6a:	1141                	addi	sp,sp,-16
1c008f6c:	02800613          	li	a2,40
1c008f70:	4581                	li	a1,0
1c008f72:	1b850513          	addi	a0,a0,440 # 1c0011b8 <__rt_fc_cluster_data>
1c008f76:	c606                	sw	ra,12(sp)
1c008f78:	073010ef          	jal	ra,1c00a7ea <memset>
1c008f7c:	1c0085b7          	lui	a1,0x1c008
1c008f80:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008f84:	4505                	li	a0,1
1c008f86:	2bfd                	jal	1c009584 <rt_irq_set_handler>
1c008f88:	f14027f3          	csrr	a5,mhartid
1c008f8c:	8795                	srai	a5,a5,0x5
1c008f8e:	03f7f793          	andi	a5,a5,63
1c008f92:	477d                	li	a4,31
1c008f94:	02e79e63          	bne	a5,a4,1c008fd0 <__rt_cluster_init+0x6a>
1c008f98:	1a10a7b7          	lui	a5,0x1a10a
1c008f9c:	4709                	li	a4,2
1c008f9e:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c008fa2:	1c0085b7          	lui	a1,0x1c008
1c008fa6:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008faa:	4511                	li	a0,4
1c008fac:	2be1                	jal	1c009584 <rt_irq_set_handler>
1c008fae:	f14027f3          	csrr	a5,mhartid
1c008fb2:	8795                	srai	a5,a5,0x5
1c008fb4:	03f7f793          	andi	a5,a5,63
1c008fb8:	477d                	li	a4,31
1c008fba:	02e79063          	bne	a5,a4,1c008fda <__rt_cluster_init+0x74>
1c008fbe:	1a10a7b7          	lui	a5,0x1a10a
1c008fc2:	4741                	li	a4,16
1c008fc4:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c008fc8:	40b2                	lw	ra,12(sp)
1c008fca:	4501                	li	a0,0
1c008fcc:	0141                	addi	sp,sp,16
1c008fce:	8082                	ret
1c008fd0:	002047b7          	lui	a5,0x204
1c008fd4:	4709                	li	a4,2
1c008fd6:	cbd8                	sw	a4,20(a5)
1c008fd8:	b7e9                	j	1c008fa2 <__rt_cluster_init+0x3c>
1c008fda:	002047b7          	lui	a5,0x204
1c008fde:	4741                	li	a4,16
1c008fe0:	cbd8                	sw	a4,20(a5)
1c008fe2:	b7dd                	j	1c008fc8 <__rt_cluster_init+0x62>

1c008fe4 <pi_cluster_conf_init>:
1c008fe4:	00052223          	sw	zero,4(a0)
1c008fe8:	8082                	ret

1c008fea <pi_cluster_open>:
1c008fea:	1101                	addi	sp,sp,-32
1c008fec:	ce06                	sw	ra,28(sp)
1c008fee:	cc22                	sw	s0,24(sp)
1c008ff0:	ca26                	sw	s1,20(sp)
1c008ff2:	c84a                	sw	s2,16(sp)
1c008ff4:	c64e                	sw	s3,12(sp)
1c008ff6:	30047973          	csrrci	s2,mstatus,8
1c008ffa:	00452983          	lw	s3,4(a0)
1c008ffe:	02800793          	li	a5,40
1c009002:	0049a483          	lw	s1,4(s3)
1c009006:	02f484b3          	mul	s1,s1,a5
1c00900a:	1c0017b7          	lui	a5,0x1c001
1c00900e:	1b878793          	addi	a5,a5,440 # 1c0011b8 <__rt_fc_cluster_data>
1c009012:	94be                	add	s1,s1,a5
1c009014:	c504                	sw	s1,8(a0)
1c009016:	3b7000ef          	jal	ra,1c009bcc <__rt_wait_event_prepare_blocking>
1c00901a:	f14027f3          	csrr	a5,mhartid
1c00901e:	8795                	srai	a5,a5,0x5
1c009020:	03f7f793          	andi	a5,a5,63
1c009024:	477d                	li	a4,31
1c009026:	842a                	mv	s0,a0
1c009028:	04e79463          	bne	a5,a4,1c009070 <pi_cluster_open+0x86>
1c00902c:	511c                	lw	a5,32(a0)
1c00902e:	0004ae23          	sw	zero,28(s1)
1c009032:	d0c8                	sw	a0,36(s1)
1c009034:	d91c                	sw	a5,48(a0)
1c009036:	411c                	lw	a5,0(a0)
1c009038:	02052223          	sw	zero,36(a0)
1c00903c:	d51c                	sw	a5,40(a0)
1c00903e:	415c                	lw	a5,4(a0)
1c009040:	c144                	sw	s1,4(a0)
1c009042:	d55c                	sw	a5,44(a0)
1c009044:	1c0097b7          	lui	a5,0x1c009
1c009048:	e4878793          	addi	a5,a5,-440 # 1c008e48 <__rt_cluster_mount_step>
1c00904c:	c11c                	sw	a5,0(a0)
1c00904e:	4785                	li	a5,1
1c009050:	d11c                	sw	a5,32(a0)
1c009052:	8526                	mv	a0,s1
1c009054:	3bd5                	jal	1c008e48 <__rt_cluster_mount_step>
1c009056:	8522                	mv	a0,s0
1c009058:	4c5000ef          	jal	ra,1c009d1c <__rt_wait_event>
1c00905c:	30091073          	csrw	mstatus,s2
1c009060:	40f2                	lw	ra,28(sp)
1c009062:	4462                	lw	s0,24(sp)
1c009064:	44d2                	lw	s1,20(sp)
1c009066:	4942                	lw	s2,16(sp)
1c009068:	49b2                	lw	s3,12(sp)
1c00906a:	4501                	li	a0,0
1c00906c:	6105                	addi	sp,sp,32
1c00906e:	8082                	ret
1c009070:	0049a483          	lw	s1,4(s3)
1c009074:	8526                	mv	a0,s1
1c009076:	339d                	jal	1c008ddc <__rt_init_cluster_data>
1c009078:	04048513          	addi	a0,s1,64
1c00907c:	002017b7          	lui	a5,0x201
1c009080:	055a                	slli	a0,a0,0x16
1c009082:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f3414>
1c009086:	97aa                	add	a5,a5,a0
1c009088:	577d                	li	a4,-1
1c00908a:	c398                	sw	a4,0(a5)
1c00908c:	1c0086b7          	lui	a3,0x1c008
1c009090:	002007b7          	lui	a5,0x200
1c009094:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f2058>
1c009098:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c00909c:	06078793          	addi	a5,a5,96
1c0090a0:	972a                	add	a4,a4,a0
1c0090a2:	97aa                	add	a5,a5,a0
1c0090a4:	f006f693          	andi	a3,a3,-256
1c0090a8:	c314                	sw	a3,0(a4)
1c0090aa:	0711                	addi	a4,a4,4
1c0090ac:	fef71ee3          	bne	a4,a5,1c0090a8 <pi_cluster_open+0xbe>
1c0090b0:	002007b7          	lui	a5,0x200
1c0090b4:	07a1                	addi	a5,a5,8
1c0090b6:	953e                	add	a0,a0,a5
1c0090b8:	57fd                	li	a5,-1
1c0090ba:	c11c                	sw	a5,0(a0)
1c0090bc:	8522                	mv	a0,s0
1c0090be:	3db000ef          	jal	ra,1c009c98 <rt_event_push>
1c0090c2:	bf51                	j	1c009056 <pi_cluster_open+0x6c>

1c0090c4 <pi_cluster_close>:
1c0090c4:	451c                	lw	a5,8(a0)
1c0090c6:	1101                	addi	sp,sp,-32
1c0090c8:	cc22                	sw	s0,24(sp)
1c0090ca:	5380                	lw	s0,32(a5)
1c0090cc:	1c0017b7          	lui	a5,0x1c001
1c0090d0:	08c7a703          	lw	a4,140(a5) # 1c00108c <__rt_platform>
1c0090d4:	ce06                	sw	ra,28(sp)
1c0090d6:	4785                	li	a5,1
1c0090d8:	00f70563          	beq	a4,a5,1c0090e2 <pi_cluster_close+0x1e>
1c0090dc:	4505                	li	a0,1
1c0090de:	5d5000ef          	jal	ra,1c009eb2 <__rt_fll_deinit>
1c0090e2:	c602                	sw	zero,12(sp)
1c0090e4:	e409                	bnez	s0,1c0090ee <pi_cluster_close+0x2a>
1c0090e6:	006c                	addi	a1,sp,12
1c0090e8:	4501                	li	a0,0
1c0090ea:	749000ef          	jal	ra,1c00a032 <__rt_pmu_cluster_power_down>
1c0090ee:	40f2                	lw	ra,28(sp)
1c0090f0:	4462                	lw	s0,24(sp)
1c0090f2:	4501                	li	a0,0
1c0090f4:	6105                	addi	sp,sp,32
1c0090f6:	8082                	ret

1c0090f8 <__rt_cluster_push_fc_event>:
1c0090f8:	002047b7          	lui	a5,0x204
1c0090fc:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f60d4>
1c009100:	0007e703          	p.elw	a4,0(a5)
1c009104:	f14027f3          	csrr	a5,mhartid
1c009108:	8795                	srai	a5,a5,0x5
1c00910a:	02800693          	li	a3,40
1c00910e:	03f7f793          	andi	a5,a5,63
1c009112:	02d787b3          	mul	a5,a5,a3
1c009116:	1c001737          	lui	a4,0x1c001
1c00911a:	1b870713          	addi	a4,a4,440 # 1c0011b8 <__rt_fc_cluster_data>
1c00911e:	4689                	li	a3,2
1c009120:	97ba                	add	a5,a5,a4
1c009122:	00204737          	lui	a4,0x204
1c009126:	43d0                	lw	a2,4(a5)
1c009128:	ee01                	bnez	a2,1c009140 <__rt_cluster_push_fc_event+0x48>
1c00912a:	c3c8                	sw	a0,4(a5)
1c00912c:	4709                	li	a4,2
1c00912e:	1a10a7b7          	lui	a5,0x1a10a
1c009132:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1077fc>
1c009136:	002047b7          	lui	a5,0x204
1c00913a:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f60d4>
1c00913e:	8082                	ret
1c009140:	c714                	sw	a3,8(a4)
1c009142:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c009146:	c354                	sw	a3,4(a4)
1c009148:	bff9                	j	1c009126 <__rt_cluster_push_fc_event+0x2e>

1c00914a <__rt_cluster_new>:
1c00914a:	1c0095b7          	lui	a1,0x1c009
1c00914e:	1141                	addi	sp,sp,-16
1c009150:	4601                	li	a2,0
1c009152:	f6658593          	addi	a1,a1,-154 # 1c008f66 <__rt_cluster_init>
1c009156:	4501                	li	a0,0
1c009158:	c606                	sw	ra,12(sp)
1c00915a:	2b6d                	jal	1c009714 <__rt_cbsys_add>
1c00915c:	c105                	beqz	a0,1c00917c <__rt_cluster_new+0x32>
1c00915e:	f1402673          	csrr	a2,mhartid
1c009162:	1c000537          	lui	a0,0x1c000
1c009166:	40565593          	srai	a1,a2,0x5
1c00916a:	03f5f593          	andi	a1,a1,63
1c00916e:	8a7d                	andi	a2,a2,31
1c009170:	50850513          	addi	a0,a0,1288 # 1c000508 <__DTOR_END__+0x21c>
1c009174:	0c3010ef          	jal	ra,1c00aa36 <printf>
1c009178:	04b010ef          	jal	ra,1c00a9c2 <abort>
1c00917c:	40b2                	lw	ra,12(sp)
1c00917e:	0141                	addi	sp,sp,16
1c009180:	8082                	ret

1c009182 <__rt_cluster_pulpos_emu_init>:
1c009182:	1141                	addi	sp,sp,-16
1c009184:	45b1                	li	a1,12
1c009186:	4501                	li	a0,0
1c009188:	c606                	sw	ra,12(sp)
1c00918a:	3621                	jal	1c008c92 <rt_alloc>
1c00918c:	1c0017b7          	lui	a5,0x1c001
1c009190:	16a7ac23          	sw	a0,376(a5) # 1c001178 <__rt_fc_cluster_device>
1c009194:	e105                	bnez	a0,1c0091b4 <__rt_cluster_pulpos_emu_init+0x32>
1c009196:	f1402673          	csrr	a2,mhartid
1c00919a:	1c000537          	lui	a0,0x1c000
1c00919e:	40565593          	srai	a1,a2,0x5
1c0091a2:	03f5f593          	andi	a1,a1,63
1c0091a6:	8a7d                	andi	a2,a2,31
1c0091a8:	55050513          	addi	a0,a0,1360 # 1c000550 <__DTOR_END__+0x264>
1c0091ac:	08b010ef          	jal	ra,1c00aa36 <printf>
1c0091b0:	013010ef          	jal	ra,1c00a9c2 <abort>
1c0091b4:	40b2                	lw	ra,12(sp)
1c0091b6:	0141                	addi	sp,sp,16
1c0091b8:	8082                	ret

1c0091ba <rt_cluster_call>:
1c0091ba:	7139                	addi	sp,sp,-64
1c0091bc:	d84a                	sw	s2,48(sp)
1c0091be:	4906                	lw	s2,64(sp)
1c0091c0:	dc22                	sw	s0,56(sp)
1c0091c2:	842e                	mv	s0,a1
1c0091c4:	de06                	sw	ra,60(sp)
1c0091c6:	da26                	sw	s1,52(sp)
1c0091c8:	d64e                	sw	s3,44(sp)
1c0091ca:	300479f3          	csrrci	s3,mstatus,8
1c0091ce:	84ca                	mv	s1,s2
1c0091d0:	02091163          	bnez	s2,1c0091f2 <rt_cluster_call+0x38>
1c0091d4:	ce32                	sw	a2,28(sp)
1c0091d6:	cc36                	sw	a3,24(sp)
1c0091d8:	ca3a                	sw	a4,20(sp)
1c0091da:	c83e                	sw	a5,16(sp)
1c0091dc:	c642                	sw	a6,12(sp)
1c0091de:	c446                	sw	a7,8(sp)
1c0091e0:	1ed000ef          	jal	ra,1c009bcc <__rt_wait_event_prepare_blocking>
1c0091e4:	48a2                	lw	a7,8(sp)
1c0091e6:	4832                	lw	a6,12(sp)
1c0091e8:	47c2                	lw	a5,16(sp)
1c0091ea:	4752                	lw	a4,20(sp)
1c0091ec:	46e2                	lw	a3,24(sp)
1c0091ee:	4672                	lw	a2,28(sp)
1c0091f0:	84aa                	mv	s1,a0
1c0091f2:	4531                	li	a0,12
1c0091f4:	02a40433          	mul	s0,s0,a0
1c0091f8:	1c0015b7          	lui	a1,0x1c001
1c0091fc:	0b058313          	addi	t1,a1,176 # 1c0010b0 <__rt_pulpos_emu_global_cluster_task>
1c009200:	00f32623          	sw	a5,12(t1)
1c009204:	1c0017b7          	lui	a5,0x1c001
1c009208:	1787a503          	lw	a0,376(a5) # 1c001178 <__rt_fc_cluster_device>
1c00920c:	00c32023          	sw	a2,0(t1)
1c009210:	0b058593          	addi	a1,a1,176
1c009214:	8626                	mv	a2,s1
1c009216:	00d32223          	sw	a3,4(t1)
1c00921a:	9522                	add	a0,a0,s0
1c00921c:	00e32423          	sw	a4,8(t1)
1c009220:	01032823          	sw	a6,16(t1)
1c009224:	01132a23          	sw	a7,20(t1)
1c009228:	2041                	jal	1c0092a8 <pi_cluster_send_task_to_cl_async>
1c00922a:	842a                	mv	s0,a0
1c00922c:	cd01                	beqz	a0,1c009244 <rt_cluster_call+0x8a>
1c00922e:	30099073          	csrw	mstatus,s3
1c009232:	547d                	li	s0,-1
1c009234:	8522                	mv	a0,s0
1c009236:	50f2                	lw	ra,60(sp)
1c009238:	5462                	lw	s0,56(sp)
1c00923a:	54d2                	lw	s1,52(sp)
1c00923c:	5942                	lw	s2,48(sp)
1c00923e:	59b2                	lw	s3,44(sp)
1c009240:	6121                	addi	sp,sp,64
1c009242:	8082                	ret
1c009244:	00091563          	bnez	s2,1c00924e <rt_cluster_call+0x94>
1c009248:	8526                	mv	a0,s1
1c00924a:	2d3000ef          	jal	ra,1c009d1c <__rt_wait_event>
1c00924e:	30099073          	csrw	mstatus,s3
1c009252:	b7cd                	j	1c009234 <rt_cluster_call+0x7a>

1c009254 <rt_cluster_mount>:
1c009254:	7139                	addi	sp,sp,-64
1c009256:	dc22                	sw	s0,56(sp)
1c009258:	da26                	sw	s1,52(sp)
1c00925a:	d84a                	sw	s2,48(sp)
1c00925c:	4431                	li	s0,12
1c00925e:	1c0014b7          	lui	s1,0x1c001
1c009262:	de06                	sw	ra,60(sp)
1c009264:	d64e                	sw	s3,44(sp)
1c009266:	8936                	mv	s2,a3
1c009268:	02858433          	mul	s0,a1,s0
1c00926c:	17848493          	addi	s1,s1,376 # 1c001178 <__rt_fc_cluster_device>
1c009270:	c905                	beqz	a0,1c0092a0 <rt_cluster_mount+0x4c>
1c009272:	0068                	addi	a0,sp,12
1c009274:	89ae                	mv	s3,a1
1c009276:	33bd                	jal	1c008fe4 <pi_cluster_conf_init>
1c009278:	4088                	lw	a0,0(s1)
1c00927a:	006c                	addi	a1,sp,12
1c00927c:	9522                	add	a0,a0,s0
1c00927e:	2609                	jal	1c009580 <pi_open_from_conf>
1c009280:	4088                	lw	a0,0(s1)
1c009282:	c84e                	sw	s3,16(sp)
1c009284:	9522                	add	a0,a0,s0
1c009286:	3395                	jal	1c008fea <pi_cluster_open>
1c009288:	00090563          	beqz	s2,1c009292 <rt_cluster_mount+0x3e>
1c00928c:	854a                	mv	a0,s2
1c00928e:	20b000ef          	jal	ra,1c009c98 <rt_event_push>
1c009292:	50f2                	lw	ra,60(sp)
1c009294:	5462                	lw	s0,56(sp)
1c009296:	54d2                	lw	s1,52(sp)
1c009298:	5942                	lw	s2,48(sp)
1c00929a:	59b2                	lw	s3,44(sp)
1c00929c:	6121                	addi	sp,sp,64
1c00929e:	8082                	ret
1c0092a0:	4088                	lw	a0,0(s1)
1c0092a2:	9522                	add	a0,a0,s0
1c0092a4:	3505                	jal	1c0090c4 <pi_cluster_close>
1c0092a6:	b7cd                	j	1c009288 <rt_cluster_mount+0x34>

1c0092a8 <pi_cluster_send_task_to_cl_async>:
1c0092a8:	1101                	addi	sp,sp,-32
1c0092aa:	ca26                	sw	s1,20(sp)
1c0092ac:	4504                	lw	s1,8(a0)
1c0092ae:	cc22                	sw	s0,24(sp)
1c0092b0:	c256                	sw	s5,4(sp)
1c0092b2:	842e                	mv	s0,a1
1c0092b4:	8ab2                	mv	s5,a2
1c0092b6:	ce06                	sw	ra,28(sp)
1c0092b8:	c84a                	sw	s2,16(sp)
1c0092ba:	c64e                	sw	s3,12(sp)
1c0092bc:	c452                	sw	s4,8(sp)
1c0092be:	30047a73          	csrrci	s4,mstatus,8
1c0092c2:	00060823          	sb	zero,16(a2)
1c0092c6:	4785                	li	a5,1
1c0092c8:	d1dc                	sw	a5,36(a1)
1c0092ca:	49dc                	lw	a5,20(a1)
1c0092cc:	0144a983          	lw	s3,20(s1)
1c0092d0:	e399                	bnez	a5,1c0092d6 <pi_cluster_send_task_to_cl_async+0x2e>
1c0092d2:	47a1                	li	a5,8
1c0092d4:	c9dc                	sw	a5,20(a1)
1c0092d6:	441c                	lw	a5,8(s0)
1c0092d8:	eb8d                	bnez	a5,1c00930a <pi_cluster_send_task_to_cl_async+0x62>
1c0092da:	445c                	lw	a5,12(s0)
1c0092dc:	e789                	bnez	a5,1c0092e6 <pi_cluster_send_task_to_cl_async+0x3e>
1c0092de:	40000793          	li	a5,1024
1c0092e2:	c45c                	sw	a5,12(s0)
1c0092e4:	c81c                	sw	a5,16(s0)
1c0092e6:	4818                	lw	a4,16(s0)
1c0092e8:	445c                	lw	a5,12(s0)
1c0092ea:	e311                	bnez	a4,1c0092ee <pi_cluster_send_task_to_cl_async+0x46>
1c0092ec:	c81c                	sw	a5,16(s0)
1c0092ee:	01442903          	lw	s2,20(s0)
1c0092f2:	4818                	lw	a4,16(s0)
1c0092f4:	448c                	lw	a1,8(s1)
1c0092f6:	197d                	addi	s2,s2,-1
1c0092f8:	02e90933          	mul	s2,s2,a4
1c0092fc:	993e                	add	s2,s2,a5
1c0092fe:	c9bd                	beqz	a1,1c009374 <pi_cluster_send_task_to_cl_async+0xcc>
1c009300:	44d0                	lw	a2,12(s1)
1c009302:	07261063          	bne	a2,s2,1c009362 <pi_cluster_send_task_to_cl_async+0xba>
1c009306:	449c                	lw	a5,8(s1)
1c009308:	c41c                	sw	a5,8(s0)
1c00930a:	4858                	lw	a4,20(s0)
1c00930c:	4785                	li	a5,1
1c00930e:	01542c23          	sw	s5,24(s0)
1c009312:	00e797b3          	sll	a5,a5,a4
1c009316:	17fd                	addi	a5,a5,-1
1c009318:	d41c                	sw	a5,40(s0)
1c00931a:	02042023          	sw	zero,32(s0)
1c00931e:	0089a783          	lw	a5,8(s3)
1c009322:	cbbd                	beqz	a5,1c009398 <pi_cluster_send_task_to_cl_async+0xf0>
1c009324:	d380                	sw	s0,32(a5)
1c009326:	0089a423          	sw	s0,8(s3)
1c00932a:	0009a783          	lw	a5,0(s3)
1c00932e:	e399                	bnez	a5,1c009334 <pi_cluster_send_task_to_cl_async+0x8c>
1c009330:	0089a023          	sw	s0,0(s3)
1c009334:	509c                	lw	a5,32(s1)
1c009336:	00201737          	lui	a4,0x201
1c00933a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00933e:	04078793          	addi	a5,a5,64
1c009342:	07da                	slli	a5,a5,0x16
1c009344:	97ba                	add	a5,a5,a4
1c009346:	0007a023          	sw	zero,0(a5)
1c00934a:	300a1073          	csrw	mstatus,s4
1c00934e:	4501                	li	a0,0
1c009350:	40f2                	lw	ra,28(sp)
1c009352:	4462                	lw	s0,24(sp)
1c009354:	44d2                	lw	s1,20(sp)
1c009356:	4942                	lw	s2,16(sp)
1c009358:	49b2                	lw	s3,12(sp)
1c00935a:	4a22                	lw	s4,8(sp)
1c00935c:	4a92                	lw	s5,4(sp)
1c00935e:	6105                	addi	sp,sp,32
1c009360:	8082                	ret
1c009362:	509c                	lw	a5,32(s1)
1c009364:	1c001737          	lui	a4,0x1c001
1c009368:	1a472503          	lw	a0,420(a4) # 1c0011a4 <__rt_alloc_l1>
1c00936c:	078a                	slli	a5,a5,0x2
1c00936e:	953e                	add	a0,a0,a5
1c009370:	8d9ff0ef          	jal	ra,1c008c48 <rt_user_free>
1c009374:	509c                	lw	a5,32(s1)
1c009376:	1c001737          	lui	a4,0x1c001
1c00937a:	1a472503          	lw	a0,420(a4) # 1c0011a4 <__rt_alloc_l1>
1c00937e:	078a                	slli	a5,a5,0x2
1c009380:	0124a623          	sw	s2,12(s1)
1c009384:	85ca                	mv	a1,s2
1c009386:	953e                	add	a0,a0,a5
1c009388:	891ff0ef          	jal	ra,1c008c18 <rt_user_alloc>
1c00938c:	c488                	sw	a0,8(s1)
1c00938e:	fd25                	bnez	a0,1c009306 <pi_cluster_send_task_to_cl_async+0x5e>
1c009390:	300a1073          	csrw	mstatus,s4
1c009394:	557d                	li	a0,-1
1c009396:	bf6d                	j	1c009350 <pi_cluster_send_task_to_cl_async+0xa8>
1c009398:	0089a223          	sw	s0,4(s3)
1c00939c:	b769                	j	1c009326 <pi_cluster_send_task_to_cl_async+0x7e>

1c00939e <rt_perf_init>:
1c00939e:	00450793          	addi	a5,a0,4
1c0093a2:	04850513          	addi	a0,a0,72
1c0093a6:	0007a023          	sw	zero,0(a5)
1c0093aa:	0791                	addi	a5,a5,4
1c0093ac:	fea79de3          	bne	a5,a0,1c0093a6 <rt_perf_init+0x8>
1c0093b0:	8082                	ret

1c0093b2 <rt_perf_conf>:
1c0093b2:	c10c                	sw	a1,0(a0)
1c0093b4:	7a059073          	csrw	pcer,a1
1c0093b8:	8082                	ret

1c0093ba <cluster_start>:
1c0093ba:	002047b7          	lui	a5,0x204
1c0093be:	00070737          	lui	a4,0x70
1c0093c2:	c798                	sw	a4,8(a5)
1c0093c4:	0ff00713          	li	a4,255
1c0093c8:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f6098>
1c0093cc:	20e7a023          	sw	a4,512(a5)
1c0093d0:	20e7a623          	sw	a4,524(a5)
1c0093d4:	8082                	ret

1c0093d6 <__rt_init>:
1c0093d6:	1101                	addi	sp,sp,-32
1c0093d8:	ce06                	sw	ra,28(sp)
1c0093da:	cc22                	sw	s0,24(sp)
1c0093dc:	23d5                	jal	1c0099c0 <__rt_bridge_set_available>
1c0093de:	1c0017b7          	lui	a5,0x1c001
1c0093e2:	08c7a703          	lw	a4,140(a5) # 1c00108c <__rt_platform>
1c0093e6:	478d                	li	a5,3
1c0093e8:	02f71263          	bne	a4,a5,1c00940c <__rt_init+0x36>
1c0093ec:	7d005073          	csrwi	0x7d0,0
1c0093f0:	1c0007b7          	lui	a5,0x1c000
1c0093f4:	6b078793          	addi	a5,a5,1712 # 1c0006b0 <.got>
1c0093f8:	7d179073          	csrw	0x7d1,a5
1c0093fc:	1c0017b7          	lui	a5,0x1c001
1c009400:	eb078793          	addi	a5,a5,-336 # 1c000eb0 <stack>
1c009404:	7d279073          	csrw	0x7d2,a5
1c009408:	7d00d073          	csrwi	0x7d0,1
1c00940c:	2c29                	jal	1c009626 <__rt_irq_init>
1c00940e:	1a1067b7          	lui	a5,0x1a106
1c009412:	577d                	li	a4,-1
1c009414:	c3d8                	sw	a4,4(a5)
1c009416:	1c0085b7          	lui	a1,0x1c008
1c00941a:	c798                	sw	a4,8(a5)
1c00941c:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c009420:	4569                	li	a0,26
1c009422:	228d                	jal	1c009584 <rt_irq_set_handler>
1c009424:	f14027f3          	csrr	a5,mhartid
1c009428:	8795                	srai	a5,a5,0x5
1c00942a:	03f7f793          	andi	a5,a5,63
1c00942e:	477d                	li	a4,31
1c009430:	0ae79e63          	bne	a5,a4,1c0094ec <__rt_init+0x116>
1c009434:	1a10a7b7          	lui	a5,0x1a10a
1c009438:	04000737          	lui	a4,0x4000
1c00943c:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c009440:	46d000ef          	jal	ra,1c00a0ac <__rt_pmu_init>
1c009444:	373000ef          	jal	ra,1c009fb6 <__rt_freq_init>
1c009448:	f14027f3          	csrr	a5,mhartid
1c00944c:	8795                	srai	a5,a5,0x5
1c00944e:	03f7f793          	andi	a5,a5,63
1c009452:	477d                	li	a4,31
1c009454:	00e78763          	beq	a5,a4,1c009462 <__rt_init+0x8c>
1c009458:	002017b7          	lui	a5,0x201
1c00945c:	577d                	li	a4,-1
1c00945e:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f3414>
1c009462:	1c000437          	lui	s0,0x1c000
1c009466:	2605                	jal	1c009786 <__rt_utils_init>
1c009468:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c00946c:	8ddff0ef          	jal	ra,1c008d48 <__rt_allocs_init>
1c009470:	25cd                	jal	1c009b52 <__rt_thread_sched_init>
1c009472:	0ed000ef          	jal	ra,1c009d5e <__rt_event_sched_init>
1c009476:	473000ef          	jal	ra,1c00a0e8 <__rt_padframe_init>
1c00947a:	401c                	lw	a5,0(s0)
1c00947c:	efb5                	bnez	a5,1c0094f8 <__rt_init+0x122>
1c00947e:	30045073          	csrwi	mstatus,8
1c009482:	4501                	li	a0,0
1c009484:	2cc1                	jal	1c009754 <__rt_cbsys_exec>
1c009486:	e521                	bnez	a0,1c0094ce <__rt_init+0xf8>
1c009488:	f14027f3          	csrr	a5,mhartid
1c00948c:	8795                	srai	a5,a5,0x5
1c00948e:	03f7f793          	andi	a5,a5,63
1c009492:	477d                	li	a4,31
1c009494:	0ae78763          	beq	a5,a4,1c009542 <__rt_init+0x16c>
1c009498:	4681                	li	a3,0
1c00949a:	4601                	li	a2,0
1c00949c:	4581                	li	a1,0
1c00949e:	4505                	li	a0,1
1c0094a0:	cfb9                	beqz	a5,1c0094fe <__rt_init+0x128>
1c0094a2:	3b4d                	jal	1c009254 <rt_cluster_mount>
1c0094a4:	6591                	lui	a1,0x4
1c0094a6:	450d                	li	a0,3
1c0094a8:	feaff0ef          	jal	ra,1c008c92 <rt_alloc>
1c0094ac:	872a                	mv	a4,a0
1c0094ae:	c105                	beqz	a0,1c0094ce <__rt_init+0xf8>
1c0094b0:	6805                	lui	a6,0x1
1c0094b2:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0094b6:	1c009637          	lui	a2,0x1c009
1c0094ba:	c002                	sw	zero,0(sp)
1c0094bc:	48a1                	li	a7,8
1c0094be:	87c2                	mv	a5,a6
1c0094c0:	4681                	li	a3,0
1c0094c2:	3ba60613          	addi	a2,a2,954 # 1c0093ba <cluster_start>
1c0094c6:	4581                	li	a1,0
1c0094c8:	4501                	li	a0,0
1c0094ca:	39c5                	jal	1c0091ba <rt_cluster_call>
1c0094cc:	c93d                	beqz	a0,1c009542 <__rt_init+0x16c>
1c0094ce:	f1402673          	csrr	a2,mhartid
1c0094d2:	1c000537          	lui	a0,0x1c000
1c0094d6:	40565593          	srai	a1,a2,0x5
1c0094da:	03f5f593          	andi	a1,a1,63
1c0094de:	8a7d                	andi	a2,a2,31
1c0094e0:	5a450513          	addi	a0,a0,1444 # 1c0005a4 <__DTOR_END__+0x2b8>
1c0094e4:	552010ef          	jal	ra,1c00aa36 <printf>
1c0094e8:	4da010ef          	jal	ra,1c00a9c2 <abort>
1c0094ec:	002047b7          	lui	a5,0x204
1c0094f0:	04000737          	lui	a4,0x4000
1c0094f4:	cbd8                	sw	a4,20(a5)
1c0094f6:	b7a9                	j	1c009440 <__rt_init+0x6a>
1c0094f8:	9782                	jalr	a5
1c0094fa:	0411                	addi	s0,s0,4
1c0094fc:	bfbd                	j	1c00947a <__rt_init+0xa4>
1c0094fe:	3b99                	jal	1c009254 <rt_cluster_mount>
1c009500:	6591                	lui	a1,0x4
1c009502:	80058593          	addi	a1,a1,-2048 # 3800 <_l1_preload_size+0x17f0>
1c009506:	450d                	li	a0,3
1c009508:	f8aff0ef          	jal	ra,1c008c92 <rt_alloc>
1c00950c:	d169                	beqz	a0,1c0094ce <__rt_init+0xf8>
1c00950e:	00204737          	lui	a4,0x204
1c009512:	0ff00793          	li	a5,255
1c009516:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f6098>
1c00951a:	1c0107b7          	lui	a5,0x1c010
1c00951e:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c009522:	0017e793          	ori	a5,a5,1
1c009526:	08f72023          	sw	a5,128(a4)
1c00952a:	6785                	lui	a5,0x1
1c00952c:	4462                	lw	s0,24(sp)
1c00952e:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009532:	08f72023          	sw	a5,128(a4)
1c009536:	40f2                	lw	ra,28(sp)
1c009538:	08a72023          	sw	a0,128(a4)
1c00953c:	4501                	li	a0,0
1c00953e:	6105                	addi	sp,sp,32
1c009540:	bdad                	j	1c0093ba <cluster_start>
1c009542:	40f2                	lw	ra,28(sp)
1c009544:	4462                	lw	s0,24(sp)
1c009546:	6105                	addi	sp,sp,32
1c009548:	8082                	ret

1c00954a <__rt_deinit>:
1c00954a:	1c0017b7          	lui	a5,0x1c001
1c00954e:	08c7a703          	lw	a4,140(a5) # 1c00108c <__rt_platform>
1c009552:	1141                	addi	sp,sp,-16
1c009554:	c606                	sw	ra,12(sp)
1c009556:	c422                	sw	s0,8(sp)
1c009558:	478d                	li	a5,3
1c00955a:	00f71463          	bne	a4,a5,1c009562 <__rt_deinit+0x18>
1c00955e:	7d005073          	csrwi	0x7d0,0
1c009562:	4505                	li	a0,1
1c009564:	1c000437          	lui	s0,0x1c000
1c009568:	22f5                	jal	1c009754 <__rt_cbsys_exec>
1c00956a:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c00956e:	401c                	lw	a5,0(s0)
1c009570:	e789                	bnez	a5,1c00957a <__rt_deinit+0x30>
1c009572:	40b2                	lw	ra,12(sp)
1c009574:	4422                	lw	s0,8(sp)
1c009576:	0141                	addi	sp,sp,16
1c009578:	8082                	ret
1c00957a:	9782                	jalr	a5
1c00957c:	0411                	addi	s0,s0,4
1c00957e:	bfc5                	j	1c00956e <__rt_deinit+0x24>

1c009580 <pi_open_from_conf>:
1c009580:	c14c                	sw	a1,4(a0)
1c009582:	8082                	ret

1c009584 <rt_irq_set_handler>:
1c009584:	f14027f3          	csrr	a5,mhartid
1c009588:	8795                	srai	a5,a5,0x5
1c00958a:	03f7f793          	andi	a5,a5,63
1c00958e:	477d                	li	a4,31
1c009590:	04e79063          	bne	a5,a4,1c0095d0 <rt_irq_set_handler+0x4c>
1c009594:	1a1047b7          	lui	a5,0x1a104
1c009598:	43dc                	lw	a5,4(a5)
1c00959a:	050a                	slli	a0,a0,0x2
1c00959c:	8d89                	sub	a1,a1,a0
1c00959e:	8d9d                	sub	a1,a1,a5
1c0095a0:	000ff737          	lui	a4,0xff
1c0095a4:	00f506b3          	add	a3,a0,a5
1c0095a8:	8f6d                	and	a4,a4,a1
1c0095aa:	0145d793          	srli	a5,a1,0x14
1c0095ae:	06f76713          	ori	a4,a4,111
1c0095b2:	07fe                	slli	a5,a5,0x1f
1c0095b4:	8fd9                	or	a5,a5,a4
1c0095b6:	7fe00637          	lui	a2,0x7fe00
1c0095ba:	01459713          	slli	a4,a1,0x14
1c0095be:	8f71                	and	a4,a4,a2
1c0095c0:	8fd9                	or	a5,a5,a4
1c0095c2:	05a6                	slli	a1,a1,0x9
1c0095c4:	00100737          	lui	a4,0x100
1c0095c8:	8df9                	and	a1,a1,a4
1c0095ca:	8ddd                	or	a1,a1,a5
1c0095cc:	c28c                	sw	a1,0(a3)
1c0095ce:	8082                	ret
1c0095d0:	002007b7          	lui	a5,0x200
1c0095d4:	43bc                	lw	a5,64(a5)
1c0095d6:	b7d1                	j	1c00959a <rt_irq_set_handler+0x16>

1c0095d8 <illegal_insn_handler_c>:
1c0095d8:	8082                	ret

1c0095da <__rt_handle_illegal_instr>:
1c0095da:	1c0017b7          	lui	a5,0x1c001
1c0095de:	eb47a703          	lw	a4,-332(a5) # 1c000eb4 <__rt_debug_config>
1c0095e2:	1141                	addi	sp,sp,-16
1c0095e4:	c422                	sw	s0,8(sp)
1c0095e6:	c606                	sw	ra,12(sp)
1c0095e8:	8b05                	andi	a4,a4,1
1c0095ea:	843e                	mv	s0,a5
1c0095ec:	c30d                	beqz	a4,1c00960e <__rt_handle_illegal_instr+0x34>
1c0095ee:	341026f3          	csrr	a3,mepc
1c0095f2:	f1402673          	csrr	a2,mhartid
1c0095f6:	1c000537          	lui	a0,0x1c000
1c0095fa:	4298                	lw	a4,0(a3)
1c0095fc:	40565593          	srai	a1,a2,0x5
1c009600:	03f5f593          	andi	a1,a1,63
1c009604:	8a7d                	andi	a2,a2,31
1c009606:	5fc50513          	addi	a0,a0,1532 # 1c0005fc <__DTOR_END__+0x310>
1c00960a:	42c010ef          	jal	ra,1c00aa36 <printf>
1c00960e:	eb442783          	lw	a5,-332(s0)
1c009612:	8385                	srli	a5,a5,0x1
1c009614:	8b85                	andi	a5,a5,1
1c009616:	c399                	beqz	a5,1c00961c <__rt_handle_illegal_instr+0x42>
1c009618:	3aa010ef          	jal	ra,1c00a9c2 <abort>
1c00961c:	4422                	lw	s0,8(sp)
1c00961e:	40b2                	lw	ra,12(sp)
1c009620:	0141                	addi	sp,sp,16
1c009622:	fb7ff06f          	j	1c0095d8 <illegal_insn_handler_c>

1c009626 <__rt_irq_init>:
1c009626:	f14027f3          	csrr	a5,mhartid
1c00962a:	8795                	srai	a5,a5,0x5
1c00962c:	03f7f793          	andi	a5,a5,63
1c009630:	477d                	li	a4,31
1c009632:	02e79763          	bne	a5,a4,1c009660 <__rt_irq_init+0x3a>
1c009636:	1a10a7b7          	lui	a5,0x1a10a
1c00963a:	577d                	li	a4,-1
1c00963c:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1077f4>
1c009640:	f14027f3          	csrr	a5,mhartid
1c009644:	8795                	srai	a5,a5,0x5
1c009646:	1c008737          	lui	a4,0x1c008
1c00964a:	03f7f793          	andi	a5,a5,63
1c00964e:	46fd                	li	a3,31
1c009650:	00070713          	mv	a4,a4
1c009654:	00d79b63          	bne	a5,a3,1c00966a <__rt_irq_init+0x44>
1c009658:	1a1047b7          	lui	a5,0x1a104
1c00965c:	c3d8                	sw	a4,4(a5)
1c00965e:	8082                	ret
1c009660:	002047b7          	lui	a5,0x204
1c009664:	577d                	li	a4,-1
1c009666:	cb98                	sw	a4,16(a5)
1c009668:	bfe1                	j	1c009640 <__rt_irq_init+0x1a>
1c00966a:	002007b7          	lui	a5,0x200
1c00966e:	c3b8                	sw	a4,64(a5)
1c009670:	8082                	ret

1c009672 <__rt_fc_cluster_lock_req>:
1c009672:	1141                	addi	sp,sp,-16
1c009674:	c606                	sw	ra,12(sp)
1c009676:	c422                	sw	s0,8(sp)
1c009678:	c226                	sw	s1,4(sp)
1c00967a:	300474f3          	csrrci	s1,mstatus,8
1c00967e:	09654703          	lbu	a4,150(a0)
1c009682:	411c                	lw	a5,0(a0)
1c009684:	c729                	beqz	a4,1c0096ce <__rt_fc_cluster_lock_req+0x5c>
1c009686:	4398                	lw	a4,0(a5)
1c009688:	c30d                	beqz	a4,1c0096aa <__rt_fc_cluster_lock_req+0x38>
1c00968a:	43d8                	lw	a4,4(a5)
1c00968c:	cf09                	beqz	a4,1c0096a6 <__rt_fc_cluster_lock_req+0x34>
1c00968e:	4798                	lw	a4,8(a5)
1c009690:	c348                	sw	a0,4(a4)
1c009692:	c788                	sw	a0,8(a5)
1c009694:	00052223          	sw	zero,4(a0)
1c009698:	30049073          	csrw	mstatus,s1
1c00969c:	40b2                	lw	ra,12(sp)
1c00969e:	4422                	lw	s0,8(sp)
1c0096a0:	4492                	lw	s1,4(sp)
1c0096a2:	0141                	addi	sp,sp,16
1c0096a4:	8082                	ret
1c0096a6:	c3c8                	sw	a0,4(a5)
1c0096a8:	b7ed                	j	1c009692 <__rt_fc_cluster_lock_req+0x20>
1c0096aa:	4705                	li	a4,1
1c0096ac:	08e50a23          	sb	a4,148(a0)
1c0096b0:	4705                	li	a4,1
1c0096b2:	c398                	sw	a4,0(a5)
1c0096b4:	09554783          	lbu	a5,149(a0)
1c0096b8:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f2054>
1c0096bc:	00201737          	lui	a4,0x201
1c0096c0:	07da                	slli	a5,a5,0x16
1c0096c2:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c0096c6:	97ba                	add	a5,a5,a4
1c0096c8:	0007a023          	sw	zero,0(a5)
1c0096cc:	b7f1                	j	1c009698 <__rt_fc_cluster_lock_req+0x26>
1c0096ce:	842a                	mv	s0,a0
1c0096d0:	47c8                	lw	a0,12(a5)
1c0096d2:	cd01                	beqz	a0,1c0096ea <__rt_fc_cluster_lock_req+0x78>
1c0096d4:	0007a023          	sw	zero,0(a5)
1c0096d8:	0007a623          	sw	zero,12(a5)
1c0096dc:	2185                	jal	1c009b3c <__rt_thread_wakeup>
1c0096de:	4785                	li	a5,1
1c0096e0:	08f40a23          	sb	a5,148(s0)
1c0096e4:	09544783          	lbu	a5,149(s0)
1c0096e8:	bfc1                	j	1c0096b8 <__rt_fc_cluster_lock_req+0x46>
1c0096ea:	43d8                	lw	a4,4(a5)
1c0096ec:	e701                	bnez	a4,1c0096f4 <__rt_fc_cluster_lock_req+0x82>
1c0096ee:	0007a023          	sw	zero,0(a5)
1c0096f2:	b7f5                	j	1c0096de <__rt_fc_cluster_lock_req+0x6c>
1c0096f4:	4354                	lw	a3,4(a4)
1c0096f6:	c3d4                	sw	a3,4(a5)
1c0096f8:	4785                	li	a5,1
1c0096fa:	08f70a23          	sb	a5,148(a4)
1c0096fe:	09574783          	lbu	a5,149(a4)
1c009702:	00201737          	lui	a4,0x201
1c009706:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00970a:	04078793          	addi	a5,a5,64
1c00970e:	07da                	slli	a5,a5,0x16
1c009710:	97ba                	add	a5,a5,a4
1c009712:	bff1                	j	1c0096ee <__rt_fc_cluster_lock_req+0x7c>

1c009714 <__rt_cbsys_add>:
1c009714:	1101                	addi	sp,sp,-32
1c009716:	cc22                	sw	s0,24(sp)
1c009718:	ca26                	sw	s1,20(sp)
1c00971a:	842a                	mv	s0,a0
1c00971c:	84ae                	mv	s1,a1
1c00971e:	4501                	li	a0,0
1c009720:	45b1                	li	a1,12
1c009722:	c632                	sw	a2,12(sp)
1c009724:	ce06                	sw	ra,28(sp)
1c009726:	d6cff0ef          	jal	ra,1c008c92 <rt_alloc>
1c00972a:	4632                	lw	a2,12(sp)
1c00972c:	c115                	beqz	a0,1c009750 <__rt_cbsys_add+0x3c>
1c00972e:	1c0017b7          	lui	a5,0x1c001
1c009732:	040a                	slli	s0,s0,0x2
1c009734:	eb878793          	addi	a5,a5,-328 # 1c000eb8 <cbsys_first>
1c009738:	97a2                	add	a5,a5,s0
1c00973a:	4398                	lw	a4,0(a5)
1c00973c:	c104                	sw	s1,0(a0)
1c00973e:	c150                	sw	a2,4(a0)
1c009740:	c518                	sw	a4,8(a0)
1c009742:	c388                	sw	a0,0(a5)
1c009744:	4501                	li	a0,0
1c009746:	40f2                	lw	ra,28(sp)
1c009748:	4462                	lw	s0,24(sp)
1c00974a:	44d2                	lw	s1,20(sp)
1c00974c:	6105                	addi	sp,sp,32
1c00974e:	8082                	ret
1c009750:	557d                	li	a0,-1
1c009752:	bfd5                	j	1c009746 <__rt_cbsys_add+0x32>

1c009754 <__rt_cbsys_exec>:
1c009754:	00251793          	slli	a5,a0,0x2
1c009758:	1c001537          	lui	a0,0x1c001
1c00975c:	eb850513          	addi	a0,a0,-328 # 1c000eb8 <cbsys_first>
1c009760:	1141                	addi	sp,sp,-16
1c009762:	953e                	add	a0,a0,a5
1c009764:	c422                	sw	s0,8(sp)
1c009766:	4100                	lw	s0,0(a0)
1c009768:	c606                	sw	ra,12(sp)
1c00976a:	e411                	bnez	s0,1c009776 <__rt_cbsys_exec+0x22>
1c00976c:	4501                	li	a0,0
1c00976e:	40b2                	lw	ra,12(sp)
1c009770:	4422                	lw	s0,8(sp)
1c009772:	0141                	addi	sp,sp,16
1c009774:	8082                	ret
1c009776:	401c                	lw	a5,0(s0)
1c009778:	4048                	lw	a0,4(s0)
1c00977a:	9782                	jalr	a5
1c00977c:	e119                	bnez	a0,1c009782 <__rt_cbsys_exec+0x2e>
1c00977e:	4400                	lw	s0,8(s0)
1c009780:	b7ed                	j	1c00976a <__rt_cbsys_exec+0x16>
1c009782:	557d                	li	a0,-1
1c009784:	b7ed                	j	1c00976e <__rt_cbsys_exec+0x1a>

1c009786 <__rt_utils_init>:
1c009786:	1c0017b7          	lui	a5,0x1c001
1c00978a:	eb878793          	addi	a5,a5,-328 # 1c000eb8 <cbsys_first>
1c00978e:	0007a023          	sw	zero,0(a5)
1c009792:	0007a223          	sw	zero,4(a5)
1c009796:	0007a423          	sw	zero,8(a5)
1c00979a:	0007a623          	sw	zero,12(a5)
1c00979e:	0007a823          	sw	zero,16(a5)
1c0097a2:	0007aa23          	sw	zero,20(a5)
1c0097a6:	8082                	ret

1c0097a8 <__rt_fc_lock>:
1c0097a8:	1141                	addi	sp,sp,-16
1c0097aa:	c422                	sw	s0,8(sp)
1c0097ac:	842a                	mv	s0,a0
1c0097ae:	c606                	sw	ra,12(sp)
1c0097b0:	c226                	sw	s1,4(sp)
1c0097b2:	c04a                	sw	s2,0(sp)
1c0097b4:	300474f3          	csrrci	s1,mstatus,8
1c0097b8:	401c                	lw	a5,0(s0)
1c0097ba:	eb99                	bnez	a5,1c0097d0 <__rt_fc_lock+0x28>
1c0097bc:	4785                	li	a5,1
1c0097be:	c01c                	sw	a5,0(s0)
1c0097c0:	30049073          	csrw	mstatus,s1
1c0097c4:	40b2                	lw	ra,12(sp)
1c0097c6:	4422                	lw	s0,8(sp)
1c0097c8:	4492                	lw	s1,4(sp)
1c0097ca:	4902                	lw	s2,0(sp)
1c0097cc:	0141                	addi	sp,sp,16
1c0097ce:	8082                	ret
1c0097d0:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c0097d4:	4585                	li	a1,1
1c0097d6:	e3ff7517          	auipc	a0,0xe3ff7
1c0097da:	85250513          	addi	a0,a0,-1966 # 28 <__rt_sched>
1c0097de:	c45c                	sw	a5,12(s0)
1c0097e0:	29f1                	jal	1c009cbc <__rt_event_execute>
1c0097e2:	bfd9                	j	1c0097b8 <__rt_fc_lock+0x10>

1c0097e4 <__rt_fc_unlock>:
1c0097e4:	300476f3          	csrrci	a3,mstatus,8
1c0097e8:	415c                	lw	a5,4(a0)
1c0097ea:	e791                	bnez	a5,1c0097f6 <__rt_fc_unlock+0x12>
1c0097ec:	00052023          	sw	zero,0(a0)
1c0097f0:	30069073          	csrw	mstatus,a3
1c0097f4:	8082                	ret
1c0097f6:	43d8                	lw	a4,4(a5)
1c0097f8:	c158                	sw	a4,4(a0)
1c0097fa:	4705                	li	a4,1
1c0097fc:	08e78a23          	sb	a4,148(a5)
1c009800:	0957c783          	lbu	a5,149(a5)
1c009804:	00201737          	lui	a4,0x201
1c009808:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00980c:	04078793          	addi	a5,a5,64
1c009810:	07da                	slli	a5,a5,0x16
1c009812:	97ba                	add	a5,a5,a4
1c009814:	0007a023          	sw	zero,0(a5)
1c009818:	bfe1                	j	1c0097f0 <__rt_fc_unlock+0xc>

1c00981a <__rt_fc_cluster_lock>:
1c00981a:	f14027f3          	csrr	a5,mhartid
1c00981e:	8795                	srai	a5,a5,0x5
1c009820:	03f7f793          	andi	a5,a5,63
1c009824:	08f58aa3          	sb	a5,149(a1)
1c009828:	4785                	li	a5,1
1c00982a:	08f58b23          	sb	a5,150(a1)
1c00982e:	1c0097b7          	lui	a5,0x1c009
1c009832:	67278793          	addi	a5,a5,1650 # 1c009672 <__rt_fc_cluster_lock_req>
1c009836:	c188                	sw	a0,0(a1)
1c009838:	08058a23          	sb	zero,148(a1)
1c00983c:	0205a423          	sw	zero,40(a1)
1c009840:	0205a623          	sw	zero,44(a1)
1c009844:	c59c                	sw	a5,8(a1)
1c009846:	c5cc                	sw	a1,12(a1)
1c009848:	05a1                	addi	a1,a1,8
1c00984a:	0015e513          	ori	a0,a1,1
1c00984e:	8abff06f          	j	1c0090f8 <__rt_cluster_push_fc_event>

1c009852 <__rt_fc_cluster_unlock>:
1c009852:	f14027f3          	csrr	a5,mhartid
1c009856:	8795                	srai	a5,a5,0x5
1c009858:	03f7f793          	andi	a5,a5,63
1c00985c:	08f58aa3          	sb	a5,149(a1)
1c009860:	1c0097b7          	lui	a5,0x1c009
1c009864:	67278793          	addi	a5,a5,1650 # 1c009672 <__rt_fc_cluster_lock_req>
1c009868:	c188                	sw	a0,0(a1)
1c00986a:	08058a23          	sb	zero,148(a1)
1c00986e:	08058b23          	sb	zero,150(a1)
1c009872:	0205a423          	sw	zero,40(a1)
1c009876:	0205a623          	sw	zero,44(a1)
1c00987a:	c59c                	sw	a5,8(a1)
1c00987c:	c5cc                	sw	a1,12(a1)
1c00987e:	05a1                	addi	a1,a1,8
1c009880:	0015e513          	ori	a0,a1,1
1c009884:	875ff06f          	j	1c0090f8 <__rt_cluster_push_fc_event>

1c009888 <__rt_event_enqueue>:
1c009888:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c00988c:	00052c23          	sw	zero,24(a0)
1c009890:	c799                	beqz	a5,1c00989e <__rt_event_enqueue+0x16>
1c009892:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c009896:	cf88                	sw	a0,24(a5)
1c009898:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c00989c:	8082                	ret
1c00989e:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c0098a2:	bfdd                	j	1c009898 <__rt_event_enqueue+0x10>

1c0098a4 <__rt_bridge_check_bridge_req.part.5>:
1c0098a4:	1c001737          	lui	a4,0x1c001
1c0098a8:	fcc70793          	addi	a5,a4,-52 # 1c000fcc <__hal_debug_struct>
1c0098ac:	0a47a783          	lw	a5,164(a5)
1c0098b0:	fcc70713          	addi	a4,a4,-52
1c0098b4:	c789                	beqz	a5,1c0098be <__rt_bridge_check_bridge_req.part.5+0x1a>
1c0098b6:	4f94                	lw	a3,24(a5)
1c0098b8:	e681                	bnez	a3,1c0098c0 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c0098ba:	0af72623          	sw	a5,172(a4)
1c0098be:	8082                	ret
1c0098c0:	479c                	lw	a5,8(a5)
1c0098c2:	bfcd                	j	1c0098b4 <__rt_bridge_check_bridge_req.part.5+0x10>

1c0098c4 <__rt_bridge_wait>:
1c0098c4:	f14027f3          	csrr	a5,mhartid
1c0098c8:	8795                	srai	a5,a5,0x5
1c0098ca:	03f7f793          	andi	a5,a5,63
1c0098ce:	477d                	li	a4,31
1c0098d0:	02e79a63          	bne	a5,a4,1c009904 <__rt_bridge_wait+0x40>
1c0098d4:	1a10a7b7          	lui	a5,0x1a10a
1c0098d8:	6711                	lui	a4,0x4
1c0098da:	300476f3          	csrrci	a3,mstatus,8
1c0098de:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1077f8>
1c0098e2:	01161593          	slli	a1,a2,0x11
1c0098e6:	0005cb63          	bltz	a1,1c0098fc <__rt_bridge_wait+0x38>
1c0098ea:	80e7a223          	sw	a4,-2044(a5)
1c0098ee:	10500073          	wfi
1c0098f2:	80e7a423          	sw	a4,-2040(a5)
1c0098f6:	30069073          	csrw	mstatus,a3
1c0098fa:	b7c5                	j	1c0098da <__rt_bridge_wait+0x16>
1c0098fc:	80e7aa23          	sw	a4,-2028(a5)
1c009900:	30069073          	csrw	mstatus,a3
1c009904:	8082                	ret

1c009906 <__rt_bridge_handle_notif>:
1c009906:	1141                	addi	sp,sp,-16
1c009908:	c422                	sw	s0,8(sp)
1c00990a:	1c001437          	lui	s0,0x1c001
1c00990e:	fcc40793          	addi	a5,s0,-52 # 1c000fcc <__hal_debug_struct>
1c009912:	0a47a783          	lw	a5,164(a5)
1c009916:	c606                	sw	ra,12(sp)
1c009918:	c226                	sw	s1,4(sp)
1c00991a:	c04a                	sw	s2,0(sp)
1c00991c:	fcc40413          	addi	s0,s0,-52
1c009920:	c399                	beqz	a5,1c009926 <__rt_bridge_handle_notif+0x20>
1c009922:	4bd8                	lw	a4,20(a5)
1c009924:	e30d                	bnez	a4,1c009946 <__rt_bridge_handle_notif+0x40>
1c009926:	0b442783          	lw	a5,180(s0)
1c00992a:	c789                	beqz	a5,1c009934 <__rt_bridge_handle_notif+0x2e>
1c00992c:	43a8                	lw	a0,64(a5)
1c00992e:	0a042a23          	sw	zero,180(s0)
1c009932:	3f99                	jal	1c009888 <__rt_event_enqueue>
1c009934:	0ac42783          	lw	a5,172(s0)
1c009938:	eb95                	bnez	a5,1c00996c <__rt_bridge_handle_notif+0x66>
1c00993a:	4422                	lw	s0,8(sp)
1c00993c:	40b2                	lw	ra,12(sp)
1c00993e:	4492                	lw	s1,4(sp)
1c009940:	4902                	lw	s2,0(sp)
1c009942:	0141                	addi	sp,sp,16
1c009944:	b785                	j	1c0098a4 <__rt_bridge_check_bridge_req.part.5>
1c009946:	4784                	lw	s1,8(a5)
1c009948:	4fd8                	lw	a4,28(a5)
1c00994a:	0a942223          	sw	s1,164(s0)
1c00994e:	cb01                	beqz	a4,1c00995e <__rt_bridge_handle_notif+0x58>
1c009950:	0b042703          	lw	a4,176(s0)
1c009954:	c798                	sw	a4,8(a5)
1c009956:	0af42823          	sw	a5,176(s0)
1c00995a:	87a6                	mv	a5,s1
1c00995c:	b7d1                	j	1c009920 <__rt_bridge_handle_notif+0x1a>
1c00995e:	43a8                	lw	a0,64(a5)
1c009960:	30047973          	csrrci	s2,mstatus,8
1c009964:	3715                	jal	1c009888 <__rt_event_enqueue>
1c009966:	30091073          	csrw	mstatus,s2
1c00996a:	bfc5                	j	1c00995a <__rt_bridge_handle_notif+0x54>
1c00996c:	40b2                	lw	ra,12(sp)
1c00996e:	4422                	lw	s0,8(sp)
1c009970:	4492                	lw	s1,4(sp)
1c009972:	4902                	lw	s2,0(sp)
1c009974:	0141                	addi	sp,sp,16
1c009976:	8082                	ret

1c009978 <__rt_bridge_check_connection>:
1c009978:	1c001737          	lui	a4,0x1c001
1c00997c:	fcc70713          	addi	a4,a4,-52 # 1c000fcc <__hal_debug_struct>
1c009980:	471c                	lw	a5,8(a4)
1c009982:	ef95                	bnez	a5,1c0099be <__rt_bridge_check_connection+0x46>
1c009984:	1a1047b7          	lui	a5,0x1a104
1c009988:	5bfc                	lw	a5,116(a5)
1c00998a:	469d                	li	a3,7
1c00998c:	83a5                	srli	a5,a5,0x9
1c00998e:	8b9d                	andi	a5,a5,7
1c009990:	02d79763          	bne	a5,a3,1c0099be <__rt_bridge_check_connection+0x46>
1c009994:	1141                	addi	sp,sp,-16
1c009996:	c422                	sw	s0,8(sp)
1c009998:	c226                	sw	s1,4(sp)
1c00999a:	c606                	sw	ra,12(sp)
1c00999c:	4785                	li	a5,1
1c00999e:	c71c                	sw	a5,8(a4)
1c0099a0:	1a1044b7          	lui	s1,0x1a104
1c0099a4:	441d                	li	s0,7
1c0099a6:	58fc                	lw	a5,116(s1)
1c0099a8:	83a5                	srli	a5,a5,0x9
1c0099aa:	8b9d                	andi	a5,a5,7
1c0099ac:	00878763          	beq	a5,s0,1c0099ba <__rt_bridge_check_connection+0x42>
1c0099b0:	40b2                	lw	ra,12(sp)
1c0099b2:	4422                	lw	s0,8(sp)
1c0099b4:	4492                	lw	s1,4(sp)
1c0099b6:	0141                	addi	sp,sp,16
1c0099b8:	8082                	ret
1c0099ba:	3729                	jal	1c0098c4 <__rt_bridge_wait>
1c0099bc:	b7ed                	j	1c0099a6 <__rt_bridge_check_connection+0x2e>
1c0099be:	8082                	ret

1c0099c0 <__rt_bridge_set_available>:
1c0099c0:	1c0017b7          	lui	a5,0x1c001
1c0099c4:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__hal_debug_struct>
1c0099c8:	479c                	lw	a5,8(a5)
1c0099ca:	8082                	ret

1c0099cc <__rt_bridge_send_notif>:
1c0099cc:	1141                	addi	sp,sp,-16
1c0099ce:	c606                	sw	ra,12(sp)
1c0099d0:	3765                	jal	1c009978 <__rt_bridge_check_connection>
1c0099d2:	40b2                	lw	ra,12(sp)
1c0099d4:	1c0017b7          	lui	a5,0x1c001
1c0099d8:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__hal_debug_struct>
1c0099dc:	479c                	lw	a5,8(a5)
1c0099de:	0141                	addi	sp,sp,16
1c0099e0:	8082                	ret

1c0099e2 <__rt_bridge_clear_notif>:
1c0099e2:	1141                	addi	sp,sp,-16
1c0099e4:	c606                	sw	ra,12(sp)
1c0099e6:	3f49                	jal	1c009978 <__rt_bridge_check_connection>
1c0099e8:	1c0017b7          	lui	a5,0x1c001
1c0099ec:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__hal_debug_struct>
1c0099f0:	4798                	lw	a4,8(a5)
1c0099f2:	c311                	beqz	a4,1c0099f6 <__rt_bridge_clear_notif+0x14>
1c0099f4:	479c                	lw	a5,8(a5)
1c0099f6:	40b2                	lw	ra,12(sp)
1c0099f8:	0141                	addi	sp,sp,16
1c0099fa:	8082                	ret

1c0099fc <__rt_bridge_printf_flush>:
1c0099fc:	1141                	addi	sp,sp,-16
1c0099fe:	c422                	sw	s0,8(sp)
1c009a00:	c606                	sw	ra,12(sp)
1c009a02:	1c001437          	lui	s0,0x1c001
1c009a06:	3f8d                	jal	1c009978 <__rt_bridge_check_connection>
1c009a08:	fcc40793          	addi	a5,s0,-52 # 1c000fcc <__hal_debug_struct>
1c009a0c:	479c                	lw	a5,8(a5)
1c009a0e:	c385                	beqz	a5,1c009a2e <__rt_bridge_printf_flush+0x32>
1c009a10:	fcc40413          	addi	s0,s0,-52
1c009a14:	485c                	lw	a5,20(s0)
1c009a16:	e399                	bnez	a5,1c009a1c <__rt_bridge_printf_flush+0x20>
1c009a18:	4c1c                	lw	a5,24(s0)
1c009a1a:	cb91                	beqz	a5,1c009a2e <__rt_bridge_printf_flush+0x32>
1c009a1c:	3f45                	jal	1c0099cc <__rt_bridge_send_notif>
1c009a1e:	485c                	lw	a5,20(s0)
1c009a20:	e789                	bnez	a5,1c009a2a <__rt_bridge_printf_flush+0x2e>
1c009a22:	4422                	lw	s0,8(sp)
1c009a24:	40b2                	lw	ra,12(sp)
1c009a26:	0141                	addi	sp,sp,16
1c009a28:	bf6d                	j	1c0099e2 <__rt_bridge_clear_notif>
1c009a2a:	3d69                	jal	1c0098c4 <__rt_bridge_wait>
1c009a2c:	bfcd                	j	1c009a1e <__rt_bridge_printf_flush+0x22>
1c009a2e:	40b2                	lw	ra,12(sp)
1c009a30:	4422                	lw	s0,8(sp)
1c009a32:	0141                	addi	sp,sp,16
1c009a34:	8082                	ret

1c009a36 <__rt_bridge_req_shutdown>:
1c009a36:	1141                	addi	sp,sp,-16
1c009a38:	c606                	sw	ra,12(sp)
1c009a3a:	c422                	sw	s0,8(sp)
1c009a3c:	c226                	sw	s1,4(sp)
1c009a3e:	3f2d                	jal	1c009978 <__rt_bridge_check_connection>
1c009a40:	1c0017b7          	lui	a5,0x1c001
1c009a44:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__hal_debug_struct>
1c009a48:	479c                	lw	a5,8(a5)
1c009a4a:	cb95                	beqz	a5,1c009a7e <__rt_bridge_req_shutdown+0x48>
1c009a4c:	3f45                	jal	1c0099fc <__rt_bridge_printf_flush>
1c009a4e:	1a1044b7          	lui	s1,0x1a104
1c009a52:	441d                	li	s0,7
1c009a54:	58fc                	lw	a5,116(s1)
1c009a56:	83a5                	srli	a5,a5,0x9
1c009a58:	8b9d                	andi	a5,a5,7
1c009a5a:	02878763          	beq	a5,s0,1c009a88 <__rt_bridge_req_shutdown+0x52>
1c009a5e:	1a1044b7          	lui	s1,0x1a104
1c009a62:	441d                	li	s0,7
1c009a64:	58fc                	lw	a5,116(s1)
1c009a66:	83a5                	srli	a5,a5,0x9
1c009a68:	8b9d                	andi	a5,a5,7
1c009a6a:	02879163          	bne	a5,s0,1c009a8c <__rt_bridge_req_shutdown+0x56>
1c009a6e:	1a1044b7          	lui	s1,0x1a104
1c009a72:	441d                	li	s0,7
1c009a74:	58fc                	lw	a5,116(s1)
1c009a76:	83a5                	srli	a5,a5,0x9
1c009a78:	8b9d                	andi	a5,a5,7
1c009a7a:	00878b63          	beq	a5,s0,1c009a90 <__rt_bridge_req_shutdown+0x5a>
1c009a7e:	40b2                	lw	ra,12(sp)
1c009a80:	4422                	lw	s0,8(sp)
1c009a82:	4492                	lw	s1,4(sp)
1c009a84:	0141                	addi	sp,sp,16
1c009a86:	8082                	ret
1c009a88:	3d35                	jal	1c0098c4 <__rt_bridge_wait>
1c009a8a:	b7e9                	j	1c009a54 <__rt_bridge_req_shutdown+0x1e>
1c009a8c:	3d25                	jal	1c0098c4 <__rt_bridge_wait>
1c009a8e:	bfd9                	j	1c009a64 <__rt_bridge_req_shutdown+0x2e>
1c009a90:	3d15                	jal	1c0098c4 <__rt_bridge_wait>
1c009a92:	b7cd                	j	1c009a74 <__rt_bridge_req_shutdown+0x3e>

1c009a94 <__rt_bridge_init>:
1c009a94:	1c0017b7          	lui	a5,0x1c001
1c009a98:	1a10a737          	lui	a4,0x1a10a
1c009a9c:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__hal_debug_struct>
1c009aa0:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1077fc>
1c009aa4:	0ae7ac23          	sw	a4,184(a5)
1c009aa8:	4741                	li	a4,16
1c009aaa:	0a07a223          	sw	zero,164(a5)
1c009aae:	0a07a623          	sw	zero,172(a5)
1c009ab2:	0a07aa23          	sw	zero,180(a5)
1c009ab6:	0ae7ae23          	sw	a4,188(a5)
1c009aba:	00400793          	li	a5,4
1c009abe:	0007a823          	sw	zero,16(a5)
1c009ac2:	0007a023          	sw	zero,0(a5)
1c009ac6:	8082                	ret

1c009ac8 <__rt_thread_enqueue_ready>:
1c009ac8:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c009acc:	02052c23          	sw	zero,56(a0)
1c009ad0:	01800793          	li	a5,24
1c009ad4:	e711                	bnez	a4,1c009ae0 <__rt_thread_enqueue_ready+0x18>
1c009ad6:	c388                	sw	a0,0(a5)
1c009ad8:	c3c8                	sw	a0,4(a5)
1c009ada:	0c052a23          	sw	zero,212(a0)
1c009ade:	8082                	ret
1c009ae0:	43d8                	lw	a4,4(a5)
1c009ae2:	df08                	sw	a0,56(a4)
1c009ae4:	bfd5                	j	1c009ad8 <__rt_thread_enqueue_ready+0x10>

1c009ae6 <__rt_thread_sleep>:
1c009ae6:	01800713          	li	a4,24
1c009aea:	4708                	lw	a0,8(a4)
1c009aec:	01800793          	li	a5,24
1c009af0:	438c                	lw	a1,0(a5)
1c009af2:	c999                	beqz	a1,1c009b08 <__rt_thread_sleep+0x22>
1c009af4:	5d98                	lw	a4,56(a1)
1c009af6:	c398                	sw	a4,0(a5)
1c009af8:	4705                	li	a4,1
1c009afa:	0ce5aa23          	sw	a4,212(a1)
1c009afe:	00b50c63          	beq	a0,a1,1c009b16 <__rt_thread_sleep+0x30>
1c009b02:	c78c                	sw	a1,8(a5)
1c009b04:	fc2fe06f          	j	1c0082c6 <__rt_thread_switch>
1c009b08:	10500073          	wfi
1c009b0c:	30045073          	csrwi	mstatus,8
1c009b10:	30047773          	csrrci	a4,mstatus,8
1c009b14:	bff1                	j	1c009af0 <__rt_thread_sleep+0xa>
1c009b16:	8082                	ret

1c009b18 <rt_thread_exit>:
1c009b18:	300477f3          	csrrci	a5,mstatus,8
1c009b1c:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009b20:	4705                	li	a4,1
1c009b22:	c3e8                	sw	a0,68(a5)
1c009b24:	5fc8                	lw	a0,60(a5)
1c009b26:	c3b8                	sw	a4,64(a5)
1c009b28:	c909                	beqz	a0,1c009b3a <rt_thread_exit+0x22>
1c009b2a:	0d452783          	lw	a5,212(a0)
1c009b2e:	c791                	beqz	a5,1c009b3a <rt_thread_exit+0x22>
1c009b30:	1141                	addi	sp,sp,-16
1c009b32:	c606                	sw	ra,12(sp)
1c009b34:	3f51                	jal	1c009ac8 <__rt_thread_enqueue_ready>
1c009b36:	40b2                	lw	ra,12(sp)
1c009b38:	0141                	addi	sp,sp,16
1c009b3a:	b775                	j	1c009ae6 <__rt_thread_sleep>

1c009b3c <__rt_thread_wakeup>:
1c009b3c:	5d18                	lw	a4,56(a0)
1c009b3e:	eb09                	bnez	a4,1c009b50 <__rt_thread_wakeup+0x14>
1c009b40:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c009b44:	00a70663          	beq	a4,a0,1c009b50 <__rt_thread_wakeup+0x14>
1c009b48:	0d452783          	lw	a5,212(a0)
1c009b4c:	c391                	beqz	a5,1c009b50 <__rt_thread_wakeup+0x14>
1c009b4e:	bfad                	j	1c009ac8 <__rt_thread_enqueue_ready>
1c009b50:	8082                	ret

1c009b52 <__rt_thread_sched_init>:
1c009b52:	1141                	addi	sp,sp,-16
1c009b54:	c422                	sw	s0,8(sp)
1c009b56:	1c0087b7          	lui	a5,0x1c008
1c009b5a:	1c001437          	lui	s0,0x1c001
1c009b5e:	c226                	sw	s1,4(sp)
1c009b60:	c04a                	sw	s2,0(sp)
1c009b62:	c606                	sw	ra,12(sp)
1c009b64:	ed040413          	addi	s0,s0,-304 # 1c000ed0 <__rt_thread_main>
1c009b68:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009b6c:	c01c                	sw	a5,0(s0)
1c009b6e:	1c00a7b7          	lui	a5,0x1c00a
1c009b72:	04840913          	addi	s2,s0,72
1c009b76:	b1878793          	addi	a5,a5,-1256 # 1c009b18 <rt_thread_exit>
1c009b7a:	01800493          	li	s1,24
1c009b7e:	c45c                	sw	a5,12(s0)
1c009b80:	854a                	mv	a0,s2
1c009b82:	4785                	li	a5,1
1c009b84:	e3ff6597          	auipc	a1,0xe3ff6
1c009b88:	4a458593          	addi	a1,a1,1188 # 28 <__rt_sched>
1c009b8c:	0cf42a23          	sw	a5,212(s0)
1c009b90:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa101fec>
1c009b94:	02042a23          	sw	zero,52(s0)
1c009b98:	00042223          	sw	zero,4(s0)
1c009b9c:	00042423          	sw	zero,8(s0)
1c009ba0:	2829                	jal	1c009bba <__rt_event_init>
1c009ba2:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009ba6:	c480                	sw	s0,8(s1)
1c009ba8:	40b2                	lw	ra,12(sp)
1c009baa:	d03c                	sw	a5,96(s0)
1c009bac:	4422                	lw	s0,8(sp)
1c009bae:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009bb2:	4492                	lw	s1,4(sp)
1c009bb4:	4902                	lw	s2,0(sp)
1c009bb6:	0141                	addi	sp,sp,16
1c009bb8:	8082                	ret

1c009bba <__rt_event_init>:
1c009bba:	02052023          	sw	zero,32(a0)
1c009bbe:	02052223          	sw	zero,36(a0)
1c009bc2:	02052823          	sw	zero,48(a0)
1c009bc6:	00052023          	sw	zero,0(a0)
1c009bca:	8082                	ret

1c009bcc <__rt_wait_event_prepare_blocking>:
1c009bcc:	02400793          	li	a5,36
1c009bd0:	4388                	lw	a0,0(a5)
1c009bd2:	4d18                	lw	a4,24(a0)
1c009bd4:	02052223          	sw	zero,36(a0)
1c009bd8:	c398                	sw	a4,0(a5)
1c009bda:	4785                	li	a5,1
1c009bdc:	d11c                	sw	a5,32(a0)
1c009bde:	00052023          	sw	zero,0(a0)
1c009be2:	8082                	ret

1c009be4 <rt_event_alloc>:
1c009be4:	1141                	addi	sp,sp,-16
1c009be6:	c422                	sw	s0,8(sp)
1c009be8:	842e                	mv	s0,a1
1c009bea:	c606                	sw	ra,12(sp)
1c009bec:	c226                	sw	s1,4(sp)
1c009bee:	300474f3          	csrrci	s1,mstatus,8
1c009bf2:	f14027f3          	csrr	a5,mhartid
1c009bf6:	8795                	srai	a5,a5,0x5
1c009bf8:	03f7f793          	andi	a5,a5,63
1c009bfc:	477d                	li	a4,31
1c009bfe:	00378513          	addi	a0,a5,3
1c009c02:	00e79363          	bne	a5,a4,1c009c08 <rt_event_alloc+0x24>
1c009c06:	4501                	li	a0,0
1c009c08:	08c00593          	li	a1,140
1c009c0c:	02b405b3          	mul	a1,s0,a1
1c009c10:	882ff0ef          	jal	ra,1c008c92 <rt_alloc>
1c009c14:	87aa                	mv	a5,a0
1c009c16:	557d                	li	a0,-1
1c009c18:	cf91                	beqz	a5,1c009c34 <rt_event_alloc+0x50>
1c009c1a:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009c1e:	4581                	li	a1,0
1c009c20:	4601                	li	a2,0
1c009c22:	02400713          	li	a4,36
1c009c26:	00864c63          	blt	a2,s0,1c009c3e <rt_event_alloc+0x5a>
1c009c2a:	c191                	beqz	a1,1c009c2e <rt_event_alloc+0x4a>
1c009c2c:	c314                	sw	a3,0(a4)
1c009c2e:	30049073          	csrw	mstatus,s1
1c009c32:	4501                	li	a0,0
1c009c34:	40b2                	lw	ra,12(sp)
1c009c36:	4422                	lw	s0,8(sp)
1c009c38:	4492                	lw	s1,4(sp)
1c009c3a:	0141                	addi	sp,sp,16
1c009c3c:	8082                	ret
1c009c3e:	cf94                	sw	a3,24(a5)
1c009c40:	0207a023          	sw	zero,32(a5)
1c009c44:	0207a223          	sw	zero,36(a5)
1c009c48:	0207a823          	sw	zero,48(a5)
1c009c4c:	0007a023          	sw	zero,0(a5)
1c009c50:	86be                	mv	a3,a5
1c009c52:	0605                	addi	a2,a2,1
1c009c54:	4585                	li	a1,1
1c009c56:	08c78793          	addi	a5,a5,140
1c009c5a:	b7f1                	j	1c009c26 <rt_event_alloc+0x42>

1c009c5c <rt_event_get>:
1c009c5c:	30047773          	csrrci	a4,mstatus,8
1c009c60:	02400793          	li	a5,36
1c009c64:	4388                	lw	a0,0(a5)
1c009c66:	c509                	beqz	a0,1c009c70 <rt_event_get+0x14>
1c009c68:	4d14                	lw	a3,24(a0)
1c009c6a:	c150                	sw	a2,4(a0)
1c009c6c:	c394                	sw	a3,0(a5)
1c009c6e:	c10c                	sw	a1,0(a0)
1c009c70:	30071073          	csrw	mstatus,a4
1c009c74:	8082                	ret

1c009c76 <rt_event_get_blocking>:
1c009c76:	30047773          	csrrci	a4,mstatus,8
1c009c7a:	02400793          	li	a5,36
1c009c7e:	4388                	lw	a0,0(a5)
1c009c80:	c909                	beqz	a0,1c009c92 <rt_event_get_blocking+0x1c>
1c009c82:	4d14                	lw	a3,24(a0)
1c009c84:	00052223          	sw	zero,4(a0)
1c009c88:	c394                	sw	a3,0(a5)
1c009c8a:	4785                	li	a5,1
1c009c8c:	00052023          	sw	zero,0(a0)
1c009c90:	d11c                	sw	a5,32(a0)
1c009c92:	30071073          	csrw	mstatus,a4
1c009c96:	8082                	ret

1c009c98 <rt_event_push>:
1c009c98:	30047773          	csrrci	a4,mstatus,8
1c009c9c:	02400693          	li	a3,36
1c009ca0:	42d4                	lw	a3,4(a3)
1c009ca2:	00052c23          	sw	zero,24(a0)
1c009ca6:	02400793          	li	a5,36
1c009caa:	e691                	bnez	a3,1c009cb6 <rt_event_push+0x1e>
1c009cac:	c3c8                	sw	a0,4(a5)
1c009cae:	c788                	sw	a0,8(a5)
1c009cb0:	30071073          	csrw	mstatus,a4
1c009cb4:	8082                	ret
1c009cb6:	4794                	lw	a3,8(a5)
1c009cb8:	ce88                	sw	a0,24(a3)
1c009cba:	bfd5                	j	1c009cae <rt_event_push+0x16>

1c009cbc <__rt_event_execute>:
1c009cbc:	1141                	addi	sp,sp,-16
1c009cbe:	c422                	sw	s0,8(sp)
1c009cc0:	02400793          	li	a5,36
1c009cc4:	43dc                	lw	a5,4(a5)
1c009cc6:	c606                	sw	ra,12(sp)
1c009cc8:	c226                	sw	s1,4(sp)
1c009cca:	02400413          	li	s0,36
1c009cce:	eb91                	bnez	a5,1c009ce2 <__rt_event_execute+0x26>
1c009cd0:	c1a9                	beqz	a1,1c009d12 <__rt_event_execute+0x56>
1c009cd2:	10500073          	wfi
1c009cd6:	30045073          	csrwi	mstatus,8
1c009cda:	300477f3          	csrrci	a5,mstatus,8
1c009cde:	405c                	lw	a5,4(s0)
1c009ce0:	cb8d                	beqz	a5,1c009d12 <__rt_event_execute+0x56>
1c009ce2:	4485                	li	s1,1
1c009ce4:	4f98                	lw	a4,24(a5)
1c009ce6:	53d4                	lw	a3,36(a5)
1c009ce8:	00978823          	sb	s1,16(a5)
1c009cec:	c058                	sw	a4,4(s0)
1c009cee:	43c8                	lw	a0,4(a5)
1c009cf0:	4398                	lw	a4,0(a5)
1c009cf2:	e691                	bnez	a3,1c009cfe <__rt_event_execute+0x42>
1c009cf4:	5394                	lw	a3,32(a5)
1c009cf6:	e681                	bnez	a3,1c009cfe <__rt_event_execute+0x42>
1c009cf8:	4014                	lw	a3,0(s0)
1c009cfa:	c01c                	sw	a5,0(s0)
1c009cfc:	cf94                	sw	a3,24(a5)
1c009cfe:	0207a023          	sw	zero,32(a5)
1c009d02:	c711                	beqz	a4,1c009d0e <__rt_event_execute+0x52>
1c009d04:	30045073          	csrwi	mstatus,8
1c009d08:	9702                	jalr	a4
1c009d0a:	300477f3          	csrrci	a5,mstatus,8
1c009d0e:	405c                	lw	a5,4(s0)
1c009d10:	fbf1                	bnez	a5,1c009ce4 <__rt_event_execute+0x28>
1c009d12:	40b2                	lw	ra,12(sp)
1c009d14:	4422                	lw	s0,8(sp)
1c009d16:	4492                	lw	s1,4(sp)
1c009d18:	0141                	addi	sp,sp,16
1c009d1a:	8082                	ret

1c009d1c <__rt_wait_event>:
1c009d1c:	1141                	addi	sp,sp,-16
1c009d1e:	c422                	sw	s0,8(sp)
1c009d20:	c606                	sw	ra,12(sp)
1c009d22:	842a                	mv	s0,a0
1c009d24:	501c                	lw	a5,32(s0)
1c009d26:	ef81                	bnez	a5,1c009d3e <__rt_wait_event+0x22>
1c009d28:	581c                	lw	a5,48(s0)
1c009d2a:	eb91                	bnez	a5,1c009d3e <__rt_wait_event+0x22>
1c009d2c:	02400793          	li	a5,36
1c009d30:	4398                	lw	a4,0(a5)
1c009d32:	40b2                	lw	ra,12(sp)
1c009d34:	c380                	sw	s0,0(a5)
1c009d36:	cc18                	sw	a4,24(s0)
1c009d38:	4422                	lw	s0,8(sp)
1c009d3a:	0141                	addi	sp,sp,16
1c009d3c:	8082                	ret
1c009d3e:	4585                	li	a1,1
1c009d40:	4501                	li	a0,0
1c009d42:	3fad                	jal	1c009cbc <__rt_event_execute>
1c009d44:	b7c5                	j	1c009d24 <__rt_wait_event+0x8>

1c009d46 <rt_event_wait>:
1c009d46:	1141                	addi	sp,sp,-16
1c009d48:	c606                	sw	ra,12(sp)
1c009d4a:	c422                	sw	s0,8(sp)
1c009d4c:	30047473          	csrrci	s0,mstatus,8
1c009d50:	37f1                	jal	1c009d1c <__rt_wait_event>
1c009d52:	30041073          	csrw	mstatus,s0
1c009d56:	40b2                	lw	ra,12(sp)
1c009d58:	4422                	lw	s0,8(sp)
1c009d5a:	0141                	addi	sp,sp,16
1c009d5c:	8082                	ret

1c009d5e <__rt_event_sched_init>:
1c009d5e:	02400513          	li	a0,36
1c009d62:	00052023          	sw	zero,0(a0)
1c009d66:	00052223          	sw	zero,4(a0)
1c009d6a:	4585                	li	a1,1
1c009d6c:	0511                	addi	a0,a0,4
1c009d6e:	bd9d                	j	1c009be4 <rt_event_alloc>

1c009d70 <__rt_fll_set_freq>:
1c009d70:	1141                	addi	sp,sp,-16
1c009d72:	c422                	sw	s0,8(sp)
1c009d74:	c226                	sw	s1,4(sp)
1c009d76:	c606                	sw	ra,12(sp)
1c009d78:	842a                	mv	s0,a0
1c009d7a:	84ae                	mv	s1,a1
1c009d7c:	e111                	bnez	a0,1c009d80 <__rt_fll_set_freq+0x10>
1c009d7e:	3965                	jal	1c009a36 <__rt_bridge_req_shutdown>
1c009d80:	8526                	mv	a0,s1
1c009d82:	f72fe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009d86:	1579                	addi	a0,a0,-2
1c009d88:	00155793          	srli	a5,a0,0x1
1c009d8c:	e391                	bnez	a5,1c009d90 <__rt_fll_set_freq+0x20>
1c009d8e:	4785                	li	a5,1
1c009d90:	fff78713          	addi	a4,a5,-1
1c009d94:	4505                	li	a0,1
1c009d96:	00e51533          	sll	a0,a0,a4
1c009d9a:	00f494b3          	sll	s1,s1,a5
1c009d9e:	7761                	lui	a4,0xffff8
1c009da0:	8f65                	and	a4,a4,s1
1c009da2:	1c0016b7          	lui	a3,0x1c001
1c009da6:	953a                	add	a0,a0,a4
1c009da8:	1e068693          	addi	a3,a3,480 # 1c0011e0 <__rt_fll_freq>
1c009dac:	00241713          	slli	a4,s0,0x2
1c009db0:	9736                	add	a4,a4,a3
1c009db2:	00f55533          	srl	a0,a0,a5
1c009db6:	c308                	sw	a0,0(a4)
1c009db8:	1c001737          	lui	a4,0x1c001
1c009dbc:	17c70713          	addi	a4,a4,380 # 1c00117c <__rt_fll_is_on>
1c009dc0:	9722                	add	a4,a4,s0
1c009dc2:	00074703          	lbu	a4,0(a4)
1c009dc6:	c715                	beqz	a4,1c009df2 <__rt_fll_set_freq+0x82>
1c009dc8:	1a100737          	lui	a4,0x1a100
1c009dcc:	0711                	addi	a4,a4,4
1c009dce:	0412                	slli	s0,s0,0x4
1c009dd0:	943a                	add	s0,s0,a4
1c009dd2:	4018                	lw	a4,0(s0)
1c009dd4:	80bd                	srli	s1,s1,0xf
1c009dd6:	76c1                	lui	a3,0xffff0
1c009dd8:	04c2                	slli	s1,s1,0x10
1c009dda:	8f75                	and	a4,a4,a3
1c009ddc:	80c1                	srli	s1,s1,0x10
1c009dde:	0785                	addi	a5,a5,1
1c009de0:	c40006b7          	lui	a3,0xc4000
1c009de4:	8f45                	or	a4,a4,s1
1c009de6:	8bbd                	andi	a5,a5,15
1c009de8:	16fd                	addi	a3,a3,-1
1c009dea:	07ea                	slli	a5,a5,0x1a
1c009dec:	8f75                	and	a4,a4,a3
1c009dee:	8fd9                	or	a5,a5,a4
1c009df0:	c01c                	sw	a5,0(s0)
1c009df2:	40b2                	lw	ra,12(sp)
1c009df4:	4422                	lw	s0,8(sp)
1c009df6:	4492                	lw	s1,4(sp)
1c009df8:	0141                	addi	sp,sp,16
1c009dfa:	8082                	ret

1c009dfc <__rt_fll_init>:
1c009dfc:	1141                	addi	sp,sp,-16
1c009dfe:	1a1005b7          	lui	a1,0x1a100
1c009e02:	00451613          	slli	a2,a0,0x4
1c009e06:	c226                	sw	s1,4(sp)
1c009e08:	84aa                	mv	s1,a0
1c009e0a:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fdff0>
1c009e0e:	9532                	add	a0,a0,a2
1c009e10:	4114                	lw	a3,0(a0)
1c009e12:	c606                	sw	ra,12(sp)
1c009e14:	c422                	sw	s0,8(sp)
1c009e16:	87b6                	mv	a5,a3
1c009e18:	0406c963          	bltz	a3,1c009e6a <__rt_fll_init+0x6e>
1c009e1c:	00858793          	addi	a5,a1,8
1c009e20:	97b2                	add	a5,a5,a2
1c009e22:	4398                	lw	a4,0(a5)
1c009e24:	7841                	lui	a6,0xffff0
1c009e26:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009e2a:	01077733          	and	a4,a4,a6
1c009e2e:	6809                	lui	a6,0x2
1c009e30:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009e34:	01076733          	or	a4,a4,a6
1c009e38:	f0010837          	lui	a6,0xf0010
1c009e3c:	187d                	addi	a6,a6,-1
1c009e3e:	01077733          	and	a4,a4,a6
1c009e42:	00500837          	lui	a6,0x500
1c009e46:	01076733          	or	a4,a4,a6
1c009e4a:	05b1                	addi	a1,a1,12
1c009e4c:	c398                	sw	a4,0(a5)
1c009e4e:	962e                	add	a2,a2,a1
1c009e50:	421c                	lw	a5,0(a2)
1c009e52:	fc010737          	lui	a4,0xfc010
1c009e56:	177d                	addi	a4,a4,-1
1c009e58:	8ff9                	and	a5,a5,a4
1c009e5a:	014c0737          	lui	a4,0x14c0
1c009e5e:	8fd9                	or	a5,a5,a4
1c009e60:	c21c                	sw	a5,0(a2)
1c009e62:	c00007b7          	lui	a5,0xc0000
1c009e66:	8fd5                	or	a5,a5,a3
1c009e68:	c11c                	sw	a5,0(a0)
1c009e6a:	1c001637          	lui	a2,0x1c001
1c009e6e:	00249713          	slli	a4,s1,0x2
1c009e72:	1e060613          	addi	a2,a2,480 # 1c0011e0 <__rt_fll_freq>
1c009e76:	9732                	add	a4,a4,a2
1c009e78:	4300                	lw	s0,0(a4)
1c009e7a:	c015                	beqz	s0,1c009e9e <__rt_fll_init+0xa2>
1c009e7c:	85a2                	mv	a1,s0
1c009e7e:	8526                	mv	a0,s1
1c009e80:	3dc5                	jal	1c009d70 <__rt_fll_set_freq>
1c009e82:	1c001537          	lui	a0,0x1c001
1c009e86:	17c50513          	addi	a0,a0,380 # 1c00117c <__rt_fll_is_on>
1c009e8a:	9526                	add	a0,a0,s1
1c009e8c:	4785                	li	a5,1
1c009e8e:	00f50023          	sb	a5,0(a0)
1c009e92:	40b2                	lw	ra,12(sp)
1c009e94:	8522                	mv	a0,s0
1c009e96:	4422                	lw	s0,8(sp)
1c009e98:	4492                	lw	s1,4(sp)
1c009e9a:	0141                	addi	sp,sp,16
1c009e9c:	8082                	ret
1c009e9e:	06c2                	slli	a3,a3,0x10
1c009ea0:	83e9                	srli	a5,a5,0x1a
1c009ea2:	82c1                	srli	a3,a3,0x10
1c009ea4:	8bbd                	andi	a5,a5,15
1c009ea6:	06be                	slli	a3,a3,0xf
1c009ea8:	17fd                	addi	a5,a5,-1
1c009eaa:	00f6d433          	srl	s0,a3,a5
1c009eae:	c300                	sw	s0,0(a4)
1c009eb0:	bfc9                	j	1c009e82 <__rt_fll_init+0x86>

1c009eb2 <__rt_fll_deinit>:
1c009eb2:	1c0017b7          	lui	a5,0x1c001
1c009eb6:	17c78793          	addi	a5,a5,380 # 1c00117c <__rt_fll_is_on>
1c009eba:	953e                	add	a0,a0,a5
1c009ebc:	00050023          	sb	zero,0(a0)
1c009ec0:	8082                	ret

1c009ec2 <__rt_flls_constructor>:
1c009ec2:	1c0017b7          	lui	a5,0x1c001
1c009ec6:	1e07a023          	sw	zero,480(a5) # 1c0011e0 <__rt_fll_freq>
1c009eca:	1e078793          	addi	a5,a5,480
1c009ece:	0007a223          	sw	zero,4(a5)
1c009ed2:	1c0017b7          	lui	a5,0x1c001
1c009ed6:	16079e23          	sh	zero,380(a5) # 1c00117c <__rt_fll_is_on>
1c009eda:	8082                	ret

1c009edc <gcd>:
1c009edc:	cd19                	beqz	a0,1c009efa <gcd+0x1e>
1c009ede:	cd81                	beqz	a1,1c009ef6 <gcd+0x1a>
1c009ee0:	00054463          	bltz	a0,1c009ee8 <gcd+0xc>
1c009ee4:	0005d563          	bgez	a1,1c009eee <gcd+0x12>
1c009ee8:	55fd                	li	a1,-1
1c009eea:	a031                	j	1c009ef6 <gcd+0x1a>
1c009eec:	85be                	mv	a1,a5
1c009eee:	02b567b3          	rem	a5,a0,a1
1c009ef2:	852e                	mv	a0,a1
1c009ef4:	ffe5                	bnez	a5,1c009eec <gcd+0x10>
1c009ef6:	852e                	mv	a0,a1
1c009ef8:	8082                	ret
1c009efa:	4581                	li	a1,0
1c009efc:	bfed                	j	1c009ef6 <gcd+0x1a>

1c009efe <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009efe:	1101                	addi	sp,sp,-32
1c009f00:	1c0017b7          	lui	a5,0x1c001
1c009f04:	c84a                	sw	s2,16(sp)
1c009f06:	1807a903          	lw	s2,384(a5) # 1c001180 <__rt_periph_lcm>
1c009f0a:	c452                	sw	s4,8(sp)
1c009f0c:	8a2e                	mv	s4,a1
1c009f0e:	85ca                	mv	a1,s2
1c009f10:	ce06                	sw	ra,28(sp)
1c009f12:	cc22                	sw	s0,24(sp)
1c009f14:	ca26                	sw	s1,20(sp)
1c009f16:	842a                	mv	s0,a0
1c009f18:	c64e                	sw	s3,12(sp)
1c009f1a:	89aa                	mv	s3,a0
1c009f1c:	37c1                	jal	1c009edc <gcd>
1c009f1e:	02a44533          	div	a0,s0,a0
1c009f22:	03250933          	mul	s2,a0,s2
1c009f26:	4511                	li	a0,4
1c009f28:	82dff0ef          	jal	ra,1c009754 <__rt_cbsys_exec>
1c009f2c:	1c0017b7          	lui	a5,0x1c001
1c009f30:	1e07a783          	lw	a5,480(a5) # 1c0011e0 <__rt_fll_freq>
1c009f34:	028954b3          	divu	s1,s2,s0
1c009f38:	0527f263          	bleu	s2,a5,1c009f7c <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009f3c:	1a1047b7          	lui	a5,0x1a104
1c009f40:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1020c0>
1c009f44:	4705                	li	a4,1
1c009f46:	0ce7ae23          	sw	a4,220(a5)
1c009f4a:	85a2                	mv	a1,s0
1c009f4c:	4501                	li	a0,0
1c009f4e:	350d                	jal	1c009d70 <__rt_fll_set_freq>
1c009f50:	57fd                	li	a5,-1
1c009f52:	00fa0963          	beq	s4,a5,1c009f64 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009f56:	c099                	beqz	s1,1c009f5c <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009f58:	029459b3          	divu	s3,s0,s1
1c009f5c:	1c0017b7          	lui	a5,0x1c001
1c009f60:	1f37a423          	sw	s3,488(a5) # 1c0011e8 <__rt_freq_domains>
1c009f64:	4515                	li	a0,5
1c009f66:	feeff0ef          	jal	ra,1c009754 <__rt_cbsys_exec>
1c009f6a:	40f2                	lw	ra,28(sp)
1c009f6c:	4462                	lw	s0,24(sp)
1c009f6e:	44d2                	lw	s1,20(sp)
1c009f70:	4942                	lw	s2,16(sp)
1c009f72:	49b2                	lw	s3,12(sp)
1c009f74:	4a22                	lw	s4,8(sp)
1c009f76:	4501                	li	a0,0
1c009f78:	6105                	addi	sp,sp,32
1c009f7a:	8082                	ret
1c009f7c:	85a2                	mv	a1,s0
1c009f7e:	4501                	li	a0,0
1c009f80:	3bc5                	jal	1c009d70 <__rt_fll_set_freq>
1c009f82:	1a1047b7          	lui	a5,0x1a104
1c009f86:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1020c0>
1c009f8a:	4705                	li	a4,1
1c009f8c:	0ce7ae23          	sw	a4,220(a5)
1c009f90:	b7c1                	j	1c009f50 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009f92 <rt_freq_set_and_get>:
1c009f92:	1141                	addi	sp,sp,-16
1c009f94:	852e                	mv	a0,a1
1c009f96:	c606                	sw	ra,12(sp)
1c009f98:	c422                	sw	s0,8(sp)
1c009f9a:	30047473          	csrrci	s0,mstatus,8
1c009f9e:	4581                	li	a1,0
1c009fa0:	3fb9                	jal	1c009efe <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009fa2:	30041073          	csrw	mstatus,s0
1c009fa6:	40b2                	lw	ra,12(sp)
1c009fa8:	4422                	lw	s0,8(sp)
1c009faa:	00a03533          	snez	a0,a0
1c009fae:	40a00533          	neg	a0,a0
1c009fb2:	0141                	addi	sp,sp,16
1c009fb4:	8082                	ret

1c009fb6 <__rt_freq_init>:
1c009fb6:	1141                	addi	sp,sp,-16
1c009fb8:	c422                	sw	s0,8(sp)
1c009fba:	c606                	sw	ra,12(sp)
1c009fbc:	3719                	jal	1c009ec2 <__rt_flls_constructor>
1c009fbe:	1c0017b7          	lui	a5,0x1c001
1c009fc2:	08c7a703          	lw	a4,140(a5) # 1c00108c <__rt_platform>
1c009fc6:	4785                	li	a5,1
1c009fc8:	1c001437          	lui	s0,0x1c001
1c009fcc:	02f70663          	beq	a4,a5,1c009ff8 <__rt_freq_init+0x42>
1c009fd0:	4501                	li	a0,0
1c009fd2:	352d                	jal	1c009dfc <__rt_fll_init>
1c009fd4:	1ea42423          	sw	a0,488(s0) # 1c0011e8 <__rt_freq_domains>
1c009fd8:	1a1047b7          	lui	a5,0x1a104
1c009fdc:	4709                	li	a4,2
1c009fde:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1020bc>
1c009fe2:	4705                	li	a4,1
1c009fe4:	0ce7ac23          	sw	a4,216(a5)
1c009fe8:	40b2                	lw	ra,12(sp)
1c009fea:	4422                	lw	s0,8(sp)
1c009fec:	0ce7ae23          	sw	a4,220(a5)
1c009ff0:	0ce7aa23          	sw	a4,212(a5)
1c009ff4:	0141                	addi	sp,sp,16
1c009ff6:	8082                	ret
1c009ff8:	026267b7          	lui	a5,0x2626
1c009ffc:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2617a14>
1c00a000:	1ef42423          	sw	a5,488(s0)
1c00a004:	bfd1                	j	1c009fd8 <__rt_freq_init+0x22>

1c00a006 <hal_itc_wait_for_event_noirq>:
1c00a006:	1a10a7b7          	lui	a5,0x1a10a
1c00a00a:	300476f3          	csrrci	a3,mstatus,8
1c00a00e:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1077f8>
1c00a012:	8f69                	and	a4,a4,a0
1c00a014:	eb11                	bnez	a4,1c00a028 <hal_itc_wait_for_event_noirq+0x22>
1c00a016:	80a7a223          	sw	a0,-2044(a5)
1c00a01a:	10500073          	wfi
1c00a01e:	80a7a423          	sw	a0,-2040(a5)
1c00a022:	30069073          	csrw	mstatus,a3
1c00a026:	b7d5                	j	1c00a00a <hal_itc_wait_for_event_noirq+0x4>
1c00a028:	80a7aa23          	sw	a0,-2028(a5)
1c00a02c:	30069073          	csrw	mstatus,a3
1c00a030:	8082                	ret

1c00a032 <__rt_pmu_cluster_power_down>:
1c00a032:	1a1047b7          	lui	a5,0x1a104
1c00a036:	5bbc                	lw	a5,112(a5)
1c00a038:	01079713          	slli	a4,a5,0x10
1c00a03c:	02074c63          	bltz	a4,1c00a074 <__rt_pmu_cluster_power_down+0x42>
1c00a040:	1141                	addi	sp,sp,-16
1c00a042:	c422                	sw	s0,8(sp)
1c00a044:	c606                	sw	ra,12(sp)
1c00a046:	c226                	sw	s1,4(sp)
1c00a048:	1a104437          	lui	s0,0x1a104
1c00a04c:	547c                	lw	a5,108(s0)
1c00a04e:	e385                	bnez	a5,1c00a06e <__rt_pmu_cluster_power_down+0x3c>
1c00a050:	4485                	li	s1,1
1c00a052:	c444                	sw	s1,12(s0)
1c00a054:	478d                	li	a5,3
1c00a056:	d83c                	sw	a5,112(s0)
1c00a058:	00800537          	lui	a0,0x800
1c00a05c:	376d                	jal	1c00a006 <hal_itc_wait_for_event_noirq>
1c00a05e:	d824                	sw	s1,112(s0)
1c00a060:	4422                	lw	s0,8(sp)
1c00a062:	40b2                	lw	ra,12(sp)
1c00a064:	4492                	lw	s1,4(sp)
1c00a066:	00400537          	lui	a0,0x400
1c00a06a:	0141                	addi	sp,sp,16
1c00a06c:	bf69                	j	1c00a006 <hal_itc_wait_for_event_noirq>
1c00a06e:	4505                	li	a0,1
1c00a070:	2a11                	jal	1c00a184 <rt_time_wait_us>
1c00a072:	bfe9                	j	1c00a04c <__rt_pmu_cluster_power_down+0x1a>
1c00a074:	8082                	ret

1c00a076 <__rt_pmu_cluster_power_up>:
1c00a076:	1141                	addi	sp,sp,-16
1c00a078:	c606                	sw	ra,12(sp)
1c00a07a:	c422                	sw	s0,8(sp)
1c00a07c:	478d                	li	a5,3
1c00a07e:	1a104437          	lui	s0,0x1a104
1c00a082:	d83c                	sw	a5,112(s0)
1c00a084:	00400537          	lui	a0,0x400
1c00a088:	3fbd                	jal	1c00a006 <hal_itc_wait_for_event_noirq>
1c00a08a:	02700793          	li	a5,39
1c00a08e:	d83c                	sw	a5,112(s0)
1c00a090:	00800537          	lui	a0,0x800
1c00a094:	3f8d                	jal	1c00a006 <hal_itc_wait_for_event_noirq>
1c00a096:	6791                	lui	a5,0x4
1c00a098:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa101ff8>
1c00a09c:	02778793          	addi	a5,a5,39 # 4027 <_l1_preload_size+0x2017>
1c00a0a0:	d83c                	sw	a5,112(s0)
1c00a0a2:	40b2                	lw	ra,12(sp)
1c00a0a4:	4422                	lw	s0,8(sp)
1c00a0a6:	4505                	li	a0,1
1c00a0a8:	0141                	addi	sp,sp,16
1c00a0aa:	8082                	ret

1c00a0ac <__rt_pmu_init>:
1c00a0ac:	1a1077b7          	lui	a5,0x1a107
1c00a0b0:	4741                	li	a4,16
1c00a0b2:	cb98                	sw	a4,16(a5)
1c00a0b4:	1a10a7b7          	lui	a5,0x1a10a
1c00a0b8:	02000737          	lui	a4,0x2000
1c00a0bc:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa107800>
1c00a0c0:	4709                	li	a4,2
1c00a0c2:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c00a0c6:	8082                	ret

1c00a0c8 <rt_padframe_set>:
1c00a0c8:	300476f3          	csrrci	a3,mstatus,8
1c00a0cc:	4158                	lw	a4,4(a0)
1c00a0ce:	1a1047b7          	lui	a5,0x1a104
1c00a0d2:	4310                	lw	a2,0(a4)
1c00a0d4:	cb90                	sw	a2,16(a5)
1c00a0d6:	4350                	lw	a2,4(a4)
1c00a0d8:	cbd0                	sw	a2,20(a5)
1c00a0da:	4710                	lw	a2,8(a4)
1c00a0dc:	cf90                	sw	a2,24(a5)
1c00a0de:	4758                	lw	a4,12(a4)
1c00a0e0:	cfd8                	sw	a4,28(a5)
1c00a0e2:	30069073          	csrw	mstatus,a3
1c00a0e6:	8082                	ret

1c00a0e8 <__rt_padframe_init>:
1c00a0e8:	1c001537          	lui	a0,0x1c001
1c00a0ec:	fbc50513          	addi	a0,a0,-68 # 1c000fbc <__rt_padframe_profiles>
1c00a0f0:	bfe1                	j	1c00a0c8 <rt_padframe_set>

1c00a0f2 <__rt_time_poweroff>:
1c00a0f2:	1a10b7b7          	lui	a5,0x1a10b
1c00a0f6:	47d8                	lw	a4,12(a5)
1c00a0f8:	1c0017b7          	lui	a5,0x1c001
1c00a0fc:	4501                	li	a0,0
1c00a0fe:	18e7a223          	sw	a4,388(a5) # 1c001184 <timer_count>
1c00a102:	8082                	ret

1c00a104 <__rt_time_poweron>:
1c00a104:	1c0017b7          	lui	a5,0x1c001
1c00a108:	1847a703          	lw	a4,388(a5) # 1c001184 <timer_count>
1c00a10c:	1a10b7b7          	lui	a5,0x1a10b
1c00a110:	4501                	li	a0,0
1c00a112:	c7d8                	sw	a4,12(a5)
1c00a114:	8082                	ret

1c00a116 <rt_event_push_delayed>:
1c00a116:	30047373          	csrrci	t1,mstatus,8
1c00a11a:	1a10b6b7          	lui	a3,0x1a10b
1c00a11e:	46d0                	lw	a2,12(a3)
1c00a120:	1c001737          	lui	a4,0x1c001
1c00a124:	1f072783          	lw	a5,496(a4) # 1c0011f0 <first_delayed>
1c00a128:	86ba                	mv	a3,a4
1c00a12a:	0005d363          	bgez	a1,1c00a130 <rt_event_push_delayed+0x1a>
1c00a12e:	4581                	li	a1,0
1c00a130:	4779                	li	a4,30
1c00a132:	02e5c5b3          	div	a1,a1,a4
1c00a136:	80000737          	lui	a4,0x80000
1c00a13a:	fff74713          	not	a4,a4
1c00a13e:	00e67833          	and	a6,a2,a4
1c00a142:	0585                	addi	a1,a1,1
1c00a144:	962e                	add	a2,a2,a1
1c00a146:	d950                	sw	a2,52(a0)
1c00a148:	982e                	add	a6,a6,a1
1c00a14a:	4601                	li	a2,0
1c00a14c:	c799                	beqz	a5,1c00a15a <rt_event_push_delayed+0x44>
1c00a14e:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa109020>
1c00a152:	00e8f8b3          	and	a7,a7,a4
1c00a156:	0108e863          	bltu	a7,a6,1c00a166 <rt_event_push_delayed+0x50>
1c00a15a:	ca09                	beqz	a2,1c00a16c <rt_event_push_delayed+0x56>
1c00a15c:	ce08                	sw	a0,24(a2)
1c00a15e:	cd1c                	sw	a5,24(a0)
1c00a160:	30031073          	csrw	mstatus,t1
1c00a164:	8082                	ret
1c00a166:	863e                	mv	a2,a5
1c00a168:	4f9c                	lw	a5,24(a5)
1c00a16a:	b7cd                	j	1c00a14c <rt_event_push_delayed+0x36>
1c00a16c:	cd1c                	sw	a5,24(a0)
1c00a16e:	1a10b7b7          	lui	a5,0x1a10b
1c00a172:	47d8                	lw	a4,12(a5)
1c00a174:	1ea6a823          	sw	a0,496(a3) # 1a10b1f0 <__l1_end+0xa1091dc>
1c00a178:	95ba                	add	a1,a1,a4
1c00a17a:	cbcc                	sw	a1,20(a5)
1c00a17c:	08500713          	li	a4,133
1c00a180:	c3d8                	sw	a4,4(a5)
1c00a182:	bff9                	j	1c00a160 <rt_event_push_delayed+0x4a>

1c00a184 <rt_time_wait_us>:
1c00a184:	1101                	addi	sp,sp,-32
1c00a186:	85aa                	mv	a1,a0
1c00a188:	4501                	li	a0,0
1c00a18a:	ce06                	sw	ra,28(sp)
1c00a18c:	cc22                	sw	s0,24(sp)
1c00a18e:	c62e                	sw	a1,12(sp)
1c00a190:	34dd                	jal	1c009c76 <rt_event_get_blocking>
1c00a192:	45b2                	lw	a1,12(sp)
1c00a194:	842a                	mv	s0,a0
1c00a196:	3741                	jal	1c00a116 <rt_event_push_delayed>
1c00a198:	8522                	mv	a0,s0
1c00a19a:	4462                	lw	s0,24(sp)
1c00a19c:	40f2                	lw	ra,28(sp)
1c00a19e:	6105                	addi	sp,sp,32
1c00a1a0:	b65d                	j	1c009d46 <rt_event_wait>

1c00a1a2 <__rt_time_init>:
1c00a1a2:	1141                	addi	sp,sp,-16
1c00a1a4:	1c0017b7          	lui	a5,0x1c001
1c00a1a8:	1e07a823          	sw	zero,496(a5) # 1c0011f0 <first_delayed>
1c00a1ac:	08300713          	li	a4,131
1c00a1b0:	1a10b7b7          	lui	a5,0x1a10b
1c00a1b4:	c606                	sw	ra,12(sp)
1c00a1b6:	c422                	sw	s0,8(sp)
1c00a1b8:	1c00a5b7          	lui	a1,0x1c00a
1c00a1bc:	c3d8                	sw	a4,4(a5)
1c00a1be:	23a58593          	addi	a1,a1,570 # 1c00a23a <__rt_timer_handler>
1c00a1c2:	452d                	li	a0,11
1c00a1c4:	bc0ff0ef          	jal	ra,1c009584 <rt_irq_set_handler>
1c00a1c8:	f14027f3          	csrr	a5,mhartid
1c00a1cc:	8795                	srai	a5,a5,0x5
1c00a1ce:	6705                	lui	a4,0x1
1c00a1d0:	03f7f793          	andi	a5,a5,63
1c00a1d4:	46fd                	li	a3,31
1c00a1d6:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a1da:	04d79863          	bne	a5,a3,1c00a22a <__rt_time_init+0x88>
1c00a1de:	1a10a7b7          	lui	a5,0x1a10a
1c00a1e2:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1077f0>
1c00a1e6:	1c00a5b7          	lui	a1,0x1c00a
1c00a1ea:	4601                	li	a2,0
1c00a1ec:	0f258593          	addi	a1,a1,242 # 1c00a0f2 <__rt_time_poweroff>
1c00a1f0:	4509                	li	a0,2
1c00a1f2:	d22ff0ef          	jal	ra,1c009714 <__rt_cbsys_add>
1c00a1f6:	1c00a5b7          	lui	a1,0x1c00a
1c00a1fa:	842a                	mv	s0,a0
1c00a1fc:	4601                	li	a2,0
1c00a1fe:	10458593          	addi	a1,a1,260 # 1c00a104 <__rt_time_poweron>
1c00a202:	450d                	li	a0,3
1c00a204:	d10ff0ef          	jal	ra,1c009714 <__rt_cbsys_add>
1c00a208:	8d41                	or	a0,a0,s0
1c00a20a:	c505                	beqz	a0,1c00a232 <__rt_time_init+0x90>
1c00a20c:	f1402673          	csrr	a2,mhartid
1c00a210:	1c000537          	lui	a0,0x1c000
1c00a214:	40565593          	srai	a1,a2,0x5
1c00a218:	03f5f593          	andi	a1,a1,63
1c00a21c:	8a7d                	andi	a2,a2,31
1c00a21e:	50850513          	addi	a0,a0,1288 # 1c000508 <__DTOR_END__+0x21c>
1c00a222:	015000ef          	jal	ra,1c00aa36 <printf>
1c00a226:	79c000ef          	jal	ra,1c00a9c2 <abort>
1c00a22a:	002047b7          	lui	a5,0x204
1c00a22e:	cbd8                	sw	a4,20(a5)
1c00a230:	bf5d                	j	1c00a1e6 <__rt_time_init+0x44>
1c00a232:	40b2                	lw	ra,12(sp)
1c00a234:	4422                	lw	s0,8(sp)
1c00a236:	0141                	addi	sp,sp,16
1c00a238:	8082                	ret

1c00a23a <__rt_timer_handler>:
1c00a23a:	7179                	addi	sp,sp,-48
1c00a23c:	ce36                	sw	a3,28(sp)
1c00a23e:	cc3a                	sw	a4,24(sp)
1c00a240:	1a10b6b7          	lui	a3,0x1a10b
1c00a244:	1c001737          	lui	a4,0x1c001
1c00a248:	d61a                	sw	t1,44(sp)
1c00a24a:	d032                	sw	a2,32(sp)
1c00a24c:	ca3e                	sw	a5,20(sp)
1c00a24e:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa108ff8>
1c00a252:	1f072783          	lw	a5,496(a4) # 1c0011f0 <first_delayed>
1c00a256:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a25a:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a25e:	c842                	sw	a6,16(sp)
1c00a260:	80000837          	lui	a6,0x80000
1c00a264:	d42a                	sw	a0,40(sp)
1c00a266:	d22e                	sw	a1,36(sp)
1c00a268:	c646                	sw	a7,12(sp)
1c00a26a:	c472                	sw	t3,8(sp)
1c00a26c:	4581                	li	a1,0
1c00a26e:	4501                	li	a0,0
1c00a270:	ffe84813          	xori	a6,a6,-2
1c00a274:	efb9                	bnez	a5,1c00a2d2 <__rt_timer_handler+0x98>
1c00a276:	c119                	beqz	a0,1c00a27c <__rt_timer_handler+0x42>
1c00a278:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a27c:	c199                	beqz	a1,1c00a282 <__rt_timer_handler+0x48>
1c00a27e:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a282:	1e072823          	sw	zero,496(a4)
1c00a286:	1a10b7b7          	lui	a5,0x1a10b
1c00a28a:	08100713          	li	a4,129
1c00a28e:	c3d8                	sw	a4,4(a5)
1c00a290:	6785                	lui	a5,0x1
1c00a292:	1a10a737          	lui	a4,0x1a10a
1c00a296:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a29a:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa107800>
1c00a29e:	5332                	lw	t1,44(sp)
1c00a2a0:	5522                	lw	a0,40(sp)
1c00a2a2:	5592                	lw	a1,36(sp)
1c00a2a4:	5602                	lw	a2,32(sp)
1c00a2a6:	46f2                	lw	a3,28(sp)
1c00a2a8:	4762                	lw	a4,24(sp)
1c00a2aa:	47d2                	lw	a5,20(sp)
1c00a2ac:	4842                	lw	a6,16(sp)
1c00a2ae:	48b2                	lw	a7,12(sp)
1c00a2b0:	4e22                	lw	t3,8(sp)
1c00a2b2:	6145                	addi	sp,sp,48
1c00a2b4:	30200073          	mret
1c00a2b8:	0187a883          	lw	a7,24(a5)
1c00a2bc:	0007ac23          	sw	zero,24(a5)
1c00a2c0:	c611                	beqz	a2,1c00a2cc <__rt_timer_handler+0x92>
1c00a2c2:	ce9c                	sw	a5,24(a3)
1c00a2c4:	86be                	mv	a3,a5
1c00a2c6:	4585                	li	a1,1
1c00a2c8:	87c6                	mv	a5,a7
1c00a2ca:	b76d                	j	1c00a274 <__rt_timer_handler+0x3a>
1c00a2cc:	863e                	mv	a2,a5
1c00a2ce:	4505                	li	a0,1
1c00a2d0:	bfd5                	j	1c00a2c4 <__rt_timer_handler+0x8a>
1c00a2d2:	0347a883          	lw	a7,52(a5)
1c00a2d6:	41130e33          	sub	t3,t1,a7
1c00a2da:	fdc87fe3          	bleu	t3,a6,1c00a2b8 <__rt_timer_handler+0x7e>
1c00a2de:	c119                	beqz	a0,1c00a2e4 <__rt_timer_handler+0xaa>
1c00a2e0:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a2e4:	c199                	beqz	a1,1c00a2ea <__rt_timer_handler+0xb0>
1c00a2e6:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a2ea:	1ef72823          	sw	a5,496(a4)
1c00a2ee:	1a10b737          	lui	a4,0x1a10b
1c00a2f2:	475c                	lw	a5,12(a4)
1c00a2f4:	406787b3          	sub	a5,a5,t1
1c00a2f8:	97c6                	add	a5,a5,a7
1c00a2fa:	cb5c                	sw	a5,20(a4)
1c00a2fc:	08500793          	li	a5,133
1c00a300:	c35c                	sw	a5,4(a4)
1c00a302:	bf71                	j	1c00a29e <__rt_timer_handler+0x64>

1c00a304 <rt_periph_copy>:
1c00a304:	7179                	addi	sp,sp,-48
1c00a306:	d422                	sw	s0,40(sp)
1c00a308:	842a                	mv	s0,a0
1c00a30a:	d606                	sw	ra,44(sp)
1c00a30c:	d226                	sw	s1,36(sp)
1c00a30e:	d04a                	sw	s2,32(sp)
1c00a310:	30047973          	csrrci	s2,mstatus,8
1c00a314:	4015d493          	srai	s1,a1,0x1
1c00a318:	1a102537          	lui	a0,0x1a102
1c00a31c:	049e                	slli	s1,s1,0x7
1c00a31e:	94aa                	add	s1,s1,a0
1c00a320:	00459513          	slli	a0,a1,0x4
1c00a324:	8941                	andi	a0,a0,16
1c00a326:	94aa                	add	s1,s1,a0
1c00a328:	853e                	mv	a0,a5
1c00a32a:	ef89                	bnez	a5,1c00a344 <rt_periph_copy+0x40>
1c00a32c:	ce2e                	sw	a1,28(sp)
1c00a32e:	cc32                	sw	a2,24(sp)
1c00a330:	ca36                	sw	a3,20(sp)
1c00a332:	c83a                	sw	a4,16(sp)
1c00a334:	c63e                	sw	a5,12(sp)
1c00a336:	897ff0ef          	jal	ra,1c009bcc <__rt_wait_event_prepare_blocking>
1c00a33a:	47b2                	lw	a5,12(sp)
1c00a33c:	4742                	lw	a4,16(sp)
1c00a33e:	46d2                	lw	a3,20(sp)
1c00a340:	4662                	lw	a2,24(sp)
1c00a342:	45f2                	lw	a1,28(sp)
1c00a344:	e419                	bnez	s0,1c00a352 <rt_periph_copy+0x4e>
1c00a346:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa100020>
1c00a34a:	04052023          	sw	zero,64(a0)
1c00a34e:	04052823          	sw	zero,80(a0)
1c00a352:	00c42803          	lw	a6,12(s0)
1c00a356:	c054                	sw	a3,4(s0)
1c00a358:	cc08                	sw	a0,24(s0)
1c00a35a:	00f87813          	andi	a6,a6,15
1c00a35e:	4891                	li	a7,4
1c00a360:	01076713          	ori	a4,a4,16
1c00a364:	0708ec63          	bltu	a7,a6,1c00a3dc <rt_periph_copy+0xd8>
1c00a368:	04000893          	li	a7,64
1c00a36c:	0596                	slli	a1,a1,0x5
1c00a36e:	98ae                	add	a7,a7,a1
1c00a370:	0008a303          	lw	t1,0(a7)
1c00a374:	00042a23          	sw	zero,20(s0)
1c00a378:	04000813          	li	a6,64
1c00a37c:	02031663          	bnez	t1,1c00a3a8 <rt_periph_copy+0xa4>
1c00a380:	0088a023          	sw	s0,0(a7)
1c00a384:	00b808b3          	add	a7,a6,a1
1c00a388:	0088a303          	lw	t1,8(a7)
1c00a38c:	0088a223          	sw	s0,4(a7)
1c00a390:	02031163          	bnez	t1,1c00a3b2 <rt_periph_copy+0xae>
1c00a394:	0084a883          	lw	a7,8(s1)
1c00a398:	0208f893          	andi	a7,a7,32
1c00a39c:	00089b63          	bnez	a7,1c00a3b2 <rt_periph_copy+0xae>
1c00a3a0:	c090                	sw	a2,0(s1)
1c00a3a2:	c0d4                	sw	a3,4(s1)
1c00a3a4:	c498                	sw	a4,8(s1)
1c00a3a6:	a005                	j	1c00a3c6 <rt_periph_copy+0xc2>
1c00a3a8:	0048a883          	lw	a7,4(a7)
1c00a3ac:	0088aa23          	sw	s0,20(a7)
1c00a3b0:	bfd1                	j	1c00a384 <rt_periph_copy+0x80>
1c00a3b2:	00042823          	sw	zero,16(s0)
1c00a3b6:	c010                	sw	a2,0(s0)
1c00a3b8:	c054                	sw	a3,4(s0)
1c00a3ba:	c418                	sw	a4,8(s0)
1c00a3bc:	00031563          	bnez	t1,1c00a3c6 <rt_periph_copy+0xc2>
1c00a3c0:	982e                	add	a6,a6,a1
1c00a3c2:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a3c6:	e399                	bnez	a5,1c00a3cc <rt_periph_copy+0xc8>
1c00a3c8:	955ff0ef          	jal	ra,1c009d1c <__rt_wait_event>
1c00a3cc:	30091073          	csrw	mstatus,s2
1c00a3d0:	50b2                	lw	ra,44(sp)
1c00a3d2:	5422                	lw	s0,40(sp)
1c00a3d4:	5492                	lw	s1,36(sp)
1c00a3d6:	5902                	lw	s2,32(sp)
1c00a3d8:	6145                	addi	sp,sp,48
1c00a3da:	8082                	ret
1c00a3dc:	4899                	li	a7,6
1c00a3de:	ff1814e3          	bne	a6,a7,1c00a3c6 <rt_periph_copy+0xc2>
1c00a3e2:	04000893          	li	a7,64
1c00a3e6:	0596                	slli	a1,a1,0x5
1c00a3e8:	98ae                	add	a7,a7,a1
1c00a3ea:	0008a303          	lw	t1,0(a7)
1c00a3ee:	00042a23          	sw	zero,20(s0)
1c00a3f2:	04000813          	li	a6,64
1c00a3f6:	00031f63          	bnez	t1,1c00a414 <rt_periph_copy+0x110>
1c00a3fa:	0088a023          	sw	s0,0(a7)
1c00a3fe:	95c2                	add	a1,a1,a6
1c00a400:	c1c0                	sw	s0,4(a1)
1c00a402:	00031e63          	bnez	t1,1c00a41e <rt_periph_copy+0x11a>
1c00a406:	02442803          	lw	a6,36(s0)
1c00a40a:	1a1025b7          	lui	a1,0x1a102
1c00a40e:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa10010c>
1c00a412:	b779                	j	1c00a3a0 <rt_periph_copy+0x9c>
1c00a414:	0048a883          	lw	a7,4(a7)
1c00a418:	0088aa23          	sw	s0,20(a7)
1c00a41c:	b7cd                	j	1c00a3fe <rt_periph_copy+0xfa>
1c00a41e:	c418                	sw	a4,8(s0)
1c00a420:	4598                	lw	a4,8(a1)
1c00a422:	c010                	sw	a2,0(s0)
1c00a424:	c054                	sw	a3,4(s0)
1c00a426:	00042823          	sw	zero,16(s0)
1c00a42a:	ff51                	bnez	a4,1c00a3c6 <rt_periph_copy+0xc2>
1c00a42c:	c580                	sw	s0,8(a1)
1c00a42e:	bf61                	j	1c00a3c6 <rt_periph_copy+0xc2>

1c00a430 <__rt_periph_init>:
1c00a430:	1c0085b7          	lui	a1,0x1c008
1c00a434:	04000693          	li	a3,64
1c00a438:	4601                	li	a2,0
1c00a43a:	04000793          	li	a5,64
1c00a43e:	1a1028b7          	lui	a7,0x1a102
1c00a442:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a446:	4841                	li	a6,16
1c00a448:	40165713          	srai	a4,a2,0x1
1c00a44c:	00461513          	slli	a0,a2,0x4
1c00a450:	071e                	slli	a4,a4,0x7
1c00a452:	9746                	add	a4,a4,a7
1c00a454:	8941                	andi	a0,a0,16
1c00a456:	972a                	add	a4,a4,a0
1c00a458:	0006a023          	sw	zero,0(a3)
1c00a45c:	0006a423          	sw	zero,8(a3)
1c00a460:	c6d8                	sw	a4,12(a3)
1c00a462:	cecc                	sw	a1,28(a3)
1c00a464:	0605                	addi	a2,a2,1
1c00a466:	02068693          	addi	a3,a3,32
1c00a46a:	fd061fe3          	bne	a2,a6,1c00a448 <__rt_periph_init+0x18>
1c00a46e:	1c008737          	lui	a4,0x1c008
1c00a472:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a476:	2007a023          	sw	zero,512(a5)
1c00a47a:	20e7a423          	sw	a4,520(a5)
1c00a47e:	20e7a623          	sw	a4,524(a5)
1c00a482:	20e7a823          	sw	a4,528(a5)
1c00a486:	20e7aa23          	sw	a4,532(a5)
1c00a48a:	20e7ac23          	sw	a4,536(a5)
1c00a48e:	20e7ae23          	sw	a4,540(a5)
1c00a492:	22e7a023          	sw	a4,544(a5)
1c00a496:	22e7a223          	sw	a4,548(a5)
1c00a49a:	2007a223          	sw	zero,516(a5)
1c00a49e:	8082                	ret

1c00a4a0 <__rt_i2c_init>:
1c00a4a0:	1c0107b7          	lui	a5,0x1c010
1c00a4a4:	16878793          	addi	a5,a5,360 # 1c010168 <__cluster_text_end>
1c00a4a8:	00078223          	sb	zero,4(a5)
1c00a4ac:	00078a23          	sb	zero,20(a5)
1c00a4b0:	8082                	ret

1c00a4b2 <__rt_hyper_init>:
1c00a4b2:	1c001737          	lui	a4,0x1c001
1c00a4b6:	26800793          	li	a5,616
1c00a4ba:	18072423          	sw	zero,392(a4) # 1c001188 <__pi_hyper_cluster_reqs_first>
1c00a4be:	577d                	li	a4,-1
1c00a4c0:	0007aa23          	sw	zero,20(a5)
1c00a4c4:	0207a823          	sw	zero,48(a5)
1c00a4c8:	cf98                	sw	a4,24(a5)
1c00a4ca:	8082                	ret

1c00a4cc <__rt_spim_init>:
1c00a4cc:	1c0017b7          	lui	a5,0x1c001
1c00a4d0:	1807a623          	sw	zero,396(a5) # 1c00118c <__rt_spim_open_count>
1c00a4d4:	8082                	ret

1c00a4d6 <rt_is_fc>:
1c00a4d6:	f1402573          	csrr	a0,mhartid
1c00a4da:	8515                	srai	a0,a0,0x5
1c00a4dc:	03f57513          	andi	a0,a0,63
1c00a4e0:	1505                	addi	a0,a0,-31
1c00a4e2:	00153513          	seqz	a0,a0
1c00a4e6:	8082                	ret

1c00a4e8 <__rt_io_end_of_flush>:
1c00a4e8:	1c0017b7          	lui	a5,0x1c001
1c00a4ec:	1807aa23          	sw	zero,404(a5) # 1c001194 <__rt_io_pending_flush>
1c00a4f0:	00052c23          	sw	zero,24(a0)
1c00a4f4:	8082                	ret

1c00a4f6 <__rt_io_uart_wait_req>:
1c00a4f6:	1141                	addi	sp,sp,-16
1c00a4f8:	c226                	sw	s1,4(sp)
1c00a4fa:	84aa                	mv	s1,a0
1c00a4fc:	c606                	sw	ra,12(sp)
1c00a4fe:	c422                	sw	s0,8(sp)
1c00a500:	c04a                	sw	s2,0(sp)
1c00a502:	30047973          	csrrci	s2,mstatus,8
1c00a506:	1c001437          	lui	s0,0x1c001
1c00a50a:	19040413          	addi	s0,s0,400 # 1c001190 <__rt_io_event_current>
1c00a50e:	4008                	lw	a0,0(s0)
1c00a510:	c509                	beqz	a0,1c00a51a <__rt_io_uart_wait_req+0x24>
1c00a512:	835ff0ef          	jal	ra,1c009d46 <rt_event_wait>
1c00a516:	00042023          	sw	zero,0(s0)
1c00a51a:	4785                	li	a5,1
1c00a51c:	08f48623          	sb	a5,140(s1)
1c00a520:	08d4c783          	lbu	a5,141(s1)
1c00a524:	00201737          	lui	a4,0x201
1c00a528:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00a52c:	04078793          	addi	a5,a5,64
1c00a530:	07da                	slli	a5,a5,0x16
1c00a532:	97ba                	add	a5,a5,a4
1c00a534:	0007a023          	sw	zero,0(a5)
1c00a538:	30091073          	csrw	mstatus,s2
1c00a53c:	40b2                	lw	ra,12(sp)
1c00a53e:	4422                	lw	s0,8(sp)
1c00a540:	4492                	lw	s1,4(sp)
1c00a542:	4902                	lw	s2,0(sp)
1c00a544:	0141                	addi	sp,sp,16
1c00a546:	8082                	ret

1c00a548 <__rt_io_start>:
1c00a548:	1101                	addi	sp,sp,-32
1c00a54a:	0028                	addi	a0,sp,8
1c00a54c:	ce06                	sw	ra,28(sp)
1c00a54e:	cc22                	sw	s0,24(sp)
1c00a550:	7e1000ef          	jal	ra,1c00b530 <rt_uart_conf_init>
1c00a554:	4585                	li	a1,1
1c00a556:	4501                	li	a0,0
1c00a558:	e8cff0ef          	jal	ra,1c009be4 <rt_event_alloc>
1c00a55c:	547d                	li	s0,-1
1c00a55e:	ed1d                	bnez	a0,1c00a59c <__rt_io_start+0x54>
1c00a560:	1c0017b7          	lui	a5,0x1c001
1c00a564:	0907a783          	lw	a5,144(a5) # 1c001090 <__rt_iodev_uart_baudrate>
1c00a568:	842a                	mv	s0,a0
1c00a56a:	1c001537          	lui	a0,0x1c001
1c00a56e:	e3ff6597          	auipc	a1,0xe3ff6
1c00a572:	aba58593          	addi	a1,a1,-1350 # 28 <__rt_sched>
1c00a576:	0dc50513          	addi	a0,a0,220 # 1c0010dc <__rt_io_event>
1c00a57a:	c43e                	sw	a5,8(sp)
1c00a57c:	e3eff0ef          	jal	ra,1c009bba <__rt_event_init>
1c00a580:	1c0017b7          	lui	a5,0x1c001
1c00a584:	1a07a503          	lw	a0,416(a5) # 1c0011a0 <__rt_iodev_uart_channel>
1c00a588:	4681                	li	a3,0
1c00a58a:	4601                	li	a2,0
1c00a58c:	002c                	addi	a1,sp,8
1c00a58e:	050d                	addi	a0,a0,3
1c00a590:	7b1000ef          	jal	ra,1c00b540 <__rt_uart_open>
1c00a594:	1c0017b7          	lui	a5,0x1c001
1c00a598:	18a7ac23          	sw	a0,408(a5) # 1c001198 <_rt_io_uart>
1c00a59c:	8522                	mv	a0,s0
1c00a59e:	40f2                	lw	ra,28(sp)
1c00a5a0:	4462                	lw	s0,24(sp)
1c00a5a2:	6105                	addi	sp,sp,32
1c00a5a4:	8082                	ret

1c00a5a6 <rt_event_execute.isra.2.constprop.11>:
1c00a5a6:	1141                	addi	sp,sp,-16
1c00a5a8:	c606                	sw	ra,12(sp)
1c00a5aa:	c422                	sw	s0,8(sp)
1c00a5ac:	30047473          	csrrci	s0,mstatus,8
1c00a5b0:	4585                	li	a1,1
1c00a5b2:	e3ff6517          	auipc	a0,0xe3ff6
1c00a5b6:	a7650513          	addi	a0,a0,-1418 # 28 <__rt_sched>
1c00a5ba:	f02ff0ef          	jal	ra,1c009cbc <__rt_event_execute>
1c00a5be:	30041073          	csrw	mstatus,s0
1c00a5c2:	40b2                	lw	ra,12(sp)
1c00a5c4:	4422                	lw	s0,8(sp)
1c00a5c6:	0141                	addi	sp,sp,16
1c00a5c8:	8082                	ret

1c00a5ca <__rt_io_lock>:
1c00a5ca:	1c0017b7          	lui	a5,0x1c001
1c00a5ce:	fdc7a783          	lw	a5,-36(a5) # 1c000fdc <__hal_debug_struct+0x10>
1c00a5d2:	c791                	beqz	a5,1c00a5de <__rt_io_lock+0x14>
1c00a5d4:	1c0017b7          	lui	a5,0x1c001
1c00a5d8:	1987a783          	lw	a5,408(a5) # 1c001198 <_rt_io_uart>
1c00a5dc:	c3a1                	beqz	a5,1c00a61c <__rt_io_lock+0x52>
1c00a5de:	7171                	addi	sp,sp,-176
1c00a5e0:	d706                	sw	ra,172(sp)
1c00a5e2:	3dd5                	jal	1c00a4d6 <rt_is_fc>
1c00a5e4:	1c0017b7          	lui	a5,0x1c001
1c00a5e8:	c901                	beqz	a0,1c00a5f8 <__rt_io_lock+0x2e>
1c00a5ea:	fac78513          	addi	a0,a5,-84 # 1c000fac <__rt_io_fc_lock>
1c00a5ee:	9baff0ef          	jal	ra,1c0097a8 <__rt_fc_lock>
1c00a5f2:	50ba                	lw	ra,172(sp)
1c00a5f4:	614d                	addi	sp,sp,176
1c00a5f6:	8082                	ret
1c00a5f8:	002c                	addi	a1,sp,8
1c00a5fa:	fac78513          	addi	a0,a5,-84
1c00a5fe:	a1cff0ef          	jal	ra,1c00981a <__rt_fc_cluster_lock>
1c00a602:	4689                	li	a3,2
1c00a604:	00204737          	lui	a4,0x204
1c00a608:	09c14783          	lbu	a5,156(sp)
1c00a60c:	0ff7f793          	andi	a5,a5,255
1c00a610:	f3ed                	bnez	a5,1c00a5f2 <__rt_io_lock+0x28>
1c00a612:	c714                	sw	a3,8(a4)
1c00a614:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a618:	c354                	sw	a3,4(a4)
1c00a61a:	b7fd                	j	1c00a608 <__rt_io_lock+0x3e>
1c00a61c:	8082                	ret

1c00a61e <__rt_io_unlock>:
1c00a61e:	1c0017b7          	lui	a5,0x1c001
1c00a622:	fdc7a783          	lw	a5,-36(a5) # 1c000fdc <__hal_debug_struct+0x10>
1c00a626:	c791                	beqz	a5,1c00a632 <__rt_io_unlock+0x14>
1c00a628:	1c0017b7          	lui	a5,0x1c001
1c00a62c:	1987a783          	lw	a5,408(a5) # 1c001198 <_rt_io_uart>
1c00a630:	c3a1                	beqz	a5,1c00a670 <__rt_io_unlock+0x52>
1c00a632:	7171                	addi	sp,sp,-176
1c00a634:	d706                	sw	ra,172(sp)
1c00a636:	3545                	jal	1c00a4d6 <rt_is_fc>
1c00a638:	1c0017b7          	lui	a5,0x1c001
1c00a63c:	c901                	beqz	a0,1c00a64c <__rt_io_unlock+0x2e>
1c00a63e:	fac78513          	addi	a0,a5,-84 # 1c000fac <__rt_io_fc_lock>
1c00a642:	9a2ff0ef          	jal	ra,1c0097e4 <__rt_fc_unlock>
1c00a646:	50ba                	lw	ra,172(sp)
1c00a648:	614d                	addi	sp,sp,176
1c00a64a:	8082                	ret
1c00a64c:	002c                	addi	a1,sp,8
1c00a64e:	fac78513          	addi	a0,a5,-84
1c00a652:	a00ff0ef          	jal	ra,1c009852 <__rt_fc_cluster_unlock>
1c00a656:	4689                	li	a3,2
1c00a658:	00204737          	lui	a4,0x204
1c00a65c:	09c14783          	lbu	a5,156(sp)
1c00a660:	0ff7f793          	andi	a5,a5,255
1c00a664:	f3ed                	bnez	a5,1c00a646 <__rt_io_unlock+0x28>
1c00a666:	c714                	sw	a3,8(a4)
1c00a668:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a66c:	c354                	sw	a3,4(a4)
1c00a66e:	b7fd                	j	1c00a65c <__rt_io_unlock+0x3e>
1c00a670:	8082                	ret

1c00a672 <__rt_io_uart_wait_pending>:
1c00a672:	7135                	addi	sp,sp,-160
1c00a674:	cd22                	sw	s0,152(sp)
1c00a676:	cf06                	sw	ra,156(sp)
1c00a678:	cb26                	sw	s1,148(sp)
1c00a67a:	1c001437          	lui	s0,0x1c001
1c00a67e:	19442783          	lw	a5,404(s0) # 1c001194 <__rt_io_pending_flush>
1c00a682:	e39d                	bnez	a5,1c00a6a8 <__rt_io_uart_wait_pending+0x36>
1c00a684:	1c001437          	lui	s0,0x1c001
1c00a688:	19040413          	addi	s0,s0,400 # 1c001190 <__rt_io_event_current>
1c00a68c:	4004                	lw	s1,0(s0)
1c00a68e:	c881                	beqz	s1,1c00a69e <__rt_io_uart_wait_pending+0x2c>
1c00a690:	3599                	jal	1c00a4d6 <rt_is_fc>
1c00a692:	cd19                	beqz	a0,1c00a6b0 <__rt_io_uart_wait_pending+0x3e>
1c00a694:	8526                	mv	a0,s1
1c00a696:	eb0ff0ef          	jal	ra,1c009d46 <rt_event_wait>
1c00a69a:	00042023          	sw	zero,0(s0)
1c00a69e:	40fa                	lw	ra,156(sp)
1c00a6a0:	446a                	lw	s0,152(sp)
1c00a6a2:	44da                	lw	s1,148(sp)
1c00a6a4:	610d                	addi	sp,sp,160
1c00a6a6:	8082                	ret
1c00a6a8:	3f9d                	jal	1c00a61e <__rt_io_unlock>
1c00a6aa:	3df5                	jal	1c00a5a6 <rt_event_execute.isra.2.constprop.11>
1c00a6ac:	3f39                	jal	1c00a5ca <__rt_io_lock>
1c00a6ae:	bfc1                	j	1c00a67e <__rt_io_uart_wait_pending+0xc>
1c00a6b0:	f14027f3          	csrr	a5,mhartid
1c00a6b4:	8795                	srai	a5,a5,0x5
1c00a6b6:	03f7f793          	andi	a5,a5,63
1c00a6ba:	08f106a3          	sb	a5,141(sp)
1c00a6be:	1c00a7b7          	lui	a5,0x1c00a
1c00a6c2:	4f678793          	addi	a5,a5,1270 # 1c00a4f6 <__rt_io_uart_wait_req>
1c00a6c6:	c03e                	sw	a5,0(sp)
1c00a6c8:	00010793          	mv	a5,sp
1c00a6cc:	4705                	li	a4,1
1c00a6ce:	c23e                	sw	a5,4(sp)
1c00a6d0:	850a                	mv	a0,sp
1c00a6d2:	1c0017b7          	lui	a5,0x1c001
1c00a6d6:	0ee7ae23          	sw	a4,252(a5) # 1c0010fc <__rt_io_event+0x20>
1c00a6da:	08010623          	sb	zero,140(sp)
1c00a6de:	d002                	sw	zero,32(sp)
1c00a6e0:	d202                	sw	zero,36(sp)
1c00a6e2:	a17fe0ef          	jal	ra,1c0090f8 <__rt_cluster_push_fc_event>
1c00a6e6:	4689                	li	a3,2
1c00a6e8:	00204737          	lui	a4,0x204
1c00a6ec:	08c14783          	lbu	a5,140(sp)
1c00a6f0:	0ff7f793          	andi	a5,a5,255
1c00a6f4:	f7cd                	bnez	a5,1c00a69e <__rt_io_uart_wait_pending+0x2c>
1c00a6f6:	c714                	sw	a3,8(a4)
1c00a6f8:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a6fc:	c354                	sw	a3,4(a4)
1c00a6fe:	b7fd                	j	1c00a6ec <__rt_io_uart_wait_pending+0x7a>

1c00a700 <__rt_io_stop>:
1c00a700:	1141                	addi	sp,sp,-16
1c00a702:	c422                	sw	s0,8(sp)
1c00a704:	1c001437          	lui	s0,0x1c001
1c00a708:	c606                	sw	ra,12(sp)
1c00a70a:	19840413          	addi	s0,s0,408 # 1c001198 <_rt_io_uart>
1c00a70e:	3795                	jal	1c00a672 <__rt_io_uart_wait_pending>
1c00a710:	4008                	lw	a0,0(s0)
1c00a712:	4581                	li	a1,0
1c00a714:	6b5000ef          	jal	ra,1c00b5c8 <rt_uart_close>
1c00a718:	40b2                	lw	ra,12(sp)
1c00a71a:	00042023          	sw	zero,0(s0)
1c00a71e:	4422                	lw	s0,8(sp)
1c00a720:	4501                	li	a0,0
1c00a722:	0141                	addi	sp,sp,16
1c00a724:	8082                	ret

1c00a726 <__rt_io_uart_flush.constprop.10>:
1c00a726:	7131                	addi	sp,sp,-192
1c00a728:	dd22                	sw	s0,184(sp)
1c00a72a:	df06                	sw	ra,188(sp)
1c00a72c:	db26                	sw	s1,180(sp)
1c00a72e:	d94a                	sw	s2,176(sp)
1c00a730:	d74e                	sw	s3,172(sp)
1c00a732:	d552                	sw	s4,168(sp)
1c00a734:	d356                	sw	s5,164(sp)
1c00a736:	1c001437          	lui	s0,0x1c001
1c00a73a:	19442783          	lw	a5,404(s0) # 1c001194 <__rt_io_pending_flush>
1c00a73e:	19440a13          	addi	s4,s0,404
1c00a742:	e7bd                	bnez	a5,1c00a7b0 <__rt_io_uart_flush.constprop.10+0x8a>
1c00a744:	1c0014b7          	lui	s1,0x1c001
1c00a748:	fcc48793          	addi	a5,s1,-52 # 1c000fcc <__hal_debug_struct>
1c00a74c:	4f80                	lw	s0,24(a5)
1c00a74e:	fcc48a93          	addi	s5,s1,-52
1c00a752:	c431                	beqz	s0,1c00a79e <__rt_io_uart_flush.constprop.10+0x78>
1c00a754:	3349                	jal	1c00a4d6 <rt_is_fc>
1c00a756:	1c0017b7          	lui	a5,0x1c001
1c00a75a:	1987a903          	lw	s2,408(a5) # 1c001198 <_rt_io_uart>
1c00a75e:	1c0019b7          	lui	s3,0x1c001
1c00a762:	cd29                	beqz	a0,1c00a7bc <__rt_io_uart_flush.constprop.10+0x96>
1c00a764:	1c00a5b7          	lui	a1,0x1c00a
1c00a768:	4785                	li	a5,1
1c00a76a:	fcc48613          	addi	a2,s1,-52
1c00a76e:	4e858593          	addi	a1,a1,1256 # 1c00a4e8 <__rt_io_end_of_flush>
1c00a772:	4501                	li	a0,0
1c00a774:	00fa2023          	sw	a5,0(s4)
1c00a778:	ce4ff0ef          	jal	ra,1c009c5c <rt_event_get>
1c00a77c:	00492583          	lw	a1,4(s2)
1c00a780:	87aa                	mv	a5,a0
1c00a782:	4701                	li	a4,0
1c00a784:	0586                	slli	a1,a1,0x1
1c00a786:	86a2                	mv	a3,s0
1c00a788:	fe898613          	addi	a2,s3,-24 # 1c000fe8 <__hal_debug_struct+0x1c>
1c00a78c:	0585                	addi	a1,a1,1
1c00a78e:	4501                	li	a0,0
1c00a790:	b75ff0ef          	jal	ra,1c00a304 <rt_periph_copy>
1c00a794:	3569                	jal	1c00a61e <__rt_io_unlock>
1c00a796:	000a2783          	lw	a5,0(s4)
1c00a79a:	ef99                	bnez	a5,1c00a7b8 <__rt_io_uart_flush.constprop.10+0x92>
1c00a79c:	353d                	jal	1c00a5ca <__rt_io_lock>
1c00a79e:	50fa                	lw	ra,188(sp)
1c00a7a0:	546a                	lw	s0,184(sp)
1c00a7a2:	54da                	lw	s1,180(sp)
1c00a7a4:	594a                	lw	s2,176(sp)
1c00a7a6:	59ba                	lw	s3,172(sp)
1c00a7a8:	5a2a                	lw	s4,168(sp)
1c00a7aa:	5a9a                	lw	s5,164(sp)
1c00a7ac:	6129                	addi	sp,sp,192
1c00a7ae:	8082                	ret
1c00a7b0:	35bd                	jal	1c00a61e <__rt_io_unlock>
1c00a7b2:	3bd5                	jal	1c00a5a6 <rt_event_execute.isra.2.constprop.11>
1c00a7b4:	3d19                	jal	1c00a5ca <__rt_io_lock>
1c00a7b6:	b751                	j	1c00a73a <__rt_io_uart_flush.constprop.10+0x14>
1c00a7b8:	33fd                	jal	1c00a5a6 <rt_event_execute.isra.2.constprop.11>
1c00a7ba:	bff1                	j	1c00a796 <__rt_io_uart_flush.constprop.10+0x70>
1c00a7bc:	0054                	addi	a3,sp,4
1c00a7be:	8622                	mv	a2,s0
1c00a7c0:	fe898593          	addi	a1,s3,-24
1c00a7c4:	854a                	mv	a0,s2
1c00a7c6:	64d000ef          	jal	ra,1c00b612 <rt_uart_cluster_write>
1c00a7ca:	4689                	li	a3,2
1c00a7cc:	00204737          	lui	a4,0x204
1c00a7d0:	09c14783          	lbu	a5,156(sp)
1c00a7d4:	0ff7f793          	andi	a5,a5,255
1c00a7d8:	c781                	beqz	a5,1c00a7e0 <__rt_io_uart_flush.constprop.10+0xba>
1c00a7da:	000aac23          	sw	zero,24(s5)
1c00a7de:	b7c1                	j	1c00a79e <__rt_io_uart_flush.constprop.10+0x78>
1c00a7e0:	c714                	sw	a3,8(a4)
1c00a7e2:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6050>
1c00a7e6:	c354                	sw	a3,4(a4)
1c00a7e8:	b7e5                	j	1c00a7d0 <__rt_io_uart_flush.constprop.10+0xaa>

1c00a7ea <memset>:
1c00a7ea:	962a                	add	a2,a2,a0
1c00a7ec:	87aa                	mv	a5,a0
1c00a7ee:	00c79363          	bne	a5,a2,1c00a7f4 <memset+0xa>
1c00a7f2:	8082                	ret
1c00a7f4:	0785                	addi	a5,a5,1
1c00a7f6:	feb78fa3          	sb	a1,-1(a5)
1c00a7fa:	bfd5                	j	1c00a7ee <memset+0x4>

1c00a7fc <memcpy>:
1c00a7fc:	962a                	add	a2,a2,a0
1c00a7fe:	87aa                	mv	a5,a0
1c00a800:	00c79363          	bne	a5,a2,1c00a806 <memcpy+0xa>
1c00a804:	8082                	ret
1c00a806:	0585                	addi	a1,a1,1
1c00a808:	fff5c703          	lbu	a4,-1(a1)
1c00a80c:	0785                	addi	a5,a5,1
1c00a80e:	fee78fa3          	sb	a4,-1(a5)
1c00a812:	b7fd                	j	1c00a800 <memcpy+0x4>

1c00a814 <memmove>:
1c00a814:	40b507b3          	sub	a5,a0,a1
1c00a818:	00c7e763          	bltu	a5,a2,1c00a826 <memmove+0x12>
1c00a81c:	962e                	add	a2,a2,a1
1c00a81e:	87aa                	mv	a5,a0
1c00a820:	00c59e63          	bne	a1,a2,1c00a83c <memmove+0x28>
1c00a824:	8082                	ret
1c00a826:	167d                	addi	a2,a2,-1
1c00a828:	00c587b3          	add	a5,a1,a2
1c00a82c:	0007c703          	lbu	a4,0(a5)
1c00a830:	00c507b3          	add	a5,a0,a2
1c00a834:	00e78023          	sb	a4,0(a5)
1c00a838:	f67d                	bnez	a2,1c00a826 <memmove+0x12>
1c00a83a:	8082                	ret
1c00a83c:	0005c703          	lbu	a4,0(a1)
1c00a840:	0785                	addi	a5,a5,1
1c00a842:	0585                	addi	a1,a1,1
1c00a844:	fee78fa3          	sb	a4,-1(a5)
1c00a848:	bfe1                	j	1c00a820 <memmove+0xc>

1c00a84a <strchr>:
1c00a84a:	0ff5f593          	andi	a1,a1,255
1c00a84e:	00054783          	lbu	a5,0(a0)
1c00a852:	00b78563          	beq	a5,a1,1c00a85c <strchr+0x12>
1c00a856:	e781                	bnez	a5,1c00a85e <strchr+0x14>
1c00a858:	c191                	beqz	a1,1c00a85c <strchr+0x12>
1c00a85a:	4501                	li	a0,0
1c00a85c:	8082                	ret
1c00a85e:	0505                	addi	a0,a0,1
1c00a860:	b7fd                	j	1c00a84e <strchr+0x4>

1c00a862 <__rt_putc_debug_bridge>:
1c00a862:	1141                	addi	sp,sp,-16
1c00a864:	c422                	sw	s0,8(sp)
1c00a866:	1c001437          	lui	s0,0x1c001
1c00a86a:	c226                	sw	s1,4(sp)
1c00a86c:	c606                	sw	ra,12(sp)
1c00a86e:	84aa                	mv	s1,a0
1c00a870:	fcc40413          	addi	s0,s0,-52 # 1c000fcc <__hal_debug_struct>
1c00a874:	485c                	lw	a5,20(s0)
1c00a876:	c791                	beqz	a5,1c00a882 <__rt_putc_debug_bridge+0x20>
1c00a878:	06400513          	li	a0,100
1c00a87c:	909ff0ef          	jal	ra,1c00a184 <rt_time_wait_us>
1c00a880:	bfd5                	j	1c00a874 <__rt_putc_debug_bridge+0x12>
1c00a882:	4c1c                	lw	a5,24(s0)
1c00a884:	00178713          	addi	a4,a5,1
1c00a888:	97a2                	add	a5,a5,s0
1c00a88a:	00978e23          	sb	s1,28(a5)
1c00a88e:	cc18                	sw	a4,24(s0)
1c00a890:	4c14                	lw	a3,24(s0)
1c00a892:	08000793          	li	a5,128
1c00a896:	00f68563          	beq	a3,a5,1c00a8a0 <__rt_putc_debug_bridge+0x3e>
1c00a89a:	47a9                	li	a5,10
1c00a89c:	00f49663          	bne	s1,a5,1c00a8a8 <__rt_putc_debug_bridge+0x46>
1c00a8a0:	c701                	beqz	a4,1c00a8a8 <__rt_putc_debug_bridge+0x46>
1c00a8a2:	c858                	sw	a4,20(s0)
1c00a8a4:	00042c23          	sw	zero,24(s0)
1c00a8a8:	4c1c                	lw	a5,24(s0)
1c00a8aa:	e799                	bnez	a5,1c00a8b8 <__rt_putc_debug_bridge+0x56>
1c00a8ac:	4422                	lw	s0,8(sp)
1c00a8ae:	40b2                	lw	ra,12(sp)
1c00a8b0:	4492                	lw	s1,4(sp)
1c00a8b2:	0141                	addi	sp,sp,16
1c00a8b4:	948ff06f          	j	1c0099fc <__rt_bridge_printf_flush>
1c00a8b8:	40b2                	lw	ra,12(sp)
1c00a8ba:	4422                	lw	s0,8(sp)
1c00a8bc:	4492                	lw	s1,4(sp)
1c00a8be:	0141                	addi	sp,sp,16
1c00a8c0:	8082                	ret

1c00a8c2 <__rt_putc_uart>:
1c00a8c2:	1101                	addi	sp,sp,-32
1c00a8c4:	c62a                	sw	a0,12(sp)
1c00a8c6:	ce06                	sw	ra,28(sp)
1c00a8c8:	336d                	jal	1c00a672 <__rt_io_uart_wait_pending>
1c00a8ca:	1c0017b7          	lui	a5,0x1c001
1c00a8ce:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__hal_debug_struct>
1c00a8d2:	4f94                	lw	a3,24(a5)
1c00a8d4:	4532                	lw	a0,12(sp)
1c00a8d6:	00168713          	addi	a4,a3,1
1c00a8da:	cf98                	sw	a4,24(a5)
1c00a8dc:	97b6                	add	a5,a5,a3
1c00a8de:	00a78e23          	sb	a0,28(a5)
1c00a8e2:	08000793          	li	a5,128
1c00a8e6:	00f70563          	beq	a4,a5,1c00a8f0 <__rt_putc_uart+0x2e>
1c00a8ea:	47a9                	li	a5,10
1c00a8ec:	00f51563          	bne	a0,a5,1c00a8f6 <__rt_putc_uart+0x34>
1c00a8f0:	40f2                	lw	ra,28(sp)
1c00a8f2:	6105                	addi	sp,sp,32
1c00a8f4:	bd0d                	j	1c00a726 <__rt_io_uart_flush.constprop.10>
1c00a8f6:	40f2                	lw	ra,28(sp)
1c00a8f8:	6105                	addi	sp,sp,32
1c00a8fa:	8082                	ret

1c00a8fc <tfp_putc.isra.8>:
1c00a8fc:	1c0017b7          	lui	a5,0x1c001
1c00a900:	1987a783          	lw	a5,408(a5) # 1c001198 <_rt_io_uart>
1c00a904:	c391                	beqz	a5,1c00a908 <tfp_putc.isra.8+0xc>
1c00a906:	bf75                	j	1c00a8c2 <__rt_putc_uart>
1c00a908:	1c0017b7          	lui	a5,0x1c001
1c00a90c:	fdc7a783          	lw	a5,-36(a5) # 1c000fdc <__hal_debug_struct+0x10>
1c00a910:	c395                	beqz	a5,1c00a934 <tfp_putc.isra.8+0x38>
1c00a912:	6689                	lui	a3,0x2
1c00a914:	f14027f3          	csrr	a5,mhartid
1c00a918:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a91c:	00379713          	slli	a4,a5,0x3
1c00a920:	078a                	slli	a5,a5,0x2
1c00a922:	0ff77713          	andi	a4,a4,255
1c00a926:	8ff5                	and	a5,a5,a3
1c00a928:	97ba                	add	a5,a5,a4
1c00a92a:	1a10f737          	lui	a4,0x1a10f
1c00a92e:	97ba                	add	a5,a5,a4
1c00a930:	c388                	sw	a0,0(a5)
1c00a932:	8082                	ret
1c00a934:	b73d                	j	1c00a862 <__rt_putc_debug_bridge>

1c00a936 <puts>:
1c00a936:	1141                	addi	sp,sp,-16
1c00a938:	c422                	sw	s0,8(sp)
1c00a93a:	c606                	sw	ra,12(sp)
1c00a93c:	842a                	mv	s0,a0
1c00a93e:	3171                	jal	1c00a5ca <__rt_io_lock>
1c00a940:	00044503          	lbu	a0,0(s0)
1c00a944:	c501                	beqz	a0,1c00a94c <puts+0x16>
1c00a946:	3f5d                	jal	1c00a8fc <tfp_putc.isra.8>
1c00a948:	0405                	addi	s0,s0,1
1c00a94a:	bfdd                	j	1c00a940 <puts+0xa>
1c00a94c:	4529                	li	a0,10
1c00a94e:	377d                	jal	1c00a8fc <tfp_putc.isra.8>
1c00a950:	31f9                	jal	1c00a61e <__rt_io_unlock>
1c00a952:	40b2                	lw	ra,12(sp)
1c00a954:	4422                	lw	s0,8(sp)
1c00a956:	4501                	li	a0,0
1c00a958:	0141                	addi	sp,sp,16
1c00a95a:	8082                	ret

1c00a95c <fputc_locked>:
1c00a95c:	1141                	addi	sp,sp,-16
1c00a95e:	c422                	sw	s0,8(sp)
1c00a960:	842a                	mv	s0,a0
1c00a962:	0ff57513          	andi	a0,a0,255
1c00a966:	c606                	sw	ra,12(sp)
1c00a968:	3f51                	jal	1c00a8fc <tfp_putc.isra.8>
1c00a96a:	8522                	mv	a0,s0
1c00a96c:	40b2                	lw	ra,12(sp)
1c00a96e:	4422                	lw	s0,8(sp)
1c00a970:	0141                	addi	sp,sp,16
1c00a972:	8082                	ret

1c00a974 <_prf_locked>:
1c00a974:	1101                	addi	sp,sp,-32
1c00a976:	ce06                	sw	ra,28(sp)
1c00a978:	c02a                	sw	a0,0(sp)
1c00a97a:	c62e                	sw	a1,12(sp)
1c00a97c:	c432                	sw	a2,8(sp)
1c00a97e:	c236                	sw	a3,4(sp)
1c00a980:	31a9                	jal	1c00a5ca <__rt_io_lock>
1c00a982:	4692                	lw	a3,4(sp)
1c00a984:	4622                	lw	a2,8(sp)
1c00a986:	45b2                	lw	a1,12(sp)
1c00a988:	4502                	lw	a0,0(sp)
1c00a98a:	2ae9                	jal	1c00ab64 <_prf>
1c00a98c:	c02a                	sw	a0,0(sp)
1c00a98e:	3941                	jal	1c00a61e <__rt_io_unlock>
1c00a990:	40f2                	lw	ra,28(sp)
1c00a992:	4502                	lw	a0,0(sp)
1c00a994:	6105                	addi	sp,sp,32
1c00a996:	8082                	ret

1c00a998 <exit>:
1c00a998:	1141                	addi	sp,sp,-16
1c00a99a:	c606                	sw	ra,12(sp)
1c00a99c:	c422                	sw	s0,8(sp)
1c00a99e:	842a                	mv	s0,a0
1c00a9a0:	85cff0ef          	jal	ra,1c0099fc <__rt_bridge_printf_flush>
1c00a9a4:	80000537          	lui	a0,0x80000
1c00a9a8:	1c0017b7          	lui	a5,0x1c001
1c00a9ac:	8c49                	or	s0,s0,a0
1c00a9ae:	fcc78793          	addi	a5,a5,-52 # 1c000fcc <__hal_debug_struct>
1c00a9b2:	c7c0                	sw	s0,12(a5)
1c00a9b4:	818ff0ef          	jal	ra,1c0099cc <__rt_bridge_send_notif>
1c00a9b8:	1a1047b7          	lui	a5,0x1a104
1c00a9bc:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa10208c>
1c00a9c0:	a001                	j	1c00a9c0 <exit+0x28>

1c00a9c2 <abort>:
1c00a9c2:	1141                	addi	sp,sp,-16
1c00a9c4:	557d                	li	a0,-1
1c00a9c6:	c606                	sw	ra,12(sp)
1c00a9c8:	3fc1                	jal	1c00a998 <exit>

1c00a9ca <__rt_io_init>:
1c00a9ca:	1c0017b7          	lui	a5,0x1c001
1c00a9ce:	fac78793          	addi	a5,a5,-84 # 1c000fac <__rt_io_fc_lock>
1c00a9d2:	0007a223          	sw	zero,4(a5)
1c00a9d6:	0007a023          	sw	zero,0(a5)
1c00a9da:	0007a623          	sw	zero,12(a5)
1c00a9de:	1c0017b7          	lui	a5,0x1c001
1c00a9e2:	1807ac23          	sw	zero,408(a5) # 1c001198 <_rt_io_uart>
1c00a9e6:	1c0017b7          	lui	a5,0x1c001
1c00a9ea:	1807a823          	sw	zero,400(a5) # 1c001190 <__rt_io_event_current>
1c00a9ee:	1c0017b7          	lui	a5,0x1c001
1c00a9f2:	19c7a703          	lw	a4,412(a5) # 1c00119c <__rt_iodev>
1c00a9f6:	4785                	li	a5,1
1c00a9f8:	02f71e63          	bne	a4,a5,1c00aa34 <__rt_io_init+0x6a>
1c00a9fc:	1c00a5b7          	lui	a1,0x1c00a
1c00aa00:	1141                	addi	sp,sp,-16
1c00aa02:	4601                	li	a2,0
1c00aa04:	54858593          	addi	a1,a1,1352 # 1c00a548 <__rt_io_start>
1c00aa08:	4501                	li	a0,0
1c00aa0a:	c606                	sw	ra,12(sp)
1c00aa0c:	d09fe0ef          	jal	ra,1c009714 <__rt_cbsys_add>
1c00aa10:	1c00a5b7          	lui	a1,0x1c00a
1c00aa14:	70058593          	addi	a1,a1,1792 # 1c00a700 <__rt_io_stop>
1c00aa18:	4601                	li	a2,0
1c00aa1a:	4505                	li	a0,1
1c00aa1c:	cf9fe0ef          	jal	ra,1c009714 <__rt_cbsys_add>
1c00aa20:	40b2                	lw	ra,12(sp)
1c00aa22:	1c0017b7          	lui	a5,0x1c001
1c00aa26:	1807aa23          	sw	zero,404(a5) # 1c001194 <__rt_io_pending_flush>
1c00aa2a:	4585                	li	a1,1
1c00aa2c:	4501                	li	a0,0
1c00aa2e:	0141                	addi	sp,sp,16
1c00aa30:	9b4ff06f          	j	1c009be4 <rt_event_alloc>
1c00aa34:	8082                	ret

1c00aa36 <printf>:
1c00aa36:	7139                	addi	sp,sp,-64
1c00aa38:	d432                	sw	a2,40(sp)
1c00aa3a:	862a                	mv	a2,a0
1c00aa3c:	1c00b537          	lui	a0,0x1c00b
1c00aa40:	d22e                	sw	a1,36(sp)
1c00aa42:	d636                	sw	a3,44(sp)
1c00aa44:	4589                	li	a1,2
1c00aa46:	1054                	addi	a3,sp,36
1c00aa48:	95c50513          	addi	a0,a0,-1700 # 1c00a95c <fputc_locked>
1c00aa4c:	ce06                	sw	ra,28(sp)
1c00aa4e:	d83a                	sw	a4,48(sp)
1c00aa50:	da3e                	sw	a5,52(sp)
1c00aa52:	dc42                	sw	a6,56(sp)
1c00aa54:	de46                	sw	a7,60(sp)
1c00aa56:	c636                	sw	a3,12(sp)
1c00aa58:	3f31                	jal	1c00a974 <_prf_locked>
1c00aa5a:	40f2                	lw	ra,28(sp)
1c00aa5c:	6121                	addi	sp,sp,64
1c00aa5e:	8082                	ret

1c00aa60 <_to_x>:
1c00aa60:	872a                	mv	a4,a0
1c00aa62:	87aa                	mv	a5,a0
1c00aa64:	4325                	li	t1,9
1c00aa66:	02c5f8b3          	remu	a7,a1,a2
1c00aa6a:	02700513          	li	a0,39
1c00aa6e:	02c5d5b3          	divu	a1,a1,a2
1c00aa72:	0ff8f813          	andi	a6,a7,255
1c00aa76:	01136363          	bltu	t1,a7,1c00aa7c <_to_x+0x1c>
1c00aa7a:	4501                	li	a0,0
1c00aa7c:	03080813          	addi	a6,a6,48
1c00aa80:	0785                	addi	a5,a5,1
1c00aa82:	9542                	add	a0,a0,a6
1c00aa84:	fea78fa3          	sb	a0,-1(a5)
1c00aa88:	fdf9                	bnez	a1,1c00aa66 <_to_x+0x6>
1c00aa8a:	03000613          	li	a2,48
1c00aa8e:	40e78533          	sub	a0,a5,a4
1c00aa92:	00d54863          	blt	a0,a3,1c00aaa2 <_to_x+0x42>
1c00aa96:	00078023          	sb	zero,0(a5)
1c00aa9a:	17fd                	addi	a5,a5,-1
1c00aa9c:	00f76763          	bltu	a4,a5,1c00aaaa <_to_x+0x4a>
1c00aaa0:	8082                	ret
1c00aaa2:	0785                	addi	a5,a5,1
1c00aaa4:	fec78fa3          	sb	a2,-1(a5)
1c00aaa8:	b7dd                	j	1c00aa8e <_to_x+0x2e>
1c00aaaa:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10cfec>
1c00aaae:	0007c683          	lbu	a3,0(a5)
1c00aab2:	0705                	addi	a4,a4,1
1c00aab4:	00c78023          	sb	a2,0(a5)
1c00aab8:	fed70fa3          	sb	a3,-1(a4)
1c00aabc:	17fd                	addi	a5,a5,-1
1c00aabe:	bff9                	j	1c00aa9c <_to_x+0x3c>

1c00aac0 <_rlrshift>:
1c00aac0:	411c                	lw	a5,0(a0)
1c00aac2:	4154                	lw	a3,4(a0)
1c00aac4:	0017f713          	andi	a4,a5,1
1c00aac8:	01f69613          	slli	a2,a3,0x1f
1c00aacc:	8385                	srli	a5,a5,0x1
1c00aace:	8fd1                	or	a5,a5,a2
1c00aad0:	97ba                	add	a5,a5,a4
1c00aad2:	8285                	srli	a3,a3,0x1
1c00aad4:	00e7b733          	sltu	a4,a5,a4
1c00aad8:	9736                	add	a4,a4,a3
1c00aada:	c11c                	sw	a5,0(a0)
1c00aadc:	c158                	sw	a4,4(a0)
1c00aade:	8082                	ret

1c00aae0 <_ldiv5>:
1c00aae0:	4118                	lw	a4,0(a0)
1c00aae2:	4154                	lw	a3,4(a0)
1c00aae4:	4615                	li	a2,5
1c00aae6:	00270793          	addi	a5,a4,2
1c00aaea:	00e7b733          	sltu	a4,a5,a4
1c00aaee:	9736                	add	a4,a4,a3
1c00aaf0:	02c755b3          	divu	a1,a4,a2
1c00aaf4:	02b606b3          	mul	a3,a2,a1
1c00aaf8:	8f15                	sub	a4,a4,a3
1c00aafa:	01d71693          	slli	a3,a4,0x1d
1c00aafe:	0037d713          	srli	a4,a5,0x3
1c00ab02:	8f55                	or	a4,a4,a3
1c00ab04:	02c75733          	divu	a4,a4,a2
1c00ab08:	01d75693          	srli	a3,a4,0x1d
1c00ab0c:	070e                	slli	a4,a4,0x3
1c00ab0e:	95b6                	add	a1,a1,a3
1c00ab10:	02e606b3          	mul	a3,a2,a4
1c00ab14:	8f95                	sub	a5,a5,a3
1c00ab16:	02c7d7b3          	divu	a5,a5,a2
1c00ab1a:	973e                	add	a4,a4,a5
1c00ab1c:	00f737b3          	sltu	a5,a4,a5
1c00ab20:	97ae                	add	a5,a5,a1
1c00ab22:	c118                	sw	a4,0(a0)
1c00ab24:	c15c                	sw	a5,4(a0)
1c00ab26:	8082                	ret

1c00ab28 <_get_digit>:
1c00ab28:	419c                	lw	a5,0(a1)
1c00ab2a:	03000713          	li	a4,48
1c00ab2e:	02f05863          	blez	a5,1c00ab5e <_get_digit+0x36>
1c00ab32:	17fd                	addi	a5,a5,-1
1c00ab34:	4114                	lw	a3,0(a0)
1c00ab36:	c19c                	sw	a5,0(a1)
1c00ab38:	415c                	lw	a5,4(a0)
1c00ab3a:	4729                	li	a4,10
1c00ab3c:	02d70633          	mul	a2,a4,a3
1c00ab40:	02f707b3          	mul	a5,a4,a5
1c00ab44:	c110                	sw	a2,0(a0)
1c00ab46:	02d73733          	mulhu	a4,a4,a3
1c00ab4a:	100006b7          	lui	a3,0x10000
1c00ab4e:	16fd                	addi	a3,a3,-1
1c00ab50:	97ba                	add	a5,a5,a4
1c00ab52:	01c7d713          	srli	a4,a5,0x1c
1c00ab56:	8ff5                	and	a5,a5,a3
1c00ab58:	03070713          	addi	a4,a4,48
1c00ab5c:	c15c                	sw	a5,4(a0)
1c00ab5e:	0ff77513          	andi	a0,a4,255
1c00ab62:	8082                	ret

1c00ab64 <_prf>:
1c00ab64:	714d                	addi	sp,sp,-336
1c00ab66:	14912223          	sw	s1,324(sp)
1c00ab6a:	13312e23          	sw	s3,316(sp)
1c00ab6e:	13812423          	sw	s8,296(sp)
1c00ab72:	14112623          	sw	ra,332(sp)
1c00ab76:	14812423          	sw	s0,328(sp)
1c00ab7a:	15212023          	sw	s2,320(sp)
1c00ab7e:	13412c23          	sw	s4,312(sp)
1c00ab82:	13512a23          	sw	s5,308(sp)
1c00ab86:	13612823          	sw	s6,304(sp)
1c00ab8a:	13712623          	sw	s7,300(sp)
1c00ab8e:	13912223          	sw	s9,292(sp)
1c00ab92:	13a12023          	sw	s10,288(sp)
1c00ab96:	11b12e23          	sw	s11,284(sp)
1c00ab9a:	cc2a                	sw	a0,24(sp)
1c00ab9c:	ce2e                	sw	a1,28(sp)
1c00ab9e:	84b2                	mv	s1,a2
1c00aba0:	8c36                	mv	s8,a3
1c00aba2:	4981                	li	s3,0
1c00aba4:	0004c503          	lbu	a0,0(s1)
1c00aba8:	00148b93          	addi	s7,s1,1
1c00abac:	cd01                	beqz	a0,1c00abc4 <_prf+0x60>
1c00abae:	02500793          	li	a5,37
1c00abb2:	14f50a63          	beq	a0,a5,1c00ad06 <_prf+0x1a2>
1c00abb6:	45f2                	lw	a1,28(sp)
1c00abb8:	4762                	lw	a4,24(sp)
1c00abba:	9702                	jalr	a4
1c00abbc:	57fd                	li	a5,-1
1c00abbe:	04f51063          	bne	a0,a5,1c00abfe <_prf+0x9a>
1c00abc2:	59fd                	li	s3,-1
1c00abc4:	14c12083          	lw	ra,332(sp)
1c00abc8:	14812403          	lw	s0,328(sp)
1c00abcc:	854e                	mv	a0,s3
1c00abce:	14412483          	lw	s1,324(sp)
1c00abd2:	14012903          	lw	s2,320(sp)
1c00abd6:	13c12983          	lw	s3,316(sp)
1c00abda:	13812a03          	lw	s4,312(sp)
1c00abde:	13412a83          	lw	s5,308(sp)
1c00abe2:	13012b03          	lw	s6,304(sp)
1c00abe6:	12c12b83          	lw	s7,300(sp)
1c00abea:	12812c03          	lw	s8,296(sp)
1c00abee:	12412c83          	lw	s9,292(sp)
1c00abf2:	12012d03          	lw	s10,288(sp)
1c00abf6:	11c12d83          	lw	s11,284(sp)
1c00abfa:	6171                	addi	sp,sp,336
1c00abfc:	8082                	ret
1c00abfe:	0985                	addi	s3,s3,1
1c00ac00:	8a62                	mv	s4,s8
1c00ac02:	84de                	mv	s1,s7
1c00ac04:	8c52                	mv	s8,s4
1c00ac06:	bf79                	j	1c00aba4 <_prf+0x40>
1c00ac08:	0f2a8663          	beq	s5,s2,1c00acf4 <_prf+0x190>
1c00ac0c:	0d596963          	bltu	s2,s5,1c00acde <_prf+0x17a>
1c00ac10:	fa0a8ae3          	beqz	s5,1c00abc4 <_prf+0x60>
1c00ac14:	0dba8e63          	beq	s5,s11,1c00acf0 <_prf+0x18c>
1c00ac18:	8ba6                	mv	s7,s1
1c00ac1a:	001b8493          	addi	s1,s7,1
1c00ac1e:	fff4ca83          	lbu	s5,-1(s1)
1c00ac22:	1c0007b7          	lui	a5,0x1c000
1c00ac26:	65878513          	addi	a0,a5,1624 # 1c000658 <__DTOR_END__+0x36c>
1c00ac2a:	85d6                	mv	a1,s5
1c00ac2c:	c1fff0ef          	jal	ra,1c00a84a <strchr>
1c00ac30:	fd61                	bnez	a0,1c00ac08 <_prf+0xa4>
1c00ac32:	02a00693          	li	a3,42
1c00ac36:	0eda9a63          	bne	s5,a3,1c00ad2a <_prf+0x1c6>
1c00ac3a:	000c2903          	lw	s2,0(s8)
1c00ac3e:	004c0693          	addi	a3,s8,4
1c00ac42:	00095663          	bgez	s2,1c00ac4e <_prf+0xea>
1c00ac46:	4705                	li	a4,1
1c00ac48:	41200933          	neg	s2,s2
1c00ac4c:	c63a                	sw	a4,12(sp)
1c00ac4e:	0004ca83          	lbu	s5,0(s1)
1c00ac52:	8c36                	mv	s8,a3
1c00ac54:	002b8493          	addi	s1,s7,2
1c00ac58:	0c800713          	li	a4,200
1c00ac5c:	01277463          	bleu	s2,a4,1c00ac64 <_prf+0x100>
1c00ac60:	0c800913          	li	s2,200
1c00ac64:	02e00693          	li	a3,46
1c00ac68:	5d7d                	li	s10,-1
1c00ac6a:	02da9463          	bne	s5,a3,1c00ac92 <_prf+0x12e>
1c00ac6e:	0004c703          	lbu	a4,0(s1)
1c00ac72:	02a00793          	li	a5,42
1c00ac76:	10f71063          	bne	a4,a5,1c00ad76 <_prf+0x212>
1c00ac7a:	000c2d03          	lw	s10,0(s8)
1c00ac7e:	0485                	addi	s1,s1,1
1c00ac80:	0c11                	addi	s8,s8,4
1c00ac82:	0c800793          	li	a5,200
1c00ac86:	01a7d363          	ble	s10,a5,1c00ac8c <_prf+0x128>
1c00ac8a:	5d7d                	li	s10,-1
1c00ac8c:	0004ca83          	lbu	s5,0(s1)
1c00ac90:	0485                	addi	s1,s1,1
1c00ac92:	1c0007b7          	lui	a5,0x1c000
1c00ac96:	85d6                	mv	a1,s5
1c00ac98:	66078513          	addi	a0,a5,1632 # 1c000660 <__DTOR_END__+0x374>
1c00ac9c:	bafff0ef          	jal	ra,1c00a84a <strchr>
1c00aca0:	c501                	beqz	a0,1c00aca8 <_prf+0x144>
1c00aca2:	0004ca83          	lbu	s5,0(s1)
1c00aca6:	0485                	addi	s1,s1,1
1c00aca8:	06700693          	li	a3,103
1c00acac:	1356c263          	blt	a3,s5,1c00add0 <_prf+0x26c>
1c00acb0:	06500693          	li	a3,101
1c00acb4:	1edadd63          	ble	a3,s5,1c00aeae <_prf+0x34a>
1c00acb8:	04700693          	li	a3,71
1c00acbc:	0d56c163          	blt	a3,s5,1c00ad7e <_prf+0x21a>
1c00acc0:	04500693          	li	a3,69
1c00acc4:	1edad563          	ble	a3,s5,1c00aeae <_prf+0x34a>
1c00acc8:	ee0a8ee3          	beqz	s5,1c00abc4 <_prf+0x60>
1c00accc:	02500713          	li	a4,37
1c00acd0:	68ea8263          	beq	s5,a4,1c00b354 <_prf+0x7f0>
1c00acd4:	0c800713          	li	a4,200
1c00acd8:	69575763          	ble	s5,a4,1c00b366 <_prf+0x802>
1c00acdc:	b5dd                	j	1c00abc2 <_prf+0x5e>
1c00acde:	034a8163          	beq	s5,s4,1c00ad00 <_prf+0x19c>
1c00ace2:	016a8b63          	beq	s5,s6,1c00acf8 <_prf+0x194>
1c00ace6:	f3aa99e3          	bne	s5,s10,1c00ac18 <_prf+0xb4>
1c00acea:	4785                	li	a5,1
1c00acec:	ca3e                	sw	a5,20(sp)
1c00acee:	b72d                	j	1c00ac18 <_prf+0xb4>
1c00acf0:	4405                	li	s0,1
1c00acf2:	b71d                	j	1c00ac18 <_prf+0xb4>
1c00acf4:	4c85                	li	s9,1
1c00acf6:	b70d                	j	1c00ac18 <_prf+0xb4>
1c00acf8:	03000713          	li	a4,48
1c00acfc:	c83a                	sw	a4,16(sp)
1c00acfe:	bf29                	j	1c00ac18 <_prf+0xb4>
1c00ad00:	4785                	li	a5,1
1c00ad02:	c63e                	sw	a5,12(sp)
1c00ad04:	bf11                	j	1c00ac18 <_prf+0xb4>
1c00ad06:	02000713          	li	a4,32
1c00ad0a:	c83a                	sw	a4,16(sp)
1c00ad0c:	4401                	li	s0,0
1c00ad0e:	ca02                	sw	zero,20(sp)
1c00ad10:	c602                	sw	zero,12(sp)
1c00ad12:	4c81                	li	s9,0
1c00ad14:	02300913          	li	s2,35
1c00ad18:	02d00a13          	li	s4,45
1c00ad1c:	03000b13          	li	s6,48
1c00ad20:	02b00d13          	li	s10,43
1c00ad24:	02000d93          	li	s11,32
1c00ad28:	bdcd                	j	1c00ac1a <_prf+0xb6>
1c00ad2a:	fd0a8693          	addi	a3,s5,-48
1c00ad2e:	4625                	li	a2,9
1c00ad30:	4901                	li	s2,0
1c00ad32:	45a9                	li	a1,10
1c00ad34:	f2d662e3          	bltu	a2,a3,1c00ac58 <_prf+0xf4>
1c00ad38:	000bc683          	lbu	a3,0(s7)
1c00ad3c:	001b8493          	addi	s1,s7,1
1c00ad40:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xfff1fe4>
1c00ad44:	8ab6                	mv	s5,a3
1c00ad46:	f0e669e3          	bltu	a2,a4,1c00ac58 <_prf+0xf4>
1c00ad4a:	02b90933          	mul	s2,s2,a1
1c00ad4e:	8ba6                	mv	s7,s1
1c00ad50:	9936                	add	s2,s2,a3
1c00ad52:	fd090913          	addi	s2,s2,-48
1c00ad56:	b7cd                	j	1c00ad38 <_prf+0x1d4>
1c00ad58:	02ad0733          	mul	a4,s10,a0
1c00ad5c:	84ae                	mv	s1,a1
1c00ad5e:	973e                	add	a4,a4,a5
1c00ad60:	fd070d13          	addi	s10,a4,-48
1c00ad64:	0004c783          	lbu	a5,0(s1)
1c00ad68:	00148593          	addi	a1,s1,1
1c00ad6c:	fd078613          	addi	a2,a5,-48
1c00ad70:	fec6f4e3          	bleu	a2,a3,1c00ad58 <_prf+0x1f4>
1c00ad74:	b739                	j	1c00ac82 <_prf+0x11e>
1c00ad76:	4d01                	li	s10,0
1c00ad78:	46a5                	li	a3,9
1c00ad7a:	4529                	li	a0,10
1c00ad7c:	b7e5                	j	1c00ad64 <_prf+0x200>
1c00ad7e:	06300693          	li	a3,99
1c00ad82:	0cda8b63          	beq	s5,a3,1c00ae58 <_prf+0x2f4>
1c00ad86:	0756c563          	blt	a3,s5,1c00adf0 <_prf+0x28c>
1c00ad8a:	05800693          	li	a3,88
1c00ad8e:	f4da93e3          	bne	s5,a3,1c00acd4 <_prf+0x170>
1c00ad92:	04410b93          	addi	s7,sp,68
1c00ad96:	004c0a13          	addi	s4,s8,4
1c00ad9a:	000c2583          	lw	a1,0(s8)
1c00ad9e:	845e                	mv	s0,s7
1c00ada0:	000c8963          	beqz	s9,1c00adb2 <_prf+0x24e>
1c00ada4:	76e1                	lui	a3,0xffff8
1c00ada6:	8306c693          	xori	a3,a3,-2000
1c00adaa:	04d11223          	sh	a3,68(sp)
1c00adae:	04610413          	addi	s0,sp,70
1c00adb2:	86ea                	mv	a3,s10
1c00adb4:	4641                	li	a2,16
1c00adb6:	8522                	mv	a0,s0
1c00adb8:	3165                	jal	1c00aa60 <_to_x>
1c00adba:	05800693          	li	a3,88
1c00adbe:	58da8863          	beq	s5,a3,1c00b34e <_prf+0x7ea>
1c00adc2:	41740433          	sub	s0,s0,s7
1c00adc6:	9522                	add	a0,a0,s0
1c00adc8:	01903433          	snez	s0,s9
1c00adcc:	0406                	slli	s0,s0,0x1
1c00adce:	a8c9                	j	1c00aea0 <_prf+0x33c>
1c00add0:	07000693          	li	a3,112
1c00add4:	50da8163          	beq	s5,a3,1c00b2d6 <_prf+0x772>
1c00add8:	0556c163          	blt	a3,s5,1c00ae1a <_prf+0x2b6>
1c00addc:	06e00693          	li	a3,110
1c00ade0:	46da8b63          	beq	s5,a3,1c00b256 <_prf+0x6f2>
1c00ade4:	4956c063          	blt	a3,s5,1c00b264 <_prf+0x700>
1c00ade8:	06900693          	li	a3,105
1c00adec:	eeda94e3          	bne	s5,a3,1c00acd4 <_prf+0x170>
1c00adf0:	000c2a83          	lw	s5,0(s8)
1c00adf4:	004c0a13          	addi	s4,s8,4
1c00adf8:	04410b13          	addi	s6,sp,68
1c00adfc:	060ad963          	bgez	s5,1c00ae6e <_prf+0x30a>
1c00ae00:	02d00693          	li	a3,45
1c00ae04:	04d10223          	sb	a3,68(sp)
1c00ae08:	800006b7          	lui	a3,0x80000
1c00ae0c:	415005b3          	neg	a1,s5
1c00ae10:	06da9963          	bne	s5,a3,1c00ae82 <_prf+0x31e>
1c00ae14:	800005b7          	lui	a1,0x80000
1c00ae18:	a0ad                	j	1c00ae82 <_prf+0x31e>
1c00ae1a:	07500693          	li	a3,117
1c00ae1e:	50da8063          	beq	s5,a3,1c00b31e <_prf+0x7ba>
1c00ae22:	07800693          	li	a3,120
1c00ae26:	f6da86e3          	beq	s5,a3,1c00ad92 <_prf+0x22e>
1c00ae2a:	07300693          	li	a3,115
1c00ae2e:	eada93e3          	bne	s5,a3,1c00acd4 <_prf+0x170>
1c00ae32:	000c2583          	lw	a1,0(s8)
1c00ae36:	004c0a13          	addi	s4,s8,4
1c00ae3a:	4c81                	li	s9,0
1c00ae3c:	0c800793          	li	a5,200
1c00ae40:	019586b3          	add	a3,a1,s9
1c00ae44:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00ae48:	4a068f63          	beqz	a3,1c00b306 <_prf+0x7a2>
1c00ae4c:	0c85                	addi	s9,s9,1
1c00ae4e:	fefc99e3          	bne	s9,a5,1c00ae40 <_prf+0x2dc>
1c00ae52:	4a0d5c63          	bgez	s10,1c00b30a <_prf+0x7a6>
1c00ae56:	a97d                	j	1c00b314 <_prf+0x7b0>
1c00ae58:	000c2783          	lw	a5,0(s8)
1c00ae5c:	004c0a13          	addi	s4,s8,4
1c00ae60:	040102a3          	sb	zero,69(sp)
1c00ae64:	04f10223          	sb	a5,68(sp)
1c00ae68:	4c85                	li	s9,1
1c00ae6a:	4401                	li	s0,0
1c00ae6c:	a105                	j	1c00b28c <_prf+0x728>
1c00ae6e:	4752                	lw	a4,20(sp)
1c00ae70:	02b00693          	li	a3,43
1c00ae74:	e701                	bnez	a4,1c00ae7c <_prf+0x318>
1c00ae76:	c41d                	beqz	s0,1c00aea4 <_prf+0x340>
1c00ae78:	02000693          	li	a3,32
1c00ae7c:	04d10223          	sb	a3,68(sp)
1c00ae80:	85d6                	mv	a1,s5
1c00ae82:	04510c13          	addi	s8,sp,69
1c00ae86:	86ea                	mv	a3,s10
1c00ae88:	4629                	li	a2,10
1c00ae8a:	8562                	mv	a0,s8
1c00ae8c:	bd5ff0ef          	jal	ra,1c00aa60 <_to_x>
1c00ae90:	47d2                	lw	a5,20(sp)
1c00ae92:	9562                	add	a0,a0,s8
1c00ae94:	41650533          	sub	a0,a0,s6
1c00ae98:	eb89                	bnez	a5,1c00aeaa <_prf+0x346>
1c00ae9a:	e019                	bnez	s0,1c00aea0 <_prf+0x33c>
1c00ae9c:	01fad413          	srli	s0,s5,0x1f
1c00aea0:	57fd                	li	a5,-1
1c00aea2:	a9a1                	j	1c00b2fa <_prf+0x796>
1c00aea4:	85d6                	mv	a1,s5
1c00aea6:	8c5a                	mv	s8,s6
1c00aea8:	bff9                	j	1c00ae86 <_prf+0x322>
1c00aeaa:	4452                	lw	s0,20(sp)
1c00aeac:	bfd5                	j	1c00aea0 <_prf+0x33c>
1c00aeae:	0c1d                	addi	s8,s8,7
1c00aeb0:	ff8c7c13          	andi	s8,s8,-8
1c00aeb4:	000c2883          	lw	a7,0(s8)
1c00aeb8:	004c2303          	lw	t1,4(s8)
1c00aebc:	80000737          	lui	a4,0x80000
1c00aec0:	0158d593          	srli	a1,a7,0x15
1c00aec4:	00b31693          	slli	a3,t1,0xb
1c00aec8:	8ecd                	or	a3,a3,a1
1c00aeca:	fff74713          	not	a4,a4
1c00aece:	01435613          	srli	a2,t1,0x14
1c00aed2:	08ae                	slli	a7,a7,0xb
1c00aed4:	8ef9                	and	a3,a3,a4
1c00aed6:	7ff67613          	andi	a2,a2,2047
1c00aeda:	d846                	sw	a7,48(sp)
1c00aedc:	da36                	sw	a3,52(sp)
1c00aede:	7ff00593          	li	a1,2047
1c00aee2:	008c0a13          	addi	s4,s8,8
1c00aee6:	08b61d63          	bne	a2,a1,1c00af80 <_prf+0x41c>
1c00aeea:	00d0                	addi	a2,sp,68
1c00aeec:	8732                	mv	a4,a2
1c00aeee:	00035863          	bgez	t1,1c00aefe <_prf+0x39a>
1c00aef2:	02d00713          	li	a4,45
1c00aef6:	04e10223          	sb	a4,68(sp)
1c00aefa:	04510713          	addi	a4,sp,69
1c00aefe:	00d8e6b3          	or	a3,a7,a3
1c00af02:	fbfa8793          	addi	a5,s5,-65
1c00af06:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00af0a:	eaa1                	bnez	a3,1c00af5a <_prf+0x3f6>
1c00af0c:	46e5                	li	a3,25
1c00af0e:	02f6ee63          	bltu	a3,a5,1c00af4a <_prf+0x3e6>
1c00af12:	6795                	lui	a5,0x5
1c00af14:	e4978793          	addi	a5,a5,-439 # 4e49 <_l1_preload_size+0x2e39>
1c00af18:	00f71023          	sh	a5,0(a4)
1c00af1c:	04600793          	li	a5,70
1c00af20:	00f70123          	sb	a5,2(a4)
1c00af24:	000701a3          	sb	zero,3(a4)
1c00af28:	8d11                	sub	a0,a0,a2
1c00af2a:	47d2                	lw	a5,20(sp)
1c00af2c:	48079f63          	bnez	a5,1c00b3ca <_prf+0x866>
1c00af30:	e419                	bnez	s0,1c00af3e <_prf+0x3da>
1c00af32:	04414403          	lbu	s0,68(sp)
1c00af36:	fd340413          	addi	s0,s0,-45
1c00af3a:	00143413          	seqz	s0,s0
1c00af3e:	0c800793          	li	a5,200
1c00af42:	c8a7c0e3          	blt	a5,a0,1c00abc2 <_prf+0x5e>
1c00af46:	8caa                	mv	s9,a0
1c00af48:	a691                	j	1c00b28c <_prf+0x728>
1c00af4a:	679d                	lui	a5,0x7
1c00af4c:	e6978793          	addi	a5,a5,-407 # 6e69 <_l1_preload_size+0x4e59>
1c00af50:	00f71023          	sh	a5,0(a4)
1c00af54:	06600793          	li	a5,102
1c00af58:	b7e1                	j	1c00af20 <_prf+0x3bc>
1c00af5a:	46e5                	li	a3,25
1c00af5c:	00f6ea63          	bltu	a3,a5,1c00af70 <_prf+0x40c>
1c00af60:	6791                	lui	a5,0x4
1c00af62:	14e78793          	addi	a5,a5,334 # 414e <_l1_preload_size+0x213e>
1c00af66:	00f71023          	sh	a5,0(a4)
1c00af6a:	04e00793          	li	a5,78
1c00af6e:	bf4d                	j	1c00af20 <_prf+0x3bc>
1c00af70:	6799                	lui	a5,0x6
1c00af72:	16e78793          	addi	a5,a5,366 # 616e <_l1_preload_size+0x415e>
1c00af76:	00f71023          	sh	a5,0(a4)
1c00af7a:	06e00793          	li	a5,110
1c00af7e:	b74d                	j	1c00af20 <_prf+0x3bc>
1c00af80:	04600593          	li	a1,70
1c00af84:	00ba9463          	bne	s5,a1,1c00af8c <_prf+0x428>
1c00af88:	06600a93          	li	s5,102
1c00af8c:	011665b3          	or	a1,a2,a7
1c00af90:	8dd5                	or	a1,a1,a3
1c00af92:	c9c9                	beqz	a1,1c00b024 <_prf+0x4c0>
1c00af94:	800007b7          	lui	a5,0x80000
1c00af98:	8edd                	or	a3,a3,a5
1c00af9a:	da36                	sw	a3,52(sp)
1c00af9c:	d846                	sw	a7,48(sp)
1c00af9e:	c0260c13          	addi	s8,a2,-1022
1c00afa2:	02d00693          	li	a3,45
1c00afa6:	00034b63          	bltz	t1,1c00afbc <_prf+0x458>
1c00afaa:	4752                	lw	a4,20(sp)
1c00afac:	02b00693          	li	a3,43
1c00afb0:	e711                	bnez	a4,1c00afbc <_prf+0x458>
1c00afb2:	04410b13          	addi	s6,sp,68
1c00afb6:	c419                	beqz	s0,1c00afc4 <_prf+0x460>
1c00afb8:	02000693          	li	a3,32
1c00afbc:	04d10223          	sb	a3,68(sp)
1c00afc0:	04510b13          	addi	s6,sp,69
1c00afc4:	4b81                	li	s7,0
1c00afc6:	55f9                	li	a1,-2
1c00afc8:	06bc4363          	blt	s8,a1,1c00b02e <_prf+0x4ca>
1c00afcc:	0b804a63          	bgtz	s8,1c00b080 <_prf+0x51c>
1c00afd0:	4d91                	li	s11,4
1c00afd2:	1808                	addi	a0,sp,48
1c00afd4:	0c05                	addi	s8,s8,1
1c00afd6:	aebff0ef          	jal	ra,1c00aac0 <_rlrshift>
1c00afda:	ffbc1ce3          	bne	s8,s11,1c00afd2 <_prf+0x46e>
1c00afde:	000d5363          	bgez	s10,1c00afe4 <_prf+0x480>
1c00afe2:	4d19                	li	s10,6
1c00afe4:	fdfaf593          	andi	a1,s5,-33
1c00afe8:	04700513          	li	a0,71
1c00afec:	0ca59663          	bne	a1,a0,1c00b0b8 <_prf+0x554>
1c00aff0:	4c01                	li	s8,0
1c00aff2:	000c9463          	bnez	s9,1c00affa <_prf+0x496>
1c00aff6:	01a03c33          	snez	s8,s10
1c00affa:	55f5                	li	a1,-3
1c00affc:	00bbc663          	blt	s7,a1,1c00b008 <_prf+0x4a4>
1c00b000:	001d0593          	addi	a1,s10,1
1c00b004:	0b75df63          	ble	s7,a1,1c00b0c2 <_prf+0x55e>
1c00b008:	06700593          	li	a1,103
1c00b00c:	14ba8c63          	beq	s5,a1,1c00b164 <_prf+0x600>
1c00b010:	04500a93          	li	s5,69
1c00b014:	001d0593          	addi	a1,s10,1
1c00b018:	4541                	li	a0,16
1c00b01a:	d62a                	sw	a0,44(sp)
1c00b01c:	0ab55c63          	ble	a1,a0,1c00b0d4 <_prf+0x570>
1c00b020:	45c1                	li	a1,16
1c00b022:	a84d                	j	1c00b0d4 <_prf+0x570>
1c00b024:	4c01                	li	s8,0
1c00b026:	b751                	j	1c00afaa <_prf+0x446>
1c00b028:	1808                	addi	a0,sp,48
1c00b02a:	a97ff0ef          	jal	ra,1c00aac0 <_rlrshift>
1c00b02e:	55d2                	lw	a1,52(sp)
1c00b030:	333337b7          	lui	a5,0x33333
1c00b034:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732119a>
1c00b038:	5342                	lw	t1,48(sp)
1c00b03a:	0c05                	addi	s8,s8,1
1c00b03c:	feb7e6e3          	bltu	a5,a1,1c00b028 <_prf+0x4c4>
1c00b040:	4895                	li	a7,5
1c00b042:	02b88533          	mul	a0,a7,a1
1c00b046:	1bfd                	addi	s7,s7,-1
1c00b048:	0268b5b3          	mulhu	a1,a7,t1
1c00b04c:	026888b3          	mul	a7,a7,t1
1c00b050:	95aa                	add	a1,a1,a0
1c00b052:	da2e                	sw	a1,52(sp)
1c00b054:	4501                	li	a0,0
1c00b056:	d846                	sw	a7,48(sp)
1c00b058:	800006b7          	lui	a3,0x80000
1c00b05c:	fff6c693          	not	a3,a3
1c00b060:	00b6f663          	bleu	a1,a3,1c00b06c <_prf+0x508>
1c00b064:	d12d                	beqz	a0,1c00afc6 <_prf+0x462>
1c00b066:	d846                	sw	a7,48(sp)
1c00b068:	da2e                	sw	a1,52(sp)
1c00b06a:	bfb1                	j	1c00afc6 <_prf+0x462>
1c00b06c:	01f8d313          	srli	t1,a7,0x1f
1c00b070:	00159513          	slli	a0,a1,0x1
1c00b074:	00a365b3          	or	a1,t1,a0
1c00b078:	0886                	slli	a7,a7,0x1
1c00b07a:	1c7d                	addi	s8,s8,-1
1c00b07c:	4505                	li	a0,1
1c00b07e:	bfe9                	j	1c00b058 <_prf+0x4f4>
1c00b080:	1808                	addi	a0,sp,48
1c00b082:	a5fff0ef          	jal	ra,1c00aae0 <_ldiv5>
1c00b086:	58c2                	lw	a7,48(sp)
1c00b088:	55d2                	lw	a1,52(sp)
1c00b08a:	1c7d                	addi	s8,s8,-1
1c00b08c:	0b85                	addi	s7,s7,1
1c00b08e:	4501                	li	a0,0
1c00b090:	80000737          	lui	a4,0x80000
1c00b094:	fff74713          	not	a4,a4
1c00b098:	00b77663          	bleu	a1,a4,1c00b0a4 <_prf+0x540>
1c00b09c:	d905                	beqz	a0,1c00afcc <_prf+0x468>
1c00b09e:	d846                	sw	a7,48(sp)
1c00b0a0:	da2e                	sw	a1,52(sp)
1c00b0a2:	b72d                	j	1c00afcc <_prf+0x468>
1c00b0a4:	01f8d313          	srli	t1,a7,0x1f
1c00b0a8:	00159513          	slli	a0,a1,0x1
1c00b0ac:	00a365b3          	or	a1,t1,a0
1c00b0b0:	0886                	slli	a7,a7,0x1
1c00b0b2:	1c7d                	addi	s8,s8,-1
1c00b0b4:	4505                	li	a0,1
1c00b0b6:	bfe9                	j	1c00b090 <_prf+0x52c>
1c00b0b8:	06600593          	li	a1,102
1c00b0bc:	4c01                	li	s8,0
1c00b0be:	f4ba9be3          	bne	s5,a1,1c00b014 <_prf+0x4b0>
1c00b0c2:	01ab85b3          	add	a1,s7,s10
1c00b0c6:	06600a93          	li	s5,102
1c00b0ca:	f405d7e3          	bgez	a1,1c00b018 <_prf+0x4b4>
1c00b0ce:	45c1                	li	a1,16
1c00b0d0:	d62e                	sw	a1,44(sp)
1c00b0d2:	4581                	li	a1,0
1c00b0d4:	4301                	li	t1,0
1c00b0d6:	080003b7          	lui	t2,0x8000
1c00b0da:	dc1a                	sw	t1,56(sp)
1c00b0dc:	de1e                	sw	t2,60(sp)
1c00b0de:	5dfd                	li	s11,-1
1c00b0e0:	15fd                	addi	a1,a1,-1
1c00b0e2:	09b59463          	bne	a1,s11,1c00b16a <_prf+0x606>
1c00b0e6:	55c2                	lw	a1,48(sp)
1c00b0e8:	5562                	lw	a0,56(sp)
1c00b0ea:	58d2                	lw	a7,52(sp)
1c00b0ec:	5372                	lw	t1,60(sp)
1c00b0ee:	952e                	add	a0,a0,a1
1c00b0f0:	00b535b3          	sltu	a1,a0,a1
1c00b0f4:	989a                	add	a7,a7,t1
1c00b0f6:	95c6                	add	a1,a1,a7
1c00b0f8:	d82a                	sw	a0,48(sp)
1c00b0fa:	f0000537          	lui	a0,0xf0000
1c00b0fe:	da2e                	sw	a1,52(sp)
1c00b100:	8de9                	and	a1,a1,a0
1c00b102:	c981                	beqz	a1,1c00b112 <_prf+0x5ae>
1c00b104:	1808                	addi	a0,sp,48
1c00b106:	9dbff0ef          	jal	ra,1c00aae0 <_ldiv5>
1c00b10a:	1808                	addi	a0,sp,48
1c00b10c:	9b5ff0ef          	jal	ra,1c00aac0 <_rlrshift>
1c00b110:	0b85                	addi	s7,s7,1
1c00b112:	06600593          	li	a1,102
1c00b116:	001b0d93          	addi	s11,s6,1
1c00b11a:	08ba9663          	bne	s5,a1,1c00b1a6 <_prf+0x642>
1c00b11e:	05705f63          	blez	s7,1c00b17c <_prf+0x618>
1c00b122:	017b0db3          	add	s11,s6,s7
1c00b126:	106c                	addi	a1,sp,44
1c00b128:	1808                	addi	a0,sp,48
1c00b12a:	0b05                	addi	s6,s6,1
1c00b12c:	9fdff0ef          	jal	ra,1c00ab28 <_get_digit>
1c00b130:	feab0fa3          	sb	a0,-1(s6)
1c00b134:	ffbb19e3          	bne	s6,s11,1c00b126 <_prf+0x5c2>
1c00b138:	4b81                	li	s7,0
1c00b13a:	000c9463          	bnez	s9,1c00b142 <_prf+0x5de>
1c00b13e:	020d0063          	beqz	s10,1c00b15e <_prf+0x5fa>
1c00b142:	02e00613          	li	a2,46
1c00b146:	00cd8023          	sb	a2,0(s11)
1c00b14a:	8b6e                	mv	s6,s11
1c00b14c:	01ad8cb3          	add	s9,s11,s10
1c00b150:	03000313          	li	t1,48
1c00b154:	036c9963          	bne	s9,s6,1c00b186 <_prf+0x622>
1c00b158:	001d0713          	addi	a4,s10,1
1c00b15c:	9dba                	add	s11,s11,a4
1c00b15e:	060c1e63          	bnez	s8,1c00b1da <_prf+0x676>
1c00b162:	a8d1                	j	1c00b236 <_prf+0x6d2>
1c00b164:	06500a93          	li	s5,101
1c00b168:	b575                	j	1c00b014 <_prf+0x4b0>
1c00b16a:	1828                	addi	a0,sp,56
1c00b16c:	c42e                	sw	a1,8(sp)
1c00b16e:	973ff0ef          	jal	ra,1c00aae0 <_ldiv5>
1c00b172:	1828                	addi	a0,sp,56
1c00b174:	94dff0ef          	jal	ra,1c00aac0 <_rlrshift>
1c00b178:	45a2                	lw	a1,8(sp)
1c00b17a:	b79d                	j	1c00b0e0 <_prf+0x57c>
1c00b17c:	03000593          	li	a1,48
1c00b180:	00bb0023          	sb	a1,0(s6)
1c00b184:	bf5d                	j	1c00b13a <_prf+0x5d6>
1c00b186:	000b8763          	beqz	s7,1c00b194 <_prf+0x630>
1c00b18a:	006b00a3          	sb	t1,1(s6)
1c00b18e:	0b85                	addi	s7,s7,1
1c00b190:	0b05                	addi	s6,s6,1
1c00b192:	b7c9                	j	1c00b154 <_prf+0x5f0>
1c00b194:	106c                	addi	a1,sp,44
1c00b196:	1808                	addi	a0,sp,48
1c00b198:	c41a                	sw	t1,8(sp)
1c00b19a:	98fff0ef          	jal	ra,1c00ab28 <_get_digit>
1c00b19e:	00ab00a3          	sb	a0,1(s6)
1c00b1a2:	4322                	lw	t1,8(sp)
1c00b1a4:	b7f5                	j	1c00b190 <_prf+0x62c>
1c00b1a6:	106c                	addi	a1,sp,44
1c00b1a8:	1808                	addi	a0,sp,48
1c00b1aa:	97fff0ef          	jal	ra,1c00ab28 <_get_digit>
1c00b1ae:	00ab0023          	sb	a0,0(s6)
1c00b1b2:	03000593          	li	a1,48
1c00b1b6:	00b50363          	beq	a0,a1,1c00b1bc <_prf+0x658>
1c00b1ba:	1bfd                	addi	s7,s7,-1
1c00b1bc:	000c9463          	bnez	s9,1c00b1c4 <_prf+0x660>
1c00b1c0:	000d0b63          	beqz	s10,1c00b1d6 <_prf+0x672>
1c00b1c4:	002b0d93          	addi	s11,s6,2
1c00b1c8:	02e00593          	li	a1,46
1c00b1cc:	00bb00a3          	sb	a1,1(s6)
1c00b1d0:	9d6e                	add	s10,s10,s11
1c00b1d2:	07bd1863          	bne	s10,s11,1c00b242 <_prf+0x6de>
1c00b1d6:	000c0f63          	beqz	s8,1c00b1f4 <_prf+0x690>
1c00b1da:	03000593          	li	a1,48
1c00b1de:	fffdc603          	lbu	a2,-1(s11)
1c00b1e2:	fffd8713          	addi	a4,s11,-1
1c00b1e6:	06b60663          	beq	a2,a1,1c00b252 <_prf+0x6ee>
1c00b1ea:	02e00593          	li	a1,46
1c00b1ee:	00b61363          	bne	a2,a1,1c00b1f4 <_prf+0x690>
1c00b1f2:	8dba                	mv	s11,a4
1c00b1f4:	fdfaf713          	andi	a4,s5,-33
1c00b1f8:	04500613          	li	a2,69
1c00b1fc:	02c71d63          	bne	a4,a2,1c00b236 <_prf+0x6d2>
1c00b200:	87d6                	mv	a5,s5
1c00b202:	00fd8023          	sb	a5,0(s11)
1c00b206:	02b00793          	li	a5,43
1c00b20a:	000bd663          	bgez	s7,1c00b216 <_prf+0x6b2>
1c00b20e:	41700bb3          	neg	s7,s7
1c00b212:	02d00793          	li	a5,45
1c00b216:	00fd80a3          	sb	a5,1(s11)
1c00b21a:	47a9                	li	a5,10
1c00b21c:	02fbc733          	div	a4,s7,a5
1c00b220:	0d91                	addi	s11,s11,4
1c00b222:	02fbe6b3          	rem	a3,s7,a5
1c00b226:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b22a:	feed8f23          	sb	a4,-2(s11)
1c00b22e:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b232:	fedd8fa3          	sb	a3,-1(s11)
1c00b236:	00c8                	addi	a0,sp,68
1c00b238:	000d8023          	sb	zero,0(s11)
1c00b23c:	40ad8533          	sub	a0,s11,a0
1c00b240:	b1ed                	j	1c00af2a <_prf+0x3c6>
1c00b242:	106c                	addi	a1,sp,44
1c00b244:	1808                	addi	a0,sp,48
1c00b246:	0d85                	addi	s11,s11,1
1c00b248:	8e1ff0ef          	jal	ra,1c00ab28 <_get_digit>
1c00b24c:	fead8fa3          	sb	a0,-1(s11)
1c00b250:	b749                	j	1c00b1d2 <_prf+0x66e>
1c00b252:	8dba                	mv	s11,a4
1c00b254:	b769                	j	1c00b1de <_prf+0x67a>
1c00b256:	000c2783          	lw	a5,0(s8)
1c00b25a:	004c0a13          	addi	s4,s8,4
1c00b25e:	0137a023          	sw	s3,0(a5)
1c00b262:	b24d                	j	1c00ac04 <_prf+0xa0>
1c00b264:	004c0a13          	addi	s4,s8,4
1c00b268:	000c2583          	lw	a1,0(s8)
1c00b26c:	00dc                	addi	a5,sp,68
1c00b26e:	040c8463          	beqz	s9,1c00b2b6 <_prf+0x752>
1c00b272:	03000693          	li	a3,48
1c00b276:	04d10223          	sb	a3,68(sp)
1c00b27a:	04510513          	addi	a0,sp,69
1c00b27e:	ed8d                	bnez	a1,1c00b2b8 <_prf+0x754>
1c00b280:	040102a3          	sb	zero,69(sp)
1c00b284:	57fd                	li	a5,-1
1c00b286:	4401                	li	s0,0
1c00b288:	0efd1163          	bne	s10,a5,1c00b36a <_prf+0x806>
1c00b28c:	0f2cc363          	blt	s9,s2,1c00b372 <_prf+0x80e>
1c00b290:	8966                	mv	s2,s9
1c00b292:	00c0                	addi	s0,sp,68
1c00b294:	40898ab3          	sub	s5,s3,s0
1c00b298:	5b7d                	li	s6,-1
1c00b29a:	015409b3          	add	s3,s0,s5
1c00b29e:	960903e3          	beqz	s2,1c00ac04 <_prf+0xa0>
1c00b2a2:	45f2                	lw	a1,28(sp)
1c00b2a4:	00044503          	lbu	a0,0(s0)
1c00b2a8:	47e2                	lw	a5,24(sp)
1c00b2aa:	9782                	jalr	a5
1c00b2ac:	91650be3          	beq	a0,s6,1c00abc2 <_prf+0x5e>
1c00b2b0:	197d                	addi	s2,s2,-1
1c00b2b2:	0405                	addi	s0,s0,1
1c00b2b4:	b7dd                	j	1c00b29a <_prf+0x736>
1c00b2b6:	853e                	mv	a0,a5
1c00b2b8:	86ea                	mv	a3,s10
1c00b2ba:	4621                	li	a2,8
1c00b2bc:	40f50433          	sub	s0,a0,a5
1c00b2c0:	fa0ff0ef          	jal	ra,1c00aa60 <_to_x>
1c00b2c4:	9522                	add	a0,a0,s0
1c00b2c6:	57fd                	li	a5,-1
1c00b2c8:	4401                	li	s0,0
1c00b2ca:	c6fd0ae3          	beq	s10,a5,1c00af3e <_prf+0x3da>
1c00b2ce:	02000793          	li	a5,32
1c00b2d2:	c83e                	sw	a5,16(sp)
1c00b2d4:	b1ad                	j	1c00af3e <_prf+0x3da>
1c00b2d6:	000c2583          	lw	a1,0(s8)
1c00b2da:	77e1                	lui	a5,0xffff8
1c00b2dc:	8307c793          	xori	a5,a5,-2000
1c00b2e0:	46a1                	li	a3,8
1c00b2e2:	4641                	li	a2,16
1c00b2e4:	04610513          	addi	a0,sp,70
1c00b2e8:	04f11223          	sh	a5,68(sp)
1c00b2ec:	f74ff0ef          	jal	ra,1c00aa60 <_to_x>
1c00b2f0:	004c0a13          	addi	s4,s8,4
1c00b2f4:	0509                	addi	a0,a0,2
1c00b2f6:	57fd                	li	a5,-1
1c00b2f8:	4401                	li	s0,0
1c00b2fa:	c4fd02e3          	beq	s10,a5,1c00af3e <_prf+0x3da>
1c00b2fe:	02000713          	li	a4,32
1c00b302:	c83a                	sw	a4,16(sp)
1c00b304:	b92d                	j	1c00af3e <_prf+0x3da>
1c00b306:	000d4563          	bltz	s10,1c00b310 <_prf+0x7ac>
1c00b30a:	019d5363          	ble	s9,s10,1c00b310 <_prf+0x7ac>
1c00b30e:	8cea                	mv	s9,s10
1c00b310:	8e0c8ae3          	beqz	s9,1c00ac04 <_prf+0xa0>
1c00b314:	8666                	mv	a2,s9
1c00b316:	00c8                	addi	a0,sp,68
1c00b318:	ce4ff0ef          	jal	ra,1c00a7fc <memcpy>
1c00b31c:	b6b9                	j	1c00ae6a <_prf+0x306>
1c00b31e:	000c2583          	lw	a1,0(s8)
1c00b322:	86ea                	mv	a3,s10
1c00b324:	4629                	li	a2,10
1c00b326:	00c8                	addi	a0,sp,68
1c00b328:	004c0a13          	addi	s4,s8,4
1c00b32c:	f34ff0ef          	jal	ra,1c00aa60 <_to_x>
1c00b330:	bf59                	j	1c00b2c6 <_prf+0x762>
1c00b332:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b336:	0ff67613          	andi	a2,a2,255
1c00b33a:	00c5e563          	bltu	a1,a2,1c00b344 <_prf+0x7e0>
1c00b33e:	1781                	addi	a5,a5,-32
1c00b340:	00f68023          	sb	a5,0(a3)
1c00b344:	0685                	addi	a3,a3,1
1c00b346:	0006c783          	lbu	a5,0(a3)
1c00b34a:	f7e5                	bnez	a5,1c00b332 <_prf+0x7ce>
1c00b34c:	bc9d                	j	1c00adc2 <_prf+0x25e>
1c00b34e:	86de                	mv	a3,s7
1c00b350:	45e5                	li	a1,25
1c00b352:	bfd5                	j	1c00b346 <_prf+0x7e2>
1c00b354:	45f2                	lw	a1,28(sp)
1c00b356:	4762                	lw	a4,24(sp)
1c00b358:	02500513          	li	a0,37
1c00b35c:	9702                	jalr	a4
1c00b35e:	57fd                	li	a5,-1
1c00b360:	86f501e3          	beq	a0,a5,1c00abc2 <_prf+0x5e>
1c00b364:	0985                	addi	s3,s3,1
1c00b366:	8a62                	mv	s4,s8
1c00b368:	b871                	j	1c00ac04 <_prf+0xa0>
1c00b36a:	02000793          	li	a5,32
1c00b36e:	c83e                	sw	a5,16(sp)
1c00b370:	bf31                	j	1c00b28c <_prf+0x728>
1c00b372:	4732                	lw	a4,12(sp)
1c00b374:	cf01                	beqz	a4,1c00b38c <_prf+0x828>
1c00b376:	02000713          	li	a4,32
1c00b37a:	00d4                	addi	a3,sp,68
1c00b37c:	019687b3          	add	a5,a3,s9
1c00b380:	00e78023          	sb	a4,0(a5)
1c00b384:	0c85                	addi	s9,s9,1
1c00b386:	ff991ae3          	bne	s2,s9,1c00b37a <_prf+0x816>
1c00b38a:	b721                	j	1c00b292 <_prf+0x72e>
1c00b38c:	00cc                	addi	a1,sp,68
1c00b38e:	41990bb3          	sub	s7,s2,s9
1c00b392:	001c8613          	addi	a2,s9,1
1c00b396:	01758533          	add	a0,a1,s7
1c00b39a:	c7aff0ef          	jal	ra,1c00a814 <memmove>
1c00b39e:	4742                	lw	a4,16(sp)
1c00b3a0:	02000793          	li	a5,32
1c00b3a4:	00f70363          	beq	a4,a5,1c00b3aa <_prf+0x846>
1c00b3a8:	c622                	sw	s0,12(sp)
1c00b3aa:	47b2                	lw	a5,12(sp)
1c00b3ac:	9bbe                	add	s7,s7,a5
1c00b3ae:	4732                	lw	a4,12(sp)
1c00b3b0:	ef7751e3          	ble	s7,a4,1c00b292 <_prf+0x72e>
1c00b3b4:	4732                	lw	a4,12(sp)
1c00b3b6:	00d4                	addi	a3,sp,68
1c00b3b8:	00e687b3          	add	a5,a3,a4
1c00b3bc:	4742                	lw	a4,16(sp)
1c00b3be:	00e78023          	sb	a4,0(a5)
1c00b3c2:	47b2                	lw	a5,12(sp)
1c00b3c4:	0785                	addi	a5,a5,1
1c00b3c6:	c63e                	sw	a5,12(sp)
1c00b3c8:	b7dd                	j	1c00b3ae <_prf+0x84a>
1c00b3ca:	4452                	lw	s0,20(sp)
1c00b3cc:	be8d                	j	1c00af3e <_prf+0x3da>

1c00b3ce <__rt_uart_cluster_req_done>:
1c00b3ce:	300476f3          	csrrci	a3,mstatus,8
1c00b3d2:	4785                	li	a5,1
1c00b3d4:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b3d8:	09954783          	lbu	a5,153(a0)
1c00b3dc:	00201737          	lui	a4,0x201
1c00b3e0:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f2e18>
1c00b3e4:	04078793          	addi	a5,a5,64
1c00b3e8:	07da                	slli	a5,a5,0x16
1c00b3ea:	97ba                	add	a5,a5,a4
1c00b3ec:	0007a023          	sw	zero,0(a5)
1c00b3f0:	30069073          	csrw	mstatus,a3
1c00b3f4:	8082                	ret

1c00b3f6 <__rt_uart_setup.isra.6>:
1c00b3f6:	1c001737          	lui	a4,0x1c001
1c00b3fa:	1e872703          	lw	a4,488(a4) # 1c0011e8 <__rt_freq_domains>
1c00b3fe:	00155793          	srli	a5,a0,0x1
1c00b402:	97ba                	add	a5,a5,a4
1c00b404:	02a7d7b3          	divu	a5,a5,a0
1c00b408:	1a102737          	lui	a4,0x1a102
1c00b40c:	17fd                	addi	a5,a5,-1
1c00b40e:	07c2                	slli	a5,a5,0x10
1c00b410:	3067e793          	ori	a5,a5,774
1c00b414:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100190>
1c00b418:	8082                	ret

1c00b41a <__rt_uart_setfreq_after>:
1c00b41a:	1c0017b7          	lui	a5,0x1c001
1c00b41e:	16878793          	addi	a5,a5,360 # 1c001168 <__rt_uart>
1c00b422:	4398                	lw	a4,0(a5)
1c00b424:	cb09                	beqz	a4,1c00b436 <__rt_uart_setfreq_after+0x1c>
1c00b426:	4788                	lw	a0,8(a5)
1c00b428:	1141                	addi	sp,sp,-16
1c00b42a:	c606                	sw	ra,12(sp)
1c00b42c:	37e9                	jal	1c00b3f6 <__rt_uart_setup.isra.6>
1c00b42e:	40b2                	lw	ra,12(sp)
1c00b430:	4501                	li	a0,0
1c00b432:	0141                	addi	sp,sp,16
1c00b434:	8082                	ret
1c00b436:	4501                	li	a0,0
1c00b438:	8082                	ret

1c00b43a <__rt_uart_cluster_req>:
1c00b43a:	1141                	addi	sp,sp,-16
1c00b43c:	c606                	sw	ra,12(sp)
1c00b43e:	c422                	sw	s0,8(sp)
1c00b440:	30047473          	csrrci	s0,mstatus,8
1c00b444:	1c00b7b7          	lui	a5,0x1c00b
1c00b448:	3ce78793          	addi	a5,a5,974 # 1c00b3ce <__rt_uart_cluster_req_done>
1c00b44c:	c55c                	sw	a5,12(a0)
1c00b44e:	4785                	li	a5,1
1c00b450:	d55c                	sw	a5,44(a0)
1c00b452:	411c                	lw	a5,0(a0)
1c00b454:	02052823          	sw	zero,48(a0)
1c00b458:	c908                	sw	a0,16(a0)
1c00b45a:	43cc                	lw	a1,4(a5)
1c00b45c:	4514                	lw	a3,8(a0)
1c00b45e:	4150                	lw	a2,4(a0)
1c00b460:	0586                	slli	a1,a1,0x1
1c00b462:	00c50793          	addi	a5,a0,12
1c00b466:	4701                	li	a4,0
1c00b468:	0585                	addi	a1,a1,1
1c00b46a:	4501                	li	a0,0
1c00b46c:	e99fe0ef          	jal	ra,1c00a304 <rt_periph_copy>
1c00b470:	30041073          	csrw	mstatus,s0
1c00b474:	40b2                	lw	ra,12(sp)
1c00b476:	4422                	lw	s0,8(sp)
1c00b478:	0141                	addi	sp,sp,16
1c00b47a:	8082                	ret

1c00b47c <__rt_uart_wait_tx_done.isra.5>:
1c00b47c:	1a102737          	lui	a4,0x1a102
1c00b480:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa100184>
1c00b484:	8bc1                	andi	a5,a5,16
1c00b486:	e7b9                	bnez	a5,1c00b4d4 <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b488:	1a102737          	lui	a4,0x1a102
1c00b48c:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa10018c>
1c00b490:	8b85                	andi	a5,a5,1
1c00b492:	ffed                	bnez	a5,1c00b48c <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b494:	f14027f3          	csrr	a5,mhartid
1c00b498:	8795                	srai	a5,a5,0x5
1c00b49a:	1a10a637          	lui	a2,0x1a10a
1c00b49e:	03f7f793          	andi	a5,a5,63
1c00b4a2:	03200693          	li	a3,50
1c00b4a6:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa107800>
1c00b4aa:	6711                	lui	a4,0x4
1c00b4ac:	6311                	lui	t1,0x4
1c00b4ae:	45fd                	li	a1,31
1c00b4b0:	00204537          	lui	a0,0x204
1c00b4b4:	88be                	mv	a7,a5
1c00b4b6:	00682023          	sw	t1,0(a6)
1c00b4ba:	02b79063          	bne	a5,a1,1c00b4da <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b4be:	80e62223          	sw	a4,-2044(a2)
1c00b4c2:	10500073          	wfi
1c00b4c6:	00b89c63          	bne	a7,a1,1c00b4de <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b4ca:	80e62423          	sw	a4,-2040(a2)
1c00b4ce:	16fd                	addi	a3,a3,-1
1c00b4d0:	f2fd                	bnez	a3,1c00b4b6 <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b4d2:	8082                	ret
1c00b4d4:	10500073          	wfi
1c00b4d8:	b765                	j	1c00b480 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b4da:	c958                	sw	a4,20(a0)
1c00b4dc:	b7dd                	j	1c00b4c2 <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b4de:	c918                	sw	a4,16(a0)
1c00b4e0:	b7fd                	j	1c00b4ce <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b4e2 <__rt_uart_setfreq_before>:
1c00b4e2:	1c0017b7          	lui	a5,0x1c001
1c00b4e6:	1687a783          	lw	a5,360(a5) # 1c001168 <__rt_uart>
1c00b4ea:	cf99                	beqz	a5,1c00b508 <__rt_uart_setfreq_before+0x26>
1c00b4ec:	1141                	addi	sp,sp,-16
1c00b4ee:	c606                	sw	ra,12(sp)
1c00b4f0:	3771                	jal	1c00b47c <__rt_uart_wait_tx_done.isra.5>
1c00b4f2:	40b2                	lw	ra,12(sp)
1c00b4f4:	005007b7          	lui	a5,0x500
1c00b4f8:	1a102737          	lui	a4,0x1a102
1c00b4fc:	0799                	addi	a5,a5,6
1c00b4fe:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100190>
1c00b502:	4501                	li	a0,0
1c00b504:	0141                	addi	sp,sp,16
1c00b506:	8082                	ret
1c00b508:	4501                	li	a0,0
1c00b50a:	8082                	ret

1c00b50c <soc_eu_fcEventMask_setEvent>:
1c00b50c:	47fd                	li	a5,31
1c00b50e:	4721                	li	a4,8
1c00b510:	00a7d463          	ble	a0,a5,1c00b518 <soc_eu_fcEventMask_setEvent+0xc>
1c00b514:	1501                	addi	a0,a0,-32
1c00b516:	4711                	li	a4,4
1c00b518:	1a1067b7          	lui	a5,0x1a106
1c00b51c:	973e                	add	a4,a4,a5
1c00b51e:	4314                	lw	a3,0(a4)
1c00b520:	4785                	li	a5,1
1c00b522:	00a79533          	sll	a0,a5,a0
1c00b526:	fff54513          	not	a0,a0
1c00b52a:	8d75                	and	a0,a0,a3
1c00b52c:	c308                	sw	a0,0(a4)
1c00b52e:	8082                	ret

1c00b530 <rt_uart_conf_init>:
1c00b530:	000997b7          	lui	a5,0x99
1c00b534:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8a97c>
1c00b538:	c11c                	sw	a5,0(a0)
1c00b53a:	57fd                	li	a5,-1
1c00b53c:	c15c                	sw	a5,4(a0)
1c00b53e:	8082                	ret

1c00b540 <__rt_uart_open>:
1c00b540:	1141                	addi	sp,sp,-16
1c00b542:	c606                	sw	ra,12(sp)
1c00b544:	c422                	sw	s0,8(sp)
1c00b546:	c226                	sw	s1,4(sp)
1c00b548:	c04a                	sw	s2,0(sp)
1c00b54a:	30047973          	csrrci	s2,mstatus,8
1c00b54e:	cd8d                	beqz	a1,1c00b588 <__rt_uart_open+0x48>
1c00b550:	4194                	lw	a3,0(a1)
1c00b552:	1c0017b7          	lui	a5,0x1c001
1c00b556:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f6011>
1c00b55a:	16878413          	addi	s0,a5,360 # 1c001168 <__rt_uart>
1c00b55e:	0712                	slli	a4,a4,0x4
1c00b560:	943a                	add	s0,s0,a4
1c00b562:	4010                	lw	a2,0(s0)
1c00b564:	16878793          	addi	a5,a5,360
1c00b568:	c60d                	beqz	a2,1c00b592 <__rt_uart_open+0x52>
1c00b56a:	c589                	beqz	a1,1c00b574 <__rt_uart_open+0x34>
1c00b56c:	418c                	lw	a1,0(a1)
1c00b56e:	4414                	lw	a3,8(s0)
1c00b570:	04d59a63          	bne	a1,a3,1c00b5c4 <__rt_uart_open+0x84>
1c00b574:	97ba                	add	a5,a5,a4
1c00b576:	0605                	addi	a2,a2,1
1c00b578:	c390                	sw	a2,0(a5)
1c00b57a:	8522                	mv	a0,s0
1c00b57c:	40b2                	lw	ra,12(sp)
1c00b57e:	4422                	lw	s0,8(sp)
1c00b580:	4492                	lw	s1,4(sp)
1c00b582:	4902                	lw	s2,0(sp)
1c00b584:	0141                	addi	sp,sp,16
1c00b586:	8082                	ret
1c00b588:	000996b7          	lui	a3,0x99
1c00b58c:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8a97c>
1c00b590:	b7c9                	j	1c00b552 <__rt_uart_open+0x12>
1c00b592:	4785                	li	a5,1
1c00b594:	1a102737          	lui	a4,0x1a102
1c00b598:	c01c                	sw	a5,0(s0)
1c00b59a:	c048                	sw	a0,4(s0)
1c00b59c:	c414                	sw	a3,8(s0)
1c00b59e:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa10076c>
1c00b5a2:	00a797b3          	sll	a5,a5,a0
1c00b5a6:	00151493          	slli	s1,a0,0x1
1c00b5aa:	8fd5                	or	a5,a5,a3
1c00b5ac:	78f72023          	sw	a5,1920(a4)
1c00b5b0:	8526                	mv	a0,s1
1c00b5b2:	3fa9                	jal	1c00b50c <soc_eu_fcEventMask_setEvent>
1c00b5b4:	00148513          	addi	a0,s1,1
1c00b5b8:	3f91                	jal	1c00b50c <soc_eu_fcEventMask_setEvent>
1c00b5ba:	4408                	lw	a0,8(s0)
1c00b5bc:	3d2d                	jal	1c00b3f6 <__rt_uart_setup.isra.6>
1c00b5be:	30091073          	csrw	mstatus,s2
1c00b5c2:	bf65                	j	1c00b57a <__rt_uart_open+0x3a>
1c00b5c4:	4401                	li	s0,0
1c00b5c6:	bf55                	j	1c00b57a <__rt_uart_open+0x3a>

1c00b5c8 <rt_uart_close>:
1c00b5c8:	1141                	addi	sp,sp,-16
1c00b5ca:	c606                	sw	ra,12(sp)
1c00b5cc:	c422                	sw	s0,8(sp)
1c00b5ce:	c226                	sw	s1,4(sp)
1c00b5d0:	300474f3          	csrrci	s1,mstatus,8
1c00b5d4:	411c                	lw	a5,0(a0)
1c00b5d6:	17fd                	addi	a5,a5,-1
1c00b5d8:	c11c                	sw	a5,0(a0)
1c00b5da:	e78d                	bnez	a5,1c00b604 <rt_uart_close+0x3c>
1c00b5dc:	842a                	mv	s0,a0
1c00b5de:	3d79                	jal	1c00b47c <__rt_uart_wait_tx_done.isra.5>
1c00b5e0:	005007b7          	lui	a5,0x500
1c00b5e4:	1a102737          	lui	a4,0x1a102
1c00b5e8:	0799                	addi	a5,a5,6
1c00b5ea:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa100190>
1c00b5ee:	4050                	lw	a2,4(s0)
1c00b5f0:	78072683          	lw	a3,1920(a4)
1c00b5f4:	4785                	li	a5,1
1c00b5f6:	00c797b3          	sll	a5,a5,a2
1c00b5fa:	fff7c793          	not	a5,a5
1c00b5fe:	8ff5                	and	a5,a5,a3
1c00b600:	78f72023          	sw	a5,1920(a4)
1c00b604:	30049073          	csrw	mstatus,s1
1c00b608:	40b2                	lw	ra,12(sp)
1c00b60a:	4422                	lw	s0,8(sp)
1c00b60c:	4492                	lw	s1,4(sp)
1c00b60e:	0141                	addi	sp,sp,16
1c00b610:	8082                	ret

1c00b612 <rt_uart_cluster_write>:
1c00b612:	f14027f3          	csrr	a5,mhartid
1c00b616:	8795                	srai	a5,a5,0x5
1c00b618:	03f7f793          	andi	a5,a5,63
1c00b61c:	08f68ca3          	sb	a5,153(a3)
1c00b620:	1c00b7b7          	lui	a5,0x1c00b
1c00b624:	43a78793          	addi	a5,a5,1082 # 1c00b43a <__rt_uart_cluster_req>
1c00b628:	c6dc                	sw	a5,12(a3)
1c00b62a:	4785                	li	a5,1
1c00b62c:	c288                	sw	a0,0(a3)
1c00b62e:	c2cc                	sw	a1,4(a3)
1c00b630:	c690                	sw	a2,8(a3)
1c00b632:	08068c23          	sb	zero,152(a3)
1c00b636:	0206a823          	sw	zero,48(a3)
1c00b63a:	ca94                	sw	a3,16(a3)
1c00b63c:	d6dc                	sw	a5,44(a3)
1c00b63e:	00c68513          	addi	a0,a3,12
1c00b642:	ab7fd06f          	j	1c0090f8 <__rt_cluster_push_fc_event>

1c00b646 <__rt_uart_init>:
1c00b646:	1c00b5b7          	lui	a1,0x1c00b
1c00b64a:	1141                	addi	sp,sp,-16
1c00b64c:	4601                	li	a2,0
1c00b64e:	4e258593          	addi	a1,a1,1250 # 1c00b4e2 <__rt_uart_setfreq_before>
1c00b652:	4511                	li	a0,4
1c00b654:	c606                	sw	ra,12(sp)
1c00b656:	c422                	sw	s0,8(sp)
1c00b658:	8bcfe0ef          	jal	ra,1c009714 <__rt_cbsys_add>
1c00b65c:	1c00b5b7          	lui	a1,0x1c00b
1c00b660:	842a                	mv	s0,a0
1c00b662:	4601                	li	a2,0
1c00b664:	41a58593          	addi	a1,a1,1050 # 1c00b41a <__rt_uart_setfreq_after>
1c00b668:	4515                	li	a0,5
1c00b66a:	8aafe0ef          	jal	ra,1c009714 <__rt_cbsys_add>
1c00b66e:	1c0017b7          	lui	a5,0x1c001
1c00b672:	1607a423          	sw	zero,360(a5) # 1c001168 <__rt_uart>
1c00b676:	8d41                	or	a0,a0,s0
1c00b678:	c105                	beqz	a0,1c00b698 <__rt_uart_init+0x52>
1c00b67a:	f1402673          	csrr	a2,mhartid
1c00b67e:	1c000537          	lui	a0,0x1c000
1c00b682:	40565593          	srai	a1,a2,0x5
1c00b686:	03f5f593          	andi	a1,a1,63
1c00b68a:	8a7d                	andi	a2,a2,31
1c00b68c:	66850513          	addi	a0,a0,1640 # 1c000668 <__DTOR_END__+0x37c>
1c00b690:	ba6ff0ef          	jal	ra,1c00aa36 <printf>
1c00b694:	b2eff0ef          	jal	ra,1c00a9c2 <abort>
1c00b698:	40b2                	lw	ra,12(sp)
1c00b69a:	4422                	lw	s0,8(sp)
1c00b69c:	0141                	addi	sp,sp,16
1c00b69e:	8082                	ret

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
1c010034:	188b8b93          	addi	s7,s7,392 # 1c0011b8 <__rt_fc_cluster_data>
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
