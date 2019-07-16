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
1c008090:	0fdc                	addi	a5,sp,980
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
1c0080bc:	ff028293          	addi	t0,t0,-16 # 1c0010a8 <_bss_start>
1c0080c0:	ffff9317          	auipc	t1,0xffff9
1c0080c4:	14430313          	addi	t1,t1,324 # 1c001204 <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0)
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	dee10113          	addi	sp,sp,-530 # 1c000ec0 <stack>
1c0080da:	284010ef          	jal	ra,1c00935e <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00001397          	auipc	t2,0x1
1c0080ea:	a6438393          	addi	t2,t2,-1436 # 1c008b4a <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	3de010ef          	jal	ra,1c0094d2 <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	027020ef          	jal	ra,1c00a920 <exit>

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
1c00815e:	73460613          	addi	a2,a2,1844 # 1c00988e <__rt_bridge_handle_notif>
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
1c008198:	03448493          	addi	s1,s1,52 # 1c0011c8 <__rt_fc_cluster_data>

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
1c0081fa:	fd248493          	addi	s1,s1,-46 # 1c0011c8 <__rt_fc_cluster_data>
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
1c00825e:	30850513          	addi	a0,a0,776 # 1c009562 <__rt_handle_illegal_instr>
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
1c008340:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_end+0xa1061ec>
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
1c008518:	0007c503          	lbu	a0,0(a5) # 10000 <__l1_heap_size+0x3614>
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
1c00855a:	464020ef          	jal	ra,1c00a9be <printf>
1c00855e:	0028                	addi	a0,sp,8
1c008560:	5c7000ef          	jal	ra,1c009326 <rt_perf_init>
1c008564:	6589                	lui	a1,0x2
1c008566:	40058593          	addi	a1,a1,1024 # 2400 <__rt_hyper_pending_emu_stride+0x2158>
1c00856a:	450d                	li	a0,3
1c00856c:	257d                	jal	1c008c1a <rt_alloc>
1c00856e:	1a050463          	beqz	a0,1c008716 <cluster_entry+0x1e6>
1c008572:	84aa                	mv	s1,a0
1c008574:	1c000537          	lui	a0,0x1c000
1c008578:	42450513          	addi	a0,a0,1060 # 1c000424 <__DTOR_END__+0x138>
1c00857c:	342020ef          	jal	ra,1c00a8be <puts>
1c008580:	65e1                	lui	a1,0x18
1c008582:	0599                	addi	a1,a1,6
1c008584:	0028                	addi	a0,sp,8
1c008586:	5b5000ef          	jal	ra,1c00933a <rt_perf_conf>
1c00858a:	47fd                	li	a5,31
1c00858c:	14f40163          	beq	s0,a5,1c0086ce <cluster_entry+0x19e>
1c008590:	102007b7          	lui	a5,0x10200
1c008594:	4705                	li	a4,1
1c008596:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fcdec>
1c00859a:	02e7a023          	sw	a4,32(a5)
1c00859e:	4781                	li	a5,0
1c0085a0:	79f79073          	csrw	pccr31,a5
1c0085a4:	f14027f3          	csrr	a5,mhartid
1c0085a8:	477d                	li	a4,31
1c0085aa:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085ae:	12e78f63          	beq	a5,a4,1c0086ec <cluster_entry+0x1bc>
1c0085b2:	102007b7          	lui	a5,0x10200
1c0085b6:	4705                	li	a4,1
1c0085b8:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fcdec>
1c0085bc:	00e7ac23          	sw	a4,24(a5)
1c0085c0:	478d                	li	a5,3
1c0085c2:	7a179073          	csrw	pcmr,a5
1c0085c6:	100025b7          	lui	a1,0x10002
1c0085ca:	10003537          	lui	a0,0x10003
1c0085ce:	87a6                	mv	a5,s1
1c0085d0:	03000713          	li	a4,48
1c0085d4:	03000693          	li	a3,48
1c0085d8:	03000613          	li	a2,48
1c0085dc:	41458593          	addi	a1,a1,1044 # 10002414 <m_b>
1c0085e0:	d1450513          	addi	a0,a0,-748 # 10002d14 <m_a>
1c0085e4:	2a81                	jal	1c008734 <plp_mat_mult_i8v_xpulpv2>
1c0085e6:	477d                	li	a4,31
1c0085e8:	f14027f3          	csrr	a5,mhartid
1c0085ec:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085f0:	12e78a63          	beq	a5,a4,1c008724 <cluster_entry+0x1f4>
1c0085f4:	102007b7          	lui	a5,0x10200
1c0085f8:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fcdec>
1c0085fc:	0007a023          	sw	zero,0(a5)
1c008600:	4781                	li	a5,0
1c008602:	7a179073          	csrw	pcmr,a5
1c008606:	10000937          	lui	s2,0x10000
1c00860a:	6985                	lui	s3,0x1
1c00860c:	01490913          	addi	s2,s2,20 # 10000014 <m_c>
1c008610:	4a81                	li	s5,0
1c008612:	4401                	li	s0,0
1c008614:	1c000a37          	lui	s4,0x1c000
1c008618:	90098993          	addi	s3,s3,-1792 # 900 <__rt_hyper_pending_emu_stride+0x658>
1c00861c:	0044a80b          	p.lw	a6,4(s1!)
1c008620:	0049270b          	p.lw	a4,4(s2!)
1c008624:	85a2                	mv	a1,s0
1c008626:	8642                	mv	a2,a6
1c008628:	0405                	addi	s0,s0,1
1c00862a:	86ba                	mv	a3,a4
1c00862c:	43ca0513          	addi	a0,s4,1084 # 1c00043c <__DTOR_END__+0x150>
1c008630:	00e80563          	beq	a6,a4,1c00863a <cluster_entry+0x10a>
1c008634:	38a020ef          	jal	ra,1c00a9be <printf>
1c008638:	0a85                	addi	s5,s5,1
1c00863a:	ff3411e3          	bne	s0,s3,1c00861c <cluster_entry+0xec>
1c00863e:	0c0a8563          	beqz	s5,1c008708 <cluster_entry+0x1d8>
1c008642:	1c000537          	lui	a0,0x1c000
1c008646:	85d6                	mv	a1,s5
1c008648:	48850513          	addi	a0,a0,1160 # 1c000488 <__DTOR_END__+0x19c>
1c00864c:	372020ef          	jal	ra,1c00a9be <printf>
1c008650:	f14027f3          	csrr	a5,mhartid
1c008654:	477d                	li	a4,31
1c008656:	ca5797b3          	p.extractu	a5,a5,5,5
1c00865a:	0ae78263          	beq	a5,a4,1c0086fe <cluster_entry+0x1ce>
1c00865e:	102005b7          	lui	a1,0x10200
1c008662:	40058593          	addi	a1,a1,1024 # 10200400 <__l1_end+0x1fcdec>
1c008666:	0085a583          	lw	a1,8(a1)
1c00866a:	78102973          	csrr	s2,pccr1
1c00866e:	782024f3          	csrr	s1,pccr2
1c008672:	78f02473          	csrr	s0,pccr15
1c008676:	1c000537          	lui	a0,0x1c000
1c00867a:	49c50513          	addi	a0,a0,1180 # 1c00049c <__DTOR_END__+0x1b0>
1c00867e:	340020ef          	jal	ra,1c00a9be <printf>
1c008682:	1c000537          	lui	a0,0x1c000
1c008686:	85ca                	mv	a1,s2
1c008688:	4b050513          	addi	a0,a0,1200 # 1c0004b0 <__DTOR_END__+0x1c4>
1c00868c:	332020ef          	jal	ra,1c00a9be <printf>
1c008690:	1c000537          	lui	a0,0x1c000
1c008694:	85a6                	mv	a1,s1
1c008696:	4c450513          	addi	a0,a0,1220 # 1c0004c4 <__DTOR_END__+0x1d8>
1c00869a:	324020ef          	jal	ra,1c00a9be <printf>
1c00869e:	1c000537          	lui	a0,0x1c000
1c0086a2:	85a2                	mv	a1,s0
1c0086a4:	4d450513          	addi	a0,a0,1236 # 1c0004d4 <__DTOR_END__+0x1e8>
1c0086a8:	316020ef          	jal	ra,1c00a9be <printf>
1c0086ac:	1c000537          	lui	a0,0x1c000
1c0086b0:	000365b7          	lui	a1,0x36
1c0086b4:	4e450513          	addi	a0,a0,1252 # 1c0004e4 <__DTOR_END__+0x1f8>
1c0086b8:	306020ef          	jal	ra,1c00a9be <printf>
1c0086bc:	50b6                	lw	ra,108(sp)
1c0086be:	5426                	lw	s0,104(sp)
1c0086c0:	5496                	lw	s1,100(sp)
1c0086c2:	5906                	lw	s2,96(sp)
1c0086c4:	49f6                	lw	s3,92(sp)
1c0086c6:	4a66                	lw	s4,88(sp)
1c0086c8:	4ad6                	lw	s5,84(sp)
1c0086ca:	6165                	addi	sp,sp,112
1c0086cc:	8082                	ret
1c0086ce:	4785                	li	a5,1
1c0086d0:	1a10b737          	lui	a4,0x1a10b
1c0086d4:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa107a0c>
1c0086d8:	4781                	li	a5,0
1c0086da:	79f79073          	csrw	pccr31,a5
1c0086de:	f14027f3          	csrr	a5,mhartid
1c0086e2:	477d                	li	a4,31
1c0086e4:	ca5797b3          	p.extractu	a5,a5,5,5
1c0086e8:	ece795e3          	bne	a5,a4,1c0085b2 <cluster_entry+0x82>
1c0086ec:	4785                	li	a5,1
1c0086ee:	1a10b737          	lui	a4,0x1a10b
1c0086f2:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa107a04>
1c0086f6:	478d                	li	a5,3
1c0086f8:	7a179073          	csrw	pcmr,a5
1c0086fc:	b5e9                	j	1c0085c6 <cluster_entry+0x96>
1c0086fe:	1a10b5b7          	lui	a1,0x1a10b
1c008702:	0085a583          	lw	a1,8(a1) # 1a10b008 <__l1_end+0xa1079f4>
1c008706:	b795                	j	1c00866a <cluster_entry+0x13a>
1c008708:	1c000537          	lui	a0,0x1c000
1c00870c:	47450513          	addi	a0,a0,1140 # 1c000474 <__DTOR_END__+0x188>
1c008710:	1ae020ef          	jal	ra,1c00a8be <puts>
1c008714:	bf35                	j	1c008650 <cluster_entry+0x120>
1c008716:	1c000537          	lui	a0,0x1c000
1c00871a:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c00871e:	1a0020ef          	jal	ra,1c00a8be <puts>
1c008722:	b73d                	j	1c008650 <cluster_entry+0x120>
1c008724:	1a10b7b7          	lui	a5,0x1a10b
1c008728:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa1079ec>
1c00872c:	4781                	li	a5,0
1c00872e:	7a179073          	csrw	pcmr,a5
1c008732:	bdd1                	j	1c008606 <cluster_entry+0xd6>

1c008734 <plp_mat_mult_i8v_xpulpv2>:
1c008734:	7175                	addi	sp,sp,-144
1c008736:	00165293          	srli	t0,a2,0x1
1c00873a:	c722                	sw	s0,140(sp)
1c00873c:	c526                	sw	s1,136(sp)
1c00873e:	c34a                	sw	s2,132(sp)
1c008740:	c14e                	sw	s3,128(sp)
1c008742:	ded2                	sw	s4,124(sp)
1c008744:	dcd6                	sw	s5,120(sp)
1c008746:	dada                	sw	s6,116(sp)
1c008748:	d8de                	sw	s7,112(sp)
1c00874a:	d6e2                	sw	s8,108(sp)
1c00874c:	d4e6                	sw	s9,104(sp)
1c00874e:	d2ea                	sw	s10,100(sp)
1c008750:	d0ee                	sw	s11,96(sp)
1c008752:	c8b2                	sw	a2,80(sp)
1c008754:	dc16                	sw	t0,56(sp)
1c008756:	de2a                	sw	a0,60(sp)
1c008758:	da2e                	sw	a1,52(sp)
1c00875a:	d036                	sw	a3,32(sp)
1c00875c:	ca3a                	sw	a4,20(sp)
1c00875e:	ccbe                	sw	a5,88(sp)
1c008760:	3c028b63          	beqz	t0,1c008b36 <plp_mat_mult_i8v_xpulpv2+0x402>
1c008764:	00275313          	srli	t1,a4,0x2
1c008768:	863e                	mv	a2,a5
1c00876a:	00231793          	slli	a5,t1,0x2
1c00876e:	97ae                	add	a5,a5,a1
1c008770:	cebe                	sw	a5,92(sp)
1c008772:	1c0007b7          	lui	a5,0x1c000
1c008776:	4f47ad03          	lw	s10,1268(a5) # 1c0004f4 <__DTOR_END__+0x208>
1c00877a:	1c0007b7          	lui	a5,0x1c000
1c00877e:	0026d393          	srli	t2,a3,0x2
1c008782:	4f87ac83          	lw	s9,1272(a5) # 1c0004f8 <__DTOR_END__+0x20c>
1c008786:	1c0007b7          	lui	a5,0x1c000
1c00878a:	84ba                	mv	s1,a4
1c00878c:	89b6                	mv	s3,a3
1c00878e:	82ba                	mv	t0,a4
1c008790:	4fc7ac03          	lw	s8,1276(a5) # 1c0004fc <__DTOR_END__+0x210>
1c008794:	00239713          	slli	a4,t2,0x2
1c008798:	048e                	slli	s1,s1,0x3
1c00879a:	0686                	slli	a3,a3,0x1
1c00879c:	99aa                	add	s3,s3,a0
1c00879e:	972a                	add	a4,a4,a0
1c0087a0:	c69a                	sw	t1,76(sp)
1c0087a2:	d41e                	sw	t2,40(sp)
1c0087a4:	caa6                	sw	s1,84(sp)
1c0087a6:	c0b2                	sw	a2,64(sp)
1c0087a8:	c2b6                	sw	a3,68(sp)
1c0087aa:	d22a                	sw	a0,36(sp)
1c0087ac:	d84e                	sw	s3,48(sp)
1c0087ae:	d63a                	sw	a4,44(sp)
1c0087b0:	00229d93          	slli	s11,t0,0x2
1c0087b4:	c482                	sw	zero,72(sp)
1c0087b6:	42b6                	lw	t0,76(sp)
1c0087b8:	1e028963          	beqz	t0,1c0089aa <plp_mat_mult_i8v_xpulpv2+0x276>
1c0087bc:	53d2                	lw	t2,52(sp)
1c0087be:	4376                	lw	t1,92(sp)
1c0087c0:	4486                	lw	s1,64(sp)
1c0087c2:	4606                	lw	a2,64(sp)
1c0087c4:	407307b3          	sub	a5,t1,t2
1c0087c8:	17f1                	addi	a5,a5,-4
1c0087ca:	8389                	srli	a5,a5,0x2
1c0087cc:	94ee                	add	s1,s1,s11
1c0087ce:	0785                	addi	a5,a5,1
1c0087d0:	c626                	sw	s1,12(sp)
1c0087d2:	cc1e                	sw	t2,24(sp)
1c0087d4:	c832                	sw	a2,16(sp)
1c0087d6:	ce3e                	sw	a5,28(sp)
1c0087d8:	59a2                	lw	s3,40(sp)
1c0087da:	1a098e63          	beqz	s3,1c008996 <plp_mat_mult_i8v_xpulpv2+0x262>
1c0087de:	5392                	lw	t2,36(sp)
1c0087e0:	5332                	lw	t1,44(sp)
1c0087e2:	44d2                	lw	s1,20(sp)
1c0087e4:	4662                	lw	a2,24(sp)
1c0087e6:	40730533          	sub	a0,t1,t2
1c0087ea:	1571                	addi	a0,a0,-4
1c0087ec:	00c489b3          	add	s3,s1,a2
1c0087f0:	5ac2                	lw	s5,48(sp)
1c0087f2:	01348933          	add	s2,s1,s3
1c0087f6:	8109                	srli	a0,a0,0x2
1c0087f8:	00990bb3          	add	s7,s2,s1
1c0087fc:	8a1e                	mv	s4,t2
1c0087fe:	8b32                	mv	s6,a2
1c008800:	4481                	li	s1,0
1c008802:	4401                	li	s0,0
1c008804:	4381                	li	t2,0
1c008806:	4281                	li	t0,0
1c008808:	4f81                	li	t6,0
1c00880a:	4f01                	li	t5,0
1c00880c:	4e81                	li	t4,0
1c00880e:	4e01                	li	t3,0
1c008810:	0505                	addi	a0,a0,1
1c008812:	036540fb          	lp.setup	x1,a0,1c00887e <plp_mat_mult_i8v_xpulpv2+0x14a>
1c008816:	21bb768b          	p.lw	a3,s11(s6!)
1c00881a:	21b9f30b          	p.lw	t1,s11(s3!)
1c00881e:	21b9758b          	p.lw	a1,s11(s2!)
1c008822:	8636                	mv	a2,a3
1c008824:	c9a31657          	pv.shuffle2.b	a2,t1,s10
1c008828:	c99316d7          	pv.shuffle2.b	a3,t1,s9
1c00882c:	1c000337          	lui	t1,0x1c000
1c008830:	21bbf88b          	p.lw	a7,s11(s7!)
1c008834:	50030313          	addi	t1,t1,1280 # 1c000500 <__DTOR_END__+0x214>
1c008838:	00032303          	lw	t1,0(t1)
1c00883c:	882e                	mv	a6,a1
1c00883e:	004a270b          	p.lw	a4,4(s4!)
1c008842:	004aa78b          	p.lw	a5,4(s5!)
1c008846:	c9a89857          	pv.shuffle2.b	a6,a7,s10
1c00884a:	c99895d7          	pv.shuffle2.b	a1,a7,s9
1c00884e:	88b2                	mv	a7,a2
1c008850:	c98818d7          	pv.shuffle2.b	a7,a6,s8
1c008854:	c8681657          	pv.shuffle2.b	a2,a6,t1
1c008858:	8836                	mv	a6,a3
1c00885a:	c9859857          	pv.shuffle2.b	a6,a1,s8
1c00885e:	c86596d7          	pv.shuffle2.b	a3,a1,t1
1c008862:	b9171e57          	pv.sdotsp.b	t3,a4,a7
1c008866:	b8c71ed7          	pv.sdotsp.b	t4,a4,a2
1c00886a:	b9071f57          	pv.sdotsp.b	t5,a4,a6
1c00886e:	b8d71fd7          	pv.sdotsp.b	t6,a4,a3
1c008872:	b91792d7          	pv.sdotsp.b	t0,a5,a7
1c008876:	b8c793d7          	pv.sdotsp.b	t2,a5,a2
1c00887a:	b9079457          	pv.sdotsp.b	s0,a5,a6
1c00887e:	b8d794d7          	pv.sdotsp.b	s1,a5,a3
1c008882:	5822                	lw	a6,40(sp)
1c008884:	4642                	lw	a2,16(sp)
1c008886:	46b2                	lw	a3,12(sp)
1c008888:	4762                	lw	a4,24(sp)
1c00888a:	47f2                	lw	a5,28(sp)
1c00888c:	01c62023          	sw	t3,0(a2) # 90000000 <pulp__FC+0x90000001>
1c008890:	01d62223          	sw	t4,4(a2)
1c008894:	01e62423          	sw	t5,8(a2)
1c008898:	01f62623          	sw	t6,12(a2)
1c00889c:	0056a023          	sw	t0,0(a3)
1c0088a0:	0076a223          	sw	t2,4(a3)
1c0088a4:	c680                	sw	s0,8(a3)
1c0088a6:	c6c4                	sw	s1,12(a3)
1c0088a8:	0641                	addi	a2,a2,16
1c0088aa:	06c1                	addi	a3,a3,16
1c0088ac:	0711                	addi	a4,a4,4
1c0088ae:	17fd                	addi	a5,a5,-1
1c0088b0:	c832                	sw	a2,16(sp)
1c0088b2:	c636                	sw	a3,12(sp)
1c0088b4:	cc3a                	sw	a4,24(sp)
1c0088b6:	ce3e                	sw	a5,28(sp)
1c0088b8:	f385                	bnez	a5,1c0087d8 <plp_mat_mult_i8v_xpulpv2+0xa4>
1c0088ba:	4536                	lw	a0,76(sp)
1c0088bc:	4616                	lw	a2,68(sp)
1c0088be:	42a6                	lw	t0,72(sp)
1c0088c0:	4306                	lw	t1,64(sp)
1c0088c2:	5492                	lw	s1,36(sp)
1c0088c4:	56c2                	lw	a3,48(sp)
1c0088c6:	5732                	lw	a4,44(sp)
1c0088c8:	43d6                	lw	t2,84(sp)
1c0088ca:	59e2                	lw	s3,56(sp)
1c0088cc:	0285                	addi	t0,t0,1
1c0088ce:	931e                	add	t1,t1,t2
1c0088d0:	94b2                	add	s1,s1,a2
1c0088d2:	96b2                	add	a3,a3,a2
1c0088d4:	9732                	add	a4,a4,a2
1c0088d6:	c496                	sw	t0,72(sp)
1c0088d8:	c09a                	sw	t1,64(sp)
1c0088da:	d226                	sw	s1,36(sp)
1c0088dc:	d836                	sw	a3,48(sp)
1c0088de:	d63a                	sw	a4,44(sp)
1c0088e0:	ec599be3          	bne	s3,t0,1c0087b6 <plp_mat_mult_i8v_xpulpv2+0x82>
1c0088e4:	42c6                	lw	t0,80(sp)
1c0088e6:	0986                	slli	s3,s3,0x1
1c0088e8:	dc4e                	sw	s3,56(sp)
1c0088ea:	080a                	slli	a6,a6,0x2
1c0088ec:	050a                	slli	a0,a0,0x2
1c0088ee:	0d328063          	beq	t0,s3,1c0089ae <plp_mat_mult_i8v_xpulpv2+0x27a>
1c0088f2:	e961                	bnez	a0,1c0089c2 <plp_mat_mult_i8v_xpulpv2+0x28e>
1c0088f4:	5662                	lw	a2,56(sp)
1c0088f6:	49c6                	lw	s3,80(sp)
1c0088f8:	09367163          	bleu	s3,a2,1c00897a <plp_mat_mult_i8v_xpulpv2+0x246>
1c0088fc:	5302                	lw	t1,32(sp)
1c0088fe:	52f2                	lw	t0,60(sp)
1c008900:	43d2                	lw	t2,20(sp)
1c008902:	00628fb3          	add	t6,t0,t1
1c008906:	8e7e                	mv	t3,t6
1c008908:	02760f33          	mul	t5,a2,t2
1c00890c:	42660e33          	p.mac	t3,a2,t1
1c008910:	42d2                	lw	t0,20(sp)
1c008912:	04557a63          	bleu	t0,a0,1c008966 <plp_mat_mult_i8v_xpulpv2+0x232>
1c008916:	43e6                	lw	t2,88(sp)
1c008918:	01e50333          	add	t1,a0,t5
1c00891c:	030a                	slli	t1,t1,0x2
1c00891e:	41fe0eb3          	sub	t4,t3,t6
1c008922:	931e                	add	t1,t1,t2
1c008924:	40a288b3          	sub	a7,t0,a0
1c008928:	01e8c07b          	lp.setup	x0,a7,1c008964 <plp_mat_mult_i8v_xpulpv2+0x230>
1c00892c:	5382                	lw	t2,32(sp)
1c00892e:	4681                	li	a3,0
1c008930:	02787863          	bleu	t2,a6,1c008960 <plp_mat_mult_i8v_xpulpv2+0x22c>
1c008934:	44d2                	lw	s1,20(sp)
1c008936:	872a                	mv	a4,a0
1c008938:	5672                	lw	a2,60(sp)
1c00893a:	43048733          	p.mac	a4,s1,a6
1c00893e:	59d2                	lw	s3,52(sp)
1c008940:	9876                	add	a6,a6,t4
1c008942:	9832                	add	a6,a6,a2
1c008944:	4681                	li	a3,0
1c008946:	410e07b3          	sub	a5,t3,a6
1c00894a:	82a6                	mv	t0,s1
1c00894c:	974e                	add	a4,a4,s3
1c00894e:	0067c0fb          	lp.setup	x1,a5,1c00895a <plp_mat_mult_i8v_xpulpv2+0x226>
1c008952:	0018060b          	p.lb	a2,1(a6!)
1c008956:	0057758b          	p.lb	a1,t0(a4!)
1c00895a:	42c586b3          	p.mac	a3,a1,a2
1c00895e:	5802                	lw	a6,32(sp)
1c008960:	00d3222b          	p.sw	a3,4(t1!)
1c008964:	0505                	addi	a0,a0,1
1c008966:	54e2                	lw	s1,56(sp)
1c008968:	4652                	lw	a2,20(sp)
1c00896a:	5682                	lw	a3,32(sp)
1c00896c:	49c6                	lw	s3,80(sp)
1c00896e:	0485                	addi	s1,s1,1
1c008970:	dc26                	sw	s1,56(sp)
1c008972:	9f32                	add	t5,t5,a2
1c008974:	9e36                	add	t3,t3,a3
1c008976:	f8999de3          	bne	s3,s1,1c008910 <plp_mat_mult_i8v_xpulpv2+0x1dc>
1c00897a:	443a                	lw	s0,140(sp)
1c00897c:	44aa                	lw	s1,136(sp)
1c00897e:	491a                	lw	s2,132(sp)
1c008980:	498a                	lw	s3,128(sp)
1c008982:	5a76                	lw	s4,124(sp)
1c008984:	5ae6                	lw	s5,120(sp)
1c008986:	5b56                	lw	s6,116(sp)
1c008988:	5bc6                	lw	s7,112(sp)
1c00898a:	5c36                	lw	s8,108(sp)
1c00898c:	5ca6                	lw	s9,104(sp)
1c00898e:	5d16                	lw	s10,100(sp)
1c008990:	5d86                	lw	s11,96(sp)
1c008992:	6149                	addi	sp,sp,144
1c008994:	8082                	ret
1c008996:	4801                	li	a6,0
1c008998:	4481                	li	s1,0
1c00899a:	4401                	li	s0,0
1c00899c:	4381                	li	t2,0
1c00899e:	4281                	li	t0,0
1c0089a0:	4f81                	li	t6,0
1c0089a2:	4f01                	li	t5,0
1c0089a4:	4e81                	li	t4,0
1c0089a6:	4e01                	li	t3,0
1c0089a8:	bdf1                	j	1c008884 <plp_mat_mult_i8v_xpulpv2+0x150>
1c0089aa:	4501                	li	a0,0
1c0089ac:	bf01                	j	1c0088bc <plp_mat_mult_i8v_xpulpv2+0x188>
1c0089ae:	5302                	lw	t1,32(sp)
1c0089b0:	f46811e3          	bne	a6,t1,1c0088f2 <plp_mat_mult_i8v_xpulpv2+0x1be>
1c0089b4:	44d2                	lw	s1,20(sp)
1c0089b6:	fca482e3          	beq	s1,a0,1c00897a <plp_mat_mult_i8v_xpulpv2+0x246>
1c0089ba:	5362                	lw	t1,56(sp)
1c0089bc:	fa030fe3          	beqz	t1,1c00897a <plp_mat_mult_i8v_xpulpv2+0x246>
1c0089c0:	bf0d                	j	1c0088f2 <plp_mat_mult_i8v_xpulpv2+0x1be>
1c0089c2:	f20809e3          	beqz	a6,1c0088f4 <plp_mat_mult_i8v_xpulpv2+0x1c0>
1c0089c6:	5482                	lw	s1,32(sp)
1c0089c8:	08980263          	beq	a6,s1,1c008a4c <plp_mat_mult_i8v_xpulpv2+0x318>
1c0089cc:	59f2                	lw	s3,60(sp)
1c0089ce:	4652                	lw	a2,20(sp)
1c0089d0:	46e6                	lw	a3,88(sp)
1c0089d2:	00998fb3          	add	t6,s3,s1
1c0089d6:	54d2                	lw	s1,52(sp)
1c0089d8:	00251293          	slli	t0,a0,0x2
1c0089dc:	40a00433          	neg	s0,a0
1c0089e0:	42c804b3          	p.mac	s1,a6,a2
1c0089e4:	00261913          	slli	s2,a2,0x2
1c0089e8:	92b6                	add	t0,t0,a3
1c0089ea:	01098f33          	add	t5,s3,a6
1c0089ee:	040a                	slli	s0,s0,0x2
1c0089f0:	4381                	li	t2,0
1c0089f2:	00540e33          	add	t3,s0,t0
1c0089f6:	41c28333          	sub	t1,t0,t3
1c0089fa:	1371                	addi	t1,t1,-4
1c0089fc:	00235313          	srli	t1,t1,0x2
1c008a00:	8ea6                	mv	t4,s1
1c008a02:	0305                	addi	t1,t1,1
1c008a04:	01a3407b          	lp.setup	x0,t1,1c008a38 <plp_mat_mult_i8v_xpulpv2+0x304>
1c008a08:	5602                	lw	a2,32(sp)
1c008a0a:	4781                	li	a5,0
1c008a0c:	02c87263          	bleu	a2,a6,1c008a30 <plp_mat_mult_i8v_xpulpv2+0x2fc>
1c008a10:	8676                	mv	a2,t4
1c008a12:	86fa                	mv	a3,t5
1c008a14:	4781                	li	a5,0
1c008a16:	41ef8733          	sub	a4,t6,t5
1c008a1a:	00a740fb          	lp.setup	x1,a4,1c008a2e <plp_mat_mult_i8v_xpulpv2+0x2fa>
1c008a1e:	49d2                	lw	s3,20(sp)
1c008a20:	0016858b          	p.lb	a1,1(a3!)
1c008a24:	0136788b          	p.lb	a7,s3(a2!)
1c008a28:	89be                	mv	s3,a5
1c008a2a:	42b889b3          	p.mac	s3,a7,a1
1c008a2e:	97ce                	add	a5,a5,s3
1c008a30:	000e2703          	lw	a4,0(t3)
1c008a34:	0e85                	addi	t4,t4,1
1c008a36:	97ba                	add	a5,a5,a4
1c008a38:	00fe222b          	p.sw	a5,4(t3!)
1c008a3c:	5682                	lw	a3,32(sp)
1c008a3e:	59e2                	lw	s3,56(sp)
1c008a40:	0385                	addi	t2,t2,1
1c008a42:	92ca                	add	t0,t0,s2
1c008a44:	9f36                	add	t5,t5,a3
1c008a46:	9fb6                	add	t6,t6,a3
1c008a48:	fb33e5e3          	bltu	t2,s3,1c0089f2 <plp_mat_mult_i8v_xpulpv2+0x2be>
1c008a4c:	42d2                	lw	t0,20(sp)
1c008a4e:	06550663          	beq	a0,t0,1c008aba <plp_mat_mult_i8v_xpulpv2+0x386>
1c008a52:	06557463          	bleu	t0,a0,1c008aba <plp_mat_mult_i8v_xpulpv2+0x386>
1c008a56:	43e6                	lw	t2,88(sp)
1c008a58:	5652                	lw	a2,52(sp)
1c008a5a:	5482                	lw	s1,32(sp)
1c008a5c:	5e72                	lw	t3,60(sp)
1c008a5e:	8316                	mv	t1,t0
1c008a60:	00251293          	slli	t0,a0,0x2
1c008a64:	929e                	add	t0,t0,t2
1c008a66:	00231413          	slli	s0,t1,0x2
1c008a6a:	01c48fb3          	add	t6,s1,t3
1c008a6e:	4381                	li	t2,0
1c008a70:	9532                	add	a0,a0,a2
1c008a72:	00660eb3          	add	t4,a2,t1
1c008a76:	832a                	mv	t1,a0
1c008a78:	8f16                	mv	t5,t0
1c008a7a:	40ae88b3          	sub	a7,t4,a0
1c008a7e:	0158c07b          	lp.setup	x0,a7,1c008aa8 <plp_mat_mult_i8v_xpulpv2+0x374>
1c008a82:	5602                	lw	a2,32(sp)
1c008a84:	4701                	li	a4,0
1c008a86:	ce19                	beqz	a2,1c008aa4 <plp_mat_mult_i8v_xpulpv2+0x370>
1c008a88:	44d2                	lw	s1,20(sp)
1c008a8a:	861a                	mv	a2,t1
1c008a8c:	86f2                	mv	a3,t3
1c008a8e:	4701                	li	a4,0
1c008a90:	41cf87b3          	sub	a5,t6,t3
1c008a94:	0067c0fb          	lp.setup	x1,a5,1c008aa0 <plp_mat_mult_i8v_xpulpv2+0x36c>
1c008a98:	0016858b          	p.lb	a1,1(a3!)
1c008a9c:	0096780b          	p.lb	a6,s1(a2!)
1c008aa0:	42b80733          	p.mac	a4,a6,a1
1c008aa4:	00ef222b          	p.sw	a4,4(t5!)
1c008aa8:	0305                	addi	t1,t1,1
1c008aaa:	5682                	lw	a3,32(sp)
1c008aac:	59e2                	lw	s3,56(sp)
1c008aae:	0385                	addi	t2,t2,1
1c008ab0:	92a2                	add	t0,t0,s0
1c008ab2:	9e36                	add	t3,t3,a3
1c008ab4:	9fb6                	add	t6,t6,a3
1c008ab6:	fd33e0e3          	bltu	t2,s3,1c008a76 <plp_mat_mult_i8v_xpulpv2+0x342>
1c008aba:	42c6                	lw	t0,80(sp)
1c008abc:	5362                	lw	t1,56(sp)
1c008abe:	ea537ee3          	bleu	t0,t1,1c00897a <plp_mat_mult_i8v_xpulpv2+0x246>
1c008ac2:	43d2                	lw	t2,20(sp)
1c008ac4:	ea038be3          	beqz	t2,1c00897a <plp_mat_mult_i8v_xpulpv2+0x246>
1c008ac8:	5482                	lw	s1,32(sp)
1c008aca:	4fe6                	lw	t6,88(sp)
1c008acc:	00239293          	slli	t0,t2,0x2
1c008ad0:	026487b3          	mul	a5,s1,t1
1c008ad4:	5672                	lw	a2,60(sp)
1c008ad6:	59d2                	lw	s3,52(sp)
1c008ad8:	00960f33          	add	t5,a2,s1
1c008adc:	00798eb3          	add	t4,s3,t2
1c008ae0:	42530fb3          	p.mac	t6,t1,t0
1c008ae4:	00f60e33          	add	t3,a2,a5
1c008ae8:	9f3e                	add	t5,t5,a5
1c008aea:	58d2                	lw	a7,52(sp)
1c008aec:	837e                	mv	t1,t6
1c008aee:	411e8833          	sub	a6,t4,a7
1c008af2:	0168407b          	lp.setup	x0,a6,1c008b1e <plp_mat_mult_i8v_xpulpv2+0x3ea>
1c008af6:	5382                	lw	t2,32(sp)
1c008af8:	4701                	li	a4,0
1c008afa:	02038063          	beqz	t2,1c008b1a <plp_mat_mult_i8v_xpulpv2+0x3e6>
1c008afe:	49d2                	lw	s3,20(sp)
1c008b00:	8646                	mv	a2,a7
1c008b02:	86f2                	mv	a3,t3
1c008b04:	4701                	li	a4,0
1c008b06:	41cf07b3          	sub	a5,t5,t3
1c008b0a:	0067c0fb          	lp.setup	x1,a5,1c008b16 <plp_mat_mult_i8v_xpulpv2+0x3e2>
1c008b0e:	0016858b          	p.lb	a1,1(a3!)
1c008b12:	0136750b          	p.lb	a0,s3(a2!)
1c008b16:	42b50733          	p.mac	a4,a0,a1
1c008b1a:	00e3222b          	p.sw	a4,4(t1!)
1c008b1e:	0885                	addi	a7,a7,1
1c008b20:	54e2                	lw	s1,56(sp)
1c008b22:	5602                	lw	a2,32(sp)
1c008b24:	49c6                	lw	s3,80(sp)
1c008b26:	0485                	addi	s1,s1,1
1c008b28:	dc26                	sw	s1,56(sp)
1c008b2a:	9f96                	add	t6,t6,t0
1c008b2c:	9e32                	add	t3,t3,a2
1c008b2e:	9f32                	add	t5,t5,a2
1c008b30:	fa999de3          	bne	s3,s1,1c008aea <plp_mat_mult_i8v_xpulpv2+0x3b6>
1c008b34:	b599                	j	1c00897a <plp_mat_mult_i8v_xpulpv2+0x246>
1c008b36:	82b2                	mv	t0,a2
1c008b38:	4801                	li	a6,0
1c008b3a:	4501                	li	a0,0
1c008b3c:	da061ce3          	bnez	a2,1c0088f4 <plp_mat_mult_i8v_xpulpv2+0x1c0>
1c008b40:	e3069de3          	bne	a3,a6,1c00897a <plp_mat_mult_i8v_xpulpv2+0x246>
1c008b44:	dc16                	sw	t0,56(sp)
1c008b46:	84ba                	mv	s1,a4
1c008b48:	b5bd                	j	1c0089b6 <plp_mat_mult_i8v_xpulpv2+0x282>

