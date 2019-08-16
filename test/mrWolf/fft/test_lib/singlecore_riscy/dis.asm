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
1c0080da:	334010ef          	jal	ra,1c00940e <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00000397          	auipc	t2,0x0
1c0080ea:	70238393          	addi	t2,t2,1794 # 1c0087e8 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	48e010ef          	jal	ra,1c009582 <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	0d9020ef          	jal	ra,1c00a9d2 <exit>

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
1c00815e:	7e460613          	addi	a2,a2,2020 # 1c00993e <__rt_bridge_handle_notif>
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
1c00825e:	3b850513          	addi	a0,a0,952 # 1c009612 <__rt_handle_illegal_instr>
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
1c008554:	51c020ef          	jal	ra,1c00aa70 <printf>
1c008558:	6585                	lui	a1,0x1
1c00855a:	80058593          	addi	a1,a1,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00855e:	450d                	li	a0,3
1c008560:	10000937          	lui	s2,0x10000
1c008564:	77c000ef          	jal	ra,1c008ce0 <rt_alloc>
1c008568:	01490913          	addi	s2,s2,20 # 10000014 <x_l1>
1c00856c:	00a92023          	sw	a0,0(s2)
1c008570:	26050363          	beqz	a0,1c0087d6 <cluster_entry+0x2a6>
1c008574:	002047b7          	lui	a5,0x204
1c008578:	4007a583          	lw	a1,1024(a5) # 204400 <__l1_heap_size+0x1f4420>
1c00857c:	000b1737          	lui	a4,0xb1
1c008580:	80070713          	addi	a4,a4,-2048 # b0800 <__l1_heap_size+0xa0820>
1c008584:	c1574733          	p.bset	a4,a4,0,21
1c008588:	40e7a023          	sw	a4,1024(a5)
1c00858c:	40a7a023          	sw	a0,1024(a5)
1c008590:	1c011737          	lui	a4,0x1c011
1c008594:	96870713          	addi	a4,a4,-1688 # 1c010968 <x>
1c008598:	40e7a023          	sw	a4,1024(a5)
1c00859c:	4047a783          	lw	a5,1028(a5)
1c0085a0:	40b7d7b3          	sra	a5,a5,a1
1c0085a4:	fc17b7b3          	p.bclr	a5,a5,30,1
1c0085a8:	c385                	beqz	a5,1c0085c8 <cluster_entry+0x98>
1c0085aa:	4605                	li	a2,1
1c0085ac:	00b61633          	sll	a2,a2,a1
1c0085b0:	10000693          	li	a3,256
1c0085b4:	002047b7          	lui	a5,0x204
1c0085b8:	c794                	sw	a3,8(a5)
1c0085ba:	03c7e703          	p.elw	a4,60(a5) # 20403c <__l1_heap_size+0x1f405c>
1c0085be:	c3d4                	sw	a3,4(a5)
1c0085c0:	4047a703          	lw	a4,1028(a5)
1c0085c4:	8f71                	and	a4,a4,a2
1c0085c6:	fb6d                	bnez	a4,1c0085b8 <cluster_entry+0x88>
1c0085c8:	4785                	li	a5,1
1c0085ca:	00b797b3          	sll	a5,a5,a1
1c0085ce:	00204737          	lui	a4,0x204
1c0085d2:	40f72223          	sw	a5,1028(a4) # 204404 <__l1_heap_size+0x1f4424>
1c0085d6:	1c000537          	lui	a0,0x1c000
1c0085da:	42c50513          	addi	a0,a0,1068 # 1c00042c <__DTOR_END__+0x140>
1c0085de:	392020ef          	jal	ra,1c00a970 <puts>
1c0085e2:	65f9                	lui	a1,0x1e
1c0085e4:	05bd                	addi	a1,a1,15
1c0085e6:	0028                	addi	a0,sp,8
1c0085e8:	603000ef          	jal	ra,1c0093ea <rt_perf_conf>
1c0085ec:	477d                	li	a4,31
1c0085ee:	f14027f3          	csrr	a5,mhartid
1c0085f2:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085f6:	18e78063          	beq	a5,a4,1c008776 <cluster_entry+0x246>
1c0085fa:	102007b7          	lui	a5,0x10200
1c0085fe:	4705                	li	a4,1
1c008600:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x2003e0>
1c008604:	02e7a023          	sw	a4,32(a5)
1c008608:	4781                	li	a5,0
1c00860a:	79f79073          	csrw	pccr31,a5
1c00860e:	f14027f3          	csrr	a5,mhartid
1c008612:	477d                	li	a4,31
1c008614:	ca5797b3          	p.extractu	a5,a5,5,5
1c008618:	16e78e63          	beq	a5,a4,1c008794 <cluster_entry+0x264>
1c00861c:	102007b7          	lui	a5,0x10200
1c008620:	4705                	li	a4,1
1c008622:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x2003e0>
1c008626:	00e7ac23          	sw	a4,24(a5)
1c00862a:	478d                	li	a5,3
1c00862c:	7a179073          	csrw	pcmr,a5
1c008630:	00092503          	lw	a0,0(s2)
1c008634:	20000593          	li	a1,512
1c008638:	2ac5                	jal	1c008828 <plp_cfft_i16>
1c00863a:	477d                	li	a4,31
1c00863c:	f14027f3          	csrr	a5,mhartid
1c008640:	ca5797b3          	p.extractu	a5,a5,5,5
1c008644:	16e78c63          	beq	a5,a4,1c0087bc <cluster_entry+0x28c>
1c008648:	102007b7          	lui	a5,0x10200
1c00864c:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x2003e0>
1c008650:	0007a023          	sw	zero,0(a5)
1c008654:	4781                	li	a5,0
1c008656:	7a179073          	csrw	pcmr,a5
1c00865a:	1c000537          	lui	a0,0x1c000
1c00865e:	43850513          	addi	a0,a0,1080 # 1c000438 <__DTOR_END__+0x14c>
1c008662:	30e020ef          	jal	ra,1c00a970 <puts>
1c008666:	1c000537          	lui	a0,0x1c000
1c00866a:	44450513          	addi	a0,a0,1092 # 1c000444 <__DTOR_END__+0x158>
1c00866e:	302020ef          	jal	ra,1c00a970 <puts>
1c008672:	4401                	li	s0,0
1c008674:	1c0004b7          	lui	s1,0x1c000
1c008678:	00092783          	lw	a5,0(s2)
1c00867c:	44c48513          	addi	a0,s1,1100 # 1c00044c <__DTOR_END__+0x160>
1c008680:	97a2                	add	a5,a5,s0
1c008682:	00079583          	lh	a1,0(a5)
1c008686:	0409                	addi	s0,s0,2
1c008688:	3e8020ef          	jal	ra,1c00aa70 <printf>
1c00868c:	80040793          	addi	a5,s0,-2048
1c008690:	f7e5                	bnez	a5,1c008678 <cluster_entry+0x148>
1c008692:	1c0009b7          	lui	s3,0x1c000
1c008696:	47498513          	addi	a0,s3,1140 # 1c000474 <__DTOR_END__+0x188>
1c00869a:	2d6020ef          	jal	ra,1c00a970 <puts>
1c00869e:	1c000537          	lui	a0,0x1c000
1c0086a2:	1c010437          	lui	s0,0x1c010
1c0086a6:	6905                	lui	s2,0x1
1c0086a8:	45450513          	addi	a0,a0,1108 # 1c000454 <__DTOR_END__+0x168>
1c0086ac:	16840413          	addi	s0,s0,360 # 1c010168 <__cluster_text_end>
1c0086b0:	80090913          	addi	s2,s2,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0086b4:	2bc020ef          	jal	ra,1c00a970 <puts>
1c0086b8:	9922                	add	s2,s2,s0
1c0086ba:	0024158b          	p.lh	a1,2(s0!)
1c0086be:	44c48513          	addi	a0,s1,1100
1c0086c2:	3ae020ef          	jal	ra,1c00aa70 <printf>
1c0086c6:	fe891ae3          	bne	s2,s0,1c0086ba <cluster_entry+0x18a>
1c0086ca:	47498513          	addi	a0,s3,1140
1c0086ce:	2a2020ef          	jal	ra,1c00a970 <puts>
1c0086d2:	477d                	li	a4,31
1c0086d4:	f14027f3          	csrr	a5,mhartid
1c0086d8:	ca5797b3          	p.extractu	a5,a5,5,5
1c0086dc:	0ee78863          	beq	a5,a4,1c0087cc <cluster_entry+0x29c>
1c0086e0:	102005b7          	lui	a1,0x10200
1c0086e4:	40058593          	addi	a1,a1,1024 # 10200400 <__l1_end+0x2003e0>
1c0086e8:	0085a583          	lw	a1,8(a1)
1c0086ec:	1c000537          	lui	a0,0x1c000
1c0086f0:	46450513          	addi	a0,a0,1124 # 1c000464 <__DTOR_END__+0x178>
1c0086f4:	37c020ef          	jal	ra,1c00aa70 <printf>
1c0086f8:	780025f3          	csrr	a1,pccr0
1c0086fc:	1c000537          	lui	a0,0x1c000
1c008700:	47850513          	addi	a0,a0,1144 # 1c000478 <__DTOR_END__+0x18c>
1c008704:	36c020ef          	jal	ra,1c00aa70 <printf>
1c008708:	781025f3          	csrr	a1,pccr1
1c00870c:	1c000537          	lui	a0,0x1c000
1c008710:	48c50513          	addi	a0,a0,1164 # 1c00048c <__DTOR_END__+0x1a0>
1c008714:	35c020ef          	jal	ra,1c00aa70 <printf>
1c008718:	782025f3          	csrr	a1,pccr2
1c00871c:	1c000537          	lui	a0,0x1c000
1c008720:	4a050513          	addi	a0,a0,1184 # 1c0004a0 <__DTOR_END__+0x1b4>
1c008724:	34c020ef          	jal	ra,1c00aa70 <printf>
1c008728:	783025f3          	csrr	a1,pccr3
1c00872c:	1c000537          	lui	a0,0x1c000
1c008730:	4b450513          	addi	a0,a0,1204 # 1c0004b4 <__DTOR_END__+0x1c8>
1c008734:	33c020ef          	jal	ra,1c00aa70 <printf>
1c008738:	78d025f3          	csrr	a1,pccr13
1c00873c:	1c000537          	lui	a0,0x1c000
1c008740:	4c850513          	addi	a0,a0,1224 # 1c0004c8 <__DTOR_END__+0x1dc>
1c008744:	32c020ef          	jal	ra,1c00aa70 <printf>
1c008748:	78e025f3          	csrr	a1,pccr14
1c00874c:	1c000537          	lui	a0,0x1c000
1c008750:	4e050513          	addi	a0,a0,1248 # 1c0004e0 <__DTOR_END__+0x1f4>
1c008754:	31c020ef          	jal	ra,1c00aa70 <printf>
1c008758:	78f025f3          	csrr	a1,pccr15
1c00875c:	1c000537          	lui	a0,0x1c000
1c008760:	4fc50513          	addi	a0,a0,1276 # 1c0004fc <__DTOR_END__+0x210>
1c008764:	30c020ef          	jal	ra,1c00aa70 <printf>
1c008768:	50b6                	lw	ra,108(sp)
1c00876a:	5426                	lw	s0,104(sp)
1c00876c:	5496                	lw	s1,100(sp)
1c00876e:	5906                	lw	s2,96(sp)
1c008770:	49f6                	lw	s3,92(sp)
1c008772:	6165                	addi	sp,sp,112
1c008774:	8082                	ret
1c008776:	4785                	li	a5,1
1c008778:	1a10b737          	lui	a4,0x1a10b
1c00877c:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa10b000>
1c008780:	4781                	li	a5,0
1c008782:	79f79073          	csrw	pccr31,a5
1c008786:	f14027f3          	csrr	a5,mhartid
1c00878a:	477d                	li	a4,31
1c00878c:	ca5797b3          	p.extractu	a5,a5,5,5
1c008790:	e8e796e3          	bne	a5,a4,1c00861c <cluster_entry+0xec>
1c008794:	4785                	li	a5,1
1c008796:	1a10b737          	lui	a4,0x1a10b
1c00879a:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa10aff8>
1c00879e:	478d                	li	a5,3
1c0087a0:	7a179073          	csrw	pcmr,a5
1c0087a4:	00092503          	lw	a0,0(s2)
1c0087a8:	20000593          	li	a1,512
1c0087ac:	28b5                	jal	1c008828 <plp_cfft_i16>
1c0087ae:	477d                	li	a4,31
1c0087b0:	f14027f3          	csrr	a5,mhartid
1c0087b4:	ca5797b3          	p.extractu	a5,a5,5,5
1c0087b8:	e8e798e3          	bne	a5,a4,1c008648 <cluster_entry+0x118>
1c0087bc:	1a10b7b7          	lui	a5,0x1a10b
1c0087c0:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa10afe0>
1c0087c4:	4781                	li	a5,0
1c0087c6:	7a179073          	csrw	pcmr,a5
1c0087ca:	bd41                	j	1c00865a <cluster_entry+0x12a>
1c0087cc:	1a10b5b7          	lui	a1,0x1a10b
1c0087d0:	0085a583          	lw	a1,8(a1) # 1a10b008 <__l1_end+0xa10afe8>
1c0087d4:	bf21                	j	1c0086ec <cluster_entry+0x1bc>
1c0087d6:	1c000537          	lui	a0,0x1c000
1c0087da:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c0087de:	192020ef          	jal	ra,1c00a970 <puts>
1c0087e2:	00092503          	lw	a0,0(s2)
1c0087e6:	b379                	j	1c008574 <cluster_entry+0x44>

1c0087e8 <main>:
1c0087e8:	1101                	addi	sp,sp,-32
1c0087ea:	4681                	li	a3,0
1c0087ec:	4601                	li	a2,0
1c0087ee:	4581                	li	a1,0
1c0087f0:	4505                	li	a0,1
1c0087f2:	ce06                	sw	ra,28(sp)
1c0087f4:	2ad000ef          	jal	ra,1c0092a0 <rt_cluster_mount>
1c0087f8:	1c008637          	lui	a2,0x1c008
1c0087fc:	4881                	li	a7,0
1c0087fe:	4801                	li	a6,0
1c008800:	4781                	li	a5,0
1c008802:	4701                	li	a4,0
1c008804:	4681                	li	a3,0
1c008806:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c00880a:	4581                	li	a1,0
1c00880c:	c002                	sw	zero,0(sp)
1c00880e:	4501                	li	a0,0
1c008810:	1f7000ef          	jal	ra,1c009206 <rt_cluster_call>
1c008814:	4501                	li	a0,0
1c008816:	4681                	li	a3,0
1c008818:	4601                	li	a2,0
1c00881a:	4581                	li	a1,0
1c00881c:	285000ef          	jal	ra,1c0092a0 <rt_cluster_mount>
1c008820:	40f2                	lw	ra,28(sp)
1c008822:	4501                	li	a0,0
1c008824:	6105                	addi	sp,sp,32
1c008826:	8082                	ret

1c008828 <plp_cfft_i16>:
1c008828:	1141                	addi	sp,sp,-16
1c00882a:	f14027f3          	csrr	a5,mhartid
1c00882e:	8795                	srai	a5,a5,0x5
1c008830:	c226                	sw	s1,4(sp)
1c008832:	c04a                	sw	s2,0(sp)
1c008834:	c606                	sw	ra,12(sp)
1c008836:	c422                	sw	s0,8(sp)
1c008838:	03f7f793          	andi	a5,a5,63
1c00883c:	477d                	li	a4,31
1c00883e:	84aa                	mv	s1,a0
1c008840:	892e                	mv	s2,a1
1c008842:	02e79863          	bne	a5,a4,1c008872 <plp_cfft_i16+0x4a>
1c008846:	f14027f3          	csrr	a5,mhartid
1c00884a:	8795                	srai	a5,a5,0x5
1c00884c:	03f7f793          	andi	a5,a5,63
1c008850:	477d                	li	a4,31
1c008852:	0ee78d63          	beq	a5,a4,1c00894c <plp_cfft_i16+0x124>
1c008856:	100007b7          	lui	a5,0x10000
1c00885a:	01878793          	addi	a5,a5,24 # 10000018 <Swap_LUT_l1.9833>
1c00885e:	4422                	lw	s0,8(sp)
1c008860:	40b2                	lw	ra,12(sp)
1c008862:	4390                	lw	a2,0(a5)
1c008864:	43cc                	lw	a1,4(a5)
1c008866:	86ca                	mv	a3,s2
1c008868:	8526                	mv	a0,s1
1c00886a:	4902                	lw	s2,0(sp)
1c00886c:	4492                	lw	s1,4(sp)
1c00886e:	0141                	addi	sp,sp,16
1c008870:	a479                	j	1c008afe <plp_cfft_i16v_xpulpv2>
1c008872:	40000593          	li	a1,1024
1c008876:	450d                	li	a0,3
1c008878:	10000437          	lui	s0,0x10000
1c00887c:	2195                	jal	1c008ce0 <rt_alloc>
1c00887e:	01840413          	addi	s0,s0,24 # 10000018 <Swap_LUT_l1.9833>
1c008882:	c008                	sw	a0,0(s0)
1c008884:	40000593          	li	a1,1024
1c008888:	450d                	li	a0,3
1c00888a:	2999                	jal	1c008ce0 <rt_alloc>
1c00888c:	4010                	lw	a2,0(s0)
1c00888e:	c048                	sw	a0,4(s0)
1c008890:	ce71                	beqz	a2,1c00896c <plp_cfft_i16+0x144>
1c008892:	cd69                	beqz	a0,1c00896c <plp_cfft_i16+0x144>
1c008894:	002047b7          	lui	a5,0x204
1c008898:	4007a683          	lw	a3,1024(a5) # 204400 <__l1_heap_size+0x1f4420>
1c00889c:	002b0737          	lui	a4,0x2b0
1c0088a0:	40070713          	addi	a4,a4,1024 # 2b0400 <__l1_heap_size+0x2a0420>
1c0088a4:	40e7a023          	sw	a4,1024(a5)
1c0088a8:	1c011737          	lui	a4,0x1c011
1c0088ac:	40c7a023          	sw	a2,1024(a5)
1c0088b0:	16870713          	addi	a4,a4,360 # 1c011168 <Swap_LUT>
1c0088b4:	40e7a023          	sw	a4,1024(a5)
1c0088b8:	4047a783          	lw	a5,1028(a5)
1c0088bc:	4585                	li	a1,1
1c0088be:	00d595b3          	sll	a1,a1,a3
1c0088c2:	8fed                	and	a5,a5,a1
1c0088c4:	cf89                	beqz	a5,1c0088de <plp_cfft_i16+0xb6>
1c0088c6:	10000613          	li	a2,256
1c0088ca:	002047b7          	lui	a5,0x204
1c0088ce:	c790                	sw	a2,8(a5)
1c0088d0:	03c7e703          	p.elw	a4,60(a5) # 20403c <__l1_heap_size+0x1f405c>
1c0088d4:	c3d0                	sw	a2,4(a5)
1c0088d6:	4047a703          	lw	a4,1028(a5)
1c0088da:	8f6d                	and	a4,a4,a1
1c0088dc:	fb6d                	bnez	a4,1c0088ce <plp_cfft_i16+0xa6>
1c0088de:	4585                	li	a1,1
1c0088e0:	002047b7          	lui	a5,0x204
1c0088e4:	00d596b3          	sll	a3,a1,a3
1c0088e8:	40d7a223          	sw	a3,1028(a5) # 204404 <__l1_heap_size+0x1f4424>
1c0088ec:	4050                	lw	a2,4(s0)
1c0088ee:	4007a683          	lw	a3,1024(a5)
1c0088f2:	002b0737          	lui	a4,0x2b0
1c0088f6:	40070713          	addi	a4,a4,1024 # 2b0400 <__l1_heap_size+0x2a0420>
1c0088fa:	40e7a023          	sw	a4,1024(a5)
1c0088fe:	1c011737          	lui	a4,0x1c011
1c008902:	40c7a023          	sw	a2,1024(a5)
1c008906:	56870713          	addi	a4,a4,1384 # 1c011568 <Twiddles_LUT>
1c00890a:	40e7a023          	sw	a4,1024(a5)
1c00890e:	4047a703          	lw	a4,1028(a5)
1c008912:	00d595b3          	sll	a1,a1,a3
1c008916:	8f6d                	and	a4,a4,a1
1c008918:	cb19                	beqz	a4,1c00892e <plp_cfft_i16+0x106>
1c00891a:	10000613          	li	a2,256
1c00891e:	c790                	sw	a2,8(a5)
1c008920:	03c7e703          	p.elw	a4,60(a5)
1c008924:	c3d0                	sw	a2,4(a5)
1c008926:	4047a703          	lw	a4,1028(a5)
1c00892a:	8f6d                	and	a4,a4,a1
1c00892c:	fb6d                	bnez	a4,1c00891e <plp_cfft_i16+0xf6>
1c00892e:	4785                	li	a5,1
1c008930:	00d797b3          	sll	a5,a5,a3
1c008934:	00204737          	lui	a4,0x204
1c008938:	40f72223          	sw	a5,1028(a4) # 204404 <__l1_heap_size+0x1f4424>
1c00893c:	f14027f3          	csrr	a5,mhartid
1c008940:	8795                	srai	a5,a5,0x5
1c008942:	03f7f793          	andi	a5,a5,63
1c008946:	477d                	li	a4,31
1c008948:	f0e797e3          	bne	a5,a4,1c008856 <plp_cfft_i16+0x2e>
1c00894c:	4422                	lw	s0,8(sp)
1c00894e:	40b2                	lw	ra,12(sp)
1c008950:	86ca                	mv	a3,s2
1c008952:	8526                	mv	a0,s1
1c008954:	4902                	lw	s2,0(sp)
1c008956:	4492                	lw	s1,4(sp)
1c008958:	1c011637          	lui	a2,0x1c011
1c00895c:	1c0115b7          	lui	a1,0x1c011
1c008960:	16860613          	addi	a2,a2,360 # 1c011168 <Swap_LUT>
1c008964:	56858593          	addi	a1,a1,1384 # 1c011568 <Twiddles_LUT>
1c008968:	0141                	addi	sp,sp,16
1c00896a:	a809                	j	1c00897c <plp_cfft_i16s_rv32im>
1c00896c:	1c000537          	lui	a0,0x1c000
1c008970:	52850513          	addi	a0,a0,1320 # 1c000528 <__DTOR_END__+0x23c>
1c008974:	0fc020ef          	jal	ra,1c00aa70 <printf>
1c008978:	4010                	lw	a2,0(s0)
1c00897a:	bf29                	j	1c008894 <plp_cfft_i16+0x6c>

1c00897c <plp_cfft_i16s_rv32im>:
1c00897c:	7179                	addi	sp,sp,-48
1c00897e:	c662                	sw	s8,12(sp)
1c008980:	d622                	sw	s0,44(sp)
1c008982:	d426                	sw	s1,40(sp)
1c008984:	d24a                	sw	s2,36(sp)
1c008986:	d04e                	sw	s3,32(sp)
1c008988:	ce52                	sw	s4,28(sp)
1c00898a:	cc56                	sw	s5,24(sp)
1c00898c:	ca5a                	sw	s6,20(sp)
1c00898e:	c85e                	sw	s7,16(sp)
1c008990:	c466                	sw	s9,8(sp)
1c008992:	c26a                	sw	s10,4(sp)
1c008994:	0016dc13          	srli	s8,a3,0x1
1c008998:	160c0163          	beqz	s8,1c008afa <plp_cfft_i16s_rv32im+0x17e>
1c00899c:	87e2                	mv	a5,s8
1c00899e:	4b81                	li	s7,0
1c0089a0:	a011                	j	1c0089a4 <plp_cfft_i16s_rv32im+0x28>
1c0089a2:	8bba                	mv	s7,a4
1c0089a4:	8385                	srli	a5,a5,0x1
1c0089a6:	001b8713          	addi	a4,s7,1
1c0089aa:	ffe5                	bnez	a5,1c0089a2 <plp_cfft_i16s_rv32im+0x26>
1c0089ac:	0a0b8a63          	beqz	s7,1c008a60 <plp_cfft_i16s_rv32im+0xe4>
1c0089b0:	8b62                	mv	s6,s8
1c0089b2:	4405                	li	s0,1
1c0089b4:	4c81                	li	s9,0
1c0089b6:	080b0d63          	beqz	s6,1c008a50 <plp_cfft_i16s_rv32im+0xd4>
1c0089ba:	002b1993          	slli	s3,s6,0x2
1c0089be:	c849                	beqz	s0,1c008a50 <plp_cfft_i16s_rv32im+0xd4>
1c0089c0:	00a98a33          	add	s4,s3,a0
1c0089c4:	00241a93          	slli	s5,s0,0x2
1c0089c8:	892e                	mv	s2,a1
1c0089ca:	84aa                	mv	s1,a0
1c0089cc:	003b1393          	slli	t2,s6,0x3
1c0089d0:	0989                	addi	s3,s3,2
1c0089d2:	00091283          	lh	t0,0(s2)
1c0089d6:	00291f83          	lh	t6,2(s2)
1c0089da:	00998333          	add	t1,s3,s1
1c0089de:	8e26                	mv	t3,s1
1c0089e0:	4e81                	li	t4,0
1c0089e2:	000e1803          	lh	a6,0(t3)
1c0089e6:	ffe31d03          	lh	s10,-2(t1)
1c0089ea:	002e1f03          	lh	t5,2(t3)
1c0089ee:	00035703          	lhu	a4,0(t1)
1c0089f2:	41a807b3          	sub	a5,a6,s10
1c0089f6:	986a                	add	a6,a6,s10
1c0089f8:	40185813          	srai	a6,a6,0x1
1c0089fc:	010e1023          	sh	a6,0(t3)
1c008a00:	00031803          	lh	a6,0(t1)
1c008a04:	40ef0733          	sub	a4,t5,a4
1c008a08:	07c2                	slli	a5,a5,0x10
1c008a0a:	0742                	slli	a4,a4,0x10
1c008a0c:	87c1                	srai	a5,a5,0x10
1c008a0e:	8741                	srai	a4,a4,0x10
1c008a10:	025788b3          	mul	a7,a5,t0
1c008a14:	9f42                	add	t5,t5,a6
1c008a16:	401f5f13          	srai	t5,t5,0x1
1c008a1a:	01ee1123          	sh	t5,2(t3)
1c008a1e:	0e85                	addi	t4,t4,1
1c008a20:	9e1e                	add	t3,t3,t2
1c008a22:	03f70833          	mul	a6,a4,t6
1c008a26:	03f787b3          	mul	a5,a5,t6
1c008a2a:	410888b3          	sub	a7,a7,a6
1c008a2e:	4108d893          	srai	a7,a7,0x10
1c008a32:	ff131f23          	sh	a7,-2(t1)
1c008a36:	02570733          	mul	a4,a4,t0
1c008a3a:	97ba                	add	a5,a5,a4
1c008a3c:	87c1                	srai	a5,a5,0x10
1c008a3e:	00f31023          	sh	a5,0(t1)
1c008a42:	931e                	add	t1,t1,t2
1c008a44:	f88e9fe3          	bne	t4,s0,1c0089e2 <plp_cfft_i16s_rv32im+0x66>
1c008a48:	0491                	addi	s1,s1,4
1c008a4a:	9956                	add	s2,s2,s5
1c008a4c:	f89a13e3          	bne	s4,s1,1c0089d2 <plp_cfft_i16s_rv32im+0x56>
1c008a50:	0c85                	addi	s9,s9,1
1c008a52:	0406                	slli	s0,s0,0x1
1c008a54:	001b5b13          	srli	s6,s6,0x1
1c008a58:	f57cefe3          	bltu	s9,s7,1c0089b6 <plp_cfft_i16s_rv32im+0x3a>
1c008a5c:	040c0163          	beqz	s8,1c008a9e <plp_cfft_i16s_rv32im+0x122>
1c008a60:	003c1313          	slli	t1,s8,0x3
1c008a64:	87aa                	mv	a5,a0
1c008a66:	932a                	add	t1,t1,a0
1c008a68:	0047d883          	lhu	a7,4(a5)
1c008a6c:	0007d583          	lhu	a1,0(a5)
1c008a70:	0027d703          	lhu	a4,2(a5)
1c008a74:	0067d803          	lhu	a6,6(a5)
1c008a78:	01158e33          	add	t3,a1,a7
1c008a7c:	411585b3          	sub	a1,a1,a7
1c008a80:	010708b3          	add	a7,a4,a6
1c008a84:	41070733          	sub	a4,a4,a6
1c008a88:	01c79023          	sh	t3,0(a5)
1c008a8c:	01179123          	sh	a7,2(a5)
1c008a90:	00b79223          	sh	a1,4(a5)
1c008a94:	00e79323          	sh	a4,6(a5)
1c008a98:	07a1                	addi	a5,a5,8
1c008a9a:	fc6797e3          	bne	a5,t1,1c008a68 <plp_cfft_i16s_rv32im+0xec>
1c008a9e:	c2a9                	beqz	a3,1c008ae0 <plp_cfft_i16s_rv32im+0x164>
1c008aa0:	4701                	li	a4,0
1c008aa2:	4781                	li	a5,0
1c008aa4:	00279593          	slli	a1,a5,0x2
1c008aa8:	0786                	slli	a5,a5,0x1
1c008aaa:	97b2                	add	a5,a5,a2
1c008aac:	0007d803          	lhu	a6,0(a5)
1c008ab0:	95aa                	add	a1,a1,a0
1c008ab2:	00170893          	addi	a7,a4,1
1c008ab6:	00281793          	slli	a5,a6,0x2
1c008aba:	97aa                	add	a5,a5,a0
1c008abc:	01077c63          	bleu	a6,a4,1c008ad4 <plp_cfft_i16s_rv32im+0x158>
1c008ac0:	00079803          	lh	a6,0(a5)
1c008ac4:	4198                	lw	a4,0(a1)
1c008ac6:	01059023          	sh	a6,0(a1)
1c008aca:	00279803          	lh	a6,2(a5)
1c008ace:	01059123          	sh	a6,2(a1)
1c008ad2:	c398                	sw	a4,0(a5)
1c008ad4:	01089713          	slli	a4,a7,0x10
1c008ad8:	8341                	srli	a4,a4,0x10
1c008ada:	87ba                	mv	a5,a4
1c008adc:	fcd764e3          	bltu	a4,a3,1c008aa4 <plp_cfft_i16s_rv32im+0x128>
1c008ae0:	5432                	lw	s0,44(sp)
1c008ae2:	54a2                	lw	s1,40(sp)
1c008ae4:	5912                	lw	s2,36(sp)
1c008ae6:	5982                	lw	s3,32(sp)
1c008ae8:	4a72                	lw	s4,28(sp)
1c008aea:	4ae2                	lw	s5,24(sp)
1c008aec:	4b52                	lw	s6,20(sp)
1c008aee:	4bc2                	lw	s7,16(sp)
1c008af0:	4c32                	lw	s8,12(sp)
1c008af2:	4ca2                	lw	s9,8(sp)
1c008af4:	4d12                	lw	s10,4(sp)
1c008af6:	6145                	addi	sp,sp,48
1c008af8:	8082                	ret
1c008afa:	5bfd                	li	s7,-1
1c008afc:	bd55                	j	1c0089b0 <plp_cfft_i16s_rv32im+0x34>

1c008afe <plp_cfft_i16v_xpulpv2>:
1c008afe:	7179                	addi	sp,sp,-48
1c008b00:	cc56                	sw	s5,24(sp)
1c008b02:	10069ab3          	p.fl1	s5,a3
1c008b06:	d24a                	sw	s2,36(sp)
1c008b08:	d622                	sw	s0,44(sp)
1c008b0a:	d426                	sw	s1,40(sp)
1c008b0c:	d04e                	sw	s3,32(sp)
1c008b0e:	ce52                	sw	s4,28(sp)
1c008b10:	ca5a                	sw	s6,20(sp)
1c008b12:	c85e                	sw	s7,16(sp)
1c008b14:	c662                	sw	s8,12(sp)
1c008b16:	c466                	sw	s9,8(sp)
1c008b18:	1afd                	addi	s5,s5,-1
1c008b1a:	0016d913          	srli	s2,a3,0x1
1c008b1e:	080a8863          	beqz	s5,1c008bae <plp_cfft_i16v_xpulpv2+0xb0>
1c008b22:	89ca                	mv	s3,s2
1c008b24:	4385                	li	t2,1
1c008b26:	4a01                	li	s4,0
1c008b28:	06098d63          	beqz	s3,1c008ba2 <plp_cfft_i16v_xpulpv2+0xa4>
1c008b2c:	06038b63          	beqz	t2,1c008ba2 <plp_cfft_i16v_xpulpv2+0xa4>
1c008b30:	00299413          	slli	s0,s3,0x2
1c008b34:	ffc40f93          	addi	t6,s0,-4
1c008b38:	002fdf93          	srli	t6,t6,0x2
1c008b3c:	00239493          	slli	s1,t2,0x2
1c008b40:	82ae                	mv	t0,a1
1c008b42:	8f2a                	mv	t5,a0
1c008b44:	00399b13          	slli	s6,s3,0x3
1c008b48:	0f85                	addi	t6,t6,1
1c008b4a:	02bfc07b          	lp.setup	x0,t6,1c008ba0 <plp_cfft_i16v_xpulpv2+0xa2>
1c008b4e:	0002ae03          	lw	t3,0(t0)
1c008b52:	01e40333          	add	t1,s0,t5
1c008b56:	88fa                	mv	a7,t5
1c008b58:	780e6ed7          	pv.extract.h	t4,t3,0
1c008b5c:	881e                	mv	a6,t2
1c008b5e:	7a0e6e57          	pv.extract.h	t3,t3,1
1c008b62:	01c840fb          	lp.setup	x1,a6,1c008b9a <plp_cfft_i16v_xpulpv2+0x9c>
1c008b66:	0008a703          	lw	a4,0(a7)
1c008b6a:	00032c83          	lw	s9,0(t1)
1c008b6e:	09970bd7          	pv.sub.h	s7,a4,s9
1c008b72:	780bec57          	pv.extract.h	s8,s7,0
1c008b76:	11970757          	pv.avg.h	a4,a4,s9
1c008b7a:	7a0bebd7          	pv.extract.h	s7,s7,1
1c008b7e:	00e8eb2b          	p.sw	a4,s6(a7!)
1c008b82:	03dc07b3          	mul	a5,s8,t4
1c008b86:	03db8733          	mul	a4,s7,t4
1c008b8a:	43cb97b3          	p.msu	a5,s7,t3
1c008b8e:	43cc0733          	p.mac	a4,s8,t3
1c008b92:	87c1                	srai	a5,a5,0x10
1c008b94:	8741                	srai	a4,a4,0x10
1c008b96:	d0f707d7          	pv.pack.h	a5,a4,a5
1c008b9a:	00f36b2b          	p.sw	a5,s6(t1!)
1c008b9e:	92a6                	add	t0,t0,s1
1c008ba0:	0f11                	addi	t5,t5,4
1c008ba2:	0a05                	addi	s4,s4,1
1c008ba4:	0386                	slli	t2,t2,0x1
1c008ba6:	0019d993          	srli	s3,s3,0x1
1c008baa:	f75a1fe3          	bne	s4,s5,1c008b28 <plp_cfft_i16v_xpulpv2+0x2a>
1c008bae:	08090a63          	beqz	s2,1c008c42 <plp_cfft_i16v_xpulpv2+0x144>
1c008bb2:	00391713          	slli	a4,s2,0x3
1c008bb6:	1761                	addi	a4,a4,-8
1c008bb8:	830d                	srli	a4,a4,0x3
1c008bba:	882a                	mv	a6,a0
1c008bbc:	00450593          	addi	a1,a0,4
1c008bc0:	0705                	addi	a4,a4,1
1c008bc2:	00c740fb          	lp.setup	x1,a4,1c008bda <plp_cfft_i16v_xpulpv2+0xdc>
1c008bc6:	00082783          	lw	a5,0(a6)
1c008bca:	0005a883          	lw	a7,0(a1)
1c008bce:	01178357          	pv.add.h	t1,a5,a7
1c008bd2:	0068242b          	p.sw	t1,8(a6!)
1c008bd6:	091787d7          	pv.sub.h	a5,a5,a7
1c008bda:	00f5a42b          	p.sw	a5,8(a1!)
1c008bde:	fff68593          	addi	a1,a3,-1
1c008be2:	1005d5b3          	p.exthz	a1,a1
1c008be6:	1006c833          	p.exths	a6,a3
1c008bea:	4701                	li	a4,0
1c008bec:	4781                	li	a5,0
1c008bee:	0585                	addi	a1,a1,1
1c008bf0:	04080b63          	beqz	a6,1c008c46 <plp_cfft_i16v_xpulpv2+0x148>
1c008bf4:	0406c963          	bltz	a3,1c008c46 <plp_cfft_i16v_xpulpv2+0x148>
1c008bf8:	0185c0fb          	lp.setup	x1,a1,1c008c28 <plp_cfft_i16v_xpulpv2+0x12a>
1c008bfc:	00179693          	slli	a3,a5,0x1
1c008c00:	96b2                	add	a3,a3,a2
1c008c02:	0006d803          	lhu	a6,0(a3)
1c008c06:	078a                	slli	a5,a5,0x2
1c008c08:	97aa                	add	a5,a5,a0
1c008c0a:	00281693          	slli	a3,a6,0x2
1c008c0e:	00170893          	addi	a7,a4,1
1c008c12:	96aa                	add	a3,a3,a0
1c008c14:	01077863          	bleu	a6,a4,1c008c24 <plp_cfft_i16v_xpulpv2+0x126>
1c008c18:	0006a803          	lw	a6,0(a3)
1c008c1c:	4398                	lw	a4,0(a5)
1c008c1e:	0107a023          	sw	a6,0(a5)
1c008c22:	c298                	sw	a4,0(a3)
1c008c24:	1008d733          	p.exthz	a4,a7
1c008c28:	87ba                	mv	a5,a4
1c008c2a:	5432                	lw	s0,44(sp)
1c008c2c:	54a2                	lw	s1,40(sp)
1c008c2e:	5912                	lw	s2,36(sp)
1c008c30:	5982                	lw	s3,32(sp)
1c008c32:	4a72                	lw	s4,28(sp)
1c008c34:	4ae2                	lw	s5,24(sp)
1c008c36:	4b52                	lw	s6,20(sp)
1c008c38:	4bc2                	lw	s7,16(sp)
1c008c3a:	4c32                	lw	s8,12(sp)
1c008c3c:	4ca2                	lw	s9,8(sp)
1c008c3e:	6145                	addi	sp,sp,48
1c008c40:	8082                	ret
1c008c42:	d6e5                	beqz	a3,1c008c2a <plp_cfft_i16v_xpulpv2+0x12c>
1c008c44:	bf69                	j	1c008bde <plp_cfft_i16v_xpulpv2+0xe0>
1c008c46:	4585                	li	a1,1
1c008c48:	bf45                	j	1c008bf8 <plp_cfft_i16v_xpulpv2+0xfa>