1c008b4a <main>:
1c008b4a:	1101                	addi	sp,sp,-32
1c008b4c:	4681                	li	a3,0
1c008b4e:	4601                	li	a2,0
1c008b50:	4581                	li	a1,0
1c008b52:	4505                	li	a0,1
1c008b54:	ce06                	sw	ra,28(sp)
1c008b56:	2559                	jal	1c0091dc <rt_cluster_mount>
1c008b58:	1c008637          	lui	a2,0x1c008
1c008b5c:	4881                	li	a7,0
1c008b5e:	4801                	li	a6,0
1c008b60:	4781                	li	a5,0
1c008b62:	4701                	li	a4,0
1c008b64:	4681                	li	a3,0
1c008b66:	53060613          	addi	a2,a2,1328 # 1c008530 <cluster_entry>
1c008b6a:	4581                	li	a1,0
1c008b6c:	c002                	sw	zero,0(sp)
1c008b6e:	4501                	li	a0,0
1c008b70:	2bc9                	jal	1c009142 <rt_cluster_call>
1c008b72:	4501                	li	a0,0
1c008b74:	4681                	li	a3,0
1c008b76:	4601                	li	a2,0
1c008b78:	4581                	li	a1,0
1c008b7a:	258d                	jal	1c0091dc <rt_cluster_mount>
1c008b7c:	40f2                	lw	ra,28(sp)
1c008b7e:	4501                	li	a0,0
1c008b80:	6105                	addi	sp,sp,32
1c008b82:	8082                	ret

1c008b84 <rt_user_alloc_init>:
1c008b84:	00758793          	addi	a5,a1,7
1c008b88:	9be1                	andi	a5,a5,-8
1c008b8a:	40b785b3          	sub	a1,a5,a1
1c008b8e:	c11c                	sw	a5,0(a0)
1c008b90:	8e0d                	sub	a2,a2,a1
1c008b92:	00c05663          	blez	a2,1c008b9e <rt_user_alloc_init+0x1a>
1c008b96:	9a61                	andi	a2,a2,-8
1c008b98:	c390                	sw	a2,0(a5)
1c008b9a:	0007a223          	sw	zero,4(a5)
1c008b9e:	8082                	ret

1c008ba0 <rt_user_alloc>:
1c008ba0:	411c                	lw	a5,0(a0)
1c008ba2:	059d                	addi	a1,a1,7
1c008ba4:	99e1                	andi	a1,a1,-8
1c008ba6:	4681                	li	a3,0
1c008ba8:	cb89                	beqz	a5,1c008bba <rt_user_alloc+0x1a>
1c008baa:	4398                	lw	a4,0(a5)
1c008bac:	00b74963          	blt	a4,a1,1c008bbe <rt_user_alloc+0x1e>
1c008bb0:	00b71c63          	bne	a4,a1,1c008bc8 <rt_user_alloc+0x28>
1c008bb4:	43d8                	lw	a4,4(a5)
1c008bb6:	c699                	beqz	a3,1c008bc4 <rt_user_alloc+0x24>
1c008bb8:	c2d8                	sw	a4,4(a3)
1c008bba:	853e                	mv	a0,a5
1c008bbc:	8082                	ret
1c008bbe:	86be                	mv	a3,a5
1c008bc0:	43dc                	lw	a5,4(a5)
1c008bc2:	b7dd                	j	1c008ba8 <rt_user_alloc+0x8>
1c008bc4:	c118                	sw	a4,0(a0)
1c008bc6:	bfd5                	j	1c008bba <rt_user_alloc+0x1a>
1c008bc8:	8f0d                	sub	a4,a4,a1
1c008bca:	c398                	sw	a4,0(a5)
1c008bcc:	97ba                	add	a5,a5,a4
1c008bce:	b7f5                	j	1c008bba <rt_user_alloc+0x1a>

1c008bd0 <rt_user_free>:
1c008bd0:	411c                	lw	a5,0(a0)
1c008bd2:	061d                	addi	a2,a2,7
1c008bd4:	9a61                	andi	a2,a2,-8
1c008bd6:	4701                	li	a4,0
1c008bd8:	c399                	beqz	a5,1c008bde <rt_user_free+0xe>
1c008bda:	02b7e763          	bltu	a5,a1,1c008c08 <rt_user_free+0x38>
1c008bde:	00c586b3          	add	a3,a1,a2
1c008be2:	02d79663          	bne	a5,a3,1c008c0e <rt_user_free+0x3e>
1c008be6:	4394                	lw	a3,0(a5)
1c008be8:	43dc                	lw	a5,4(a5)
1c008bea:	9636                	add	a2,a2,a3
1c008bec:	c190                	sw	a2,0(a1)
1c008bee:	c1dc                	sw	a5,4(a1)
1c008bf0:	c31d                	beqz	a4,1c008c16 <rt_user_free+0x46>
1c008bf2:	4314                	lw	a3,0(a4)
1c008bf4:	00d707b3          	add	a5,a4,a3
1c008bf8:	00f59d63          	bne	a1,a5,1c008c12 <rt_user_free+0x42>
1c008bfc:	419c                	lw	a5,0(a1)
1c008bfe:	97b6                	add	a5,a5,a3
1c008c00:	c31c                	sw	a5,0(a4)
1c008c02:	41dc                	lw	a5,4(a1)
1c008c04:	c35c                	sw	a5,4(a4)
1c008c06:	8082                	ret
1c008c08:	873e                	mv	a4,a5
1c008c0a:	43dc                	lw	a5,4(a5)
1c008c0c:	b7f1                	j	1c008bd8 <rt_user_free+0x8>
1c008c0e:	c190                	sw	a2,0(a1)
1c008c10:	bff9                	j	1c008bee <rt_user_free+0x1e>
1c008c12:	c34c                	sw	a1,4(a4)
1c008c14:	8082                	ret
1c008c16:	c10c                	sw	a1,0(a0)
1c008c18:	8082                	ret

1c008c1a <rt_alloc>:
1c008c1a:	1101                	addi	sp,sp,-32
1c008c1c:	cc22                	sw	s0,24(sp)
1c008c1e:	ce06                	sw	ra,28(sp)
1c008c20:	ca26                	sw	s1,20(sp)
1c008c22:	c84a                	sw	s2,16(sp)
1c008c24:	c64e                	sw	s3,12(sp)
1c008c26:	c452                	sw	s4,8(sp)
1c008c28:	4789                	li	a5,2
1c008c2a:	842a                	mv	s0,a0
1c008c2c:	02a7ed63          	bltu	a5,a0,1c008c66 <rt_alloc+0x4c>
1c008c30:	1c001937          	lui	s2,0x1c001
1c008c34:	89ae                	mv	s3,a1
1c008c36:	448d                	li	s1,3
1c008c38:	1b890913          	addi	s2,s2,440 # 1c0011b8 <__rt_alloc_l2>
1c008c3c:	4a0d                	li	s4,3
1c008c3e:	00241513          	slli	a0,s0,0x2
1c008c42:	85ce                	mv	a1,s3
1c008c44:	954a                	add	a0,a0,s2
1c008c46:	3fa9                	jal	1c008ba0 <rt_user_alloc>
1c008c48:	e519                	bnez	a0,1c008c56 <rt_alloc+0x3c>
1c008c4a:	0405                	addi	s0,s0,1
1c008c4c:	01441363          	bne	s0,s4,1c008c52 <rt_alloc+0x38>
1c008c50:	4401                	li	s0,0
1c008c52:	14fd                	addi	s1,s1,-1
1c008c54:	f4ed                	bnez	s1,1c008c3e <rt_alloc+0x24>
1c008c56:	40f2                	lw	ra,28(sp)
1c008c58:	4462                	lw	s0,24(sp)
1c008c5a:	44d2                	lw	s1,20(sp)
1c008c5c:	4942                	lw	s2,16(sp)
1c008c5e:	49b2                	lw	s3,12(sp)
1c008c60:	4a22                	lw	s4,8(sp)
1c008c62:	6105                	addi	sp,sp,32
1c008c64:	8082                	ret
1c008c66:	1c0017b7          	lui	a5,0x1c001
1c008c6a:	ffd50413          	addi	s0,a0,-3
1c008c6e:	1b47a503          	lw	a0,436(a5) # 1c0011b4 <__rt_alloc_l1>
1c008c72:	040a                	slli	s0,s0,0x2
1c008c74:	40f2                	lw	ra,28(sp)
1c008c76:	9522                	add	a0,a0,s0
1c008c78:	4462                	lw	s0,24(sp)
1c008c7a:	44d2                	lw	s1,20(sp)
1c008c7c:	4942                	lw	s2,16(sp)
1c008c7e:	49b2                	lw	s3,12(sp)
1c008c80:	4a22                	lw	s4,8(sp)
1c008c82:	6105                	addi	sp,sp,32
1c008c84:	bf31                	j	1c008ba0 <rt_user_alloc>

1c008c86 <__rt_alloc_init_l1>:
1c008c86:	1c0017b7          	lui	a5,0x1c001
1c008c8a:	1b47a703          	lw	a4,436(a5) # 1c0011b4 <__rt_alloc_l1>
1c008c8e:	100037b7          	lui	a5,0x10003
1c008c92:	01651593          	slli	a1,a0,0x16
1c008c96:	6635                	lui	a2,0xd
1c008c98:	050a                	slli	a0,a0,0x2
1c008c9a:	61478793          	addi	a5,a5,1556 # 10003614 <__l1_end>
1c008c9e:	9ec60613          	addi	a2,a2,-1556 # c9ec <__l1_heap_size>
1c008ca2:	95be                	add	a1,a1,a5
1c008ca4:	953a                	add	a0,a0,a4
1c008ca6:	bdf9                	j	1c008b84 <rt_user_alloc_init>

1c008ca8 <__rt_alloc_init_l1_for_fc>:
1c008ca8:	100035b7          	lui	a1,0x10003
1c008cac:	01651793          	slli	a5,a0,0x16
1c008cb0:	61458593          	addi	a1,a1,1556 # 10003614 <__l1_end>
1c008cb4:	00b78733          	add	a4,a5,a1
1c008cb8:	050a                	slli	a0,a0,0x2
1c008cba:	0791                	addi	a5,a5,4
1c008cbc:	6635                	lui	a2,0xd
1c008cbe:	1c0016b7          	lui	a3,0x1c001
1c008cc2:	9e860613          	addi	a2,a2,-1560 # c9e8 <_l1_preload_size+0x93d8>
1c008cc6:	95be                	add	a1,a1,a5
1c008cc8:	953a                	add	a0,a0,a4
1c008cca:	1ae6aa23          	sw	a4,436(a3) # 1c0011b4 <__rt_alloc_l1>
1c008cce:	bd5d                	j	1c008b84 <rt_user_alloc_init>

1c008cd0 <__rt_allocs_init>:
1c008cd0:	1141                	addi	sp,sp,-16
1c008cd2:	1c0015b7          	lui	a1,0x1c001
1c008cd6:	c606                	sw	ra,12(sp)
1c008cd8:	20458793          	addi	a5,a1,516 # 1c001204 <__l2_priv0_end>
1c008cdc:	1c008637          	lui	a2,0x1c008
1c008ce0:	06c7ca63          	blt	a5,a2,1c008d54 <__rt_allocs_init+0x84>
1c008ce4:	4581                	li	a1,0
1c008ce6:	4601                	li	a2,0
1c008ce8:	1c001537          	lui	a0,0x1c001
1c008cec:	1b850513          	addi	a0,a0,440 # 1c0011b8 <__rt_alloc_l2>
1c008cf0:	3d51                	jal	1c008b84 <rt_user_alloc_init>
1c008cf2:	1c00b5b7          	lui	a1,0x1c00b
1c008cf6:	62858793          	addi	a5,a1,1576 # 1c00b628 <__l2_priv1_end>
1c008cfa:	1c010637          	lui	a2,0x1c010
1c008cfe:	04c7cf63          	blt	a5,a2,1c008d5c <__rt_allocs_init+0x8c>
1c008d02:	4581                	li	a1,0
1c008d04:	4601                	li	a2,0
1c008d06:	1c001537          	lui	a0,0x1c001
1c008d0a:	1bc50513          	addi	a0,a0,444 # 1c0011bc <__rt_alloc_l2+0x4>
1c008d0e:	3d9d                	jal	1c008b84 <rt_user_alloc_init>
1c008d10:	1c0135b7          	lui	a1,0x1c013
1c008d14:	79858793          	addi	a5,a1,1944 # 1c013798 <__l2_shared_end>
1c008d18:	1c080637          	lui	a2,0x1c080
1c008d1c:	1c001537          	lui	a0,0x1c001
1c008d20:	8e1d                	sub	a2,a2,a5
1c008d22:	79858593          	addi	a1,a1,1944
1c008d26:	1c050513          	addi	a0,a0,448 # 1c0011c0 <__rt_alloc_l2+0x8>
1c008d2a:	3da9                	jal	1c008b84 <rt_user_alloc_init>
1c008d2c:	f14027f3          	csrr	a5,mhartid
1c008d30:	8795                	srai	a5,a5,0x5
1c008d32:	03f7f793          	andi	a5,a5,63
1c008d36:	e789                	bnez	a5,1c008d40 <__rt_allocs_init+0x70>
1c008d38:	40b2                	lw	ra,12(sp)
1c008d3a:	4501                	li	a0,0
1c008d3c:	0141                	addi	sp,sp,16
1c008d3e:	b7ad                	j	1c008ca8 <__rt_alloc_init_l1_for_fc>
1c008d40:	4591                	li	a1,4
1c008d42:	4501                	li	a0,0
1c008d44:	3dd9                	jal	1c008c1a <rt_alloc>
1c008d46:	40b2                	lw	ra,12(sp)
1c008d48:	1c0017b7          	lui	a5,0x1c001
1c008d4c:	1aa7aa23          	sw	a0,436(a5) # 1c0011b4 <__rt_alloc_l1>
1c008d50:	0141                	addi	sp,sp,16
1c008d52:	8082                	ret
1c008d54:	8e1d                	sub	a2,a2,a5
1c008d56:	20458593          	addi	a1,a1,516
1c008d5a:	b779                	j	1c008ce8 <__rt_allocs_init+0x18>
1c008d5c:	8e1d                	sub	a2,a2,a5
1c008d5e:	62858593          	addi	a1,a1,1576
1c008d62:	b755                	j	1c008d06 <__rt_allocs_init+0x36>

1c008d64 <__rt_init_cluster_data>:
1c008d64:	04050793          	addi	a5,a0,64
1c008d68:	01679693          	slli	a3,a5,0x16
1c008d6c:	6705                	lui	a4,0x1
1c008d6e:	177d                	addi	a4,a4,-1
1c008d70:	00400793          	li	a5,4
1c008d74:	8ff9                	and	a5,a5,a4
1c008d76:	1c010737          	lui	a4,0x1c010
1c008d7a:	97b6                	add	a5,a5,a3
1c008d7c:	660d                	lui	a2,0x3
1c008d7e:	18870713          	addi	a4,a4,392 # 1c010188 <_l1_preload_start_inL2>
1c008d82:	61060613          	addi	a2,a2,1552 # 3610 <_l1_preload_size>
1c008d86:	8f99                	sub	a5,a5,a4
1c008d88:	00f705b3          	add	a1,a4,a5
1c008d8c:	02c04b63          	bgtz	a2,1c008dc2 <__rt_init_cluster_data+0x5e>
1c008d90:	02800713          	li	a4,40
1c008d94:	02e50733          	mul	a4,a0,a4
1c008d98:	1c0017b7          	lui	a5,0x1c001
1c008d9c:	1c878513          	addi	a0,a5,456 # 1c0011c8 <__rt_fc_cluster_data>
1c008da0:	002017b7          	lui	a5,0x201
1c008da4:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f4418>
1c008da8:	97b6                	add	a5,a5,a3
1c008daa:	953a                	add	a0,a0,a4
1c008dac:	c91c                	sw	a5,16(a0)
1c008dae:	6705                	lui	a4,0x1
1c008db0:	00400793          	li	a5,4
1c008db4:	177d                	addi	a4,a4,-1
1c008db6:	8ff9                	and	a5,a5,a4
1c008db8:	97b6                	add	a5,a5,a3
1c008dba:	00052423          	sw	zero,8(a0)
1c008dbe:	c95c                	sw	a5,20(a0)
1c008dc0:	8082                	ret
1c008dc2:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c008dc6:	1671                	addi	a2,a2,-4
1c008dc8:	0711                	addi	a4,a4,4
1c008dca:	0105a023          	sw	a6,0(a1)
1c008dce:	bf6d                	j	1c008d88 <__rt_init_cluster_data+0x24>

1c008dd0 <__rt_cluster_mount_step>:
1c008dd0:	7179                	addi	sp,sp,-48
1c008dd2:	d04a                	sw	s2,32(sp)
1c008dd4:	ce4e                	sw	s3,28(sp)
1c008dd6:	6785                	lui	a5,0x1
1c008dd8:	1c0089b7          	lui	s3,0x1c008
1c008ddc:	00400913          	li	s2,4
1c008de0:	17fd                	addi	a5,a5,-1
1c008de2:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c008de6:	d422                	sw	s0,40(sp)
1c008de8:	d606                	sw	ra,44(sp)
1c008dea:	d226                	sw	s1,36(sp)
1c008dec:	cc52                	sw	s4,24(sp)
1c008dee:	842a                	mv	s0,a0
1c008df0:	00f97933          	and	s2,s2,a5
1c008df4:	f009f993          	andi	s3,s3,-256
1c008df8:	4c5c                	lw	a5,28(s0)
1c008dfa:	4705                	li	a4,1
1c008dfc:	02e78d63          	beq	a5,a4,1c008e36 <__rt_cluster_mount_step+0x66>
1c008e00:	4709                	li	a4,2
1c008e02:	0ae78d63          	beq	a5,a4,1c008ebc <__rt_cluster_mount_step+0xec>
1c008e06:	e7dd                	bnez	a5,1c008eb4 <__rt_cluster_mount_step+0xe4>
1c008e08:	5018                	lw	a4,32(s0)
1c008e0a:	00042c23          	sw	zero,24(s0)
1c008e0e:	eb01                	bnez	a4,1c008e1e <__rt_cluster_mount_step+0x4e>
1c008e10:	5048                	lw	a0,36(s0)
1c008e12:	006c                	addi	a1,sp,12
1c008e14:	c602                	sw	zero,12(sp)
1c008e16:	1e8010ef          	jal	ra,1c009ffe <__rt_pmu_cluster_power_up>
1c008e1a:	47b2                	lw	a5,12(sp)
1c008e1c:	cc08                	sw	a0,24(s0)
1c008e1e:	4c58                	lw	a4,28(s0)
1c008e20:	0705                	addi	a4,a4,1
1c008e22:	cc58                	sw	a4,28(s0)
1c008e24:	dbf1                	beqz	a5,1c008df8 <__rt_cluster_mount_step+0x28>
1c008e26:	50b2                	lw	ra,44(sp)
1c008e28:	5422                	lw	s0,40(sp)
1c008e2a:	5492                	lw	s1,36(sp)
1c008e2c:	5902                	lw	s2,32(sp)
1c008e2e:	49f2                	lw	s3,28(sp)
1c008e30:	4a62                	lw	s4,24(sp)
1c008e32:	6145                	addi	sp,sp,48
1c008e34:	8082                	ret
1c008e36:	02042a03          	lw	s4,32(s0)
1c008e3a:	040a0493          	addi	s1,s4,64
1c008e3e:	04da                	slli	s1,s1,0x16
1c008e40:	00990733          	add	a4,s2,s1
1c008e44:	00072223          	sw	zero,4(a4)
1c008e48:	00072423          	sw	zero,8(a4)
1c008e4c:	00072023          	sw	zero,0(a4)
1c008e50:	1c001737          	lui	a4,0x1c001
1c008e54:	09c72703          	lw	a4,156(a4) # 1c00109c <__rt_platform>
1c008e58:	00f70f63          	beq	a4,a5,1c008e76 <__rt_cluster_mount_step+0xa6>
1c008e5c:	4505                	li	a0,1
1c008e5e:	727000ef          	jal	ra,1c009d84 <__rt_fll_init>
1c008e62:	1c0017b7          	lui	a5,0x1c001
1c008e66:	1f878793          	addi	a5,a5,504 # 1c0011f8 <__rt_freq_domains>
1c008e6a:	43cc                	lw	a1,4(a5)
1c008e6c:	c5b1                	beqz	a1,1c008eb8 <__rt_cluster_mount_step+0xe8>
1c008e6e:	4601                	li	a2,0
1c008e70:	4505                	li	a0,1
1c008e72:	0a8010ef          	jal	ra,1c009f1a <rt_freq_set_and_get>
1c008e76:	8552                	mv	a0,s4
1c008e78:	35f5                	jal	1c008d64 <__rt_init_cluster_data>
1c008e7a:	8552                	mv	a0,s4
1c008e7c:	3529                	jal	1c008c86 <__rt_alloc_init_l1>
1c008e7e:	002017b7          	lui	a5,0x201
1c008e82:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f4a14>
1c008e86:	97a6                	add	a5,a5,s1
1c008e88:	577d                	li	a4,-1
1c008e8a:	c398                	sw	a4,0(a5)
1c008e8c:	002007b7          	lui	a5,0x200
1c008e90:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f3654>
1c008e94:	06078793          	addi	a5,a5,96
1c008e98:	9726                	add	a4,a4,s1
1c008e9a:	97a6                	add	a5,a5,s1
1c008e9c:	01372023          	sw	s3,0(a4)
1c008ea0:	0711                	addi	a4,a4,4
1c008ea2:	fef71de3          	bne	a4,a5,1c008e9c <__rt_cluster_mount_step+0xcc>
1c008ea6:	002007b7          	lui	a5,0x200
1c008eaa:	07a1                	addi	a5,a5,8
1c008eac:	94be                	add	s1,s1,a5
1c008eae:	0ff00793          	li	a5,255
1c008eb2:	c09c                	sw	a5,0(s1)
1c008eb4:	4781                	li	a5,0
1c008eb6:	b7a5                	j	1c008e1e <__rt_cluster_mount_step+0x4e>
1c008eb8:	c3c8                	sw	a0,4(a5)
1c008eba:	bf75                	j	1c008e76 <__rt_cluster_mount_step+0xa6>
1c008ebc:	505c                	lw	a5,36(s0)
1c008ebe:	5b98                	lw	a4,48(a5)
1c008ec0:	d398                	sw	a4,32(a5)
1c008ec2:	5798                	lw	a4,40(a5)
1c008ec4:	c398                	sw	a4,0(a5)
1c008ec6:	57d8                	lw	a4,44(a5)
1c008ec8:	c3d8                	sw	a4,4(a5)
1c008eca:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f3644>
1c008ece:	505c                	lw	a5,36(s0)
1c008ed0:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c008ed4:	0007ac23          	sw	zero,24(a5)
1c008ed8:	cb01                	beqz	a4,1c008ee8 <__rt_cluster_mount_step+0x118>
1c008eda:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c008ede:	cf1c                	sw	a5,24(a4)
1c008ee0:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c008ee4:	4785                	li	a5,1
1c008ee6:	bf25                	j	1c008e1e <__rt_cluster_mount_step+0x4e>
1c008ee8:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c008eec:	bfd5                	j	1c008ee0 <__rt_cluster_mount_step+0x110>

1c008eee <__rt_cluster_init>:
1c008eee:	1c001537          	lui	a0,0x1c001
1c008ef2:	1141                	addi	sp,sp,-16
1c008ef4:	02800613          	li	a2,40
1c008ef8:	4581                	li	a1,0
1c008efa:	1c850513          	addi	a0,a0,456 # 1c0011c8 <__rt_fc_cluster_data>
1c008efe:	c606                	sw	ra,12(sp)
1c008f00:	073010ef          	jal	ra,1c00a772 <memset>
1c008f04:	1c0085b7          	lui	a1,0x1c008
1c008f08:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c008f0c:	4505                	li	a0,1
1c008f0e:	2bfd                	jal	1c00950c <rt_irq_set_handler>
1c008f10:	f14027f3          	csrr	a5,mhartid
1c008f14:	8795                	srai	a5,a5,0x5
1c008f16:	03f7f793          	andi	a5,a5,63
1c008f1a:	477d                	li	a4,31
1c008f1c:	02e79e63          	bne	a5,a4,1c008f58 <__rt_cluster_init+0x6a>
1c008f20:	1a10a7b7          	lui	a5,0x1a10a
1c008f24:	4709                	li	a4,2
1c008f26:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1061f0>
1c008f2a:	1c0085b7          	lui	a1,0x1c008
1c008f2e:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c008f32:	4511                	li	a0,4
1c008f34:	2be1                	jal	1c00950c <rt_irq_set_handler>
1c008f36:	f14027f3          	csrr	a5,mhartid
1c008f3a:	8795                	srai	a5,a5,0x5
1c008f3c:	03f7f793          	andi	a5,a5,63
1c008f40:	477d                	li	a4,31
1c008f42:	02e79063          	bne	a5,a4,1c008f62 <__rt_cluster_init+0x74>
1c008f46:	1a10a7b7          	lui	a5,0x1a10a
1c008f4a:	4741                	li	a4,16
1c008f4c:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1061f0>
1c008f50:	40b2                	lw	ra,12(sp)
1c008f52:	4501                	li	a0,0
1c008f54:	0141                	addi	sp,sp,16
1c008f56:	8082                	ret
1c008f58:	002047b7          	lui	a5,0x204
1c008f5c:	4709                	li	a4,2
1c008f5e:	cbd8                	sw	a4,20(a5)
1c008f60:	b7e9                	j	1c008f2a <__rt_cluster_init+0x3c>
1c008f62:	002047b7          	lui	a5,0x204
1c008f66:	4741                	li	a4,16
1c008f68:	cbd8                	sw	a4,20(a5)
1c008f6a:	b7dd                	j	1c008f50 <__rt_cluster_init+0x62>

1c008f6c <pi_cluster_conf_init>:
1c008f6c:	00052223          	sw	zero,4(a0)
1c008f70:	8082                	ret

1c008f72 <pi_cluster_open>:
1c008f72:	1101                	addi	sp,sp,-32
1c008f74:	ce06                	sw	ra,28(sp)
1c008f76:	cc22                	sw	s0,24(sp)
1c008f78:	ca26                	sw	s1,20(sp)
1c008f7a:	c84a                	sw	s2,16(sp)
1c008f7c:	c64e                	sw	s3,12(sp)
1c008f7e:	30047973          	csrrci	s2,mstatus,8
1c008f82:	00452983          	lw	s3,4(a0)
1c008f86:	02800793          	li	a5,40
1c008f8a:	0049a483          	lw	s1,4(s3)
1c008f8e:	02f484b3          	mul	s1,s1,a5
1c008f92:	1c0017b7          	lui	a5,0x1c001
1c008f96:	1c878793          	addi	a5,a5,456 # 1c0011c8 <__rt_fc_cluster_data>
1c008f9a:	94be                	add	s1,s1,a5
1c008f9c:	c504                	sw	s1,8(a0)
1c008f9e:	3b7000ef          	jal	ra,1c009b54 <__rt_wait_event_prepare_blocking>
1c008fa2:	f14027f3          	csrr	a5,mhartid
1c008fa6:	8795                	srai	a5,a5,0x5
1c008fa8:	03f7f793          	andi	a5,a5,63
1c008fac:	477d                	li	a4,31
1c008fae:	842a                	mv	s0,a0
1c008fb0:	04e79463          	bne	a5,a4,1c008ff8 <pi_cluster_open+0x86>
1c008fb4:	511c                	lw	a5,32(a0)
1c008fb6:	0004ae23          	sw	zero,28(s1)
1c008fba:	d0c8                	sw	a0,36(s1)
1c008fbc:	d91c                	sw	a5,48(a0)
1c008fbe:	411c                	lw	a5,0(a0)
1c008fc0:	02052223          	sw	zero,36(a0)
1c008fc4:	d51c                	sw	a5,40(a0)
1c008fc6:	415c                	lw	a5,4(a0)
1c008fc8:	c144                	sw	s1,4(a0)
1c008fca:	d55c                	sw	a5,44(a0)
1c008fcc:	1c0097b7          	lui	a5,0x1c009
1c008fd0:	dd078793          	addi	a5,a5,-560 # 1c008dd0 <__rt_cluster_mount_step>
1c008fd4:	c11c                	sw	a5,0(a0)
1c008fd6:	4785                	li	a5,1
1c008fd8:	d11c                	sw	a5,32(a0)
1c008fda:	8526                	mv	a0,s1
1c008fdc:	3bd5                	jal	1c008dd0 <__rt_cluster_mount_step>
1c008fde:	8522                	mv	a0,s0
1c008fe0:	4c5000ef          	jal	ra,1c009ca4 <__rt_wait_event>
1c008fe4:	30091073          	csrw	mstatus,s2
1c008fe8:	40f2                	lw	ra,28(sp)
1c008fea:	4462                	lw	s0,24(sp)
1c008fec:	44d2                	lw	s1,20(sp)
1c008fee:	4942                	lw	s2,16(sp)
1c008ff0:	49b2                	lw	s3,12(sp)
1c008ff2:	4501                	li	a0,0
1c008ff4:	6105                	addi	sp,sp,32
1c008ff6:	8082                	ret
1c008ff8:	0049a483          	lw	s1,4(s3)
1c008ffc:	8526                	mv	a0,s1
1c008ffe:	339d                	jal	1c008d64 <__rt_init_cluster_data>
1c009000:	04048513          	addi	a0,s1,64
1c009004:	002017b7          	lui	a5,0x201
1c009008:	055a                	slli	a0,a0,0x16
1c00900a:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f4a14>
1c00900e:	97aa                	add	a5,a5,a0
1c009010:	577d                	li	a4,-1
1c009012:	c398                	sw	a4,0(a5)
1c009014:	1c0086b7          	lui	a3,0x1c008
1c009018:	002007b7          	lui	a5,0x200
1c00901c:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f3658>
1c009020:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c009024:	06078793          	addi	a5,a5,96
1c009028:	972a                	add	a4,a4,a0
1c00902a:	97aa                	add	a5,a5,a0
1c00902c:	f006f693          	andi	a3,a3,-256
1c009030:	c314                	sw	a3,0(a4)
1c009032:	0711                	addi	a4,a4,4
1c009034:	fef71ee3          	bne	a4,a5,1c009030 <pi_cluster_open+0xbe>
1c009038:	002007b7          	lui	a5,0x200
1c00903c:	07a1                	addi	a5,a5,8
1c00903e:	953e                	add	a0,a0,a5
1c009040:	57fd                	li	a5,-1
1c009042:	c11c                	sw	a5,0(a0)
1c009044:	8522                	mv	a0,s0
1c009046:	3db000ef          	jal	ra,1c009c20 <rt_event_push>
1c00904a:	bf51                	j	1c008fde <pi_cluster_open+0x6c>

1c00904c <pi_cluster_close>:
1c00904c:	451c                	lw	a5,8(a0)
1c00904e:	1101                	addi	sp,sp,-32
1c009050:	cc22                	sw	s0,24(sp)
1c009052:	5380                	lw	s0,32(a5)
1c009054:	1c0017b7          	lui	a5,0x1c001
1c009058:	09c7a703          	lw	a4,156(a5) # 1c00109c <__rt_platform>
1c00905c:	ce06                	sw	ra,28(sp)
1c00905e:	4785                	li	a5,1
1c009060:	00f70563          	beq	a4,a5,1c00906a <pi_cluster_close+0x1e>
1c009064:	4505                	li	a0,1
1c009066:	5d5000ef          	jal	ra,1c009e3a <__rt_fll_deinit>
1c00906a:	c602                	sw	zero,12(sp)
1c00906c:	e409                	bnez	s0,1c009076 <pi_cluster_close+0x2a>
1c00906e:	006c                	addi	a1,sp,12
1c009070:	4501                	li	a0,0
1c009072:	749000ef          	jal	ra,1c009fba <__rt_pmu_cluster_power_down>
1c009076:	40f2                	lw	ra,28(sp)
1c009078:	4462                	lw	s0,24(sp)
1c00907a:	4501                	li	a0,0
1c00907c:	6105                	addi	sp,sp,32
1c00907e:	8082                	ret

1c009080 <__rt_cluster_push_fc_event>:
1c009080:	002047b7          	lui	a5,0x204
1c009084:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f76d4>
1c009088:	0007e703          	p.elw	a4,0(a5)
1c00908c:	f14027f3          	csrr	a5,mhartid
1c009090:	8795                	srai	a5,a5,0x5
1c009092:	02800693          	li	a3,40
1c009096:	03f7f793          	andi	a5,a5,63
1c00909a:	02d787b3          	mul	a5,a5,a3
1c00909e:	1c001737          	lui	a4,0x1c001
1c0090a2:	1c870713          	addi	a4,a4,456 # 1c0011c8 <__rt_fc_cluster_data>
1c0090a6:	4689                	li	a3,2
1c0090a8:	97ba                	add	a5,a5,a4
1c0090aa:	00204737          	lui	a4,0x204
1c0090ae:	43d0                	lw	a2,4(a5)
1c0090b0:	ee01                	bnez	a2,1c0090c8 <__rt_cluster_push_fc_event+0x48>
1c0090b2:	c3c8                	sw	a0,4(a5)
1c0090b4:	4709                	li	a4,2
1c0090b6:	1a10a7b7          	lui	a5,0x1a10a
1c0090ba:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa1061fc>
1c0090be:	002047b7          	lui	a5,0x204
1c0090c2:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f76d4>
1c0090c6:	8082                	ret
1c0090c8:	c714                	sw	a3,8(a4)
1c0090ca:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f7650>
1c0090ce:	c354                	sw	a3,4(a4)
1c0090d0:	bff9                	j	1c0090ae <__rt_cluster_push_fc_event+0x2e>

1c0090d2 <__rt_cluster_new>:
1c0090d2:	1c0095b7          	lui	a1,0x1c009
1c0090d6:	1141                	addi	sp,sp,-16
1c0090d8:	4601                	li	a2,0
1c0090da:	eee58593          	addi	a1,a1,-274 # 1c008eee <__rt_cluster_init>
1c0090de:	4501                	li	a0,0
1c0090e0:	c606                	sw	ra,12(sp)
1c0090e2:	2b6d                	jal	1c00969c <__rt_cbsys_add>
1c0090e4:	c105                	beqz	a0,1c009104 <__rt_cluster_new+0x32>
1c0090e6:	f1402673          	csrr	a2,mhartid
1c0090ea:	1c000537          	lui	a0,0x1c000
1c0090ee:	40565593          	srai	a1,a2,0x5
1c0090f2:	03f5f593          	andi	a1,a1,63
1c0090f6:	8a7d                	andi	a2,a2,31
1c0090f8:	51450513          	addi	a0,a0,1300 # 1c000514 <__DTOR_END__+0x228>
1c0090fc:	0c3010ef          	jal	ra,1c00a9be <printf>
1c009100:	04b010ef          	jal	ra,1c00a94a <abort>
1c009104:	40b2                	lw	ra,12(sp)
1c009106:	0141                	addi	sp,sp,16
1c009108:	8082                	ret

1c00910a <__rt_cluster_pulpos_emu_init>:
1c00910a:	1141                	addi	sp,sp,-16
1c00910c:	45b1                	li	a1,12
1c00910e:	4501                	li	a0,0
1c009110:	c606                	sw	ra,12(sp)
1c009112:	3621                	jal	1c008c1a <rt_alloc>
1c009114:	1c0017b7          	lui	a5,0x1c001
1c009118:	18a7a423          	sw	a0,392(a5) # 1c001188 <__rt_fc_cluster_device>
1c00911c:	e105                	bnez	a0,1c00913c <__rt_cluster_pulpos_emu_init+0x32>
1c00911e:	f1402673          	csrr	a2,mhartid
1c009122:	1c000537          	lui	a0,0x1c000
1c009126:	40565593          	srai	a1,a2,0x5
1c00912a:	03f5f593          	andi	a1,a1,63
1c00912e:	8a7d                	andi	a2,a2,31
1c009130:	55c50513          	addi	a0,a0,1372 # 1c00055c <__DTOR_END__+0x270>
1c009134:	08b010ef          	jal	ra,1c00a9be <printf>
1c009138:	013010ef          	jal	ra,1c00a94a <abort>
1c00913c:	40b2                	lw	ra,12(sp)
1c00913e:	0141                	addi	sp,sp,16
1c009140:	8082                	ret

1c009142 <rt_cluster_call>:
1c009142:	7139                	addi	sp,sp,-64
1c009144:	d84a                	sw	s2,48(sp)
1c009146:	4906                	lw	s2,64(sp)
1c009148:	dc22                	sw	s0,56(sp)
1c00914a:	842e                	mv	s0,a1
1c00914c:	de06                	sw	ra,60(sp)
1c00914e:	da26                	sw	s1,52(sp)
1c009150:	d64e                	sw	s3,44(sp)
1c009152:	300479f3          	csrrci	s3,mstatus,8
1c009156:	84ca                	mv	s1,s2
1c009158:	02091163          	bnez	s2,1c00917a <rt_cluster_call+0x38>
1c00915c:	ce32                	sw	a2,28(sp)
1c00915e:	cc36                	sw	a3,24(sp)
1c009160:	ca3a                	sw	a4,20(sp)
1c009162:	c83e                	sw	a5,16(sp)
1c009164:	c642                	sw	a6,12(sp)
1c009166:	c446                	sw	a7,8(sp)
1c009168:	1ed000ef          	jal	ra,1c009b54 <__rt_wait_event_prepare_blocking>
1c00916c:	48a2                	lw	a7,8(sp)
1c00916e:	4832                	lw	a6,12(sp)
1c009170:	47c2                	lw	a5,16(sp)
1c009172:	4752                	lw	a4,20(sp)
1c009174:	46e2                	lw	a3,24(sp)
1c009176:	4672                	lw	a2,28(sp)
1c009178:	84aa                	mv	s1,a0
1c00917a:	4531                	li	a0,12
1c00917c:	02a40433          	mul	s0,s0,a0
1c009180:	1c0015b7          	lui	a1,0x1c001
1c009184:	0c058313          	addi	t1,a1,192 # 1c0010c0 <__rt_pulpos_emu_global_cluster_task>
1c009188:	00f32623          	sw	a5,12(t1)
1c00918c:	1c0017b7          	lui	a5,0x1c001
1c009190:	1887a503          	lw	a0,392(a5) # 1c001188 <__rt_fc_cluster_device>
1c009194:	00c32023          	sw	a2,0(t1)
1c009198:	0c058593          	addi	a1,a1,192
1c00919c:	8626                	mv	a2,s1
1c00919e:	00d32223          	sw	a3,4(t1)
1c0091a2:	9522                	add	a0,a0,s0
1c0091a4:	00e32423          	sw	a4,8(t1)
1c0091a8:	01032823          	sw	a6,16(t1)
1c0091ac:	01132a23          	sw	a7,20(t1)
1c0091b0:	2041                	jal	1c009230 <pi_cluster_send_task_to_cl_async>
1c0091b2:	842a                	mv	s0,a0
1c0091b4:	cd01                	beqz	a0,1c0091cc <rt_cluster_call+0x8a>
1c0091b6:	30099073          	csrw	mstatus,s3
1c0091ba:	547d                	li	s0,-1
1c0091bc:	8522                	mv	a0,s0
1c0091be:	50f2                	lw	ra,60(sp)
1c0091c0:	5462                	lw	s0,56(sp)
1c0091c2:	54d2                	lw	s1,52(sp)
1c0091c4:	5942                	lw	s2,48(sp)
1c0091c6:	59b2                	lw	s3,44(sp)
1c0091c8:	6121                	addi	sp,sp,64
1c0091ca:	8082                	ret
1c0091cc:	00091563          	bnez	s2,1c0091d6 <rt_cluster_call+0x94>
1c0091d0:	8526                	mv	a0,s1
1c0091d2:	2d3000ef          	jal	ra,1c009ca4 <__rt_wait_event>
1c0091d6:	30099073          	csrw	mstatus,s3
1c0091da:	b7cd                	j	1c0091bc <rt_cluster_call+0x7a>

1c0091dc <rt_cluster_mount>:
1c0091dc:	7139                	addi	sp,sp,-64
1c0091de:	dc22                	sw	s0,56(sp)
1c0091e0:	da26                	sw	s1,52(sp)
1c0091e2:	d84a                	sw	s2,48(sp)
1c0091e4:	4431                	li	s0,12
1c0091e6:	1c0014b7          	lui	s1,0x1c001
1c0091ea:	de06                	sw	ra,60(sp)
1c0091ec:	d64e                	sw	s3,44(sp)
1c0091ee:	8936                	mv	s2,a3
1c0091f0:	02858433          	mul	s0,a1,s0
1c0091f4:	18848493          	addi	s1,s1,392 # 1c001188 <__rt_fc_cluster_device>
1c0091f8:	c905                	beqz	a0,1c009228 <rt_cluster_mount+0x4c>
1c0091fa:	0068                	addi	a0,sp,12
1c0091fc:	89ae                	mv	s3,a1
1c0091fe:	33bd                	jal	1c008f6c <pi_cluster_conf_init>
1c009200:	4088                	lw	a0,0(s1)
1c009202:	006c                	addi	a1,sp,12
1c009204:	9522                	add	a0,a0,s0
1c009206:	2609                	jal	1c009508 <pi_open_from_conf>
1c009208:	4088                	lw	a0,0(s1)
1c00920a:	c84e                	sw	s3,16(sp)
1c00920c:	9522                	add	a0,a0,s0
1c00920e:	3395                	jal	1c008f72 <pi_cluster_open>
1c009210:	00090563          	beqz	s2,1c00921a <rt_cluster_mount+0x3e>
1c009214:	854a                	mv	a0,s2
1c009216:	20b000ef          	jal	ra,1c009c20 <rt_event_push>
1c00921a:	50f2                	lw	ra,60(sp)
1c00921c:	5462                	lw	s0,56(sp)
1c00921e:	54d2                	lw	s1,52(sp)
1c009220:	5942                	lw	s2,48(sp)
1c009222:	59b2                	lw	s3,44(sp)
1c009224:	6121                	addi	sp,sp,64
1c009226:	8082                	ret
1c009228:	4088                	lw	a0,0(s1)
1c00922a:	9522                	add	a0,a0,s0
1c00922c:	3505                	jal	1c00904c <pi_cluster_close>
1c00922e:	b7cd                	j	1c009210 <rt_cluster_mount+0x34>

1c009230 <pi_cluster_send_task_to_cl_async>:
1c009230:	1101                	addi	sp,sp,-32
1c009232:	ca26                	sw	s1,20(sp)
1c009234:	4504                	lw	s1,8(a0)
1c009236:	cc22                	sw	s0,24(sp)
1c009238:	c256                	sw	s5,4(sp)
1c00923a:	842e                	mv	s0,a1
1c00923c:	8ab2                	mv	s5,a2
1c00923e:	ce06                	sw	ra,28(sp)
1c009240:	c84a                	sw	s2,16(sp)
1c009242:	c64e                	sw	s3,12(sp)
1c009244:	c452                	sw	s4,8(sp)
1c009246:	30047a73          	csrrci	s4,mstatus,8
1c00924a:	00060823          	sb	zero,16(a2)
1c00924e:	4785                	li	a5,1
1c009250:	d1dc                	sw	a5,36(a1)
1c009252:	49dc                	lw	a5,20(a1)
1c009254:	0144a983          	lw	s3,20(s1)
1c009258:	e399                	bnez	a5,1c00925e <pi_cluster_send_task_to_cl_async+0x2e>
1c00925a:	47a1                	li	a5,8
1c00925c:	c9dc                	sw	a5,20(a1)
1c00925e:	441c                	lw	a5,8(s0)
1c009260:	eb8d                	bnez	a5,1c009292 <pi_cluster_send_task_to_cl_async+0x62>
1c009262:	445c                	lw	a5,12(s0)
1c009264:	e789                	bnez	a5,1c00926e <pi_cluster_send_task_to_cl_async+0x3e>
1c009266:	40000793          	li	a5,1024
1c00926a:	c45c                	sw	a5,12(s0)
1c00926c:	c81c                	sw	a5,16(s0)
1c00926e:	4818                	lw	a4,16(s0)
1c009270:	445c                	lw	a5,12(s0)
1c009272:	e311                	bnez	a4,1c009276 <pi_cluster_send_task_to_cl_async+0x46>
1c009274:	c81c                	sw	a5,16(s0)
1c009276:	01442903          	lw	s2,20(s0)
1c00927a:	4818                	lw	a4,16(s0)
1c00927c:	448c                	lw	a1,8(s1)
1c00927e:	197d                	addi	s2,s2,-1
1c009280:	02e90933          	mul	s2,s2,a4
1c009284:	993e                	add	s2,s2,a5
1c009286:	c9bd                	beqz	a1,1c0092fc <pi_cluster_send_task_to_cl_async+0xcc>
1c009288:	44d0                	lw	a2,12(s1)
1c00928a:	07261063          	bne	a2,s2,1c0092ea <pi_cluster_send_task_to_cl_async+0xba>
1c00928e:	449c                	lw	a5,8(s1)
1c009290:	c41c                	sw	a5,8(s0)
1c009292:	4858                	lw	a4,20(s0)
1c009294:	4785                	li	a5,1
1c009296:	01542c23          	sw	s5,24(s0)
1c00929a:	00e797b3          	sll	a5,a5,a4
1c00929e:	17fd                	addi	a5,a5,-1
1c0092a0:	d41c                	sw	a5,40(s0)
1c0092a2:	02042023          	sw	zero,32(s0)
1c0092a6:	0089a783          	lw	a5,8(s3)
1c0092aa:	cbbd                	beqz	a5,1c009320 <pi_cluster_send_task_to_cl_async+0xf0>
1c0092ac:	d380                	sw	s0,32(a5)
1c0092ae:	0089a423          	sw	s0,8(s3)
1c0092b2:	0009a783          	lw	a5,0(s3)
1c0092b6:	e399                	bnez	a5,1c0092bc <pi_cluster_send_task_to_cl_async+0x8c>
1c0092b8:	0089a023          	sw	s0,0(s3)
1c0092bc:	509c                	lw	a5,32(s1)
1c0092be:	00201737          	lui	a4,0x201
1c0092c2:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f4418>
1c0092c6:	04078793          	addi	a5,a5,64
1c0092ca:	07da                	slli	a5,a5,0x16
1c0092cc:	97ba                	add	a5,a5,a4
1c0092ce:	0007a023          	sw	zero,0(a5)
1c0092d2:	300a1073          	csrw	mstatus,s4
1c0092d6:	4501                	li	a0,0
1c0092d8:	40f2                	lw	ra,28(sp)
1c0092da:	4462                	lw	s0,24(sp)
1c0092dc:	44d2                	lw	s1,20(sp)
1c0092de:	4942                	lw	s2,16(sp)
1c0092e0:	49b2                	lw	s3,12(sp)
1c0092e2:	4a22                	lw	s4,8(sp)
1c0092e4:	4a92                	lw	s5,4(sp)
1c0092e6:	6105                	addi	sp,sp,32
1c0092e8:	8082                	ret
1c0092ea:	509c                	lw	a5,32(s1)
1c0092ec:	1c001737          	lui	a4,0x1c001
1c0092f0:	1b472503          	lw	a0,436(a4) # 1c0011b4 <__rt_alloc_l1>
1c0092f4:	078a                	slli	a5,a5,0x2
1c0092f6:	953e                	add	a0,a0,a5
1c0092f8:	8d9ff0ef          	jal	ra,1c008bd0 <rt_user_free>
1c0092fc:	509c                	lw	a5,32(s1)
1c0092fe:	1c001737          	lui	a4,0x1c001
1c009302:	1b472503          	lw	a0,436(a4) # 1c0011b4 <__rt_alloc_l1>
1c009306:	078a                	slli	a5,a5,0x2
1c009308:	0124a623          	sw	s2,12(s1)
1c00930c:	85ca                	mv	a1,s2
1c00930e:	953e                	add	a0,a0,a5
1c009310:	891ff0ef          	jal	ra,1c008ba0 <rt_user_alloc>
1c009314:	c488                	sw	a0,8(s1)
1c009316:	fd25                	bnez	a0,1c00928e <pi_cluster_send_task_to_cl_async+0x5e>
1c009318:	300a1073          	csrw	mstatus,s4
1c00931c:	557d                	li	a0,-1
1c00931e:	bf6d                	j	1c0092d8 <pi_cluster_send_task_to_cl_async+0xa8>
1c009320:	0089a223          	sw	s0,4(s3)
1c009324:	b769                	j	1c0092ae <pi_cluster_send_task_to_cl_async+0x7e>

1c009326 <rt_perf_init>:
1c009326:	00450793          	addi	a5,a0,4
1c00932a:	04850513          	addi	a0,a0,72
1c00932e:	0007a023          	sw	zero,0(a5)
1c009332:	0791                	addi	a5,a5,4
1c009334:	fea79de3          	bne	a5,a0,1c00932e <rt_perf_init+0x8>
1c009338:	8082                	ret

1c00933a <rt_perf_conf>:
1c00933a:	c10c                	sw	a1,0(a0)
1c00933c:	7a059073          	csrw	pcer,a1
1c009340:	8082                	ret

1c009342 <cluster_start>:
1c009342:	002047b7          	lui	a5,0x204
1c009346:	00070737          	lui	a4,0x70
1c00934a:	c798                	sw	a4,8(a5)
1c00934c:	0ff00713          	li	a4,255
1c009350:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f7698>
1c009354:	20e7a023          	sw	a4,512(a5)
1c009358:	20e7a623          	sw	a4,524(a5)
1c00935c:	8082                	ret

1c00935e <__rt_init>:
1c00935e:	1101                	addi	sp,sp,-32
1c009360:	ce06                	sw	ra,28(sp)
1c009362:	cc22                	sw	s0,24(sp)
1c009364:	23d5                	jal	1c009948 <__rt_bridge_set_available>
1c009366:	1c0017b7          	lui	a5,0x1c001
1c00936a:	09c7a703          	lw	a4,156(a5) # 1c00109c <__rt_platform>
1c00936e:	478d                	li	a5,3
1c009370:	02f71263          	bne	a4,a5,1c009394 <__rt_init+0x36>
1c009374:	7d005073          	csrwi	0x7d0,0
1c009378:	1c0007b7          	lui	a5,0x1c000
1c00937c:	6c078793          	addi	a5,a5,1728 # 1c0006c0 <stack_start>
1c009380:	7d179073          	csrw	0x7d1,a5
1c009384:	1c0017b7          	lui	a5,0x1c001
1c009388:	ec078793          	addi	a5,a5,-320 # 1c000ec0 <stack>
1c00938c:	7d279073          	csrw	0x7d2,a5
1c009390:	7d00d073          	csrwi	0x7d0,1
1c009394:	2c29                	jal	1c0095ae <__rt_irq_init>
1c009396:	1a1067b7          	lui	a5,0x1a106
1c00939a:	577d                	li	a4,-1
1c00939c:	c3d8                	sw	a4,4(a5)
1c00939e:	1c0085b7          	lui	a1,0x1c008
1c0093a2:	c798                	sw	a4,8(a5)
1c0093a4:	33058593          	addi	a1,a1,816 # 1c008330 <__rt_fc_socevents_handler>
1c0093a8:	4569                	li	a0,26
1c0093aa:	228d                	jal	1c00950c <rt_irq_set_handler>
1c0093ac:	f14027f3          	csrr	a5,mhartid
1c0093b0:	8795                	srai	a5,a5,0x5
1c0093b2:	03f7f793          	andi	a5,a5,63
1c0093b6:	477d                	li	a4,31
1c0093b8:	0ae79e63          	bne	a5,a4,1c009474 <__rt_init+0x116>
1c0093bc:	1a10a7b7          	lui	a5,0x1a10a
1c0093c0:	04000737          	lui	a4,0x4000
1c0093c4:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1061f0>
1c0093c8:	46d000ef          	jal	ra,1c00a034 <__rt_pmu_init>
1c0093cc:	373000ef          	jal	ra,1c009f3e <__rt_freq_init>
1c0093d0:	f14027f3          	csrr	a5,mhartid
1c0093d4:	8795                	srai	a5,a5,0x5
1c0093d6:	03f7f793          	andi	a5,a5,63
1c0093da:	477d                	li	a4,31
1c0093dc:	00e78763          	beq	a5,a4,1c0093ea <__rt_init+0x8c>
1c0093e0:	002017b7          	lui	a5,0x201
1c0093e4:	577d                	li	a4,-1
1c0093e6:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f4a14>
1c0093ea:	1c000437          	lui	s0,0x1c000
1c0093ee:	2605                	jal	1c00970e <__rt_utils_init>
1c0093f0:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c0093f4:	8ddff0ef          	jal	ra,1c008cd0 <__rt_allocs_init>
1c0093f8:	25cd                	jal	1c009ada <__rt_thread_sched_init>
1c0093fa:	0ed000ef          	jal	ra,1c009ce6 <__rt_event_sched_init>
1c0093fe:	473000ef          	jal	ra,1c00a070 <__rt_padframe_init>
1c009402:	401c                	lw	a5,0(s0)
1c009404:	efb5                	bnez	a5,1c009480 <__rt_init+0x122>
1c009406:	30045073          	csrwi	mstatus,8
1c00940a:	4501                	li	a0,0
1c00940c:	2cc1                	jal	1c0096dc <__rt_cbsys_exec>
1c00940e:	e521                	bnez	a0,1c009456 <__rt_init+0xf8>
1c009410:	f14027f3          	csrr	a5,mhartid
1c009414:	8795                	srai	a5,a5,0x5
1c009416:	03f7f793          	andi	a5,a5,63
1c00941a:	477d                	li	a4,31
1c00941c:	0ae78763          	beq	a5,a4,1c0094ca <__rt_init+0x16c>
1c009420:	4681                	li	a3,0
1c009422:	4601                	li	a2,0
1c009424:	4581                	li	a1,0
1c009426:	4505                	li	a0,1
1c009428:	cfb9                	beqz	a5,1c009486 <__rt_init+0x128>
1c00942a:	3b4d                	jal	1c0091dc <rt_cluster_mount>
1c00942c:	6591                	lui	a1,0x4
1c00942e:	450d                	li	a0,3
1c009430:	feaff0ef          	jal	ra,1c008c1a <rt_alloc>
1c009434:	872a                	mv	a4,a0
1c009436:	c105                	beqz	a0,1c009456 <__rt_init+0xf8>
1c009438:	6805                	lui	a6,0x1
1c00943a:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00943e:	1c009637          	lui	a2,0x1c009
1c009442:	c002                	sw	zero,0(sp)
1c009444:	48a1                	li	a7,8
1c009446:	87c2                	mv	a5,a6
1c009448:	4681                	li	a3,0
1c00944a:	34260613          	addi	a2,a2,834 # 1c009342 <cluster_start>
1c00944e:	4581                	li	a1,0
1c009450:	4501                	li	a0,0
1c009452:	39c5                	jal	1c009142 <rt_cluster_call>
1c009454:	c93d                	beqz	a0,1c0094ca <__rt_init+0x16c>
1c009456:	f1402673          	csrr	a2,mhartid
1c00945a:	1c000537          	lui	a0,0x1c000
1c00945e:	40565593          	srai	a1,a2,0x5
1c009462:	03f5f593          	andi	a1,a1,63
1c009466:	8a7d                	andi	a2,a2,31
1c009468:	5b050513          	addi	a0,a0,1456 # 1c0005b0 <__DTOR_END__+0x2c4>
1c00946c:	552010ef          	jal	ra,1c00a9be <printf>
1c009470:	4da010ef          	jal	ra,1c00a94a <abort>
1c009474:	002047b7          	lui	a5,0x204
1c009478:	04000737          	lui	a4,0x4000
1c00947c:	cbd8                	sw	a4,20(a5)
1c00947e:	b7a9                	j	1c0093c8 <__rt_init+0x6a>
1c009480:	9782                	jalr	a5
1c009482:	0411                	addi	s0,s0,4
1c009484:	bfbd                	j	1c009402 <__rt_init+0xa4>
1c009486:	3b99                	jal	1c0091dc <rt_cluster_mount>
1c009488:	6591                	lui	a1,0x4
1c00948a:	80058593          	addi	a1,a1,-2048 # 3800 <_l1_preload_size+0x1f0>
1c00948e:	450d                	li	a0,3
1c009490:	f8aff0ef          	jal	ra,1c008c1a <rt_alloc>
1c009494:	d169                	beqz	a0,1c009456 <__rt_init+0xf8>
1c009496:	00204737          	lui	a4,0x204
1c00949a:	0ff00793          	li	a5,255
1c00949e:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f7698>
1c0094a2:	1c0107b7          	lui	a5,0x1c010
1c0094a6:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c0094aa:	0017e793          	ori	a5,a5,1
1c0094ae:	08f72023          	sw	a5,128(a4)
1c0094b2:	6785                	lui	a5,0x1
1c0094b4:	4462                	lw	s0,24(sp)
1c0094b6:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0094ba:	08f72023          	sw	a5,128(a4)
1c0094be:	40f2                	lw	ra,28(sp)
1c0094c0:	08a72023          	sw	a0,128(a4)
1c0094c4:	4501                	li	a0,0
1c0094c6:	6105                	addi	sp,sp,32
1c0094c8:	bdad                	j	1c009342 <cluster_start>
1c0094ca:	40f2                	lw	ra,28(sp)
1c0094cc:	4462                	lw	s0,24(sp)
1c0094ce:	6105                	addi	sp,sp,32
1c0094d0:	8082                	ret

1c0094d2 <__rt_deinit>:
1c0094d2:	1c0017b7          	lui	a5,0x1c001
1c0094d6:	09c7a703          	lw	a4,156(a5) # 1c00109c <__rt_platform>
1c0094da:	1141                	addi	sp,sp,-16
1c0094dc:	c606                	sw	ra,12(sp)
1c0094de:	c422                	sw	s0,8(sp)
1c0094e0:	478d                	li	a5,3
1c0094e2:	00f71463          	bne	a4,a5,1c0094ea <__rt_deinit+0x18>
1c0094e6:	7d005073          	csrwi	0x7d0,0
1c0094ea:	4505                	li	a0,1
1c0094ec:	1c000437          	lui	s0,0x1c000
1c0094f0:	22f5                	jal	1c0096dc <__rt_cbsys_exec>
1c0094f2:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c0094f6:	401c                	lw	a5,0(s0)
1c0094f8:	e789                	bnez	a5,1c009502 <__rt_deinit+0x30>
1c0094fa:	40b2                	lw	ra,12(sp)
1c0094fc:	4422                	lw	s0,8(sp)
1c0094fe:	0141                	addi	sp,sp,16
1c009500:	8082                	ret
1c009502:	9782                	jalr	a5
1c009504:	0411                	addi	s0,s0,4
1c009506:	bfc5                	j	1c0094f6 <__rt_deinit+0x24>

1c009508 <pi_open_from_conf>:
1c009508:	c14c                	sw	a1,4(a0)
1c00950a:	8082                	ret

1c00950c <rt_irq_set_handler>:
1c00950c:	f14027f3          	csrr	a5,mhartid
1c009510:	8795                	srai	a5,a5,0x5
1c009512:	03f7f793          	andi	a5,a5,63
1c009516:	477d                	li	a4,31
1c009518:	04e79063          	bne	a5,a4,1c009558 <rt_irq_set_handler+0x4c>
1c00951c:	1a1047b7          	lui	a5,0x1a104
1c009520:	43dc                	lw	a5,4(a5)
1c009522:	050a                	slli	a0,a0,0x2
1c009524:	8d89                	sub	a1,a1,a0
1c009526:	8d9d                	sub	a1,a1,a5
1c009528:	000ff737          	lui	a4,0xff
1c00952c:	00f506b3          	add	a3,a0,a5
1c009530:	8f6d                	and	a4,a4,a1
1c009532:	0145d793          	srli	a5,a1,0x14
1c009536:	06f76713          	ori	a4,a4,111
1c00953a:	07fe                	slli	a5,a5,0x1f
1c00953c:	8fd9                	or	a5,a5,a4
1c00953e:	7fe00637          	lui	a2,0x7fe00
1c009542:	01459713          	slli	a4,a1,0x14
1c009546:	8f71                	and	a4,a4,a2
1c009548:	8fd9                	or	a5,a5,a4
1c00954a:	05a6                	slli	a1,a1,0x9
1c00954c:	00100737          	lui	a4,0x100
1c009550:	8df9                	and	a1,a1,a4
1c009552:	8ddd                	or	a1,a1,a5
1c009554:	c28c                	sw	a1,0(a3)
1c009556:	8082                	ret
1c009558:	002007b7          	lui	a5,0x200
1c00955c:	43bc                	lw	a5,64(a5)
1c00955e:	b7d1                	j	1c009522 <rt_irq_set_handler+0x16>

1c009560 <illegal_insn_handler_c>:
1c009560:	8082                	ret

1c009562 <__rt_handle_illegal_instr>:
1c009562:	1c0017b7          	lui	a5,0x1c001
1c009566:	ec47a703          	lw	a4,-316(a5) # 1c000ec4 <__rt_debug_config>
1c00956a:	1141                	addi	sp,sp,-16
1c00956c:	c422                	sw	s0,8(sp)
1c00956e:	c606                	sw	ra,12(sp)
1c009570:	8b05                	andi	a4,a4,1
1c009572:	843e                	mv	s0,a5
1c009574:	c30d                	beqz	a4,1c009596 <__rt_handle_illegal_instr+0x34>
1c009576:	341026f3          	csrr	a3,mepc
1c00957a:	f1402673          	csrr	a2,mhartid
1c00957e:	1c000537          	lui	a0,0x1c000
1c009582:	4298                	lw	a4,0(a3)
1c009584:	40565593          	srai	a1,a2,0x5
1c009588:	03f5f593          	andi	a1,a1,63
1c00958c:	8a7d                	andi	a2,a2,31
1c00958e:	60850513          	addi	a0,a0,1544 # 1c000608 <__DTOR_END__+0x31c>
1c009592:	42c010ef          	jal	ra,1c00a9be <printf>
1c009596:	ec442783          	lw	a5,-316(s0)
1c00959a:	8385                	srli	a5,a5,0x1
1c00959c:	8b85                	andi	a5,a5,1
1c00959e:	c399                	beqz	a5,1c0095a4 <__rt_handle_illegal_instr+0x42>
1c0095a0:	3aa010ef          	jal	ra,1c00a94a <abort>
1c0095a4:	4422                	lw	s0,8(sp)
1c0095a6:	40b2                	lw	ra,12(sp)
1c0095a8:	0141                	addi	sp,sp,16
1c0095aa:	fb7ff06f          	j	1c009560 <illegal_insn_handler_c>

1c0095ae <__rt_irq_init>:
1c0095ae:	f14027f3          	csrr	a5,mhartid
1c0095b2:	8795                	srai	a5,a5,0x5
1c0095b4:	03f7f793          	andi	a5,a5,63
1c0095b8:	477d                	li	a4,31
1c0095ba:	02e79763          	bne	a5,a4,1c0095e8 <__rt_irq_init+0x3a>
1c0095be:	1a10a7b7          	lui	a5,0x1a10a
1c0095c2:	577d                	li	a4,-1
1c0095c4:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1061f4>
1c0095c8:	f14027f3          	csrr	a5,mhartid
1c0095cc:	8795                	srai	a5,a5,0x5
1c0095ce:	1c008737          	lui	a4,0x1c008
1c0095d2:	03f7f793          	andi	a5,a5,63
1c0095d6:	46fd                	li	a3,31
1c0095d8:	00070713          	mv	a4,a4
1c0095dc:	00d79b63          	bne	a5,a3,1c0095f2 <__rt_irq_init+0x44>
1c0095e0:	1a1047b7          	lui	a5,0x1a104
1c0095e4:	c3d8                	sw	a4,4(a5)
1c0095e6:	8082                	ret
1c0095e8:	002047b7          	lui	a5,0x204
1c0095ec:	577d                	li	a4,-1
1c0095ee:	cb98                	sw	a4,16(a5)
1c0095f0:	bfe1                	j	1c0095c8 <__rt_irq_init+0x1a>
1c0095f2:	002007b7          	lui	a5,0x200
1c0095f6:	c3b8                	sw	a4,64(a5)
1c0095f8:	8082                	ret

1c0095fa <__rt_fc_cluster_lock_req>:
1c0095fa:	1141                	addi	sp,sp,-16
1c0095fc:	c606                	sw	ra,12(sp)
1c0095fe:	c422                	sw	s0,8(sp)
1c009600:	c226                	sw	s1,4(sp)
1c009602:	300474f3          	csrrci	s1,mstatus,8
1c009606:	09654703          	lbu	a4,150(a0)
1c00960a:	411c                	lw	a5,0(a0)
1c00960c:	c729                	beqz	a4,1c009656 <__rt_fc_cluster_lock_req+0x5c>
1c00960e:	4398                	lw	a4,0(a5)
1c009610:	c30d                	beqz	a4,1c009632 <__rt_fc_cluster_lock_req+0x38>
1c009612:	43d8                	lw	a4,4(a5)
1c009614:	cf09                	beqz	a4,1c00962e <__rt_fc_cluster_lock_req+0x34>
1c009616:	4798                	lw	a4,8(a5)
1c009618:	c348                	sw	a0,4(a4)
1c00961a:	c788                	sw	a0,8(a5)
1c00961c:	00052223          	sw	zero,4(a0)
1c009620:	30049073          	csrw	mstatus,s1
1c009624:	40b2                	lw	ra,12(sp)
1c009626:	4422                	lw	s0,8(sp)
1c009628:	4492                	lw	s1,4(sp)
1c00962a:	0141                	addi	sp,sp,16
1c00962c:	8082                	ret
1c00962e:	c3c8                	sw	a0,4(a5)
1c009630:	b7ed                	j	1c00961a <__rt_fc_cluster_lock_req+0x20>
1c009632:	4705                	li	a4,1
1c009634:	08e50a23          	sb	a4,148(a0)
1c009638:	4705                	li	a4,1
1c00963a:	c398                	sw	a4,0(a5)
1c00963c:	09554783          	lbu	a5,149(a0)
1c009640:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f3654>
1c009644:	00201737          	lui	a4,0x201
1c009648:	07da                	slli	a5,a5,0x16
1c00964a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f4418>
1c00964e:	97ba                	add	a5,a5,a4
1c009650:	0007a023          	sw	zero,0(a5)
1c009654:	b7f1                	j	1c009620 <__rt_fc_cluster_lock_req+0x26>
1c009656:	842a                	mv	s0,a0
1c009658:	47c8                	lw	a0,12(a5)
1c00965a:	cd01                	beqz	a0,1c009672 <__rt_fc_cluster_lock_req+0x78>
1c00965c:	0007a023          	sw	zero,0(a5)
1c009660:	0007a623          	sw	zero,12(a5)
1c009664:	2185                	jal	1c009ac4 <__rt_thread_wakeup>
1c009666:	4785                	li	a5,1
1c009668:	08f40a23          	sb	a5,148(s0)
1c00966c:	09544783          	lbu	a5,149(s0)
1c009670:	bfc1                	j	1c009640 <__rt_fc_cluster_lock_req+0x46>
1c009672:	43d8                	lw	a4,4(a5)
1c009674:	e701                	bnez	a4,1c00967c <__rt_fc_cluster_lock_req+0x82>
1c009676:	0007a023          	sw	zero,0(a5)
1c00967a:	b7f5                	j	1c009666 <__rt_fc_cluster_lock_req+0x6c>
1c00967c:	4354                	lw	a3,4(a4)
1c00967e:	c3d4                	sw	a3,4(a5)
1c009680:	4785                	li	a5,1
1c009682:	08f70a23          	sb	a5,148(a4)
1c009686:	09574783          	lbu	a5,149(a4)
1c00968a:	00201737          	lui	a4,0x201
1c00968e:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f4418>
1c009692:	04078793          	addi	a5,a5,64
1c009696:	07da                	slli	a5,a5,0x16
1c009698:	97ba                	add	a5,a5,a4
1c00969a:	bff1                	j	1c009676 <__rt_fc_cluster_lock_req+0x7c>

1c00969c <__rt_cbsys_add>:
1c00969c:	1101                	addi	sp,sp,-32
1c00969e:	cc22                	sw	s0,24(sp)
1c0096a0:	ca26                	sw	s1,20(sp)
1c0096a2:	842a                	mv	s0,a0
1c0096a4:	84ae                	mv	s1,a1
1c0096a6:	4501                	li	a0,0
1c0096a8:	45b1                	li	a1,12
1c0096aa:	c632                	sw	a2,12(sp)
1c0096ac:	ce06                	sw	ra,28(sp)
1c0096ae:	d6cff0ef          	jal	ra,1c008c1a <rt_alloc>
1c0096b2:	4632                	lw	a2,12(sp)
1c0096b4:	c115                	beqz	a0,1c0096d8 <__rt_cbsys_add+0x3c>
1c0096b6:	1c0017b7          	lui	a5,0x1c001
1c0096ba:	040a                	slli	s0,s0,0x2
1c0096bc:	ec878793          	addi	a5,a5,-312 # 1c000ec8 <cbsys_first>
1c0096c0:	97a2                	add	a5,a5,s0
1c0096c2:	4398                	lw	a4,0(a5)
1c0096c4:	c104                	sw	s1,0(a0)
1c0096c6:	c150                	sw	a2,4(a0)
1c0096c8:	c518                	sw	a4,8(a0)
1c0096ca:	c388                	sw	a0,0(a5)
1c0096cc:	4501                	li	a0,0
1c0096ce:	40f2                	lw	ra,28(sp)
1c0096d0:	4462                	lw	s0,24(sp)
1c0096d2:	44d2                	lw	s1,20(sp)
1c0096d4:	6105                	addi	sp,sp,32
1c0096d6:	8082                	ret
1c0096d8:	557d                	li	a0,-1
1c0096da:	bfd5                	j	1c0096ce <__rt_cbsys_add+0x32>

1c0096dc <__rt_cbsys_exec>:
1c0096dc:	00251793          	slli	a5,a0,0x2
1c0096e0:	1c001537          	lui	a0,0x1c001
1c0096e4:	ec850513          	addi	a0,a0,-312 # 1c000ec8 <cbsys_first>
1c0096e8:	1141                	addi	sp,sp,-16
1c0096ea:	953e                	add	a0,a0,a5
1c0096ec:	c422                	sw	s0,8(sp)
1c0096ee:	4100                	lw	s0,0(a0)
1c0096f0:	c606                	sw	ra,12(sp)
1c0096f2:	e411                	bnez	s0,1c0096fe <__rt_cbsys_exec+0x22>
1c0096f4:	4501                	li	a0,0
1c0096f6:	40b2                	lw	ra,12(sp)
1c0096f8:	4422                	lw	s0,8(sp)
1c0096fa:	0141                	addi	sp,sp,16
1c0096fc:	8082                	ret
1c0096fe:	401c                	lw	a5,0(s0)
1c009700:	4048                	lw	a0,4(s0)
1c009702:	9782                	jalr	a5
1c009704:	e119                	bnez	a0,1c00970a <__rt_cbsys_exec+0x2e>
1c009706:	4400                	lw	s0,8(s0)
1c009708:	b7ed                	j	1c0096f2 <__rt_cbsys_exec+0x16>
1c00970a:	557d                	li	a0,-1
1c00970c:	b7ed                	j	1c0096f6 <__rt_cbsys_exec+0x1a>

1c00970e <__rt_utils_init>:
1c00970e:	1c0017b7          	lui	a5,0x1c001
1c009712:	ec878793          	addi	a5,a5,-312 # 1c000ec8 <cbsys_first>
1c009716:	0007a023          	sw	zero,0(a5)
1c00971a:	0007a223          	sw	zero,4(a5)
1c00971e:	0007a423          	sw	zero,8(a5)
1c009722:	0007a623          	sw	zero,12(a5)
1c009726:	0007a823          	sw	zero,16(a5)
1c00972a:	0007aa23          	sw	zero,20(a5)
1c00972e:	8082                	ret

1c009730 <__rt_fc_lock>:
1c009730:	1141                	addi	sp,sp,-16
1c009732:	c422                	sw	s0,8(sp)
1c009734:	842a                	mv	s0,a0
1c009736:	c606                	sw	ra,12(sp)
1c009738:	c226                	sw	s1,4(sp)
1c00973a:	c04a                	sw	s2,0(sp)
1c00973c:	300474f3          	csrrci	s1,mstatus,8
1c009740:	401c                	lw	a5,0(s0)
1c009742:	eb99                	bnez	a5,1c009758 <__rt_fc_lock+0x28>
1c009744:	4785                	li	a5,1
1c009746:	c01c                	sw	a5,0(s0)
1c009748:	30049073          	csrw	mstatus,s1
1c00974c:	40b2                	lw	ra,12(sp)
1c00974e:	4422                	lw	s0,8(sp)
1c009750:	4492                	lw	s1,4(sp)
1c009752:	4902                	lw	s2,0(sp)
1c009754:	0141                	addi	sp,sp,16
1c009756:	8082                	ret
1c009758:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c00975c:	4585                	li	a1,1
1c00975e:	e3ff7517          	auipc	a0,0xe3ff7
1c009762:	8ca50513          	addi	a0,a0,-1846 # 28 <__rt_sched>
1c009766:	c45c                	sw	a5,12(s0)
1c009768:	29f1                	jal	1c009c44 <__rt_event_execute>
1c00976a:	bfd9                	j	1c009740 <__rt_fc_lock+0x10>