1c008c4a <rt_user_alloc_init>:
1c008c4a:	00758793          	addi	a5,a1,7
1c008c4e:	9be1                	andi	a5,a5,-8
1c008c50:	40b785b3          	sub	a1,a5,a1
1c008c54:	c11c                	sw	a5,0(a0)
1c008c56:	8e0d                	sub	a2,a2,a1
1c008c58:	00c05663          	blez	a2,1c008c64 <rt_user_alloc_init+0x1a>
1c008c5c:	9a61                	andi	a2,a2,-8
1c008c5e:	c390                	sw	a2,0(a5)
1c008c60:	0007a223          	sw	zero,4(a5)
1c008c64:	8082                	ret

1c008c66 <rt_user_alloc>:
1c008c66:	411c                	lw	a5,0(a0)
1c008c68:	059d                	addi	a1,a1,7
1c008c6a:	99e1                	andi	a1,a1,-8
1c008c6c:	4681                	li	a3,0
1c008c6e:	cb89                	beqz	a5,1c008c80 <rt_user_alloc+0x1a>
1c008c70:	4398                	lw	a4,0(a5)
1c008c72:	00b74963          	blt	a4,a1,1c008c84 <rt_user_alloc+0x1e>
1c008c76:	00b71c63          	bne	a4,a1,1c008c8e <rt_user_alloc+0x28>
1c008c7a:	43d8                	lw	a4,4(a5)
1c008c7c:	c699                	beqz	a3,1c008c8a <rt_user_alloc+0x24>
1c008c7e:	c2d8                	sw	a4,4(a3)
1c008c80:	853e                	mv	a0,a5
1c008c82:	8082                	ret
1c008c84:	86be                	mv	a3,a5
1c008c86:	43dc                	lw	a5,4(a5)
1c008c88:	b7dd                	j	1c008c6e <rt_user_alloc+0x8>
1c008c8a:	c118                	sw	a4,0(a0)
1c008c8c:	bfd5                	j	1c008c80 <rt_user_alloc+0x1a>
1c008c8e:	8f0d                	sub	a4,a4,a1
1c008c90:	c398                	sw	a4,0(a5)
1c008c92:	97ba                	add	a5,a5,a4
1c008c94:	b7f5                	j	1c008c80 <rt_user_alloc+0x1a>

1c008c96 <rt_user_free>:
1c008c96:	411c                	lw	a5,0(a0)
1c008c98:	061d                	addi	a2,a2,7
1c008c9a:	9a61                	andi	a2,a2,-8
1c008c9c:	4701                	li	a4,0
1c008c9e:	c399                	beqz	a5,1c008ca4 <rt_user_free+0xe>
1c008ca0:	02b7e763          	bltu	a5,a1,1c008cce <rt_user_free+0x38>
1c008ca4:	00c586b3          	add	a3,a1,a2
1c008ca8:	02d79663          	bne	a5,a3,1c008cd4 <rt_user_free+0x3e>
1c008cac:	4394                	lw	a3,0(a5)
1c008cae:	43dc                	lw	a5,4(a5)
1c008cb0:	9636                	add	a2,a2,a3
1c008cb2:	c190                	sw	a2,0(a1)
1c008cb4:	c1dc                	sw	a5,4(a1)
1c008cb6:	c31d                	beqz	a4,1c008cdc <rt_user_free+0x46>
1c008cb8:	4314                	lw	a3,0(a4)
1c008cba:	00d707b3          	add	a5,a4,a3
1c008cbe:	00f59d63          	bne	a1,a5,1c008cd8 <rt_user_free+0x42>
1c008cc2:	419c                	lw	a5,0(a1)
1c008cc4:	97b6                	add	a5,a5,a3
1c008cc6:	c31c                	sw	a5,0(a4)
1c008cc8:	41dc                	lw	a5,4(a1)
1c008cca:	c35c                	sw	a5,4(a4)
1c008ccc:	8082                	ret
1c008cce:	873e                	mv	a4,a5
1c008cd0:	43dc                	lw	a5,4(a5)
1c008cd2:	b7f1                	j	1c008c9e <rt_user_free+0x8>
1c008cd4:	c190                	sw	a2,0(a1)
1c008cd6:	bff9                	j	1c008cb4 <rt_user_free+0x1e>
1c008cd8:	c34c                	sw	a1,4(a4)
1c008cda:	8082                	ret
1c008cdc:	c10c                	sw	a1,0(a0)
1c008cde:	8082                	ret

1c008ce0 <rt_alloc>:
1c008ce0:	1101                	addi	sp,sp,-32
1c008ce2:	cc22                	sw	s0,24(sp)
1c008ce4:	ce06                	sw	ra,28(sp)
1c008ce6:	ca26                	sw	s1,20(sp)
1c008ce8:	c84a                	sw	s2,16(sp)
1c008cea:	c64e                	sw	s3,12(sp)
1c008cec:	c452                	sw	s4,8(sp)
1c008cee:	4789                	li	a5,2
1c008cf0:	842a                	mv	s0,a0
1c008cf2:	02a7ed63          	bltu	a5,a0,1c008d2c <rt_alloc+0x4c>
1c008cf6:	1c001937          	lui	s2,0x1c001
1c008cfa:	89ae                	mv	s3,a1
1c008cfc:	448d                	li	s1,3
1c008cfe:	1f890913          	addi	s2,s2,504 # 1c0011f8 <__rt_alloc_l2>
1c008d02:	4a0d                	li	s4,3
1c008d04:	00241513          	slli	a0,s0,0x2
1c008d08:	85ce                	mv	a1,s3
1c008d0a:	954a                	add	a0,a0,s2
1c008d0c:	3fa9                	jal	1c008c66 <rt_user_alloc>
1c008d0e:	e519                	bnez	a0,1c008d1c <rt_alloc+0x3c>
1c008d10:	0405                	addi	s0,s0,1
1c008d12:	01441363          	bne	s0,s4,1c008d18 <rt_alloc+0x38>
1c008d16:	4401                	li	s0,0
1c008d18:	14fd                	addi	s1,s1,-1
1c008d1a:	f4ed                	bnez	s1,1c008d04 <rt_alloc+0x24>
1c008d1c:	40f2                	lw	ra,28(sp)
1c008d1e:	4462                	lw	s0,24(sp)
1c008d20:	44d2                	lw	s1,20(sp)
1c008d22:	4942                	lw	s2,16(sp)
1c008d24:	49b2                	lw	s3,12(sp)
1c008d26:	4a22                	lw	s4,8(sp)
1c008d28:	6105                	addi	sp,sp,32
1c008d2a:	8082                	ret
1c008d2c:	1c0017b7          	lui	a5,0x1c001
1c008d30:	ffd50413          	addi	s0,a0,-3
1c008d34:	1f47a503          	lw	a0,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008d38:	040a                	slli	s0,s0,0x2
1c008d3a:	40f2                	lw	ra,28(sp)
1c008d3c:	9522                	add	a0,a0,s0
1c008d3e:	4462                	lw	s0,24(sp)
1c008d40:	44d2                	lw	s1,20(sp)
1c008d42:	4942                	lw	s2,16(sp)
1c008d44:	49b2                	lw	s3,12(sp)
1c008d46:	4a22                	lw	s4,8(sp)
1c008d48:	6105                	addi	sp,sp,32
1c008d4a:	bf31                	j	1c008c66 <rt_user_alloc>

1c008d4c <__rt_alloc_init_l1>:
1c008d4c:	1c0017b7          	lui	a5,0x1c001
1c008d50:	1f47a703          	lw	a4,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008d54:	100007b7          	lui	a5,0x10000
1c008d58:	01651593          	slli	a1,a0,0x16
1c008d5c:	6641                	lui	a2,0x10
1c008d5e:	050a                	slli	a0,a0,0x2
1c008d60:	02078793          	addi	a5,a5,32 # 10000020 <__l1_end>
1c008d64:	fe060613          	addi	a2,a2,-32 # ffe0 <__l1_heap_size>
1c008d68:	95be                	add	a1,a1,a5
1c008d6a:	953a                	add	a0,a0,a4
1c008d6c:	bdf9                	j	1c008c4a <rt_user_alloc_init>

1c008d6e <__rt_alloc_init_l1_for_fc>:
1c008d6e:	100005b7          	lui	a1,0x10000
1c008d72:	01651793          	slli	a5,a0,0x16
1c008d76:	02058593          	addi	a1,a1,32 # 10000020 <__l1_end>
1c008d7a:	00b78733          	add	a4,a5,a1
1c008d7e:	050a                	slli	a0,a0,0x2
1c008d80:	0791                	addi	a5,a5,4
1c008d82:	6641                	lui	a2,0x10
1c008d84:	1c0016b7          	lui	a3,0x1c001
1c008d88:	fdc60613          	addi	a2,a2,-36 # ffdc <__rt_hyper_pending_emu_stride+0xfd34>
1c008d8c:	95be                	add	a1,a1,a5
1c008d8e:	953a                	add	a0,a0,a4
1c008d90:	1ee6aa23          	sw	a4,500(a3) # 1c0011f4 <__rt_alloc_l1>
1c008d94:	bd5d                	j	1c008c4a <rt_user_alloc_init>

1c008d96 <__rt_allocs_init>:
1c008d96:	1141                	addi	sp,sp,-16
1c008d98:	1c0015b7          	lui	a1,0x1c001
1c008d9c:	c606                	sw	ra,12(sp)
1c008d9e:	24458793          	addi	a5,a1,580 # 1c001244 <__l2_priv0_end>
1c008da2:	1c008637          	lui	a2,0x1c008
1c008da6:	06c7ca63          	blt	a5,a2,1c008e1a <__rt_allocs_init+0x84>
1c008daa:	4581                	li	a1,0
1c008dac:	4601                	li	a2,0
1c008dae:	1c001537          	lui	a0,0x1c001
1c008db2:	1f850513          	addi	a0,a0,504 # 1c0011f8 <__rt_alloc_l2>
1c008db6:	3d51                	jal	1c008c4a <rt_user_alloc_init>
1c008db8:	1c00b5b7          	lui	a1,0x1c00b
1c008dbc:	6dc58793          	addi	a5,a1,1756 # 1c00b6dc <__l2_priv1_end>
1c008dc0:	1c010637          	lui	a2,0x1c010
1c008dc4:	04c7cf63          	blt	a5,a2,1c008e22 <__rt_allocs_init+0x8c>
1c008dc8:	4581                	li	a1,0
1c008dca:	4601                	li	a2,0
1c008dcc:	1c001537          	lui	a0,0x1c001
1c008dd0:	1fc50513          	addi	a0,a0,508 # 1c0011fc <__rt_alloc_l2+0x4>
1c008dd4:	3d9d                	jal	1c008c4a <rt_user_alloc_init>
1c008dd6:	1c0125b7          	lui	a1,0x1c012
1c008dda:	9a458793          	addi	a5,a1,-1628 # 1c0119a4 <__l2_shared_end>
1c008dde:	1c080637          	lui	a2,0x1c080
1c008de2:	1c001537          	lui	a0,0x1c001
1c008de6:	8e1d                	sub	a2,a2,a5
1c008de8:	9a458593          	addi	a1,a1,-1628
1c008dec:	20050513          	addi	a0,a0,512 # 1c001200 <__rt_alloc_l2+0x8>
1c008df0:	3da9                	jal	1c008c4a <rt_user_alloc_init>
1c008df2:	f14027f3          	csrr	a5,mhartid
1c008df6:	8795                	srai	a5,a5,0x5
1c008df8:	03f7f793          	andi	a5,a5,63
1c008dfc:	e789                	bnez	a5,1c008e06 <__rt_allocs_init+0x70>
1c008dfe:	40b2                	lw	ra,12(sp)
1c008e00:	4501                	li	a0,0
1c008e02:	0141                	addi	sp,sp,16
1c008e04:	b7ad                	j	1c008d6e <__rt_alloc_init_l1_for_fc>
1c008e06:	4591                	li	a1,4
1c008e08:	4501                	li	a0,0
1c008e0a:	3dd9                	jal	1c008ce0 <rt_alloc>
1c008e0c:	40b2                	lw	ra,12(sp)
1c008e0e:	1c0017b7          	lui	a5,0x1c001
1c008e12:	1ea7aa23          	sw	a0,500(a5) # 1c0011f4 <__rt_alloc_l1>
1c008e16:	0141                	addi	sp,sp,16
1c008e18:	8082                	ret
1c008e1a:	8e1d                	sub	a2,a2,a5
1c008e1c:	24458593          	addi	a1,a1,580
1c008e20:	b779                	j	1c008dae <__rt_allocs_init+0x18>
1c008e22:	8e1d                	sub	a2,a2,a5
1c008e24:	6dc58593          	addi	a1,a1,1756
1c008e28:	b755                	j	1c008dcc <__rt_allocs_init+0x36>

1c008e2a <__rt_init_cluster_data>:
1c008e2a:	04050793          	addi	a5,a0,64
1c008e2e:	01679693          	slli	a3,a5,0x16
1c008e32:	6705                	lui	a4,0x1
1c008e34:	177d                	addi	a4,a4,-1
1c008e36:	00400793          	li	a5,4
1c008e3a:	8ff9                	and	a5,a5,a4
1c008e3c:	1c012737          	lui	a4,0x1c012
1c008e40:	97b6                	add	a5,a5,a3
1c008e42:	98870713          	addi	a4,a4,-1656 # 1c011988 <_l1_preload_start_inL2>
1c008e46:	01c00613          	li	a2,28
1c008e4a:	8f99                	sub	a5,a5,a4
1c008e4c:	00f705b3          	add	a1,a4,a5
1c008e50:	02c04b63          	bgtz	a2,1c008e86 <__rt_init_cluster_data+0x5c>
1c008e54:	02800713          	li	a4,40
1c008e58:	02e50733          	mul	a4,a0,a4
1c008e5c:	1c0017b7          	lui	a5,0x1c001
1c008e60:	20878513          	addi	a0,a5,520 # 1c001208 <__rt_fc_cluster_data>
1c008e64:	002017b7          	lui	a5,0x201
1c008e68:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c008e6c:	97b6                	add	a5,a5,a3
1c008e6e:	953a                	add	a0,a0,a4
1c008e70:	c91c                	sw	a5,16(a0)
1c008e72:	6705                	lui	a4,0x1
1c008e74:	00400793          	li	a5,4
1c008e78:	177d                	addi	a4,a4,-1
1c008e7a:	8ff9                	and	a5,a5,a4
1c008e7c:	97b6                	add	a5,a5,a3
1c008e7e:	00052423          	sw	zero,8(a0)
1c008e82:	c95c                	sw	a5,20(a0)
1c008e84:	8082                	ret
1c008e86:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008e8a:	1671                	addi	a2,a2,-4
1c008e8c:	0711                	addi	a4,a4,4
1c008e8e:	0105a023          	sw	a6,0(a1)
1c008e92:	bf6d                	j	1c008e4c <__rt_init_cluster_data+0x22>

1c008e94 <__rt_cluster_mount_step>:
1c008e94:	7179                	addi	sp,sp,-48
1c008e96:	d04a                	sw	s2,32(sp)
1c008e98:	ce4e                	sw	s3,28(sp)
1c008e9a:	6785                	lui	a5,0x1
1c008e9c:	1c0089b7          	lui	s3,0x1c008
1c008ea0:	00400913          	li	s2,4
1c008ea4:	17fd                	addi	a5,a5,-1
1c008ea6:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008eaa:	d422                	sw	s0,40(sp)
1c008eac:	d606                	sw	ra,44(sp)
1c008eae:	d226                	sw	s1,36(sp)
1c008eb0:	cc52                	sw	s4,24(sp)
1c008eb2:	842a                	mv	s0,a0
1c008eb4:	00f97933          	and	s2,s2,a5
1c008eb8:	f009f993          	andi	s3,s3,-256
1c008ebc:	4c5c                	lw	a5,28(s0)
1c008ebe:	4705                	li	a4,1
1c008ec0:	02e78d63          	beq	a5,a4,1c008efa <__rt_cluster_mount_step+0x66>
1c008ec4:	4709                	li	a4,2
1c008ec6:	0ae78d63          	beq	a5,a4,1c008f80 <__rt_cluster_mount_step+0xec>
1c008eca:	e7dd                	bnez	a5,1c008f78 <__rt_cluster_mount_step+0xe4>
1c008ecc:	5018                	lw	a4,32(s0)
1c008ece:	00042c23          	sw	zero,24(s0)
1c008ed2:	eb01                	bnez	a4,1c008ee2 <__rt_cluster_mount_step+0x4e>
1c008ed4:	5048                	lw	a0,36(s0)
1c008ed6:	006c                	addi	a1,sp,12
1c008ed8:	c602                	sw	zero,12(sp)
1c008eda:	1d4010ef          	jal	ra,1c00a0ae <__rt_pmu_cluster_power_up>
1c008ede:	47b2                	lw	a5,12(sp)
1c008ee0:	cc08                	sw	a0,24(s0)
1c008ee2:	4c58                	lw	a4,28(s0)
1c008ee4:	0705                	addi	a4,a4,1
1c008ee6:	cc58                	sw	a4,28(s0)
1c008ee8:	dbf1                	beqz	a5,1c008ebc <__rt_cluster_mount_step+0x28>
1c008eea:	50b2                	lw	ra,44(sp)
1c008eec:	5422                	lw	s0,40(sp)
1c008eee:	5492                	lw	s1,36(sp)
1c008ef0:	5902                	lw	s2,32(sp)
1c008ef2:	49f2                	lw	s3,28(sp)
1c008ef4:	4a62                	lw	s4,24(sp)
1c008ef6:	6145                	addi	sp,sp,48
1c008ef8:	8082                	ret
1c008efa:	02042a03          	lw	s4,32(s0)
1c008efe:	040a0493          	addi	s1,s4,64
1c008f02:	04da                	slli	s1,s1,0x16
1c008f04:	00990733          	add	a4,s2,s1
1c008f08:	00072223          	sw	zero,4(a4)
1c008f0c:	00072423          	sw	zero,8(a4)
1c008f10:	00072023          	sw	zero,0(a4)
1c008f14:	1c001737          	lui	a4,0x1c001
1c008f18:	0dc72703          	lw	a4,220(a4) # 1c0010dc <__rt_platform>
1c008f1c:	00f70f63          	beq	a4,a5,1c008f3a <__rt_cluster_mount_step+0xa6>
1c008f20:	4505                	li	a0,1
1c008f22:	713000ef          	jal	ra,1c009e34 <__rt_fll_init>
1c008f26:	1c0017b7          	lui	a5,0x1c001
1c008f2a:	23878793          	addi	a5,a5,568 # 1c001238 <__rt_freq_domains>
1c008f2e:	43cc                	lw	a1,4(a5)
1c008f30:	c5b1                	beqz	a1,1c008f7c <__rt_cluster_mount_step+0xe8>
1c008f32:	4601                	li	a2,0
1c008f34:	4505                	li	a0,1
1c008f36:	094010ef          	jal	ra,1c009fca <rt_freq_set_and_get>
1c008f3a:	8552                	mv	a0,s4
1c008f3c:	35fd                	jal	1c008e2a <__rt_init_cluster_data>
1c008f3e:	8552                	mv	a0,s4
1c008f40:	3531                	jal	1c008d4c <__rt_alloc_init_l1>
1c008f42:	002017b7          	lui	a5,0x201
1c008f46:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1420>
1c008f4a:	97a6                	add	a5,a5,s1
1c008f4c:	577d                	li	a4,-1
1c008f4e:	c398                	sw	a4,0(a5)
1c008f50:	002007b7          	lui	a5,0x200
1c008f54:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f0060>
1c008f58:	06078793          	addi	a5,a5,96
1c008f5c:	9726                	add	a4,a4,s1
1c008f5e:	97a6                	add	a5,a5,s1
1c008f60:	01372023          	sw	s3,0(a4)
1c008f64:	0711                	addi	a4,a4,4
1c008f66:	fef71de3          	bne	a4,a5,1c008f60 <__rt_cluster_mount_step+0xcc>
1c008f6a:	002007b7          	lui	a5,0x200
1c008f6e:	07a1                	addi	a5,a5,8
1c008f70:	94be                	add	s1,s1,a5
1c008f72:	0ff00793          	li	a5,255
1c008f76:	c09c                	sw	a5,0(s1)
1c008f78:	4781                	li	a5,0
1c008f7a:	b7a5                	j	1c008ee2 <__rt_cluster_mount_step+0x4e>
1c008f7c:	c3c8                	sw	a0,4(a5)
1c008f7e:	bf75                	j	1c008f3a <__rt_cluster_mount_step+0xa6>
1c008f80:	505c                	lw	a5,36(s0)
1c008f82:	5b98                	lw	a4,48(a5)
1c008f84:	d398                	sw	a4,32(a5)
1c008f86:	5798                	lw	a4,40(a5)
1c008f88:	c398                	sw	a4,0(a5)
1c008f8a:	57d8                	lw	a4,44(a5)
1c008f8c:	c3d8                	sw	a4,4(a5)
1c008f8e:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f0050>
1c008f92:	505c                	lw	a5,36(s0)
1c008f94:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008f98:	0007ac23          	sw	zero,24(a5)
1c008f9c:	cb01                	beqz	a4,1c008fac <__rt_cluster_mount_step+0x118>
1c008f9e:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008fa2:	cf1c                	sw	a5,24(a4)
1c008fa4:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008fa8:	4785                	li	a5,1
1c008faa:	bf25                	j	1c008ee2 <__rt_cluster_mount_step+0x4e>
1c008fac:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008fb0:	bfd5                	j	1c008fa4 <__rt_cluster_mount_step+0x110>

1c008fb2 <__rt_cluster_init>:
1c008fb2:	1c001537          	lui	a0,0x1c001
1c008fb6:	1141                	addi	sp,sp,-16
1c008fb8:	02800613          	li	a2,40
1c008fbc:	4581                	li	a1,0
1c008fbe:	20850513          	addi	a0,a0,520 # 1c001208 <__rt_fc_cluster_data>
1c008fc2:	c606                	sw	ra,12(sp)
1c008fc4:	061010ef          	jal	ra,1c00a824 <memset>
1c008fc8:	1c0085b7          	lui	a1,0x1c008
1c008fcc:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008fd0:	4505                	li	a0,1
1c008fd2:	23ed                	jal	1c0095bc <rt_irq_set_handler>
1c008fd4:	f14027f3          	csrr	a5,mhartid
1c008fd8:	8795                	srai	a5,a5,0x5
1c008fda:	03f7f793          	andi	a5,a5,63
1c008fde:	477d                	li	a4,31
1c008fe0:	02e79e63          	bne	a5,a4,1c00901c <__rt_cluster_init+0x6a>
1c008fe4:	1a10a7b7          	lui	a5,0x1a10a
1c008fe8:	4709                	li	a4,2
1c008fea:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c008fee:	1c0085b7          	lui	a1,0x1c008
1c008ff2:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008ff6:	4511                	li	a0,4
1c008ff8:	23d1                	jal	1c0095bc <rt_irq_set_handler>
1c008ffa:	f14027f3          	csrr	a5,mhartid
1c008ffe:	8795                	srai	a5,a5,0x5
1c009000:	03f7f793          	andi	a5,a5,63
1c009004:	477d                	li	a4,31
1c009006:	02e79063          	bne	a5,a4,1c009026 <__rt_cluster_init+0x74>
1c00900a:	1a10a7b7          	lui	a5,0x1a10a
1c00900e:	4741                	li	a4,16
1c009010:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c009014:	40b2                	lw	ra,12(sp)
1c009016:	4501                	li	a0,0
1c009018:	0141                	addi	sp,sp,16
1c00901a:	8082                	ret
1c00901c:	002047b7          	lui	a5,0x204
1c009020:	4709                	li	a4,2
1c009022:	cbd8                	sw	a4,20(a5)
1c009024:	b7e9                	j	1c008fee <__rt_cluster_init+0x3c>
1c009026:	002047b7          	lui	a5,0x204
1c00902a:	4741                	li	a4,16
1c00902c:	cbd8                	sw	a4,20(a5)
1c00902e:	b7dd                	j	1c009014 <__rt_cluster_init+0x62>

1c009030 <pi_cluster_conf_init>:
1c009030:	00052223          	sw	zero,4(a0)
1c009034:	8082                	ret

1c009036 <pi_cluster_open>:
1c009036:	1101                	addi	sp,sp,-32
1c009038:	ce06                	sw	ra,28(sp)
1c00903a:	cc22                	sw	s0,24(sp)
1c00903c:	ca26                	sw	s1,20(sp)
1c00903e:	c84a                	sw	s2,16(sp)
1c009040:	c64e                	sw	s3,12(sp)
1c009042:	30047973          	csrrci	s2,mstatus,8
1c009046:	00452983          	lw	s3,4(a0)
1c00904a:	02800793          	li	a5,40
1c00904e:	0049a483          	lw	s1,4(s3)
1c009052:	02f484b3          	mul	s1,s1,a5
1c009056:	1c0017b7          	lui	a5,0x1c001
1c00905a:	20878793          	addi	a5,a5,520 # 1c001208 <__rt_fc_cluster_data>
1c00905e:	94be                	add	s1,s1,a5
1c009060:	c504                	sw	s1,8(a0)
1c009062:	3a3000ef          	jal	ra,1c009c04 <__rt_wait_event_prepare_blocking>
1c009066:	f14027f3          	csrr	a5,mhartid
1c00906a:	8795                	srai	a5,a5,0x5
1c00906c:	03f7f793          	andi	a5,a5,63
1c009070:	477d                	li	a4,31
1c009072:	842a                	mv	s0,a0
1c009074:	04e79463          	bne	a5,a4,1c0090bc <pi_cluster_open+0x86>
1c009078:	511c                	lw	a5,32(a0)
1c00907a:	0004ae23          	sw	zero,28(s1)
1c00907e:	d0c8                	sw	a0,36(s1)
1c009080:	d91c                	sw	a5,48(a0)
1c009082:	411c                	lw	a5,0(a0)
1c009084:	02052223          	sw	zero,36(a0)
1c009088:	d51c                	sw	a5,40(a0)
1c00908a:	415c                	lw	a5,4(a0)
1c00908c:	c144                	sw	s1,4(a0)
1c00908e:	d55c                	sw	a5,44(a0)
1c009090:	1c0097b7          	lui	a5,0x1c009
1c009094:	e9478793          	addi	a5,a5,-364 # 1c008e94 <__rt_cluster_mount_step>
1c009098:	c11c                	sw	a5,0(a0)
1c00909a:	4785                	li	a5,1
1c00909c:	d11c                	sw	a5,32(a0)
1c00909e:	8526                	mv	a0,s1
1c0090a0:	3bd5                	jal	1c008e94 <__rt_cluster_mount_step>
1c0090a2:	8522                	mv	a0,s0
1c0090a4:	4b1000ef          	jal	ra,1c009d54 <__rt_wait_event>
1c0090a8:	30091073          	csrw	mstatus,s2
1c0090ac:	40f2                	lw	ra,28(sp)
1c0090ae:	4462                	lw	s0,24(sp)
1c0090b0:	44d2                	lw	s1,20(sp)
1c0090b2:	4942                	lw	s2,16(sp)
1c0090b4:	49b2                	lw	s3,12(sp)
1c0090b6:	4501                	li	a0,0
1c0090b8:	6105                	addi	sp,sp,32
1c0090ba:	8082                	ret
1c0090bc:	0049a483          	lw	s1,4(s3)
1c0090c0:	8526                	mv	a0,s1
1c0090c2:	33a5                	jal	1c008e2a <__rt_init_cluster_data>
1c0090c4:	04048513          	addi	a0,s1,64
1c0090c8:	002017b7          	lui	a5,0x201
1c0090cc:	055a                	slli	a0,a0,0x16
1c0090ce:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f1420>
1c0090d2:	97aa                	add	a5,a5,a0
1c0090d4:	577d                	li	a4,-1
1c0090d6:	c398                	sw	a4,0(a5)
1c0090d8:	1c0086b7          	lui	a3,0x1c008
1c0090dc:	002007b7          	lui	a5,0x200
1c0090e0:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f0064>
1c0090e4:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c0090e8:	06078793          	addi	a5,a5,96
1c0090ec:	972a                	add	a4,a4,a0
1c0090ee:	97aa                	add	a5,a5,a0
1c0090f0:	f006f693          	andi	a3,a3,-256
1c0090f4:	c314                	sw	a3,0(a4)
1c0090f6:	0711                	addi	a4,a4,4
1c0090f8:	fef71ee3          	bne	a4,a5,1c0090f4 <pi_cluster_open+0xbe>
1c0090fc:	002007b7          	lui	a5,0x200
1c009100:	07a1                	addi	a5,a5,8
1c009102:	953e                	add	a0,a0,a5
1c009104:	57fd                	li	a5,-1
1c009106:	c11c                	sw	a5,0(a0)
1c009108:	8522                	mv	a0,s0
1c00910a:	3c7000ef          	jal	ra,1c009cd0 <rt_event_push>
1c00910e:	bf51                	j	1c0090a2 <pi_cluster_open+0x6c>

1c009110 <pi_cluster_close>:
1c009110:	451c                	lw	a5,8(a0)
1c009112:	1101                	addi	sp,sp,-32
1c009114:	cc22                	sw	s0,24(sp)
1c009116:	5380                	lw	s0,32(a5)
1c009118:	1c0017b7          	lui	a5,0x1c001
1c00911c:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c009120:	ce06                	sw	ra,28(sp)
1c009122:	4785                	li	a5,1
1c009124:	00f70563          	beq	a4,a5,1c00912e <pi_cluster_close+0x1e>
1c009128:	4505                	li	a0,1
1c00912a:	5c1000ef          	jal	ra,1c009eea <__rt_fll_deinit>
1c00912e:	c602                	sw	zero,12(sp)
1c009130:	e409                	bnez	s0,1c00913a <pi_cluster_close+0x2a>
1c009132:	006c                	addi	a1,sp,12
1c009134:	4501                	li	a0,0
1c009136:	735000ef          	jal	ra,1c00a06a <__rt_pmu_cluster_power_down>
1c00913a:	40f2                	lw	ra,28(sp)
1c00913c:	4462                	lw	s0,24(sp)
1c00913e:	4501                	li	a0,0
1c009140:	6105                	addi	sp,sp,32
1c009142:	8082                	ret

1c009144 <__rt_cluster_push_fc_event>:
1c009144:	002047b7          	lui	a5,0x204
1c009148:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f40e0>
1c00914c:	0007e703          	p.elw	a4,0(a5)
1c009150:	f14027f3          	csrr	a5,mhartid
1c009154:	8795                	srai	a5,a5,0x5
1c009156:	02800693          	li	a3,40
1c00915a:	03f7f793          	andi	a5,a5,63
1c00915e:	02d787b3          	mul	a5,a5,a3
1c009162:	1c001737          	lui	a4,0x1c001
1c009166:	20870713          	addi	a4,a4,520 # 1c001208 <__rt_fc_cluster_data>
1c00916a:	4689                	li	a3,2
1c00916c:	97ba                	add	a5,a5,a4
1c00916e:	00204737          	lui	a4,0x204
1c009172:	43d0                	lw	a2,4(a5)
1c009174:	ee01                	bnez	a2,1c00918c <__rt_cluster_push_fc_event+0x48>
1c009176:	c3c8                	sw	a0,4(a5)
1c009178:	4709                	li	a4,2
1c00917a:	1a10a7b7          	lui	a5,0x1a10a
1c00917e:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1097f0>
1c009182:	002047b7          	lui	a5,0x204
1c009186:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f40e0>
1c00918a:	8082                	ret
1c00918c:	c714                	sw	a3,8(a4)
1c00918e:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c009192:	c354                	sw	a3,4(a4)
1c009194:	bff9                	j	1c009172 <__rt_cluster_push_fc_event+0x2e>

1c009196 <__rt_cluster_new>:
1c009196:	1c0095b7          	lui	a1,0x1c009
1c00919a:	1141                	addi	sp,sp,-16
1c00919c:	4601                	li	a2,0
1c00919e:	fb258593          	addi	a1,a1,-78 # 1c008fb2 <__rt_cluster_init>
1c0091a2:	4501                	li	a0,0
1c0091a4:	c606                	sw	ra,12(sp)
1c0091a6:	235d                	jal	1c00974c <__rt_cbsys_add>
1c0091a8:	c105                	beqz	a0,1c0091c8 <__rt_cluster_new+0x32>
1c0091aa:	f1402673          	csrr	a2,mhartid
1c0091ae:	1c000537          	lui	a0,0x1c000
1c0091b2:	40565593          	srai	a1,a2,0x5
1c0091b6:	03f5f593          	andi	a1,a1,63
1c0091ba:	8a7d                	andi	a2,a2,31
1c0091bc:	55450513          	addi	a0,a0,1364 # 1c000554 <__DTOR_END__+0x268>
1c0091c0:	0b1010ef          	jal	ra,1c00aa70 <printf>
1c0091c4:	039010ef          	jal	ra,1c00a9fc <abort>
1c0091c8:	40b2                	lw	ra,12(sp)
1c0091ca:	0141                	addi	sp,sp,16
1c0091cc:	8082                	ret

1c0091ce <__rt_cluster_pulpos_emu_init>:
1c0091ce:	1141                	addi	sp,sp,-16
1c0091d0:	45b1                	li	a1,12
1c0091d2:	4501                	li	a0,0
1c0091d4:	c606                	sw	ra,12(sp)
1c0091d6:	3629                	jal	1c008ce0 <rt_alloc>
1c0091d8:	1c0017b7          	lui	a5,0x1c001
1c0091dc:	1ca7a423          	sw	a0,456(a5) # 1c0011c8 <__rt_fc_cluster_device>
1c0091e0:	e105                	bnez	a0,1c009200 <__rt_cluster_pulpos_emu_init+0x32>
1c0091e2:	f1402673          	csrr	a2,mhartid
1c0091e6:	1c000537          	lui	a0,0x1c000
1c0091ea:	40565593          	srai	a1,a2,0x5
1c0091ee:	03f5f593          	andi	a1,a1,63
1c0091f2:	8a7d                	andi	a2,a2,31
1c0091f4:	59c50513          	addi	a0,a0,1436 # 1c00059c <__DTOR_END__+0x2b0>
1c0091f8:	079010ef          	jal	ra,1c00aa70 <printf>
1c0091fc:	001010ef          	jal	ra,1c00a9fc <abort>
1c009200:	40b2                	lw	ra,12(sp)
1c009202:	0141                	addi	sp,sp,16
1c009204:	8082                	ret

1c009206 <rt_cluster_call>:
1c009206:	7139                	addi	sp,sp,-64
1c009208:	d84a                	sw	s2,48(sp)
1c00920a:	4906                	lw	s2,64(sp)
1c00920c:	dc22                	sw	s0,56(sp)
1c00920e:	842e                	mv	s0,a1
1c009210:	de06                	sw	ra,60(sp)
1c009212:	da26                	sw	s1,52(sp)
1c009214:	d64e                	sw	s3,44(sp)
1c009216:	300479f3          	csrrci	s3,mstatus,8
1c00921a:	84ca                	mv	s1,s2
1c00921c:	02091163          	bnez	s2,1c00923e <rt_cluster_call+0x38>
1c009220:	ce32                	sw	a2,28(sp)
1c009222:	cc36                	sw	a3,24(sp)
1c009224:	ca3a                	sw	a4,20(sp)
1c009226:	c83e                	sw	a5,16(sp)
1c009228:	c642                	sw	a6,12(sp)
1c00922a:	c446                	sw	a7,8(sp)
1c00922c:	1d9000ef          	jal	ra,1c009c04 <__rt_wait_event_prepare_blocking>
1c009230:	48a2                	lw	a7,8(sp)
1c009232:	4832                	lw	a6,12(sp)
1c009234:	47c2                	lw	a5,16(sp)
1c009236:	4752                	lw	a4,20(sp)
1c009238:	46e2                	lw	a3,24(sp)
1c00923a:	4672                	lw	a2,28(sp)
1c00923c:	84aa                	mv	s1,a0
1c00923e:	4531                	li	a0,12
1c009240:	02a40433          	mul	s0,s0,a0
1c009244:	1c0015b7          	lui	a1,0x1c001
1c009248:	10058313          	addi	t1,a1,256 # 1c001100 <__rt_pulpos_emu_global_cluster_task>
1c00924c:	00f32623          	sw	a5,12(t1)
1c009250:	1c0017b7          	lui	a5,0x1c001
1c009254:	1c87a503          	lw	a0,456(a5) # 1c0011c8 <__rt_fc_cluster_device>
1c009258:	00c32023          	sw	a2,0(t1)
1c00925c:	10058593          	addi	a1,a1,256
1c009260:	8626                	mv	a2,s1
1c009262:	00d32223          	sw	a3,4(t1)
1c009266:	9522                	add	a0,a0,s0
1c009268:	00e32423          	sw	a4,8(t1)
1c00926c:	01032823          	sw	a6,16(t1)
1c009270:	01132a23          	sw	a7,20(t1)
1c009274:	2041                	jal	1c0092f4 <pi_cluster_send_task_to_cl_async>
1c009276:	842a                	mv	s0,a0
1c009278:	cd01                	beqz	a0,1c009290 <rt_cluster_call+0x8a>
1c00927a:	30099073          	csrw	mstatus,s3
1c00927e:	547d                	li	s0,-1
1c009280:	8522                	mv	a0,s0
1c009282:	50f2                	lw	ra,60(sp)
1c009284:	5462                	lw	s0,56(sp)
1c009286:	54d2                	lw	s1,52(sp)
1c009288:	5942                	lw	s2,48(sp)
1c00928a:	59b2                	lw	s3,44(sp)
1c00928c:	6121                	addi	sp,sp,64
1c00928e:	8082                	ret
1c009290:	00091563          	bnez	s2,1c00929a <rt_cluster_call+0x94>
1c009294:	8526                	mv	a0,s1
1c009296:	2bf000ef          	jal	ra,1c009d54 <__rt_wait_event>
1c00929a:	30099073          	csrw	mstatus,s3
1c00929e:	b7cd                	j	1c009280 <rt_cluster_call+0x7a>

1c0092a0 <rt_cluster_mount>:
1c0092a0:	7139                	addi	sp,sp,-64
1c0092a2:	dc22                	sw	s0,56(sp)
1c0092a4:	da26                	sw	s1,52(sp)
1c0092a6:	d84a                	sw	s2,48(sp)
1c0092a8:	4431                	li	s0,12
1c0092aa:	1c0014b7          	lui	s1,0x1c001
1c0092ae:	de06                	sw	ra,60(sp)
1c0092b0:	d64e                	sw	s3,44(sp)
1c0092b2:	8936                	mv	s2,a3
1c0092b4:	02858433          	mul	s0,a1,s0
1c0092b8:	1c848493          	addi	s1,s1,456 # 1c0011c8 <__rt_fc_cluster_device>
1c0092bc:	c905                	beqz	a0,1c0092ec <rt_cluster_mount+0x4c>
1c0092be:	0068                	addi	a0,sp,12
1c0092c0:	89ae                	mv	s3,a1
1c0092c2:	33bd                	jal	1c009030 <pi_cluster_conf_init>
1c0092c4:	4088                	lw	a0,0(s1)
1c0092c6:	006c                	addi	a1,sp,12
1c0092c8:	9522                	add	a0,a0,s0
1c0092ca:	24fd                	jal	1c0095b8 <pi_open_from_conf>
1c0092cc:	4088                	lw	a0,0(s1)
1c0092ce:	c84e                	sw	s3,16(sp)
1c0092d0:	9522                	add	a0,a0,s0
1c0092d2:	3395                	jal	1c009036 <pi_cluster_open>
1c0092d4:	00090563          	beqz	s2,1c0092de <rt_cluster_mount+0x3e>
1c0092d8:	854a                	mv	a0,s2
1c0092da:	1f7000ef          	jal	ra,1c009cd0 <rt_event_push>
1c0092de:	50f2                	lw	ra,60(sp)
1c0092e0:	5462                	lw	s0,56(sp)
1c0092e2:	54d2                	lw	s1,52(sp)
1c0092e4:	5942                	lw	s2,48(sp)
1c0092e6:	59b2                	lw	s3,44(sp)
1c0092e8:	6121                	addi	sp,sp,64
1c0092ea:	8082                	ret
1c0092ec:	4088                	lw	a0,0(s1)
1c0092ee:	9522                	add	a0,a0,s0
1c0092f0:	3505                	jal	1c009110 <pi_cluster_close>
1c0092f2:	b7cd                	j	1c0092d4 <rt_cluster_mount+0x34>

1c0092f4 <pi_cluster_send_task_to_cl_async>:
1c0092f4:	1101                	addi	sp,sp,-32
1c0092f6:	ca26                	sw	s1,20(sp)
1c0092f8:	4504                	lw	s1,8(a0)
1c0092fa:	cc22                	sw	s0,24(sp)
1c0092fc:	c256                	sw	s5,4(sp)
1c0092fe:	842e                	mv	s0,a1
1c009300:	8ab2                	mv	s5,a2
1c009302:	ce06                	sw	ra,28(sp)
1c009304:	c84a                	sw	s2,16(sp)
1c009306:	c64e                	sw	s3,12(sp)
1c009308:	c452                	sw	s4,8(sp)
1c00930a:	30047a73          	csrrci	s4,mstatus,8
1c00930e:	00060823          	sb	zero,16(a2) # 1c080010 <__l2_shared_end+0x6e66c>
1c009312:	4785                	li	a5,1
1c009314:	d1dc                	sw	a5,36(a1)
1c009316:	49dc                	lw	a5,20(a1)
1c009318:	0144a983          	lw	s3,20(s1)
1c00931c:	e399                	bnez	a5,1c009322 <pi_cluster_send_task_to_cl_async+0x2e>
1c00931e:	47a1                	li	a5,8
1c009320:	c9dc                	sw	a5,20(a1)
1c009322:	441c                	lw	a5,8(s0)
1c009324:	eb8d                	bnez	a5,1c009356 <pi_cluster_send_task_to_cl_async+0x62>
1c009326:	445c                	lw	a5,12(s0)
1c009328:	e789                	bnez	a5,1c009332 <pi_cluster_send_task_to_cl_async+0x3e>
1c00932a:	40000793          	li	a5,1024
1c00932e:	c45c                	sw	a5,12(s0)
1c009330:	c81c                	sw	a5,16(s0)
1c009332:	4818                	lw	a4,16(s0)
1c009334:	445c                	lw	a5,12(s0)
1c009336:	e311                	bnez	a4,1c00933a <pi_cluster_send_task_to_cl_async+0x46>
1c009338:	c81c                	sw	a5,16(s0)
1c00933a:	01442903          	lw	s2,20(s0)
1c00933e:	4818                	lw	a4,16(s0)
1c009340:	448c                	lw	a1,8(s1)
1c009342:	197d                	addi	s2,s2,-1
1c009344:	02e90933          	mul	s2,s2,a4
1c009348:	993e                	add	s2,s2,a5
1c00934a:	c9bd                	beqz	a1,1c0093c0 <pi_cluster_send_task_to_cl_async+0xcc>
1c00934c:	44d0                	lw	a2,12(s1)
1c00934e:	07261063          	bne	a2,s2,1c0093ae <pi_cluster_send_task_to_cl_async+0xba>
1c009352:	449c                	lw	a5,8(s1)
1c009354:	c41c                	sw	a5,8(s0)
1c009356:	4858                	lw	a4,20(s0)
1c009358:	4785                	li	a5,1
1c00935a:	01542c23          	sw	s5,24(s0)
1c00935e:	00e797b3          	sll	a5,a5,a4
1c009362:	17fd                	addi	a5,a5,-1
1c009364:	d41c                	sw	a5,40(s0)
1c009366:	02042023          	sw	zero,32(s0)
1c00936a:	0089a783          	lw	a5,8(s3)
1c00936e:	cbbd                	beqz	a5,1c0093e4 <pi_cluster_send_task_to_cl_async+0xf0>
1c009370:	d380                	sw	s0,32(a5)
1c009372:	0089a423          	sw	s0,8(s3)
1c009376:	0009a783          	lw	a5,0(s3)
1c00937a:	e399                	bnez	a5,1c009380 <pi_cluster_send_task_to_cl_async+0x8c>
1c00937c:	0089a023          	sw	s0,0(s3)
1c009380:	509c                	lw	a5,32(s1)
1c009382:	00201737          	lui	a4,0x201
1c009386:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c00938a:	04078793          	addi	a5,a5,64
1c00938e:	07da                	slli	a5,a5,0x16
1c009390:	97ba                	add	a5,a5,a4
1c009392:	0007a023          	sw	zero,0(a5)
1c009396:	300a1073          	csrw	mstatus,s4
1c00939a:	4501                	li	a0,0
1c00939c:	40f2                	lw	ra,28(sp)
1c00939e:	4462                	lw	s0,24(sp)
1c0093a0:	44d2                	lw	s1,20(sp)
1c0093a2:	4942                	lw	s2,16(sp)
1c0093a4:	49b2                	lw	s3,12(sp)
1c0093a6:	4a22                	lw	s4,8(sp)
1c0093a8:	4a92                	lw	s5,4(sp)
1c0093aa:	6105                	addi	sp,sp,32
1c0093ac:	8082                	ret
1c0093ae:	509c                	lw	a5,32(s1)
1c0093b0:	1c001737          	lui	a4,0x1c001
1c0093b4:	1f472503          	lw	a0,500(a4) # 1c0011f4 <__rt_alloc_l1>
1c0093b8:	078a                	slli	a5,a5,0x2
1c0093ba:	953e                	add	a0,a0,a5
1c0093bc:	8dbff0ef          	jal	ra,1c008c96 <rt_user_free>
1c0093c0:	509c                	lw	a5,32(s1)
1c0093c2:	1c001737          	lui	a4,0x1c001
1c0093c6:	1f472503          	lw	a0,500(a4) # 1c0011f4 <__rt_alloc_l1>
1c0093ca:	078a                	slli	a5,a5,0x2
1c0093cc:	0124a623          	sw	s2,12(s1)
1c0093d0:	85ca                	mv	a1,s2
1c0093d2:	953e                	add	a0,a0,a5
1c0093d4:	893ff0ef          	jal	ra,1c008c66 <rt_user_alloc>
1c0093d8:	c488                	sw	a0,8(s1)
1c0093da:	fd25                	bnez	a0,1c009352 <pi_cluster_send_task_to_cl_async+0x5e>
1c0093dc:	300a1073          	csrw	mstatus,s4
1c0093e0:	557d                	li	a0,-1
1c0093e2:	bf6d                	j	1c00939c <pi_cluster_send_task_to_cl_async+0xa8>
1c0093e4:	0089a223          	sw	s0,4(s3)
1c0093e8:	b769                	j	1c009372 <pi_cluster_send_task_to_cl_async+0x7e>

1c0093ea <rt_perf_conf>:
1c0093ea:	c10c                	sw	a1,0(a0)
1c0093ec:	7a059073          	csrw	pcer,a1
1c0093f0:	8082                	ret

1c0093f2 <cluster_start>:
1c0093f2:	002047b7          	lui	a5,0x204
1c0093f6:	00070737          	lui	a4,0x70
1c0093fa:	c798                	sw	a4,8(a5)
1c0093fc:	0ff00713          	li	a4,255
1c009400:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f40a4>
1c009404:	20e7a023          	sw	a4,512(a5)
1c009408:	20e7a623          	sw	a4,524(a5)
1c00940c:	8082                	ret

1c00940e <__rt_init>:
1c00940e:	1101                	addi	sp,sp,-32
1c009410:	ce06                	sw	ra,28(sp)
1c009412:	cc22                	sw	s0,24(sp)
1c009414:	23d5                	jal	1c0099f8 <__rt_bridge_set_available>
1c009416:	1c0017b7          	lui	a5,0x1c001
1c00941a:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c00941e:	478d                	li	a5,3
1c009420:	02f71263          	bne	a4,a5,1c009444 <__rt_init+0x36>
1c009424:	7d005073          	csrwi	0x7d0,0
1c009428:	1c0007b7          	lui	a5,0x1c000
1c00942c:	70078793          	addi	a5,a5,1792 # 1c000700 <stack_start>
1c009430:	7d179073          	csrw	0x7d1,a5
1c009434:	1c0017b7          	lui	a5,0x1c001
1c009438:	f0078793          	addi	a5,a5,-256 # 1c000f00 <stack>
1c00943c:	7d279073          	csrw	0x7d2,a5
1c009440:	7d00d073          	csrwi	0x7d0,1
1c009444:	2c29                	jal	1c00965e <__rt_irq_init>
1c009446:	1a1067b7          	lui	a5,0x1a106
1c00944a:	577d                	li	a4,-1
1c00944c:	c3d8                	sw	a4,4(a5)
1c00944e:	1c0085b7          	lui	a1,0x1c008
1c009452:	c798                	sw	a4,8(a5)
1c009454:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c009458:	4569                	li	a0,26
1c00945a:	228d                	jal	1c0095bc <rt_irq_set_handler>
1c00945c:	f14027f3          	csrr	a5,mhartid
1c009460:	8795                	srai	a5,a5,0x5
1c009462:	03f7f793          	andi	a5,a5,63
1c009466:	477d                	li	a4,31
1c009468:	0ae79e63          	bne	a5,a4,1c009524 <__rt_init+0x116>
1c00946c:	1a10a7b7          	lui	a5,0x1a10a
1c009470:	04000737          	lui	a4,0x4000
1c009474:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c009478:	46d000ef          	jal	ra,1c00a0e4 <__rt_pmu_init>
1c00947c:	373000ef          	jal	ra,1c009fee <__rt_freq_init>
1c009480:	f14027f3          	csrr	a5,mhartid
1c009484:	8795                	srai	a5,a5,0x5
1c009486:	03f7f793          	andi	a5,a5,63
1c00948a:	477d                	li	a4,31
1c00948c:	00e78763          	beq	a5,a4,1c00949a <__rt_init+0x8c>
1c009490:	002017b7          	lui	a5,0x201
1c009494:	577d                	li	a4,-1
1c009496:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f1420>
1c00949a:	1c000437          	lui	s0,0x1c000
1c00949e:	2605                	jal	1c0097be <__rt_utils_init>
1c0094a0:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c0094a4:	8f3ff0ef          	jal	ra,1c008d96 <__rt_allocs_init>
1c0094a8:	25cd                	jal	1c009b8a <__rt_thread_sched_init>
1c0094aa:	0ed000ef          	jal	ra,1c009d96 <__rt_event_sched_init>
1c0094ae:	473000ef          	jal	ra,1c00a120 <__rt_padframe_init>
1c0094b2:	401c                	lw	a5,0(s0)
1c0094b4:	efb5                	bnez	a5,1c009530 <__rt_init+0x122>
1c0094b6:	30045073          	csrwi	mstatus,8
1c0094ba:	4501                	li	a0,0
1c0094bc:	2cc1                	jal	1c00978c <__rt_cbsys_exec>
1c0094be:	e521                	bnez	a0,1c009506 <__rt_init+0xf8>
1c0094c0:	f14027f3          	csrr	a5,mhartid
1c0094c4:	8795                	srai	a5,a5,0x5
1c0094c6:	03f7f793          	andi	a5,a5,63
1c0094ca:	477d                	li	a4,31
1c0094cc:	0ae78763          	beq	a5,a4,1c00957a <__rt_init+0x16c>
1c0094d0:	4681                	li	a3,0
1c0094d2:	4601                	li	a2,0
1c0094d4:	4581                	li	a1,0
1c0094d6:	4505                	li	a0,1
1c0094d8:	cfb9                	beqz	a5,1c009536 <__rt_init+0x128>
1c0094da:	33d9                	jal	1c0092a0 <rt_cluster_mount>
1c0094dc:	6591                	lui	a1,0x4
1c0094de:	450d                	li	a0,3
1c0094e0:	801ff0ef          	jal	ra,1c008ce0 <rt_alloc>
1c0094e4:	872a                	mv	a4,a0
1c0094e6:	c105                	beqz	a0,1c009506 <__rt_init+0xf8>
1c0094e8:	6805                	lui	a6,0x1
1c0094ea:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0094ee:	1c009637          	lui	a2,0x1c009
1c0094f2:	c002                	sw	zero,0(sp)
1c0094f4:	48a1                	li	a7,8
1c0094f6:	87c2                	mv	a5,a6
1c0094f8:	4681                	li	a3,0
1c0094fa:	3f260613          	addi	a2,a2,1010 # 1c0093f2 <cluster_start>
1c0094fe:	4581                	li	a1,0
1c009500:	4501                	li	a0,0
1c009502:	3311                	jal	1c009206 <rt_cluster_call>
1c009504:	c93d                	beqz	a0,1c00957a <__rt_init+0x16c>
1c009506:	f1402673          	csrr	a2,mhartid
1c00950a:	1c000537          	lui	a0,0x1c000
1c00950e:	40565593          	srai	a1,a2,0x5
1c009512:	03f5f593          	andi	a1,a1,63
1c009516:	8a7d                	andi	a2,a2,31
1c009518:	5f050513          	addi	a0,a0,1520 # 1c0005f0 <__DTOR_END__+0x304>
1c00951c:	554010ef          	jal	ra,1c00aa70 <printf>
1c009520:	4dc010ef          	jal	ra,1c00a9fc <abort>
1c009524:	002047b7          	lui	a5,0x204
1c009528:	04000737          	lui	a4,0x4000
1c00952c:	cbd8                	sw	a4,20(a5)
1c00952e:	b7a9                	j	1c009478 <__rt_init+0x6a>
1c009530:	9782                	jalr	a5
1c009532:	0411                	addi	s0,s0,4
1c009534:	bfbd                	j	1c0094b2 <__rt_init+0xa4>
1c009536:	33ad                	jal	1c0092a0 <rt_cluster_mount>
1c009538:	6591                	lui	a1,0x4
1c00953a:	80058593          	addi	a1,a1,-2048 # 3800 <__rt_hyper_pending_emu_stride+0x3558>
1c00953e:	450d                	li	a0,3
1c009540:	fa0ff0ef          	jal	ra,1c008ce0 <rt_alloc>
1c009544:	d169                	beqz	a0,1c009506 <__rt_init+0xf8>
1c009546:	00204737          	lui	a4,0x204
1c00954a:	0ff00793          	li	a5,255
1c00954e:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f40a4>
1c009552:	1c0107b7          	lui	a5,0x1c010
1c009556:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c00955a:	0017e793          	ori	a5,a5,1
1c00955e:	08f72023          	sw	a5,128(a4)
1c009562:	6785                	lui	a5,0x1
1c009564:	4462                	lw	s0,24(sp)
1c009566:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00956a:	08f72023          	sw	a5,128(a4)
1c00956e:	40f2                	lw	ra,28(sp)
1c009570:	08a72023          	sw	a0,128(a4)
1c009574:	4501                	li	a0,0
1c009576:	6105                	addi	sp,sp,32
1c009578:	bdad                	j	1c0093f2 <cluster_start>
1c00957a:	40f2                	lw	ra,28(sp)
1c00957c:	4462                	lw	s0,24(sp)
1c00957e:	6105                	addi	sp,sp,32
1c009580:	8082                	ret

1c009582 <__rt_deinit>:
1c009582:	1c0017b7          	lui	a5,0x1c001
1c009586:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c00958a:	1141                	addi	sp,sp,-16
1c00958c:	c606                	sw	ra,12(sp)
1c00958e:	c422                	sw	s0,8(sp)
1c009590:	478d                	li	a5,3
1c009592:	00f71463          	bne	a4,a5,1c00959a <__rt_deinit+0x18>
1c009596:	7d005073          	csrwi	0x7d0,0
1c00959a:	4505                	li	a0,1
1c00959c:	1c000437          	lui	s0,0x1c000
1c0095a0:	22f5                	jal	1c00978c <__rt_cbsys_exec>
1c0095a2:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c0095a6:	401c                	lw	a5,0(s0)
1c0095a8:	e789                	bnez	a5,1c0095b2 <__rt_deinit+0x30>
1c0095aa:	40b2                	lw	ra,12(sp)
1c0095ac:	4422                	lw	s0,8(sp)
1c0095ae:	0141                	addi	sp,sp,16
1c0095b0:	8082                	ret
1c0095b2:	9782                	jalr	a5
1c0095b4:	0411                	addi	s0,s0,4
1c0095b6:	bfc5                	j	1c0095a6 <__rt_deinit+0x24>

1c0095b8 <pi_open_from_conf>:
1c0095b8:	c14c                	sw	a1,4(a0)
1c0095ba:	8082                	ret

1c0095bc <rt_irq_set_handler>:
1c0095bc:	f14027f3          	csrr	a5,mhartid
1c0095c0:	8795                	srai	a5,a5,0x5
1c0095c2:	03f7f793          	andi	a5,a5,63
1c0095c6:	477d                	li	a4,31
1c0095c8:	04e79063          	bne	a5,a4,1c009608 <rt_irq_set_handler+0x4c>
1c0095cc:	1a1047b7          	lui	a5,0x1a104
1c0095d0:	43dc                	lw	a5,4(a5)
1c0095d2:	050a                	slli	a0,a0,0x2
1c0095d4:	8d89                	sub	a1,a1,a0
1c0095d6:	8d9d                	sub	a1,a1,a5
1c0095d8:	000ff737          	lui	a4,0xff
1c0095dc:	00f506b3          	add	a3,a0,a5
1c0095e0:	8f6d                	and	a4,a4,a1
1c0095e2:	0145d793          	srli	a5,a1,0x14
1c0095e6:	06f76713          	ori	a4,a4,111
1c0095ea:	07fe                	slli	a5,a5,0x1f
1c0095ec:	8fd9                	or	a5,a5,a4
1c0095ee:	7fe00637          	lui	a2,0x7fe00
1c0095f2:	01459713          	slli	a4,a1,0x14
1c0095f6:	8f71                	and	a4,a4,a2
1c0095f8:	8fd9                	or	a5,a5,a4
1c0095fa:	05a6                	slli	a1,a1,0x9
1c0095fc:	00100737          	lui	a4,0x100
1c009600:	8df9                	and	a1,a1,a4
1c009602:	8ddd                	or	a1,a1,a5
1c009604:	c28c                	sw	a1,0(a3)
1c009606:	8082                	ret
1c009608:	002007b7          	lui	a5,0x200
1c00960c:	43bc                	lw	a5,64(a5)
1c00960e:	b7d1                	j	1c0095d2 <rt_irq_set_handler+0x16>

1c009610 <illegal_insn_handler_c>:
1c009610:	8082                	ret

1c009612 <__rt_handle_illegal_instr>:
1c009612:	1c0017b7          	lui	a5,0x1c001
1c009616:	f047a703          	lw	a4,-252(a5) # 1c000f04 <__rt_debug_config>
1c00961a:	1141                	addi	sp,sp,-16
1c00961c:	c422                	sw	s0,8(sp)
1c00961e:	c606                	sw	ra,12(sp)
1c009620:	8b05                	andi	a4,a4,1
1c009622:	843e                	mv	s0,a5
1c009624:	c30d                	beqz	a4,1c009646 <__rt_handle_illegal_instr+0x34>
1c009626:	341026f3          	csrr	a3,mepc
1c00962a:	f1402673          	csrr	a2,mhartid
1c00962e:	1c000537          	lui	a0,0x1c000
1c009632:	4298                	lw	a4,0(a3)
1c009634:	40565593          	srai	a1,a2,0x5
1c009638:	03f5f593          	andi	a1,a1,63
1c00963c:	8a7d                	andi	a2,a2,31
1c00963e:	64850513          	addi	a0,a0,1608 # 1c000648 <__DTOR_END__+0x35c>
1c009642:	42e010ef          	jal	ra,1c00aa70 <printf>
1c009646:	f0442783          	lw	a5,-252(s0)
1c00964a:	8385                	srli	a5,a5,0x1
1c00964c:	8b85                	andi	a5,a5,1
1c00964e:	c399                	beqz	a5,1c009654 <__rt_handle_illegal_instr+0x42>
1c009650:	3ac010ef          	jal	ra,1c00a9fc <abort>
1c009654:	4422                	lw	s0,8(sp)
1c009656:	40b2                	lw	ra,12(sp)
1c009658:	0141                	addi	sp,sp,16
1c00965a:	fb7ff06f          	j	1c009610 <illegal_insn_handler_c>

1c00965e <__rt_irq_init>:
1c00965e:	f14027f3          	csrr	a5,mhartid
1c009662:	8795                	srai	a5,a5,0x5
1c009664:	03f7f793          	andi	a5,a5,63
1c009668:	477d                	li	a4,31
1c00966a:	02e79763          	bne	a5,a4,1c009698 <__rt_irq_init+0x3a>
1c00966e:	1a10a7b7          	lui	a5,0x1a10a
1c009672:	577d                	li	a4,-1
1c009674:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1097e8>
1c009678:	f14027f3          	csrr	a5,mhartid
1c00967c:	8795                	srai	a5,a5,0x5
1c00967e:	1c008737          	lui	a4,0x1c008
1c009682:	03f7f793          	andi	a5,a5,63
1c009686:	46fd                	li	a3,31
1c009688:	00070713          	mv	a4,a4
1c00968c:	00d79b63          	bne	a5,a3,1c0096a2 <__rt_irq_init+0x44>
1c009690:	1a1047b7          	lui	a5,0x1a104
1c009694:	c3d8                	sw	a4,4(a5)
1c009696:	8082                	ret
1c009698:	002047b7          	lui	a5,0x204
1c00969c:	577d                	li	a4,-1
1c00969e:	cb98                	sw	a4,16(a5)
1c0096a0:	bfe1                	j	1c009678 <__rt_irq_init+0x1a>
1c0096a2:	002007b7          	lui	a5,0x200
1c0096a6:	c3b8                	sw	a4,64(a5)
1c0096a8:	8082                	ret

1c0096aa <__rt_fc_cluster_lock_req>:
1c0096aa:	1141                	addi	sp,sp,-16
1c0096ac:	c606                	sw	ra,12(sp)
1c0096ae:	c422                	sw	s0,8(sp)
1c0096b0:	c226                	sw	s1,4(sp)
1c0096b2:	300474f3          	csrrci	s1,mstatus,8
1c0096b6:	09654703          	lbu	a4,150(a0)
1c0096ba:	411c                	lw	a5,0(a0)
1c0096bc:	c729                	beqz	a4,1c009706 <__rt_fc_cluster_lock_req+0x5c>
1c0096be:	4398                	lw	a4,0(a5)
1c0096c0:	c30d                	beqz	a4,1c0096e2 <__rt_fc_cluster_lock_req+0x38>
1c0096c2:	43d8                	lw	a4,4(a5)
1c0096c4:	cf09                	beqz	a4,1c0096de <__rt_fc_cluster_lock_req+0x34>
1c0096c6:	4798                	lw	a4,8(a5)
1c0096c8:	c348                	sw	a0,4(a4)
1c0096ca:	c788                	sw	a0,8(a5)
1c0096cc:	00052223          	sw	zero,4(a0)
1c0096d0:	30049073          	csrw	mstatus,s1
1c0096d4:	40b2                	lw	ra,12(sp)
1c0096d6:	4422                	lw	s0,8(sp)
1c0096d8:	4492                	lw	s1,4(sp)
1c0096da:	0141                	addi	sp,sp,16
1c0096dc:	8082                	ret
1c0096de:	c3c8                	sw	a0,4(a5)
1c0096e0:	b7ed                	j	1c0096ca <__rt_fc_cluster_lock_req+0x20>
1c0096e2:	4705                	li	a4,1
1c0096e4:	08e50a23          	sb	a4,148(a0)
1c0096e8:	4705                	li	a4,1
1c0096ea:	c398                	sw	a4,0(a5)
1c0096ec:	09554783          	lbu	a5,149(a0)
1c0096f0:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f0060>
1c0096f4:	00201737          	lui	a4,0x201
1c0096f8:	07da                	slli	a5,a5,0x16
1c0096fa:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c0096fe:	97ba                	add	a5,a5,a4
1c009700:	0007a023          	sw	zero,0(a5)
1c009704:	b7f1                	j	1c0096d0 <__rt_fc_cluster_lock_req+0x26>
1c009706:	842a                	mv	s0,a0
1c009708:	47c8                	lw	a0,12(a5)
1c00970a:	cd01                	beqz	a0,1c009722 <__rt_fc_cluster_lock_req+0x78>
1c00970c:	0007a023          	sw	zero,0(a5)
1c009710:	0007a623          	sw	zero,12(a5)
1c009714:	2185                	jal	1c009b74 <__rt_thread_wakeup>
1c009716:	4785                	li	a5,1
1c009718:	08f40a23          	sb	a5,148(s0)
1c00971c:	09544783          	lbu	a5,149(s0)
1c009720:	bfc1                	j	1c0096f0 <__rt_fc_cluster_lock_req+0x46>
1c009722:	43d8                	lw	a4,4(a5)
1c009724:	e701                	bnez	a4,1c00972c <__rt_fc_cluster_lock_req+0x82>
1c009726:	0007a023          	sw	zero,0(a5)
1c00972a:	b7f5                	j	1c009716 <__rt_fc_cluster_lock_req+0x6c>
1c00972c:	4354                	lw	a3,4(a4)
1c00972e:	c3d4                	sw	a3,4(a5)
1c009730:	4785                	li	a5,1
1c009732:	08f70a23          	sb	a5,148(a4)
1c009736:	09574783          	lbu	a5,149(a4)
1c00973a:	00201737          	lui	a4,0x201
1c00973e:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c009742:	04078793          	addi	a5,a5,64
1c009746:	07da                	slli	a5,a5,0x16
1c009748:	97ba                	add	a5,a5,a4
1c00974a:	bff1                	j	1c009726 <__rt_fc_cluster_lock_req+0x7c>

1c00974c <__rt_cbsys_add>:
1c00974c:	1101                	addi	sp,sp,-32
1c00974e:	cc22                	sw	s0,24(sp)
1c009750:	ca26                	sw	s1,20(sp)
1c009752:	842a                	mv	s0,a0
1c009754:	84ae                	mv	s1,a1
1c009756:	4501                	li	a0,0
1c009758:	45b1                	li	a1,12
1c00975a:	c632                	sw	a2,12(sp)
1c00975c:	ce06                	sw	ra,28(sp)
1c00975e:	d82ff0ef          	jal	ra,1c008ce0 <rt_alloc>
1c009762:	4632                	lw	a2,12(sp)
1c009764:	c115                	beqz	a0,1c009788 <__rt_cbsys_add+0x3c>
1c009766:	1c0017b7          	lui	a5,0x1c001
1c00976a:	040a                	slli	s0,s0,0x2
1c00976c:	f0878793          	addi	a5,a5,-248 # 1c000f08 <cbsys_first>
1c009770:	97a2                	add	a5,a5,s0
1c009772:	4398                	lw	a4,0(a5)
1c009774:	c104                	sw	s1,0(a0)
1c009776:	c150                	sw	a2,4(a0)
1c009778:	c518                	sw	a4,8(a0)
1c00977a:	c388                	sw	a0,0(a5)
1c00977c:	4501                	li	a0,0
1c00977e:	40f2                	lw	ra,28(sp)
1c009780:	4462                	lw	s0,24(sp)
1c009782:	44d2                	lw	s1,20(sp)
1c009784:	6105                	addi	sp,sp,32
1c009786:	8082                	ret
1c009788:	557d                	li	a0,-1
1c00978a:	bfd5                	j	1c00977e <__rt_cbsys_add+0x32>

1c00978c <__rt_cbsys_exec>:
1c00978c:	00251793          	slli	a5,a0,0x2
1c009790:	1c001537          	lui	a0,0x1c001
1c009794:	f0850513          	addi	a0,a0,-248 # 1c000f08 <cbsys_first>
1c009798:	1141                	addi	sp,sp,-16
1c00979a:	953e                	add	a0,a0,a5
1c00979c:	c422                	sw	s0,8(sp)
1c00979e:	4100                	lw	s0,0(a0)
1c0097a0:	c606                	sw	ra,12(sp)
1c0097a2:	e411                	bnez	s0,1c0097ae <__rt_cbsys_exec+0x22>
1c0097a4:	4501                	li	a0,0
1c0097a6:	40b2                	lw	ra,12(sp)
1c0097a8:	4422                	lw	s0,8(sp)
1c0097aa:	0141                	addi	sp,sp,16
1c0097ac:	8082                	ret
1c0097ae:	401c                	lw	a5,0(s0)
1c0097b0:	4048                	lw	a0,4(s0)
1c0097b2:	9782                	jalr	a5
1c0097b4:	e119                	bnez	a0,1c0097ba <__rt_cbsys_exec+0x2e>
1c0097b6:	4400                	lw	s0,8(s0)
1c0097b8:	b7ed                	j	1c0097a2 <__rt_cbsys_exec+0x16>
1c0097ba:	557d                	li	a0,-1
1c0097bc:	b7ed                	j	1c0097a6 <__rt_cbsys_exec+0x1a>

1c0097be <__rt_utils_init>:
1c0097be:	1c0017b7          	lui	a5,0x1c001
1c0097c2:	f0878793          	addi	a5,a5,-248 # 1c000f08 <cbsys_first>
1c0097c6:	0007a023          	sw	zero,0(a5)
1c0097ca:	0007a223          	sw	zero,4(a5)
1c0097ce:	0007a423          	sw	zero,8(a5)
1c0097d2:	0007a623          	sw	zero,12(a5)
1c0097d6:	0007a823          	sw	zero,16(a5)
1c0097da:	0007aa23          	sw	zero,20(a5)
1c0097de:	8082                	ret

1c0097e0 <__rt_fc_lock>:
1c0097e0:	1141                	addi	sp,sp,-16
1c0097e2:	c422                	sw	s0,8(sp)
1c0097e4:	842a                	mv	s0,a0
1c0097e6:	c606                	sw	ra,12(sp)
1c0097e8:	c226                	sw	s1,4(sp)
1c0097ea:	c04a                	sw	s2,0(sp)
1c0097ec:	300474f3          	csrrci	s1,mstatus,8
1c0097f0:	401c                	lw	a5,0(s0)
1c0097f2:	eb99                	bnez	a5,1c009808 <__rt_fc_lock+0x28>
1c0097f4:	4785                	li	a5,1
1c0097f6:	c01c                	sw	a5,0(s0)
1c0097f8:	30049073          	csrw	mstatus,s1
1c0097fc:	40b2                	lw	ra,12(sp)
1c0097fe:	4422                	lw	s0,8(sp)
1c009800:	4492                	lw	s1,4(sp)
1c009802:	4902                	lw	s2,0(sp)
1c009804:	0141                	addi	sp,sp,16
1c009806:	8082                	ret
1c009808:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c00980c:	4585                	li	a1,1
1c00980e:	e3ff7517          	auipc	a0,0xe3ff7
1c009812:	81a50513          	addi	a0,a0,-2022 # 28 <__rt_sched>
1c009816:	c45c                	sw	a5,12(s0)
1c009818:	29f1                	jal	1c009cf4 <__rt_event_execute>
1c00981a:	bfd9                	j	1c0097f0 <__rt_fc_lock+0x10>