1c00976c <__rt_fc_unlock>:
1c00976c:	300476f3          	csrrci	a3,mstatus,8
1c009770:	415c                	lw	a5,4(a0)
1c009772:	e791                	bnez	a5,1c00977e <__rt_fc_unlock+0x12>
1c009774:	00052023          	sw	zero,0(a0)
1c009778:	30069073          	csrw	mstatus,a3
1c00977c:	8082                	ret
1c00977e:	43d8                	lw	a4,4(a5)
1c009780:	c158                	sw	a4,4(a0)
1c009782:	4705                	li	a4,1
1c009784:	08e78a23          	sb	a4,148(a5)
1c009788:	0957c783          	lbu	a5,149(a5)
1c00978c:	00201737          	lui	a4,0x201
1c009790:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f4418>
1c009794:	04078793          	addi	a5,a5,64
1c009798:	07da                	slli	a5,a5,0x16
1c00979a:	97ba                	add	a5,a5,a4
1c00979c:	0007a023          	sw	zero,0(a5)
1c0097a0:	bfe1                	j	1c009778 <__rt_fc_unlock+0xc>

1c0097a2 <__rt_fc_cluster_lock>:
1c0097a2:	f14027f3          	csrr	a5,mhartid
1c0097a6:	8795                	srai	a5,a5,0x5
1c0097a8:	03f7f793          	andi	a5,a5,63
1c0097ac:	08f58aa3          	sb	a5,149(a1)
1c0097b0:	4785                	li	a5,1
1c0097b2:	08f58b23          	sb	a5,150(a1)
1c0097b6:	1c0097b7          	lui	a5,0x1c009
1c0097ba:	5fa78793          	addi	a5,a5,1530 # 1c0095fa <__rt_fc_cluster_lock_req>
1c0097be:	c188                	sw	a0,0(a1)
1c0097c0:	08058a23          	sb	zero,148(a1)
1c0097c4:	0205a423          	sw	zero,40(a1)
1c0097c8:	0205a623          	sw	zero,44(a1)
1c0097cc:	c59c                	sw	a5,8(a1)
1c0097ce:	c5cc                	sw	a1,12(a1)
1c0097d0:	05a1                	addi	a1,a1,8
1c0097d2:	0015e513          	ori	a0,a1,1
1c0097d6:	8abff06f          	j	1c009080 <__rt_cluster_push_fc_event>

1c0097da <__rt_fc_cluster_unlock>:
1c0097da:	f14027f3          	csrr	a5,mhartid
1c0097de:	8795                	srai	a5,a5,0x5
1c0097e0:	03f7f793          	andi	a5,a5,63
1c0097e4:	08f58aa3          	sb	a5,149(a1)
1c0097e8:	1c0097b7          	lui	a5,0x1c009
1c0097ec:	5fa78793          	addi	a5,a5,1530 # 1c0095fa <__rt_fc_cluster_lock_req>
1c0097f0:	c188                	sw	a0,0(a1)
1c0097f2:	08058a23          	sb	zero,148(a1)
1c0097f6:	08058b23          	sb	zero,150(a1)
1c0097fa:	0205a423          	sw	zero,40(a1)
1c0097fe:	0205a623          	sw	zero,44(a1)
1c009802:	c59c                	sw	a5,8(a1)
1c009804:	c5cc                	sw	a1,12(a1)
1c009806:	05a1                	addi	a1,a1,8
1c009808:	0015e513          	ori	a0,a1,1
1c00980c:	875ff06f          	j	1c009080 <__rt_cluster_push_fc_event>

1c009810 <__rt_event_enqueue>:
1c009810:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c009814:	00052c23          	sw	zero,24(a0)
1c009818:	c799                	beqz	a5,1c009826 <__rt_event_enqueue+0x16>
1c00981a:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c00981e:	cf88                	sw	a0,24(a5)
1c009820:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c009824:	8082                	ret
1c009826:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c00982a:	bfdd                	j	1c009820 <__rt_event_enqueue+0x10>

1c00982c <__rt_bridge_check_bridge_req.part.5>:
1c00982c:	1c001737          	lui	a4,0x1c001
1c009830:	fdc70793          	addi	a5,a4,-36 # 1c000fdc <__hal_debug_struct>
1c009834:	0a47a783          	lw	a5,164(a5)
1c009838:	fdc70713          	addi	a4,a4,-36
1c00983c:	c789                	beqz	a5,1c009846 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c00983e:	4f94                	lw	a3,24(a5)
1c009840:	e681                	bnez	a3,1c009848 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c009842:	0af72623          	sw	a5,172(a4)
1c009846:	8082                	ret
1c009848:	479c                	lw	a5,8(a5)
1c00984a:	bfcd                	j	1c00983c <__rt_bridge_check_bridge_req.part.5+0x10>

1c00984c <__rt_bridge_wait>:
1c00984c:	f14027f3          	csrr	a5,mhartid
1c009850:	8795                	srai	a5,a5,0x5
1c009852:	03f7f793          	andi	a5,a5,63
1c009856:	477d                	li	a4,31
1c009858:	02e79a63          	bne	a5,a4,1c00988c <__rt_bridge_wait+0x40>
1c00985c:	1a10a7b7          	lui	a5,0x1a10a
1c009860:	6711                	lui	a4,0x4
1c009862:	300476f3          	csrrci	a3,mstatus,8
1c009866:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa1061f8>
1c00986a:	01161593          	slli	a1,a2,0x11
1c00986e:	0005cb63          	bltz	a1,1c009884 <__rt_bridge_wait+0x38>
1c009872:	80e7a223          	sw	a4,-2044(a5)
1c009876:	10500073          	wfi
1c00987a:	80e7a423          	sw	a4,-2040(a5)
1c00987e:	30069073          	csrw	mstatus,a3
1c009882:	b7c5                	j	1c009862 <__rt_bridge_wait+0x16>
1c009884:	80e7aa23          	sw	a4,-2028(a5)
1c009888:	30069073          	csrw	mstatus,a3
1c00988c:	8082                	ret

1c00988e <__rt_bridge_handle_notif>:
1c00988e:	1141                	addi	sp,sp,-16
1c009890:	c422                	sw	s0,8(sp)
1c009892:	1c001437          	lui	s0,0x1c001
1c009896:	fdc40793          	addi	a5,s0,-36 # 1c000fdc <__hal_debug_struct>
1c00989a:	0a47a783          	lw	a5,164(a5)
1c00989e:	c606                	sw	ra,12(sp)
1c0098a0:	c226                	sw	s1,4(sp)
1c0098a2:	c04a                	sw	s2,0(sp)
1c0098a4:	fdc40413          	addi	s0,s0,-36
1c0098a8:	c399                	beqz	a5,1c0098ae <__rt_bridge_handle_notif+0x20>
1c0098aa:	4bd8                	lw	a4,20(a5)
1c0098ac:	e30d                	bnez	a4,1c0098ce <__rt_bridge_handle_notif+0x40>
1c0098ae:	0b442783          	lw	a5,180(s0)
1c0098b2:	c789                	beqz	a5,1c0098bc <__rt_bridge_handle_notif+0x2e>
1c0098b4:	43a8                	lw	a0,64(a5)
1c0098b6:	0a042a23          	sw	zero,180(s0)
1c0098ba:	3f99                	jal	1c009810 <__rt_event_enqueue>
1c0098bc:	0ac42783          	lw	a5,172(s0)
1c0098c0:	eb95                	bnez	a5,1c0098f4 <__rt_bridge_handle_notif+0x66>
1c0098c2:	4422                	lw	s0,8(sp)
1c0098c4:	40b2                	lw	ra,12(sp)
1c0098c6:	4492                	lw	s1,4(sp)
1c0098c8:	4902                	lw	s2,0(sp)
1c0098ca:	0141                	addi	sp,sp,16
1c0098cc:	b785                	j	1c00982c <__rt_bridge_check_bridge_req.part.5>
1c0098ce:	4784                	lw	s1,8(a5)
1c0098d0:	4fd8                	lw	a4,28(a5)
1c0098d2:	0a942223          	sw	s1,164(s0)
1c0098d6:	cb01                	beqz	a4,1c0098e6 <__rt_bridge_handle_notif+0x58>
1c0098d8:	0b042703          	lw	a4,176(s0)
1c0098dc:	c798                	sw	a4,8(a5)
1c0098de:	0af42823          	sw	a5,176(s0)
1c0098e2:	87a6                	mv	a5,s1
1c0098e4:	b7d1                	j	1c0098a8 <__rt_bridge_handle_notif+0x1a>
1c0098e6:	43a8                	lw	a0,64(a5)
1c0098e8:	30047973          	csrrci	s2,mstatus,8
1c0098ec:	3715                	jal	1c009810 <__rt_event_enqueue>
1c0098ee:	30091073          	csrw	mstatus,s2
1c0098f2:	bfc5                	j	1c0098e2 <__rt_bridge_handle_notif+0x54>
1c0098f4:	40b2                	lw	ra,12(sp)
1c0098f6:	4422                	lw	s0,8(sp)
1c0098f8:	4492                	lw	s1,4(sp)
1c0098fa:	4902                	lw	s2,0(sp)
1c0098fc:	0141                	addi	sp,sp,16
1c0098fe:	8082                	ret

1c009900 <__rt_bridge_check_connection>:
1c009900:	1c001737          	lui	a4,0x1c001
1c009904:	fdc70713          	addi	a4,a4,-36 # 1c000fdc <__hal_debug_struct>
1c009908:	471c                	lw	a5,8(a4)
1c00990a:	ef95                	bnez	a5,1c009946 <__rt_bridge_check_connection+0x46>
1c00990c:	1a1047b7          	lui	a5,0x1a104
1c009910:	5bfc                	lw	a5,116(a5)
1c009912:	469d                	li	a3,7
1c009914:	83a5                	srli	a5,a5,0x9
1c009916:	8b9d                	andi	a5,a5,7
1c009918:	02d79763          	bne	a5,a3,1c009946 <__rt_bridge_check_connection+0x46>
1c00991c:	1141                	addi	sp,sp,-16
1c00991e:	c422                	sw	s0,8(sp)
1c009920:	c226                	sw	s1,4(sp)
1c009922:	c606                	sw	ra,12(sp)
1c009924:	4785                	li	a5,1
1c009926:	c71c                	sw	a5,8(a4)
1c009928:	1a1044b7          	lui	s1,0x1a104
1c00992c:	441d                	li	s0,7
1c00992e:	58fc                	lw	a5,116(s1)
1c009930:	83a5                	srli	a5,a5,0x9
1c009932:	8b9d                	andi	a5,a5,7
1c009934:	00878763          	beq	a5,s0,1c009942 <__rt_bridge_check_connection+0x42>
1c009938:	40b2                	lw	ra,12(sp)
1c00993a:	4422                	lw	s0,8(sp)
1c00993c:	4492                	lw	s1,4(sp)
1c00993e:	0141                	addi	sp,sp,16
1c009940:	8082                	ret
1c009942:	3729                	jal	1c00984c <__rt_bridge_wait>
1c009944:	b7ed                	j	1c00992e <__rt_bridge_check_connection+0x2e>
1c009946:	8082                	ret

1c009948 <__rt_bridge_set_available>:
1c009948:	1c0017b7          	lui	a5,0x1c001
1c00994c:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__hal_debug_struct>
1c009950:	479c                	lw	a5,8(a5)
1c009952:	8082                	ret

1c009954 <__rt_bridge_send_notif>:
1c009954:	1141                	addi	sp,sp,-16
1c009956:	c606                	sw	ra,12(sp)
1c009958:	3765                	jal	1c009900 <__rt_bridge_check_connection>
1c00995a:	40b2                	lw	ra,12(sp)
1c00995c:	1c0017b7          	lui	a5,0x1c001
1c009960:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__hal_debug_struct>
1c009964:	479c                	lw	a5,8(a5)
1c009966:	0141                	addi	sp,sp,16
1c009968:	8082                	ret

1c00996a <__rt_bridge_clear_notif>:
1c00996a:	1141                	addi	sp,sp,-16
1c00996c:	c606                	sw	ra,12(sp)
1c00996e:	3f49                	jal	1c009900 <__rt_bridge_check_connection>
1c009970:	1c0017b7          	lui	a5,0x1c001
1c009974:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__hal_debug_struct>
1c009978:	4798                	lw	a4,8(a5)
1c00997a:	c311                	beqz	a4,1c00997e <__rt_bridge_clear_notif+0x14>
1c00997c:	479c                	lw	a5,8(a5)
1c00997e:	40b2                	lw	ra,12(sp)
1c009980:	0141                	addi	sp,sp,16
1c009982:	8082                	ret

1c009984 <__rt_bridge_printf_flush>:
1c009984:	1141                	addi	sp,sp,-16
1c009986:	c422                	sw	s0,8(sp)
1c009988:	c606                	sw	ra,12(sp)
1c00998a:	1c001437          	lui	s0,0x1c001
1c00998e:	3f8d                	jal	1c009900 <__rt_bridge_check_connection>
1c009990:	fdc40793          	addi	a5,s0,-36 # 1c000fdc <__hal_debug_struct>
1c009994:	479c                	lw	a5,8(a5)
1c009996:	c385                	beqz	a5,1c0099b6 <__rt_bridge_printf_flush+0x32>
1c009998:	fdc40413          	addi	s0,s0,-36
1c00999c:	485c                	lw	a5,20(s0)
1c00999e:	e399                	bnez	a5,1c0099a4 <__rt_bridge_printf_flush+0x20>
1c0099a0:	4c1c                	lw	a5,24(s0)
1c0099a2:	cb91                	beqz	a5,1c0099b6 <__rt_bridge_printf_flush+0x32>
1c0099a4:	3f45                	jal	1c009954 <__rt_bridge_send_notif>
1c0099a6:	485c                	lw	a5,20(s0)
1c0099a8:	e789                	bnez	a5,1c0099b2 <__rt_bridge_printf_flush+0x2e>
1c0099aa:	4422                	lw	s0,8(sp)
1c0099ac:	40b2                	lw	ra,12(sp)
1c0099ae:	0141                	addi	sp,sp,16
1c0099b0:	bf6d                	j	1c00996a <__rt_bridge_clear_notif>
1c0099b2:	3d69                	jal	1c00984c <__rt_bridge_wait>
1c0099b4:	bfcd                	j	1c0099a6 <__rt_bridge_printf_flush+0x22>
1c0099b6:	40b2                	lw	ra,12(sp)
1c0099b8:	4422                	lw	s0,8(sp)
1c0099ba:	0141                	addi	sp,sp,16
1c0099bc:	8082                	ret

1c0099be <__rt_bridge_req_shutdown>:
1c0099be:	1141                	addi	sp,sp,-16
1c0099c0:	c606                	sw	ra,12(sp)
1c0099c2:	c422                	sw	s0,8(sp)
1c0099c4:	c226                	sw	s1,4(sp)
1c0099c6:	3f2d                	jal	1c009900 <__rt_bridge_check_connection>
1c0099c8:	1c0017b7          	lui	a5,0x1c001
1c0099cc:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__hal_debug_struct>
1c0099d0:	479c                	lw	a5,8(a5)
1c0099d2:	cb95                	beqz	a5,1c009a06 <__rt_bridge_req_shutdown+0x48>
1c0099d4:	3f45                	jal	1c009984 <__rt_bridge_printf_flush>
1c0099d6:	1a1044b7          	lui	s1,0x1a104
1c0099da:	441d                	li	s0,7
1c0099dc:	58fc                	lw	a5,116(s1)
1c0099de:	83a5                	srli	a5,a5,0x9
1c0099e0:	8b9d                	andi	a5,a5,7
1c0099e2:	02878763          	beq	a5,s0,1c009a10 <__rt_bridge_req_shutdown+0x52>
1c0099e6:	1a1044b7          	lui	s1,0x1a104
1c0099ea:	441d                	li	s0,7
1c0099ec:	58fc                	lw	a5,116(s1)
1c0099ee:	83a5                	srli	a5,a5,0x9
1c0099f0:	8b9d                	andi	a5,a5,7
1c0099f2:	02879163          	bne	a5,s0,1c009a14 <__rt_bridge_req_shutdown+0x56>
1c0099f6:	1a1044b7          	lui	s1,0x1a104
1c0099fa:	441d                	li	s0,7
1c0099fc:	58fc                	lw	a5,116(s1)
1c0099fe:	83a5                	srli	a5,a5,0x9
1c009a00:	8b9d                	andi	a5,a5,7
1c009a02:	00878b63          	beq	a5,s0,1c009a18 <__rt_bridge_req_shutdown+0x5a>
1c009a06:	40b2                	lw	ra,12(sp)
1c009a08:	4422                	lw	s0,8(sp)
1c009a0a:	4492                	lw	s1,4(sp)
1c009a0c:	0141                	addi	sp,sp,16
1c009a0e:	8082                	ret
1c009a10:	3d35                	jal	1c00984c <__rt_bridge_wait>
1c009a12:	b7e9                	j	1c0099dc <__rt_bridge_req_shutdown+0x1e>
1c009a14:	3d25                	jal	1c00984c <__rt_bridge_wait>
1c009a16:	bfd9                	j	1c0099ec <__rt_bridge_req_shutdown+0x2e>
1c009a18:	3d15                	jal	1c00984c <__rt_bridge_wait>
1c009a1a:	b7cd                	j	1c0099fc <__rt_bridge_req_shutdown+0x3e>

1c009a1c <__rt_bridge_init>:
1c009a1c:	1c0017b7          	lui	a5,0x1c001
1c009a20:	1a10a737          	lui	a4,0x1a10a
1c009a24:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__hal_debug_struct>
1c009a28:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa1061fc>
1c009a2c:	0ae7ac23          	sw	a4,184(a5)
1c009a30:	4741                	li	a4,16
1c009a32:	0a07a223          	sw	zero,164(a5)
1c009a36:	0a07a623          	sw	zero,172(a5)
1c009a3a:	0a07aa23          	sw	zero,180(a5)
1c009a3e:	0ae7ae23          	sw	a4,188(a5)
1c009a42:	00400793          	li	a5,4
1c009a46:	0007a823          	sw	zero,16(a5)
1c009a4a:	0007a023          	sw	zero,0(a5)
1c009a4e:	8082                	ret

1c009a50 <__rt_thread_enqueue_ready>:
1c009a50:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c009a54:	02052c23          	sw	zero,56(a0)
1c009a58:	01800793          	li	a5,24
1c009a5c:	e711                	bnez	a4,1c009a68 <__rt_thread_enqueue_ready+0x18>
1c009a5e:	c388                	sw	a0,0(a5)
1c009a60:	c3c8                	sw	a0,4(a5)
1c009a62:	0c052a23          	sw	zero,212(a0)
1c009a66:	8082                	ret
1c009a68:	43d8                	lw	a4,4(a5)
1c009a6a:	df08                	sw	a0,56(a4)
1c009a6c:	bfd5                	j	1c009a60 <__rt_thread_enqueue_ready+0x10>

1c009a6e <__rt_thread_sleep>:
1c009a6e:	01800713          	li	a4,24
1c009a72:	4708                	lw	a0,8(a4)
1c009a74:	01800793          	li	a5,24
1c009a78:	438c                	lw	a1,0(a5)
1c009a7a:	c999                	beqz	a1,1c009a90 <__rt_thread_sleep+0x22>
1c009a7c:	5d98                	lw	a4,56(a1)
1c009a7e:	c398                	sw	a4,0(a5)
1c009a80:	4705                	li	a4,1
1c009a82:	0ce5aa23          	sw	a4,212(a1)
1c009a86:	00b50c63          	beq	a0,a1,1c009a9e <__rt_thread_sleep+0x30>
1c009a8a:	c78c                	sw	a1,8(a5)
1c009a8c:	83bfe06f          	j	1c0082c6 <__rt_thread_switch>
1c009a90:	10500073          	wfi
1c009a94:	30045073          	csrwi	mstatus,8
1c009a98:	30047773          	csrrci	a4,mstatus,8
1c009a9c:	bff1                	j	1c009a78 <__rt_thread_sleep+0xa>
1c009a9e:	8082                	ret

1c009aa0 <rt_thread_exit>:
1c009aa0:	300477f3          	csrrci	a5,mstatus,8
1c009aa4:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009aa8:	4705                	li	a4,1
1c009aaa:	c3e8                	sw	a0,68(a5)
1c009aac:	5fc8                	lw	a0,60(a5)
1c009aae:	c3b8                	sw	a4,64(a5)
1c009ab0:	c909                	beqz	a0,1c009ac2 <rt_thread_exit+0x22>
1c009ab2:	0d452783          	lw	a5,212(a0)
1c009ab6:	c791                	beqz	a5,1c009ac2 <rt_thread_exit+0x22>
1c009ab8:	1141                	addi	sp,sp,-16
1c009aba:	c606                	sw	ra,12(sp)
1c009abc:	3f51                	jal	1c009a50 <__rt_thread_enqueue_ready>
1c009abe:	40b2                	lw	ra,12(sp)
1c009ac0:	0141                	addi	sp,sp,16
1c009ac2:	b775                	j	1c009a6e <__rt_thread_sleep>

1c009ac4 <__rt_thread_wakeup>:
1c009ac4:	5d18                	lw	a4,56(a0)
1c009ac6:	eb09                	bnez	a4,1c009ad8 <__rt_thread_wakeup+0x14>
1c009ac8:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c009acc:	00a70663          	beq	a4,a0,1c009ad8 <__rt_thread_wakeup+0x14>
1c009ad0:	0d452783          	lw	a5,212(a0)
1c009ad4:	c391                	beqz	a5,1c009ad8 <__rt_thread_wakeup+0x14>
1c009ad6:	bfad                	j	1c009a50 <__rt_thread_enqueue_ready>
1c009ad8:	8082                	ret

1c009ada <__rt_thread_sched_init>:
1c009ada:	1141                	addi	sp,sp,-16
1c009adc:	c422                	sw	s0,8(sp)
1c009ade:	1c0087b7          	lui	a5,0x1c008
1c009ae2:	1c001437          	lui	s0,0x1c001
1c009ae6:	c226                	sw	s1,4(sp)
1c009ae8:	c04a                	sw	s2,0(sp)
1c009aea:	c606                	sw	ra,12(sp)
1c009aec:	ee040413          	addi	s0,s0,-288 # 1c000ee0 <__rt_thread_main>
1c009af0:	2c078793          	addi	a5,a5,704 # 1c0082c0 <__rt_thread_start>
1c009af4:	c01c                	sw	a5,0(s0)
1c009af6:	1c00a7b7          	lui	a5,0x1c00a
1c009afa:	04840913          	addi	s2,s0,72
1c009afe:	aa078793          	addi	a5,a5,-1376 # 1c009aa0 <rt_thread_exit>
1c009b02:	01800493          	li	s1,24
1c009b06:	c45c                	sw	a5,12(s0)
1c009b08:	854a                	mv	a0,s2
1c009b0a:	4785                	li	a5,1
1c009b0c:	e3ff6597          	auipc	a1,0xe3ff6
1c009b10:	51c58593          	addi	a1,a1,1308 # 28 <__rt_sched>
1c009b14:	0cf42a23          	sw	a5,212(s0)
1c009b18:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa1009ec>
1c009b1c:	02042a23          	sw	zero,52(s0)
1c009b20:	00042223          	sw	zero,4(s0)
1c009b24:	00042423          	sw	zero,8(s0)
1c009b28:	2829                	jal	1c009b42 <__rt_event_init>
1c009b2a:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c009b2e:	c480                	sw	s0,8(s1)
1c009b30:	40b2                	lw	ra,12(sp)
1c009b32:	d03c                	sw	a5,96(s0)
1c009b34:	4422                	lw	s0,8(sp)
1c009b36:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c009b3a:	4492                	lw	s1,4(sp)
1c009b3c:	4902                	lw	s2,0(sp)
1c009b3e:	0141                	addi	sp,sp,16
1c009b40:	8082                	ret

1c009b42 <__rt_event_init>:
1c009b42:	02052023          	sw	zero,32(a0)
1c009b46:	02052223          	sw	zero,36(a0)
1c009b4a:	02052823          	sw	zero,48(a0)
1c009b4e:	00052023          	sw	zero,0(a0)
1c009b52:	8082                	ret

1c009b54 <__rt_wait_event_prepare_blocking>:
1c009b54:	02400793          	li	a5,36
1c009b58:	4388                	lw	a0,0(a5)
1c009b5a:	4d18                	lw	a4,24(a0)
1c009b5c:	02052223          	sw	zero,36(a0)
1c009b60:	c398                	sw	a4,0(a5)
1c009b62:	4785                	li	a5,1
1c009b64:	d11c                	sw	a5,32(a0)
1c009b66:	00052023          	sw	zero,0(a0)
1c009b6a:	8082                	ret

1c009b6c <rt_event_alloc>:
1c009b6c:	1141                	addi	sp,sp,-16
1c009b6e:	c422                	sw	s0,8(sp)
1c009b70:	842e                	mv	s0,a1
1c009b72:	c606                	sw	ra,12(sp)
1c009b74:	c226                	sw	s1,4(sp)
1c009b76:	300474f3          	csrrci	s1,mstatus,8
1c009b7a:	f14027f3          	csrr	a5,mhartid
1c009b7e:	8795                	srai	a5,a5,0x5
1c009b80:	03f7f793          	andi	a5,a5,63
1c009b84:	477d                	li	a4,31
1c009b86:	00378513          	addi	a0,a5,3
1c009b8a:	00e79363          	bne	a5,a4,1c009b90 <rt_event_alloc+0x24>
1c009b8e:	4501                	li	a0,0
1c009b90:	08c00593          	li	a1,140
1c009b94:	02b405b3          	mul	a1,s0,a1
1c009b98:	882ff0ef          	jal	ra,1c008c1a <rt_alloc>
1c009b9c:	87aa                	mv	a5,a0
1c009b9e:	557d                	li	a0,-1
1c009ba0:	cf91                	beqz	a5,1c009bbc <rt_event_alloc+0x50>
1c009ba2:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c009ba6:	4581                	li	a1,0
1c009ba8:	4601                	li	a2,0
1c009baa:	02400713          	li	a4,36
1c009bae:	00864c63          	blt	a2,s0,1c009bc6 <rt_event_alloc+0x5a>
1c009bb2:	c191                	beqz	a1,1c009bb6 <rt_event_alloc+0x4a>
1c009bb4:	c314                	sw	a3,0(a4)
1c009bb6:	30049073          	csrw	mstatus,s1
1c009bba:	4501                	li	a0,0
1c009bbc:	40b2                	lw	ra,12(sp)
1c009bbe:	4422                	lw	s0,8(sp)
1c009bc0:	4492                	lw	s1,4(sp)
1c009bc2:	0141                	addi	sp,sp,16
1c009bc4:	8082                	ret
1c009bc6:	cf94                	sw	a3,24(a5)
1c009bc8:	0207a023          	sw	zero,32(a5)
1c009bcc:	0207a223          	sw	zero,36(a5)
1c009bd0:	0207a823          	sw	zero,48(a5)
1c009bd4:	0007a023          	sw	zero,0(a5)
1c009bd8:	86be                	mv	a3,a5
1c009bda:	0605                	addi	a2,a2,1
1c009bdc:	4585                	li	a1,1
1c009bde:	08c78793          	addi	a5,a5,140
1c009be2:	b7f1                	j	1c009bae <rt_event_alloc+0x42>

1c009be4 <rt_event_get>:
1c009be4:	30047773          	csrrci	a4,mstatus,8
1c009be8:	02400793          	li	a5,36
1c009bec:	4388                	lw	a0,0(a5)
1c009bee:	c509                	beqz	a0,1c009bf8 <rt_event_get+0x14>
1c009bf0:	4d14                	lw	a3,24(a0)
1c009bf2:	c150                	sw	a2,4(a0)
1c009bf4:	c394                	sw	a3,0(a5)
1c009bf6:	c10c                	sw	a1,0(a0)
1c009bf8:	30071073          	csrw	mstatus,a4
1c009bfc:	8082                	ret

1c009bfe <rt_event_get_blocking>:
1c009bfe:	30047773          	csrrci	a4,mstatus,8
1c009c02:	02400793          	li	a5,36
1c009c06:	4388                	lw	a0,0(a5)
1c009c08:	c909                	beqz	a0,1c009c1a <rt_event_get_blocking+0x1c>
1c009c0a:	4d14                	lw	a3,24(a0)
1c009c0c:	00052223          	sw	zero,4(a0)
1c009c10:	c394                	sw	a3,0(a5)
1c009c12:	4785                	li	a5,1
1c009c14:	00052023          	sw	zero,0(a0)
1c009c18:	d11c                	sw	a5,32(a0)
1c009c1a:	30071073          	csrw	mstatus,a4
1c009c1e:	8082                	ret

1c009c20 <rt_event_push>:
1c009c20:	30047773          	csrrci	a4,mstatus,8
1c009c24:	02400693          	li	a3,36
1c009c28:	42d4                	lw	a3,4(a3)
1c009c2a:	00052c23          	sw	zero,24(a0)
1c009c2e:	02400793          	li	a5,36
1c009c32:	e691                	bnez	a3,1c009c3e <rt_event_push+0x1e>
1c009c34:	c3c8                	sw	a0,4(a5)
1c009c36:	c788                	sw	a0,8(a5)
1c009c38:	30071073          	csrw	mstatus,a4
1c009c3c:	8082                	ret
1c009c3e:	4794                	lw	a3,8(a5)
1c009c40:	ce88                	sw	a0,24(a3)
1c009c42:	bfd5                	j	1c009c36 <rt_event_push+0x16>

1c009c44 <__rt_event_execute>:
1c009c44:	1141                	addi	sp,sp,-16
1c009c46:	c422                	sw	s0,8(sp)
1c009c48:	02400793          	li	a5,36
1c009c4c:	43dc                	lw	a5,4(a5)
1c009c4e:	c606                	sw	ra,12(sp)
1c009c50:	c226                	sw	s1,4(sp)
1c009c52:	02400413          	li	s0,36
1c009c56:	eb91                	bnez	a5,1c009c6a <__rt_event_execute+0x26>
1c009c58:	c1a9                	beqz	a1,1c009c9a <__rt_event_execute+0x56>
1c009c5a:	10500073          	wfi
1c009c5e:	30045073          	csrwi	mstatus,8
1c009c62:	300477f3          	csrrci	a5,mstatus,8
1c009c66:	405c                	lw	a5,4(s0)
1c009c68:	cb8d                	beqz	a5,1c009c9a <__rt_event_execute+0x56>
1c009c6a:	4485                	li	s1,1
1c009c6c:	4f98                	lw	a4,24(a5)
1c009c6e:	53d4                	lw	a3,36(a5)
1c009c70:	00978823          	sb	s1,16(a5)
1c009c74:	c058                	sw	a4,4(s0)
1c009c76:	43c8                	lw	a0,4(a5)
1c009c78:	4398                	lw	a4,0(a5)
1c009c7a:	e691                	bnez	a3,1c009c86 <__rt_event_execute+0x42>
1c009c7c:	5394                	lw	a3,32(a5)
1c009c7e:	e681                	bnez	a3,1c009c86 <__rt_event_execute+0x42>
1c009c80:	4014                	lw	a3,0(s0)
1c009c82:	c01c                	sw	a5,0(s0)
1c009c84:	cf94                	sw	a3,24(a5)
1c009c86:	0207a023          	sw	zero,32(a5)
1c009c8a:	c711                	beqz	a4,1c009c96 <__rt_event_execute+0x52>
1c009c8c:	30045073          	csrwi	mstatus,8
1c009c90:	9702                	jalr	a4
1c009c92:	300477f3          	csrrci	a5,mstatus,8
1c009c96:	405c                	lw	a5,4(s0)
1c009c98:	fbf1                	bnez	a5,1c009c6c <__rt_event_execute+0x28>
1c009c9a:	40b2                	lw	ra,12(sp)
1c009c9c:	4422                	lw	s0,8(sp)
1c009c9e:	4492                	lw	s1,4(sp)
1c009ca0:	0141                	addi	sp,sp,16
1c009ca2:	8082                	ret

1c009ca4 <__rt_wait_event>:
1c009ca4:	1141                	addi	sp,sp,-16
1c009ca6:	c422                	sw	s0,8(sp)
1c009ca8:	c606                	sw	ra,12(sp)
1c009caa:	842a                	mv	s0,a0
1c009cac:	501c                	lw	a5,32(s0)
1c009cae:	ef81                	bnez	a5,1c009cc6 <__rt_wait_event+0x22>
1c009cb0:	581c                	lw	a5,48(s0)
1c009cb2:	eb91                	bnez	a5,1c009cc6 <__rt_wait_event+0x22>
1c009cb4:	02400793          	li	a5,36
1c009cb8:	4398                	lw	a4,0(a5)
1c009cba:	40b2                	lw	ra,12(sp)
1c009cbc:	c380                	sw	s0,0(a5)
1c009cbe:	cc18                	sw	a4,24(s0)
1c009cc0:	4422                	lw	s0,8(sp)
1c009cc2:	0141                	addi	sp,sp,16
1c009cc4:	8082                	ret
1c009cc6:	4585                	li	a1,1
1c009cc8:	4501                	li	a0,0
1c009cca:	3fad                	jal	1c009c44 <__rt_event_execute>
1c009ccc:	b7c5                	j	1c009cac <__rt_wait_event+0x8>

1c009cce <rt_event_wait>:
1c009cce:	1141                	addi	sp,sp,-16
1c009cd0:	c606                	sw	ra,12(sp)
1c009cd2:	c422                	sw	s0,8(sp)
1c009cd4:	30047473          	csrrci	s0,mstatus,8
1c009cd8:	37f1                	jal	1c009ca4 <__rt_wait_event>
1c009cda:	30041073          	csrw	mstatus,s0
1c009cde:	40b2                	lw	ra,12(sp)
1c009ce0:	4422                	lw	s0,8(sp)
1c009ce2:	0141                	addi	sp,sp,16
1c009ce4:	8082                	ret

1c009ce6 <__rt_event_sched_init>:
1c009ce6:	02400513          	li	a0,36
1c009cea:	00052023          	sw	zero,0(a0)
1c009cee:	00052223          	sw	zero,4(a0)
1c009cf2:	4585                	li	a1,1
1c009cf4:	0511                	addi	a0,a0,4
1c009cf6:	bd9d                	j	1c009b6c <rt_event_alloc>

1c009cf8 <__rt_fll_set_freq>:
1c009cf8:	1141                	addi	sp,sp,-16
1c009cfa:	c422                	sw	s0,8(sp)
1c009cfc:	c226                	sw	s1,4(sp)
1c009cfe:	c606                	sw	ra,12(sp)
1c009d00:	842a                	mv	s0,a0
1c009d02:	84ae                	mv	s1,a1
1c009d04:	e111                	bnez	a0,1c009d08 <__rt_fll_set_freq+0x10>
1c009d06:	3965                	jal	1c0099be <__rt_bridge_req_shutdown>
1c009d08:	8526                	mv	a0,s1
1c009d0a:	feafe0ef          	jal	ra,1c0084f4 <__clzsi2>
1c009d0e:	1579                	addi	a0,a0,-2
1c009d10:	00155793          	srli	a5,a0,0x1
1c009d14:	e391                	bnez	a5,1c009d18 <__rt_fll_set_freq+0x20>
1c009d16:	4785                	li	a5,1
1c009d18:	fff78713          	addi	a4,a5,-1
1c009d1c:	4505                	li	a0,1
1c009d1e:	00e51533          	sll	a0,a0,a4
1c009d22:	00f494b3          	sll	s1,s1,a5
1c009d26:	7761                	lui	a4,0xffff8
1c009d28:	8f65                	and	a4,a4,s1
1c009d2a:	1c0016b7          	lui	a3,0x1c001
1c009d2e:	953a                	add	a0,a0,a4
1c009d30:	1f068693          	addi	a3,a3,496 # 1c0011f0 <__rt_fll_freq>
1c009d34:	00241713          	slli	a4,s0,0x2
1c009d38:	9736                	add	a4,a4,a3
1c009d3a:	00f55533          	srl	a0,a0,a5
1c009d3e:	c308                	sw	a0,0(a4)
1c009d40:	1c001737          	lui	a4,0x1c001
1c009d44:	18c70713          	addi	a4,a4,396 # 1c00118c <__rt_fll_is_on>
1c009d48:	9722                	add	a4,a4,s0
1c009d4a:	00074703          	lbu	a4,0(a4)
1c009d4e:	c715                	beqz	a4,1c009d7a <__rt_fll_set_freq+0x82>
1c009d50:	1a100737          	lui	a4,0x1a100
1c009d54:	0711                	addi	a4,a4,4
1c009d56:	0412                	slli	s0,s0,0x4
1c009d58:	943a                	add	s0,s0,a4
1c009d5a:	4018                	lw	a4,0(s0)
1c009d5c:	80bd                	srli	s1,s1,0xf
1c009d5e:	76c1                	lui	a3,0xffff0
1c009d60:	04c2                	slli	s1,s1,0x10
1c009d62:	8f75                	and	a4,a4,a3
1c009d64:	80c1                	srli	s1,s1,0x10
1c009d66:	0785                	addi	a5,a5,1
1c009d68:	c40006b7          	lui	a3,0xc4000
1c009d6c:	8f45                	or	a4,a4,s1
1c009d6e:	8bbd                	andi	a5,a5,15
1c009d70:	16fd                	addi	a3,a3,-1
1c009d72:	07ea                	slli	a5,a5,0x1a
1c009d74:	8f75                	and	a4,a4,a3
1c009d76:	8fd9                	or	a5,a5,a4
1c009d78:	c01c                	sw	a5,0(s0)
1c009d7a:	40b2                	lw	ra,12(sp)
1c009d7c:	4422                	lw	s0,8(sp)
1c009d7e:	4492                	lw	s1,4(sp)
1c009d80:	0141                	addi	sp,sp,16
1c009d82:	8082                	ret

1c009d84 <__rt_fll_init>:
1c009d84:	1141                	addi	sp,sp,-16
1c009d86:	1a1005b7          	lui	a1,0x1a100
1c009d8a:	00451613          	slli	a2,a0,0x4
1c009d8e:	c226                	sw	s1,4(sp)
1c009d90:	84aa                	mv	s1,a0
1c009d92:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fc9f0>
1c009d96:	9532                	add	a0,a0,a2
1c009d98:	4114                	lw	a3,0(a0)
1c009d9a:	c606                	sw	ra,12(sp)
1c009d9c:	c422                	sw	s0,8(sp)
1c009d9e:	87b6                	mv	a5,a3
1c009da0:	0406c963          	bltz	a3,1c009df2 <__rt_fll_init+0x6e>
1c009da4:	00858793          	addi	a5,a1,8
1c009da8:	97b2                	add	a5,a5,a2
1c009daa:	4398                	lw	a4,0(a5)
1c009dac:	7841                	lui	a6,0xffff0
1c009dae:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c009db2:	01077733          	and	a4,a4,a6
1c009db6:	6809                	lui	a6,0x2
1c009db8:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c009dbc:	01076733          	or	a4,a4,a6
1c009dc0:	f0010837          	lui	a6,0xf0010
1c009dc4:	187d                	addi	a6,a6,-1
1c009dc6:	01077733          	and	a4,a4,a6
1c009dca:	00500837          	lui	a6,0x500
1c009dce:	01076733          	or	a4,a4,a6
1c009dd2:	05b1                	addi	a1,a1,12
1c009dd4:	c398                	sw	a4,0(a5)
1c009dd6:	962e                	add	a2,a2,a1
1c009dd8:	421c                	lw	a5,0(a2)
1c009dda:	fc010737          	lui	a4,0xfc010
1c009dde:	177d                	addi	a4,a4,-1
1c009de0:	8ff9                	and	a5,a5,a4
1c009de2:	014c0737          	lui	a4,0x14c0
1c009de6:	8fd9                	or	a5,a5,a4
1c009de8:	c21c                	sw	a5,0(a2)
1c009dea:	c00007b7          	lui	a5,0xc0000
1c009dee:	8fd5                	or	a5,a5,a3
1c009df0:	c11c                	sw	a5,0(a0)
1c009df2:	1c001637          	lui	a2,0x1c001
1c009df6:	00249713          	slli	a4,s1,0x2
1c009dfa:	1f060613          	addi	a2,a2,496 # 1c0011f0 <__rt_fll_freq>
1c009dfe:	9732                	add	a4,a4,a2
1c009e00:	4300                	lw	s0,0(a4)
1c009e02:	c015                	beqz	s0,1c009e26 <__rt_fll_init+0xa2>
1c009e04:	85a2                	mv	a1,s0
1c009e06:	8526                	mv	a0,s1
1c009e08:	3dc5                	jal	1c009cf8 <__rt_fll_set_freq>
1c009e0a:	1c001537          	lui	a0,0x1c001
1c009e0e:	18c50513          	addi	a0,a0,396 # 1c00118c <__rt_fll_is_on>
1c009e12:	9526                	add	a0,a0,s1
1c009e14:	4785                	li	a5,1
1c009e16:	00f50023          	sb	a5,0(a0)
1c009e1a:	40b2                	lw	ra,12(sp)
1c009e1c:	8522                	mv	a0,s0
1c009e1e:	4422                	lw	s0,8(sp)
1c009e20:	4492                	lw	s1,4(sp)
1c009e22:	0141                	addi	sp,sp,16
1c009e24:	8082                	ret
1c009e26:	06c2                	slli	a3,a3,0x10
1c009e28:	83e9                	srli	a5,a5,0x1a
1c009e2a:	82c1                	srli	a3,a3,0x10
1c009e2c:	8bbd                	andi	a5,a5,15
1c009e2e:	06be                	slli	a3,a3,0xf
1c009e30:	17fd                	addi	a5,a5,-1
1c009e32:	00f6d433          	srl	s0,a3,a5
1c009e36:	c300                	sw	s0,0(a4)
1c009e38:	bfc9                	j	1c009e0a <__rt_fll_init+0x86>

1c009e3a <__rt_fll_deinit>:
1c009e3a:	1c0017b7          	lui	a5,0x1c001
1c009e3e:	18c78793          	addi	a5,a5,396 # 1c00118c <__rt_fll_is_on>
1c009e42:	953e                	add	a0,a0,a5
1c009e44:	00050023          	sb	zero,0(a0)
1c009e48:	8082                	ret

1c009e4a <__rt_flls_constructor>:
1c009e4a:	1c0017b7          	lui	a5,0x1c001
1c009e4e:	1e07a823          	sw	zero,496(a5) # 1c0011f0 <__rt_fll_freq>
1c009e52:	1f078793          	addi	a5,a5,496
1c009e56:	0007a223          	sw	zero,4(a5)
1c009e5a:	1c0017b7          	lui	a5,0x1c001
1c009e5e:	18079623          	sh	zero,396(a5) # 1c00118c <__rt_fll_is_on>
1c009e62:	8082                	ret

1c009e64 <gcd>:
1c009e64:	cd19                	beqz	a0,1c009e82 <gcd+0x1e>
1c009e66:	cd81                	beqz	a1,1c009e7e <gcd+0x1a>
1c009e68:	00054463          	bltz	a0,1c009e70 <gcd+0xc>
1c009e6c:	0005d563          	bgez	a1,1c009e76 <gcd+0x12>
1c009e70:	55fd                	li	a1,-1
1c009e72:	a031                	j	1c009e7e <gcd+0x1a>
1c009e74:	85be                	mv	a1,a5
1c009e76:	02b567b3          	rem	a5,a0,a1
1c009e7a:	852e                	mv	a0,a1
1c009e7c:	ffe5                	bnez	a5,1c009e74 <gcd+0x10>
1c009e7e:	852e                	mv	a0,a1
1c009e80:	8082                	ret
1c009e82:	4581                	li	a1,0
1c009e84:	bfed                	j	1c009e7e <gcd+0x1a>

1c009e86 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c009e86:	1101                	addi	sp,sp,-32
1c009e88:	1c0017b7          	lui	a5,0x1c001
1c009e8c:	c84a                	sw	s2,16(sp)
1c009e8e:	1907a903          	lw	s2,400(a5) # 1c001190 <__rt_periph_lcm>
1c009e92:	c452                	sw	s4,8(sp)
1c009e94:	8a2e                	mv	s4,a1
1c009e96:	85ca                	mv	a1,s2
1c009e98:	ce06                	sw	ra,28(sp)
1c009e9a:	cc22                	sw	s0,24(sp)
1c009e9c:	ca26                	sw	s1,20(sp)
1c009e9e:	842a                	mv	s0,a0
1c009ea0:	c64e                	sw	s3,12(sp)
1c009ea2:	89aa                	mv	s3,a0
1c009ea4:	37c1                	jal	1c009e64 <gcd>
1c009ea6:	02a44533          	div	a0,s0,a0
1c009eaa:	03250933          	mul	s2,a0,s2
1c009eae:	4511                	li	a0,4
1c009eb0:	82dff0ef          	jal	ra,1c0096dc <__rt_cbsys_exec>
1c009eb4:	1c0017b7          	lui	a5,0x1c001
1c009eb8:	1f07a783          	lw	a5,496(a5) # 1c0011f0 <__rt_fll_freq>
1c009ebc:	028954b3          	divu	s1,s2,s0
1c009ec0:	0527f263          	bleu	s2,a5,1c009f04 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c009ec4:	1a1047b7          	lui	a5,0x1a104
1c009ec8:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa100ac0>
1c009ecc:	4705                	li	a4,1
1c009ece:	0ce7ae23          	sw	a4,220(a5)
1c009ed2:	85a2                	mv	a1,s0
1c009ed4:	4501                	li	a0,0
1c009ed6:	350d                	jal	1c009cf8 <__rt_fll_set_freq>
1c009ed8:	57fd                	li	a5,-1
1c009eda:	00fa0963          	beq	s4,a5,1c009eec <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c009ede:	c099                	beqz	s1,1c009ee4 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c009ee0:	029459b3          	divu	s3,s0,s1
1c009ee4:	1c0017b7          	lui	a5,0x1c001
1c009ee8:	1f37ac23          	sw	s3,504(a5) # 1c0011f8 <__rt_freq_domains>
1c009eec:	4515                	li	a0,5
1c009eee:	feeff0ef          	jal	ra,1c0096dc <__rt_cbsys_exec>
1c009ef2:	40f2                	lw	ra,28(sp)
1c009ef4:	4462                	lw	s0,24(sp)
1c009ef6:	44d2                	lw	s1,20(sp)
1c009ef8:	4942                	lw	s2,16(sp)
1c009efa:	49b2                	lw	s3,12(sp)
1c009efc:	4a22                	lw	s4,8(sp)
1c009efe:	4501                	li	a0,0
1c009f00:	6105                	addi	sp,sp,32
1c009f02:	8082                	ret
1c009f04:	85a2                	mv	a1,s0
1c009f06:	4501                	li	a0,0
1c009f08:	3bc5                	jal	1c009cf8 <__rt_fll_set_freq>
1c009f0a:	1a1047b7          	lui	a5,0x1a104
1c009f0e:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa100ac0>
1c009f12:	4705                	li	a4,1
1c009f14:	0ce7ae23          	sw	a4,220(a5)
1c009f18:	b7c1                	j	1c009ed8 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c009f1a <rt_freq_set_and_get>:
1c009f1a:	1141                	addi	sp,sp,-16
1c009f1c:	852e                	mv	a0,a1
1c009f1e:	c606                	sw	ra,12(sp)
1c009f20:	c422                	sw	s0,8(sp)
1c009f22:	30047473          	csrrci	s0,mstatus,8
1c009f26:	4581                	li	a1,0
1c009f28:	3fb9                	jal	1c009e86 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c009f2a:	30041073          	csrw	mstatus,s0
1c009f2e:	40b2                	lw	ra,12(sp)
1c009f30:	4422                	lw	s0,8(sp)
1c009f32:	00a03533          	snez	a0,a0
1c009f36:	40a00533          	neg	a0,a0
1c009f3a:	0141                	addi	sp,sp,16
1c009f3c:	8082                	ret

1c009f3e <__rt_freq_init>:
1c009f3e:	1141                	addi	sp,sp,-16
1c009f40:	c422                	sw	s0,8(sp)
1c009f42:	c606                	sw	ra,12(sp)
1c009f44:	3719                	jal	1c009e4a <__rt_flls_constructor>
1c009f46:	1c0017b7          	lui	a5,0x1c001
1c009f4a:	09c7a703          	lw	a4,156(a5) # 1c00109c <__rt_platform>
1c009f4e:	4785                	li	a5,1
1c009f50:	1c001437          	lui	s0,0x1c001
1c009f54:	02f70663          	beq	a4,a5,1c009f80 <__rt_freq_init+0x42>
1c009f58:	4501                	li	a0,0
1c009f5a:	352d                	jal	1c009d84 <__rt_fll_init>
1c009f5c:	1ea42c23          	sw	a0,504(s0) # 1c0011f8 <__rt_freq_domains>
1c009f60:	1a1047b7          	lui	a5,0x1a104
1c009f64:	4709                	li	a4,2
1c009f66:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa100abc>
1c009f6a:	4705                	li	a4,1
1c009f6c:	0ce7ac23          	sw	a4,216(a5)
1c009f70:	40b2                	lw	ra,12(sp)
1c009f72:	4422                	lw	s0,8(sp)
1c009f74:	0ce7ae23          	sw	a4,220(a5)
1c009f78:	0ce7aa23          	sw	a4,212(a5)
1c009f7c:	0141                	addi	sp,sp,16
1c009f7e:	8082                	ret
1c009f80:	026267b7          	lui	a5,0x2626
1c009f84:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2619014>
1c009f88:	1ef42c23          	sw	a5,504(s0)
1c009f8c:	bfd1                	j	1c009f60 <__rt_freq_init+0x22>

1c009f8e <hal_itc_wait_for_event_noirq>:
1c009f8e:	1a10a7b7          	lui	a5,0x1a10a
1c009f92:	300476f3          	csrrci	a3,mstatus,8
1c009f96:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa1061f8>
1c009f9a:	8f69                	and	a4,a4,a0
1c009f9c:	eb11                	bnez	a4,1c009fb0 <hal_itc_wait_for_event_noirq+0x22>
1c009f9e:	80a7a223          	sw	a0,-2044(a5)
1c009fa2:	10500073          	wfi
1c009fa6:	80a7a423          	sw	a0,-2040(a5)
1c009faa:	30069073          	csrw	mstatus,a3
1c009fae:	b7d5                	j	1c009f92 <hal_itc_wait_for_event_noirq+0x4>
1c009fb0:	80a7aa23          	sw	a0,-2028(a5)
1c009fb4:	30069073          	csrw	mstatus,a3
1c009fb8:	8082                	ret

1c009fba <__rt_pmu_cluster_power_down>:
1c009fba:	1a1047b7          	lui	a5,0x1a104
1c009fbe:	5bbc                	lw	a5,112(a5)
1c009fc0:	01079713          	slli	a4,a5,0x10
1c009fc4:	02074c63          	bltz	a4,1c009ffc <__rt_pmu_cluster_power_down+0x42>
1c009fc8:	1141                	addi	sp,sp,-16
1c009fca:	c422                	sw	s0,8(sp)
1c009fcc:	c606                	sw	ra,12(sp)
1c009fce:	c226                	sw	s1,4(sp)
1c009fd0:	1a104437          	lui	s0,0x1a104
1c009fd4:	547c                	lw	a5,108(s0)
1c009fd6:	e385                	bnez	a5,1c009ff6 <__rt_pmu_cluster_power_down+0x3c>
1c009fd8:	4485                	li	s1,1
1c009fda:	c444                	sw	s1,12(s0)
1c009fdc:	478d                	li	a5,3
1c009fde:	d83c                	sw	a5,112(s0)
1c009fe0:	00800537          	lui	a0,0x800
1c009fe4:	376d                	jal	1c009f8e <hal_itc_wait_for_event_noirq>
1c009fe6:	d824                	sw	s1,112(s0)
1c009fe8:	4422                	lw	s0,8(sp)
1c009fea:	40b2                	lw	ra,12(sp)
1c009fec:	4492                	lw	s1,4(sp)
1c009fee:	00400537          	lui	a0,0x400
1c009ff2:	0141                	addi	sp,sp,16
1c009ff4:	bf69                	j	1c009f8e <hal_itc_wait_for_event_noirq>
1c009ff6:	4505                	li	a0,1
1c009ff8:	2a11                	jal	1c00a10c <rt_time_wait_us>
1c009ffa:	bfe9                	j	1c009fd4 <__rt_pmu_cluster_power_down+0x1a>
1c009ffc:	8082                	ret

1c009ffe <__rt_pmu_cluster_power_up>:
1c009ffe:	1141                	addi	sp,sp,-16
1c00a000:	c606                	sw	ra,12(sp)
1c00a002:	c422                	sw	s0,8(sp)
1c00a004:	478d                	li	a5,3
1c00a006:	1a104437          	lui	s0,0x1a104
1c00a00a:	d83c                	sw	a5,112(s0)
1c00a00c:	00400537          	lui	a0,0x400
1c00a010:	3fbd                	jal	1c009f8e <hal_itc_wait_for_event_noirq>
1c00a012:	02700793          	li	a5,39
1c00a016:	d83c                	sw	a5,112(s0)
1c00a018:	00800537          	lui	a0,0x800
1c00a01c:	3f8d                	jal	1c009f8e <hal_itc_wait_for_event_noirq>
1c00a01e:	6791                	lui	a5,0x4
1c00a020:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa1009f8>
1c00a024:	02778793          	addi	a5,a5,39 # 4027 <_l1_preload_size+0xa17>
1c00a028:	d83c                	sw	a5,112(s0)
1c00a02a:	40b2                	lw	ra,12(sp)
1c00a02c:	4422                	lw	s0,8(sp)
1c00a02e:	4505                	li	a0,1
1c00a030:	0141                	addi	sp,sp,16
1c00a032:	8082                	ret

1c00a034 <__rt_pmu_init>:
1c00a034:	1a1077b7          	lui	a5,0x1a107
1c00a038:	4741                	li	a4,16
1c00a03a:	cb98                	sw	a4,16(a5)
1c00a03c:	1a10a7b7          	lui	a5,0x1a10a
1c00a040:	02000737          	lui	a4,0x2000
1c00a044:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa106200>
1c00a048:	4709                	li	a4,2
1c00a04a:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c00a04e:	8082                	ret

1c00a050 <rt_padframe_set>:
1c00a050:	300476f3          	csrrci	a3,mstatus,8
1c00a054:	4158                	lw	a4,4(a0)
1c00a056:	1a1047b7          	lui	a5,0x1a104
1c00a05a:	4310                	lw	a2,0(a4)
1c00a05c:	cb90                	sw	a2,16(a5)
1c00a05e:	4350                	lw	a2,4(a4)
1c00a060:	cbd0                	sw	a2,20(a5)
1c00a062:	4710                	lw	a2,8(a4)
1c00a064:	cf90                	sw	a2,24(a5)
1c00a066:	4758                	lw	a4,12(a4)
1c00a068:	cfd8                	sw	a4,28(a5)
1c00a06a:	30069073          	csrw	mstatus,a3
1c00a06e:	8082                	ret

1c00a070 <__rt_padframe_init>:
1c00a070:	1c001537          	lui	a0,0x1c001
1c00a074:	fcc50513          	addi	a0,a0,-52 # 1c000fcc <__rt_padframe_profiles>
1c00a078:	bfe1                	j	1c00a050 <rt_padframe_set>

1c00a07a <__rt_time_poweroff>:
1c00a07a:	1a10b7b7          	lui	a5,0x1a10b
1c00a07e:	47d8                	lw	a4,12(a5)
1c00a080:	1c0017b7          	lui	a5,0x1c001
1c00a084:	4501                	li	a0,0
1c00a086:	18e7aa23          	sw	a4,404(a5) # 1c001194 <timer_count>
1c00a08a:	8082                	ret

1c00a08c <__rt_time_poweron>:
1c00a08c:	1c0017b7          	lui	a5,0x1c001
1c00a090:	1947a703          	lw	a4,404(a5) # 1c001194 <timer_count>
1c00a094:	1a10b7b7          	lui	a5,0x1a10b
1c00a098:	4501                	li	a0,0
1c00a09a:	c7d8                	sw	a4,12(a5)
1c00a09c:	8082                	ret

1c00a09e <rt_event_push_delayed>:
1c00a09e:	30047373          	csrrci	t1,mstatus,8
1c00a0a2:	1a10b6b7          	lui	a3,0x1a10b
1c00a0a6:	46d0                	lw	a2,12(a3)
1c00a0a8:	1c001737          	lui	a4,0x1c001
1c00a0ac:	20072783          	lw	a5,512(a4) # 1c001200 <first_delayed>
1c00a0b0:	86ba                	mv	a3,a4
1c00a0b2:	0005d363          	bgez	a1,1c00a0b8 <rt_event_push_delayed+0x1a>
1c00a0b6:	4581                	li	a1,0
1c00a0b8:	4779                	li	a4,30
1c00a0ba:	02e5c5b3          	div	a1,a1,a4
1c00a0be:	80000737          	lui	a4,0x80000
1c00a0c2:	fff74713          	not	a4,a4
1c00a0c6:	00e67833          	and	a6,a2,a4
1c00a0ca:	0585                	addi	a1,a1,1
1c00a0cc:	962e                	add	a2,a2,a1
1c00a0ce:	d950                	sw	a2,52(a0)
1c00a0d0:	982e                	add	a6,a6,a1
1c00a0d2:	4601                	li	a2,0
1c00a0d4:	c799                	beqz	a5,1c00a0e2 <rt_event_push_delayed+0x44>
1c00a0d6:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa107a20>
1c00a0da:	00e8f8b3          	and	a7,a7,a4
1c00a0de:	0108e863          	bltu	a7,a6,1c00a0ee <rt_event_push_delayed+0x50>
1c00a0e2:	ca09                	beqz	a2,1c00a0f4 <rt_event_push_delayed+0x56>
1c00a0e4:	ce08                	sw	a0,24(a2)
1c00a0e6:	cd1c                	sw	a5,24(a0)
1c00a0e8:	30031073          	csrw	mstatus,t1
1c00a0ec:	8082                	ret
1c00a0ee:	863e                	mv	a2,a5
1c00a0f0:	4f9c                	lw	a5,24(a5)
1c00a0f2:	b7cd                	j	1c00a0d4 <rt_event_push_delayed+0x36>
1c00a0f4:	cd1c                	sw	a5,24(a0)
1c00a0f6:	1a10b7b7          	lui	a5,0x1a10b
1c00a0fa:	47d8                	lw	a4,12(a5)
1c00a0fc:	20a6a023          	sw	a0,512(a3) # 1a10b200 <__l1_end+0xa107bec>
1c00a100:	95ba                	add	a1,a1,a4
1c00a102:	cbcc                	sw	a1,20(a5)
1c00a104:	08500713          	li	a4,133
1c00a108:	c3d8                	sw	a4,4(a5)
1c00a10a:	bff9                	j	1c00a0e8 <rt_event_push_delayed+0x4a>

1c00a10c <rt_time_wait_us>:
1c00a10c:	1101                	addi	sp,sp,-32
1c00a10e:	85aa                	mv	a1,a0
1c00a110:	4501                	li	a0,0
1c00a112:	ce06                	sw	ra,28(sp)
1c00a114:	cc22                	sw	s0,24(sp)
1c00a116:	c62e                	sw	a1,12(sp)
1c00a118:	34dd                	jal	1c009bfe <rt_event_get_blocking>
1c00a11a:	45b2                	lw	a1,12(sp)
1c00a11c:	842a                	mv	s0,a0
1c00a11e:	3741                	jal	1c00a09e <rt_event_push_delayed>
1c00a120:	8522                	mv	a0,s0
1c00a122:	4462                	lw	s0,24(sp)
1c00a124:	40f2                	lw	ra,28(sp)
1c00a126:	6105                	addi	sp,sp,32
1c00a128:	b65d                	j	1c009cce <rt_event_wait>

1c00a12a <__rt_time_init>:
1c00a12a:	1141                	addi	sp,sp,-16
1c00a12c:	1c0017b7          	lui	a5,0x1c001
1c00a130:	2007a023          	sw	zero,512(a5) # 1c001200 <first_delayed>
1c00a134:	08300713          	li	a4,131
1c00a138:	1a10b7b7          	lui	a5,0x1a10b
1c00a13c:	c606                	sw	ra,12(sp)
1c00a13e:	c422                	sw	s0,8(sp)
1c00a140:	1c00a5b7          	lui	a1,0x1c00a
1c00a144:	c3d8                	sw	a4,4(a5)
1c00a146:	1c258593          	addi	a1,a1,450 # 1c00a1c2 <__rt_timer_handler>
1c00a14a:	452d                	li	a0,11
1c00a14c:	bc0ff0ef          	jal	ra,1c00950c <rt_irq_set_handler>
1c00a150:	f14027f3          	csrr	a5,mhartid
1c00a154:	8795                	srai	a5,a5,0x5
1c00a156:	6705                	lui	a4,0x1
1c00a158:	03f7f793          	andi	a5,a5,63
1c00a15c:	46fd                	li	a3,31
1c00a15e:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a162:	04d79863          	bne	a5,a3,1c00a1b2 <__rt_time_init+0x88>
1c00a166:	1a10a7b7          	lui	a5,0x1a10a
1c00a16a:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1061f0>
1c00a16e:	1c00a5b7          	lui	a1,0x1c00a
1c00a172:	4601                	li	a2,0
1c00a174:	07a58593          	addi	a1,a1,122 # 1c00a07a <__rt_time_poweroff>
1c00a178:	4509                	li	a0,2
1c00a17a:	d22ff0ef          	jal	ra,1c00969c <__rt_cbsys_add>
1c00a17e:	1c00a5b7          	lui	a1,0x1c00a
1c00a182:	842a                	mv	s0,a0
1c00a184:	4601                	li	a2,0
1c00a186:	08c58593          	addi	a1,a1,140 # 1c00a08c <__rt_time_poweron>
1c00a18a:	450d                	li	a0,3
1c00a18c:	d10ff0ef          	jal	ra,1c00969c <__rt_cbsys_add>
1c00a190:	8d41                	or	a0,a0,s0
1c00a192:	c505                	beqz	a0,1c00a1ba <__rt_time_init+0x90>
1c00a194:	f1402673          	csrr	a2,mhartid
1c00a198:	1c000537          	lui	a0,0x1c000
1c00a19c:	40565593          	srai	a1,a2,0x5
1c00a1a0:	03f5f593          	andi	a1,a1,63
1c00a1a4:	8a7d                	andi	a2,a2,31
1c00a1a6:	51450513          	addi	a0,a0,1300 # 1c000514 <__DTOR_END__+0x228>
1c00a1aa:	015000ef          	jal	ra,1c00a9be <printf>
1c00a1ae:	79c000ef          	jal	ra,1c00a94a <abort>
1c00a1b2:	002047b7          	lui	a5,0x204
1c00a1b6:	cbd8                	sw	a4,20(a5)
1c00a1b8:	bf5d                	j	1c00a16e <__rt_time_init+0x44>
1c00a1ba:	40b2                	lw	ra,12(sp)
1c00a1bc:	4422                	lw	s0,8(sp)
1c00a1be:	0141                	addi	sp,sp,16
1c00a1c0:	8082                	ret

1c00a1c2 <__rt_timer_handler>:
1c00a1c2:	7179                	addi	sp,sp,-48
1c00a1c4:	ce36                	sw	a3,28(sp)
1c00a1c6:	cc3a                	sw	a4,24(sp)
1c00a1c8:	1a10b6b7          	lui	a3,0x1a10b
1c00a1cc:	1c001737          	lui	a4,0x1c001
1c00a1d0:	d61a                	sw	t1,44(sp)
1c00a1d2:	d032                	sw	a2,32(sp)
1c00a1d4:	ca3e                	sw	a5,20(sp)
1c00a1d6:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa1079f8>
1c00a1da:	20072783          	lw	a5,512(a4) # 1c001200 <first_delayed>
1c00a1de:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a1e2:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a1e6:	c842                	sw	a6,16(sp)
1c00a1e8:	80000837          	lui	a6,0x80000
1c00a1ec:	d42a                	sw	a0,40(sp)
1c00a1ee:	d22e                	sw	a1,36(sp)
1c00a1f0:	c646                	sw	a7,12(sp)
1c00a1f2:	c472                	sw	t3,8(sp)
1c00a1f4:	4581                	li	a1,0
1c00a1f6:	4501                	li	a0,0
1c00a1f8:	ffe84813          	xori	a6,a6,-2
1c00a1fc:	efb9                	bnez	a5,1c00a25a <__rt_timer_handler+0x98>
1c00a1fe:	c119                	beqz	a0,1c00a204 <__rt_timer_handler+0x42>
1c00a200:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a204:	c199                	beqz	a1,1c00a20a <__rt_timer_handler+0x48>
1c00a206:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a20a:	20072023          	sw	zero,512(a4)
1c00a20e:	1a10b7b7          	lui	a5,0x1a10b
1c00a212:	08100713          	li	a4,129
1c00a216:	c3d8                	sw	a4,4(a5)
1c00a218:	6785                	lui	a5,0x1
1c00a21a:	1a10a737          	lui	a4,0x1a10a
1c00a21e:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a222:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa106200>
1c00a226:	5332                	lw	t1,44(sp)
1c00a228:	5522                	lw	a0,40(sp)
1c00a22a:	5592                	lw	a1,36(sp)
1c00a22c:	5602                	lw	a2,32(sp)
1c00a22e:	46f2                	lw	a3,28(sp)
1c00a230:	4762                	lw	a4,24(sp)
1c00a232:	47d2                	lw	a5,20(sp)
1c00a234:	4842                	lw	a6,16(sp)
1c00a236:	48b2                	lw	a7,12(sp)
1c00a238:	4e22                	lw	t3,8(sp)
1c00a23a:	6145                	addi	sp,sp,48
1c00a23c:	30200073          	mret
1c00a240:	0187a883          	lw	a7,24(a5)
1c00a244:	0007ac23          	sw	zero,24(a5)
1c00a248:	c611                	beqz	a2,1c00a254 <__rt_timer_handler+0x92>
1c00a24a:	ce9c                	sw	a5,24(a3)
1c00a24c:	86be                	mv	a3,a5
1c00a24e:	4585                	li	a1,1
1c00a250:	87c6                	mv	a5,a7
1c00a252:	b76d                	j	1c00a1fc <__rt_timer_handler+0x3a>
1c00a254:	863e                	mv	a2,a5
1c00a256:	4505                	li	a0,1
1c00a258:	bfd5                	j	1c00a24c <__rt_timer_handler+0x8a>
1c00a25a:	0347a883          	lw	a7,52(a5)
1c00a25e:	41130e33          	sub	t3,t1,a7
1c00a262:	fdc87fe3          	bleu	t3,a6,1c00a240 <__rt_timer_handler+0x7e>
1c00a266:	c119                	beqz	a0,1c00a26c <__rt_timer_handler+0xaa>
1c00a268:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a26c:	c199                	beqz	a1,1c00a272 <__rt_timer_handler+0xb0>
1c00a26e:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a272:	20f72023          	sw	a5,512(a4)
1c00a276:	1a10b737          	lui	a4,0x1a10b
1c00a27a:	475c                	lw	a5,12(a4)
1c00a27c:	406787b3          	sub	a5,a5,t1
1c00a280:	97c6                	add	a5,a5,a7
1c00a282:	cb5c                	sw	a5,20(a4)
1c00a284:	08500793          	li	a5,133
1c00a288:	c35c                	sw	a5,4(a4)
1c00a28a:	bf71                	j	1c00a226 <__rt_timer_handler+0x64>

1c00a28c <rt_periph_copy>:
1c00a28c:	7179                	addi	sp,sp,-48
1c00a28e:	d422                	sw	s0,40(sp)
1c00a290:	842a                	mv	s0,a0
1c00a292:	d606                	sw	ra,44(sp)
1c00a294:	d226                	sw	s1,36(sp)
1c00a296:	d04a                	sw	s2,32(sp)
1c00a298:	30047973          	csrrci	s2,mstatus,8
1c00a29c:	4015d493          	srai	s1,a1,0x1
1c00a2a0:	1a102537          	lui	a0,0x1a102
1c00a2a4:	049e                	slli	s1,s1,0x7
1c00a2a6:	94aa                	add	s1,s1,a0
1c00a2a8:	00459513          	slli	a0,a1,0x4
1c00a2ac:	8941                	andi	a0,a0,16
1c00a2ae:	94aa                	add	s1,s1,a0
1c00a2b0:	853e                	mv	a0,a5
1c00a2b2:	ef89                	bnez	a5,1c00a2cc <rt_periph_copy+0x40>
1c00a2b4:	ce2e                	sw	a1,28(sp)
1c00a2b6:	cc32                	sw	a2,24(sp)
1c00a2b8:	ca36                	sw	a3,20(sp)
1c00a2ba:	c83a                	sw	a4,16(sp)
1c00a2bc:	c63e                	sw	a5,12(sp)
1c00a2be:	897ff0ef          	jal	ra,1c009b54 <__rt_wait_event_prepare_blocking>
1c00a2c2:	47b2                	lw	a5,12(sp)
1c00a2c4:	4742                	lw	a4,16(sp)
1c00a2c6:	46d2                	lw	a3,20(sp)
1c00a2c8:	4662                	lw	a2,24(sp)
1c00a2ca:	45f2                	lw	a1,28(sp)
1c00a2cc:	e419                	bnez	s0,1c00a2da <rt_periph_copy+0x4e>
1c00a2ce:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa0fea20>
1c00a2d2:	04052023          	sw	zero,64(a0)
1c00a2d6:	04052823          	sw	zero,80(a0)
1c00a2da:	00c42803          	lw	a6,12(s0)
1c00a2de:	c054                	sw	a3,4(s0)
1c00a2e0:	cc08                	sw	a0,24(s0)
1c00a2e2:	00f87813          	andi	a6,a6,15
1c00a2e6:	4891                	li	a7,4
1c00a2e8:	01076713          	ori	a4,a4,16
1c00a2ec:	0708ec63          	bltu	a7,a6,1c00a364 <rt_periph_copy+0xd8>
1c00a2f0:	04000893          	li	a7,64
1c00a2f4:	0596                	slli	a1,a1,0x5
1c00a2f6:	98ae                	add	a7,a7,a1
1c00a2f8:	0008a303          	lw	t1,0(a7)
1c00a2fc:	00042a23          	sw	zero,20(s0)
1c00a300:	04000813          	li	a6,64
1c00a304:	02031663          	bnez	t1,1c00a330 <rt_periph_copy+0xa4>
1c00a308:	0088a023          	sw	s0,0(a7)
1c00a30c:	00b808b3          	add	a7,a6,a1
1c00a310:	0088a303          	lw	t1,8(a7)
1c00a314:	0088a223          	sw	s0,4(a7)
1c00a318:	02031163          	bnez	t1,1c00a33a <rt_periph_copy+0xae>
1c00a31c:	0084a883          	lw	a7,8(s1)
1c00a320:	0208f893          	andi	a7,a7,32
1c00a324:	00089b63          	bnez	a7,1c00a33a <rt_periph_copy+0xae>
1c00a328:	c090                	sw	a2,0(s1)
1c00a32a:	c0d4                	sw	a3,4(s1)
1c00a32c:	c498                	sw	a4,8(s1)
1c00a32e:	a005                	j	1c00a34e <rt_periph_copy+0xc2>
1c00a330:	0048a883          	lw	a7,4(a7)
1c00a334:	0088aa23          	sw	s0,20(a7)
1c00a338:	bfd1                	j	1c00a30c <rt_periph_copy+0x80>
1c00a33a:	00042823          	sw	zero,16(s0)
1c00a33e:	c010                	sw	a2,0(s0)
1c00a340:	c054                	sw	a3,4(s0)
1c00a342:	c418                	sw	a4,8(s0)
1c00a344:	00031563          	bnez	t1,1c00a34e <rt_periph_copy+0xc2>
1c00a348:	982e                	add	a6,a6,a1
1c00a34a:	00882423          	sw	s0,8(a6) # 80000008 <pulp__FC+0x80000009>
1c00a34e:	e399                	bnez	a5,1c00a354 <rt_periph_copy+0xc8>
1c00a350:	955ff0ef          	jal	ra,1c009ca4 <__rt_wait_event>
1c00a354:	30091073          	csrw	mstatus,s2
1c00a358:	50b2                	lw	ra,44(sp)
1c00a35a:	5422                	lw	s0,40(sp)
1c00a35c:	5492                	lw	s1,36(sp)
1c00a35e:	5902                	lw	s2,32(sp)
1c00a360:	6145                	addi	sp,sp,48
1c00a362:	8082                	ret
1c00a364:	4899                	li	a7,6
1c00a366:	ff1814e3          	bne	a6,a7,1c00a34e <rt_periph_copy+0xc2>
1c00a36a:	04000893          	li	a7,64
1c00a36e:	0596                	slli	a1,a1,0x5
1c00a370:	98ae                	add	a7,a7,a1
1c00a372:	0008a303          	lw	t1,0(a7)
1c00a376:	00042a23          	sw	zero,20(s0)
1c00a37a:	04000813          	li	a6,64
1c00a37e:	00031f63          	bnez	t1,1c00a39c <rt_periph_copy+0x110>
1c00a382:	0088a023          	sw	s0,0(a7)
1c00a386:	95c2                	add	a1,a1,a6
1c00a388:	c1c0                	sw	s0,4(a1)
1c00a38a:	00031e63          	bnez	t1,1c00a3a6 <rt_periph_copy+0x11a>
1c00a38e:	02442803          	lw	a6,36(s0)
1c00a392:	1a1025b7          	lui	a1,0x1a102
1c00a396:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa0feb0c>
1c00a39a:	b779                	j	1c00a328 <rt_periph_copy+0x9c>
1c00a39c:	0048a883          	lw	a7,4(a7)
1c00a3a0:	0088aa23          	sw	s0,20(a7)
1c00a3a4:	b7cd                	j	1c00a386 <rt_periph_copy+0xfa>
1c00a3a6:	c418                	sw	a4,8(s0)
1c00a3a8:	4598                	lw	a4,8(a1)
1c00a3aa:	c010                	sw	a2,0(s0)
1c00a3ac:	c054                	sw	a3,4(s0)
1c00a3ae:	00042823          	sw	zero,16(s0)
1c00a3b2:	ff51                	bnez	a4,1c00a34e <rt_periph_copy+0xc2>
1c00a3b4:	c580                	sw	s0,8(a1)
1c00a3b6:	bf61                	j	1c00a34e <rt_periph_copy+0xc2>