1c00981c <__rt_fc_unlock>:
1c00981c:	300476f3          	csrrci	a3,mstatus,8
1c009820:	415c                	lw	a5,4(a0)
1c009822:	e791                	bnez	a5,1c00982e <__rt_fc_unlock+0x12>
1c009824:	00052023          	sw	zero,0(a0)
1c009828:	30069073          	csrw	mstatus,a3
1c00982c:	8082                	ret
1c00982e:	43d8                	lw	a4,4(a5)
1c009830:	c158                	sw	a4,4(a0)
1c009832:	4705                	li	a4,1
1c009834:	08e78a23          	sb	a4,148(a5)
1c009838:	0957c783          	lbu	a5,149(a5)
1c00983c:	00201737          	lui	a4,0x201
1c009840:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c009844:	04078793          	addi	a5,a5,64
1c009848:	07da                	slli	a5,a5,0x16
1c00984a:	97ba                	add	a5,a5,a4
1c00984c:	0007a023          	sw	zero,0(a5)
1c009850:	bfe1                	j	1c009828 <__rt_fc_unlock+0xc>

1c009852 <__rt_fc_cluster_lock>:
1c009852:	f14027f3          	csrr	a5,mhartid
1c009856:	8795                	srai	a5,a5,0x5
1c009858:	03f7f793          	andi	a5,a5,63
1c00985c:	08f58aa3          	sb	a5,149(a1)
1c009860:	4785                	li	a5,1
1c009862:	08f58b23          	sb	a5,150(a1)
1c009866:	1c0097b7          	lui	a5,0x1c009
1c00986a:	6aa78793          	addi	a5,a5,1706 # 1c0096aa <__rt_fc_cluster_lock_req>
1c00986e:	c188                	sw	a0,0(a1)
1c009870:	08058a23          	sb	zero,148(a1)
1c009874:	0205a423          	sw	zero,40(a1)
1c009878:	0205a623          	sw	zero,44(a1)
1c00987c:	c59c                	sw	a5,8(a1)
1c00987e:	c5cc                	sw	a1,12(a1)
1c009880:	05a1                	addi	a1,a1,8
1c009882:	0015e513          	ori	a0,a1,1
1c009886:	8bfff06f          	j	1c009144 <__rt_cluster_push_fc_event>

1c00988a <__rt_fc_cluster_unlock>:
1c00988a:	f14027f3          	csrr	a5,mhartid
1c00988e:	8795                	srai	a5,a5,0x5
1c009890:	03f7f793          	andi	a5,a5,63
1c009894:	08f58aa3          	sb	a5,149(a1)
1c009898:	1c0097b7          	lui	a5,0x1c009
1c00989c:	6aa78793          	addi	a5,a5,1706 # 1c0096aa <__rt_fc_cluster_lock_req>
1c0098a0:	c188                	sw	a0,0(a1)
1c0098a2:	08058a23          	sb	zero,148(a1)
1c0098a6:	08058b23          	sb	zero,150(a1)
1c0098aa:	0205a423          	sw	zero,40(a1)
1c0098ae:	0205a623          	sw	zero,44(a1)
1c0098b2:	c59c                	sw	a5,8(a1)
1c0098b4:	c5cc                	sw	a1,12(a1)
1c0098b6:	05a1                	addi	a1,a1,8
1c0098b8:	0015e513          	ori	a0,a1,1
1c0098bc:	889ff06f          	j	1c009144 <__rt_cluster_push_fc_event>

1c0098c0 <__rt_event_enqueue>:
1c0098c0:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c0098c4:	00052c23          	sw	zero,24(a0)
1c0098c8:	c799                	beqz	a5,1c0098d6 <__rt_event_enqueue+0x16>
1c0098ca:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c0098ce:	cf88                	sw	a0,24(a5)
1c0098d0:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c0098d4:	8082                	ret
1c0098d6:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c0098da:	bfdd                	j	1c0098d0 <__rt_event_enqueue+0x10>

1c0098dc <__rt_bridge_check_bridge_req.part.5>:
1c0098dc:	1c001737          	lui	a4,0x1c001
1c0098e0:	01c70793          	addi	a5,a4,28 # 1c00101c <__hal_debug_struct>
1c0098e4:	0a47a783          	lw	a5,164(a5)
1c0098e8:	01c70713          	addi	a4,a4,28
1c0098ec:	c789                	beqz	a5,1c0098f6 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c0098ee:	4f94                	lw	a3,24(a5)
1c0098f0:	e681                	bnez	a3,1c0098f8 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c0098f2:	0af72623          	sw	a5,172(a4)
1c0098f6:	8082                	ret
1c0098f8:	479c                	lw	a5,8(a5)
1c0098fa:	bfcd                	j	1c0098ec <__rt_bridge_check_bridge_req.part.5+0x10>

1c0098fc <__rt_bridge_wait>:
1c0098fc:	f14027f3          	csrr	a5,mhartid
1c009900:	8795                	srai	a5,a5,0x5
1c009902:	03f7f793          	andi	a5,a5,63
1c009906:	477d                	li	a4,31
1c009908:	02e79a63          	bne	a5,a4,1c00993c <__rt_bridge_wait+0x40>
1c00990c:	1a10a7b7          	lui	a5,0x1a10a
1c009910:	6711                	lui	a4,0x4
1c009912:	300476f3          	csrrci	a3,mstatus,8
1c009916:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1097ec>
1c00991a:	01161593          	slli	a1,a2,0x11
1c00991e:	0005cb63          	bltz	a1,1c009934 <__rt_bridge_wait+0x38>
1c009922:	80e7a223          	sw	a4,-2044(a5)
1c009926:	10500073          	wfi
1c00992a:	80e7a423          	sw	a4,-2040(a5)
1c00992e:	30069073          	csrw	mstatus,a3
1c009932:	b7c5                	j	1c009912 <__rt_bridge_wait+0x16>
1c009934:	80e7aa23          	sw	a4,-2028(a5)
1c009938:	30069073          	csrw	mstatus,a3
1c00993c:	8082                	ret

1c00993e <__rt_bridge_handle_notif>:
1c00993e:	1141                	addi	sp,sp,-16
1c009940:	c422                	sw	s0,8(sp)
1c009942:	1c001437          	lui	s0,0x1c001
1c009946:	01c40793          	addi	a5,s0,28 # 1c00101c <__hal_debug_struct>
1c00994a:	0a47a783          	lw	a5,164(a5)
1c00994e:	c606                	sw	ra,12(sp)
1c009950:	c226                	sw	s1,4(sp)
1c009952:	c04a                	sw	s2,0(sp)
1c009954:	01c40413          	addi	s0,s0,28
1c009958:	c399                	beqz	a5,1c00995e <__rt_bridge_handle_notif+0x20>
1c00995a:	4bd8                	lw	a4,20(a5)
1c00995c:	e30d                	bnez	a4,1c00997e <__rt_bridge_handle_notif+0x40>
1c00995e:	0b442783          	lw	a5,180(s0)
1c009962:	c789                	beqz	a5,1c00996c <__rt_bridge_handle_notif+0x2e>
1c009964:	43a8                	lw	a0,64(a5)
1c009966:	0a042a23          	sw	zero,180(s0)
1c00996a:	3f99                	jal	1c0098c0 <__rt_event_enqueue>
1c00996c:	0ac42783          	lw	a5,172(s0)
1c009970:	eb95                	bnez	a5,1c0099a4 <__rt_bridge_handle_notif+0x66>
1c009972:	4422                	lw	s0,8(sp)
1c009974:	40b2                	lw	ra,12(sp)
1c009976:	4492                	lw	s1,4(sp)
1c009978:	4902                	lw	s2,0(sp)
1c00997a:	0141                	addi	sp,sp,16
1c00997c:	b785                	j	1c0098dc <__rt_bridge_check_bridge_req.part.5>
1c00997e:	4784                	lw	s1,8(a5)
1c009980:	4fd8                	lw	a4,28(a5)
1c009982:	0a942223          	sw	s1,164(s0)
1c009986:	cb01                	beqz	a4,1c009996 <__rt_bridge_handle_notif+0x58>
1c009988:	0b042703          	lw	a4,176(s0)
1c00998c:	c798                	sw	a4,8(a5)
1c00998e:	0af42823          	sw	a5,176(s0)
1c009992:	87a6                	mv	a5,s1
1c009994:	b7d1                	j	1c009958 <__rt_bridge_handle_notif+0x1a>
1c009996:	43a8                	lw	a0,64(a5)
1c009998:	30047973          	csrrci	s2,mstatus,8
1c00999c:	3715                	jal	1c0098c0 <__rt_event_enqueue>
1c00999e:	30091073          	csrw	mstatus,s2
1c0099a2:	bfc5                	j	1c009992 <__rt_bridge_handle_notif+0x54>
1c0099a4:	40b2                	lw	ra,12(sp)
1c0099a6:	4422                	lw	s0,8(sp)
1c0099a8:	4492                	lw	s1,4(sp)
1c0099aa:	4902                	lw	s2,0(sp)
1c0099ac:	0141                	addi	sp,sp,16
1c0099ae:	8082                	ret

1c0099b0 <__rt_bridge_check_connection>:
1c0099b0:	1c001737          	lui	a4,0x1c001
1c0099b4:	01c70713          	addi	a4,a4,28 # 1c00101c <__hal_debug_struct>
1c0099b8:	471c                	lw	a5,8(a4)
1c0099ba:	ef95                	bnez	a5,1c0099f6 <__rt_bridge_check_connection+0x46>
1c0099bc:	1a1047b7          	lui	a5,0x1a104
1c0099c0:	5bfc                	lw	a5,116(a5)
1c0099c2:	469d                	li	a3,7
1c0099c4:	83a5                	srli	a5,a5,0x9
1c0099c6:	8b9d                	andi	a5,a5,7
1c0099c8:	02d79763          	bne	a5,a3,1c0099f6 <__rt_bridge_check_connection+0x46>
1c0099cc:	1141                	addi	sp,sp,-16
1c0099ce:	c422                	sw	s0,8(sp)
1c0099d0:	c226                	sw	s1,4(sp)
1c0099d2:	c606                	sw	ra,12(sp)
1c0099d4:	4785                	li	a5,1
1c0099d6:	c71c                	sw	a5,8(a4)
1c0099d8:	1a1044b7          	lui	s1,0x1a104
1c0099dc:	441d                	li	s0,7
1c0099de:	58fc                	lw	a5,116(s1)
1c0099e0:	83a5                	srli	a5,a5,0x9
1c0099e2:	8b9d                	andi	a5,a5,7
1c0099e4:	00878763          	beq	a5,s0,1c0099f2 <__rt_bridge_check_connection+0x42>
1c0099e8:	40b2                	lw	ra,12(sp)
1c0099ea:	4422                	lw	s0,8(sp)
1c0099ec:	4492                	lw	s1,4(sp)
1c0099ee:	0141                	addi	sp,sp,16
1c0099f0:	8082                	ret
1c0099f2:	3729                	jal	1c0098fc <__rt_bridge_wait>
1c0099f4:	b7ed                	j	1c0099de <__rt_bridge_check_connection+0x2e>
1c0099f6:	8082                	ret

1c0099f8 <__rt_bridge_set_available>:
1c0099f8:	1c0017b7          	lui	a5,0x1c001
1c0099fc:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009a00:	479c                	lw	a5,8(a5)
1c009a02:	8082                	ret

1c009a04 <__rt_bridge_send_notif>:
1c009a04:	1141                	addi	sp,sp,-16
1c009a06:	c606                	sw	ra,12(sp)
1c009a08:	3765                	jal	1c0099b0 <__rt_bridge_check_connection>
1c009a0a:	40b2                	lw	ra,12(sp)
1c009a0c:	1c0017b7          	lui	a5,0x1c001
1c009a10:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009a14:	479c                	lw	a5,8(a5)
1c009a16:	0141                	addi	sp,sp,16
1c009a18:	8082                	ret

1c009a1a <__rt_bridge_clear_notif>:
1c009a1a:	1141                	addi	sp,sp,-16
1c009a1c:	c606                	sw	ra,12(sp)
1c009a1e:	3f49                	jal	1c0099b0 <__rt_bridge_check_connection>
1c009a20:	1c0017b7          	lui	a5,0x1c001
1c009a24:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009a28:	4798                	lw	a4,8(a5)
1c009a2a:	c311                	beqz	a4,1c009a2e <__rt_bridge_clear_notif+0x14>
1c009a2c:	479c                	lw	a5,8(a5)
1c009a2e:	40b2                	lw	ra,12(sp)
1c009a30:	0141                	addi	sp,sp,16
1c009a32:	8082                	ret

1c009a34 <__rt_bridge_printf_flush>:
1c009a34:	1141                	addi	sp,sp,-16
1c009a36:	c422                	sw	s0,8(sp)
1c009a38:	c606                	sw	ra,12(sp)
1c009a3a:	1c001437          	lui	s0,0x1c001
1c009a3e:	3f8d                	jal	1c0099b0 <__rt_bridge_check_connection>
1c009a40:	01c40793          	addi	a5,s0,28 # 1c00101c <__hal_debug_struct>
1c009a44:	479c                	lw	a5,8(a5)
1c009a46:	c385                	beqz	a5,1c009a66 <__rt_bridge_printf_flush+0x32>
1c009a48:	01c40413          	addi	s0,s0,28
1c009a4c:	485c                	lw	a5,20(s0)
1c009a4e:	e399                	bnez	a5,1c009a54 <__rt_bridge_printf_flush+0x20>
1c009a50:	4c1c                	lw	a5,24(s0)
1c009a52:	cb91                	beqz	a5,1c009a66 <__rt_bridge_printf_flush+0x32>
1c009a54:	3f45                	jal	1c009a04 <__rt_bridge_send_notif>
1c009a56:	485c                	lw	a5,20(s0)
1c009a58:	e789                	bnez	a5,1c009a62 <__rt_bridge_printf_flush+0x2e>
1c009a5a:	4422                	lw	s0,8(sp)
1c009a5c:	40b2                	lw	ra,12(sp)
1c009a5e:	0141                	addi	sp,sp,16
1c009a60:	bf6d                	j	1c009a1a <__rt_bridge_clear_notif>
1c009a62:	3d69                	jal	1c0098fc <__rt_bridge_wait>
1c009a64:	bfcd                	j	1c009a56 <__rt_bridge_printf_flush+0x22>
1c009a66:	40b2                	lw	ra,12(sp)
1c009a68:	4422                	lw	s0,8(sp)
1c009a6a:	0141                	addi	sp,sp,16
1c009a6c:	8082                	ret

1c009a6e <__rt_bridge_req_shutdown>:
1c009a6e:	1141                	addi	sp,sp,-16
1c009a70:	c606                	sw	ra,12(sp)
1c009a72:	c422                	sw	s0,8(sp)
1c009a74:	c226                	sw	s1,4(sp)
1c009a76:	3f2d                	jal	1c0099b0 <__rt_bridge_check_connection>
1c009a78:	1c0017b7          	lui	a5,0x1c001
1c009a7c:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009a80:	479c                	lw	a5,8(a5)
1c009a82:	cb95                	beqz	a5,1c009ab6 <__rt_bridge_req_shutdown+0x48>
1c009a84:	3f45                	jal	1c009a34 <__rt_bridge_printf_flush>
1c009a86:	1a1044b7          	lui	s1,0x1a104
1c009a8a:	441d                	li	s0,7
1c009a8c:	58fc                	lw	a5,116(s1)
1c009a8e:	83a5                	srli	a5,a5,0x9
1c009a90:	8b9d                	andi	a5,a5,7
1c009a92:	02878763          	beq	a5,s0,1c009ac0 <__rt_bridge_req_shutdown+0x52>
1c009a96:	1a1044b7          	lui	s1,0x1a104
1c009a9a:	441d                	li	s0,7
1c009a9c:	58fc                	lw	a5,116(s1)
1c009a9e:	83a5                	srli	a5,a5,0x9
1c009aa0:	8b9d                	andi	a5,a5,7
1c009aa2:	02879163          	bne	a5,s0,1c009ac4 <__rt_bridge_req_shutdown+0x56>
1c009aa6:	1a1044b7          	lui	s1,0x1a104
1c009aaa:	441d                	li	s0,7
1c009aac:	58fc                	lw	a5,116(s1)
1c009aae:	83a5                	srli	a5,a5,0x9
1c009ab0:	8b9d                	andi	a5,a5,7
1c009ab2:	00878b63          	beq	a5,s0,1c009ac8 <__rt_bridge_req_shutdown+0x5a>
1c009ab6:	40b2                	lw	ra,12(sp)
1c009ab8:	4422                	lw	s0,8(sp)
1c009aba:	4492                	lw	s1,4(sp)
1c009abc:	0141                	addi	sp,sp,16
1c009abe:	8082                	ret
1c009ac0:	3d35                	jal	1c0098fc <__rt_bridge_wait>
1c009ac2:	b7e9                	j	1c009a8c <__rt_bridge_req_shutdown+0x1e>
1c009ac4:	3d25                	jal	1c0098fc <__rt_bridge_wait>
1c009ac6:	bfd9                	j	1c009a9c <__rt_bridge_req_shutdown+0x2e>
1c009ac8:	3d15                	jal	1c0098fc <__rt_bridge_wait>
1c009aca:	b7cd                	j	1c009aac <__rt_bridge_req_shutdown+0x3e>

1c009acc <__rt_bridge_init>:
1c009acc:	1c0017b7          	lui	a5,0x1c001
1c009ad0:	1a10a737          	lui	a4,0x1a10a
1c009ad4:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c009ad8:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1097f0>
1c009adc:	0ae7ac23          	sw	a4,184(a5)
1c009ae0:	4741                	li	a4,16
1c009ae2:	0a07a223          	sw	zero,164(a5)
1c009ae6:	0a07a623          	sw	zero,172(a5)
1c009aea:	0a07aa23          	sw	zero,180(a5)
1c009aee:	0ae7ae23          	sw	a4,188(a5)
1c009af2:	00400793          	li	a5,4
1c009af6:	0007a823          	sw	zero,16(a5)
1c009afa:	0007a023          	sw	zero,0(a5)
1c009afe:	8082                	ret

1c009b00 <__rt_thread_enqueue_ready>:
1c009b00:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c009b04:	02052c23          	sw	zero,56(a0)
1c009b08:	01800793          	li	a5,24
1c009b0c:	e711                	bnez	a4,1c009b18 <__rt_thread_enqueue_ready+0x18>
1c009b0e:	c388                	sw	a0,0(a5)
1c009b10:	c3c8                	sw	a0,4(a5)
1c009b12:	0c052a23          	sw	zero,212(a0)
1c009b16:	8082                	ret
1c009b18:	43d8                	lw	a4,4(a5)
1c009b1a:	df08                	sw	a0,56(a4)
1c009b1c:	bfd5                	j	1c009b10 <__rt_thread_enqueue_ready+0x10>

1c009b1e <__rt_thread_sleep>:
1c009b1e:	01800713          	li	a4,24
1c009b22:	4708                	lw	a0,8(a4)
1c009b24:	01800793          	li	a5,24
1c009b28:	438c                	lw	a1,0(a5)
1c009b2a:	c999                	beqz	a1,1c009b40 <__rt_thread_sleep+0x22>
1c009b2c:	5d98                	lw	a4,56(a1)
1c009b2e:	c398                	sw	a4,0(a5)
1c009b30:	4705                	li	a4,1
1c009b32:	0ce5aa23          	sw	a4,212(a1)
1c009b36:	00b50c63          	beq	a0,a1,1c009b4e <__rt_thread_sleep+0x30>
1c009b3a:	c78c                	sw	a1,8(a5)
1c009b3c:	f8afe06f          	j	1c0082c6 <__rt_thread_switch>
1c009b40:	10500073          	wfi
1c009b44:	30045073          	csrwi	mstatus,8
1c009b48:	30047773          	csrrci	a4,mstatus,8
1c009b4c:	bff1                	j	1c009b28 <__rt_thread_sleep+0xa>
1c009b4e:	8082                	ret

1c009b50 <rt_thread_exit>:
1c009b50:	300477f3          	csrrci	a5,mstatus,8
1c009b54:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009b58:	4705                	li	a4,1
1c009b5a:	c3e8                	sw	a0,68(a5)
1c009b5c:	5fc8                	lw	a0,60(a5)
1c009b5e:	c3b8                	sw	a4,64(a5)
1c009b60:	c909                	beqz	a0,1c009b72 <rt_thread_exit+0x22>
1c009b62:	0d452783          	lw	a5,212(a0)
1c009b66:	c791                	beqz	a5,1c009b72 <rt_thread_exit+0x22>
1c009b68:	1141                	addi	sp,sp,-16
1c009b6a:	c606                	sw	ra,12(sp)
1c009b6c:	3f51                	jal	1c009b00 <__rt_thread_enqueue_ready>
1c009b6e:	40b2                	lw	ra,12(sp)
1c009b70:	0141                	addi	sp,sp,16
1c009b72:	b775                	j	1c009b1e <__rt_thread_sleep>

1c009b74 <__rt_thread_wakeup>:
1c009b74:	5d18                	lw	a4,56(a0)
1c009b76:	eb09                	bnez	a4,1c009b88 <__rt_thread_wakeup+0x14>
1c009b78:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c009b7c:	00a70663          	beq	a4,a0,1c009b88 <__rt_thread_wakeup+0x14>
1c009b80:	0d452783          	lw	a5,212(a0)
1c009b84:	c391                	beqz	a5,1c009b88 <__rt_thread_wakeup+0x14>
1c009b86:	bfad                	j	1c009b00 <__rt_thread_enqueue_ready>
1c009b88:	8082                	ret

1c009b8a <__rt_thread_sched_init>:
1c009b8a:	1141                	addi	sp,sp,-16
1c009b8c:	c422                	sw	s0,8(sp)
1c009b8e:	1c0087b7          	lui	a5,0x1c008
1c009b92:	1c001437          	lui	s0,0x1c001
1c009b96:	c226                	sw	s1,4(sp)
1c009b98:	c04a                	sw	s2,0(sp)
1c009b9a:	c606                	sw	ra,12(sp)
1c009b9c:	f2040413          	addi	s0,s0,-224 # 1c000f20 <__rt_thread_main>
1c009ba0:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009ba4:	c01c                	sw	a5,0(s0)
1c009ba6:	1c00a7b7          	lui	a5,0x1c00a
1c009baa:	04840913          	addi	s2,s0,72
1c009bae:	b5078793          	addi	a5,a5,-1200 # 1c009b50 <rt_thread_exit>
1c009bb2:	01800493          	li	s1,24
1c009bb6:	c45c                	sw	a5,12(s0)
1c009bb8:	854a                	mv	a0,s2
1c009bba:	4785                	li	a5,1
1c009bbc:	e3ff6597          	auipc	a1,0xe3ff6
1c009bc0:	46c58593          	addi	a1,a1,1132 # 28 <__rt_sched>
1c009bc4:	0cf42a23          	sw	a5,212(s0)
1c009bc8:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa103fe0>
1c009bcc:	02042a23          	sw	zero,52(s0)
1c009bd0:	00042223          	sw	zero,4(s0)
1c009bd4:	00042423          	sw	zero,8(s0)
1c009bd8:	2829                	jal	1c009bf2 <__rt_event_init>
1c009bda:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009bde:	c480                	sw	s0,8(s1)
1c009be0:	40b2                	lw	ra,12(sp)
1c009be2:	d03c                	sw	a5,96(s0)
1c009be4:	4422                	lw	s0,8(sp)
1c009be6:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009bea:	4492                	lw	s1,4(sp)
1c009bec:	4902                	lw	s2,0(sp)
1c009bee:	0141                	addi	sp,sp,16
1c009bf0:	8082                	ret

1c009bf2 <__rt_event_init>:
1c009bf2:	02052023          	sw	zero,32(a0)
1c009bf6:	02052223          	sw	zero,36(a0)
1c009bfa:	02052823          	sw	zero,48(a0)
1c009bfe:	00052023          	sw	zero,0(a0)
1c009c02:	8082                	ret

1c009c04 <__rt_wait_event_prepare_blocking>:
1c009c04:	02400793          	li	a5,36
1c009c08:	4388                	lw	a0,0(a5)
1c009c0a:	4d18                	lw	a4,24(a0)
1c009c0c:	02052223          	sw	zero,36(a0)
1c009c10:	c398                	sw	a4,0(a5)
1c009c12:	4785                	li	a5,1
1c009c14:	d11c                	sw	a5,32(a0)
1c009c16:	00052023          	sw	zero,0(a0)
1c009c1a:	8082                	ret

1c009c1c <rt_event_alloc>:
1c009c1c:	1141                	addi	sp,sp,-16
1c009c1e:	c422                	sw	s0,8(sp)
1c009c20:	842e                	mv	s0,a1
1c009c22:	c606                	sw	ra,12(sp)
1c009c24:	c226                	sw	s1,4(sp)
1c009c26:	300474f3          	csrrci	s1,mstatus,8
1c009c2a:	f14027f3          	csrr	a5,mhartid
1c009c2e:	8795                	srai	a5,a5,0x5
1c009c30:	03f7f793          	andi	a5,a5,63
1c009c34:	477d                	li	a4,31
1c009c36:	00378513          	addi	a0,a5,3
1c009c3a:	00e79363          	bne	a5,a4,1c009c40 <rt_event_alloc+0x24>
1c009c3e:	4501                	li	a0,0
1c009c40:	08c00593          	li	a1,140
1c009c44:	02b405b3          	mul	a1,s0,a1
1c009c48:	898ff0ef          	jal	ra,1c008ce0 <rt_alloc>
1c009c4c:	87aa                	mv	a5,a0
1c009c4e:	557d                	li	a0,-1
1c009c50:	cf91                	beqz	a5,1c009c6c <rt_event_alloc+0x50>
1c009c52:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009c56:	4581                	li	a1,0
1c009c58:	4601                	li	a2,0
1c009c5a:	02400713          	li	a4,36
1c009c5e:	00864c63          	blt	a2,s0,1c009c76 <rt_event_alloc+0x5a>
1c009c62:	c191                	beqz	a1,1c009c66 <rt_event_alloc+0x4a>
1c009c64:	c314                	sw	a3,0(a4)
1c009c66:	30049073          	csrw	mstatus,s1
1c009c6a:	4501                	li	a0,0
1c009c6c:	40b2                	lw	ra,12(sp)
1c009c6e:	4422                	lw	s0,8(sp)
1c009c70:	4492                	lw	s1,4(sp)
1c009c72:	0141                	addi	sp,sp,16
1c009c74:	8082                	ret
1c009c76:	cf94                	sw	a3,24(a5)
1c009c78:	0207a023          	sw	zero,32(a5)
1c009c7c:	0207a223          	sw	zero,36(a5)
1c009c80:	0207a823          	sw	zero,48(a5)
1c009c84:	0007a023          	sw	zero,0(a5)
1c009c88:	86be                	mv	a3,a5
1c009c8a:	0605                	addi	a2,a2,1
1c009c8c:	4585                	li	a1,1
1c009c8e:	08c78793          	addi	a5,a5,140
1c009c92:	b7f1                	j	1c009c5e <rt_event_alloc+0x42>

1c009c94 <rt_event_get>:
1c009c94:	30047773          	csrrci	a4,mstatus,8
1c009c98:	02400793          	li	a5,36
1c009c9c:	4388                	lw	a0,0(a5)
1c009c9e:	c509                	beqz	a0,1c009ca8 <rt_event_get+0x14>
1c009ca0:	4d14                	lw	a3,24(a0)
1c009ca2:	c150                	sw	a2,4(a0)
1c009ca4:	c394                	sw	a3,0(a5)
1c009ca6:	c10c                	sw	a1,0(a0)
1c009ca8:	30071073          	csrw	mstatus,a4
1c009cac:	8082                	ret

1c009cae <rt_event_get_blocking>:
1c009cae:	30047773          	csrrci	a4,mstatus,8
1c009cb2:	02400793          	li	a5,36
1c009cb6:	4388                	lw	a0,0(a5)
1c009cb8:	c909                	beqz	a0,1c009cca <rt_event_get_blocking+0x1c>
1c009cba:	4d14                	lw	a3,24(a0)
1c009cbc:	00052223          	sw	zero,4(a0)
1c009cc0:	c394                	sw	a3,0(a5)
1c009cc2:	4785                	li	a5,1
1c009cc4:	00052023          	sw	zero,0(a0)
1c009cc8:	d11c                	sw	a5,32(a0)
1c009cca:	30071073          	csrw	mstatus,a4
1c009cce:	8082                	ret

1c009cd0 <rt_event_push>:
1c009cd0:	30047773          	csrrci	a4,mstatus,8
1c009cd4:	02400693          	li	a3,36
1c009cd8:	42d4                	lw	a3,4(a3)
1c009cda:	00052c23          	sw	zero,24(a0)
1c009cde:	02400793          	li	a5,36
1c009ce2:	e691                	bnez	a3,1c009cee <rt_event_push+0x1e>
1c009ce4:	c3c8                	sw	a0,4(a5)
1c009ce6:	c788                	sw	a0,8(a5)
1c009ce8:	30071073          	csrw	mstatus,a4
1c009cec:	8082                	ret
1c009cee:	4794                	lw	a3,8(a5)
1c009cf0:	ce88                	sw	a0,24(a3)
1c009cf2:	bfd5                	j	1c009ce6 <rt_event_push+0x16>

1c009cf4 <__rt_event_execute>:
1c009cf4:	1141                	addi	sp,sp,-16
1c009cf6:	c422                	sw	s0,8(sp)
1c009cf8:	02400793          	li	a5,36
1c009cfc:	43dc                	lw	a5,4(a5)
1c009cfe:	c606                	sw	ra,12(sp)
1c009d00:	c226                	sw	s1,4(sp)
1c009d02:	02400413          	li	s0,36
1c009d06:	eb91                	bnez	a5,1c009d1a <__rt_event_execute+0x26>
1c009d08:	c1a9                	beqz	a1,1c009d4a <__rt_event_execute+0x56>
1c009d0a:	10500073          	wfi
1c009d0e:	30045073          	csrwi	mstatus,8
1c009d12:	300477f3          	csrrci	a5,mstatus,8
1c009d16:	405c                	lw	a5,4(s0)
1c009d18:	cb8d                	beqz	a5,1c009d4a <__rt_event_execute+0x56>
1c009d1a:	4485                	li	s1,1
1c009d1c:	4f98                	lw	a4,24(a5)
1c009d1e:	53d4                	lw	a3,36(a5)
1c009d20:	00978823          	sb	s1,16(a5)
1c009d24:	c058                	sw	a4,4(s0)
1c009d26:	43c8                	lw	a0,4(a5)
1c009d28:	4398                	lw	a4,0(a5)
1c009d2a:	e691                	bnez	a3,1c009d36 <__rt_event_execute+0x42>
1c009d2c:	5394                	lw	a3,32(a5)
1c009d2e:	e681                	bnez	a3,1c009d36 <__rt_event_execute+0x42>
1c009d30:	4014                	lw	a3,0(s0)
1c009d32:	c01c                	sw	a5,0(s0)
1c009d34:	cf94                	sw	a3,24(a5)
1c009d36:	0207a023          	sw	zero,32(a5)
1c009d3a:	c711                	beqz	a4,1c009d46 <__rt_event_execute+0x52>
1c009d3c:	30045073          	csrwi	mstatus,8
1c009d40:	9702                	jalr	a4
1c009d42:	300477f3          	csrrci	a5,mstatus,8
1c009d46:	405c                	lw	a5,4(s0)
1c009d48:	fbf1                	bnez	a5,1c009d1c <__rt_event_execute+0x28>
1c009d4a:	40b2                	lw	ra,12(sp)
1c009d4c:	4422                	lw	s0,8(sp)
1c009d4e:	4492                	lw	s1,4(sp)
1c009d50:	0141                	addi	sp,sp,16
1c009d52:	8082                	ret

1c009d54 <__rt_wait_event>:
1c009d54:	1141                	addi	sp,sp,-16
1c009d56:	c422                	sw	s0,8(sp)
1c009d58:	c606                	sw	ra,12(sp)
1c009d5a:	842a                	mv	s0,a0
1c009d5c:	501c                	lw	a5,32(s0)
1c009d5e:	ef81                	bnez	a5,1c009d76 <__rt_wait_event+0x22>
1c009d60:	581c                	lw	a5,48(s0)
1c009d62:	eb91                	bnez	a5,1c009d76 <__rt_wait_event+0x22>
1c009d64:	02400793          	li	a5,36
1c009d68:	4398                	lw	a4,0(a5)
1c009d6a:	40b2                	lw	ra,12(sp)
1c009d6c:	c380                	sw	s0,0(a5)
1c009d6e:	cc18                	sw	a4,24(s0)
1c009d70:	4422                	lw	s0,8(sp)
1c009d72:	0141                	addi	sp,sp,16
1c009d74:	8082                	ret
1c009d76:	4585                	li	a1,1
1c009d78:	4501                	li	a0,0
1c009d7a:	3fad                	jal	1c009cf4 <__rt_event_execute>
1c009d7c:	b7c5                	j	1c009d5c <__rt_wait_event+0x8>

1c009d7e <rt_event_wait>:
1c009d7e:	1141                	addi	sp,sp,-16
1c009d80:	c606                	sw	ra,12(sp)
1c009d82:	c422                	sw	s0,8(sp)
1c009d84:	30047473          	csrrci	s0,mstatus,8
1c009d88:	37f1                	jal	1c009d54 <__rt_wait_event>
1c009d8a:	30041073          	csrw	mstatus,s0
1c009d8e:	40b2                	lw	ra,12(sp)
1c009d90:	4422                	lw	s0,8(sp)
1c009d92:	0141                	addi	sp,sp,16
1c009d94:	8082                	ret

1c009d96 <__rt_event_sched_init>:
1c009d96:	02400513          	li	a0,36
1c009d9a:	00052023          	sw	zero,0(a0)
1c009d9e:	00052223          	sw	zero,4(a0)
1c009da2:	4585                	li	a1,1
1c009da4:	0511                	addi	a0,a0,4
1c009da6:	bd9d                	j	1c009c1c <rt_event_alloc>

1c009da8 <__rt_fll_set_freq>:
1c009da8:	1141                	addi	sp,sp,-16
1c009daa:	c422                	sw	s0,8(sp)
1c009dac:	c226                	sw	s1,4(sp)
1c009dae:	c606                	sw	ra,12(sp)
1c009db0:	842a                	mv	s0,a0
1c009db2:	84ae                	mv	s1,a1
1c009db4:	e111                	bnez	a0,1c009db8 <__rt_fll_set_freq+0x10>
1c009db6:	3965                	jal	1c009a6e <__rt_bridge_req_shutdown>
1c009db8:	8526                	mv	a0,s1
1c009dba:	f3afe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009dbe:	1579                	addi	a0,a0,-2
1c009dc0:	00155793          	srli	a5,a0,0x1
1c009dc4:	e391                	bnez	a5,1c009dc8 <__rt_fll_set_freq+0x20>
1c009dc6:	4785                	li	a5,1
1c009dc8:	fff78713          	addi	a4,a5,-1
1c009dcc:	4505                	li	a0,1
1c009dce:	00e51533          	sll	a0,a0,a4
1c009dd2:	00f494b3          	sll	s1,s1,a5
1c009dd6:	7761                	lui	a4,0xffff8
1c009dd8:	8f65                	and	a4,a4,s1
1c009dda:	1c0016b7          	lui	a3,0x1c001
1c009dde:	953a                	add	a0,a0,a4
1c009de0:	23068693          	addi	a3,a3,560 # 1c001230 <__rt_fll_freq>
1c009de4:	00241713          	slli	a4,s0,0x2
1c009de8:	9736                	add	a4,a4,a3
1c009dea:	00f55533          	srl	a0,a0,a5
1c009dee:	c308                	sw	a0,0(a4)
1c009df0:	1c001737          	lui	a4,0x1c001
1c009df4:	1cc70713          	addi	a4,a4,460 # 1c0011cc <__rt_fll_is_on>
1c009df8:	9722                	add	a4,a4,s0
1c009dfa:	00074703          	lbu	a4,0(a4)
1c009dfe:	c715                	beqz	a4,1c009e2a <__rt_fll_set_freq+0x82>
1c009e00:	1a100737          	lui	a4,0x1a100
1c009e04:	0711                	addi	a4,a4,4
1c009e06:	0412                	slli	s0,s0,0x4
1c009e08:	943a                	add	s0,s0,a4
1c009e0a:	4018                	lw	a4,0(s0)
1c009e0c:	80bd                	srli	s1,s1,0xf
1c009e0e:	76c1                	lui	a3,0xffff0
1c009e10:	04c2                	slli	s1,s1,0x10
1c009e12:	8f75                	and	a4,a4,a3
1c009e14:	80c1                	srli	s1,s1,0x10
1c009e16:	0785                	addi	a5,a5,1
1c009e18:	c40006b7          	lui	a3,0xc4000
1c009e1c:	8f45                	or	a4,a4,s1
1c009e1e:	8bbd                	andi	a5,a5,15
1c009e20:	16fd                	addi	a3,a3,-1
1c009e22:	07ea                	slli	a5,a5,0x1a
1c009e24:	8f75                	and	a4,a4,a3
1c009e26:	8fd9                	or	a5,a5,a4
1c009e28:	c01c                	sw	a5,0(s0)
1c009e2a:	40b2                	lw	ra,12(sp)
1c009e2c:	4422                	lw	s0,8(sp)
1c009e2e:	4492                	lw	s1,4(sp)
1c009e30:	0141                	addi	sp,sp,16
1c009e32:	8082                	ret

1c009e34 <__rt_fll_init>:
1c009e34:	1141                	addi	sp,sp,-16
1c009e36:	1a1005b7          	lui	a1,0x1a100
1c009e3a:	00451613          	slli	a2,a0,0x4
1c009e3e:	c226                	sw	s1,4(sp)
1c009e40:	84aa                	mv	s1,a0
1c009e42:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fffe4>
1c009e46:	9532                	add	a0,a0,a2
1c009e48:	4114                	lw	a3,0(a0)
1c009e4a:	c606                	sw	ra,12(sp)
1c009e4c:	c422                	sw	s0,8(sp)
1c009e4e:	87b6                	mv	a5,a3
1c009e50:	0406c963          	bltz	a3,1c009ea2 <__rt_fll_init+0x6e>
1c009e54:	00858793          	addi	a5,a1,8
1c009e58:	97b2                	add	a5,a5,a2
1c009e5a:	4398                	lw	a4,0(a5)
1c009e5c:	7841                	lui	a6,0xffff0
1c009e5e:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009e62:	01077733          	and	a4,a4,a6
1c009e66:	6809                	lui	a6,0x2
1c009e68:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009e6c:	01076733          	or	a4,a4,a6
1c009e70:	f0010837          	lui	a6,0xf0010
1c009e74:	187d                	addi	a6,a6,-1
1c009e76:	01077733          	and	a4,a4,a6
1c009e7a:	00500837          	lui	a6,0x500
1c009e7e:	01076733          	or	a4,a4,a6
1c009e82:	05b1                	addi	a1,a1,12
1c009e84:	c398                	sw	a4,0(a5)
1c009e86:	962e                	add	a2,a2,a1
1c009e88:	421c                	lw	a5,0(a2)
1c009e8a:	fc010737          	lui	a4,0xfc010
1c009e8e:	177d                	addi	a4,a4,-1
1c009e90:	8ff9                	and	a5,a5,a4
1c009e92:	014c0737          	lui	a4,0x14c0
1c009e96:	8fd9                	or	a5,a5,a4
1c009e98:	c21c                	sw	a5,0(a2)
1c009e9a:	c00007b7          	lui	a5,0xc0000
1c009e9e:	8fd5                	or	a5,a5,a3
1c009ea0:	c11c                	sw	a5,0(a0)
1c009ea2:	1c001637          	lui	a2,0x1c001
1c009ea6:	00249713          	slli	a4,s1,0x2
1c009eaa:	23060613          	addi	a2,a2,560 # 1c001230 <__rt_fll_freq>
1c009eae:	9732                	add	a4,a4,a2
1c009eb0:	4300                	lw	s0,0(a4)
1c009eb2:	c015                	beqz	s0,1c009ed6 <__rt_fll_init+0xa2>
1c009eb4:	85a2                	mv	a1,s0
1c009eb6:	8526                	mv	a0,s1
1c009eb8:	3dc5                	jal	1c009da8 <__rt_fll_set_freq>
1c009eba:	1c001537          	lui	a0,0x1c001
1c009ebe:	1cc50513          	addi	a0,a0,460 # 1c0011cc <__rt_fll_is_on>
1c009ec2:	9526                	add	a0,a0,s1
1c009ec4:	4785                	li	a5,1
1c009ec6:	00f50023          	sb	a5,0(a0)
1c009eca:	40b2                	lw	ra,12(sp)
1c009ecc:	8522                	mv	a0,s0
1c009ece:	4422                	lw	s0,8(sp)
1c009ed0:	4492                	lw	s1,4(sp)
1c009ed2:	0141                	addi	sp,sp,16
1c009ed4:	8082                	ret
1c009ed6:	06c2                	slli	a3,a3,0x10
1c009ed8:	83e9                	srli	a5,a5,0x1a
1c009eda:	82c1                	srli	a3,a3,0x10
1c009edc:	8bbd                	andi	a5,a5,15
1c009ede:	06be                	slli	a3,a3,0xf
1c009ee0:	17fd                	addi	a5,a5,-1
1c009ee2:	00f6d433          	srl	s0,a3,a5
1c009ee6:	c300                	sw	s0,0(a4)
1c009ee8:	bfc9                	j	1c009eba <__rt_fll_init+0x86>

1c009eea <__rt_fll_deinit>:
1c009eea:	1c0017b7          	lui	a5,0x1c001
1c009eee:	1cc78793          	addi	a5,a5,460 # 1c0011cc <__rt_fll_is_on>
1c009ef2:	953e                	add	a0,a0,a5
1c009ef4:	00050023          	sb	zero,0(a0)
1c009ef8:	8082                	ret

1c009efa <__rt_flls_constructor>:
1c009efa:	1c0017b7          	lui	a5,0x1c001
1c009efe:	2207a823          	sw	zero,560(a5) # 1c001230 <__rt_fll_freq>
1c009f02:	23078793          	addi	a5,a5,560
1c009f06:	0007a223          	sw	zero,4(a5)
1c009f0a:	1c0017b7          	lui	a5,0x1c001
1c009f0e:	1c079623          	sh	zero,460(a5) # 1c0011cc <__rt_fll_is_on>
1c009f12:	8082                	ret

1c009f14 <gcd>:
1c009f14:	cd19                	beqz	a0,1c009f32 <gcd+0x1e>
1c009f16:	cd81                	beqz	a1,1c009f2e <gcd+0x1a>
1c009f18:	00054463          	bltz	a0,1c009f20 <gcd+0xc>
1c009f1c:	0005d563          	bgez	a1,1c009f26 <gcd+0x12>
1c009f20:	55fd                	li	a1,-1
1c009f22:	a031                	j	1c009f2e <gcd+0x1a>
1c009f24:	85be                	mv	a1,a5
1c009f26:	02b567b3          	rem	a5,a0,a1
1c009f2a:	852e                	mv	a0,a1
1c009f2c:	ffe5                	bnez	a5,1c009f24 <gcd+0x10>
1c009f2e:	852e                	mv	a0,a1
1c009f30:	8082                	ret
1c009f32:	4581                	li	a1,0
1c009f34:	bfed                	j	1c009f2e <gcd+0x1a>

1c009f36 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009f36:	1101                	addi	sp,sp,-32
1c009f38:	1c0017b7          	lui	a5,0x1c001
1c009f3c:	c84a                	sw	s2,16(sp)
1c009f3e:	1d07a903          	lw	s2,464(a5) # 1c0011d0 <__rt_periph_lcm>
1c009f42:	c452                	sw	s4,8(sp)
1c009f44:	8a2e                	mv	s4,a1
1c009f46:	85ca                	mv	a1,s2
1c009f48:	ce06                	sw	ra,28(sp)
1c009f4a:	cc22                	sw	s0,24(sp)
1c009f4c:	ca26                	sw	s1,20(sp)
1c009f4e:	842a                	mv	s0,a0
1c009f50:	c64e                	sw	s3,12(sp)
1c009f52:	89aa                	mv	s3,a0
1c009f54:	37c1                	jal	1c009f14 <gcd>
1c009f56:	02a44533          	div	a0,s0,a0
1c009f5a:	03250933          	mul	s2,a0,s2
1c009f5e:	4511                	li	a0,4
1c009f60:	82dff0ef          	jal	ra,1c00978c <__rt_cbsys_exec>
1c009f64:	1c0017b7          	lui	a5,0x1c001
1c009f68:	2307a783          	lw	a5,560(a5) # 1c001230 <__rt_fll_freq>
1c009f6c:	028954b3          	divu	s1,s2,s0
1c009f70:	0527f263          	bleu	s2,a5,1c009fb4 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009f74:	1a1047b7          	lui	a5,0x1a104
1c009f78:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040b4>
1c009f7c:	4705                	li	a4,1
1c009f7e:	0ce7ae23          	sw	a4,220(a5)
1c009f82:	85a2                	mv	a1,s0
1c009f84:	4501                	li	a0,0
1c009f86:	350d                	jal	1c009da8 <__rt_fll_set_freq>
1c009f88:	57fd                	li	a5,-1
1c009f8a:	00fa0963          	beq	s4,a5,1c009f9c <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009f8e:	c099                	beqz	s1,1c009f94 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009f90:	029459b3          	divu	s3,s0,s1
1c009f94:	1c0017b7          	lui	a5,0x1c001
1c009f98:	2337ac23          	sw	s3,568(a5) # 1c001238 <__rt_freq_domains>
1c009f9c:	4515                	li	a0,5
1c009f9e:	feeff0ef          	jal	ra,1c00978c <__rt_cbsys_exec>
1c009fa2:	40f2                	lw	ra,28(sp)
1c009fa4:	4462                	lw	s0,24(sp)
1c009fa6:	44d2                	lw	s1,20(sp)
1c009fa8:	4942                	lw	s2,16(sp)
1c009faa:	49b2                	lw	s3,12(sp)
1c009fac:	4a22                	lw	s4,8(sp)
1c009fae:	4501                	li	a0,0
1c009fb0:	6105                	addi	sp,sp,32
1c009fb2:	8082                	ret
1c009fb4:	85a2                	mv	a1,s0
1c009fb6:	4501                	li	a0,0
1c009fb8:	3bc5                	jal	1c009da8 <__rt_fll_set_freq>
1c009fba:	1a1047b7          	lui	a5,0x1a104
1c009fbe:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa1040b4>
1c009fc2:	4705                	li	a4,1
1c009fc4:	0ce7ae23          	sw	a4,220(a5)
1c009fc8:	b7c1                	j	1c009f88 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009fca <rt_freq_set_and_get>:
1c009fca:	1141                	addi	sp,sp,-16
1c009fcc:	852e                	mv	a0,a1
1c009fce:	c606                	sw	ra,12(sp)
1c009fd0:	c422                	sw	s0,8(sp)
1c009fd2:	30047473          	csrrci	s0,mstatus,8
1c009fd6:	4581                	li	a1,0
1c009fd8:	3fb9                	jal	1c009f36 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009fda:	30041073          	csrw	mstatus,s0
1c009fde:	40b2                	lw	ra,12(sp)
1c009fe0:	4422                	lw	s0,8(sp)
1c009fe2:	00a03533          	snez	a0,a0
1c009fe6:	40a00533          	neg	a0,a0
1c009fea:	0141                	addi	sp,sp,16
1c009fec:	8082                	ret

1c009fee <__rt_freq_init>:
1c009fee:	1141                	addi	sp,sp,-16
1c009ff0:	c422                	sw	s0,8(sp)
1c009ff2:	c606                	sw	ra,12(sp)
1c009ff4:	3719                	jal	1c009efa <__rt_flls_constructor>
1c009ff6:	1c0017b7          	lui	a5,0x1c001
1c009ffa:	0dc7a703          	lw	a4,220(a5) # 1c0010dc <__rt_platform>
1c009ffe:	4785                	li	a5,1
1c00a000:	1c001437          	lui	s0,0x1c001
1c00a004:	02f70663          	beq	a4,a5,1c00a030 <__rt_freq_init+0x42>
1c00a008:	4501                	li	a0,0
1c00a00a:	352d                	jal	1c009e34 <__rt_fll_init>
1c00a00c:	22a42c23          	sw	a0,568(s0) # 1c001238 <__rt_freq_domains>
1c00a010:	1a1047b7          	lui	a5,0x1a104
1c00a014:	4709                	li	a4,2
1c00a016:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa1040b0>
1c00a01a:	4705                	li	a4,1
1c00a01c:	0ce7ac23          	sw	a4,216(a5)
1c00a020:	40b2                	lw	ra,12(sp)
1c00a022:	4422                	lw	s0,8(sp)
1c00a024:	0ce7ae23          	sw	a4,220(a5)
1c00a028:	0ce7aa23          	sw	a4,212(a5)
1c00a02c:	0141                	addi	sp,sp,16
1c00a02e:	8082                	ret
1c00a030:	026267b7          	lui	a5,0x2626
1c00a034:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2615a20>
1c00a038:	22f42c23          	sw	a5,568(s0)
1c00a03c:	bfd1                	j	1c00a010 <__rt_freq_init+0x22>

1c00a03e <hal_itc_wait_for_event_noirq>:
1c00a03e:	1a10a7b7          	lui	a5,0x1a10a
1c00a042:	300476f3          	csrrci	a3,mstatus,8
1c00a046:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1097ec>
1c00a04a:	8f69                	and	a4,a4,a0
1c00a04c:	eb11                	bnez	a4,1c00a060 <hal_itc_wait_for_event_noirq+0x22>
1c00a04e:	80a7a223          	sw	a0,-2044(a5)
1c00a052:	10500073          	wfi
1c00a056:	80a7a423          	sw	a0,-2040(a5)
1c00a05a:	30069073          	csrw	mstatus,a3
1c00a05e:	b7d5                	j	1c00a042 <hal_itc_wait_for_event_noirq+0x4>
1c00a060:	80a7aa23          	sw	a0,-2028(a5)
1c00a064:	30069073          	csrw	mstatus,a3
1c00a068:	8082                	ret

1c00a06a <__rt_pmu_cluster_power_down>:
1c00a06a:	1a1047b7          	lui	a5,0x1a104
1c00a06e:	5bbc                	lw	a5,112(a5)
1c00a070:	01079713          	slli	a4,a5,0x10
1c00a074:	02074c63          	bltz	a4,1c00a0ac <__rt_pmu_cluster_power_down+0x42>
1c00a078:	1141                	addi	sp,sp,-16
1c00a07a:	c422                	sw	s0,8(sp)
1c00a07c:	c606                	sw	ra,12(sp)
1c00a07e:	c226                	sw	s1,4(sp)
1c00a080:	1a104437          	lui	s0,0x1a104
1c00a084:	547c                	lw	a5,108(s0)
1c00a086:	e385                	bnez	a5,1c00a0a6 <__rt_pmu_cluster_power_down+0x3c>
1c00a088:	4485                	li	s1,1
1c00a08a:	c444                	sw	s1,12(s0)
1c00a08c:	478d                	li	a5,3
1c00a08e:	d83c                	sw	a5,112(s0)
1c00a090:	00800537          	lui	a0,0x800
1c00a094:	376d                	jal	1c00a03e <hal_itc_wait_for_event_noirq>
1c00a096:	d824                	sw	s1,112(s0)
1c00a098:	4422                	lw	s0,8(sp)
1c00a09a:	40b2                	lw	ra,12(sp)
1c00a09c:	4492                	lw	s1,4(sp)
1c00a09e:	00400537          	lui	a0,0x400
1c00a0a2:	0141                	addi	sp,sp,16
1c00a0a4:	bf69                	j	1c00a03e <hal_itc_wait_for_event_noirq>
1c00a0a6:	4505                	li	a0,1
1c00a0a8:	2a11                	jal	1c00a1bc <rt_time_wait_us>
1c00a0aa:	bfe9                	j	1c00a084 <__rt_pmu_cluster_power_down+0x1a>
1c00a0ac:	8082                	ret

1c00a0ae <__rt_pmu_cluster_power_up>:
1c00a0ae:	1141                	addi	sp,sp,-16
1c00a0b0:	c606                	sw	ra,12(sp)
1c00a0b2:	c422                	sw	s0,8(sp)
1c00a0b4:	478d                	li	a5,3
1c00a0b6:	1a104437          	lui	s0,0x1a104
1c00a0ba:	d83c                	sw	a5,112(s0)
1c00a0bc:	00400537          	lui	a0,0x400
1c00a0c0:	3fbd                	jal	1c00a03e <hal_itc_wait_for_event_noirq>
1c00a0c2:	02700793          	li	a5,39
1c00a0c6:	d83c                	sw	a5,112(s0)
1c00a0c8:	00800537          	lui	a0,0x800
1c00a0cc:	3f8d                	jal	1c00a03e <hal_itc_wait_for_event_noirq>
1c00a0ce:	6791                	lui	a5,0x4
1c00a0d0:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa103fec>
1c00a0d4:	02778793          	addi	a5,a5,39 # 4027 <__rt_hyper_pending_emu_stride+0x3d7f>
1c00a0d8:	d83c                	sw	a5,112(s0)
1c00a0da:	40b2                	lw	ra,12(sp)
1c00a0dc:	4422                	lw	s0,8(sp)
1c00a0de:	4505                	li	a0,1
1c00a0e0:	0141                	addi	sp,sp,16
1c00a0e2:	8082                	ret

1c00a0e4 <__rt_pmu_init>:
1c00a0e4:	1a1077b7          	lui	a5,0x1a107
1c00a0e8:	4741                	li	a4,16
1c00a0ea:	cb98                	sw	a4,16(a5)
1c00a0ec:	1a10a7b7          	lui	a5,0x1a10a
1c00a0f0:	02000737          	lui	a4,0x2000
1c00a0f4:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa1097f4>
1c00a0f8:	4709                	li	a4,2
1c00a0fa:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c00a0fe:	8082                	ret

1c00a100 <rt_padframe_set>:
1c00a100:	300476f3          	csrrci	a3,mstatus,8
1c00a104:	4158                	lw	a4,4(a0)
1c00a106:	1a1047b7          	lui	a5,0x1a104
1c00a10a:	4310                	lw	a2,0(a4)
1c00a10c:	cb90                	sw	a2,16(a5)
1c00a10e:	4350                	lw	a2,4(a4)
1c00a110:	cbd0                	sw	a2,20(a5)
1c00a112:	4710                	lw	a2,8(a4)
1c00a114:	cf90                	sw	a2,24(a5)
1c00a116:	4758                	lw	a4,12(a4)
1c00a118:	cfd8                	sw	a4,28(a5)
1c00a11a:	30069073          	csrw	mstatus,a3
1c00a11e:	8082                	ret

1c00a120 <__rt_padframe_init>:
1c00a120:	1c001537          	lui	a0,0x1c001
1c00a124:	00c50513          	addi	a0,a0,12 # 1c00100c <__rt_padframe_profiles>
1c00a128:	bfe1                	j	1c00a100 <rt_padframe_set>

1c00a12a <__rt_time_poweroff>:
1c00a12a:	1a10b7b7          	lui	a5,0x1a10b
1c00a12e:	47d8                	lw	a4,12(a5)
1c00a130:	1c0017b7          	lui	a5,0x1c001
1c00a134:	4501                	li	a0,0
1c00a136:	1ce7aa23          	sw	a4,468(a5) # 1c0011d4 <timer_count>
1c00a13a:	8082                	ret

1c00a13c <__rt_time_poweron>:
1c00a13c:	1c0017b7          	lui	a5,0x1c001
1c00a140:	1d47a703          	lw	a4,468(a5) # 1c0011d4 <timer_count>
1c00a144:	1a10b7b7          	lui	a5,0x1a10b
1c00a148:	4501                	li	a0,0
1c00a14a:	c7d8                	sw	a4,12(a5)
1c00a14c:	8082                	ret

1c00a14e <rt_event_push_delayed>:
1c00a14e:	30047373          	csrrci	t1,mstatus,8
1c00a152:	1a10b6b7          	lui	a3,0x1a10b
1c00a156:	46d0                	lw	a2,12(a3)
1c00a158:	1c001737          	lui	a4,0x1c001
1c00a15c:	24072783          	lw	a5,576(a4) # 1c001240 <first_delayed>
1c00a160:	86ba                	mv	a3,a4
1c00a162:	0005d363          	bgez	a1,1c00a168 <rt_event_push_delayed+0x1a>
1c00a166:	4581                	li	a1,0
1c00a168:	4779                	li	a4,30
1c00a16a:	02e5c5b3          	div	a1,a1,a4
1c00a16e:	80000737          	lui	a4,0x80000
1c00a172:	fff74713          	not	a4,a4
1c00a176:	00e67833          	and	a6,a2,a4
1c00a17a:	0585                	addi	a1,a1,1
1c00a17c:	962e                	add	a2,a2,a1
1c00a17e:	d950                	sw	a2,52(a0)
1c00a180:	982e                	add	a6,a6,a1
1c00a182:	4601                	li	a2,0
1c00a184:	c799                	beqz	a5,1c00a192 <rt_event_push_delayed+0x44>
1c00a186:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa10b014>
1c00a18a:	00e8f8b3          	and	a7,a7,a4
1c00a18e:	0108e863          	bltu	a7,a6,1c00a19e <rt_event_push_delayed+0x50>
1c00a192:	ca09                	beqz	a2,1c00a1a4 <rt_event_push_delayed+0x56>
1c00a194:	ce08                	sw	a0,24(a2)
1c00a196:	cd1c                	sw	a5,24(a0)
1c00a198:	30031073          	csrw	mstatus,t1
1c00a19c:	8082                	ret
1c00a19e:	863e                	mv	a2,a5
1c00a1a0:	4f9c                	lw	a5,24(a5)
1c00a1a2:	b7cd                	j	1c00a184 <rt_event_push_delayed+0x36>
1c00a1a4:	cd1c                	sw	a5,24(a0)
1c00a1a6:	1a10b7b7          	lui	a5,0x1a10b
1c00a1aa:	47d8                	lw	a4,12(a5)
1c00a1ac:	24a6a023          	sw	a0,576(a3) # 1a10b240 <__l1_end+0xa10b220>
1c00a1b0:	95ba                	add	a1,a1,a4
1c00a1b2:	cbcc                	sw	a1,20(a5)
1c00a1b4:	08500713          	li	a4,133
1c00a1b8:	c3d8                	sw	a4,4(a5)
1c00a1ba:	bff9                	j	1c00a198 <rt_event_push_delayed+0x4a>

1c00a1bc <rt_time_wait_us>:
1c00a1bc:	1101                	addi	sp,sp,-32
1c00a1be:	85aa                	mv	a1,a0
1c00a1c0:	4501                	li	a0,0
1c00a1c2:	ce06                	sw	ra,28(sp)
1c00a1c4:	cc22                	sw	s0,24(sp)
1c00a1c6:	c62e                	sw	a1,12(sp)
1c00a1c8:	ae7ff0ef          	jal	ra,1c009cae <rt_event_get_blocking>
1c00a1cc:	45b2                	lw	a1,12(sp)
1c00a1ce:	842a                	mv	s0,a0
1c00a1d0:	3fbd                	jal	1c00a14e <rt_event_push_delayed>
1c00a1d2:	8522                	mv	a0,s0
1c00a1d4:	4462                	lw	s0,24(sp)
1c00a1d6:	40f2                	lw	ra,28(sp)
1c00a1d8:	6105                	addi	sp,sp,32
1c00a1da:	b655                	j	1c009d7e <rt_event_wait>

1c00a1dc <__rt_time_init>:
1c00a1dc:	1141                	addi	sp,sp,-16
1c00a1de:	1c0017b7          	lui	a5,0x1c001
1c00a1e2:	2407a023          	sw	zero,576(a5) # 1c001240 <first_delayed>
1c00a1e6:	08300713          	li	a4,131
1c00a1ea:	1a10b7b7          	lui	a5,0x1a10b
1c00a1ee:	c606                	sw	ra,12(sp)
1c00a1f0:	c422                	sw	s0,8(sp)
1c00a1f2:	1c00a5b7          	lui	a1,0x1c00a
1c00a1f6:	c3d8                	sw	a4,4(a5)
1c00a1f8:	27458593          	addi	a1,a1,628 # 1c00a274 <__rt_timer_handler>
1c00a1fc:	452d                	li	a0,11
1c00a1fe:	bbeff0ef          	jal	ra,1c0095bc <rt_irq_set_handler>
1c00a202:	f14027f3          	csrr	a5,mhartid
1c00a206:	8795                	srai	a5,a5,0x5
1c00a208:	6705                	lui	a4,0x1
1c00a20a:	03f7f793          	andi	a5,a5,63
1c00a20e:	46fd                	li	a3,31
1c00a210:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a214:	04d79863          	bne	a5,a3,1c00a264 <__rt_time_init+0x88>
1c00a218:	1a10a7b7          	lui	a5,0x1a10a
1c00a21c:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1097e4>
1c00a220:	1c00a5b7          	lui	a1,0x1c00a
1c00a224:	4601                	li	a2,0
1c00a226:	12a58593          	addi	a1,a1,298 # 1c00a12a <__rt_time_poweroff>
1c00a22a:	4509                	li	a0,2
1c00a22c:	d20ff0ef          	jal	ra,1c00974c <__rt_cbsys_add>
1c00a230:	1c00a5b7          	lui	a1,0x1c00a
1c00a234:	842a                	mv	s0,a0
1c00a236:	4601                	li	a2,0
1c00a238:	13c58593          	addi	a1,a1,316 # 1c00a13c <__rt_time_poweron>
1c00a23c:	450d                	li	a0,3
1c00a23e:	d0eff0ef          	jal	ra,1c00974c <__rt_cbsys_add>
1c00a242:	8d41                	or	a0,a0,s0
1c00a244:	c505                	beqz	a0,1c00a26c <__rt_time_init+0x90>
1c00a246:	f1402673          	csrr	a2,mhartid
1c00a24a:	1c000537          	lui	a0,0x1c000
1c00a24e:	40565593          	srai	a1,a2,0x5
1c00a252:	03f5f593          	andi	a1,a1,63
1c00a256:	8a7d                	andi	a2,a2,31
1c00a258:	55450513          	addi	a0,a0,1364 # 1c000554 <__DTOR_END__+0x268>
1c00a25c:	015000ef          	jal	ra,1c00aa70 <printf>
1c00a260:	79c000ef          	jal	ra,1c00a9fc <abort>
1c00a264:	002047b7          	lui	a5,0x204
1c00a268:	cbd8                	sw	a4,20(a5)
1c00a26a:	bf5d                	j	1c00a220 <__rt_time_init+0x44>
1c00a26c:	40b2                	lw	ra,12(sp)
1c00a26e:	4422                	lw	s0,8(sp)
1c00a270:	0141                	addi	sp,sp,16
1c00a272:	8082                	ret

1c00a274 <__rt_timer_handler>:
1c00a274:	7179                	addi	sp,sp,-48
1c00a276:	ce36                	sw	a3,28(sp)
1c00a278:	cc3a                	sw	a4,24(sp)
1c00a27a:	1a10b6b7          	lui	a3,0x1a10b
1c00a27e:	1c001737          	lui	a4,0x1c001
1c00a282:	d61a                	sw	t1,44(sp)
1c00a284:	d032                	sw	a2,32(sp)
1c00a286:	ca3e                	sw	a5,20(sp)
1c00a288:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa10afec>
1c00a28c:	24072783          	lw	a5,576(a4) # 1c001240 <first_delayed>
1c00a290:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a294:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a298:	c842                	sw	a6,16(sp)
1c00a29a:	80000837          	lui	a6,0x80000
1c00a29e:	d42a                	sw	a0,40(sp)
1c00a2a0:	d22e                	sw	a1,36(sp)
1c00a2a2:	c646                	sw	a7,12(sp)
1c00a2a4:	c472                	sw	t3,8(sp)
1c00a2a6:	4581                	li	a1,0
1c00a2a8:	4501                	li	a0,0
1c00a2aa:	ffe84813          	xori	a6,a6,-2
1c00a2ae:	efb9                	bnez	a5,1c00a30c <__rt_timer_handler+0x98>
1c00a2b0:	c119                	beqz	a0,1c00a2b6 <__rt_timer_handler+0x42>
1c00a2b2:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a2b6:	c199                	beqz	a1,1c00a2bc <__rt_timer_handler+0x48>
1c00a2b8:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a2bc:	24072023          	sw	zero,576(a4)
1c00a2c0:	1a10b7b7          	lui	a5,0x1a10b
1c00a2c4:	08100713          	li	a4,129
1c00a2c8:	c3d8                	sw	a4,4(a5)
1c00a2ca:	6785                	lui	a5,0x1
1c00a2cc:	1a10a737          	lui	a4,0x1a10a
1c00a2d0:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a2d4:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa1097f4>
1c00a2d8:	5332                	lw	t1,44(sp)
1c00a2da:	5522                	lw	a0,40(sp)
1c00a2dc:	5592                	lw	a1,36(sp)
1c00a2de:	5602                	lw	a2,32(sp)
1c00a2e0:	46f2                	lw	a3,28(sp)
1c00a2e2:	4762                	lw	a4,24(sp)
1c00a2e4:	47d2                	lw	a5,20(sp)
1c00a2e6:	4842                	lw	a6,16(sp)
1c00a2e8:	48b2                	lw	a7,12(sp)
1c00a2ea:	4e22                	lw	t3,8(sp)
1c00a2ec:	6145                	addi	sp,sp,48
1c00a2ee:	30200073          	mret
1c00a2f2:	0187a883          	lw	a7,24(a5)
1c00a2f6:	0007ac23          	sw	zero,24(a5)
1c00a2fa:	c611                	beqz	a2,1c00a306 <__rt_timer_handler+0x92>
1c00a2fc:	ce9c                	sw	a5,24(a3)
1c00a2fe:	86be                	mv	a3,a5
1c00a300:	4585                	li	a1,1
1c00a302:	87c6                	mv	a5,a7
1c00a304:	b76d                	j	1c00a2ae <__rt_timer_handler+0x3a>
1c00a306:	863e                	mv	a2,a5
1c00a308:	4505                	li	a0,1
1c00a30a:	bfd5                	j	1c00a2fe <__rt_timer_handler+0x8a>
1c00a30c:	0347a883          	lw	a7,52(a5)
1c00a310:	41130e33          	sub	t3,t1,a7
1c00a314:	fdc87fe3          	bleu	t3,a6,1c00a2f2 <__rt_timer_handler+0x7e>
1c00a318:	c119                	beqz	a0,1c00a31e <__rt_timer_handler+0xaa>
1c00a31a:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a31e:	c199                	beqz	a1,1c00a324 <__rt_timer_handler+0xb0>
1c00a320:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a324:	24f72023          	sw	a5,576(a4)
1c00a328:	1a10b737          	lui	a4,0x1a10b
1c00a32c:	475c                	lw	a5,12(a4)
1c00a32e:	406787b3          	sub	a5,a5,t1
1c00a332:	97c6                	add	a5,a5,a7
1c00a334:	cb5c                	sw	a5,20(a4)
1c00a336:	08500793          	li	a5,133
1c00a33a:	c35c                	sw	a5,4(a4)
1c00a33c:	bf71                	j	1c00a2d8 <__rt_timer_handler+0x64>

1c00a33e <rt_periph_copy>:
1c00a33e:	7179                	addi	sp,sp,-48
1c00a340:	d422                	sw	s0,40(sp)
1c00a342:	842a                	mv	s0,a0
1c00a344:	d606                	sw	ra,44(sp)
1c00a346:	d226                	sw	s1,36(sp)
1c00a348:	d04a                	sw	s2,32(sp)
1c00a34a:	30047973          	csrrci	s2,mstatus,8
1c00a34e:	4015d493          	srai	s1,a1,0x1
1c00a352:	1a102537          	lui	a0,0x1a102
1c00a356:	049e                	slli	s1,s1,0x7
1c00a358:	94aa                	add	s1,s1,a0
1c00a35a:	00459513          	slli	a0,a1,0x4
1c00a35e:	8941                	andi	a0,a0,16
1c00a360:	94aa                	add	s1,s1,a0
1c00a362:	853e                	mv	a0,a5
1c00a364:	ef89                	bnez	a5,1c00a37e <rt_periph_copy+0x40>
1c00a366:	ce2e                	sw	a1,28(sp)
1c00a368:	cc32                	sw	a2,24(sp)
1c00a36a:	ca36                	sw	a3,20(sp)
1c00a36c:	c83a                	sw	a4,16(sp)
1c00a36e:	c63e                	sw	a5,12(sp)
1c00a370:	895ff0ef          	jal	ra,1c009c04 <__rt_wait_event_prepare_blocking>
1c00a374:	47b2                	lw	a5,12(sp)
1c00a376:	4742                	lw	a4,16(sp)
1c00a378:	46d2                	lw	a3,20(sp)
1c00a37a:	4662                	lw	a2,24(sp)
1c00a37c:	45f2                	lw	a1,28(sp)
1c00a37e:	e419                	bnez	s0,1c00a38c <rt_periph_copy+0x4e>
1c00a380:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa102014>
1c00a384:	04052023          	sw	zero,64(a0)
1c00a388:	04052823          	sw	zero,80(a0)
1c00a38c:	00c42803          	lw	a6,12(s0)
1c00a390:	c054                	sw	a3,4(s0)
1c00a392:	cc08                	sw	a0,24(s0)
1c00a394:	00f87813          	andi	a6,a6,15
1c00a398:	4891                	li	a7,4
1c00a39a:	01076713          	ori	a4,a4,16
1c00a39e:	0708ec63          	bltu	a7,a6,1c00a416 <rt_periph_copy+0xd8>
1c00a3a2:	04000893          	li	a7,64
1c00a3a6:	0596                	slli	a1,a1,0x5
1c00a3a8:	98ae                	add	a7,a7,a1
1c00a3aa:	0008a303          	lw	t1,0(a7)
1c00a3ae:	00042a23          	sw	zero,20(s0)
1c00a3b2:	04000813          	li	a6,64
1c00a3b6:	02031663          	bnez	t1,1c00a3e2 <rt_periph_copy+0xa4>
1c00a3ba:	0088a023          	sw	s0,0(a7)
1c00a3be:	00b808b3          	add	a7,a6,a1
1c00a3c2:	0088a303          	lw	t1,8(a7)
1c00a3c6:	0088a223          	sw	s0,4(a7)
1c00a3ca:	02031163          	bnez	t1,1c00a3ec <rt_periph_copy+0xae>
1c00a3ce:	0084a883          	lw	a7,8(s1)
1c00a3d2:	0208f893          	andi	a7,a7,32
1c00a3d6:	00089b63          	bnez	a7,1c00a3ec <rt_periph_copy+0xae>
1c00a3da:	c090                	sw	a2,0(s1)
1c00a3dc:	c0d4                	sw	a3,4(s1)
1c00a3de:	c498                	sw	a4,8(s1)
1c00a3e0:	a005                	j	1c00a400 <rt_periph_copy+0xc2>
1c00a3e2:	0048a883          	lw	a7,4(a7)
1c00a3e6:	0088aa23          	sw	s0,20(a7)
1c00a3ea:	bfd1                	j	1c00a3be <rt_periph_copy+0x80>
1c00a3ec:	00042823          	sw	zero,16(s0)
1c00a3f0:	c010                	sw	a2,0(s0)
1c00a3f2:	c054                	sw	a3,4(s0)
1c00a3f4:	c418                	sw	a4,8(s0)
1c00a3f6:	00031563          	bnez	t1,1c00a400 <rt_periph_copy+0xc2>
1c00a3fa:	982e                	add	a6,a6,a1
1c00a3fc:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a400:	e399                	bnez	a5,1c00a406 <rt_periph_copy+0xc8>
1c00a402:	953ff0ef          	jal	ra,1c009d54 <__rt_wait_event>
1c00a406:	30091073          	csrw	mstatus,s2
1c00a40a:	50b2                	lw	ra,44(sp)
1c00a40c:	5422                	lw	s0,40(sp)
1c00a40e:	5492                	lw	s1,36(sp)
1c00a410:	5902                	lw	s2,32(sp)
1c00a412:	6145                	addi	sp,sp,48
1c00a414:	8082                	ret
1c00a416:	4899                	li	a7,6
1c00a418:	ff1814e3          	bne	a6,a7,1c00a400 <rt_periph_copy+0xc2>
1c00a41c:	04000893          	li	a7,64
1c00a420:	0596                	slli	a1,a1,0x5
1c00a422:	98ae                	add	a7,a7,a1
1c00a424:	0008a303          	lw	t1,0(a7)
1c00a428:	00042a23          	sw	zero,20(s0)
1c00a42c:	04000813          	li	a6,64
1c00a430:	00031f63          	bnez	t1,1c00a44e <rt_periph_copy+0x110>
1c00a434:	0088a023          	sw	s0,0(a7)
1c00a438:	95c2                	add	a1,a1,a6
1c00a43a:	c1c0                	sw	s0,4(a1)
1c00a43c:	00031e63          	bnez	t1,1c00a458 <rt_periph_copy+0x11a>
1c00a440:	02442803          	lw	a6,36(s0)
1c00a444:	1a1025b7          	lui	a1,0x1a102
1c00a448:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa102100>
1c00a44c:	b779                	j	1c00a3da <rt_periph_copy+0x9c>
1c00a44e:	0048a883          	lw	a7,4(a7)
1c00a452:	0088aa23          	sw	s0,20(a7)
1c00a456:	b7cd                	j	1c00a438 <rt_periph_copy+0xfa>
1c00a458:	c418                	sw	a4,8(s0)
1c00a45a:	4598                	lw	a4,8(a1)
1c00a45c:	c010                	sw	a2,0(s0)
1c00a45e:	c054                	sw	a3,4(s0)
1c00a460:	00042823          	sw	zero,16(s0)
1c00a464:	ff51                	bnez	a4,1c00a400 <rt_periph_copy+0xc2>
1c00a466:	c580                	sw	s0,8(a1)
1c00a468:	bf61                	j	1c00a400 <rt_periph_copy+0xc2>