1c00a3b8 <__rt_periph_init>:
1c00a3b8:	1c0085b7          	lui	a1,0x1c008
1c00a3bc:	04000693          	li	a3,64
1c00a3c0:	4601                	li	a2,0
1c00a3c2:	04000793          	li	a5,64
1c00a3c6:	1a1028b7          	lui	a7,0x1a102
1c00a3ca:	3a458593          	addi	a1,a1,932 # 1c0083a4 <udma_event_handler>
1c00a3ce:	4841                	li	a6,16
1c00a3d0:	40165713          	srai	a4,a2,0x1
1c00a3d4:	00461513          	slli	a0,a2,0x4
1c00a3d8:	071e                	slli	a4,a4,0x7
1c00a3da:	9746                	add	a4,a4,a7
1c00a3dc:	8941                	andi	a0,a0,16
1c00a3de:	972a                	add	a4,a4,a0
1c00a3e0:	0006a023          	sw	zero,0(a3)
1c00a3e4:	0006a423          	sw	zero,8(a3)
1c00a3e8:	c6d8                	sw	a4,12(a3)
1c00a3ea:	cecc                	sw	a1,28(a3)
1c00a3ec:	0605                	addi	a2,a2,1
1c00a3ee:	02068693          	addi	a3,a3,32
1c00a3f2:	fd061fe3          	bne	a2,a6,1c00a3d0 <__rt_periph_init+0x18>
1c00a3f6:	1c008737          	lui	a4,0x1c008
1c00a3fa:	37270713          	addi	a4,a4,882 # 1c008372 <__rt_soc_evt_no_udma>
1c00a3fe:	2007a023          	sw	zero,512(a5)
1c00a402:	20e7a423          	sw	a4,520(a5)
1c00a406:	20e7a623          	sw	a4,524(a5)
1c00a40a:	20e7a823          	sw	a4,528(a5)
1c00a40e:	20e7aa23          	sw	a4,532(a5)
1c00a412:	20e7ac23          	sw	a4,536(a5)
1c00a416:	20e7ae23          	sw	a4,540(a5)
1c00a41a:	22e7a023          	sw	a4,544(a5)
1c00a41e:	22e7a223          	sw	a4,548(a5)
1c00a422:	2007a223          	sw	zero,516(a5)
1c00a426:	8082                	ret

1c00a428 <__rt_i2c_init>:
1c00a428:	1c0107b7          	lui	a5,0x1c010
1c00a42c:	16878793          	addi	a5,a5,360 # 1c010168 <__cluster_text_end>
1c00a430:	00078223          	sb	zero,4(a5)
1c00a434:	00078a23          	sb	zero,20(a5)
1c00a438:	8082                	ret

1c00a43a <__rt_hyper_init>:
1c00a43a:	1c001737          	lui	a4,0x1c001
1c00a43e:	26800793          	li	a5,616
1c00a442:	18072c23          	sw	zero,408(a4) # 1c001198 <__pi_hyper_cluster_reqs_first>
1c00a446:	577d                	li	a4,-1
1c00a448:	0007aa23          	sw	zero,20(a5)
1c00a44c:	0207a823          	sw	zero,48(a5)
1c00a450:	cf98                	sw	a4,24(a5)
1c00a452:	8082                	ret

1c00a454 <__rt_spim_init>:
1c00a454:	1c0017b7          	lui	a5,0x1c001
1c00a458:	1807ae23          	sw	zero,412(a5) # 1c00119c <__rt_spim_open_count>
1c00a45c:	8082                	ret

1c00a45e <rt_is_fc>:
1c00a45e:	f1402573          	csrr	a0,mhartid
1c00a462:	8515                	srai	a0,a0,0x5
1c00a464:	03f57513          	andi	a0,a0,63
1c00a468:	1505                	addi	a0,a0,-31
1c00a46a:	00153513          	seqz	a0,a0
1c00a46e:	8082                	ret

1c00a470 <__rt_io_end_of_flush>:
1c00a470:	1c0017b7          	lui	a5,0x1c001
1c00a474:	1a07a223          	sw	zero,420(a5) # 1c0011a4 <__rt_io_pending_flush>
1c00a478:	00052c23          	sw	zero,24(a0)
1c00a47c:	8082                	ret

1c00a47e <__rt_io_uart_wait_req>:
1c00a47e:	1141                	addi	sp,sp,-16
1c00a480:	c226                	sw	s1,4(sp)
1c00a482:	84aa                	mv	s1,a0
1c00a484:	c606                	sw	ra,12(sp)
1c00a486:	c422                	sw	s0,8(sp)
1c00a488:	c04a                	sw	s2,0(sp)
1c00a48a:	30047973          	csrrci	s2,mstatus,8
1c00a48e:	1c001437          	lui	s0,0x1c001
1c00a492:	1a040413          	addi	s0,s0,416 # 1c0011a0 <__rt_io_event_current>
1c00a496:	4008                	lw	a0,0(s0)
1c00a498:	c509                	beqz	a0,1c00a4a2 <__rt_io_uart_wait_req+0x24>
1c00a49a:	835ff0ef          	jal	ra,1c009cce <rt_event_wait>
1c00a49e:	00042023          	sw	zero,0(s0)
1c00a4a2:	4785                	li	a5,1
1c00a4a4:	08f48623          	sb	a5,140(s1)
1c00a4a8:	08d4c783          	lbu	a5,141(s1)
1c00a4ac:	00201737          	lui	a4,0x201
1c00a4b0:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f4418>
1c00a4b4:	04078793          	addi	a5,a5,64
1c00a4b8:	07da                	slli	a5,a5,0x16
1c00a4ba:	97ba                	add	a5,a5,a4
1c00a4bc:	0007a023          	sw	zero,0(a5)
1c00a4c0:	30091073          	csrw	mstatus,s2
1c00a4c4:	40b2                	lw	ra,12(sp)
1c00a4c6:	4422                	lw	s0,8(sp)
1c00a4c8:	4492                	lw	s1,4(sp)
1c00a4ca:	4902                	lw	s2,0(sp)
1c00a4cc:	0141                	addi	sp,sp,16
1c00a4ce:	8082                	ret

1c00a4d0 <__rt_io_start>:
1c00a4d0:	1101                	addi	sp,sp,-32
1c00a4d2:	0028                	addi	a0,sp,8
1c00a4d4:	ce06                	sw	ra,28(sp)
1c00a4d6:	cc22                	sw	s0,24(sp)
1c00a4d8:	7e1000ef          	jal	ra,1c00b4b8 <rt_uart_conf_init>
1c00a4dc:	4585                	li	a1,1
1c00a4de:	4501                	li	a0,0
1c00a4e0:	e8cff0ef          	jal	ra,1c009b6c <rt_event_alloc>
1c00a4e4:	547d                	li	s0,-1
1c00a4e6:	ed1d                	bnez	a0,1c00a524 <__rt_io_start+0x54>
1c00a4e8:	1c0017b7          	lui	a5,0x1c001
1c00a4ec:	0a07a783          	lw	a5,160(a5) # 1c0010a0 <__rt_iodev_uart_baudrate>
1c00a4f0:	842a                	mv	s0,a0
1c00a4f2:	1c001537          	lui	a0,0x1c001
1c00a4f6:	e3ff6597          	auipc	a1,0xe3ff6
1c00a4fa:	b3258593          	addi	a1,a1,-1230 # 28 <__rt_sched>
1c00a4fe:	0ec50513          	addi	a0,a0,236 # 1c0010ec <__rt_io_event>
1c00a502:	c43e                	sw	a5,8(sp)
1c00a504:	e3eff0ef          	jal	ra,1c009b42 <__rt_event_init>
1c00a508:	1c0017b7          	lui	a5,0x1c001
1c00a50c:	1b07a503          	lw	a0,432(a5) # 1c0011b0 <__rt_iodev_uart_channel>
1c00a510:	4681                	li	a3,0
1c00a512:	4601                	li	a2,0
1c00a514:	002c                	addi	a1,sp,8
1c00a516:	050d                	addi	a0,a0,3
1c00a518:	7b1000ef          	jal	ra,1c00b4c8 <__rt_uart_open>
1c00a51c:	1c0017b7          	lui	a5,0x1c001
1c00a520:	1aa7a423          	sw	a0,424(a5) # 1c0011a8 <_rt_io_uart>
1c00a524:	8522                	mv	a0,s0
1c00a526:	40f2                	lw	ra,28(sp)
1c00a528:	4462                	lw	s0,24(sp)
1c00a52a:	6105                	addi	sp,sp,32
1c00a52c:	8082                	ret

1c00a52e <rt_event_execute.isra.2.constprop.11>:
1c00a52e:	1141                	addi	sp,sp,-16
1c00a530:	c606                	sw	ra,12(sp)
1c00a532:	c422                	sw	s0,8(sp)
1c00a534:	30047473          	csrrci	s0,mstatus,8
1c00a538:	4585                	li	a1,1
1c00a53a:	e3ff6517          	auipc	a0,0xe3ff6
1c00a53e:	aee50513          	addi	a0,a0,-1298 # 28 <__rt_sched>
1c00a542:	f02ff0ef          	jal	ra,1c009c44 <__rt_event_execute>
1c00a546:	30041073          	csrw	mstatus,s0
1c00a54a:	40b2                	lw	ra,12(sp)
1c00a54c:	4422                	lw	s0,8(sp)
1c00a54e:	0141                	addi	sp,sp,16
1c00a550:	8082                	ret

1c00a552 <__rt_io_lock>:
1c00a552:	1c0017b7          	lui	a5,0x1c001
1c00a556:	fec7a783          	lw	a5,-20(a5) # 1c000fec <__hal_debug_struct+0x10>
1c00a55a:	c791                	beqz	a5,1c00a566 <__rt_io_lock+0x14>
1c00a55c:	1c0017b7          	lui	a5,0x1c001
1c00a560:	1a87a783          	lw	a5,424(a5) # 1c0011a8 <_rt_io_uart>
1c00a564:	c3a1                	beqz	a5,1c00a5a4 <__rt_io_lock+0x52>
1c00a566:	7171                	addi	sp,sp,-176
1c00a568:	d706                	sw	ra,172(sp)
1c00a56a:	3dd5                	jal	1c00a45e <rt_is_fc>
1c00a56c:	1c0017b7          	lui	a5,0x1c001
1c00a570:	c901                	beqz	a0,1c00a580 <__rt_io_lock+0x2e>
1c00a572:	fbc78513          	addi	a0,a5,-68 # 1c000fbc <__rt_io_fc_lock>
1c00a576:	9baff0ef          	jal	ra,1c009730 <__rt_fc_lock>
1c00a57a:	50ba                	lw	ra,172(sp)
1c00a57c:	614d                	addi	sp,sp,176
1c00a57e:	8082                	ret
1c00a580:	002c                	addi	a1,sp,8
1c00a582:	fbc78513          	addi	a0,a5,-68
1c00a586:	a1cff0ef          	jal	ra,1c0097a2 <__rt_fc_cluster_lock>
1c00a58a:	4689                	li	a3,2
1c00a58c:	00204737          	lui	a4,0x204
1c00a590:	09c14783          	lbu	a5,156(sp)
1c00a594:	0ff7f793          	andi	a5,a5,255
1c00a598:	f3ed                	bnez	a5,1c00a57a <__rt_io_lock+0x28>
1c00a59a:	c714                	sw	a3,8(a4)
1c00a59c:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7650>
1c00a5a0:	c354                	sw	a3,4(a4)
1c00a5a2:	b7fd                	j	1c00a590 <__rt_io_lock+0x3e>
1c00a5a4:	8082                	ret

1c00a5a6 <__rt_io_unlock>:
1c00a5a6:	1c0017b7          	lui	a5,0x1c001
1c00a5aa:	fec7a783          	lw	a5,-20(a5) # 1c000fec <__hal_debug_struct+0x10>
1c00a5ae:	c791                	beqz	a5,1c00a5ba <__rt_io_unlock+0x14>
1c00a5b0:	1c0017b7          	lui	a5,0x1c001
1c00a5b4:	1a87a783          	lw	a5,424(a5) # 1c0011a8 <_rt_io_uart>
1c00a5b8:	c3a1                	beqz	a5,1c00a5f8 <__rt_io_unlock+0x52>
1c00a5ba:	7171                	addi	sp,sp,-176
1c00a5bc:	d706                	sw	ra,172(sp)
1c00a5be:	3545                	jal	1c00a45e <rt_is_fc>
1c00a5c0:	1c0017b7          	lui	a5,0x1c001
1c00a5c4:	c901                	beqz	a0,1c00a5d4 <__rt_io_unlock+0x2e>
1c00a5c6:	fbc78513          	addi	a0,a5,-68 # 1c000fbc <__rt_io_fc_lock>
1c00a5ca:	9a2ff0ef          	jal	ra,1c00976c <__rt_fc_unlock>
1c00a5ce:	50ba                	lw	ra,172(sp)
1c00a5d0:	614d                	addi	sp,sp,176
1c00a5d2:	8082                	ret
1c00a5d4:	002c                	addi	a1,sp,8
1c00a5d6:	fbc78513          	addi	a0,a5,-68
1c00a5da:	a00ff0ef          	jal	ra,1c0097da <__rt_fc_cluster_unlock>
1c00a5de:	4689                	li	a3,2
1c00a5e0:	00204737          	lui	a4,0x204
1c00a5e4:	09c14783          	lbu	a5,156(sp)
1c00a5e8:	0ff7f793          	andi	a5,a5,255
1c00a5ec:	f3ed                	bnez	a5,1c00a5ce <__rt_io_unlock+0x28>
1c00a5ee:	c714                	sw	a3,8(a4)
1c00a5f0:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7650>
1c00a5f4:	c354                	sw	a3,4(a4)
1c00a5f6:	b7fd                	j	1c00a5e4 <__rt_io_unlock+0x3e>
1c00a5f8:	8082                	ret

1c00a5fa <__rt_io_uart_wait_pending>:
1c00a5fa:	7135                	addi	sp,sp,-160
1c00a5fc:	cd22                	sw	s0,152(sp)
1c00a5fe:	cf06                	sw	ra,156(sp)
1c00a600:	cb26                	sw	s1,148(sp)
1c00a602:	1c001437          	lui	s0,0x1c001
1c00a606:	1a442783          	lw	a5,420(s0) # 1c0011a4 <__rt_io_pending_flush>
1c00a60a:	e39d                	bnez	a5,1c00a630 <__rt_io_uart_wait_pending+0x36>
1c00a60c:	1c001437          	lui	s0,0x1c001
1c00a610:	1a040413          	addi	s0,s0,416 # 1c0011a0 <__rt_io_event_current>
1c00a614:	4004                	lw	s1,0(s0)
1c00a616:	c881                	beqz	s1,1c00a626 <__rt_io_uart_wait_pending+0x2c>
1c00a618:	3599                	jal	1c00a45e <rt_is_fc>
1c00a61a:	cd19                	beqz	a0,1c00a638 <__rt_io_uart_wait_pending+0x3e>
1c00a61c:	8526                	mv	a0,s1
1c00a61e:	eb0ff0ef          	jal	ra,1c009cce <rt_event_wait>
1c00a622:	00042023          	sw	zero,0(s0)
1c00a626:	40fa                	lw	ra,156(sp)
1c00a628:	446a                	lw	s0,152(sp)
1c00a62a:	44da                	lw	s1,148(sp)
1c00a62c:	610d                	addi	sp,sp,160
1c00a62e:	8082                	ret
1c00a630:	3f9d                	jal	1c00a5a6 <__rt_io_unlock>
1c00a632:	3df5                	jal	1c00a52e <rt_event_execute.isra.2.constprop.11>
1c00a634:	3f39                	jal	1c00a552 <__rt_io_lock>
1c00a636:	bfc1                	j	1c00a606 <__rt_io_uart_wait_pending+0xc>
1c00a638:	f14027f3          	csrr	a5,mhartid
1c00a63c:	8795                	srai	a5,a5,0x5
1c00a63e:	03f7f793          	andi	a5,a5,63
1c00a642:	08f106a3          	sb	a5,141(sp)
1c00a646:	1c00a7b7          	lui	a5,0x1c00a
1c00a64a:	47e78793          	addi	a5,a5,1150 # 1c00a47e <__rt_io_uart_wait_req>
1c00a64e:	c03e                	sw	a5,0(sp)
1c00a650:	00010793          	mv	a5,sp
1c00a654:	4705                	li	a4,1
1c00a656:	c23e                	sw	a5,4(sp)
1c00a658:	850a                	mv	a0,sp
1c00a65a:	1c0017b7          	lui	a5,0x1c001
1c00a65e:	10e7a623          	sw	a4,268(a5) # 1c00110c <__rt_io_event+0x20>
1c00a662:	08010623          	sb	zero,140(sp)
1c00a666:	d002                	sw	zero,32(sp)
1c00a668:	d202                	sw	zero,36(sp)
1c00a66a:	a17fe0ef          	jal	ra,1c009080 <__rt_cluster_push_fc_event>
1c00a66e:	4689                	li	a3,2
1c00a670:	00204737          	lui	a4,0x204
1c00a674:	08c14783          	lbu	a5,140(sp)
1c00a678:	0ff7f793          	andi	a5,a5,255
1c00a67c:	f7cd                	bnez	a5,1c00a626 <__rt_io_uart_wait_pending+0x2c>
1c00a67e:	c714                	sw	a3,8(a4)
1c00a680:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7650>
1c00a684:	c354                	sw	a3,4(a4)
1c00a686:	b7fd                	j	1c00a674 <__rt_io_uart_wait_pending+0x7a>

1c00a688 <__rt_io_stop>:
1c00a688:	1141                	addi	sp,sp,-16
1c00a68a:	c422                	sw	s0,8(sp)
1c00a68c:	1c001437          	lui	s0,0x1c001
1c00a690:	c606                	sw	ra,12(sp)
1c00a692:	1a840413          	addi	s0,s0,424 # 1c0011a8 <_rt_io_uart>
1c00a696:	3795                	jal	1c00a5fa <__rt_io_uart_wait_pending>
1c00a698:	4008                	lw	a0,0(s0)
1c00a69a:	4581                	li	a1,0
1c00a69c:	6b5000ef          	jal	ra,1c00b550 <rt_uart_close>
1c00a6a0:	40b2                	lw	ra,12(sp)
1c00a6a2:	00042023          	sw	zero,0(s0)
1c00a6a6:	4422                	lw	s0,8(sp)
1c00a6a8:	4501                	li	a0,0
1c00a6aa:	0141                	addi	sp,sp,16
1c00a6ac:	8082                	ret

1c00a6ae <__rt_io_uart_flush.constprop.10>:
1c00a6ae:	7131                	addi	sp,sp,-192
1c00a6b0:	dd22                	sw	s0,184(sp)
1c00a6b2:	df06                	sw	ra,188(sp)
1c00a6b4:	db26                	sw	s1,180(sp)
1c00a6b6:	d94a                	sw	s2,176(sp)
1c00a6b8:	d74e                	sw	s3,172(sp)
1c00a6ba:	d552                	sw	s4,168(sp)
1c00a6bc:	d356                	sw	s5,164(sp)
1c00a6be:	1c001437          	lui	s0,0x1c001
1c00a6c2:	1a442783          	lw	a5,420(s0) # 1c0011a4 <__rt_io_pending_flush>
1c00a6c6:	1a440a13          	addi	s4,s0,420
1c00a6ca:	e7bd                	bnez	a5,1c00a738 <__rt_io_uart_flush.constprop.10+0x8a>
1c00a6cc:	1c0014b7          	lui	s1,0x1c001
1c00a6d0:	fdc48793          	addi	a5,s1,-36 # 1c000fdc <__hal_debug_struct>
1c00a6d4:	4f80                	lw	s0,24(a5)
1c00a6d6:	fdc48a93          	addi	s5,s1,-36
1c00a6da:	c431                	beqz	s0,1c00a726 <__rt_io_uart_flush.constprop.10+0x78>
1c00a6dc:	3349                	jal	1c00a45e <rt_is_fc>
1c00a6de:	1c0017b7          	lui	a5,0x1c001
1c00a6e2:	1a87a903          	lw	s2,424(a5) # 1c0011a8 <_rt_io_uart>
1c00a6e6:	1c0019b7          	lui	s3,0x1c001
1c00a6ea:	cd29                	beqz	a0,1c00a744 <__rt_io_uart_flush.constprop.10+0x96>
1c00a6ec:	1c00a5b7          	lui	a1,0x1c00a
1c00a6f0:	4785                	li	a5,1
1c00a6f2:	fdc48613          	addi	a2,s1,-36
1c00a6f6:	47058593          	addi	a1,a1,1136 # 1c00a470 <__rt_io_end_of_flush>
1c00a6fa:	4501                	li	a0,0
1c00a6fc:	00fa2023          	sw	a5,0(s4)
1c00a700:	ce4ff0ef          	jal	ra,1c009be4 <rt_event_get>
1c00a704:	00492583          	lw	a1,4(s2)
1c00a708:	87aa                	mv	a5,a0
1c00a70a:	4701                	li	a4,0
1c00a70c:	0586                	slli	a1,a1,0x1
1c00a70e:	86a2                	mv	a3,s0
1c00a710:	ff898613          	addi	a2,s3,-8 # 1c000ff8 <__hal_debug_struct+0x1c>
1c00a714:	0585                	addi	a1,a1,1
1c00a716:	4501                	li	a0,0
1c00a718:	b75ff0ef          	jal	ra,1c00a28c <rt_periph_copy>
1c00a71c:	3569                	jal	1c00a5a6 <__rt_io_unlock>
1c00a71e:	000a2783          	lw	a5,0(s4)
1c00a722:	ef99                	bnez	a5,1c00a740 <__rt_io_uart_flush.constprop.10+0x92>
1c00a724:	353d                	jal	1c00a552 <__rt_io_lock>
1c00a726:	50fa                	lw	ra,188(sp)
1c00a728:	546a                	lw	s0,184(sp)
1c00a72a:	54da                	lw	s1,180(sp)
1c00a72c:	594a                	lw	s2,176(sp)
1c00a72e:	59ba                	lw	s3,172(sp)
1c00a730:	5a2a                	lw	s4,168(sp)
1c00a732:	5a9a                	lw	s5,164(sp)
1c00a734:	6129                	addi	sp,sp,192
1c00a736:	8082                	ret
1c00a738:	35bd                	jal	1c00a5a6 <__rt_io_unlock>
1c00a73a:	3bd5                	jal	1c00a52e <rt_event_execute.isra.2.constprop.11>
1c00a73c:	3d19                	jal	1c00a552 <__rt_io_lock>
1c00a73e:	b751                	j	1c00a6c2 <__rt_io_uart_flush.constprop.10+0x14>
1c00a740:	33fd                	jal	1c00a52e <rt_event_execute.isra.2.constprop.11>
1c00a742:	bff1                	j	1c00a71e <__rt_io_uart_flush.constprop.10+0x70>
1c00a744:	0054                	addi	a3,sp,4
1c00a746:	8622                	mv	a2,s0
1c00a748:	ff898593          	addi	a1,s3,-8
1c00a74c:	854a                	mv	a0,s2
1c00a74e:	64d000ef          	jal	ra,1c00b59a <rt_uart_cluster_write>
1c00a752:	4689                	li	a3,2
1c00a754:	00204737          	lui	a4,0x204
1c00a758:	09c14783          	lbu	a5,156(sp)
1c00a75c:	0ff7f793          	andi	a5,a5,255
1c00a760:	c781                	beqz	a5,1c00a768 <__rt_io_uart_flush.constprop.10+0xba>
1c00a762:	000aac23          	sw	zero,24(s5)
1c00a766:	b7c1                	j	1c00a726 <__rt_io_uart_flush.constprop.10+0x78>
1c00a768:	c714                	sw	a3,8(a4)
1c00a76a:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f7650>
1c00a76e:	c354                	sw	a3,4(a4)
1c00a770:	b7e5                	j	1c00a758 <__rt_io_uart_flush.constprop.10+0xaa>

1c00a772 <memset>:
1c00a772:	962a                	add	a2,a2,a0
1c00a774:	87aa                	mv	a5,a0
1c00a776:	00c79363          	bne	a5,a2,1c00a77c <memset+0xa>
1c00a77a:	8082                	ret
1c00a77c:	0785                	addi	a5,a5,1
1c00a77e:	feb78fa3          	sb	a1,-1(a5)
1c00a782:	bfd5                	j	1c00a776 <memset+0x4>

1c00a784 <memcpy>:
1c00a784:	962a                	add	a2,a2,a0
1c00a786:	87aa                	mv	a5,a0
1c00a788:	00c79363          	bne	a5,a2,1c00a78e <memcpy+0xa>
1c00a78c:	8082                	ret
1c00a78e:	0585                	addi	a1,a1,1
1c00a790:	fff5c703          	lbu	a4,-1(a1)
1c00a794:	0785                	addi	a5,a5,1
1c00a796:	fee78fa3          	sb	a4,-1(a5)
1c00a79a:	b7fd                	j	1c00a788 <memcpy+0x4>

1c00a79c <memmove>:
1c00a79c:	40b507b3          	sub	a5,a0,a1
1c00a7a0:	00c7e763          	bltu	a5,a2,1c00a7ae <memmove+0x12>
1c00a7a4:	962e                	add	a2,a2,a1
1c00a7a6:	87aa                	mv	a5,a0
1c00a7a8:	00c59e63          	bne	a1,a2,1c00a7c4 <memmove+0x28>
1c00a7ac:	8082                	ret
1c00a7ae:	167d                	addi	a2,a2,-1
1c00a7b0:	00c587b3          	add	a5,a1,a2
1c00a7b4:	0007c703          	lbu	a4,0(a5)
1c00a7b8:	00c507b3          	add	a5,a0,a2
1c00a7bc:	00e78023          	sb	a4,0(a5)
1c00a7c0:	f67d                	bnez	a2,1c00a7ae <memmove+0x12>
1c00a7c2:	8082                	ret
1c00a7c4:	0005c703          	lbu	a4,0(a1)
1c00a7c8:	0785                	addi	a5,a5,1
1c00a7ca:	0585                	addi	a1,a1,1
1c00a7cc:	fee78fa3          	sb	a4,-1(a5)
1c00a7d0:	bfe1                	j	1c00a7a8 <memmove+0xc>

1c00a7d2 <strchr>:
1c00a7d2:	0ff5f593          	andi	a1,a1,255
1c00a7d6:	00054783          	lbu	a5,0(a0)
1c00a7da:	00b78563          	beq	a5,a1,1c00a7e4 <strchr+0x12>
1c00a7de:	e781                	bnez	a5,1c00a7e6 <strchr+0x14>
1c00a7e0:	c191                	beqz	a1,1c00a7e4 <strchr+0x12>
1c00a7e2:	4501                	li	a0,0
1c00a7e4:	8082                	ret
1c00a7e6:	0505                	addi	a0,a0,1
1c00a7e8:	b7fd                	j	1c00a7d6 <strchr+0x4>

1c00a7ea <__rt_putc_debug_bridge>:
1c00a7ea:	1141                	addi	sp,sp,-16
1c00a7ec:	c422                	sw	s0,8(sp)
1c00a7ee:	1c001437          	lui	s0,0x1c001
1c00a7f2:	c226                	sw	s1,4(sp)
1c00a7f4:	c606                	sw	ra,12(sp)
1c00a7f6:	84aa                	mv	s1,a0
1c00a7f8:	fdc40413          	addi	s0,s0,-36 # 1c000fdc <__hal_debug_struct>
1c00a7fc:	485c                	lw	a5,20(s0)
1c00a7fe:	c791                	beqz	a5,1c00a80a <__rt_putc_debug_bridge+0x20>
1c00a800:	06400513          	li	a0,100
1c00a804:	909ff0ef          	jal	ra,1c00a10c <rt_time_wait_us>
1c00a808:	bfd5                	j	1c00a7fc <__rt_putc_debug_bridge+0x12>
1c00a80a:	4c1c                	lw	a5,24(s0)
1c00a80c:	00178713          	addi	a4,a5,1
1c00a810:	97a2                	add	a5,a5,s0
1c00a812:	00978e23          	sb	s1,28(a5)
1c00a816:	cc18                	sw	a4,24(s0)
1c00a818:	4c14                	lw	a3,24(s0)
1c00a81a:	08000793          	li	a5,128
1c00a81e:	00f68563          	beq	a3,a5,1c00a828 <__rt_putc_debug_bridge+0x3e>
1c00a822:	47a9                	li	a5,10
1c00a824:	00f49663          	bne	s1,a5,1c00a830 <__rt_putc_debug_bridge+0x46>
1c00a828:	c701                	beqz	a4,1c00a830 <__rt_putc_debug_bridge+0x46>
1c00a82a:	c858                	sw	a4,20(s0)
1c00a82c:	00042c23          	sw	zero,24(s0)
1c00a830:	4c1c                	lw	a5,24(s0)
1c00a832:	e799                	bnez	a5,1c00a840 <__rt_putc_debug_bridge+0x56>
1c00a834:	4422                	lw	s0,8(sp)
1c00a836:	40b2                	lw	ra,12(sp)
1c00a838:	4492                	lw	s1,4(sp)
1c00a83a:	0141                	addi	sp,sp,16
1c00a83c:	948ff06f          	j	1c009984 <__rt_bridge_printf_flush>
1c00a840:	40b2                	lw	ra,12(sp)
1c00a842:	4422                	lw	s0,8(sp)
1c00a844:	4492                	lw	s1,4(sp)
1c00a846:	0141                	addi	sp,sp,16
1c00a848:	8082                	ret

1c00a84a <__rt_putc_uart>:
1c00a84a:	1101                	addi	sp,sp,-32
1c00a84c:	c62a                	sw	a0,12(sp)
1c00a84e:	ce06                	sw	ra,28(sp)
1c00a850:	336d                	jal	1c00a5fa <__rt_io_uart_wait_pending>
1c00a852:	1c0017b7          	lui	a5,0x1c001
1c00a856:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__hal_debug_struct>
1c00a85a:	4f94                	lw	a3,24(a5)
1c00a85c:	4532                	lw	a0,12(sp)
1c00a85e:	00168713          	addi	a4,a3,1
1c00a862:	cf98                	sw	a4,24(a5)
1c00a864:	97b6                	add	a5,a5,a3
1c00a866:	00a78e23          	sb	a0,28(a5)
1c00a86a:	08000793          	li	a5,128
1c00a86e:	00f70563          	beq	a4,a5,1c00a878 <__rt_putc_uart+0x2e>
1c00a872:	47a9                	li	a5,10
1c00a874:	00f51563          	bne	a0,a5,1c00a87e <__rt_putc_uart+0x34>
1c00a878:	40f2                	lw	ra,28(sp)
1c00a87a:	6105                	addi	sp,sp,32
1c00a87c:	bd0d                	j	1c00a6ae <__rt_io_uart_flush.constprop.10>
1c00a87e:	40f2                	lw	ra,28(sp)
1c00a880:	6105                	addi	sp,sp,32
1c00a882:	8082                	ret

1c00a884 <tfp_putc.isra.8>:
1c00a884:	1c0017b7          	lui	a5,0x1c001
1c00a888:	1a87a783          	lw	a5,424(a5) # 1c0011a8 <_rt_io_uart>
1c00a88c:	c391                	beqz	a5,1c00a890 <tfp_putc.isra.8+0xc>
1c00a88e:	bf75                	j	1c00a84a <__rt_putc_uart>
1c00a890:	1c0017b7          	lui	a5,0x1c001
1c00a894:	fec7a783          	lw	a5,-20(a5) # 1c000fec <__hal_debug_struct+0x10>
1c00a898:	c395                	beqz	a5,1c00a8bc <tfp_putc.isra.8+0x38>
1c00a89a:	6689                	lui	a3,0x2
1c00a89c:	f14027f3          	csrr	a5,mhartid
1c00a8a0:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00a8a4:	00379713          	slli	a4,a5,0x3
1c00a8a8:	078a                	slli	a5,a5,0x2
1c00a8aa:	0ff77713          	andi	a4,a4,255
1c00a8ae:	8ff5                	and	a5,a5,a3
1c00a8b0:	97ba                	add	a5,a5,a4
1c00a8b2:	1a10f737          	lui	a4,0x1a10f
1c00a8b6:	97ba                	add	a5,a5,a4
1c00a8b8:	c388                	sw	a0,0(a5)
1c00a8ba:	8082                	ret
1c00a8bc:	b73d                	j	1c00a7ea <__rt_putc_debug_bridge>

1c00a8be <puts>:
1c00a8be:	1141                	addi	sp,sp,-16
1c00a8c0:	c422                	sw	s0,8(sp)
1c00a8c2:	c606                	sw	ra,12(sp)
1c00a8c4:	842a                	mv	s0,a0
1c00a8c6:	3171                	jal	1c00a552 <__rt_io_lock>
1c00a8c8:	00044503          	lbu	a0,0(s0)
1c00a8cc:	c501                	beqz	a0,1c00a8d4 <puts+0x16>
1c00a8ce:	3f5d                	jal	1c00a884 <tfp_putc.isra.8>
1c00a8d0:	0405                	addi	s0,s0,1
1c00a8d2:	bfdd                	j	1c00a8c8 <puts+0xa>
1c00a8d4:	4529                	li	a0,10
1c00a8d6:	377d                	jal	1c00a884 <tfp_putc.isra.8>
1c00a8d8:	31f9                	jal	1c00a5a6 <__rt_io_unlock>
1c00a8da:	40b2                	lw	ra,12(sp)
1c00a8dc:	4422                	lw	s0,8(sp)
1c00a8de:	4501                	li	a0,0
1c00a8e0:	0141                	addi	sp,sp,16
1c00a8e2:	8082                	ret

1c00a8e4 <fputc_locked>:
1c00a8e4:	1141                	addi	sp,sp,-16
1c00a8e6:	c422                	sw	s0,8(sp)
1c00a8e8:	842a                	mv	s0,a0
1c00a8ea:	0ff57513          	andi	a0,a0,255
1c00a8ee:	c606                	sw	ra,12(sp)
1c00a8f0:	3f51                	jal	1c00a884 <tfp_putc.isra.8>
1c00a8f2:	8522                	mv	a0,s0
1c00a8f4:	40b2                	lw	ra,12(sp)
1c00a8f6:	4422                	lw	s0,8(sp)
1c00a8f8:	0141                	addi	sp,sp,16
1c00a8fa:	8082                	ret

1c00a8fc <_prf_locked>:
1c00a8fc:	1101                	addi	sp,sp,-32
1c00a8fe:	ce06                	sw	ra,28(sp)
1c00a900:	c02a                	sw	a0,0(sp)
1c00a902:	c62e                	sw	a1,12(sp)
1c00a904:	c432                	sw	a2,8(sp)
1c00a906:	c236                	sw	a3,4(sp)
1c00a908:	31a9                	jal	1c00a552 <__rt_io_lock>
1c00a90a:	4692                	lw	a3,4(sp)
1c00a90c:	4622                	lw	a2,8(sp)
1c00a90e:	45b2                	lw	a1,12(sp)
1c00a910:	4502                	lw	a0,0(sp)
1c00a912:	2ae9                	jal	1c00aaec <_prf>
1c00a914:	c02a                	sw	a0,0(sp)
1c00a916:	3941                	jal	1c00a5a6 <__rt_io_unlock>
1c00a918:	40f2                	lw	ra,28(sp)
1c00a91a:	4502                	lw	a0,0(sp)
1c00a91c:	6105                	addi	sp,sp,32
1c00a91e:	8082                	ret

1c00a920 <exit>:
1c00a920:	1141                	addi	sp,sp,-16
1c00a922:	c606                	sw	ra,12(sp)
1c00a924:	c422                	sw	s0,8(sp)
1c00a926:	842a                	mv	s0,a0
1c00a928:	85cff0ef          	jal	ra,1c009984 <__rt_bridge_printf_flush>
1c00a92c:	80000537          	lui	a0,0x80000
1c00a930:	1c0017b7          	lui	a5,0x1c001
1c00a934:	8c49                	or	s0,s0,a0
1c00a936:	fdc78793          	addi	a5,a5,-36 # 1c000fdc <__hal_debug_struct>
1c00a93a:	c7c0                	sw	s0,12(a5)
1c00a93c:	818ff0ef          	jal	ra,1c009954 <__rt_bridge_send_notif>
1c00a940:	1a1047b7          	lui	a5,0x1a104
1c00a944:	0a87a023          	sw	s0,160(a5) # 1a1040a0 <__l1_end+0xa100a8c>
1c00a948:	a001                	j	1c00a948 <exit+0x28>

1c00a94a <abort>:
1c00a94a:	1141                	addi	sp,sp,-16
1c00a94c:	557d                	li	a0,-1
1c00a94e:	c606                	sw	ra,12(sp)
1c00a950:	3fc1                	jal	1c00a920 <exit>