1c00a46a <__rt_periph_init>:
1c00a46a:	1c0085b7          	lui	a1,0x1c008
1c00a46e:	04000693          	li	a3,64
1c00a472:	4601                	li	a2,0
1c00a474:	04000793          	li	a5,64
1c00a478:	1a1028b7          	lui	a7,0x1a102
1c00a47c:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a480:	4841                	li	a6,16
1c00a482:	40165713          	srai	a4,a2,0x1
1c00a486:	00461513          	slli	a0,a2,0x4
1c00a48a:	071e                	slli	a4,a4,0x7
1c00a48c:	9746                	add	a4,a4,a7
1c00a48e:	8941                	andi	a0,a0,16
1c00a490:	972a                	add	a4,a4,a0
1c00a492:	0006a023          	sw	zero,0(a3)
1c00a496:	0006a423          	sw	zero,8(a3)
1c00a49a:	c6d8                	sw	a4,12(a3)
1c00a49c:	cecc                	sw	a1,28(a3)
1c00a49e:	0605                	addi	a2,a2,1
1c00a4a0:	02068693          	addi	a3,a3,32
1c00a4a4:	fd061fe3          	bne	a2,a6,1c00a482 <__rt_periph_init+0x18>
1c00a4a8:	1c008737          	lui	a4,0x1c008
1c00a4ac:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a4b0:	2007a023          	sw	zero,512(a5)
1c00a4b4:	20e7a423          	sw	a4,520(a5)
1c00a4b8:	20e7a623          	sw	a4,524(a5)
1c00a4bc:	20e7a823          	sw	a4,528(a5)
1c00a4c0:	20e7aa23          	sw	a4,532(a5)
1c00a4c4:	20e7ac23          	sw	a4,536(a5)
1c00a4c8:	20e7ae23          	sw	a4,540(a5)
1c00a4cc:	22e7a023          	sw	a4,544(a5)
1c00a4d0:	22e7a223          	sw	a4,548(a5)
1c00a4d4:	2007a223          	sw	zero,516(a5)
1c00a4d8:	8082                	ret

1c00a4da <__rt_i2c_init>:
1c00a4da:	1c0127b7          	lui	a5,0x1c012
1c00a4de:	96878793          	addi	a5,a5,-1688 # 1c011968 <__rt_i2c>
1c00a4e2:	00078223          	sb	zero,4(a5)
1c00a4e6:	00078a23          	sb	zero,20(a5)
1c00a4ea:	8082                	ret

1c00a4ec <__rt_hyper_init>:
1c00a4ec:	1c001737          	lui	a4,0x1c001
1c00a4f0:	26800793          	li	a5,616
1c00a4f4:	1c072c23          	sw	zero,472(a4) # 1c0011d8 <__pi_hyper_cluster_reqs_first>
1c00a4f8:	577d                	li	a4,-1
1c00a4fa:	0007aa23          	sw	zero,20(a5)
1c00a4fe:	0207a823          	sw	zero,48(a5)
1c00a502:	cf98                	sw	a4,24(a5)
1c00a504:	8082                	ret

1c00a506 <__rt_spim_init>:
1c00a506:	1c0017b7          	lui	a5,0x1c001
1c00a50a:	1c07ae23          	sw	zero,476(a5) # 1c0011dc <__rt_spim_open_count>
1c00a50e:	8082                	ret

1c00a510 <rt_is_fc>:
1c00a510:	f1402573          	csrr	a0,mhartid
1c00a514:	8515                	srai	a0,a0,0x5
1c00a516:	03f57513          	andi	a0,a0,63
1c00a51a:	1505                	addi	a0,a0,-31
1c00a51c:	00153513          	seqz	a0,a0
1c00a520:	8082                	ret

1c00a522 <__rt_io_end_of_flush>:
1c00a522:	1c0017b7          	lui	a5,0x1c001
1c00a526:	1e07a223          	sw	zero,484(a5) # 1c0011e4 <__rt_io_pending_flush>
1c00a52a:	00052c23          	sw	zero,24(a0)
1c00a52e:	8082                	ret

1c00a530 <__rt_io_uart_wait_req>:
1c00a530:	1141                	addi	sp,sp,-16
1c00a532:	c226                	sw	s1,4(sp)
1c00a534:	84aa                	mv	s1,a0
1c00a536:	c606                	sw	ra,12(sp)
1c00a538:	c422                	sw	s0,8(sp)
1c00a53a:	c04a                	sw	s2,0(sp)
1c00a53c:	30047973          	csrrci	s2,mstatus,8
1c00a540:	1c001437          	lui	s0,0x1c001
1c00a544:	1e040413          	addi	s0,s0,480 # 1c0011e0 <__rt_io_event_current>
1c00a548:	4008                	lw	a0,0(s0)
1c00a54a:	c509                	beqz	a0,1c00a554 <__rt_io_uart_wait_req+0x24>
1c00a54c:	833ff0ef          	jal	ra,1c009d7e <rt_event_wait>
1c00a550:	00042023          	sw	zero,0(s0)
1c00a554:	4785                	li	a5,1
1c00a556:	08f48623          	sb	a5,140(s1)
1c00a55a:	08d4c783          	lbu	a5,141(s1)
1c00a55e:	00201737          	lui	a4,0x201
1c00a562:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c00a566:	04078793          	addi	a5,a5,64
1c00a56a:	07da                	slli	a5,a5,0x16
1c00a56c:	97ba                	add	a5,a5,a4
1c00a56e:	0007a023          	sw	zero,0(a5)
1c00a572:	30091073          	csrw	mstatus,s2
1c00a576:	40b2                	lw	ra,12(sp)
1c00a578:	4422                	lw	s0,8(sp)
1c00a57a:	4492                	lw	s1,4(sp)
1c00a57c:	4902                	lw	s2,0(sp)
1c00a57e:	0141                	addi	sp,sp,16
1c00a580:	8082                	ret

1c00a582 <__rt_io_start>:
1c00a582:	1101                	addi	sp,sp,-32
1c00a584:	0028                	addi	a0,sp,8
1c00a586:	ce06                	sw	ra,28(sp)
1c00a588:	cc22                	sw	s0,24(sp)
1c00a58a:	7e1000ef          	jal	ra,1c00b56a <rt_uart_conf_init>
1c00a58e:	4585                	li	a1,1
1c00a590:	4501                	li	a0,0
1c00a592:	e8aff0ef          	jal	ra,1c009c1c <rt_event_alloc>
1c00a596:	547d                	li	s0,-1
1c00a598:	ed1d                	bnez	a0,1c00a5d6 <__rt_io_start+0x54>
1c00a59a:	1c0017b7          	lui	a5,0x1c001
1c00a59e:	0e07a783          	lw	a5,224(a5) # 1c0010e0 <__rt_iodev_uart_baudrate>
1c00a5a2:	842a                	mv	s0,a0
1c00a5a4:	1c001537          	lui	a0,0x1c001
1c00a5a8:	e3ff6597          	auipc	a1,0xe3ff6
1c00a5ac:	a8058593          	addi	a1,a1,-1408 # 28 <__rt_sched>
1c00a5b0:	12c50513          	addi	a0,a0,300 # 1c00112c <__rt_io_event>
1c00a5b4:	c43e                	sw	a5,8(sp)
1c00a5b6:	e3cff0ef          	jal	ra,1c009bf2 <__rt_event_init>
1c00a5ba:	1c0017b7          	lui	a5,0x1c001
1c00a5be:	1f07a503          	lw	a0,496(a5) # 1c0011f0 <__rt_iodev_uart_channel>
1c00a5c2:	4681                	li	a3,0
1c00a5c4:	4601                	li	a2,0
1c00a5c6:	002c                	addi	a1,sp,8
1c00a5c8:	050d                	addi	a0,a0,3
1c00a5ca:	7b1000ef          	jal	ra,1c00b57a <__rt_uart_open>
1c00a5ce:	1c0017b7          	lui	a5,0x1c001
1c00a5d2:	1ea7a423          	sw	a0,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a5d6:	8522                	mv	a0,s0
1c00a5d8:	40f2                	lw	ra,28(sp)
1c00a5da:	4462                	lw	s0,24(sp)
1c00a5dc:	6105                	addi	sp,sp,32
1c00a5de:	8082                	ret

1c00a5e0 <rt_event_execute.isra.2.constprop.11>:
1c00a5e0:	1141                	addi	sp,sp,-16
1c00a5e2:	c606                	sw	ra,12(sp)
1c00a5e4:	c422                	sw	s0,8(sp)
1c00a5e6:	30047473          	csrrci	s0,mstatus,8
1c00a5ea:	4585                	li	a1,1
1c00a5ec:	e3ff6517          	auipc	a0,0xe3ff6
1c00a5f0:	a3c50513          	addi	a0,a0,-1476 # 28 <__rt_sched>
1c00a5f4:	f00ff0ef          	jal	ra,1c009cf4 <__rt_event_execute>
1c00a5f8:	30041073          	csrw	mstatus,s0
1c00a5fc:	40b2                	lw	ra,12(sp)
1c00a5fe:	4422                	lw	s0,8(sp)
1c00a600:	0141                	addi	sp,sp,16
1c00a602:	8082                	ret

1c00a604 <__rt_io_lock>:
1c00a604:	1c0017b7          	lui	a5,0x1c001
1c00a608:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a60c:	c791                	beqz	a5,1c00a618 <__rt_io_lock+0x14>
1c00a60e:	1c0017b7          	lui	a5,0x1c001
1c00a612:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a616:	c3a1                	beqz	a5,1c00a656 <__rt_io_lock+0x52>
1c00a618:	7171                	addi	sp,sp,-176
1c00a61a:	d706                	sw	ra,172(sp)
1c00a61c:	3dd5                	jal	1c00a510 <rt_is_fc>
1c00a61e:	1c0017b7          	lui	a5,0x1c001
1c00a622:	c901                	beqz	a0,1c00a632 <__rt_io_lock+0x2e>
1c00a624:	ffc78513          	addi	a0,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a628:	9b8ff0ef          	jal	ra,1c0097e0 <__rt_fc_lock>
1c00a62c:	50ba                	lw	ra,172(sp)
1c00a62e:	614d                	addi	sp,sp,176
1c00a630:	8082                	ret
1c00a632:	002c                	addi	a1,sp,8
1c00a634:	ffc78513          	addi	a0,a5,-4
1c00a638:	a1aff0ef          	jal	ra,1c009852 <__rt_fc_cluster_lock>
1c00a63c:	4689                	li	a3,2
1c00a63e:	00204737          	lui	a4,0x204
1c00a642:	09c14783          	lbu	a5,156(sp)
1c00a646:	0ff7f793          	andi	a5,a5,255
1c00a64a:	f3ed                	bnez	a5,1c00a62c <__rt_io_lock+0x28>
1c00a64c:	c714                	sw	a3,8(a4)
1c00a64e:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a652:	c354                	sw	a3,4(a4)
1c00a654:	b7fd                	j	1c00a642 <__rt_io_lock+0x3e>
1c00a656:	8082                	ret

1c00a658 <__rt_io_unlock>:
1c00a658:	1c0017b7          	lui	a5,0x1c001
1c00a65c:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a660:	c791                	beqz	a5,1c00a66c <__rt_io_unlock+0x14>
1c00a662:	1c0017b7          	lui	a5,0x1c001
1c00a666:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a66a:	c3a1                	beqz	a5,1c00a6aa <__rt_io_unlock+0x52>
1c00a66c:	7171                	addi	sp,sp,-176
1c00a66e:	d706                	sw	ra,172(sp)
1c00a670:	3545                	jal	1c00a510 <rt_is_fc>
1c00a672:	1c0017b7          	lui	a5,0x1c001
1c00a676:	c901                	beqz	a0,1c00a686 <__rt_io_unlock+0x2e>
1c00a678:	ffc78513          	addi	a0,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00a67c:	9a0ff0ef          	jal	ra,1c00981c <__rt_fc_unlock>
1c00a680:	50ba                	lw	ra,172(sp)
1c00a682:	614d                	addi	sp,sp,176
1c00a684:	8082                	ret
1c00a686:	002c                	addi	a1,sp,8
1c00a688:	ffc78513          	addi	a0,a5,-4
1c00a68c:	9feff0ef          	jal	ra,1c00988a <__rt_fc_cluster_unlock>
1c00a690:	4689                	li	a3,2
1c00a692:	00204737          	lui	a4,0x204
1c00a696:	09c14783          	lbu	a5,156(sp)
1c00a69a:	0ff7f793          	andi	a5,a5,255
1c00a69e:	f3ed                	bnez	a5,1c00a680 <__rt_io_unlock+0x28>
1c00a6a0:	c714                	sw	a3,8(a4)
1c00a6a2:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a6a6:	c354                	sw	a3,4(a4)
1c00a6a8:	b7fd                	j	1c00a696 <__rt_io_unlock+0x3e>
1c00a6aa:	8082                	ret

1c00a6ac <__rt_io_uart_wait_pending>:
1c00a6ac:	7135                	addi	sp,sp,-160
1c00a6ae:	cd22                	sw	s0,152(sp)
1c00a6b0:	cf06                	sw	ra,156(sp)
1c00a6b2:	cb26                	sw	s1,148(sp)
1c00a6b4:	1c001437          	lui	s0,0x1c001
1c00a6b8:	1e442783          	lw	a5,484(s0) # 1c0011e4 <__rt_io_pending_flush>
1c00a6bc:	e39d                	bnez	a5,1c00a6e2 <__rt_io_uart_wait_pending+0x36>
1c00a6be:	1c001437          	lui	s0,0x1c001
1c00a6c2:	1e040413          	addi	s0,s0,480 # 1c0011e0 <__rt_io_event_current>
1c00a6c6:	4004                	lw	s1,0(s0)
1c00a6c8:	c881                	beqz	s1,1c00a6d8 <__rt_io_uart_wait_pending+0x2c>
1c00a6ca:	3599                	jal	1c00a510 <rt_is_fc>
1c00a6cc:	cd19                	beqz	a0,1c00a6ea <__rt_io_uart_wait_pending+0x3e>
1c00a6ce:	8526                	mv	a0,s1
1c00a6d0:	eaeff0ef          	jal	ra,1c009d7e <rt_event_wait>
1c00a6d4:	00042023          	sw	zero,0(s0)
1c00a6d8:	40fa                	lw	ra,156(sp)
1c00a6da:	446a                	lw	s0,152(sp)
1c00a6dc:	44da                	lw	s1,148(sp)
1c00a6de:	610d                	addi	sp,sp,160
1c00a6e0:	8082                	ret
1c00a6e2:	3f9d                	jal	1c00a658 <__rt_io_unlock>
1c00a6e4:	3df5                	jal	1c00a5e0 <rt_event_execute.isra.2.constprop.11>
1c00a6e6:	3f39                	jal	1c00a604 <__rt_io_lock>
1c00a6e8:	bfc1                	j	1c00a6b8 <__rt_io_uart_wait_pending+0xc>
1c00a6ea:	f14027f3          	csrr	a5,mhartid
1c00a6ee:	8795                	srai	a5,a5,0x5
1c00a6f0:	03f7f793          	andi	a5,a5,63
1c00a6f4:	08f106a3          	sb	a5,141(sp)
1c00a6f8:	1c00a7b7          	lui	a5,0x1c00a
1c00a6fc:	53078793          	addi	a5,a5,1328 # 1c00a530 <__rt_io_uart_wait_req>
1c00a700:	c03e                	sw	a5,0(sp)
1c00a702:	00010793          	mv	a5,sp
1c00a706:	4705                	li	a4,1
1c00a708:	c23e                	sw	a5,4(sp)
1c00a70a:	850a                	mv	a0,sp
1c00a70c:	1c0017b7          	lui	a5,0x1c001
1c00a710:	14e7a623          	sw	a4,332(a5) # 1c00114c <__rt_io_event+0x20>
1c00a714:	08010623          	sb	zero,140(sp)
1c00a718:	d002                	sw	zero,32(sp)
1c00a71a:	d202                	sw	zero,36(sp)
1c00a71c:	a29fe0ef          	jal	ra,1c009144 <__rt_cluster_push_fc_event>
1c00a720:	4689                	li	a3,2
1c00a722:	00204737          	lui	a4,0x204
1c00a726:	08c14783          	lbu	a5,140(sp)
1c00a72a:	0ff7f793          	andi	a5,a5,255
1c00a72e:	f7cd                	bnez	a5,1c00a6d8 <__rt_io_uart_wait_pending+0x2c>
1c00a730:	c714                	sw	a3,8(a4)
1c00a732:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a736:	c354                	sw	a3,4(a4)
1c00a738:	b7fd                	j	1c00a726 <__rt_io_uart_wait_pending+0x7a>

1c00a73a <__rt_io_stop>:
1c00a73a:	1141                	addi	sp,sp,-16
1c00a73c:	c422                	sw	s0,8(sp)
1c00a73e:	1c001437          	lui	s0,0x1c001
1c00a742:	c606                	sw	ra,12(sp)
1c00a744:	1e840413          	addi	s0,s0,488 # 1c0011e8 <_rt_io_uart>
1c00a748:	3795                	jal	1c00a6ac <__rt_io_uart_wait_pending>
1c00a74a:	4008                	lw	a0,0(s0)
1c00a74c:	4581                	li	a1,0
1c00a74e:	6b5000ef          	jal	ra,1c00b602 <rt_uart_close>
1c00a752:	40b2                	lw	ra,12(sp)
1c00a754:	00042023          	sw	zero,0(s0)
1c00a758:	4422                	lw	s0,8(sp)
1c00a75a:	4501                	li	a0,0
1c00a75c:	0141                	addi	sp,sp,16
1c00a75e:	8082                	ret

1c00a760 <__rt_io_uart_flush.constprop.10>:
1c00a760:	7131                	addi	sp,sp,-192
1c00a762:	dd22                	sw	s0,184(sp)
1c00a764:	df06                	sw	ra,188(sp)
1c00a766:	db26                	sw	s1,180(sp)
1c00a768:	d94a                	sw	s2,176(sp)
1c00a76a:	d74e                	sw	s3,172(sp)
1c00a76c:	d552                	sw	s4,168(sp)
1c00a76e:	d356                	sw	s5,164(sp)
1c00a770:	1c001437          	lui	s0,0x1c001
1c00a774:	1e442783          	lw	a5,484(s0) # 1c0011e4 <__rt_io_pending_flush>
1c00a778:	1e440a13          	addi	s4,s0,484
1c00a77c:	e7bd                	bnez	a5,1c00a7ea <__rt_io_uart_flush.constprop.10+0x8a>
1c00a77e:	1c0014b7          	lui	s1,0x1c001
1c00a782:	01c48793          	addi	a5,s1,28 # 1c00101c <__hal_debug_struct>
1c00a786:	4f80                	lw	s0,24(a5)
1c00a788:	01c48a93          	addi	s5,s1,28
1c00a78c:	c431                	beqz	s0,1c00a7d8 <__rt_io_uart_flush.constprop.10+0x78>
1c00a78e:	3349                	jal	1c00a510 <rt_is_fc>
1c00a790:	1c0017b7          	lui	a5,0x1c001
1c00a794:	1e87a903          	lw	s2,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a798:	1c0019b7          	lui	s3,0x1c001
1c00a79c:	cd29                	beqz	a0,1c00a7f6 <__rt_io_uart_flush.constprop.10+0x96>
1c00a79e:	1c00a5b7          	lui	a1,0x1c00a
1c00a7a2:	4785                	li	a5,1
1c00a7a4:	01c48613          	addi	a2,s1,28
1c00a7a8:	52258593          	addi	a1,a1,1314 # 1c00a522 <__rt_io_end_of_flush>
1c00a7ac:	4501                	li	a0,0
1c00a7ae:	00fa2023          	sw	a5,0(s4)
1c00a7b2:	ce2ff0ef          	jal	ra,1c009c94 <rt_event_get>
1c00a7b6:	00492583          	lw	a1,4(s2)
1c00a7ba:	87aa                	mv	a5,a0
1c00a7bc:	4701                	li	a4,0
1c00a7be:	0586                	slli	a1,a1,0x1
1c00a7c0:	86a2                	mv	a3,s0
1c00a7c2:	03898613          	addi	a2,s3,56 # 1c001038 <__hal_debug_struct+0x1c>
1c00a7c6:	0585                	addi	a1,a1,1
1c00a7c8:	4501                	li	a0,0
1c00a7ca:	b75ff0ef          	jal	ra,1c00a33e <rt_periph_copy>
1c00a7ce:	3569                	jal	1c00a658 <__rt_io_unlock>
1c00a7d0:	000a2783          	lw	a5,0(s4)
1c00a7d4:	ef99                	bnez	a5,1c00a7f2 <__rt_io_uart_flush.constprop.10+0x92>
1c00a7d6:	353d                	jal	1c00a604 <__rt_io_lock>
1c00a7d8:	50fa                	lw	ra,188(sp)
1c00a7da:	546a                	lw	s0,184(sp)
1c00a7dc:	54da                	lw	s1,180(sp)
1c00a7de:	594a                	lw	s2,176(sp)
1c00a7e0:	59ba                	lw	s3,172(sp)
1c00a7e2:	5a2a                	lw	s4,168(sp)
1c00a7e4:	5a9a                	lw	s5,164(sp)
1c00a7e6:	6129                	addi	sp,sp,192
1c00a7e8:	8082                	ret
1c00a7ea:	35bd                	jal	1c00a658 <__rt_io_unlock>
1c00a7ec:	3bd5                	jal	1c00a5e0 <rt_event_execute.isra.2.constprop.11>
1c00a7ee:	3d19                	jal	1c00a604 <__rt_io_lock>
1c00a7f0:	b751                	j	1c00a774 <__rt_io_uart_flush.constprop.10+0x14>
1c00a7f2:	33fd                	jal	1c00a5e0 <rt_event_execute.isra.2.constprop.11>
1c00a7f4:	bff1                	j	1c00a7d0 <__rt_io_uart_flush.constprop.10+0x70>
1c00a7f6:	0054                	addi	a3,sp,4
1c00a7f8:	8622                	mv	a2,s0
1c00a7fa:	03898593          	addi	a1,s3,56
1c00a7fe:	854a                	mv	a0,s2
1c00a800:	64d000ef          	jal	ra,1c00b64c <rt_uart_cluster_write>
1c00a804:	4689                	li	a3,2
1c00a806:	00204737          	lui	a4,0x204
1c00a80a:	09c14783          	lbu	a5,156(sp)
1c00a80e:	0ff7f793          	andi	a5,a5,255
1c00a812:	c781                	beqz	a5,1c00a81a <__rt_io_uart_flush.constprop.10+0xba>
1c00a814:	000aac23          	sw	zero,24(s5)
1c00a818:	b7c1                	j	1c00a7d8 <__rt_io_uart_flush.constprop.10+0x78>
1c00a81a:	c714                	sw	a3,8(a4)
1c00a81c:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f405c>
1c00a820:	c354                	sw	a3,4(a4)
1c00a822:	b7e5                	j	1c00a80a <__rt_io_uart_flush.constprop.10+0xaa>

1c00a824 <memset>:
1c00a824:	962a                	add	a2,a2,a0
1c00a826:	87aa                	mv	a5,a0
1c00a828:	00c79363          	bne	a5,a2,1c00a82e <memset+0xa>
1c00a82c:	8082                	ret
1c00a82e:	0785                	addi	a5,a5,1
1c00a830:	feb78fa3          	sb	a1,-1(a5)
1c00a834:	bfd5                	j	1c00a828 <memset+0x4>

1c00a836 <memcpy>:
1c00a836:	962a                	add	a2,a2,a0
1c00a838:	87aa                	mv	a5,a0
1c00a83a:	00c79363          	bne	a5,a2,1c00a840 <memcpy+0xa>
1c00a83e:	8082                	ret
1c00a840:	0585                	addi	a1,a1,1
1c00a842:	fff5c703          	lbu	a4,-1(a1)
1c00a846:	0785                	addi	a5,a5,1
1c00a848:	fee78fa3          	sb	a4,-1(a5)
1c00a84c:	b7fd                	j	1c00a83a <memcpy+0x4>

1c00a84e <memmove>:
1c00a84e:	40b507b3          	sub	a5,a0,a1
1c00a852:	00c7e763          	bltu	a5,a2,1c00a860 <memmove+0x12>
1c00a856:	962e                	add	a2,a2,a1
1c00a858:	87aa                	mv	a5,a0
1c00a85a:	00c59e63          	bne	a1,a2,1c00a876 <memmove+0x28>
1c00a85e:	8082                	ret
1c00a860:	167d                	addi	a2,a2,-1
1c00a862:	00c587b3          	add	a5,a1,a2
1c00a866:	0007c703          	lbu	a4,0(a5)
1c00a86a:	00c507b3          	add	a5,a0,a2
1c00a86e:	00e78023          	sb	a4,0(a5)
1c00a872:	f67d                	bnez	a2,1c00a860 <memmove+0x12>
1c00a874:	8082                	ret
1c00a876:	0005c703          	lbu	a4,0(a1)
1c00a87a:	0785                	addi	a5,a5,1
1c00a87c:	0585                	addi	a1,a1,1
1c00a87e:	fee78fa3          	sb	a4,-1(a5)
1c00a882:	bfe1                	j	1c00a85a <memmove+0xc>

1c00a884 <strchr>:
1c00a884:	0ff5f593          	andi	a1,a1,255
1c00a888:	00054783          	lbu	a5,0(a0)
1c00a88c:	00b78563          	beq	a5,a1,1c00a896 <strchr+0x12>
1c00a890:	e781                	bnez	a5,1c00a898 <strchr+0x14>
1c00a892:	c191                	beqz	a1,1c00a896 <strchr+0x12>
1c00a894:	4501                	li	a0,0
1c00a896:	8082                	ret
1c00a898:	0505                	addi	a0,a0,1
1c00a89a:	b7fd                	j	1c00a888 <strchr+0x4>

1c00a89c <__rt_putc_debug_bridge>:
1c00a89c:	1141                	addi	sp,sp,-16
1c00a89e:	c422                	sw	s0,8(sp)
1c00a8a0:	1c001437          	lui	s0,0x1c001
1c00a8a4:	c226                	sw	s1,4(sp)
1c00a8a6:	c606                	sw	ra,12(sp)
1c00a8a8:	84aa                	mv	s1,a0
1c00a8aa:	01c40413          	addi	s0,s0,28 # 1c00101c <__hal_debug_struct>
1c00a8ae:	485c                	lw	a5,20(s0)
1c00a8b0:	c791                	beqz	a5,1c00a8bc <__rt_putc_debug_bridge+0x20>
1c00a8b2:	06400513          	li	a0,100
1c00a8b6:	907ff0ef          	jal	ra,1c00a1bc <rt_time_wait_us>
1c00a8ba:	bfd5                	j	1c00a8ae <__rt_putc_debug_bridge+0x12>
1c00a8bc:	4c1c                	lw	a5,24(s0)
1c00a8be:	00178713          	addi	a4,a5,1
1c00a8c2:	97a2                	add	a5,a5,s0
1c00a8c4:	00978e23          	sb	s1,28(a5)
1c00a8c8:	cc18                	sw	a4,24(s0)
1c00a8ca:	4c14                	lw	a3,24(s0)
1c00a8cc:	08000793          	li	a5,128
1c00a8d0:	00f68563          	beq	a3,a5,1c00a8da <__rt_putc_debug_bridge+0x3e>
1c00a8d4:	47a9                	li	a5,10
1c00a8d6:	00f49663          	bne	s1,a5,1c00a8e2 <__rt_putc_debug_bridge+0x46>
1c00a8da:	c701                	beqz	a4,1c00a8e2 <__rt_putc_debug_bridge+0x46>
1c00a8dc:	c858                	sw	a4,20(s0)
1c00a8de:	00042c23          	sw	zero,24(s0)
1c00a8e2:	4c1c                	lw	a5,24(s0)
1c00a8e4:	e799                	bnez	a5,1c00a8f2 <__rt_putc_debug_bridge+0x56>
1c00a8e6:	4422                	lw	s0,8(sp)
1c00a8e8:	40b2                	lw	ra,12(sp)
1c00a8ea:	4492                	lw	s1,4(sp)
1c00a8ec:	0141                	addi	sp,sp,16
1c00a8ee:	946ff06f          	j	1c009a34 <__rt_bridge_printf_flush>
1c00a8f2:	40b2                	lw	ra,12(sp)
1c00a8f4:	4422                	lw	s0,8(sp)
1c00a8f6:	4492                	lw	s1,4(sp)
1c00a8f8:	0141                	addi	sp,sp,16
1c00a8fa:	8082                	ret

1c00a8fc <__rt_putc_uart>:
1c00a8fc:	1101                	addi	sp,sp,-32
1c00a8fe:	c62a                	sw	a0,12(sp)
1c00a900:	ce06                	sw	ra,28(sp)
1c00a902:	336d                	jal	1c00a6ac <__rt_io_uart_wait_pending>
1c00a904:	1c0017b7          	lui	a5,0x1c001
1c00a908:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00a90c:	4f94                	lw	a3,24(a5)
1c00a90e:	4532                	lw	a0,12(sp)
1c00a910:	00168713          	addi	a4,a3,1
1c00a914:	cf98                	sw	a4,24(a5)
1c00a916:	97b6                	add	a5,a5,a3
1c00a918:	00a78e23          	sb	a0,28(a5)
1c00a91c:	08000793          	li	a5,128
1c00a920:	00f70563          	beq	a4,a5,1c00a92a <__rt_putc_uart+0x2e>
1c00a924:	47a9                	li	a5,10
1c00a926:	00f51563          	bne	a0,a5,1c00a930 <__rt_putc_uart+0x34>
1c00a92a:	40f2                	lw	ra,28(sp)
1c00a92c:	6105                	addi	sp,sp,32
1c00a92e:	bd0d                	j	1c00a760 <__rt_io_uart_flush.constprop.10>
1c00a930:	40f2                	lw	ra,28(sp)
1c00a932:	6105                	addi	sp,sp,32
1c00a934:	8082                	ret

1c00a936 <tfp_putc.isra.8>:
1c00a936:	1c0017b7          	lui	a5,0x1c001
1c00a93a:	1e87a783          	lw	a5,488(a5) # 1c0011e8 <_rt_io_uart>
1c00a93e:	c391                	beqz	a5,1c00a942 <tfp_putc.isra.8+0xc>
1c00a940:	bf75                	j	1c00a8fc <__rt_putc_uart>
1c00a942:	1c0017b7          	lui	a5,0x1c001
1c00a946:	02c7a783          	lw	a5,44(a5) # 1c00102c <__hal_debug_struct+0x10>
1c00a94a:	c395                	beqz	a5,1c00a96e <tfp_putc.isra.8+0x38>
1c00a94c:	6689                	lui	a3,0x2
1c00a94e:	f14027f3          	csrr	a5,mhartid
1c00a952:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a956:	00379713          	slli	a4,a5,0x3
1c00a95a:	078a                	slli	a5,a5,0x2
1c00a95c:	0ff77713          	andi	a4,a4,255
1c00a960:	8ff5                	and	a5,a5,a3
1c00a962:	97ba                	add	a5,a5,a4
1c00a964:	1a10f737          	lui	a4,0x1a10f
1c00a968:	97ba                	add	a5,a5,a4
1c00a96a:	c388                	sw	a0,0(a5)
1c00a96c:	8082                	ret
1c00a96e:	b73d                	j	1c00a89c <__rt_putc_debug_bridge>

1c00a970 <puts>:
1c00a970:	1141                	addi	sp,sp,-16
1c00a972:	c422                	sw	s0,8(sp)
1c00a974:	c606                	sw	ra,12(sp)
1c00a976:	842a                	mv	s0,a0
1c00a978:	3171                	jal	1c00a604 <__rt_io_lock>
1c00a97a:	00044503          	lbu	a0,0(s0)
1c00a97e:	c501                	beqz	a0,1c00a986 <puts+0x16>
1c00a980:	3f5d                	jal	1c00a936 <tfp_putc.isra.8>
1c00a982:	0405                	addi	s0,s0,1
1c00a984:	bfdd                	j	1c00a97a <puts+0xa>
1c00a986:	4529                	li	a0,10
1c00a988:	377d                	jal	1c00a936 <tfp_putc.isra.8>
1c00a98a:	31f9                	jal	1c00a658 <__rt_io_unlock>
1c00a98c:	40b2                	lw	ra,12(sp)
1c00a98e:	4422                	lw	s0,8(sp)
1c00a990:	4501                	li	a0,0
1c00a992:	0141                	addi	sp,sp,16
1c00a994:	8082                	ret

1c00a996 <fputc_locked>:
1c00a996:	1141                	addi	sp,sp,-16
1c00a998:	c422                	sw	s0,8(sp)
1c00a99a:	842a                	mv	s0,a0
1c00a99c:	0ff57513          	andi	a0,a0,255
1c00a9a0:	c606                	sw	ra,12(sp)
1c00a9a2:	3f51                	jal	1c00a936 <tfp_putc.isra.8>
1c00a9a4:	8522                	mv	a0,s0
1c00a9a6:	40b2                	lw	ra,12(sp)
1c00a9a8:	4422                	lw	s0,8(sp)
1c00a9aa:	0141                	addi	sp,sp,16
1c00a9ac:	8082                	ret

1c00a9ae <_prf_locked>:
1c00a9ae:	1101                	addi	sp,sp,-32
1c00a9b0:	ce06                	sw	ra,28(sp)
1c00a9b2:	c02a                	sw	a0,0(sp)
1c00a9b4:	c62e                	sw	a1,12(sp)
1c00a9b6:	c432                	sw	a2,8(sp)
1c00a9b8:	c236                	sw	a3,4(sp)
1c00a9ba:	31a9                	jal	1c00a604 <__rt_io_lock>
1c00a9bc:	4692                	lw	a3,4(sp)
1c00a9be:	4622                	lw	a2,8(sp)
1c00a9c0:	45b2                	lw	a1,12(sp)
1c00a9c2:	4502                	lw	a0,0(sp)
1c00a9c4:	2ae9                	jal	1c00ab9e <_prf>
1c00a9c6:	c02a                	sw	a0,0(sp)
1c00a9c8:	3941                	jal	1c00a658 <__rt_io_unlock>
1c00a9ca:	40f2                	lw	ra,28(sp)
1c00a9cc:	4502                	lw	a0,0(sp)
1c00a9ce:	6105                	addi	sp,sp,32
1c00a9d0:	8082                	ret

1c00a9d2 <exit>:
1c00a9d2:	1141                	addi	sp,sp,-16
1c00a9d4:	c606                	sw	ra,12(sp)
1c00a9d6:	c422                	sw	s0,8(sp)
1c00a9d8:	842a                	mv	s0,a0
1c00a9da:	85aff0ef          	jal	ra,1c009a34 <__rt_bridge_printf_flush>
1c00a9de:	80000537          	lui	a0,0x80000
1c00a9e2:	1c0017b7          	lui	a5,0x1c001
1c00a9e6:	8c49                	or	s0,s0,a0
1c00a9e8:	01c78793          	addi	a5,a5,28 # 1c00101c <__hal_debug_struct>
1c00a9ec:	c7c0                	sw	s0,12(a5)
1c00a9ee:	816ff0ef          	jal	ra,1c009a04 <__rt_bridge_send_notif>
1c00a9f2:	1a1047b7          	lui	a5,0x1a104
1c00a9f6:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa104080>
1c00a9fa:	a001                	j	1c00a9fa <exit+0x28>

1c00a9fc <abort>:
1c00a9fc:	1141                	addi	sp,sp,-16
1c00a9fe:	557d                	li	a0,-1
1c00aa00:	c606                	sw	ra,12(sp)
1c00aa02:	3fc1                	jal	1c00a9d2 <exit>

1c00aa04 <__rt_io_init>:
1c00aa04:	1c0017b7          	lui	a5,0x1c001
1c00aa08:	ffc78793          	addi	a5,a5,-4 # 1c000ffc <__rt_io_fc_lock>
1c00aa0c:	0007a223          	sw	zero,4(a5)
1c00aa10:	0007a023          	sw	zero,0(a5)
1c00aa14:	0007a623          	sw	zero,12(a5)
1c00aa18:	1c0017b7          	lui	a5,0x1c001
1c00aa1c:	1e07a423          	sw	zero,488(a5) # 1c0011e8 <_rt_io_uart>
1c00aa20:	1c0017b7          	lui	a5,0x1c001
1c00aa24:	1e07a023          	sw	zero,480(a5) # 1c0011e0 <__rt_io_event_current>
1c00aa28:	1c0017b7          	lui	a5,0x1c001
1c00aa2c:	1ec7a703          	lw	a4,492(a5) # 1c0011ec <__rt_iodev>
1c00aa30:	4785                	li	a5,1
1c00aa32:	02f71e63          	bne	a4,a5,1c00aa6e <__rt_io_init+0x6a>
1c00aa36:	1c00a5b7          	lui	a1,0x1c00a
1c00aa3a:	1141                	addi	sp,sp,-16
1c00aa3c:	4601                	li	a2,0
1c00aa3e:	58258593          	addi	a1,a1,1410 # 1c00a582 <__rt_io_start>
1c00aa42:	4501                	li	a0,0
1c00aa44:	c606                	sw	ra,12(sp)
1c00aa46:	d07fe0ef          	jal	ra,1c00974c <__rt_cbsys_add>
1c00aa4a:	1c00a5b7          	lui	a1,0x1c00a
1c00aa4e:	73a58593          	addi	a1,a1,1850 # 1c00a73a <__rt_io_stop>
1c00aa52:	4601                	li	a2,0
1c00aa54:	4505                	li	a0,1
1c00aa56:	cf7fe0ef          	jal	ra,1c00974c <__rt_cbsys_add>
1c00aa5a:	40b2                	lw	ra,12(sp)
1c00aa5c:	1c0017b7          	lui	a5,0x1c001
1c00aa60:	1e07a223          	sw	zero,484(a5) # 1c0011e4 <__rt_io_pending_flush>
1c00aa64:	4585                	li	a1,1
1c00aa66:	4501                	li	a0,0
1c00aa68:	0141                	addi	sp,sp,16
1c00aa6a:	9b2ff06f          	j	1c009c1c <rt_event_alloc>
1c00aa6e:	8082                	ret

1c00aa70 <printf>:
1c00aa70:	7139                	addi	sp,sp,-64
1c00aa72:	d432                	sw	a2,40(sp)
1c00aa74:	862a                	mv	a2,a0
1c00aa76:	1c00b537          	lui	a0,0x1c00b
1c00aa7a:	d22e                	sw	a1,36(sp)
1c00aa7c:	d636                	sw	a3,44(sp)
1c00aa7e:	4589                	li	a1,2
1c00aa80:	1054                	addi	a3,sp,36
1c00aa82:	99650513          	addi	a0,a0,-1642 # 1c00a996 <fputc_locked>
1c00aa86:	ce06                	sw	ra,28(sp)
1c00aa88:	d83a                	sw	a4,48(sp)
1c00aa8a:	da3e                	sw	a5,52(sp)
1c00aa8c:	dc42                	sw	a6,56(sp)
1c00aa8e:	de46                	sw	a7,60(sp)
1c00aa90:	c636                	sw	a3,12(sp)
1c00aa92:	3f31                	jal	1c00a9ae <_prf_locked>
1c00aa94:	40f2                	lw	ra,28(sp)
1c00aa96:	6121                	addi	sp,sp,64
1c00aa98:	8082                	ret

1c00aa9a <_to_x>:
1c00aa9a:	872a                	mv	a4,a0
1c00aa9c:	87aa                	mv	a5,a0
1c00aa9e:	4325                	li	t1,9
1c00aaa0:	02c5f8b3          	remu	a7,a1,a2
1c00aaa4:	02700513          	li	a0,39
1c00aaa8:	02c5d5b3          	divu	a1,a1,a2
1c00aaac:	0ff8f813          	andi	a6,a7,255
1c00aab0:	01136363          	bltu	t1,a7,1c00aab6 <_to_x+0x1c>
1c00aab4:	4501                	li	a0,0
1c00aab6:	03080813          	addi	a6,a6,48
1c00aaba:	0785                	addi	a5,a5,1
1c00aabc:	9542                	add	a0,a0,a6
1c00aabe:	fea78fa3          	sb	a0,-1(a5)
1c00aac2:	fdf9                	bnez	a1,1c00aaa0 <_to_x+0x6>
1c00aac4:	03000613          	li	a2,48
1c00aac8:	40e78533          	sub	a0,a5,a4
1c00aacc:	00d54863          	blt	a0,a3,1c00aadc <_to_x+0x42>
1c00aad0:	00078023          	sb	zero,0(a5)
1c00aad4:	17fd                	addi	a5,a5,-1
1c00aad6:	00f76763          	bltu	a4,a5,1c00aae4 <_to_x+0x4a>
1c00aada:	8082                	ret
1c00aadc:	0785                	addi	a5,a5,1
1c00aade:	fec78fa3          	sb	a2,-1(a5)
1c00aae2:	b7dd                	j	1c00aac8 <_to_x+0x2e>
1c00aae4:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10efe0>
1c00aae8:	0007c683          	lbu	a3,0(a5)
1c00aaec:	0705                	addi	a4,a4,1
1c00aaee:	00c78023          	sb	a2,0(a5)
1c00aaf2:	fed70fa3          	sb	a3,-1(a4)
1c00aaf6:	17fd                	addi	a5,a5,-1
1c00aaf8:	bff9                	j	1c00aad6 <_to_x+0x3c>

1c00aafa <_rlrshift>:
1c00aafa:	411c                	lw	a5,0(a0)
1c00aafc:	4154                	lw	a3,4(a0)
1c00aafe:	0017f713          	andi	a4,a5,1
1c00ab02:	01f69613          	slli	a2,a3,0x1f
1c00ab06:	8385                	srli	a5,a5,0x1
1c00ab08:	8fd1                	or	a5,a5,a2
1c00ab0a:	97ba                	add	a5,a5,a4
1c00ab0c:	8285                	srli	a3,a3,0x1
1c00ab0e:	00e7b733          	sltu	a4,a5,a4
1c00ab12:	9736                	add	a4,a4,a3
1c00ab14:	c11c                	sw	a5,0(a0)
1c00ab16:	c158                	sw	a4,4(a0)
1c00ab18:	8082                	ret

1c00ab1a <_ldiv5>:
1c00ab1a:	4118                	lw	a4,0(a0)
1c00ab1c:	4154                	lw	a3,4(a0)
1c00ab1e:	4615                	li	a2,5
1c00ab20:	00270793          	addi	a5,a4,2
1c00ab24:	00e7b733          	sltu	a4,a5,a4
1c00ab28:	9736                	add	a4,a4,a3
1c00ab2a:	02c755b3          	divu	a1,a4,a2
1c00ab2e:	02b606b3          	mul	a3,a2,a1
1c00ab32:	8f15                	sub	a4,a4,a3
1c00ab34:	01d71693          	slli	a3,a4,0x1d
1c00ab38:	0037d713          	srli	a4,a5,0x3
1c00ab3c:	8f55                	or	a4,a4,a3
1c00ab3e:	02c75733          	divu	a4,a4,a2
1c00ab42:	01d75693          	srli	a3,a4,0x1d
1c00ab46:	070e                	slli	a4,a4,0x3
1c00ab48:	95b6                	add	a1,a1,a3
1c00ab4a:	02e606b3          	mul	a3,a2,a4
1c00ab4e:	8f95                	sub	a5,a5,a3
1c00ab50:	02c7d7b3          	divu	a5,a5,a2
1c00ab54:	973e                	add	a4,a4,a5
1c00ab56:	00f737b3          	sltu	a5,a4,a5
1c00ab5a:	97ae                	add	a5,a5,a1
1c00ab5c:	c118                	sw	a4,0(a0)
1c00ab5e:	c15c                	sw	a5,4(a0)
1c00ab60:	8082                	ret

1c00ab62 <_get_digit>:
1c00ab62:	419c                	lw	a5,0(a1)
1c00ab64:	03000713          	li	a4,48
1c00ab68:	02f05863          	blez	a5,1c00ab98 <_get_digit+0x36>
1c00ab6c:	17fd                	addi	a5,a5,-1
1c00ab6e:	4114                	lw	a3,0(a0)
1c00ab70:	c19c                	sw	a5,0(a1)
1c00ab72:	415c                	lw	a5,4(a0)
1c00ab74:	4729                	li	a4,10
1c00ab76:	02d70633          	mul	a2,a4,a3
1c00ab7a:	02f707b3          	mul	a5,a4,a5
1c00ab7e:	c110                	sw	a2,0(a0)
1c00ab80:	02d73733          	mulhu	a4,a4,a3
1c00ab84:	100006b7          	lui	a3,0x10000
1c00ab88:	16fd                	addi	a3,a3,-1
1c00ab8a:	97ba                	add	a5,a5,a4
1c00ab8c:	01c7d713          	srli	a4,a5,0x1c
1c00ab90:	8ff5                	and	a5,a5,a3
1c00ab92:	03070713          	addi	a4,a4,48
1c00ab96:	c15c                	sw	a5,4(a0)
1c00ab98:	0ff77513          	andi	a0,a4,255
1c00ab9c:	8082                	ret

1c00ab9e <_prf>:
1c00ab9e:	714d                	addi	sp,sp,-336
1c00aba0:	14912223          	sw	s1,324(sp)
1c00aba4:	13312e23          	sw	s3,316(sp)
1c00aba8:	13812423          	sw	s8,296(sp)
1c00abac:	14112623          	sw	ra,332(sp)
1c00abb0:	14812423          	sw	s0,328(sp)
1c00abb4:	15212023          	sw	s2,320(sp)
1c00abb8:	13412c23          	sw	s4,312(sp)
1c00abbc:	13512a23          	sw	s5,308(sp)
1c00abc0:	13612823          	sw	s6,304(sp)
1c00abc4:	13712623          	sw	s7,300(sp)
1c00abc8:	13912223          	sw	s9,292(sp)
1c00abcc:	13a12023          	sw	s10,288(sp)
1c00abd0:	11b12e23          	sw	s11,284(sp)
1c00abd4:	cc2a                	sw	a0,24(sp)
1c00abd6:	ce2e                	sw	a1,28(sp)
1c00abd8:	84b2                	mv	s1,a2
1c00abda:	8c36                	mv	s8,a3
1c00abdc:	4981                	li	s3,0
1c00abde:	0004c503          	lbu	a0,0(s1)
1c00abe2:	00148b93          	addi	s7,s1,1
1c00abe6:	cd01                	beqz	a0,1c00abfe <_prf+0x60>
1c00abe8:	02500793          	li	a5,37
1c00abec:	14f50a63          	beq	a0,a5,1c00ad40 <_prf+0x1a2>
1c00abf0:	45f2                	lw	a1,28(sp)
1c00abf2:	4762                	lw	a4,24(sp)
1c00abf4:	9702                	jalr	a4
1c00abf6:	57fd                	li	a5,-1
1c00abf8:	04f51063          	bne	a0,a5,1c00ac38 <_prf+0x9a>
1c00abfc:	59fd                	li	s3,-1
1c00abfe:	14c12083          	lw	ra,332(sp)
1c00ac02:	14812403          	lw	s0,328(sp)
1c00ac06:	854e                	mv	a0,s3
1c00ac08:	14412483          	lw	s1,324(sp)
1c00ac0c:	14012903          	lw	s2,320(sp)
1c00ac10:	13c12983          	lw	s3,316(sp)
1c00ac14:	13812a03          	lw	s4,312(sp)
1c00ac18:	13412a83          	lw	s5,308(sp)
1c00ac1c:	13012b03          	lw	s6,304(sp)
1c00ac20:	12c12b83          	lw	s7,300(sp)
1c00ac24:	12812c03          	lw	s8,296(sp)
1c00ac28:	12412c83          	lw	s9,292(sp)
1c00ac2c:	12012d03          	lw	s10,288(sp)
1c00ac30:	11c12d83          	lw	s11,284(sp)
1c00ac34:	6171                	addi	sp,sp,336
1c00ac36:	8082                	ret
1c00ac38:	0985                	addi	s3,s3,1
1c00ac3a:	8a62                	mv	s4,s8
1c00ac3c:	84de                	mv	s1,s7
1c00ac3e:	8c52                	mv	s8,s4
1c00ac40:	bf79                	j	1c00abde <_prf+0x40>
1c00ac42:	0f2a8663          	beq	s5,s2,1c00ad2e <_prf+0x190>
1c00ac46:	0d596963          	bltu	s2,s5,1c00ad18 <_prf+0x17a>
1c00ac4a:	fa0a8ae3          	beqz	s5,1c00abfe <_prf+0x60>
1c00ac4e:	0dba8e63          	beq	s5,s11,1c00ad2a <_prf+0x18c>
1c00ac52:	8ba6                	mv	s7,s1
1c00ac54:	001b8493          	addi	s1,s7,1
1c00ac58:	fff4ca83          	lbu	s5,-1(s1)
1c00ac5c:	1c0007b7          	lui	a5,0x1c000
1c00ac60:	6a478513          	addi	a0,a5,1700 # 1c0006a4 <__DTOR_END__+0x3b8>
1c00ac64:	85d6                	mv	a1,s5
1c00ac66:	c1fff0ef          	jal	ra,1c00a884 <strchr>
1c00ac6a:	fd61                	bnez	a0,1c00ac42 <_prf+0xa4>
1c00ac6c:	02a00693          	li	a3,42
1c00ac70:	0eda9a63          	bne	s5,a3,1c00ad64 <_prf+0x1c6>
1c00ac74:	000c2903          	lw	s2,0(s8)
1c00ac78:	004c0693          	addi	a3,s8,4
1c00ac7c:	00095663          	bgez	s2,1c00ac88 <_prf+0xea>
1c00ac80:	4705                	li	a4,1
1c00ac82:	41200933          	neg	s2,s2
1c00ac86:	c63a                	sw	a4,12(sp)
1c00ac88:	0004ca83          	lbu	s5,0(s1)
1c00ac8c:	8c36                	mv	s8,a3
1c00ac8e:	002b8493          	addi	s1,s7,2
1c00ac92:	0c800713          	li	a4,200
1c00ac96:	01277463          	bleu	s2,a4,1c00ac9e <_prf+0x100>
1c00ac9a:	0c800913          	li	s2,200
1c00ac9e:	02e00693          	li	a3,46
1c00aca2:	5d7d                	li	s10,-1
1c00aca4:	02da9463          	bne	s5,a3,1c00accc <_prf+0x12e>
1c00aca8:	0004c703          	lbu	a4,0(s1)
1c00acac:	02a00793          	li	a5,42
1c00acb0:	10f71063          	bne	a4,a5,1c00adb0 <_prf+0x212>
1c00acb4:	000c2d03          	lw	s10,0(s8)
1c00acb8:	0485                	addi	s1,s1,1
1c00acba:	0c11                	addi	s8,s8,4
1c00acbc:	0c800793          	li	a5,200
1c00acc0:	01a7d363          	ble	s10,a5,1c00acc6 <_prf+0x128>
1c00acc4:	5d7d                	li	s10,-1
1c00acc6:	0004ca83          	lbu	s5,0(s1)
1c00acca:	0485                	addi	s1,s1,1
1c00accc:	1c0007b7          	lui	a5,0x1c000
1c00acd0:	85d6                	mv	a1,s5
1c00acd2:	6ac78513          	addi	a0,a5,1708 # 1c0006ac <__DTOR_END__+0x3c0>
1c00acd6:	bafff0ef          	jal	ra,1c00a884 <strchr>
1c00acda:	c501                	beqz	a0,1c00ace2 <_prf+0x144>
1c00acdc:	0004ca83          	lbu	s5,0(s1)
1c00ace0:	0485                	addi	s1,s1,1
1c00ace2:	06700693          	li	a3,103
1c00ace6:	1356c263          	blt	a3,s5,1c00ae0a <_prf+0x26c>
1c00acea:	06500693          	li	a3,101
1c00acee:	1edadd63          	ble	a3,s5,1c00aee8 <_prf+0x34a>
1c00acf2:	04700693          	li	a3,71
1c00acf6:	0d56c163          	blt	a3,s5,1c00adb8 <_prf+0x21a>
1c00acfa:	04500693          	li	a3,69
1c00acfe:	1edad563          	ble	a3,s5,1c00aee8 <_prf+0x34a>
1c00ad02:	ee0a8ee3          	beqz	s5,1c00abfe <_prf+0x60>
1c00ad06:	02500713          	li	a4,37
1c00ad0a:	68ea8263          	beq	s5,a4,1c00b38e <_prf+0x7f0>
1c00ad0e:	0c800713          	li	a4,200
1c00ad12:	69575763          	ble	s5,a4,1c00b3a0 <_prf+0x802>
1c00ad16:	b5dd                	j	1c00abfc <_prf+0x5e>
1c00ad18:	034a8163          	beq	s5,s4,1c00ad3a <_prf+0x19c>
1c00ad1c:	016a8b63          	beq	s5,s6,1c00ad32 <_prf+0x194>
1c00ad20:	f3aa99e3          	bne	s5,s10,1c00ac52 <_prf+0xb4>
1c00ad24:	4785                	li	a5,1
1c00ad26:	ca3e                	sw	a5,20(sp)
1c00ad28:	b72d                	j	1c00ac52 <_prf+0xb4>
1c00ad2a:	4405                	li	s0,1
1c00ad2c:	b71d                	j	1c00ac52 <_prf+0xb4>
1c00ad2e:	4c85                	li	s9,1
1c00ad30:	b70d                	j	1c00ac52 <_prf+0xb4>
1c00ad32:	03000713          	li	a4,48
1c00ad36:	c83a                	sw	a4,16(sp)
1c00ad38:	bf29                	j	1c00ac52 <_prf+0xb4>
1c00ad3a:	4785                	li	a5,1
1c00ad3c:	c63e                	sw	a5,12(sp)
1c00ad3e:	bf11                	j	1c00ac52 <_prf+0xb4>
1c00ad40:	02000713          	li	a4,32
1c00ad44:	c83a                	sw	a4,16(sp)
1c00ad46:	4401                	li	s0,0
1c00ad48:	ca02                	sw	zero,20(sp)
1c00ad4a:	c602                	sw	zero,12(sp)
1c00ad4c:	4c81                	li	s9,0
1c00ad4e:	02300913          	li	s2,35
1c00ad52:	02d00a13          	li	s4,45
1c00ad56:	03000b13          	li	s6,48
1c00ad5a:	02b00d13          	li	s10,43
1c00ad5e:	02000d93          	li	s11,32
1c00ad62:	bdcd                	j	1c00ac54 <_prf+0xb6>
1c00ad64:	fd0a8693          	addi	a3,s5,-48
1c00ad68:	4625                	li	a2,9
1c00ad6a:	4901                	li	s2,0
1c00ad6c:	45a9                	li	a1,10
1c00ad6e:	f2d662e3          	bltu	a2,a3,1c00ac92 <_prf+0xf4>
1c00ad72:	000bc683          	lbu	a3,0(s7)
1c00ad76:	001b8493          	addi	s1,s7,1
1c00ad7a:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xffefff0>
1c00ad7e:	8ab6                	mv	s5,a3
1c00ad80:	f0e669e3          	bltu	a2,a4,1c00ac92 <_prf+0xf4>
1c00ad84:	02b90933          	mul	s2,s2,a1
1c00ad88:	8ba6                	mv	s7,s1
1c00ad8a:	9936                	add	s2,s2,a3
1c00ad8c:	fd090913          	addi	s2,s2,-48
1c00ad90:	b7cd                	j	1c00ad72 <_prf+0x1d4>
1c00ad92:	02ad0733          	mul	a4,s10,a0
1c00ad96:	84ae                	mv	s1,a1
1c00ad98:	973e                	add	a4,a4,a5
1c00ad9a:	fd070d13          	addi	s10,a4,-48
1c00ad9e:	0004c783          	lbu	a5,0(s1)
1c00ada2:	00148593          	addi	a1,s1,1
1c00ada6:	fd078613          	addi	a2,a5,-48
1c00adaa:	fec6f4e3          	bleu	a2,a3,1c00ad92 <_prf+0x1f4>
1c00adae:	b739                	j	1c00acbc <_prf+0x11e>
1c00adb0:	4d01                	li	s10,0
1c00adb2:	46a5                	li	a3,9
1c00adb4:	4529                	li	a0,10
1c00adb6:	b7e5                	j	1c00ad9e <_prf+0x200>
1c00adb8:	06300693          	li	a3,99
1c00adbc:	0cda8b63          	beq	s5,a3,1c00ae92 <_prf+0x2f4>
1c00adc0:	0756c563          	blt	a3,s5,1c00ae2a <_prf+0x28c>
1c00adc4:	05800693          	li	a3,88
1c00adc8:	f4da93e3          	bne	s5,a3,1c00ad0e <_prf+0x170>
1c00adcc:	04410b93          	addi	s7,sp,68
1c00add0:	004c0a13          	addi	s4,s8,4
1c00add4:	000c2583          	lw	a1,0(s8)
1c00add8:	845e                	mv	s0,s7
1c00adda:	000c8963          	beqz	s9,1c00adec <_prf+0x24e>
1c00adde:	76e1                	lui	a3,0xffff8
1c00ade0:	8306c693          	xori	a3,a3,-2000
1c00ade4:	04d11223          	sh	a3,68(sp)
1c00ade8:	04610413          	addi	s0,sp,70
1c00adec:	86ea                	mv	a3,s10
1c00adee:	4641                	li	a2,16
1c00adf0:	8522                	mv	a0,s0
1c00adf2:	3165                	jal	1c00aa9a <_to_x>
1c00adf4:	05800693          	li	a3,88
1c00adf8:	58da8863          	beq	s5,a3,1c00b388 <_prf+0x7ea>
1c00adfc:	41740433          	sub	s0,s0,s7
1c00ae00:	9522                	add	a0,a0,s0
1c00ae02:	01903433          	snez	s0,s9
1c00ae06:	0406                	slli	s0,s0,0x1
1c00ae08:	a8c9                	j	1c00aeda <_prf+0x33c>
1c00ae0a:	07000693          	li	a3,112
1c00ae0e:	50da8163          	beq	s5,a3,1c00b310 <_prf+0x772>
1c00ae12:	0556c163          	blt	a3,s5,1c00ae54 <_prf+0x2b6>
1c00ae16:	06e00693          	li	a3,110
1c00ae1a:	46da8b63          	beq	s5,a3,1c00b290 <_prf+0x6f2>
1c00ae1e:	4956c063          	blt	a3,s5,1c00b29e <_prf+0x700>
1c00ae22:	06900693          	li	a3,105
1c00ae26:	eeda94e3          	bne	s5,a3,1c00ad0e <_prf+0x170>
1c00ae2a:	000c2a83          	lw	s5,0(s8)
1c00ae2e:	004c0a13          	addi	s4,s8,4
1c00ae32:	04410b13          	addi	s6,sp,68
1c00ae36:	060ad963          	bgez	s5,1c00aea8 <_prf+0x30a>
1c00ae3a:	02d00693          	li	a3,45
1c00ae3e:	04d10223          	sb	a3,68(sp)
1c00ae42:	800006b7          	lui	a3,0x80000
1c00ae46:	415005b3          	neg	a1,s5
1c00ae4a:	06da9963          	bne	s5,a3,1c00aebc <_prf+0x31e>
1c00ae4e:	800005b7          	lui	a1,0x80000
1c00ae52:	a0ad                	j	1c00aebc <_prf+0x31e>
1c00ae54:	07500693          	li	a3,117
1c00ae58:	50da8063          	beq	s5,a3,1c00b358 <_prf+0x7ba>
1c00ae5c:	07800693          	li	a3,120
1c00ae60:	f6da86e3          	beq	s5,a3,1c00adcc <_prf+0x22e>
1c00ae64:	07300693          	li	a3,115
1c00ae68:	eada93e3          	bne	s5,a3,1c00ad0e <_prf+0x170>
1c00ae6c:	000c2583          	lw	a1,0(s8)
1c00ae70:	004c0a13          	addi	s4,s8,4
1c00ae74:	4c81                	li	s9,0
1c00ae76:	0c800793          	li	a5,200
1c00ae7a:	019586b3          	add	a3,a1,s9
1c00ae7e:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00ae82:	4a068f63          	beqz	a3,1c00b340 <_prf+0x7a2>
1c00ae86:	0c85                	addi	s9,s9,1
1c00ae88:	fefc99e3          	bne	s9,a5,1c00ae7a <_prf+0x2dc>
1c00ae8c:	4a0d5c63          	bgez	s10,1c00b344 <_prf+0x7a6>
1c00ae90:	a97d                	j	1c00b34e <_prf+0x7b0>
1c00ae92:	000c2783          	lw	a5,0(s8)
1c00ae96:	004c0a13          	addi	s4,s8,4
1c00ae9a:	040102a3          	sb	zero,69(sp)
1c00ae9e:	04f10223          	sb	a5,68(sp)
1c00aea2:	4c85                	li	s9,1
1c00aea4:	4401                	li	s0,0
1c00aea6:	a105                	j	1c00b2c6 <_prf+0x728>
1c00aea8:	4752                	lw	a4,20(sp)
1c00aeaa:	02b00693          	li	a3,43
1c00aeae:	e701                	bnez	a4,1c00aeb6 <_prf+0x318>
1c00aeb0:	c41d                	beqz	s0,1c00aede <_prf+0x340>
1c00aeb2:	02000693          	li	a3,32
1c00aeb6:	04d10223          	sb	a3,68(sp)
1c00aeba:	85d6                	mv	a1,s5
1c00aebc:	04510c13          	addi	s8,sp,69
1c00aec0:	86ea                	mv	a3,s10
1c00aec2:	4629                	li	a2,10
1c00aec4:	8562                	mv	a0,s8
1c00aec6:	bd5ff0ef          	jal	ra,1c00aa9a <_to_x>
1c00aeca:	47d2                	lw	a5,20(sp)
1c00aecc:	9562                	add	a0,a0,s8
1c00aece:	41650533          	sub	a0,a0,s6
1c00aed2:	eb89                	bnez	a5,1c00aee4 <_prf+0x346>
1c00aed4:	e019                	bnez	s0,1c00aeda <_prf+0x33c>
1c00aed6:	01fad413          	srli	s0,s5,0x1f
1c00aeda:	57fd                	li	a5,-1
1c00aedc:	a9a1                	j	1c00b334 <_prf+0x796>
1c00aede:	85d6                	mv	a1,s5
1c00aee0:	8c5a                	mv	s8,s6
1c00aee2:	bff9                	j	1c00aec0 <_prf+0x322>
1c00aee4:	4452                	lw	s0,20(sp)
1c00aee6:	bfd5                	j	1c00aeda <_prf+0x33c>
1c00aee8:	0c1d                	addi	s8,s8,7
1c00aeea:	ff8c7c13          	andi	s8,s8,-8
1c00aeee:	000c2883          	lw	a7,0(s8)
1c00aef2:	004c2303          	lw	t1,4(s8)
1c00aef6:	80000737          	lui	a4,0x80000
1c00aefa:	0158d593          	srli	a1,a7,0x15
1c00aefe:	00b31693          	slli	a3,t1,0xb
1c00af02:	8ecd                	or	a3,a3,a1
1c00af04:	fff74713          	not	a4,a4
1c00af08:	01435613          	srli	a2,t1,0x14
1c00af0c:	08ae                	slli	a7,a7,0xb
1c00af0e:	8ef9                	and	a3,a3,a4
1c00af10:	7ff67613          	andi	a2,a2,2047
1c00af14:	d846                	sw	a7,48(sp)
1c00af16:	da36                	sw	a3,52(sp)
1c00af18:	7ff00593          	li	a1,2047
1c00af1c:	008c0a13          	addi	s4,s8,8
1c00af20:	08b61d63          	bne	a2,a1,1c00afba <_prf+0x41c>
1c00af24:	00d0                	addi	a2,sp,68
1c00af26:	8732                	mv	a4,a2
1c00af28:	00035863          	bgez	t1,1c00af38 <_prf+0x39a>
1c00af2c:	02d00713          	li	a4,45
1c00af30:	04e10223          	sb	a4,68(sp)
1c00af34:	04510713          	addi	a4,sp,69
1c00af38:	00d8e6b3          	or	a3,a7,a3
1c00af3c:	fbfa8793          	addi	a5,s5,-65
1c00af40:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00af44:	eaa1                	bnez	a3,1c00af94 <_prf+0x3f6>
1c00af46:	46e5                	li	a3,25
1c00af48:	02f6ee63          	bltu	a3,a5,1c00af84 <_prf+0x3e6>
1c00af4c:	6795                	lui	a5,0x5
1c00af4e:	e4978793          	addi	a5,a5,-439 # 4e49 <__rt_hyper_pending_emu_stride+0x4ba1>
1c00af52:	00f71023          	sh	a5,0(a4)
1c00af56:	04600793          	li	a5,70
1c00af5a:	00f70123          	sb	a5,2(a4)
1c00af5e:	000701a3          	sb	zero,3(a4)
1c00af62:	8d11                	sub	a0,a0,a2
1c00af64:	47d2                	lw	a5,20(sp)
1c00af66:	48079f63          	bnez	a5,1c00b404 <_prf+0x866>
1c00af6a:	e419                	bnez	s0,1c00af78 <_prf+0x3da>
1c00af6c:	04414403          	lbu	s0,68(sp)
1c00af70:	fd340413          	addi	s0,s0,-45
1c00af74:	00143413          	seqz	s0,s0
1c00af78:	0c800793          	li	a5,200
1c00af7c:	c8a7c0e3          	blt	a5,a0,1c00abfc <_prf+0x5e>
1c00af80:	8caa                	mv	s9,a0
1c00af82:	a691                	j	1c00b2c6 <_prf+0x728>
1c00af84:	679d                	lui	a5,0x7
1c00af86:	e6978793          	addi	a5,a5,-407 # 6e69 <__rt_hyper_pending_emu_stride+0x6bc1>
1c00af8a:	00f71023          	sh	a5,0(a4)
1c00af8e:	06600793          	li	a5,102
1c00af92:	b7e1                	j	1c00af5a <_prf+0x3bc>
1c00af94:	46e5                	li	a3,25
1c00af96:	00f6ea63          	bltu	a3,a5,1c00afaa <_prf+0x40c>
1c00af9a:	6791                	lui	a5,0x4
1c00af9c:	14e78793          	addi	a5,a5,334 # 414e <__rt_hyper_pending_emu_stride+0x3ea6>
1c00afa0:	00f71023          	sh	a5,0(a4)
1c00afa4:	04e00793          	li	a5,78
1c00afa8:	bf4d                	j	1c00af5a <_prf+0x3bc>
1c00afaa:	6799                	lui	a5,0x6
1c00afac:	16e78793          	addi	a5,a5,366 # 616e <__rt_hyper_pending_emu_stride+0x5ec6>
1c00afb0:	00f71023          	sh	a5,0(a4)
1c00afb4:	06e00793          	li	a5,110
1c00afb8:	b74d                	j	1c00af5a <_prf+0x3bc>
1c00afba:	04600593          	li	a1,70
1c00afbe:	00ba9463          	bne	s5,a1,1c00afc6 <_prf+0x428>
1c00afc2:	06600a93          	li	s5,102
1c00afc6:	011665b3          	or	a1,a2,a7
1c00afca:	8dd5                	or	a1,a1,a3
1c00afcc:	c9c9                	beqz	a1,1c00b05e <_prf+0x4c0>
1c00afce:	800007b7          	lui	a5,0x80000
1c00afd2:	8edd                	or	a3,a3,a5
1c00afd4:	da36                	sw	a3,52(sp)
1c00afd6:	d846                	sw	a7,48(sp)
1c00afd8:	c0260c13          	addi	s8,a2,-1022
1c00afdc:	02d00693          	li	a3,45
1c00afe0:	00034b63          	bltz	t1,1c00aff6 <_prf+0x458>
1c00afe4:	4752                	lw	a4,20(sp)
1c00afe6:	02b00693          	li	a3,43
1c00afea:	e711                	bnez	a4,1c00aff6 <_prf+0x458>
1c00afec:	04410b13          	addi	s6,sp,68
1c00aff0:	c419                	beqz	s0,1c00affe <_prf+0x460>
1c00aff2:	02000693          	li	a3,32
1c00aff6:	04d10223          	sb	a3,68(sp)
1c00affa:	04510b13          	addi	s6,sp,69
1c00affe:	4b81                	li	s7,0
1c00b000:	55f9                	li	a1,-2
1c00b002:	06bc4363          	blt	s8,a1,1c00b068 <_prf+0x4ca>
1c00b006:	0b804a63          	bgtz	s8,1c00b0ba <_prf+0x51c>
1c00b00a:	4d91                	li	s11,4
1c00b00c:	1808                	addi	a0,sp,48
1c00b00e:	0c05                	addi	s8,s8,1
1c00b010:	aebff0ef          	jal	ra,1c00aafa <_rlrshift>
1c00b014:	ffbc1ce3          	bne	s8,s11,1c00b00c <_prf+0x46e>
1c00b018:	000d5363          	bgez	s10,1c00b01e <_prf+0x480>
1c00b01c:	4d19                	li	s10,6
1c00b01e:	fdfaf593          	andi	a1,s5,-33
1c00b022:	04700513          	li	a0,71
1c00b026:	0ca59663          	bne	a1,a0,1c00b0f2 <_prf+0x554>
1c00b02a:	4c01                	li	s8,0
1c00b02c:	000c9463          	bnez	s9,1c00b034 <_prf+0x496>
1c00b030:	01a03c33          	snez	s8,s10
1c00b034:	55f5                	li	a1,-3
1c00b036:	00bbc663          	blt	s7,a1,1c00b042 <_prf+0x4a4>
1c00b03a:	001d0593          	addi	a1,s10,1
1c00b03e:	0b75df63          	ble	s7,a1,1c00b0fc <_prf+0x55e>
1c00b042:	06700593          	li	a1,103
1c00b046:	14ba8c63          	beq	s5,a1,1c00b19e <_prf+0x600>
1c00b04a:	04500a93          	li	s5,69
1c00b04e:	001d0593          	addi	a1,s10,1
1c00b052:	4541                	li	a0,16
1c00b054:	d62a                	sw	a0,44(sp)
1c00b056:	0ab55c63          	ble	a1,a0,1c00b10e <_prf+0x570>
1c00b05a:	45c1                	li	a1,16
1c00b05c:	a84d                	j	1c00b10e <_prf+0x570>
1c00b05e:	4c01                	li	s8,0
1c00b060:	b751                	j	1c00afe4 <_prf+0x446>
1c00b062:	1808                	addi	a0,sp,48
1c00b064:	a97ff0ef          	jal	ra,1c00aafa <_rlrshift>
1c00b068:	55d2                	lw	a1,52(sp)
1c00b06a:	333337b7          	lui	a5,0x33333
1c00b06e:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1732198e>
1c00b072:	5342                	lw	t1,48(sp)
1c00b074:	0c05                	addi	s8,s8,1
1c00b076:	feb7e6e3          	bltu	a5,a1,1c00b062 <_prf+0x4c4>
1c00b07a:	4895                	li	a7,5
1c00b07c:	02b88533          	mul	a0,a7,a1
1c00b080:	1bfd                	addi	s7,s7,-1
1c00b082:	0268b5b3          	mulhu	a1,a7,t1
1c00b086:	026888b3          	mul	a7,a7,t1
1c00b08a:	95aa                	add	a1,a1,a0
1c00b08c:	da2e                	sw	a1,52(sp)
1c00b08e:	4501                	li	a0,0
1c00b090:	d846                	sw	a7,48(sp)
1c00b092:	800006b7          	lui	a3,0x80000
1c00b096:	fff6c693          	not	a3,a3
1c00b09a:	00b6f663          	bleu	a1,a3,1c00b0a6 <_prf+0x508>
1c00b09e:	d12d                	beqz	a0,1c00b000 <_prf+0x462>
1c00b0a0:	d846                	sw	a7,48(sp)
1c00b0a2:	da2e                	sw	a1,52(sp)
1c00b0a4:	bfb1                	j	1c00b000 <_prf+0x462>
1c00b0a6:	01f8d313          	srli	t1,a7,0x1f
1c00b0aa:	00159513          	slli	a0,a1,0x1
1c00b0ae:	00a365b3          	or	a1,t1,a0
1c00b0b2:	0886                	slli	a7,a7,0x1
1c00b0b4:	1c7d                	addi	s8,s8,-1
1c00b0b6:	4505                	li	a0,1
1c00b0b8:	bfe9                	j	1c00b092 <_prf+0x4f4>
1c00b0ba:	1808                	addi	a0,sp,48
1c00b0bc:	a5fff0ef          	jal	ra,1c00ab1a <_ldiv5>
1c00b0c0:	58c2                	lw	a7,48(sp)
1c00b0c2:	55d2                	lw	a1,52(sp)
1c00b0c4:	1c7d                	addi	s8,s8,-1
1c00b0c6:	0b85                	addi	s7,s7,1
1c00b0c8:	4501                	li	a0,0
1c00b0ca:	80000737          	lui	a4,0x80000
1c00b0ce:	fff74713          	not	a4,a4
1c00b0d2:	00b77663          	bleu	a1,a4,1c00b0de <_prf+0x540>
1c00b0d6:	d905                	beqz	a0,1c00b006 <_prf+0x468>
1c00b0d8:	d846                	sw	a7,48(sp)
1c00b0da:	da2e                	sw	a1,52(sp)
1c00b0dc:	b72d                	j	1c00b006 <_prf+0x468>
1c00b0de:	01f8d313          	srli	t1,a7,0x1f
1c00b0e2:	00159513          	slli	a0,a1,0x1
1c00b0e6:	00a365b3          	or	a1,t1,a0
1c00b0ea:	0886                	slli	a7,a7,0x1
1c00b0ec:	1c7d                	addi	s8,s8,-1
1c00b0ee:	4505                	li	a0,1
1c00b0f0:	bfe9                	j	1c00b0ca <_prf+0x52c>
1c00b0f2:	06600593          	li	a1,102
1c00b0f6:	4c01                	li	s8,0
1c00b0f8:	f4ba9be3          	bne	s5,a1,1c00b04e <_prf+0x4b0>
1c00b0fc:	01ab85b3          	add	a1,s7,s10
1c00b100:	06600a93          	li	s5,102
1c00b104:	f405d7e3          	bgez	a1,1c00b052 <_prf+0x4b4>
1c00b108:	45c1                	li	a1,16
1c00b10a:	d62e                	sw	a1,44(sp)
1c00b10c:	4581                	li	a1,0
1c00b10e:	4301                	li	t1,0
1c00b110:	080003b7          	lui	t2,0x8000
1c00b114:	dc1a                	sw	t1,56(sp)
1c00b116:	de1e                	sw	t2,60(sp)
1c00b118:	5dfd                	li	s11,-1
1c00b11a:	15fd                	addi	a1,a1,-1
1c00b11c:	09b59463          	bne	a1,s11,1c00b1a4 <_prf+0x606>
1c00b120:	55c2                	lw	a1,48(sp)
1c00b122:	5562                	lw	a0,56(sp)
1c00b124:	58d2                	lw	a7,52(sp)
1c00b126:	5372                	lw	t1,60(sp)
1c00b128:	952e                	add	a0,a0,a1
1c00b12a:	00b535b3          	sltu	a1,a0,a1
1c00b12e:	989a                	add	a7,a7,t1
1c00b130:	95c6                	add	a1,a1,a7
1c00b132:	d82a                	sw	a0,48(sp)
1c00b134:	f0000537          	lui	a0,0xf0000
1c00b138:	da2e                	sw	a1,52(sp)
1c00b13a:	8de9                	and	a1,a1,a0
1c00b13c:	c981                	beqz	a1,1c00b14c <_prf+0x5ae>
1c00b13e:	1808                	addi	a0,sp,48
1c00b140:	9dbff0ef          	jal	ra,1c00ab1a <_ldiv5>
1c00b144:	1808                	addi	a0,sp,48
1c00b146:	9b5ff0ef          	jal	ra,1c00aafa <_rlrshift>
1c00b14a:	0b85                	addi	s7,s7,1
1c00b14c:	06600593          	li	a1,102
1c00b150:	001b0d93          	addi	s11,s6,1
1c00b154:	08ba9663          	bne	s5,a1,1c00b1e0 <_prf+0x642>
1c00b158:	05705f63          	blez	s7,1c00b1b6 <_prf+0x618>
1c00b15c:	017b0db3          	add	s11,s6,s7
1c00b160:	106c                	addi	a1,sp,44
1c00b162:	1808                	addi	a0,sp,48
1c00b164:	0b05                	addi	s6,s6,1
1c00b166:	9fdff0ef          	jal	ra,1c00ab62 <_get_digit>
1c00b16a:	feab0fa3          	sb	a0,-1(s6)
1c00b16e:	ffbb19e3          	bne	s6,s11,1c00b160 <_prf+0x5c2>
1c00b172:	4b81                	li	s7,0
1c00b174:	000c9463          	bnez	s9,1c00b17c <_prf+0x5de>
1c00b178:	020d0063          	beqz	s10,1c00b198 <_prf+0x5fa>
1c00b17c:	02e00613          	li	a2,46
1c00b180:	00cd8023          	sb	a2,0(s11)
1c00b184:	8b6e                	mv	s6,s11
1c00b186:	01ad8cb3          	add	s9,s11,s10
1c00b18a:	03000313          	li	t1,48
1c00b18e:	036c9963          	bne	s9,s6,1c00b1c0 <_prf+0x622>
1c00b192:	001d0713          	addi	a4,s10,1
1c00b196:	9dba                	add	s11,s11,a4
1c00b198:	060c1e63          	bnez	s8,1c00b214 <_prf+0x676>
1c00b19c:	a8d1                	j	1c00b270 <_prf+0x6d2>
1c00b19e:	06500a93          	li	s5,101
1c00b1a2:	b575                	j	1c00b04e <_prf+0x4b0>
1c00b1a4:	1828                	addi	a0,sp,56
1c00b1a6:	c42e                	sw	a1,8(sp)
1c00b1a8:	973ff0ef          	jal	ra,1c00ab1a <_ldiv5>
1c00b1ac:	1828                	addi	a0,sp,56
1c00b1ae:	94dff0ef          	jal	ra,1c00aafa <_rlrshift>
1c00b1b2:	45a2                	lw	a1,8(sp)
1c00b1b4:	b79d                	j	1c00b11a <_prf+0x57c>
1c00b1b6:	03000593          	li	a1,48
1c00b1ba:	00bb0023          	sb	a1,0(s6)
1c00b1be:	bf5d                	j	1c00b174 <_prf+0x5d6>
1c00b1c0:	000b8763          	beqz	s7,1c00b1ce <_prf+0x630>
1c00b1c4:	006b00a3          	sb	t1,1(s6)
1c00b1c8:	0b85                	addi	s7,s7,1
1c00b1ca:	0b05                	addi	s6,s6,1
1c00b1cc:	b7c9                	j	1c00b18e <_prf+0x5f0>
1c00b1ce:	106c                	addi	a1,sp,44
1c00b1d0:	1808                	addi	a0,sp,48
1c00b1d2:	c41a                	sw	t1,8(sp)
1c00b1d4:	98fff0ef          	jal	ra,1c00ab62 <_get_digit>
1c00b1d8:	00ab00a3          	sb	a0,1(s6)
1c00b1dc:	4322                	lw	t1,8(sp)
1c00b1de:	b7f5                	j	1c00b1ca <_prf+0x62c>
1c00b1e0:	106c                	addi	a1,sp,44
1c00b1e2:	1808                	addi	a0,sp,48
1c00b1e4:	97fff0ef          	jal	ra,1c00ab62 <_get_digit>
1c00b1e8:	00ab0023          	sb	a0,0(s6)
1c00b1ec:	03000593          	li	a1,48
1c00b1f0:	00b50363          	beq	a0,a1,1c00b1f6 <_prf+0x658>
1c00b1f4:	1bfd                	addi	s7,s7,-1
1c00b1f6:	000c9463          	bnez	s9,1c00b1fe <_prf+0x660>
1c00b1fa:	000d0b63          	beqz	s10,1c00b210 <_prf+0x672>
1c00b1fe:	002b0d93          	addi	s11,s6,2
1c00b202:	02e00593          	li	a1,46
1c00b206:	00bb00a3          	sb	a1,1(s6)
1c00b20a:	9d6e                	add	s10,s10,s11
1c00b20c:	07bd1863          	bne	s10,s11,1c00b27c <_prf+0x6de>
1c00b210:	000c0f63          	beqz	s8,1c00b22e <_prf+0x690>
1c00b214:	03000593          	li	a1,48
1c00b218:	fffdc603          	lbu	a2,-1(s11)
1c00b21c:	fffd8713          	addi	a4,s11,-1
1c00b220:	06b60663          	beq	a2,a1,1c00b28c <_prf+0x6ee>
1c00b224:	02e00593          	li	a1,46
1c00b228:	00b61363          	bne	a2,a1,1c00b22e <_prf+0x690>
1c00b22c:	8dba                	mv	s11,a4
1c00b22e:	fdfaf713          	andi	a4,s5,-33
1c00b232:	04500613          	li	a2,69
1c00b236:	02c71d63          	bne	a4,a2,1c00b270 <_prf+0x6d2>
1c00b23a:	87d6                	mv	a5,s5
1c00b23c:	00fd8023          	sb	a5,0(s11)
1c00b240:	02b00793          	li	a5,43
1c00b244:	000bd663          	bgez	s7,1c00b250 <_prf+0x6b2>
1c00b248:	41700bb3          	neg	s7,s7
1c00b24c:	02d00793          	li	a5,45
1c00b250:	00fd80a3          	sb	a5,1(s11)
1c00b254:	47a9                	li	a5,10
1c00b256:	02fbc733          	div	a4,s7,a5
1c00b25a:	0d91                	addi	s11,s11,4
1c00b25c:	02fbe6b3          	rem	a3,s7,a5
1c00b260:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b264:	feed8f23          	sb	a4,-2(s11)
1c00b268:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b26c:	fedd8fa3          	sb	a3,-1(s11)
1c00b270:	00c8                	addi	a0,sp,68
1c00b272:	000d8023          	sb	zero,0(s11)
1c00b276:	40ad8533          	sub	a0,s11,a0
1c00b27a:	b1ed                	j	1c00af64 <_prf+0x3c6>
1c00b27c:	106c                	addi	a1,sp,44
1c00b27e:	1808                	addi	a0,sp,48
1c00b280:	0d85                	addi	s11,s11,1
1c00b282:	8e1ff0ef          	jal	ra,1c00ab62 <_get_digit>
1c00b286:	fead8fa3          	sb	a0,-1(s11)
1c00b28a:	b749                	j	1c00b20c <_prf+0x66e>
1c00b28c:	8dba                	mv	s11,a4
1c00b28e:	b769                	j	1c00b218 <_prf+0x67a>
1c00b290:	000c2783          	lw	a5,0(s8)
1c00b294:	004c0a13          	addi	s4,s8,4
1c00b298:	0137a023          	sw	s3,0(a5)
1c00b29c:	b24d                	j	1c00ac3e <_prf+0xa0>
1c00b29e:	004c0a13          	addi	s4,s8,4
1c00b2a2:	000c2583          	lw	a1,0(s8)
1c00b2a6:	00dc                	addi	a5,sp,68
1c00b2a8:	040c8463          	beqz	s9,1c00b2f0 <_prf+0x752>
1c00b2ac:	03000693          	li	a3,48
1c00b2b0:	04d10223          	sb	a3,68(sp)
1c00b2b4:	04510513          	addi	a0,sp,69
1c00b2b8:	ed8d                	bnez	a1,1c00b2f2 <_prf+0x754>
1c00b2ba:	040102a3          	sb	zero,69(sp)
1c00b2be:	57fd                	li	a5,-1
1c00b2c0:	4401                	li	s0,0
1c00b2c2:	0efd1163          	bne	s10,a5,1c00b3a4 <_prf+0x806>
1c00b2c6:	0f2cc363          	blt	s9,s2,1c00b3ac <_prf+0x80e>
1c00b2ca:	8966                	mv	s2,s9
1c00b2cc:	00c0                	addi	s0,sp,68
1c00b2ce:	40898ab3          	sub	s5,s3,s0
1c00b2d2:	5b7d                	li	s6,-1
1c00b2d4:	015409b3          	add	s3,s0,s5
1c00b2d8:	960903e3          	beqz	s2,1c00ac3e <_prf+0xa0>
1c00b2dc:	45f2                	lw	a1,28(sp)
1c00b2de:	00044503          	lbu	a0,0(s0)
1c00b2e2:	47e2                	lw	a5,24(sp)
1c00b2e4:	9782                	jalr	a5
1c00b2e6:	91650be3          	beq	a0,s6,1c00abfc <_prf+0x5e>
1c00b2ea:	197d                	addi	s2,s2,-1
1c00b2ec:	0405                	addi	s0,s0,1
1c00b2ee:	b7dd                	j	1c00b2d4 <_prf+0x736>
1c00b2f0:	853e                	mv	a0,a5
1c00b2f2:	86ea                	mv	a3,s10
1c00b2f4:	4621                	li	a2,8
1c00b2f6:	40f50433          	sub	s0,a0,a5
1c00b2fa:	fa0ff0ef          	jal	ra,1c00aa9a <_to_x>
1c00b2fe:	9522                	add	a0,a0,s0
1c00b300:	57fd                	li	a5,-1
1c00b302:	4401                	li	s0,0
1c00b304:	c6fd0ae3          	beq	s10,a5,1c00af78 <_prf+0x3da>
1c00b308:	02000793          	li	a5,32
1c00b30c:	c83e                	sw	a5,16(sp)
1c00b30e:	b1ad                	j	1c00af78 <_prf+0x3da>
1c00b310:	000c2583          	lw	a1,0(s8)
1c00b314:	77e1                	lui	a5,0xffff8
1c00b316:	8307c793          	xori	a5,a5,-2000
1c00b31a:	46a1                	li	a3,8
1c00b31c:	4641                	li	a2,16
1c00b31e:	04610513          	addi	a0,sp,70
1c00b322:	04f11223          	sh	a5,68(sp)
1c00b326:	f74ff0ef          	jal	ra,1c00aa9a <_to_x>
1c00b32a:	004c0a13          	addi	s4,s8,4
1c00b32e:	0509                	addi	a0,a0,2
1c00b330:	57fd                	li	a5,-1
1c00b332:	4401                	li	s0,0
1c00b334:	c4fd02e3          	beq	s10,a5,1c00af78 <_prf+0x3da>
1c00b338:	02000713          	li	a4,32
1c00b33c:	c83a                	sw	a4,16(sp)
1c00b33e:	b92d                	j	1c00af78 <_prf+0x3da>
1c00b340:	000d4563          	bltz	s10,1c00b34a <_prf+0x7ac>
1c00b344:	019d5363          	ble	s9,s10,1c00b34a <_prf+0x7ac>
1c00b348:	8cea                	mv	s9,s10
1c00b34a:	8e0c8ae3          	beqz	s9,1c00ac3e <_prf+0xa0>
1c00b34e:	8666                	mv	a2,s9
1c00b350:	00c8                	addi	a0,sp,68
1c00b352:	ce4ff0ef          	jal	ra,1c00a836 <memcpy>
1c00b356:	b6b9                	j	1c00aea4 <_prf+0x306>
1c00b358:	000c2583          	lw	a1,0(s8)
1c00b35c:	86ea                	mv	a3,s10
1c00b35e:	4629                	li	a2,10
1c00b360:	00c8                	addi	a0,sp,68
1c00b362:	004c0a13          	addi	s4,s8,4
1c00b366:	f34ff0ef          	jal	ra,1c00aa9a <_to_x>
1c00b36a:	bf59                	j	1c00b300 <_prf+0x762>
1c00b36c:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b370:	0ff67613          	andi	a2,a2,255
1c00b374:	00c5e563          	bltu	a1,a2,1c00b37e <_prf+0x7e0>
1c00b378:	1781                	addi	a5,a5,-32
1c00b37a:	00f68023          	sb	a5,0(a3)
1c00b37e:	0685                	addi	a3,a3,1
1c00b380:	0006c783          	lbu	a5,0(a3)
1c00b384:	f7e5                	bnez	a5,1c00b36c <_prf+0x7ce>
1c00b386:	bc9d                	j	1c00adfc <_prf+0x25e>
1c00b388:	86de                	mv	a3,s7
1c00b38a:	45e5                	li	a1,25
1c00b38c:	bfd5                	j	1c00b380 <_prf+0x7e2>
1c00b38e:	45f2                	lw	a1,28(sp)
1c00b390:	4762                	lw	a4,24(sp)
1c00b392:	02500513          	li	a0,37
1c00b396:	9702                	jalr	a4
1c00b398:	57fd                	li	a5,-1
1c00b39a:	86f501e3          	beq	a0,a5,1c00abfc <_prf+0x5e>
1c00b39e:	0985                	addi	s3,s3,1
1c00b3a0:	8a62                	mv	s4,s8
1c00b3a2:	b871                	j	1c00ac3e <_prf+0xa0>
1c00b3a4:	02000793          	li	a5,32
1c00b3a8:	c83e                	sw	a5,16(sp)
1c00b3aa:	bf31                	j	1c00b2c6 <_prf+0x728>
1c00b3ac:	4732                	lw	a4,12(sp)
1c00b3ae:	cf01                	beqz	a4,1c00b3c6 <_prf+0x828>
1c00b3b0:	02000713          	li	a4,32
1c00b3b4:	00d4                	addi	a3,sp,68
1c00b3b6:	019687b3          	add	a5,a3,s9
1c00b3ba:	00e78023          	sb	a4,0(a5)
1c00b3be:	0c85                	addi	s9,s9,1
1c00b3c0:	ff991ae3          	bne	s2,s9,1c00b3b4 <_prf+0x816>
1c00b3c4:	b721                	j	1c00b2cc <_prf+0x72e>
1c00b3c6:	00cc                	addi	a1,sp,68
1c00b3c8:	41990bb3          	sub	s7,s2,s9
1c00b3cc:	001c8613          	addi	a2,s9,1
1c00b3d0:	01758533          	add	a0,a1,s7
1c00b3d4:	c7aff0ef          	jal	ra,1c00a84e <memmove>
1c00b3d8:	4742                	lw	a4,16(sp)
1c00b3da:	02000793          	li	a5,32
1c00b3de:	00f70363          	beq	a4,a5,1c00b3e4 <_prf+0x846>
1c00b3e2:	c622                	sw	s0,12(sp)
1c00b3e4:	47b2                	lw	a5,12(sp)
1c00b3e6:	9bbe                	add	s7,s7,a5
1c00b3e8:	4732                	lw	a4,12(sp)
1c00b3ea:	ef7751e3          	ble	s7,a4,1c00b2cc <_prf+0x72e>
1c00b3ee:	4732                	lw	a4,12(sp)
1c00b3f0:	00d4                	addi	a3,sp,68
1c00b3f2:	00e687b3          	add	a5,a3,a4
1c00b3f6:	4742                	lw	a4,16(sp)
1c00b3f8:	00e78023          	sb	a4,0(a5)
1c00b3fc:	47b2                	lw	a5,12(sp)
1c00b3fe:	0785                	addi	a5,a5,1
1c00b400:	c63e                	sw	a5,12(sp)
1c00b402:	b7dd                	j	1c00b3e8 <_prf+0x84a>
1c00b404:	4452                	lw	s0,20(sp)
1c00b406:	be8d                	j	1c00af78 <_prf+0x3da>