1c00a952 <__rt_io_init>:
1c00a952:	1c0017b7          	lui	a5,0x1c001
1c00a956:	fbc78793          	addi	a5,a5,-68 # 1c000fbc <__rt_io_fc_lock>
1c00a95a:	0007a223          	sw	zero,4(a5)
1c00a95e:	0007a023          	sw	zero,0(a5)
1c00a962:	0007a623          	sw	zero,12(a5)
1c00a966:	1c0017b7          	lui	a5,0x1c001
1c00a96a:	1a07a423          	sw	zero,424(a5) # 1c0011a8 <_rt_io_uart>
1c00a96e:	1c0017b7          	lui	a5,0x1c001
1c00a972:	1a07a023          	sw	zero,416(a5) # 1c0011a0 <__rt_io_event_current>
1c00a976:	1c0017b7          	lui	a5,0x1c001
1c00a97a:	1ac7a703          	lw	a4,428(a5) # 1c0011ac <__rt_iodev>
1c00a97e:	4785                	li	a5,1
1c00a980:	02f71e63          	bne	a4,a5,1c00a9bc <__rt_io_init+0x6a>
1c00a984:	1c00a5b7          	lui	a1,0x1c00a
1c00a988:	1141                	addi	sp,sp,-16
1c00a98a:	4601                	li	a2,0
1c00a98c:	4d058593          	addi	a1,a1,1232 # 1c00a4d0 <__rt_io_start>
1c00a990:	4501                	li	a0,0
1c00a992:	c606                	sw	ra,12(sp)
1c00a994:	d09fe0ef          	jal	ra,1c00969c <__rt_cbsys_add>
1c00a998:	1c00a5b7          	lui	a1,0x1c00a
1c00a99c:	68858593          	addi	a1,a1,1672 # 1c00a688 <__rt_io_stop>
1c00a9a0:	4601                	li	a2,0
1c00a9a2:	4505                	li	a0,1
1c00a9a4:	cf9fe0ef          	jal	ra,1c00969c <__rt_cbsys_add>
1c00a9a8:	40b2                	lw	ra,12(sp)
1c00a9aa:	1c0017b7          	lui	a5,0x1c001
1c00a9ae:	1a07a223          	sw	zero,420(a5) # 1c0011a4 <__rt_io_pending_flush>
1c00a9b2:	4585                	li	a1,1
1c00a9b4:	4501                	li	a0,0
1c00a9b6:	0141                	addi	sp,sp,16
1c00a9b8:	9b4ff06f          	j	1c009b6c <rt_event_alloc>
1c00a9bc:	8082                	ret

1c00a9be <printf>:
1c00a9be:	7139                	addi	sp,sp,-64
1c00a9c0:	d432                	sw	a2,40(sp)
1c00a9c2:	862a                	mv	a2,a0
1c00a9c4:	1c00b537          	lui	a0,0x1c00b
1c00a9c8:	d22e                	sw	a1,36(sp)
1c00a9ca:	d636                	sw	a3,44(sp)
1c00a9cc:	4589                	li	a1,2
1c00a9ce:	1054                	addi	a3,sp,36
1c00a9d0:	8e450513          	addi	a0,a0,-1820 # 1c00a8e4 <fputc_locked>
1c00a9d4:	ce06                	sw	ra,28(sp)
1c00a9d6:	d83a                	sw	a4,48(sp)
1c00a9d8:	da3e                	sw	a5,52(sp)
1c00a9da:	dc42                	sw	a6,56(sp)
1c00a9dc:	de46                	sw	a7,60(sp)
1c00a9de:	c636                	sw	a3,12(sp)
1c00a9e0:	3f31                	jal	1c00a8fc <_prf_locked>
1c00a9e2:	40f2                	lw	ra,28(sp)
1c00a9e4:	6121                	addi	sp,sp,64
1c00a9e6:	8082                	ret

1c00a9e8 <_to_x>:
1c00a9e8:	872a                	mv	a4,a0
1c00a9ea:	87aa                	mv	a5,a0
1c00a9ec:	4325                	li	t1,9
1c00a9ee:	02c5f8b3          	remu	a7,a1,a2
1c00a9f2:	02700513          	li	a0,39
1c00a9f6:	02c5d5b3          	divu	a1,a1,a2
1c00a9fa:	0ff8f813          	andi	a6,a7,255
1c00a9fe:	01136363          	bltu	t1,a7,1c00aa04 <_to_x+0x1c>
1c00aa02:	4501                	li	a0,0
1c00aa04:	03080813          	addi	a6,a6,48
1c00aa08:	0785                	addi	a5,a5,1
1c00aa0a:	9542                	add	a0,a0,a6
1c00aa0c:	fea78fa3          	sb	a0,-1(a5)
1c00aa10:	fdf9                	bnez	a1,1c00a9ee <_to_x+0x6>
1c00aa12:	03000613          	li	a2,48
1c00aa16:	40e78533          	sub	a0,a5,a4
1c00aa1a:	00d54863          	blt	a0,a3,1c00aa2a <_to_x+0x42>
1c00aa1e:	00078023          	sb	zero,0(a5)
1c00aa22:	17fd                	addi	a5,a5,-1
1c00aa24:	00f76763          	bltu	a4,a5,1c00aa32 <_to_x+0x4a>
1c00aa28:	8082                	ret
1c00aa2a:	0785                	addi	a5,a5,1
1c00aa2c:	fec78fa3          	sb	a2,-1(a5)
1c00aa30:	b7dd                	j	1c00aa16 <_to_x+0x2e>
1c00aa32:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10b9ec>
1c00aa36:	0007c683          	lbu	a3,0(a5)
1c00aa3a:	0705                	addi	a4,a4,1
1c00aa3c:	00c78023          	sb	a2,0(a5)
1c00aa40:	fed70fa3          	sb	a3,-1(a4)
1c00aa44:	17fd                	addi	a5,a5,-1
1c00aa46:	bff9                	j	1c00aa24 <_to_x+0x3c>

1c00aa48 <_rlrshift>:
1c00aa48:	411c                	lw	a5,0(a0)
1c00aa4a:	4154                	lw	a3,4(a0)
1c00aa4c:	0017f713          	andi	a4,a5,1
1c00aa50:	01f69613          	slli	a2,a3,0x1f
1c00aa54:	8385                	srli	a5,a5,0x1
1c00aa56:	8fd1                	or	a5,a5,a2
1c00aa58:	97ba                	add	a5,a5,a4
1c00aa5a:	8285                	srli	a3,a3,0x1
1c00aa5c:	00e7b733          	sltu	a4,a5,a4
1c00aa60:	9736                	add	a4,a4,a3
1c00aa62:	c11c                	sw	a5,0(a0)
1c00aa64:	c158                	sw	a4,4(a0)
1c00aa66:	8082                	ret

1c00aa68 <_ldiv5>:
1c00aa68:	4118                	lw	a4,0(a0)
1c00aa6a:	4154                	lw	a3,4(a0)
1c00aa6c:	4615                	li	a2,5
1c00aa6e:	00270793          	addi	a5,a4,2
1c00aa72:	00e7b733          	sltu	a4,a5,a4
1c00aa76:	9736                	add	a4,a4,a3
1c00aa78:	02c755b3          	divu	a1,a4,a2
1c00aa7c:	02b606b3          	mul	a3,a2,a1
1c00aa80:	8f15                	sub	a4,a4,a3
1c00aa82:	01d71693          	slli	a3,a4,0x1d
1c00aa86:	0037d713          	srli	a4,a5,0x3
1c00aa8a:	8f55                	or	a4,a4,a3
1c00aa8c:	02c75733          	divu	a4,a4,a2
1c00aa90:	01d75693          	srli	a3,a4,0x1d
1c00aa94:	070e                	slli	a4,a4,0x3
1c00aa96:	95b6                	add	a1,a1,a3
1c00aa98:	02e606b3          	mul	a3,a2,a4
1c00aa9c:	8f95                	sub	a5,a5,a3
1c00aa9e:	02c7d7b3          	divu	a5,a5,a2
1c00aaa2:	973e                	add	a4,a4,a5
1c00aaa4:	00f737b3          	sltu	a5,a4,a5
1c00aaa8:	97ae                	add	a5,a5,a1
1c00aaaa:	c118                	sw	a4,0(a0)
1c00aaac:	c15c                	sw	a5,4(a0)
1c00aaae:	8082                	ret

1c00aab0 <_get_digit>:
1c00aab0:	419c                	lw	a5,0(a1)
1c00aab2:	03000713          	li	a4,48
1c00aab6:	02f05863          	blez	a5,1c00aae6 <_get_digit+0x36>
1c00aaba:	17fd                	addi	a5,a5,-1
1c00aabc:	4114                	lw	a3,0(a0)
1c00aabe:	c19c                	sw	a5,0(a1)
1c00aac0:	415c                	lw	a5,4(a0)
1c00aac2:	4729                	li	a4,10
1c00aac4:	02d70633          	mul	a2,a4,a3
1c00aac8:	02f707b3          	mul	a5,a4,a5
1c00aacc:	c110                	sw	a2,0(a0)
1c00aace:	02d73733          	mulhu	a4,a4,a3
1c00aad2:	100006b7          	lui	a3,0x10000
1c00aad6:	16fd                	addi	a3,a3,-1
1c00aad8:	97ba                	add	a5,a5,a4
1c00aada:	01c7d713          	srli	a4,a5,0x1c
1c00aade:	8ff5                	and	a5,a5,a3
1c00aae0:	03070713          	addi	a4,a4,48
1c00aae4:	c15c                	sw	a5,4(a0)
1c00aae6:	0ff77513          	andi	a0,a4,255
1c00aaea:	8082                	ret

1c00aaec <_prf>:
1c00aaec:	714d                	addi	sp,sp,-336
1c00aaee:	14912223          	sw	s1,324(sp)
1c00aaf2:	13312e23          	sw	s3,316(sp)
1c00aaf6:	13812423          	sw	s8,296(sp)
1c00aafa:	14112623          	sw	ra,332(sp)
1c00aafe:	14812423          	sw	s0,328(sp)
1c00ab02:	15212023          	sw	s2,320(sp)
1c00ab06:	13412c23          	sw	s4,312(sp)
1c00ab0a:	13512a23          	sw	s5,308(sp)
1c00ab0e:	13612823          	sw	s6,304(sp)
1c00ab12:	13712623          	sw	s7,300(sp)
1c00ab16:	13912223          	sw	s9,292(sp)
1c00ab1a:	13a12023          	sw	s10,288(sp)
1c00ab1e:	11b12e23          	sw	s11,284(sp)
1c00ab22:	cc2a                	sw	a0,24(sp)
1c00ab24:	ce2e                	sw	a1,28(sp)
1c00ab26:	84b2                	mv	s1,a2
1c00ab28:	8c36                	mv	s8,a3
1c00ab2a:	4981                	li	s3,0
1c00ab2c:	0004c503          	lbu	a0,0(s1)
1c00ab30:	00148b93          	addi	s7,s1,1
1c00ab34:	cd01                	beqz	a0,1c00ab4c <_prf+0x60>
1c00ab36:	02500793          	li	a5,37
1c00ab3a:	14f50a63          	beq	a0,a5,1c00ac8e <_prf+0x1a2>
1c00ab3e:	45f2                	lw	a1,28(sp)
1c00ab40:	4762                	lw	a4,24(sp)
1c00ab42:	9702                	jalr	a4
1c00ab44:	57fd                	li	a5,-1
1c00ab46:	04f51063          	bne	a0,a5,1c00ab86 <_prf+0x9a>
1c00ab4a:	59fd                	li	s3,-1
1c00ab4c:	14c12083          	lw	ra,332(sp)
1c00ab50:	14812403          	lw	s0,328(sp)
1c00ab54:	854e                	mv	a0,s3
1c00ab56:	14412483          	lw	s1,324(sp)
1c00ab5a:	14012903          	lw	s2,320(sp)
1c00ab5e:	13c12983          	lw	s3,316(sp)
1c00ab62:	13812a03          	lw	s4,312(sp)
1c00ab66:	13412a83          	lw	s5,308(sp)
1c00ab6a:	13012b03          	lw	s6,304(sp)
1c00ab6e:	12c12b83          	lw	s7,300(sp)
1c00ab72:	12812c03          	lw	s8,296(sp)
1c00ab76:	12412c83          	lw	s9,292(sp)
1c00ab7a:	12012d03          	lw	s10,288(sp)
1c00ab7e:	11c12d83          	lw	s11,284(sp)
1c00ab82:	6171                	addi	sp,sp,336
1c00ab84:	8082                	ret
1c00ab86:	0985                	addi	s3,s3,1
1c00ab88:	8a62                	mv	s4,s8
1c00ab8a:	84de                	mv	s1,s7
1c00ab8c:	8c52                	mv	s8,s4
1c00ab8e:	bf79                	j	1c00ab2c <_prf+0x40>
1c00ab90:	0f2a8663          	beq	s5,s2,1c00ac7c <_prf+0x190>
1c00ab94:	0d596963          	bltu	s2,s5,1c00ac66 <_prf+0x17a>
1c00ab98:	fa0a8ae3          	beqz	s5,1c00ab4c <_prf+0x60>
1c00ab9c:	0dba8e63          	beq	s5,s11,1c00ac78 <_prf+0x18c>
1c00aba0:	8ba6                	mv	s7,s1
1c00aba2:	001b8493          	addi	s1,s7,1
1c00aba6:	fff4ca83          	lbu	s5,-1(s1)
1c00abaa:	1c0007b7          	lui	a5,0x1c000
1c00abae:	66478513          	addi	a0,a5,1636 # 1c000664 <__DTOR_END__+0x378>
1c00abb2:	85d6                	mv	a1,s5
1c00abb4:	c1fff0ef          	jal	ra,1c00a7d2 <strchr>
1c00abb8:	fd61                	bnez	a0,1c00ab90 <_prf+0xa4>
1c00abba:	02a00693          	li	a3,42
1c00abbe:	0eda9a63          	bne	s5,a3,1c00acb2 <_prf+0x1c6>
1c00abc2:	000c2903          	lw	s2,0(s8)
1c00abc6:	004c0693          	addi	a3,s8,4
1c00abca:	00095663          	bgez	s2,1c00abd6 <_prf+0xea>
1c00abce:	4705                	li	a4,1
1c00abd0:	41200933          	neg	s2,s2
1c00abd4:	c63a                	sw	a4,12(sp)
1c00abd6:	0004ca83          	lbu	s5,0(s1)
1c00abda:	8c36                	mv	s8,a3
1c00abdc:	002b8493          	addi	s1,s7,2
1c00abe0:	0c800713          	li	a4,200
1c00abe4:	01277463          	bleu	s2,a4,1c00abec <_prf+0x100>
1c00abe8:	0c800913          	li	s2,200
1c00abec:	02e00693          	li	a3,46
1c00abf0:	5d7d                	li	s10,-1
1c00abf2:	02da9463          	bne	s5,a3,1c00ac1a <_prf+0x12e>
1c00abf6:	0004c703          	lbu	a4,0(s1)
1c00abfa:	02a00793          	li	a5,42
1c00abfe:	10f71063          	bne	a4,a5,1c00acfe <_prf+0x212>
1c00ac02:	000c2d03          	lw	s10,0(s8)
1c00ac06:	0485                	addi	s1,s1,1
1c00ac08:	0c11                	addi	s8,s8,4
1c00ac0a:	0c800793          	li	a5,200
1c00ac0e:	01a7d363          	ble	s10,a5,1c00ac14 <_prf+0x128>
1c00ac12:	5d7d                	li	s10,-1
1c00ac14:	0004ca83          	lbu	s5,0(s1)
1c00ac18:	0485                	addi	s1,s1,1
1c00ac1a:	1c0007b7          	lui	a5,0x1c000
1c00ac1e:	85d6                	mv	a1,s5
1c00ac20:	66c78513          	addi	a0,a5,1644 # 1c00066c <__DTOR_END__+0x380>
1c00ac24:	bafff0ef          	jal	ra,1c00a7d2 <strchr>
1c00ac28:	c501                	beqz	a0,1c00ac30 <_prf+0x144>
1c00ac2a:	0004ca83          	lbu	s5,0(s1)
1c00ac2e:	0485                	addi	s1,s1,1
1c00ac30:	06700693          	li	a3,103
1c00ac34:	1356c263          	blt	a3,s5,1c00ad58 <_prf+0x26c>
1c00ac38:	06500693          	li	a3,101
1c00ac3c:	1edadd63          	ble	a3,s5,1c00ae36 <_prf+0x34a>
1c00ac40:	04700693          	li	a3,71
1c00ac44:	0d56c163          	blt	a3,s5,1c00ad06 <_prf+0x21a>
1c00ac48:	04500693          	li	a3,69
1c00ac4c:	1edad563          	ble	a3,s5,1c00ae36 <_prf+0x34a>
1c00ac50:	ee0a8ee3          	beqz	s5,1c00ab4c <_prf+0x60>
1c00ac54:	02500713          	li	a4,37
1c00ac58:	68ea8263          	beq	s5,a4,1c00b2dc <_prf+0x7f0>
1c00ac5c:	0c800713          	li	a4,200
1c00ac60:	69575763          	ble	s5,a4,1c00b2ee <_prf+0x802>
1c00ac64:	b5dd                	j	1c00ab4a <_prf+0x5e>
1c00ac66:	034a8163          	beq	s5,s4,1c00ac88 <_prf+0x19c>
1c00ac6a:	016a8b63          	beq	s5,s6,1c00ac80 <_prf+0x194>
1c00ac6e:	f3aa99e3          	bne	s5,s10,1c00aba0 <_prf+0xb4>
1c00ac72:	4785                	li	a5,1
1c00ac74:	ca3e                	sw	a5,20(sp)
1c00ac76:	b72d                	j	1c00aba0 <_prf+0xb4>
1c00ac78:	4405                	li	s0,1
1c00ac7a:	b71d                	j	1c00aba0 <_prf+0xb4>
1c00ac7c:	4c85                	li	s9,1
1c00ac7e:	b70d                	j	1c00aba0 <_prf+0xb4>
1c00ac80:	03000713          	li	a4,48
1c00ac84:	c83a                	sw	a4,16(sp)
1c00ac86:	bf29                	j	1c00aba0 <_prf+0xb4>
1c00ac88:	4785                	li	a5,1
1c00ac8a:	c63e                	sw	a5,12(sp)
1c00ac8c:	bf11                	j	1c00aba0 <_prf+0xb4>
1c00ac8e:	02000713          	li	a4,32
1c00ac92:	c83a                	sw	a4,16(sp)
1c00ac94:	4401                	li	s0,0
1c00ac96:	ca02                	sw	zero,20(sp)
1c00ac98:	c602                	sw	zero,12(sp)
1c00ac9a:	4c81                	li	s9,0
1c00ac9c:	02300913          	li	s2,35
1c00aca0:	02d00a13          	li	s4,45
1c00aca4:	03000b13          	li	s6,48
1c00aca8:	02b00d13          	li	s10,43
1c00acac:	02000d93          	li	s11,32
1c00acb0:	bdcd                	j	1c00aba2 <_prf+0xb6>
1c00acb2:	fd0a8693          	addi	a3,s5,-48
1c00acb6:	4625                	li	a2,9
1c00acb8:	4901                	li	s2,0
1c00acba:	45a9                	li	a1,10
1c00acbc:	f2d662e3          	bltu	a2,a3,1c00abe0 <_prf+0xf4>
1c00acc0:	000bc683          	lbu	a3,0(s7)
1c00acc4:	001b8493          	addi	s1,s7,1
1c00acc8:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xfff35e4>
1c00accc:	8ab6                	mv	s5,a3
1c00acce:	f0e669e3          	bltu	a2,a4,1c00abe0 <_prf+0xf4>
1c00acd2:	02b90933          	mul	s2,s2,a1
1c00acd6:	8ba6                	mv	s7,s1
1c00acd8:	9936                	add	s2,s2,a3
1c00acda:	fd090913          	addi	s2,s2,-48
1c00acde:	b7cd                	j	1c00acc0 <_prf+0x1d4>
1c00ace0:	02ad0733          	mul	a4,s10,a0
1c00ace4:	84ae                	mv	s1,a1
1c00ace6:	973e                	add	a4,a4,a5
1c00ace8:	fd070d13          	addi	s10,a4,-48
1c00acec:	0004c783          	lbu	a5,0(s1)
1c00acf0:	00148593          	addi	a1,s1,1
1c00acf4:	fd078613          	addi	a2,a5,-48
1c00acf8:	fec6f4e3          	bleu	a2,a3,1c00ace0 <_prf+0x1f4>
1c00acfc:	b739                	j	1c00ac0a <_prf+0x11e>
1c00acfe:	4d01                	li	s10,0
1c00ad00:	46a5                	li	a3,9
1c00ad02:	4529                	li	a0,10
1c00ad04:	b7e5                	j	1c00acec <_prf+0x200>
1c00ad06:	06300693          	li	a3,99
1c00ad0a:	0cda8b63          	beq	s5,a3,1c00ade0 <_prf+0x2f4>
1c00ad0e:	0756c563          	blt	a3,s5,1c00ad78 <_prf+0x28c>
1c00ad12:	05800693          	li	a3,88
1c00ad16:	f4da93e3          	bne	s5,a3,1c00ac5c <_prf+0x170>
1c00ad1a:	04410b93          	addi	s7,sp,68
1c00ad1e:	004c0a13          	addi	s4,s8,4
1c00ad22:	000c2583          	lw	a1,0(s8)
1c00ad26:	845e                	mv	s0,s7
1c00ad28:	000c8963          	beqz	s9,1c00ad3a <_prf+0x24e>
1c00ad2c:	76e1                	lui	a3,0xffff8
1c00ad2e:	8306c693          	xori	a3,a3,-2000
1c00ad32:	04d11223          	sh	a3,68(sp)
1c00ad36:	04610413          	addi	s0,sp,70
1c00ad3a:	86ea                	mv	a3,s10
1c00ad3c:	4641                	li	a2,16
1c00ad3e:	8522                	mv	a0,s0
1c00ad40:	3165                	jal	1c00a9e8 <_to_x>
1c00ad42:	05800693          	li	a3,88
1c00ad46:	58da8863          	beq	s5,a3,1c00b2d6 <_prf+0x7ea>
1c00ad4a:	41740433          	sub	s0,s0,s7
1c00ad4e:	9522                	add	a0,a0,s0
1c00ad50:	01903433          	snez	s0,s9
1c00ad54:	0406                	slli	s0,s0,0x1
1c00ad56:	a8c9                	j	1c00ae28 <_prf+0x33c>
1c00ad58:	07000693          	li	a3,112
1c00ad5c:	50da8163          	beq	s5,a3,1c00b25e <_prf+0x772>
1c00ad60:	0556c163          	blt	a3,s5,1c00ada2 <_prf+0x2b6>
1c00ad64:	06e00693          	li	a3,110
1c00ad68:	46da8b63          	beq	s5,a3,1c00b1de <_prf+0x6f2>
1c00ad6c:	4956c063          	blt	a3,s5,1c00b1ec <_prf+0x700>
1c00ad70:	06900693          	li	a3,105
1c00ad74:	eeda94e3          	bne	s5,a3,1c00ac5c <_prf+0x170>
1c00ad78:	000c2a83          	lw	s5,0(s8)
1c00ad7c:	004c0a13          	addi	s4,s8,4
1c00ad80:	04410b13          	addi	s6,sp,68
1c00ad84:	060ad963          	bgez	s5,1c00adf6 <_prf+0x30a>
1c00ad88:	02d00693          	li	a3,45
1c00ad8c:	04d10223          	sb	a3,68(sp)
1c00ad90:	800006b7          	lui	a3,0x80000
1c00ad94:	415005b3          	neg	a1,s5
1c00ad98:	06da9963          	bne	s5,a3,1c00ae0a <_prf+0x31e>
1c00ad9c:	800005b7          	lui	a1,0x80000
1c00ada0:	a0ad                	j	1c00ae0a <_prf+0x31e>
1c00ada2:	07500693          	li	a3,117
1c00ada6:	50da8063          	beq	s5,a3,1c00b2a6 <_prf+0x7ba>
1c00adaa:	07800693          	li	a3,120
1c00adae:	f6da86e3          	beq	s5,a3,1c00ad1a <_prf+0x22e>
1c00adb2:	07300693          	li	a3,115
1c00adb6:	eada93e3          	bne	s5,a3,1c00ac5c <_prf+0x170>
1c00adba:	000c2583          	lw	a1,0(s8)
1c00adbe:	004c0a13          	addi	s4,s8,4
1c00adc2:	4c81                	li	s9,0
1c00adc4:	0c800793          	li	a5,200
1c00adc8:	019586b3          	add	a3,a1,s9
1c00adcc:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00add0:	4a068f63          	beqz	a3,1c00b28e <_prf+0x7a2>
1c00add4:	0c85                	addi	s9,s9,1
1c00add6:	fefc99e3          	bne	s9,a5,1c00adc8 <_prf+0x2dc>
1c00adda:	4a0d5c63          	bgez	s10,1c00b292 <_prf+0x7a6>
1c00adde:	a97d                	j	1c00b29c <_prf+0x7b0>
1c00ade0:	000c2783          	lw	a5,0(s8)
1c00ade4:	004c0a13          	addi	s4,s8,4
1c00ade8:	040102a3          	sb	zero,69(sp)
1c00adec:	04f10223          	sb	a5,68(sp)
1c00adf0:	4c85                	li	s9,1
1c00adf2:	4401                	li	s0,0
1c00adf4:	a105                	j	1c00b214 <_prf+0x728>
1c00adf6:	4752                	lw	a4,20(sp)
1c00adf8:	02b00693          	li	a3,43
1c00adfc:	e701                	bnez	a4,1c00ae04 <_prf+0x318>
1c00adfe:	c41d                	beqz	s0,1c00ae2c <_prf+0x340>
1c00ae00:	02000693          	li	a3,32
1c00ae04:	04d10223          	sb	a3,68(sp)
1c00ae08:	85d6                	mv	a1,s5
1c00ae0a:	04510c13          	addi	s8,sp,69
1c00ae0e:	86ea                	mv	a3,s10
1c00ae10:	4629                	li	a2,10
1c00ae12:	8562                	mv	a0,s8
1c00ae14:	bd5ff0ef          	jal	ra,1c00a9e8 <_to_x>
1c00ae18:	47d2                	lw	a5,20(sp)
1c00ae1a:	9562                	add	a0,a0,s8
1c00ae1c:	41650533          	sub	a0,a0,s6
1c00ae20:	eb89                	bnez	a5,1c00ae32 <_prf+0x346>
1c00ae22:	e019                	bnez	s0,1c00ae28 <_prf+0x33c>
1c00ae24:	01fad413          	srli	s0,s5,0x1f
1c00ae28:	57fd                	li	a5,-1
1c00ae2a:	a9a1                	j	1c00b282 <_prf+0x796>
1c00ae2c:	85d6                	mv	a1,s5
1c00ae2e:	8c5a                	mv	s8,s6
1c00ae30:	bff9                	j	1c00ae0e <_prf+0x322>
1c00ae32:	4452                	lw	s0,20(sp)
1c00ae34:	bfd5                	j	1c00ae28 <_prf+0x33c>
1c00ae36:	0c1d                	addi	s8,s8,7
1c00ae38:	ff8c7c13          	andi	s8,s8,-8
1c00ae3c:	000c2883          	lw	a7,0(s8)
1c00ae40:	004c2303          	lw	t1,4(s8)
1c00ae44:	80000737          	lui	a4,0x80000
1c00ae48:	0158d593          	srli	a1,a7,0x15
1c00ae4c:	00b31693          	slli	a3,t1,0xb
1c00ae50:	8ecd                	or	a3,a3,a1
1c00ae52:	fff74713          	not	a4,a4
1c00ae56:	01435613          	srli	a2,t1,0x14
1c00ae5a:	08ae                	slli	a7,a7,0xb
1c00ae5c:	8ef9                	and	a3,a3,a4
1c00ae5e:	7ff67613          	andi	a2,a2,2047
1c00ae62:	d846                	sw	a7,48(sp)
1c00ae64:	da36                	sw	a3,52(sp)
1c00ae66:	7ff00593          	li	a1,2047
1c00ae6a:	008c0a13          	addi	s4,s8,8
1c00ae6e:	08b61d63          	bne	a2,a1,1c00af08 <_prf+0x41c>
1c00ae72:	00d0                	addi	a2,sp,68
1c00ae74:	8732                	mv	a4,a2
1c00ae76:	00035863          	bgez	t1,1c00ae86 <_prf+0x39a>
1c00ae7a:	02d00713          	li	a4,45
1c00ae7e:	04e10223          	sb	a4,68(sp)
1c00ae82:	04510713          	addi	a4,sp,69
1c00ae86:	00d8e6b3          	or	a3,a7,a3
1c00ae8a:	fbfa8793          	addi	a5,s5,-65
1c00ae8e:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00ae92:	eaa1                	bnez	a3,1c00aee2 <_prf+0x3f6>
1c00ae94:	46e5                	li	a3,25
1c00ae96:	02f6ee63          	bltu	a3,a5,1c00aed2 <_prf+0x3e6>
1c00ae9a:	6795                	lui	a5,0x5
1c00ae9c:	e4978793          	addi	a5,a5,-439 # 4e49 <_l1_preload_size+0x1839>
1c00aea0:	00f71023          	sh	a5,0(a4)
1c00aea4:	04600793          	li	a5,70
1c00aea8:	00f70123          	sb	a5,2(a4)
1c00aeac:	000701a3          	sb	zero,3(a4)
1c00aeb0:	8d11                	sub	a0,a0,a2
1c00aeb2:	47d2                	lw	a5,20(sp)
1c00aeb4:	48079f63          	bnez	a5,1c00b352 <_prf+0x866>
1c00aeb8:	e419                	bnez	s0,1c00aec6 <_prf+0x3da>
1c00aeba:	04414403          	lbu	s0,68(sp)
1c00aebe:	fd340413          	addi	s0,s0,-45
1c00aec2:	00143413          	seqz	s0,s0
1c00aec6:	0c800793          	li	a5,200
1c00aeca:	c8a7c0e3          	blt	a5,a0,1c00ab4a <_prf+0x5e>
1c00aece:	8caa                	mv	s9,a0
1c00aed0:	a691                	j	1c00b214 <_prf+0x728>
1c00aed2:	679d                	lui	a5,0x7
1c00aed4:	e6978793          	addi	a5,a5,-407 # 6e69 <_l1_preload_size+0x3859>
1c00aed8:	00f71023          	sh	a5,0(a4)
1c00aedc:	06600793          	li	a5,102
1c00aee0:	b7e1                	j	1c00aea8 <_prf+0x3bc>
1c00aee2:	46e5                	li	a3,25
1c00aee4:	00f6ea63          	bltu	a3,a5,1c00aef8 <_prf+0x40c>
1c00aee8:	6791                	lui	a5,0x4
1c00aeea:	14e78793          	addi	a5,a5,334 # 414e <_l1_preload_size+0xb3e>
1c00aeee:	00f71023          	sh	a5,0(a4)
1c00aef2:	04e00793          	li	a5,78
1c00aef6:	bf4d                	j	1c00aea8 <_prf+0x3bc>
1c00aef8:	6799                	lui	a5,0x6
1c00aefa:	16e78793          	addi	a5,a5,366 # 616e <_l1_preload_size+0x2b5e>
1c00aefe:	00f71023          	sh	a5,0(a4)
1c00af02:	06e00793          	li	a5,110
1c00af06:	b74d                	j	1c00aea8 <_prf+0x3bc>
1c00af08:	04600593          	li	a1,70
1c00af0c:	00ba9463          	bne	s5,a1,1c00af14 <_prf+0x428>
1c00af10:	06600a93          	li	s5,102
1c00af14:	011665b3          	or	a1,a2,a7
1c00af18:	8dd5                	or	a1,a1,a3
1c00af1a:	c9c9                	beqz	a1,1c00afac <_prf+0x4c0>
1c00af1c:	800007b7          	lui	a5,0x80000
1c00af20:	8edd                	or	a3,a3,a5
1c00af22:	da36                	sw	a3,52(sp)
1c00af24:	d846                	sw	a7,48(sp)
1c00af26:	c0260c13          	addi	s8,a2,-1022
1c00af2a:	02d00693          	li	a3,45
1c00af2e:	00034b63          	bltz	t1,1c00af44 <_prf+0x458>
1c00af32:	4752                	lw	a4,20(sp)
1c00af34:	02b00693          	li	a3,43
1c00af38:	e711                	bnez	a4,1c00af44 <_prf+0x458>
1c00af3a:	04410b13          	addi	s6,sp,68
1c00af3e:	c419                	beqz	s0,1c00af4c <_prf+0x460>
1c00af40:	02000693          	li	a3,32
1c00af44:	04d10223          	sb	a3,68(sp)
1c00af48:	04510b13          	addi	s6,sp,69
1c00af4c:	4b81                	li	s7,0
1c00af4e:	55f9                	li	a1,-2
1c00af50:	06bc4363          	blt	s8,a1,1c00afb6 <_prf+0x4ca>
1c00af54:	0b804a63          	bgtz	s8,1c00b008 <_prf+0x51c>
1c00af58:	4d91                	li	s11,4
1c00af5a:	1808                	addi	a0,sp,48
1c00af5c:	0c05                	addi	s8,s8,1
1c00af5e:	aebff0ef          	jal	ra,1c00aa48 <_rlrshift>
1c00af62:	ffbc1ce3          	bne	s8,s11,1c00af5a <_prf+0x46e>
1c00af66:	000d5363          	bgez	s10,1c00af6c <_prf+0x480>
1c00af6a:	4d19                	li	s10,6
1c00af6c:	fdfaf593          	andi	a1,s5,-33
1c00af70:	04700513          	li	a0,71
1c00af74:	0ca59663          	bne	a1,a0,1c00b040 <_prf+0x554>
1c00af78:	4c01                	li	s8,0
1c00af7a:	000c9463          	bnez	s9,1c00af82 <_prf+0x496>
1c00af7e:	01a03c33          	snez	s8,s10
1c00af82:	55f5                	li	a1,-3
1c00af84:	00bbc663          	blt	s7,a1,1c00af90 <_prf+0x4a4>
1c00af88:	001d0593          	addi	a1,s10,1
1c00af8c:	0b75df63          	ble	s7,a1,1c00b04a <_prf+0x55e>
1c00af90:	06700593          	li	a1,103
1c00af94:	14ba8c63          	beq	s5,a1,1c00b0ec <_prf+0x600>
1c00af98:	04500a93          	li	s5,69
1c00af9c:	001d0593          	addi	a1,s10,1
1c00afa0:	4541                	li	a0,16
1c00afa2:	d62a                	sw	a0,44(sp)
1c00afa4:	0ab55c63          	ble	a1,a0,1c00b05c <_prf+0x570>
1c00afa8:	45c1                	li	a1,16
1c00afaa:	a84d                	j	1c00b05c <_prf+0x570>
1c00afac:	4c01                	li	s8,0
1c00afae:	b751                	j	1c00af32 <_prf+0x446>
1c00afb0:	1808                	addi	a0,sp,48
1c00afb2:	a97ff0ef          	jal	ra,1c00aa48 <_rlrshift>
1c00afb6:	55d2                	lw	a1,52(sp)
1c00afb8:	333337b7          	lui	a5,0x33333
1c00afbc:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x1731fb9a>
1c00afc0:	5342                	lw	t1,48(sp)
1c00afc2:	0c05                	addi	s8,s8,1
1c00afc4:	feb7e6e3          	bltu	a5,a1,1c00afb0 <_prf+0x4c4>
1c00afc8:	4895                	li	a7,5
1c00afca:	02b88533          	mul	a0,a7,a1
1c00afce:	1bfd                	addi	s7,s7,-1
1c00afd0:	0268b5b3          	mulhu	a1,a7,t1
1c00afd4:	026888b3          	mul	a7,a7,t1
1c00afd8:	95aa                	add	a1,a1,a0
1c00afda:	da2e                	sw	a1,52(sp)
1c00afdc:	4501                	li	a0,0
1c00afde:	d846                	sw	a7,48(sp)
1c00afe0:	800006b7          	lui	a3,0x80000
1c00afe4:	fff6c693          	not	a3,a3
1c00afe8:	00b6f663          	bleu	a1,a3,1c00aff4 <_prf+0x508>
1c00afec:	d12d                	beqz	a0,1c00af4e <_prf+0x462>
1c00afee:	d846                	sw	a7,48(sp)
1c00aff0:	da2e                	sw	a1,52(sp)
1c00aff2:	bfb1                	j	1c00af4e <_prf+0x462>
1c00aff4:	01f8d313          	srli	t1,a7,0x1f
1c00aff8:	00159513          	slli	a0,a1,0x1
1c00affc:	00a365b3          	or	a1,t1,a0
1c00b000:	0886                	slli	a7,a7,0x1
1c00b002:	1c7d                	addi	s8,s8,-1
1c00b004:	4505                	li	a0,1
1c00b006:	bfe9                	j	1c00afe0 <_prf+0x4f4>
1c00b008:	1808                	addi	a0,sp,48
1c00b00a:	a5fff0ef          	jal	ra,1c00aa68 <_ldiv5>
1c00b00e:	58c2                	lw	a7,48(sp)
1c00b010:	55d2                	lw	a1,52(sp)
1c00b012:	1c7d                	addi	s8,s8,-1
1c00b014:	0b85                	addi	s7,s7,1
1c00b016:	4501                	li	a0,0
1c00b018:	80000737          	lui	a4,0x80000
1c00b01c:	fff74713          	not	a4,a4
1c00b020:	00b77663          	bleu	a1,a4,1c00b02c <_prf+0x540>
1c00b024:	d905                	beqz	a0,1c00af54 <_prf+0x468>
1c00b026:	d846                	sw	a7,48(sp)
1c00b028:	da2e                	sw	a1,52(sp)
1c00b02a:	b72d                	j	1c00af54 <_prf+0x468>
1c00b02c:	01f8d313          	srli	t1,a7,0x1f
1c00b030:	00159513          	slli	a0,a1,0x1
1c00b034:	00a365b3          	or	a1,t1,a0
1c00b038:	0886                	slli	a7,a7,0x1
1c00b03a:	1c7d                	addi	s8,s8,-1
1c00b03c:	4505                	li	a0,1
1c00b03e:	bfe9                	j	1c00b018 <_prf+0x52c>
1c00b040:	06600593          	li	a1,102
1c00b044:	4c01                	li	s8,0
1c00b046:	f4ba9be3          	bne	s5,a1,1c00af9c <_prf+0x4b0>
1c00b04a:	01ab85b3          	add	a1,s7,s10
1c00b04e:	06600a93          	li	s5,102
1c00b052:	f405d7e3          	bgez	a1,1c00afa0 <_prf+0x4b4>
1c00b056:	45c1                	li	a1,16
1c00b058:	d62e                	sw	a1,44(sp)
1c00b05a:	4581                	li	a1,0
1c00b05c:	4301                	li	t1,0
1c00b05e:	080003b7          	lui	t2,0x8000
1c00b062:	dc1a                	sw	t1,56(sp)
1c00b064:	de1e                	sw	t2,60(sp)
1c00b066:	5dfd                	li	s11,-1
1c00b068:	15fd                	addi	a1,a1,-1
1c00b06a:	09b59463          	bne	a1,s11,1c00b0f2 <_prf+0x606>
1c00b06e:	55c2                	lw	a1,48(sp)
1c00b070:	5562                	lw	a0,56(sp)
1c00b072:	58d2                	lw	a7,52(sp)
1c00b074:	5372                	lw	t1,60(sp)
1c00b076:	952e                	add	a0,a0,a1
1c00b078:	00b535b3          	sltu	a1,a0,a1
1c00b07c:	989a                	add	a7,a7,t1
1c00b07e:	95c6                	add	a1,a1,a7
1c00b080:	d82a                	sw	a0,48(sp)
1c00b082:	f0000537          	lui	a0,0xf0000
1c00b086:	da2e                	sw	a1,52(sp)
1c00b088:	8de9                	and	a1,a1,a0
1c00b08a:	c981                	beqz	a1,1c00b09a <_prf+0x5ae>
1c00b08c:	1808                	addi	a0,sp,48
1c00b08e:	9dbff0ef          	jal	ra,1c00aa68 <_ldiv5>
1c00b092:	1808                	addi	a0,sp,48
1c00b094:	9b5ff0ef          	jal	ra,1c00aa48 <_rlrshift>
1c00b098:	0b85                	addi	s7,s7,1
1c00b09a:	06600593          	li	a1,102
1c00b09e:	001b0d93          	addi	s11,s6,1
1c00b0a2:	08ba9663          	bne	s5,a1,1c00b12e <_prf+0x642>
1c00b0a6:	05705f63          	blez	s7,1c00b104 <_prf+0x618>
1c00b0aa:	017b0db3          	add	s11,s6,s7
1c00b0ae:	106c                	addi	a1,sp,44
1c00b0b0:	1808                	addi	a0,sp,48
1c00b0b2:	0b05                	addi	s6,s6,1
1c00b0b4:	9fdff0ef          	jal	ra,1c00aab0 <_get_digit>
1c00b0b8:	feab0fa3          	sb	a0,-1(s6)
1c00b0bc:	ffbb19e3          	bne	s6,s11,1c00b0ae <_prf+0x5c2>
1c00b0c0:	4b81                	li	s7,0
1c00b0c2:	000c9463          	bnez	s9,1c00b0ca <_prf+0x5de>
1c00b0c6:	020d0063          	beqz	s10,1c00b0e6 <_prf+0x5fa>
1c00b0ca:	02e00613          	li	a2,46
1c00b0ce:	00cd8023          	sb	a2,0(s11)
1c00b0d2:	8b6e                	mv	s6,s11
1c00b0d4:	01ad8cb3          	add	s9,s11,s10
1c00b0d8:	03000313          	li	t1,48
1c00b0dc:	036c9963          	bne	s9,s6,1c00b10e <_prf+0x622>
1c00b0e0:	001d0713          	addi	a4,s10,1
1c00b0e4:	9dba                	add	s11,s11,a4
1c00b0e6:	060c1e63          	bnez	s8,1c00b162 <_prf+0x676>
1c00b0ea:	a8d1                	j	1c00b1be <_prf+0x6d2>
1c00b0ec:	06500a93          	li	s5,101
1c00b0f0:	b575                	j	1c00af9c <_prf+0x4b0>
1c00b0f2:	1828                	addi	a0,sp,56
1c00b0f4:	c42e                	sw	a1,8(sp)
1c00b0f6:	973ff0ef          	jal	ra,1c00aa68 <_ldiv5>
1c00b0fa:	1828                	addi	a0,sp,56
1c00b0fc:	94dff0ef          	jal	ra,1c00aa48 <_rlrshift>
1c00b100:	45a2                	lw	a1,8(sp)
1c00b102:	b79d                	j	1c00b068 <_prf+0x57c>
1c00b104:	03000593          	li	a1,48
1c00b108:	00bb0023          	sb	a1,0(s6)
1c00b10c:	bf5d                	j	1c00b0c2 <_prf+0x5d6>
1c00b10e:	000b8763          	beqz	s7,1c00b11c <_prf+0x630>
1c00b112:	006b00a3          	sb	t1,1(s6)
1c00b116:	0b85                	addi	s7,s7,1
1c00b118:	0b05                	addi	s6,s6,1
1c00b11a:	b7c9                	j	1c00b0dc <_prf+0x5f0>
1c00b11c:	106c                	addi	a1,sp,44
1c00b11e:	1808                	addi	a0,sp,48
1c00b120:	c41a                	sw	t1,8(sp)
1c00b122:	98fff0ef          	jal	ra,1c00aab0 <_get_digit>
1c00b126:	00ab00a3          	sb	a0,1(s6)
1c00b12a:	4322                	lw	t1,8(sp)
1c00b12c:	b7f5                	j	1c00b118 <_prf+0x62c>
1c00b12e:	106c                	addi	a1,sp,44
1c00b130:	1808                	addi	a0,sp,48
1c00b132:	97fff0ef          	jal	ra,1c00aab0 <_get_digit>
1c00b136:	00ab0023          	sb	a0,0(s6)
1c00b13a:	03000593          	li	a1,48
1c00b13e:	00b50363          	beq	a0,a1,1c00b144 <_prf+0x658>
1c00b142:	1bfd                	addi	s7,s7,-1
1c00b144:	000c9463          	bnez	s9,1c00b14c <_prf+0x660>
1c00b148:	000d0b63          	beqz	s10,1c00b15e <_prf+0x672>
1c00b14c:	002b0d93          	addi	s11,s6,2
1c00b150:	02e00593          	li	a1,46
1c00b154:	00bb00a3          	sb	a1,1(s6)
1c00b158:	9d6e                	add	s10,s10,s11
1c00b15a:	07bd1863          	bne	s10,s11,1c00b1ca <_prf+0x6de>
1c00b15e:	000c0f63          	beqz	s8,1c00b17c <_prf+0x690>
1c00b162:	03000593          	li	a1,48
1c00b166:	fffdc603          	lbu	a2,-1(s11)
1c00b16a:	fffd8713          	addi	a4,s11,-1
1c00b16e:	06b60663          	beq	a2,a1,1c00b1da <_prf+0x6ee>
1c00b172:	02e00593          	li	a1,46
1c00b176:	00b61363          	bne	a2,a1,1c00b17c <_prf+0x690>
1c00b17a:	8dba                	mv	s11,a4
1c00b17c:	fdfaf713          	andi	a4,s5,-33
1c00b180:	04500613          	li	a2,69
1c00b184:	02c71d63          	bne	a4,a2,1c00b1be <_prf+0x6d2>
1c00b188:	87d6                	mv	a5,s5
1c00b18a:	00fd8023          	sb	a5,0(s11)
1c00b18e:	02b00793          	li	a5,43
1c00b192:	000bd663          	bgez	s7,1c00b19e <_prf+0x6b2>
1c00b196:	41700bb3          	neg	s7,s7
1c00b19a:	02d00793          	li	a5,45
1c00b19e:	00fd80a3          	sb	a5,1(s11)
1c00b1a2:	47a9                	li	a5,10
1c00b1a4:	02fbc733          	div	a4,s7,a5
1c00b1a8:	0d91                	addi	s11,s11,4
1c00b1aa:	02fbe6b3          	rem	a3,s7,a5
1c00b1ae:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b1b2:	feed8f23          	sb	a4,-2(s11)
1c00b1b6:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b1ba:	fedd8fa3          	sb	a3,-1(s11)
1c00b1be:	00c8                	addi	a0,sp,68
1c00b1c0:	000d8023          	sb	zero,0(s11)
1c00b1c4:	40ad8533          	sub	a0,s11,a0
1c00b1c8:	b1ed                	j	1c00aeb2 <_prf+0x3c6>
1c00b1ca:	106c                	addi	a1,sp,44
1c00b1cc:	1808                	addi	a0,sp,48
1c00b1ce:	0d85                	addi	s11,s11,1
1c00b1d0:	8e1ff0ef          	jal	ra,1c00aab0 <_get_digit>
1c00b1d4:	fead8fa3          	sb	a0,-1(s11)
1c00b1d8:	b749                	j	1c00b15a <_prf+0x66e>
1c00b1da:	8dba                	mv	s11,a4
1c00b1dc:	b769                	j	1c00b166 <_prf+0x67a>
1c00b1de:	000c2783          	lw	a5,0(s8)
1c00b1e2:	004c0a13          	addi	s4,s8,4
1c00b1e6:	0137a023          	sw	s3,0(a5)
1c00b1ea:	b24d                	j	1c00ab8c <_prf+0xa0>
1c00b1ec:	004c0a13          	addi	s4,s8,4
1c00b1f0:	000c2583          	lw	a1,0(s8)
1c00b1f4:	00dc                	addi	a5,sp,68
1c00b1f6:	040c8463          	beqz	s9,1c00b23e <_prf+0x752>
1c00b1fa:	03000693          	li	a3,48
1c00b1fe:	04d10223          	sb	a3,68(sp)
1c00b202:	04510513          	addi	a0,sp,69
1c00b206:	ed8d                	bnez	a1,1c00b240 <_prf+0x754>
1c00b208:	040102a3          	sb	zero,69(sp)
1c00b20c:	57fd                	li	a5,-1
1c00b20e:	4401                	li	s0,0
1c00b210:	0efd1163          	bne	s10,a5,1c00b2f2 <_prf+0x806>
1c00b214:	0f2cc363          	blt	s9,s2,1c00b2fa <_prf+0x80e>
1c00b218:	8966                	mv	s2,s9
1c00b21a:	00c0                	addi	s0,sp,68
1c00b21c:	40898ab3          	sub	s5,s3,s0
1c00b220:	5b7d                	li	s6,-1
1c00b222:	015409b3          	add	s3,s0,s5
1c00b226:	960903e3          	beqz	s2,1c00ab8c <_prf+0xa0>
1c00b22a:	45f2                	lw	a1,28(sp)
1c00b22c:	00044503          	lbu	a0,0(s0)
1c00b230:	47e2                	lw	a5,24(sp)
1c00b232:	9782                	jalr	a5
1c00b234:	91650be3          	beq	a0,s6,1c00ab4a <_prf+0x5e>
1c00b238:	197d                	addi	s2,s2,-1
1c00b23a:	0405                	addi	s0,s0,1
1c00b23c:	b7dd                	j	1c00b222 <_prf+0x736>
1c00b23e:	853e                	mv	a0,a5
1c00b240:	86ea                	mv	a3,s10
1c00b242:	4621                	li	a2,8
1c00b244:	40f50433          	sub	s0,a0,a5
1c00b248:	fa0ff0ef          	jal	ra,1c00a9e8 <_to_x>
1c00b24c:	9522                	add	a0,a0,s0
1c00b24e:	57fd                	li	a5,-1
1c00b250:	4401                	li	s0,0
1c00b252:	c6fd0ae3          	beq	s10,a5,1c00aec6 <_prf+0x3da>
1c00b256:	02000793          	li	a5,32
1c00b25a:	c83e                	sw	a5,16(sp)
1c00b25c:	b1ad                	j	1c00aec6 <_prf+0x3da>
1c00b25e:	000c2583          	lw	a1,0(s8)
1c00b262:	77e1                	lui	a5,0xffff8
1c00b264:	8307c793          	xori	a5,a5,-2000
1c00b268:	46a1                	li	a3,8
1c00b26a:	4641                	li	a2,16
1c00b26c:	04610513          	addi	a0,sp,70
1c00b270:	04f11223          	sh	a5,68(sp)
1c00b274:	f74ff0ef          	jal	ra,1c00a9e8 <_to_x>
1c00b278:	004c0a13          	addi	s4,s8,4
1c00b27c:	0509                	addi	a0,a0,2
1c00b27e:	57fd                	li	a5,-1
1c00b280:	4401                	li	s0,0
1c00b282:	c4fd02e3          	beq	s10,a5,1c00aec6 <_prf+0x3da>
1c00b286:	02000713          	li	a4,32
1c00b28a:	c83a                	sw	a4,16(sp)
1c00b28c:	b92d                	j	1c00aec6 <_prf+0x3da>
1c00b28e:	000d4563          	bltz	s10,1c00b298 <_prf+0x7ac>
1c00b292:	019d5363          	ble	s9,s10,1c00b298 <_prf+0x7ac>
1c00b296:	8cea                	mv	s9,s10
1c00b298:	8e0c8ae3          	beqz	s9,1c00ab8c <_prf+0xa0>
1c00b29c:	8666                	mv	a2,s9
1c00b29e:	00c8                	addi	a0,sp,68
1c00b2a0:	ce4ff0ef          	jal	ra,1c00a784 <memcpy>
1c00b2a4:	b6b9                	j	1c00adf2 <_prf+0x306>
1c00b2a6:	000c2583          	lw	a1,0(s8)
1c00b2aa:	86ea                	mv	a3,s10
1c00b2ac:	4629                	li	a2,10
1c00b2ae:	00c8                	addi	a0,sp,68
1c00b2b0:	004c0a13          	addi	s4,s8,4
1c00b2b4:	f34ff0ef          	jal	ra,1c00a9e8 <_to_x>
1c00b2b8:	bf59                	j	1c00b24e <_prf+0x762>
1c00b2ba:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b2be:	0ff67613          	andi	a2,a2,255
1c00b2c2:	00c5e563          	bltu	a1,a2,1c00b2cc <_prf+0x7e0>
1c00b2c6:	1781                	addi	a5,a5,-32
1c00b2c8:	00f68023          	sb	a5,0(a3)
1c00b2cc:	0685                	addi	a3,a3,1
1c00b2ce:	0006c783          	lbu	a5,0(a3)
1c00b2d2:	f7e5                	bnez	a5,1c00b2ba <_prf+0x7ce>
1c00b2d4:	bc9d                	j	1c00ad4a <_prf+0x25e>
1c00b2d6:	86de                	mv	a3,s7
1c00b2d8:	45e5                	li	a1,25
1c00b2da:	bfd5                	j	1c00b2ce <_prf+0x7e2>
1c00b2dc:	45f2                	lw	a1,28(sp)
1c00b2de:	4762                	lw	a4,24(sp)
1c00b2e0:	02500513          	li	a0,37
1c00b2e4:	9702                	jalr	a4
1c00b2e6:	57fd                	li	a5,-1
1c00b2e8:	86f501e3          	beq	a0,a5,1c00ab4a <_prf+0x5e>
1c00b2ec:	0985                	addi	s3,s3,1
1c00b2ee:	8a62                	mv	s4,s8
1c00b2f0:	b871                	j	1c00ab8c <_prf+0xa0>
1c00b2f2:	02000793          	li	a5,32
1c00b2f6:	c83e                	sw	a5,16(sp)
1c00b2f8:	bf31                	j	1c00b214 <_prf+0x728>
1c00b2fa:	4732                	lw	a4,12(sp)
1c00b2fc:	cf01                	beqz	a4,1c00b314 <_prf+0x828>
1c00b2fe:	02000713          	li	a4,32
1c00b302:	00d4                	addi	a3,sp,68
1c00b304:	019687b3          	add	a5,a3,s9
1c00b308:	00e78023          	sb	a4,0(a5)
1c00b30c:	0c85                	addi	s9,s9,1
1c00b30e:	ff991ae3          	bne	s2,s9,1c00b302 <_prf+0x816>
1c00b312:	b721                	j	1c00b21a <_prf+0x72e>
1c00b314:	00cc                	addi	a1,sp,68
1c00b316:	41990bb3          	sub	s7,s2,s9
1c00b31a:	001c8613          	addi	a2,s9,1
1c00b31e:	01758533          	add	a0,a1,s7
1c00b322:	c7aff0ef          	jal	ra,1c00a79c <memmove>
1c00b326:	4742                	lw	a4,16(sp)
1c00b328:	02000793          	li	a5,32
1c00b32c:	00f70363          	beq	a4,a5,1c00b332 <_prf+0x846>
1c00b330:	c622                	sw	s0,12(sp)
1c00b332:	47b2                	lw	a5,12(sp)
1c00b334:	9bbe                	add	s7,s7,a5
1c00b336:	4732                	lw	a4,12(sp)
1c00b338:	ef7751e3          	ble	s7,a4,1c00b21a <_prf+0x72e>
1c00b33c:	4732                	lw	a4,12(sp)
1c00b33e:	00d4                	addi	a3,sp,68
1c00b340:	00e687b3          	add	a5,a3,a4
1c00b344:	4742                	lw	a4,16(sp)
1c00b346:	00e78023          	sb	a4,0(a5)
1c00b34a:	47b2                	lw	a5,12(sp)
1c00b34c:	0785                	addi	a5,a5,1
1c00b34e:	c63e                	sw	a5,12(sp)
1c00b350:	b7dd                	j	1c00b336 <_prf+0x84a>
1c00b352:	4452                	lw	s0,20(sp)
1c00b354:	be8d                	j	1c00aec6 <_prf+0x3da>

1c00b356 <__rt_uart_cluster_req_done>:
1c00b356:	300476f3          	csrrci	a3,mstatus,8
1c00b35a:	4785                	li	a5,1
1c00b35c:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b360:	09954783          	lbu	a5,153(a0)
1c00b364:	00201737          	lui	a4,0x201
1c00b368:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f4418>
1c00b36c:	04078793          	addi	a5,a5,64
1c00b370:	07da                	slli	a5,a5,0x16
1c00b372:	97ba                	add	a5,a5,a4
1c00b374:	0007a023          	sw	zero,0(a5)
1c00b378:	30069073          	csrw	mstatus,a3
1c00b37c:	8082                	ret

1c00b37e <__rt_uart_setup.isra.6>:
1c00b37e:	1c001737          	lui	a4,0x1c001
1c00b382:	1f872703          	lw	a4,504(a4) # 1c0011f8 <__rt_freq_domains>
1c00b386:	00155793          	srli	a5,a0,0x1
1c00b38a:	97ba                	add	a5,a5,a4
1c00b38c:	02a7d7b3          	divu	a5,a5,a0
1c00b390:	1a102737          	lui	a4,0x1a102
1c00b394:	17fd                	addi	a5,a5,-1
1c00b396:	07c2                	slli	a5,a5,0x10
1c00b398:	3067e793          	ori	a5,a5,774
1c00b39c:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0feb90>
1c00b3a0:	8082                	ret

1c00b3a2 <__rt_uart_setfreq_after>:
1c00b3a2:	1c0017b7          	lui	a5,0x1c001
1c00b3a6:	17878793          	addi	a5,a5,376 # 1c001178 <__rt_uart>
1c00b3aa:	4398                	lw	a4,0(a5)
1c00b3ac:	cb09                	beqz	a4,1c00b3be <__rt_uart_setfreq_after+0x1c>
1c00b3ae:	4788                	lw	a0,8(a5)
1c00b3b0:	1141                	addi	sp,sp,-16
1c00b3b2:	c606                	sw	ra,12(sp)
1c00b3b4:	37e9                	jal	1c00b37e <__rt_uart_setup.isra.6>
1c00b3b6:	40b2                	lw	ra,12(sp)
1c00b3b8:	4501                	li	a0,0
1c00b3ba:	0141                	addi	sp,sp,16
1c00b3bc:	8082                	ret
1c00b3be:	4501                	li	a0,0
1c00b3c0:	8082                	ret

1c00b3c2 <__rt_uart_cluster_req>:
1c00b3c2:	1141                	addi	sp,sp,-16
1c00b3c4:	c606                	sw	ra,12(sp)
1c00b3c6:	c422                	sw	s0,8(sp)
1c00b3c8:	30047473          	csrrci	s0,mstatus,8
1c00b3cc:	1c00b7b7          	lui	a5,0x1c00b
1c00b3d0:	35678793          	addi	a5,a5,854 # 1c00b356 <__rt_uart_cluster_req_done>
1c00b3d4:	c55c                	sw	a5,12(a0)
1c00b3d6:	4785                	li	a5,1
1c00b3d8:	d55c                	sw	a5,44(a0)
1c00b3da:	411c                	lw	a5,0(a0)
1c00b3dc:	02052823          	sw	zero,48(a0)
1c00b3e0:	c908                	sw	a0,16(a0)
1c00b3e2:	43cc                	lw	a1,4(a5)
1c00b3e4:	4514                	lw	a3,8(a0)
1c00b3e6:	4150                	lw	a2,4(a0)
1c00b3e8:	0586                	slli	a1,a1,0x1
1c00b3ea:	00c50793          	addi	a5,a0,12
1c00b3ee:	4701                	li	a4,0
1c00b3f0:	0585                	addi	a1,a1,1
1c00b3f2:	4501                	li	a0,0
1c00b3f4:	e99fe0ef          	jal	ra,1c00a28c <rt_periph_copy>
1c00b3f8:	30041073          	csrw	mstatus,s0
1c00b3fc:	40b2                	lw	ra,12(sp)
1c00b3fe:	4422                	lw	s0,8(sp)
1c00b400:	0141                	addi	sp,sp,16
1c00b402:	8082                	ret

1c00b404 <__rt_uart_wait_tx_done.isra.5>:
1c00b404:	1a102737          	lui	a4,0x1a102
1c00b408:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa0feb84>
1c00b40c:	8bc1                	andi	a5,a5,16
1c00b40e:	e7b9                	bnez	a5,1c00b45c <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b410:	1a102737          	lui	a4,0x1a102
1c00b414:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa0feb8c>
1c00b418:	8b85                	andi	a5,a5,1
1c00b41a:	ffed                	bnez	a5,1c00b414 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b41c:	f14027f3          	csrr	a5,mhartid
1c00b420:	8795                	srai	a5,a5,0x5
1c00b422:	1a10a637          	lui	a2,0x1a10a
1c00b426:	03f7f793          	andi	a5,a5,63
1c00b42a:	03200693          	li	a3,50
1c00b42e:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa106200>
1c00b432:	6711                	lui	a4,0x4
1c00b434:	6311                	lui	t1,0x4
1c00b436:	45fd                	li	a1,31
1c00b438:	00204537          	lui	a0,0x204
1c00b43c:	88be                	mv	a7,a5
1c00b43e:	00682023          	sw	t1,0(a6)
1c00b442:	02b79063          	bne	a5,a1,1c00b462 <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b446:	80e62223          	sw	a4,-2044(a2)
1c00b44a:	10500073          	wfi
1c00b44e:	00b89c63          	bne	a7,a1,1c00b466 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b452:	80e62423          	sw	a4,-2040(a2)
1c00b456:	16fd                	addi	a3,a3,-1
1c00b458:	f2fd                	bnez	a3,1c00b43e <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b45a:	8082                	ret
1c00b45c:	10500073          	wfi
1c00b460:	b765                	j	1c00b408 <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b462:	c958                	sw	a4,20(a0)
1c00b464:	b7dd                	j	1c00b44a <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b466:	c918                	sw	a4,16(a0)
1c00b468:	b7fd                	j	1c00b456 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b46a <__rt_uart_setfreq_before>:
1c00b46a:	1c0017b7          	lui	a5,0x1c001
1c00b46e:	1787a783          	lw	a5,376(a5) # 1c001178 <__rt_uart>
1c00b472:	cf99                	beqz	a5,1c00b490 <__rt_uart_setfreq_before+0x26>
1c00b474:	1141                	addi	sp,sp,-16
1c00b476:	c606                	sw	ra,12(sp)
1c00b478:	3771                	jal	1c00b404 <__rt_uart_wait_tx_done.isra.5>
1c00b47a:	40b2                	lw	ra,12(sp)
1c00b47c:	005007b7          	lui	a5,0x500
1c00b480:	1a102737          	lui	a4,0x1a102
1c00b484:	0799                	addi	a5,a5,6
1c00b486:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0feb90>
1c00b48a:	4501                	li	a0,0
1c00b48c:	0141                	addi	sp,sp,16
1c00b48e:	8082                	ret
1c00b490:	4501                	li	a0,0
1c00b492:	8082                	ret

1c00b494 <soc_eu_fcEventMask_setEvent>:
1c00b494:	47fd                	li	a5,31
1c00b496:	4721                	li	a4,8
1c00b498:	00a7d463          	ble	a0,a5,1c00b4a0 <soc_eu_fcEventMask_setEvent+0xc>
1c00b49c:	1501                	addi	a0,a0,-32
1c00b49e:	4711                	li	a4,4
1c00b4a0:	1a1067b7          	lui	a5,0x1a106
1c00b4a4:	973e                	add	a4,a4,a5
1c00b4a6:	4314                	lw	a3,0(a4)
1c00b4a8:	4785                	li	a5,1
1c00b4aa:	00a79533          	sll	a0,a5,a0
1c00b4ae:	fff54513          	not	a0,a0
1c00b4b2:	8d75                	and	a0,a0,a3
1c00b4b4:	c308                	sw	a0,0(a4)
1c00b4b6:	8082                	ret

1c00b4b8 <rt_uart_conf_init>:
1c00b4b8:	000997b7          	lui	a5,0x99
1c00b4bc:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8bf7c>
1c00b4c0:	c11c                	sw	a5,0(a0)
1c00b4c2:	57fd                	li	a5,-1
1c00b4c4:	c15c                	sw	a5,4(a0)
1c00b4c6:	8082                	ret

1c00b4c8 <__rt_uart_open>:
1c00b4c8:	1141                	addi	sp,sp,-16
1c00b4ca:	c606                	sw	ra,12(sp)
1c00b4cc:	c422                	sw	s0,8(sp)
1c00b4ce:	c226                	sw	s1,4(sp)
1c00b4d0:	c04a                	sw	s2,0(sp)
1c00b4d2:	30047973          	csrrci	s2,mstatus,8
1c00b4d6:	cd8d                	beqz	a1,1c00b510 <__rt_uart_open+0x48>
1c00b4d8:	4194                	lw	a3,0(a1)
1c00b4da:	1c0017b7          	lui	a5,0x1c001
1c00b4de:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f7611>
1c00b4e2:	17878413          	addi	s0,a5,376 # 1c001178 <__rt_uart>
1c00b4e6:	0712                	slli	a4,a4,0x4
1c00b4e8:	943a                	add	s0,s0,a4
1c00b4ea:	4010                	lw	a2,0(s0)
1c00b4ec:	17878793          	addi	a5,a5,376
1c00b4f0:	c60d                	beqz	a2,1c00b51a <__rt_uart_open+0x52>
1c00b4f2:	c589                	beqz	a1,1c00b4fc <__rt_uart_open+0x34>
1c00b4f4:	418c                	lw	a1,0(a1)
1c00b4f6:	4414                	lw	a3,8(s0)
1c00b4f8:	04d59a63          	bne	a1,a3,1c00b54c <__rt_uart_open+0x84>
1c00b4fc:	97ba                	add	a5,a5,a4
1c00b4fe:	0605                	addi	a2,a2,1
1c00b500:	c390                	sw	a2,0(a5)
1c00b502:	8522                	mv	a0,s0
1c00b504:	40b2                	lw	ra,12(sp)
1c00b506:	4422                	lw	s0,8(sp)
1c00b508:	4492                	lw	s1,4(sp)
1c00b50a:	4902                	lw	s2,0(sp)
1c00b50c:	0141                	addi	sp,sp,16
1c00b50e:	8082                	ret
1c00b510:	000996b7          	lui	a3,0x99
1c00b514:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8bf7c>
1c00b518:	b7c9                	j	1c00b4da <__rt_uart_open+0x12>
1c00b51a:	4785                	li	a5,1
1c00b51c:	1a102737          	lui	a4,0x1a102
1c00b520:	c01c                	sw	a5,0(s0)
1c00b522:	c048                	sw	a0,4(s0)
1c00b524:	c414                	sw	a3,8(s0)
1c00b526:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa0ff16c>
1c00b52a:	00a797b3          	sll	a5,a5,a0
1c00b52e:	00151493          	slli	s1,a0,0x1
1c00b532:	8fd5                	or	a5,a5,a3
1c00b534:	78f72023          	sw	a5,1920(a4)
1c00b538:	8526                	mv	a0,s1
1c00b53a:	3fa9                	jal	1c00b494 <soc_eu_fcEventMask_setEvent>
1c00b53c:	00148513          	addi	a0,s1,1
1c00b540:	3f91                	jal	1c00b494 <soc_eu_fcEventMask_setEvent>
1c00b542:	4408                	lw	a0,8(s0)
1c00b544:	3d2d                	jal	1c00b37e <__rt_uart_setup.isra.6>
1c00b546:	30091073          	csrw	mstatus,s2
1c00b54a:	bf65                	j	1c00b502 <__rt_uart_open+0x3a>
1c00b54c:	4401                	li	s0,0
1c00b54e:	bf55                	j	1c00b502 <__rt_uart_open+0x3a>

1c00b550 <rt_uart_close>:
1c00b550:	1141                	addi	sp,sp,-16
1c00b552:	c606                	sw	ra,12(sp)
1c00b554:	c422                	sw	s0,8(sp)
1c00b556:	c226                	sw	s1,4(sp)
1c00b558:	300474f3          	csrrci	s1,mstatus,8
1c00b55c:	411c                	lw	a5,0(a0)
1c00b55e:	17fd                	addi	a5,a5,-1
1c00b560:	c11c                	sw	a5,0(a0)
1c00b562:	e78d                	bnez	a5,1c00b58c <rt_uart_close+0x3c>
1c00b564:	842a                	mv	s0,a0
1c00b566:	3d79                	jal	1c00b404 <__rt_uart_wait_tx_done.isra.5>
1c00b568:	005007b7          	lui	a5,0x500
1c00b56c:	1a102737          	lui	a4,0x1a102
1c00b570:	0799                	addi	a5,a5,6
1c00b572:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0feb90>
1c00b576:	4050                	lw	a2,4(s0)
1c00b578:	78072683          	lw	a3,1920(a4)
1c00b57c:	4785                	li	a5,1
1c00b57e:	00c797b3          	sll	a5,a5,a2
1c00b582:	fff7c793          	not	a5,a5
1c00b586:	8ff5                	and	a5,a5,a3
1c00b588:	78f72023          	sw	a5,1920(a4)
1c00b58c:	30049073          	csrw	mstatus,s1
1c00b590:	40b2                	lw	ra,12(sp)
1c00b592:	4422                	lw	s0,8(sp)
1c00b594:	4492                	lw	s1,4(sp)
1c00b596:	0141                	addi	sp,sp,16
1c00b598:	8082                	ret

1c00b59a <rt_uart_cluster_write>:
1c00b59a:	f14027f3          	csrr	a5,mhartid
1c00b59e:	8795                	srai	a5,a5,0x5
1c00b5a0:	03f7f793          	andi	a5,a5,63
1c00b5a4:	08f68ca3          	sb	a5,153(a3)
1c00b5a8:	1c00b7b7          	lui	a5,0x1c00b
1c00b5ac:	3c278793          	addi	a5,a5,962 # 1c00b3c2 <__rt_uart_cluster_req>
1c00b5b0:	c6dc                	sw	a5,12(a3)
1c00b5b2:	4785                	li	a5,1
1c00b5b4:	c288                	sw	a0,0(a3)
1c00b5b6:	c2cc                	sw	a1,4(a3)
1c00b5b8:	c690                	sw	a2,8(a3)
1c00b5ba:	08068c23          	sb	zero,152(a3)
1c00b5be:	0206a823          	sw	zero,48(a3)
1c00b5c2:	ca94                	sw	a3,16(a3)
1c00b5c4:	d6dc                	sw	a5,44(a3)
1c00b5c6:	00c68513          	addi	a0,a3,12
1c00b5ca:	ab7fd06f          	j	1c009080 <__rt_cluster_push_fc_event>

1c00b5ce <__rt_uart_init>:
1c00b5ce:	1c00b5b7          	lui	a1,0x1c00b
1c00b5d2:	1141                	addi	sp,sp,-16
1c00b5d4:	4601                	li	a2,0
1c00b5d6:	46a58593          	addi	a1,a1,1130 # 1c00b46a <__rt_uart_setfreq_before>
1c00b5da:	4511                	li	a0,4
1c00b5dc:	c606                	sw	ra,12(sp)
1c00b5de:	c422                	sw	s0,8(sp)
1c00b5e0:	8bcfe0ef          	jal	ra,1c00969c <__rt_cbsys_add>
1c00b5e4:	1c00b5b7          	lui	a1,0x1c00b
1c00b5e8:	842a                	mv	s0,a0
1c00b5ea:	4601                	li	a2,0
1c00b5ec:	3a258593          	addi	a1,a1,930 # 1c00b3a2 <__rt_uart_setfreq_after>
1c00b5f0:	4515                	li	a0,5
1c00b5f2:	8aafe0ef          	jal	ra,1c00969c <__rt_cbsys_add>
1c00b5f6:	1c0017b7          	lui	a5,0x1c001
1c00b5fa:	1607ac23          	sw	zero,376(a5) # 1c001178 <__rt_uart>
1c00b5fe:	8d41                	or	a0,a0,s0
1c00b600:	c105                	beqz	a0,1c00b620 <__rt_uart_init+0x52>
1c00b602:	f1402673          	csrr	a2,mhartid
1c00b606:	1c000537          	lui	a0,0x1c000
1c00b60a:	40565593          	srai	a1,a2,0x5
1c00b60e:	03f5f593          	andi	a1,a1,63
1c00b612:	8a7d                	andi	a2,a2,31
1c00b614:	67450513          	addi	a0,a0,1652 # 1c000674 <__DTOR_END__+0x388>
1c00b618:	ba6ff0ef          	jal	ra,1c00a9be <printf>
1c00b61c:	b2eff0ef          	jal	ra,1c00a94a <abort>
1c00b620:	40b2                	lw	ra,12(sp)
1c00b622:	4422                	lw	s0,8(sp)
1c00b624:	0141                	addi	sp,sp,16
1c00b626:	8082                	ret

Disassembly of section .text.cluster:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x1f7614>
1c010016:	0e059863          	bnez	a1,1c010106 <__rt_slave_start>
1c01001a:	e3ff0417          	auipc	s0,0xe3ff0
1c01001e:	fea40413          	addi	s0,s0,-22 # 4 <__rt_bridge_flash_handle>
1c010022:	002049b7          	lui	s3,0x204
1c010026:	4a09                	li	s4,2
1c010028:	00000a97          	auipc	s5,0x0
1c01002c:	034a8a93          	addi	s5,s5,52 # 1c01005c <__rt_master_event>
1c010030:	ffff1b97          	auipc	s7,0xffff1
1c010034:	198b8b93          	addi	s7,s7,408 # 1c0011c8 <__rt_fc_cluster_data>
1c010038:	02800393          	li	t2,40
1c01003c:	02a383b3          	mul	t2,t2,a0
1c010040:	9b9e                	add	s7,s7,t2
1c010042:	0b91                	addi	s7,s7,4
1c010044:	1a10acb7          	lui	s9,0x1a10a
1c010048:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_end+0xa1061fc>
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
1c0100cc:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1f7698>
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
1c010124:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x1f7830>

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