1c00b408 <__rt_uart_cluster_req_done>:
1c00b408:	300476f3          	csrrci	a3,mstatus,8
1c00b40c:	4785                	li	a5,1
1c00b40e:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b412:	09954783          	lbu	a5,153(a0)
1c00b416:	00201737          	lui	a4,0x201
1c00b41a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f0e24>
1c00b41e:	04078793          	addi	a5,a5,64
1c00b422:	07da                	slli	a5,a5,0x16
1c00b424:	97ba                	add	a5,a5,a4
1c00b426:	0007a023          	sw	zero,0(a5)
1c00b42a:	30069073          	csrw	mstatus,a3
1c00b42e:	8082                	ret

1c00b430 <__rt_uart_setup.isra.6>:
1c00b430:	1c001737          	lui	a4,0x1c001
1c00b434:	23872703          	lw	a4,568(a4) # 1c001238 <__rt_freq_domains>
1c00b438:	00155793          	srli	a5,a0,0x1
1c00b43c:	97ba                	add	a5,a5,a4
1c00b43e:	02a7d7b3          	divu	a5,a5,a0
1c00b442:	1a102737          	lui	a4,0x1a102
1c00b446:	17fd                	addi	a5,a5,-1
1c00b448:	07c2                	slli	a5,a5,0x10
1c00b44a:	3067e793          	ori	a5,a5,774
1c00b44e:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102184>
1c00b452:	8082                	ret

1c00b454 <__rt_uart_setfreq_after>:
1c00b454:	1c0017b7          	lui	a5,0x1c001
1c00b458:	1b878793          	addi	a5,a5,440 # 1c0011b8 <__rt_uart>
1c00b45c:	4398                	lw	a4,0(a5)
1c00b45e:	cb09                	beqz	a4,1c00b470 <__rt_uart_setfreq_after+0x1c>
1c00b460:	4788                	lw	a0,8(a5)
1c00b462:	1141                	addi	sp,sp,-16
1c00b464:	c606                	sw	ra,12(sp)
1c00b466:	37e9                	jal	1c00b430 <__rt_uart_setup.isra.6>
1c00b468:	40b2                	lw	ra,12(sp)
1c00b46a:	4501                	li	a0,0
1c00b46c:	0141                	addi	sp,sp,16
1c00b46e:	8082                	ret
1c00b470:	4501                	li	a0,0
1c00b472:	8082                	ret

1c00b474 <__rt_uart_cluster_req>:
1c00b474:	1141                	addi	sp,sp,-16
1c00b476:	c606                	sw	ra,12(sp)
1c00b478:	c422                	sw	s0,8(sp)
1c00b47a:	30047473          	csrrci	s0,mstatus,8
1c00b47e:	1c00b7b7          	lui	a5,0x1c00b
1c00b482:	40878793          	addi	a5,a5,1032 # 1c00b408 <__rt_uart_cluster_req_done>
1c00b486:	c55c                	sw	a5,12(a0)
1c00b488:	4785                	li	a5,1
1c00b48a:	d55c                	sw	a5,44(a0)
1c00b48c:	411c                	lw	a5,0(a0)
1c00b48e:	02052823          	sw	zero,48(a0)
1c00b492:	c908                	sw	a0,16(a0)
1c00b494:	43cc                	lw	a1,4(a5)
1c00b496:	4514                	lw	a3,8(a0)
1c00b498:	4150                	lw	a2,4(a0)
1c00b49a:	0586                	slli	a1,a1,0x1
1c00b49c:	00c50793          	addi	a5,a0,12
1c00b4a0:	4701                	li	a4,0
1c00b4a2:	0585                	addi	a1,a1,1
1c00b4a4:	4501                	li	a0,0
1c00b4a6:	e99fe0ef          	jal	ra,1c00a33e <rt_periph_copy>
1c00b4aa:	30041073          	csrw	mstatus,s0
1c00b4ae:	40b2                	lw	ra,12(sp)
1c00b4b0:	4422                	lw	s0,8(sp)
1c00b4b2:	0141                	addi	sp,sp,16
1c00b4b4:	8082                	ret

1c00b4b6 <__rt_uart_wait_tx_done.isra.5>:
1c00b4b6:	1a102737          	lui	a4,0x1a102
1c00b4ba:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa102178>
1c00b4be:	8bc1                	andi	a5,a5,16
1c00b4c0:	e7b9                	bnez	a5,1c00b50e <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b4c2:	1a102737          	lui	a4,0x1a102
1c00b4c6:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa102180>
1c00b4ca:	8b85                	andi	a5,a5,1
1c00b4cc:	ffed                	bnez	a5,1c00b4c6 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b4ce:	f14027f3          	csrr	a5,mhartid
1c00b4d2:	8795                	srai	a5,a5,0x5
1c00b4d4:	1a10a637          	lui	a2,0x1a10a
1c00b4d8:	03f7f793          	andi	a5,a5,63
1c00b4dc:	03200693          	li	a3,50
1c00b4e0:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa1097f4>
1c00b4e4:	6711                	lui	a4,0x4
1c00b4e6:	6311                	lui	t1,0x4
1c00b4e8:	45fd                	li	a1,31
1c00b4ea:	00204537          	lui	a0,0x204
1c00b4ee:	88be                	mv	a7,a5
1c00b4f0:	00682023          	sw	t1,0(a6)
1c00b4f4:	02b79063          	bne	a5,a1,1c00b514 <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b4f8:	80e62223          	sw	a4,-2044(a2)
1c00b4fc:	10500073          	wfi
1c00b500:	00b89c63          	bne	a7,a1,1c00b518 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b504:	80e62423          	sw	a4,-2040(a2)
1c00b508:	16fd                	addi	a3,a3,-1
1c00b50a:	f2fd                	bnez	a3,1c00b4f0 <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b50c:	8082                	ret
1c00b50e:	10500073          	wfi
1c00b512:	b765                	j	1c00b4ba <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b514:	c958                	sw	a4,20(a0)
1c00b516:	b7dd                	j	1c00b4fc <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b518:	c918                	sw	a4,16(a0)
1c00b51a:	b7fd                	j	1c00b508 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b51c <__rt_uart_setfreq_before>:
1c00b51c:	1c0017b7          	lui	a5,0x1c001
1c00b520:	1b87a783          	lw	a5,440(a5) # 1c0011b8 <__rt_uart>
1c00b524:	cf99                	beqz	a5,1c00b542 <__rt_uart_setfreq_before+0x26>
1c00b526:	1141                	addi	sp,sp,-16
1c00b528:	c606                	sw	ra,12(sp)
1c00b52a:	3771                	jal	1c00b4b6 <__rt_uart_wait_tx_done.isra.5>
1c00b52c:	40b2                	lw	ra,12(sp)
1c00b52e:	005007b7          	lui	a5,0x500
1c00b532:	1a102737          	lui	a4,0x1a102
1c00b536:	0799                	addi	a5,a5,6
1c00b538:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102184>
1c00b53c:	4501                	li	a0,0
1c00b53e:	0141                	addi	sp,sp,16
1c00b540:	8082                	ret
1c00b542:	4501                	li	a0,0
1c00b544:	8082                	ret

1c00b546 <soc_eu_fcEventMask_setEvent>:
1c00b546:	47fd                	li	a5,31
1c00b548:	4721                	li	a4,8
1c00b54a:	00a7d463          	ble	a0,a5,1c00b552 <soc_eu_fcEventMask_setEvent+0xc>
1c00b54e:	1501                	addi	a0,a0,-32
1c00b550:	4711                	li	a4,4
1c00b552:	1a1067b7          	lui	a5,0x1a106
1c00b556:	973e                	add	a4,a4,a5
1c00b558:	4314                	lw	a3,0(a4)
1c00b55a:	4785                	li	a5,1
1c00b55c:	00a79533          	sll	a0,a5,a0
1c00b560:	fff54513          	not	a0,a0
1c00b564:	8d75                	and	a0,a0,a3
1c00b566:	c308                	sw	a0,0(a4)
1c00b568:	8082                	ret

1c00b56a <rt_uart_conf_init>:
1c00b56a:	000997b7          	lui	a5,0x99
1c00b56e:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x88988>
1c00b572:	c11c                	sw	a5,0(a0)
1c00b574:	57fd                	li	a5,-1
1c00b576:	c15c                	sw	a5,4(a0)
1c00b578:	8082                	ret

1c00b57a <__rt_uart_open>:
1c00b57a:	1141                	addi	sp,sp,-16
1c00b57c:	c606                	sw	ra,12(sp)
1c00b57e:	c422                	sw	s0,8(sp)
1c00b580:	c226                	sw	s1,4(sp)
1c00b582:	c04a                	sw	s2,0(sp)
1c00b584:	30047973          	csrrci	s2,mstatus,8
1c00b588:	cd8d                	beqz	a1,1c00b5c2 <__rt_uart_open+0x48>
1c00b58a:	4194                	lw	a3,0(a1)
1c00b58c:	1c0017b7          	lui	a5,0x1c001
1c00b590:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f401d>
1c00b594:	1b878413          	addi	s0,a5,440 # 1c0011b8 <__rt_uart>
1c00b598:	0712                	slli	a4,a4,0x4
1c00b59a:	943a                	add	s0,s0,a4
1c00b59c:	4010                	lw	a2,0(s0)
1c00b59e:	1b878793          	addi	a5,a5,440
1c00b5a2:	c60d                	beqz	a2,1c00b5cc <__rt_uart_open+0x52>
1c00b5a4:	c589                	beqz	a1,1c00b5ae <__rt_uart_open+0x34>
1c00b5a6:	418c                	lw	a1,0(a1)
1c00b5a8:	4414                	lw	a3,8(s0)
1c00b5aa:	04d59a63          	bne	a1,a3,1c00b5fe <__rt_uart_open+0x84>
1c00b5ae:	97ba                	add	a5,a5,a4
1c00b5b0:	0605                	addi	a2,a2,1
1c00b5b2:	c390                	sw	a2,0(a5)
1c00b5b4:	8522                	mv	a0,s0
1c00b5b6:	40b2                	lw	ra,12(sp)
1c00b5b8:	4422                	lw	s0,8(sp)
1c00b5ba:	4492                	lw	s1,4(sp)
1c00b5bc:	4902                	lw	s2,0(sp)
1c00b5be:	0141                	addi	sp,sp,16
1c00b5c0:	8082                	ret
1c00b5c2:	000996b7          	lui	a3,0x99
1c00b5c6:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x88988>
1c00b5ca:	b7c9                	j	1c00b58c <__rt_uart_open+0x12>
1c00b5cc:	4785                	li	a5,1
1c00b5ce:	1a102737          	lui	a4,0x1a102
1c00b5d2:	c01c                	sw	a5,0(s0)
1c00b5d4:	c048                	sw	a0,4(s0)
1c00b5d6:	c414                	sw	a3,8(s0)
1c00b5d8:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa102760>
1c00b5dc:	00a797b3          	sll	a5,a5,a0
1c00b5e0:	00151493          	slli	s1,a0,0x1
1c00b5e4:	8fd5                	or	a5,a5,a3
1c00b5e6:	78f72023          	sw	a5,1920(a4)
1c00b5ea:	8526                	mv	a0,s1
1c00b5ec:	3fa9                	jal	1c00b546 <soc_eu_fcEventMask_setEvent>
1c00b5ee:	00148513          	addi	a0,s1,1
1c00b5f2:	3f91                	jal	1c00b546 <soc_eu_fcEventMask_setEvent>
1c00b5f4:	4408                	lw	a0,8(s0)
1c00b5f6:	3d2d                	jal	1c00b430 <__rt_uart_setup.isra.6>
1c00b5f8:	30091073          	csrw	mstatus,s2
1c00b5fc:	bf65                	j	1c00b5b4 <__rt_uart_open+0x3a>
1c00b5fe:	4401                	li	s0,0
1c00b600:	bf55                	j	1c00b5b4 <__rt_uart_open+0x3a>

1c00b602 <rt_uart_close>:
1c00b602:	1141                	addi	sp,sp,-16
1c00b604:	c606                	sw	ra,12(sp)
1c00b606:	c422                	sw	s0,8(sp)
1c00b608:	c226                	sw	s1,4(sp)
1c00b60a:	300474f3          	csrrci	s1,mstatus,8
1c00b60e:	411c                	lw	a5,0(a0)
1c00b610:	17fd                	addi	a5,a5,-1
1c00b612:	c11c                	sw	a5,0(a0)
1c00b614:	e78d                	bnez	a5,1c00b63e <rt_uart_close+0x3c>
1c00b616:	842a                	mv	s0,a0
1c00b618:	3d79                	jal	1c00b4b6 <__rt_uart_wait_tx_done.isra.5>
1c00b61a:	005007b7          	lui	a5,0x500
1c00b61e:	1a102737          	lui	a4,0x1a102
1c00b622:	0799                	addi	a5,a5,6
1c00b624:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa102184>
1c00b628:	4050                	lw	a2,4(s0)
1c00b62a:	78072683          	lw	a3,1920(a4)
1c00b62e:	4785                	li	a5,1
1c00b630:	00c797b3          	sll	a5,a5,a2
1c00b634:	fff7c793          	not	a5,a5
1c00b638:	8ff5                	and	a5,a5,a3
1c00b63a:	78f72023          	sw	a5,1920(a4)
1c00b63e:	30049073          	csrw	mstatus,s1
1c00b642:	40b2                	lw	ra,12(sp)
1c00b644:	4422                	lw	s0,8(sp)
1c00b646:	4492                	lw	s1,4(sp)
1c00b648:	0141                	addi	sp,sp,16
1c00b64a:	8082                	ret

1c00b64c <rt_uart_cluster_write>:
1c00b64c:	f14027f3          	csrr	a5,mhartid
1c00b650:	8795                	srai	a5,a5,0x5
1c00b652:	03f7f793          	andi	a5,a5,63
1c00b656:	08f68ca3          	sb	a5,153(a3)
1c00b65a:	1c00b7b7          	lui	a5,0x1c00b
1c00b65e:	47478793          	addi	a5,a5,1140 # 1c00b474 <__rt_uart_cluster_req>
1c00b662:	c6dc                	sw	a5,12(a3)
1c00b664:	4785                	li	a5,1
1c00b666:	c288                	sw	a0,0(a3)
1c00b668:	c2cc                	sw	a1,4(a3)
1c00b66a:	c690                	sw	a2,8(a3)
1c00b66c:	08068c23          	sb	zero,152(a3)
1c00b670:	0206a823          	sw	zero,48(a3)
1c00b674:	ca94                	sw	a3,16(a3)
1c00b676:	d6dc                	sw	a5,44(a3)
1c00b678:	00c68513          	addi	a0,a3,12
1c00b67c:	ac9fd06f          	j	1c009144 <__rt_cluster_push_fc_event>

1c00b680 <__rt_uart_init>:
1c00b680:	1c00b5b7          	lui	a1,0x1c00b
1c00b684:	1141                	addi	sp,sp,-16
1c00b686:	4601                	li	a2,0
1c00b688:	51c58593          	addi	a1,a1,1308 # 1c00b51c <__rt_uart_setfreq_before>
1c00b68c:	4511                	li	a0,4
1c00b68e:	c606                	sw	ra,12(sp)
1c00b690:	c422                	sw	s0,8(sp)
1c00b692:	8bafe0ef          	jal	ra,1c00974c <__rt_cbsys_add>
1c00b696:	1c00b5b7          	lui	a1,0x1c00b
1c00b69a:	842a                	mv	s0,a0
1c00b69c:	4601                	li	a2,0
1c00b69e:	45458593          	addi	a1,a1,1108 # 1c00b454 <__rt_uart_setfreq_after>
1c00b6a2:	4515                	li	a0,5
1c00b6a4:	8a8fe0ef          	jal	ra,1c00974c <__rt_cbsys_add>
1c00b6a8:	1c0017b7          	lui	a5,0x1c001
1c00b6ac:	1a07ac23          	sw	zero,440(a5) # 1c0011b8 <__rt_uart>
1c00b6b0:	8d41                	or	a0,a0,s0
1c00b6b2:	c105                	beqz	a0,1c00b6d2 <__rt_uart_init+0x52>
1c00b6b4:	f1402673          	csrr	a2,mhartid
1c00b6b8:	1c000537          	lui	a0,0x1c000
1c00b6bc:	40565593          	srai	a1,a2,0x5
1c00b6c0:	03f5f593          	andi	a1,a1,63
1c00b6c4:	8a7d                	andi	a2,a2,31
1c00b6c6:	6b450513          	addi	a0,a0,1716 # 1c0006b4 <__DTOR_END__+0x3c8>
1c00b6ca:	ba6ff0ef          	jal	ra,1c00aa70 <printf>
1c00b6ce:	b2eff0ef          	jal	ra,1c00a9fc <abort>
1c00b6d2:	40b2                	lw	ra,12(sp)
1c00b6d4:	4422                	lw	s0,8(sp)
1c00b6d6:	0141                	addi	sp,sp,16
1c00b6d8:	8082                	ret

1c00b6da <_endtext>:
	...

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
1c010030:	ffff1b97          	auipc	s7,0xffff1
1c010034:	1d8b8b93          	addi	s7,s7,472 # 1c001208 <__rt_fc_cluster_data>
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
