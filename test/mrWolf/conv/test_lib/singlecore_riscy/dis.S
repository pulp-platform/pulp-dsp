/home/moritz/pulp-sdk/pkg/pulp_riscv_gcc/1.0.13/bin/riscv32-unknown-elf-objdump -Mmarch=rv32imfcxpulpv2 /home/moritz/PULP-DSP/test/mrWolf/conv/test_lib/singlecore_riscy/build/wolfe/test/test -d

/home/moritz/PULP-DSP/test/mrWolf/conv/test_lib/singlecore_riscy/build/wolfe/test/test:     file format elf32-littleriscv


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
1c008084:	1cc0006f          	j	1c008250 <__rt_illegal_instr>
	...

1c008090 <__rt_debug_struct_ptr>:
1c008090:	0f4c                	addi	a1,sp,916
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
1c0080bc:	f6028293          	addi	t0,t0,-160 # 1c001018 <_bss_start>
1c0080c0:	ffff9317          	auipc	t1,0xffff9
1c0080c4:	0bc30313          	addi	t1,t1,188 # 1c00117c <__l2_priv0_end>
1c0080c8:	0002a023          	sw	zero,0(t0)
1c0080cc:	0291                	addi	t0,t0,4
1c0080ce:	fe62ede3          	bltu	t0,t1,1c0080c8 <_entry+0x28>
1c0080d2:	ffff9117          	auipc	sp,0xffff9
1c0080d6:	d5e10113          	addi	sp,sp,-674 # 1c000e30 <stack>
1c0080da:	7cc010ef          	jal	ra,1c0098a6 <__rt_init>
1c0080de:	00000513          	li	a0,0
1c0080e2:	00000593          	li	a1,0
1c0080e6:	00000397          	auipc	t2,0x0
1c0080ea:	5ec38393          	addi	t2,t2,1516 # 1c0086d2 <main>
1c0080ee:	000380e7          	jalr	t2
1c0080f2:	842a                	mv	s0,a0
1c0080f4:	127010ef          	jal	ra,1c009a1a <__rt_deinit>
1c0080f8:	8522                	mv	a0,s0
1c0080fa:	573020ef          	jal	ra,1c00ae6c <exit>

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
1c008144:	a0d9                	j	1c00820a <__rt_call_external_c_function>

1c008146 <__rt_bridge_enqueue_event>:
1c008146:	fe812e23          	sw	s0,-4(sp)
1c00814a:	fe912c23          	sw	s1,-8(sp)
1c00814e:	fea12a23          	sw	a0,-12(sp)
1c008152:	feb12823          	sw	a1,-16(sp)
1c008156:	fec12623          	sw	a2,-20(sp)
1c00815a:	00002617          	auipc	a2,0x2
1c00815e:	c7c60613          	addi	a2,a2,-900 # 1c009dd6 <__rt_bridge_handle_notif>
1c008162:	0a8004ef          	jal	s1,1c00820a <__rt_call_external_c_function>
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
1c008198:	fac48493          	addi	s1,s1,-84 # 1c001140 <__rt_fc_cluster_data>

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
1c0081fa:	f4a48493          	addi	s1,s1,-182 # 1c001140 <__rt_fc_cluster_data>
1c0081fe:	02800593          	li	a1,40
1c008202:	02b405b3          	mul	a1,s0,a1
1c008206:	94ae                	add	s1,s1,a1
1c008208:	bf51                	j	1c00819c <__rt_remote_enqueue_event_loop_cluster>

1c00820a <__rt_call_external_c_function>:
1c00820a:	7119                	addi	sp,sp,-128
1c00820c:	c006                	sw	ra,0(sp)
1c00820e:	c20e                	sw	gp,4(sp)
1c008210:	c412                	sw	tp,8(sp)
1c008212:	c616                	sw	t0,12(sp)
1c008214:	c81a                	sw	t1,16(sp)
1c008216:	ca1e                	sw	t2,20(sp)
1c008218:	d236                	sw	a3,36(sp)
1c00821a:	d43a                	sw	a4,40(sp)
1c00821c:	d63e                	sw	a5,44(sp)
1c00821e:	d842                	sw	a6,48(sp)
1c008220:	da46                	sw	a7,52(sp)
1c008222:	dc72                	sw	t3,56(sp)
1c008224:	de76                	sw	t4,60(sp)
1c008226:	c0fa                	sw	t5,64(sp)
1c008228:	c6fe                	sw	t6,76(sp)
1c00822a:	000600e7          	jalr	a2
1c00822e:	4082                	lw	ra,0(sp)
1c008230:	4192                	lw	gp,4(sp)
1c008232:	4222                	lw	tp,8(sp)
1c008234:	42b2                	lw	t0,12(sp)
1c008236:	4342                	lw	t1,16(sp)
1c008238:	43d2                	lw	t2,20(sp)
1c00823a:	5692                	lw	a3,36(sp)
1c00823c:	5722                	lw	a4,40(sp)
1c00823e:	57b2                	lw	a5,44(sp)
1c008240:	5842                	lw	a6,48(sp)
1c008242:	58d2                	lw	a7,52(sp)
1c008244:	5e62                	lw	t3,56(sp)
1c008246:	5ef2                	lw	t4,60(sp)
1c008248:	4f06                	lw	t5,64(sp)
1c00824a:	4fb6                	lw	t6,76(sp)
1c00824c:	6109                	addi	sp,sp,128
1c00824e:	8482                	jr	s1

1c008250 <__rt_illegal_instr>:
1c008250:	fe112e23          	sw	ra,-4(sp)
1c008254:	fea12c23          	sw	a0,-8(sp)
1c008258:	00002517          	auipc	a0,0x2
1c00825c:	85250513          	addi	a0,a0,-1966 # 1c009aaa <__rt_handle_illegal_instr>
1c008260:	010000ef          	jal	ra,1c008270 <__rt_call_c_function>
1c008264:	ffc12083          	lw	ra,-4(sp)
1c008268:	ff812503          	lw	a0,-8(sp)
1c00826c:	30200073          	mret

1c008270 <__rt_call_c_function>:
1c008270:	7119                	addi	sp,sp,-128
1c008272:	c006                	sw	ra,0(sp)
1c008274:	c20e                	sw	gp,4(sp)
1c008276:	c412                	sw	tp,8(sp)
1c008278:	c616                	sw	t0,12(sp)
1c00827a:	c81a                	sw	t1,16(sp)
1c00827c:	ca1e                	sw	t2,20(sp)
1c00827e:	ce2e                	sw	a1,28(sp)
1c008280:	d032                	sw	a2,32(sp)
1c008282:	d236                	sw	a3,36(sp)
1c008284:	d43a                	sw	a4,40(sp)
1c008286:	d63e                	sw	a5,44(sp)
1c008288:	d842                	sw	a6,48(sp)
1c00828a:	da46                	sw	a7,52(sp)
1c00828c:	dc72                	sw	t3,56(sp)
1c00828e:	de76                	sw	t4,60(sp)
1c008290:	c0fa                	sw	t5,64(sp)
1c008292:	c6fe                	sw	t6,76(sp)
1c008294:	000500e7          	jalr	a0
1c008298:	4082                	lw	ra,0(sp)
1c00829a:	4192                	lw	gp,4(sp)
1c00829c:	4222                	lw	tp,8(sp)
1c00829e:	42b2                	lw	t0,12(sp)
1c0082a0:	4342                	lw	t1,16(sp)
1c0082a2:	43d2                	lw	t2,20(sp)
1c0082a4:	45f2                	lw	a1,28(sp)
1c0082a6:	5602                	lw	a2,32(sp)
1c0082a8:	5692                	lw	a3,36(sp)
1c0082aa:	5722                	lw	a4,40(sp)
1c0082ac:	57b2                	lw	a5,44(sp)
1c0082ae:	5842                	lw	a6,48(sp)
1c0082b0:	58d2                	lw	a7,52(sp)
1c0082b2:	5e62                	lw	t3,56(sp)
1c0082b4:	5ef2                	lw	t4,60(sp)
1c0082b6:	4f06                	lw	t5,64(sp)
1c0082b8:	4fb6                	lw	t6,76(sp)
1c0082ba:	6109                	addi	sp,sp,128
1c0082bc:	8082                	ret

1c0082be <__rt_thread_start>:
1c0082be:	8526                	mv	a0,s1
1c0082c0:	80ca                	mv	ra,s2
1c0082c2:	8402                	jr	s0

1c0082c4 <__rt_thread_switch>:
1c0082c4:	00152023          	sw	ra,0(a0)
1c0082c8:	c140                	sw	s0,4(a0)
1c0082ca:	c504                	sw	s1,8(a0)
1c0082cc:	01252623          	sw	s2,12(a0)
1c0082d0:	01352823          	sw	s3,16(a0)
1c0082d4:	01452a23          	sw	s4,20(a0)
1c0082d8:	01552c23          	sw	s5,24(a0)
1c0082dc:	01652e23          	sw	s6,28(a0)
1c0082e0:	03752023          	sw	s7,32(a0)
1c0082e4:	03852223          	sw	s8,36(a0)
1c0082e8:	03952423          	sw	s9,40(a0)
1c0082ec:	03a52623          	sw	s10,44(a0)
1c0082f0:	03b52823          	sw	s11,48(a0)
1c0082f4:	02252a23          	sw	sp,52(a0)
1c0082f8:	0005a083          	lw	ra,0(a1)
1c0082fc:	41c0                	lw	s0,4(a1)
1c0082fe:	4584                	lw	s1,8(a1)
1c008300:	00c5a903          	lw	s2,12(a1)
1c008304:	0105a983          	lw	s3,16(a1)
1c008308:	0145aa03          	lw	s4,20(a1)
1c00830c:	0185aa83          	lw	s5,24(a1)
1c008310:	01c5ab03          	lw	s6,28(a1)
1c008314:	0205ab83          	lw	s7,32(a1)
1c008318:	0245ac03          	lw	s8,36(a1)
1c00831c:	0285ac83          	lw	s9,40(a1)
1c008320:	02c5ad03          	lw	s10,44(a1)
1c008324:	0305ad83          	lw	s11,48(a1)
1c008328:	0345a103          	lw	sp,52(a1)
1c00832c:	8082                	ret

1c00832e <__rt_fc_socevents_handler>:
1c00832e:	7119                	addi	sp,sp,-128
1c008330:	c022                	sw	s0,0(sp)
1c008332:	c226                	sw	s1,4(sp)
1c008334:	c42a                	sw	a0,8(sp)
1c008336:	c62e                	sw	a1,12(sp)
1c008338:	c832                	sw	a2,16(sp)
1c00833a:	1a10a437          	lui	s0,0x1a10a
1c00833e:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_end+0xa1073f4>
1c008342:	5048                	lw	a0,36(s0)
1c008344:	44bd                	li	s1,15
1c008346:	00955c63          	ble	s1,a0,1c00835e <__rt_soc_evt_no_udma_channel>
1c00834a:	e3ff8417          	auipc	s0,0xe3ff8
1c00834e:	cf640413          	addi	s0,s0,-778 # 40 <periph_channels>
1c008352:	00551493          	slli	s1,a0,0x5
1c008356:	94a2                	add	s1,s1,s0
1c008358:	4ccc                	lw	a1,28(s1)
1c00835a:	4080                	lw	s0,0(s1)
1c00835c:	8582                	jr	a1

1c00835e <__rt_soc_evt_no_udma_channel>:
1c00835e:	44f9                	li	s1,30
1c008360:	00955863          	ble	s1,a0,1c008370 <__rt_soc_evt_no_udma>
1c008364:	fea50593          	addi	a1,a0,-22
1c008368:	058a                	slli	a1,a1,0x2
1c00836a:	2485a583          	lw	a1,584(a1)
1c00836e:	8582                	jr	a1

1c008370 <__rt_soc_evt_no_udma>:
1c008370:	e3ff8497          	auipc	s1,0xe3ff8
1c008374:	ed048493          	addi	s1,s1,-304 # 240 <__rt_socevents_status>
1c008378:	02000593          	li	a1,32
1c00837c:	00b54463          	blt	a0,a1,1c008384 <socevents_set>
1c008380:	0491                	addi	s1,s1,4
1c008382:	1501                	addi	a0,a0,-32

1c008384 <socevents_set>:
1c008384:	408c                	lw	a1,0(s1)
1c008386:	4405                	li	s0,1
1c008388:	00a41533          	sll	a0,s0,a0
1c00838c:	00a5e633          	or	a2,a1,a0
1c008390:	c090                	sw	a2,0(s1)

1c008392 <udma_event_handler_end>:
1c008392:	4402                	lw	s0,0(sp)
1c008394:	4492                	lw	s1,4(sp)
1c008396:	4522                	lw	a0,8(sp)
1c008398:	45b2                	lw	a1,12(sp)
1c00839a:	4642                	lw	a2,16(sp)
1c00839c:	6109                	addi	sp,sp,128
1c00839e:	30200073          	mret

1c0083a2 <udma_event_handler>:
1c0083a2:	4080                	lw	s0,0(s1)
1c0083a4:	448c                	lw	a1,8(s1)
1c0083a6:	0a040363          	beqz	s0,1c00844c <__rt_udma_no_copy>
1c0083aa:	4c50                	lw	a2,28(s0)
1c0083ac:	4848                	lw	a0,20(s0)
1c0083ae:	06061263          	bnez	a2,1c008412 <dmaCmd>
1c0083b2:	c088                	sw	a0,0(s1)
1c0083b4:	4448                	lw	a0,12(s0)
1c0083b6:	e55d                	bnez	a0,1c008464 <handle_special_end>

1c0083b8 <resume_after_special_end>:
1c0083b8:	04058263          	beqz	a1,1c0083fc <checkTask>
1c0083bc:	4990                	lw	a2,16(a1)
1c0083be:	49c8                	lw	a0,20(a1)
1c0083c0:	c611                	beqz	a2,1c0083cc <__rt_udma_call_enqueue_callback_resume>
1c0083c2:	00000497          	auipc	s1,0x0
1c0083c6:	00a48493          	addi	s1,s1,10 # 1c0083cc <__rt_udma_call_enqueue_callback_resume>
1c0083ca:	8602                	jr	a2

1c0083cc <__rt_udma_call_enqueue_callback_resume>:
1c0083cc:	44d0                	lw	a2,12(s1)
1c0083ce:	c488                	sw	a0,8(s1)
1c0083d0:	4188                	lw	a0,0(a1)
1c0083d2:	41c4                	lw	s1,4(a1)
1c0083d4:	c208                	sw	a0,0(a2)
1c0083d6:	c244                	sw	s1,4(a2)
1c0083d8:	45c4                	lw	s1,12(a1)
1c0083da:	88bd                	andi	s1,s1,15
1c0083dc:	4515                	li	a0,5
1c0083de:	00a4cd63          	blt	s1,a0,1c0083f8 <transfer_resume>
1c0083e2:	4519                	li	a0,6
1c0083e4:	00a48563          	beq	s1,a0,1c0083ee <dual>
1c0083e8:	451d                	li	a0,7
1c0083ea:	00a48263          	beq	s1,a0,1c0083ee <dual>

1c0083ee <dual>:
1c0083ee:	553d                	li	a0,-17
1c0083f0:	00a674b3          	and	s1,a2,a0
1c0083f4:	51c8                	lw	a0,36(a1)
1c0083f6:	d088                	sw	a0,32(s1)

1c0083f8 <transfer_resume>:
1c0083f8:	4588                	lw	a0,8(a1)
1c0083fa:	c608                	sw	a0,8(a2)

1c0083fc <checkTask>:
1c0083fc:	4c0c                	lw	a1,24(s0)
1c0083fe:	00000497          	auipc	s1,0x0
1c008402:	f9448493          	addi	s1,s1,-108 # 1c008392 <udma_event_handler_end>
1c008406:	00058463          	beqz	a1,1c00840e <checkTask+0x12>
1c00840a:	cf7ff06f          	j	1c008100 <__rt_event_enqueue>
1c00840e:	f85ff06f          	j	1c008392 <udma_event_handler_end>

1c008412 <dmaCmd>:
1c008412:	44cc                	lw	a1,12(s1)
1c008414:	553d                	li	a0,-17
1c008416:	00a5f4b3          	and	s1,a1,a0
1c00841a:	5048                	lw	a0,36(s0)
1c00841c:	9532                	add	a0,a0,a2
1c00841e:	d088                	sw	a0,32(s1)
1c008420:	d048                	sw	a0,36(s0)
1c008422:	4008                	lw	a0,0(s0)
1c008424:	5004                	lw	s1,32(s0)
1c008426:	9532                	add	a0,a0,a2
1c008428:	8c91                	sub	s1,s1,a2
1c00842a:	00964963          	blt	a2,s1,1c00843c <not_last>
1c00842e:	8626                	mv	a2,s1
1c008430:	00042e23          	sw	zero,28(s0)
1c008434:	00061463          	bnez	a2,1c00843c <not_last>
1c008438:	f5bff06f          	j	1c008392 <udma_event_handler_end>

1c00843c <not_last>:
1c00843c:	c008                	sw	a0,0(s0)
1c00843e:	d004                	sw	s1,32(s0)
1c008440:	c188                	sw	a0,0(a1)
1c008442:	c1d0                	sw	a2,4(a1)
1c008444:	4541                	li	a0,16
1c008446:	c588                	sw	a0,8(a1)
1c008448:	f4bff06f          	j	1c008392 <udma_event_handler_end>

1c00844c <__rt_udma_no_copy>:
1c00844c:	e3ff8497          	auipc	s1,0xe3ff8
1c008450:	df448493          	addi	s1,s1,-524 # 240 <__rt_socevents_status>
1c008454:	4080                	lw	s0,0(s1)
1c008456:	4585                	li	a1,1
1c008458:	00a59533          	sll	a0,a1,a0
1c00845c:	8c49                	or	s0,s0,a0
1c00845e:	c080                	sw	s0,0(s1)
1c008460:	f33ff06f          	j	1c008392 <udma_event_handler_end>

1c008464 <handle_special_end>:
1c008464:	460d                	li	a2,3
1c008466:	04c50663          	beq	a0,a2,1c0084b2 <i2c_step1>
1c00846a:	4611                	li	a2,4
1c00846c:	06c50163          	beq	a0,a2,1c0084ce <i2c_step2>
1c008470:	b7a1                	j	1c0083b8 <resume_after_special_end>

1c008472 <spim_step3>:
1c008472:	5408                	lw	a0,40(s0)
1c008474:	c448                	sw	a0,12(s0)
1c008476:	4088                	lw	a0,0(s1)
1c008478:	c848                	sw	a0,20(s0)
1c00847a:	c080                	sw	s0,0(s1)
1c00847c:	44d0                	lw	a2,12(s1)
1c00847e:	5448                	lw	a0,44(s0)
1c008480:	c208                	sw	a0,0(a2)
1c008482:	5048                	lw	a0,36(s0)
1c008484:	c248                	sw	a0,4(a2)
1c008486:	4408                	lw	a0,8(s0)
1c008488:	c608                	sw	a0,8(a2)
1c00848a:	f09ff06f          	j	1c008392 <udma_event_handler_end>

1c00848e <spim_step2>:
1c00848e:	00042623          	sw	zero,12(s0)
1c008492:	4088                	lw	a0,0(s1)
1c008494:	c848                	sw	a0,20(s0)
1c008496:	c080                	sw	s0,0(s1)
1c008498:	90000637          	lui	a2,0x90000
1c00849c:	c070                	sw	a2,68(s0)
1c00849e:	44d0                	lw	a2,12(s1)
1c0084a0:	04440513          	addi	a0,s0,68
1c0084a4:	c208                	sw	a0,0(a2)
1c0084a6:	4511                	li	a0,4
1c0084a8:	c248                	sw	a0,4(a2)
1c0084aa:	4541                	li	a0,16
1c0084ac:	c608                	sw	a0,8(a2)
1c0084ae:	ee5ff06f          	j	1c008392 <udma_event_handler_end>

1c0084b2 <i2c_step1>:
1c0084b2:	5408                	lw	a0,40(s0)
1c0084b4:	c448                	sw	a0,12(s0)
1c0084b6:	4088                	lw	a0,0(s1)
1c0084b8:	c848                	sw	a0,20(s0)
1c0084ba:	c080                	sw	s0,0(s1)
1c0084bc:	44d0                	lw	a2,12(s1)
1c0084be:	4008                	lw	a0,0(s0)
1c0084c0:	c208                	sw	a0,0(a2)
1c0084c2:	5048                	lw	a0,36(s0)
1c0084c4:	c248                	sw	a0,4(a2)
1c0084c6:	4408                	lw	a0,8(s0)
1c0084c8:	c608                	sw	a0,8(a2)
1c0084ca:	ec9ff06f          	j	1c008392 <udma_event_handler_end>

1c0084ce <i2c_step2>:
1c0084ce:	00042623          	sw	zero,12(s0)
1c0084d2:	4088                	lw	a0,0(s1)
1c0084d4:	c848                	sw	a0,20(s0)
1c0084d6:	c080                	sw	s0,0(s1)
1c0084d8:	02000613          	li	a2,32
1c0084dc:	c070                	sw	a2,68(s0)
1c0084de:	44d0                	lw	a2,12(s1)
1c0084e0:	04440513          	addi	a0,s0,68
1c0084e4:	c208                	sw	a0,0(a2)
1c0084e6:	4505                	li	a0,1
1c0084e8:	c248                	sw	a0,4(a2)
1c0084ea:	4541                	li	a0,16
1c0084ec:	c608                	sw	a0,8(a2)
1c0084ee:	ea5ff06f          	j	1c008392 <udma_event_handler_end>

1c0084f2 <__clzsi2>:
1c0084f2:	67c1                	lui	a5,0x10
1c0084f4:	02f57663          	bleu	a5,a0,1c008520 <__clzsi2+0x2e>
1c0084f8:	0ff00793          	li	a5,255
1c0084fc:	00a7b7b3          	sltu	a5,a5,a0
1c008500:	078e                	slli	a5,a5,0x3
1c008502:	02000713          	li	a4,32
1c008506:	8f1d                	sub	a4,a4,a5
1c008508:	00f557b3          	srl	a5,a0,a5
1c00850c:	1c000537          	lui	a0,0x1c000
1c008510:	2ec50513          	addi	a0,a0,748 # 1c0002ec <__DTOR_END__>
1c008514:	97aa                	add	a5,a5,a0
1c008516:	0007c503          	lbu	a0,0(a5) # 10000 <__l1_heap_size+0x240c>
1c00851a:	40a70533          	sub	a0,a4,a0
1c00851e:	8082                	ret
1c008520:	01000737          	lui	a4,0x1000
1c008524:	47c1                	li	a5,16
1c008526:	fce56ee3          	bltu	a0,a4,1c008502 <__clzsi2+0x10>
1c00852a:	47e1                	li	a5,24
1c00852c:	bfd9                	j	1c008502 <__clzsi2+0x10>

1c00852e <cluster_entry>:
1c00852e:	711d                	addi	sp,sp,-96
1c008530:	caa6                	sw	s1,84(sp)
1c008532:	f1402673          	csrr	a2,mhartid
1c008536:	40565493          	srai	s1,a2,0x5
1c00853a:	f264b4b3          	p.bclr	s1,s1,25,6
1c00853e:	1c000537          	lui	a0,0x1c000
1c008542:	f4563633          	p.bclr	a2,a2,26,5
1c008546:	85a6                	mv	a1,s1
1c008548:	3ec50513          	addi	a0,a0,1004 # 1c0003ec <__DTOR_END__+0x100>
1c00854c:	ce86                	sw	ra,92(sp)
1c00854e:	cca2                	sw	s0,88(sp)
1c008550:	1d3020ef          	jal	ra,1c00af22 <printf>
1c008554:	6585                	lui	a1,0x1
1c008556:	7f458593          	addi	a1,a1,2036 # 17f4 <__rt_hyper_pending_emu_stride+0x154c>
1c00855a:	450d                	li	a0,3
1c00855c:	10000437          	lui	s0,0x10000
1c008560:	3fd000ef          	jal	ra,1c00915c <rt_alloc>
1c008564:	01440413          	addi	s0,s0,20 # 10000014 <v_r>
1c008568:	c008                	sw	a0,0(s0)
1c00856a:	0028                	addi	a0,sp,8
1c00856c:	302010ef          	jal	ra,1c00986e <rt_perf_init>
1c008570:	65c1                	lui	a1,0x10
1c008572:	0599                	addi	a1,a1,6
1c008574:	0028                	addi	a0,sp,8
1c008576:	30c010ef          	jal	ra,1c009882 <rt_perf_conf>
1c00857a:	47fd                	li	a5,31
1c00857c:	10f48263          	beq	s1,a5,1c008680 <cluster_entry+0x152>
1c008580:	102007b7          	lui	a5,0x10200
1c008584:	4705                	li	a4,1
1c008586:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fdff4>
1c00858a:	02e7a023          	sw	a4,32(a5)
1c00858e:	4781                	li	a5,0
1c008590:	79f79073          	csrw	pccr31,a5
1c008594:	f14027f3          	csrr	a5,mhartid
1c008598:	477d                	li	a4,31
1c00859a:	ca5797b3          	p.extractu	a5,a5,5,5
1c00859e:	10e78063          	beq	a5,a4,1c00869e <cluster_entry+0x170>
1c0085a2:	102007b7          	lui	a5,0x10200
1c0085a6:	4705                	li	a4,1
1c0085a8:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fdff4>
1c0085ac:	00e7ac23          	sw	a4,24(a5)
1c0085b0:	478d                	li	a5,3
1c0085b2:	7a179073          	csrw	pcmr,a5
1c0085b6:	8622                	mv	a2,s0
1c0085b8:	0046270b          	p.lw	a4,4(a2!) # 90000004 <pulp__FC+0x90000005>
1c0085bc:	10001537          	lui	a0,0x10001
1c0085c0:	3ff00693          	li	a3,1023
1c0085c4:	1ff00593          	li	a1,511
1c0085c8:	81850513          	addi	a0,a0,-2024 # 10000818 <v_a>
1c0085cc:	2299                	jal	1c008712 <plp_conv_i16>
1c0085ce:	477d                	li	a4,31
1c0085d0:	f14027f3          	csrr	a5,mhartid
1c0085d4:	ca5797b3          	p.extractu	a5,a5,5,5
1c0085d8:	0ee78163          	beq	a5,a4,1c0086ba <cluster_entry+0x18c>
1c0085dc:	102007b7          	lui	a5,0x10200
1c0085e0:	40078793          	addi	a5,a5,1024 # 10200400 <__l1_end+0x1fdff4>
1c0085e4:	0007a023          	sw	zero,0(a5)
1c0085e8:	4781                	li	a5,0
1c0085ea:	7a179073          	csrw	pcmr,a5
1c0085ee:	1c001337          	lui	t1,0x1c001
1c0085f2:	0f830313          	addi	t1,t1,248 # 1c0010f8 <nummismatches>
1c0085f6:	00032583          	lw	a1,0(t1)
1c0085fa:	4014                	lw	a3,0(s0)
1c0085fc:	10001737          	lui	a4,0x10001
1c008600:	c1870713          	addi	a4,a4,-1000 # 10000c18 <r>
1c008604:	882e                	mv	a6,a1
1c008606:	4881                	li	a7,0
1c008608:	5fd00793          	li	a5,1533
1c00860c:	0046a60b          	p.lw	a2,4(a3!)
1c008610:	0047250b          	p.lw	a0,4(a4!)
1c008614:	00c50463          	beq	a0,a2,1c00861c <cluster_entry+0xee>
1c008618:	0805                	addi	a6,a6,1
1c00861a:	4885                	li	a7,1
1c00861c:	17fd                	addi	a5,a5,-1
1c00861e:	f7fd                	bnez	a5,1c00860c <cluster_entry+0xde>
1c008620:	0a089563          	bnez	a7,1c0086ca <cluster_entry+0x19c>
1c008624:	1c000537          	lui	a0,0x1c000
1c008628:	41050513          	addi	a0,a0,1040 # 1c000410 <__DTOR_END__+0x124>
1c00862c:	0f7020ef          	jal	ra,1c00af22 <printf>
1c008630:	477d                	li	a4,31
1c008632:	f14027f3          	csrr	a5,mhartid
1c008636:	ca5797b3          	p.extractu	a5,a5,5,5
1c00863a:	06e78b63          	beq	a5,a4,1c0086b0 <cluster_entry+0x182>
1c00863e:	102005b7          	lui	a1,0x10200
1c008642:	40058593          	addi	a1,a1,1024 # 10200400 <__l1_end+0x1fdff4>
1c008646:	0085a583          	lw	a1,8(a1)
1c00864a:	1c000537          	lui	a0,0x1c000
1c00864e:	43850513          	addi	a0,a0,1080 # 1c000438 <__DTOR_END__+0x14c>
1c008652:	0d1020ef          	jal	ra,1c00af22 <printf>
1c008656:	781025f3          	csrr	a1,pccr1
1c00865a:	1c000537          	lui	a0,0x1c000
1c00865e:	44c50513          	addi	a0,a0,1100 # 1c00044c <__DTOR_END__+0x160>
1c008662:	0c1020ef          	jal	ra,1c00af22 <printf>
1c008666:	782025f3          	csrr	a1,pccr2
1c00866a:	1c000537          	lui	a0,0x1c000
1c00866e:	46050513          	addi	a0,a0,1120 # 1c000460 <__DTOR_END__+0x174>
1c008672:	0b1020ef          	jal	ra,1c00af22 <printf>
1c008676:	40f6                	lw	ra,92(sp)
1c008678:	4466                	lw	s0,88(sp)
1c00867a:	44d6                	lw	s1,84(sp)
1c00867c:	6125                	addi	sp,sp,96
1c00867e:	8082                	ret
1c008680:	4785                	li	a5,1
1c008682:	1a10b737          	lui	a4,0x1a10b
1c008686:	02f72023          	sw	a5,32(a4) # 1a10b020 <__l1_end+0xa108c14>
1c00868a:	4781                	li	a5,0
1c00868c:	79f79073          	csrw	pccr31,a5
1c008690:	f14027f3          	csrr	a5,mhartid
1c008694:	477d                	li	a4,31
1c008696:	ca5797b3          	p.extractu	a5,a5,5,5
1c00869a:	f0e794e3          	bne	a5,a4,1c0085a2 <cluster_entry+0x74>
1c00869e:	4785                	li	a5,1
1c0086a0:	1a10b737          	lui	a4,0x1a10b
1c0086a4:	00f72c23          	sw	a5,24(a4) # 1a10b018 <__l1_end+0xa108c0c>
1c0086a8:	478d                	li	a5,3
1c0086aa:	7a179073          	csrw	pcmr,a5
1c0086ae:	b721                	j	1c0085b6 <cluster_entry+0x88>
1c0086b0:	1a10b5b7          	lui	a1,0x1a10b
1c0086b4:	0085a583          	lw	a1,8(a1) # 1a10b008 <__l1_end+0xa108bfc>
1c0086b8:	bf49                	j	1c00864a <cluster_entry+0x11c>
1c0086ba:	1a10b7b7          	lui	a5,0x1a10b
1c0086be:	0007a023          	sw	zero,0(a5) # 1a10b000 <__l1_end+0xa108bf4>
1c0086c2:	4781                	li	a5,0
1c0086c4:	7a179073          	csrw	pcmr,a5
1c0086c8:	b71d                	j	1c0085ee <cluster_entry+0xc0>
1c0086ca:	01032023          	sw	a6,0(t1)
1c0086ce:	85c2                	mv	a1,a6
1c0086d0:	bf91                	j	1c008624 <cluster_entry+0xf6>

1c0086d2 <main>:
1c0086d2:	1101                	addi	sp,sp,-32
1c0086d4:	4681                	li	a3,0
1c0086d6:	4601                	li	a2,0
1c0086d8:	4581                	li	a1,0
1c0086da:	4505                	li	a0,1
1c0086dc:	ce06                	sw	ra,28(sp)
1c0086de:	040010ef          	jal	ra,1c00971e <rt_cluster_mount>
1c0086e2:	1c008637          	lui	a2,0x1c008
1c0086e6:	4881                	li	a7,0
1c0086e8:	4801                	li	a6,0
1c0086ea:	4781                	li	a5,0
1c0086ec:	4701                	li	a4,0
1c0086ee:	4681                	li	a3,0
1c0086f0:	52e60613          	addi	a2,a2,1326 # 1c00852e <cluster_entry>
1c0086f4:	4581                	li	a1,0
1c0086f6:	c002                	sw	zero,0(sp)
1c0086f8:	4501                	li	a0,0
1c0086fa:	78b000ef          	jal	ra,1c009684 <rt_cluster_call>
1c0086fe:	4501                	li	a0,0
1c008700:	4681                	li	a3,0
1c008702:	4601                	li	a2,0
1c008704:	4581                	li	a1,0
1c008706:	018010ef          	jal	ra,1c00971e <rt_cluster_mount>
1c00870a:	40f2                	lw	ra,28(sp)
1c00870c:	4501                	li	a0,0
1c00870e:	6105                	addi	sp,sp,32
1c008710:	8082                	ret

1c008712 <plp_conv_i16>:
1c008712:	f14027f3          	csrr	a5,mhartid
1c008716:	8795                	srai	a5,a5,0x5
1c008718:	03f7f793          	andi	a5,a5,63
1c00871c:	437d                	li	t1,31
1c00871e:	8e32                	mv	t3,a2
1c008720:	8836                	mv	a6,a3
1c008722:	00678963          	beq	a5,t1,1c008734 <plp_conv_i16+0x22>
1c008726:	00d5f663          	bleu	a3,a1,1c008732 <plp_conv_i16+0x20>
1c00872a:	86ae                	mv	a3,a1
1c00872c:	862a                	mv	a2,a0
1c00872e:	85c2                	mv	a1,a6
1c008730:	8572                	mv	a0,t3
1c008732:	ab01                	j	1c008c42 <plp_conv_i16s_xpulpv2>
1c008734:	00d5e363          	bltu	a1,a3,1c00873a <plp_conv_i16+0x28>
1c008738:	a031                	j	1c008744 <plp_conv_i16s_rv32im>
1c00873a:	86ae                	mv	a3,a1
1c00873c:	862a                	mv	a2,a0
1c00873e:	85c2                	mv	a1,a6
1c008740:	8572                	mv	a0,t3
1c008742:	a009                	j	1c008744 <plp_conv_i16s_rv32im>

1c008744 <plp_conv_i16s_rv32im>:
1c008744:	0585                	addi	a1,a1,1
1c008746:	711d                	addi	sp,sp,-96
1c008748:	8d95                	sub	a1,a1,a3
1c00874a:	c6ce                	sw	s3,76(sp)
1c00874c:	de5e                	sw	s7,60(sp)
1c00874e:	ce86                	sw	ra,92(sp)
1c008750:	cca2                	sw	s0,88(sp)
1c008752:	caa6                	sw	s1,84(sp)
1c008754:	c8ca                	sw	s2,80(sp)
1c008756:	c4d2                	sw	s4,72(sp)
1c008758:	c2d6                	sw	s5,68(sp)
1c00875a:	c0da                	sw	s6,64(sp)
1c00875c:	dc62                	sw	s8,56(sp)
1c00875e:	da66                	sw	s9,52(sp)
1c008760:	d86a                	sw	s10,48(sp)
1c008762:	d66e                	sw	s11,44(sp)
1c008764:	fff68993          	addi	s3,a3,-1
1c008768:	c62e                	sw	a1,12(sp)
1c00876a:	8baa                	mv	s7,a0
1c00876c:	3e098463          	beqz	s3,1c008b54 <plp_conv_i16s_rv32im+0x410>
1c008770:	4781                	li	a5,0
1c008772:	00260393          	addi	t2,a2,2
1c008776:	84ba                	mv	s1,a4
1c008778:	85b2                	mv	a1,a2
1c00877a:	8faa                	mv	t6,a0
1c00877c:	4885                	li	a7,1
1c00877e:	4905                	li	s2,1
1c008780:	4a09                	li	s4,2
1c008782:	8e3e                	mv	t3,a5
1c008784:	0038f793          	andi	a5,a7,3
1c008788:	cb95                	beqz	a5,1c0087bc <plp_conv_i16s_rv32im+0x78>
1c00878a:	000f9503          	lh	a0,0(t6)
1c00878e:	00059803          	lh	a6,0(a1)
1c008792:	03050533          	mul	a0,a0,a6
1c008796:	9e2a                	add	t3,t3,a0
1c008798:	03278263          	beq	a5,s2,1c0087bc <plp_conv_i16s_rv32im+0x78>
1c00879c:	002f9503          	lh	a0,2(t6)
1c0087a0:	ffe59803          	lh	a6,-2(a1)
1c0087a4:	03050533          	mul	a0,a0,a6
1c0087a8:	9e2a                	add	t3,t3,a0
1c0087aa:	01478963          	beq	a5,s4,1c0087bc <plp_conv_i16s_rv32im+0x78>
1c0087ae:	004f9783          	lh	a5,4(t6)
1c0087b2:	ffc59583          	lh	a1,-4(a1)
1c0087b6:	02b787b3          	mul	a5,a5,a1
1c0087ba:	9e3e                	add	t3,t3,a5
1c0087bc:	0491                	addi	s1,s1,4
1c0087be:	ffc4ae23          	sw	t3,-4(s1)
1c0087c2:	00188293          	addi	t0,a7,1
1c0087c6:	859e                	mv	a1,t2
1c0087c8:	06568363          	beq	a3,t0,1c00882e <plp_conv_i16s_rv32im+0xea>
1c0087cc:	0022df13          	srli	t5,t0,0x2
1c0087d0:	460f0663          	beqz	t5,1c008c3c <plp_conv_i16s_rv32im+0x4f8>
1c0087d4:	003f1f93          	slli	t6,t5,0x3
1c0087d8:	9fde                	add	t6,t6,s7
1c0087da:	851e                	mv	a0,t2
1c0087dc:	85de                	mv	a1,s7
1c0087de:	4e01                	li	t3,0
1c0087e0:	00051303          	lh	t1,0(a0)
1c0087e4:	00059883          	lh	a7,0(a1)
1c0087e8:	00259803          	lh	a6,2(a1)
1c0087ec:	ffe51a83          	lh	s5,-2(a0)
1c0087f0:	026888b3          	mul	a7,a7,t1
1c0087f4:	00459783          	lh	a5,4(a1)
1c0087f8:	ffc51403          	lh	s0,-4(a0)
1c0087fc:	05a1                	addi	a1,a1,8
1c0087fe:	1561                	addi	a0,a0,-8
1c008800:	ffe59303          	lh	t1,-2(a1)
1c008804:	00251e83          	lh	t4,2(a0)
1c008808:	03580833          	mul	a6,a6,s5
1c00880c:	98f2                	add	a7,a7,t3
1c00880e:	028787b3          	mul	a5,a5,s0
1c008812:	9846                	add	a6,a6,a7
1c008814:	03d308b3          	mul	a7,t1,t4
1c008818:	97c2                	add	a5,a5,a6
1c00881a:	00f88e33          	add	t3,a7,a5
1c00881e:	fdf591e3          	bne	a1,t6,1c0087e0 <plp_conv_i16s_rv32im+0x9c>
1c008822:	0f0e                	slli	t5,t5,0x3
1c008824:	41e385b3          	sub	a1,t2,t5
1c008828:	0389                	addi	t2,t2,2
1c00882a:	8896                	mv	a7,t0
1c00882c:	bfa1                	j	1c008784 <plp_conv_i16s_rv32im+0x40>
1c00882e:	00169a13          	slli	s4,a3,0x1
1c008832:	088a                	slli	a7,a7,0x2
1c008834:	1a79                	addi	s4,s4,-2
1c008836:	478d                	li	a5,3
1c008838:	9746                	add	a4,a4,a7
1c00883a:	9a32                	add	s4,s4,a2
1c00883c:	32d7f063          	bleu	a3,a5,1c008b5c <plp_conv_i16s_rv32im+0x418>
1c008840:	47b2                	lw	a5,12(sp)
1c008842:	8389                	srli	a5,a5,0x2
1c008844:	c83e                	sw	a5,16(sp)
1c008846:	38078063          	beqz	a5,1c008bc6 <plp_conv_i16s_rv32im+0x482>
1c00884a:	0026d613          	srli	a2,a3,0x2
1c00884e:	40c00cb3          	neg	s9,a2
1c008852:	078e                	slli	a5,a5,0x3
1c008854:	97de                	add	a5,a5,s7
1c008856:	0c8e                	slli	s9,s9,0x3
1c008858:	00361c13          	slli	s8,a2,0x3
1c00885c:	ca3e                	sw	a5,20(sp)
1c00885e:	0ca1                	addi	s9,s9,8
1c008860:	0799                	addi	a5,a5,6
1c008862:	9c5e                	add	s8,s8,s7
1c008864:	006b8a93          	addi	s5,s7,6
1c008868:	cc4e                	sw	s3,24(sp)
1c00886a:	ce5e                	sw	s7,28(sp)
1c00886c:	0036fd13          	andi	s10,a3,3
1c008870:	9cd2                	add	s9,s9,s4
1c008872:	8b3a                	mv	s6,a4
1c008874:	89b2                	mv	s3,a2
1c008876:	8bbe                	mv	s7,a5
1c008878:	ffaa9483          	lh	s1,-6(s5)
1c00887c:	ffca9403          	lh	s0,-4(s5)
1c008880:	ffea9383          	lh	t2,-2(s5)
1c008884:	82d6                	mv	t0,s5
1c008886:	894e                	mv	s2,s3
1c008888:	8fd2                	mv	t6,s4
1c00888a:	4801                	li	a6,0
1c00888c:	4e01                	li	t3,0
1c00888e:	4e81                	li	t4,0
1c008890:	4301                	li	t1,0
1c008892:	000f9583          	lh	a1,0(t6)
1c008896:	ffef9603          	lh	a2,-2(t6)
1c00889a:	ffcf9783          	lh	a5,-4(t6)
1c00889e:	02858db3          	mul	s11,a1,s0
1c0088a2:	00029883          	lh	a7,0(t0)
1c0088a6:	02a1                	addi	t0,t0,8
1c0088a8:	1fe1                	addi	t6,t6,-8
1c0088aa:	002f9503          	lh	a0,2(t6)
1c0088ae:	197d                	addi	s2,s2,-1
1c0088b0:	02b48f33          	mul	t5,s1,a1
1c0088b4:	9df6                	add	s11,s11,t4
1c0088b6:	ffa29483          	lh	s1,-6(t0)
1c0088ba:	02758eb3          	mul	t4,a1,t2
1c0088be:	937a                	add	t1,t1,t5
1c0088c0:	02c40f33          	mul	t5,s0,a2
1c0088c4:	9ef2                	add	t4,t4,t3
1c0088c6:	ffc29403          	lh	s0,-4(t0)
1c0088ca:	02f38e33          	mul	t3,t2,a5
1c0088ce:	9f1a                	add	t5,t5,t1
1c0088d0:	031585b3          	mul	a1,a1,a7
1c0088d4:	9f72                	add	t5,t5,t3
1c0088d6:	02c38333          	mul	t1,t2,a2
1c0088da:	95c2                	add	a1,a1,a6
1c0088dc:	ffe29383          	lh	t2,-2(t0)
1c0088e0:	02c88e33          	mul	t3,a7,a2
1c0088e4:	9d9a                	add	s11,s11,t1
1c0088e6:	02960633          	mul	a2,a2,s1
1c0088ea:	9e76                	add	t3,t3,t4
1c0088ec:	962e                	add	a2,a2,a1
1c0088ee:	02f88eb3          	mul	t4,a7,a5
1c0088f2:	02f485b3          	mul	a1,s1,a5
1c0088f6:	9df6                	add	s11,s11,t4
1c0088f8:	028787b3          	mul	a5,a5,s0
1c0088fc:	9e2e                	add	t3,t3,a1
1c0088fe:	02a888b3          	mul	a7,a7,a0
1c008902:	97b2                	add	a5,a5,a2
1c008904:	02a48eb3          	mul	t4,s1,a0
1c008908:	01e88333          	add	t1,a7,t5
1c00890c:	02a40633          	mul	a2,s0,a0
1c008910:	9eee                	add	t4,t4,s11
1c008912:	02750533          	mul	a0,a0,t2
1c008916:	9e32                	add	t3,t3,a2
1c008918:	00f50833          	add	a6,a0,a5
1c00891c:	f6091be3          	bnez	s2,1c008892 <plp_conv_i16s_rv32im+0x14e>
1c008920:	060d0863          	beqz	s10,1c008990 <plp_conv_i16s_rv32im+0x24c>
1c008924:	ff8c9783          	lh	a5,-8(s9)
1c008928:	006c1603          	lh	a2,6(s8)
1c00892c:	02f385b3          	mul	a1,t2,a5
1c008930:	02f484b3          	mul	s1,s1,a5
1c008934:	9e2e                	add	t3,t3,a1
1c008936:	4585                	li	a1,1
1c008938:	02f40533          	mul	a0,s0,a5
1c00893c:	9326                	add	t1,t1,s1
1c00893e:	02c787b3          	mul	a5,a5,a2
1c008942:	9eaa                	add	t4,t4,a0
1c008944:	983e                	add	a6,a6,a5
1c008946:	04bd0563          	beq	s10,a1,1c008990 <plp_conv_i16s_rv32im+0x24c>
1c00894a:	ff6c9783          	lh	a5,-10(s9)
1c00894e:	008c1583          	lh	a1,8(s8)
1c008952:	02f40433          	mul	s0,s0,a5
1c008956:	02f388b3          	mul	a7,t2,a5
1c00895a:	9322                	add	t1,t1,s0
1c00895c:	02f60533          	mul	a0,a2,a5
1c008960:	9ec6                	add	t4,t4,a7
1c008962:	02b787b3          	mul	a5,a5,a1
1c008966:	9e2a                	add	t3,t3,a0
1c008968:	983e                	add	a6,a6,a5
1c00896a:	4789                	li	a5,2
1c00896c:	02fd0263          	beq	s10,a5,1c008990 <plp_conv_i16s_rv32im+0x24c>
1c008970:	ff4c9783          	lh	a5,-12(s9)
1c008974:	00ac1503          	lh	a0,10(s8)
1c008978:	02f383b3          	mul	t2,t2,a5
1c00897c:	02f60633          	mul	a2,a2,a5
1c008980:	931e                	add	t1,t1,t2
1c008982:	02f585b3          	mul	a1,a1,a5
1c008986:	9eb2                	add	t4,t4,a2
1c008988:	02f507b3          	mul	a5,a0,a5
1c00898c:	9e2e                	add	t3,t3,a1
1c00898e:	983e                	add	a6,a6,a5
1c008990:	006b2023          	sw	t1,0(s6)
1c008994:	01db2223          	sw	t4,4(s6)
1c008998:	01cb2423          	sw	t3,8(s6)
1c00899c:	0b41                	addi	s6,s6,16
1c00899e:	ff0b2e23          	sw	a6,-4(s6)
1c0089a2:	0aa1                	addi	s5,s5,8
1c0089a4:	0c21                	addi	s8,s8,8
1c0089a6:	ed5b99e3          	bne	s7,s5,1c008878 <plp_conv_i16s_rv32im+0x134>
1c0089aa:	45c2                	lw	a1,16(sp)
1c0089ac:	49e2                	lw	s3,24(sp)
1c0089ae:	4bf2                	lw	s7,28(sp)
1c0089b0:	43d2                	lw	t2,20(sp)
1c0089b2:	00459793          	slli	a5,a1,0x4
1c0089b6:	058a                	slli	a1,a1,0x2
1c0089b8:	973e                	add	a4,a4,a5
1c0089ba:	c82e                	sw	a1,16(sp)
1c0089bc:	4632                	lw	a2,12(sp)
1c0089be:	88ba                	mv	a7,a4
1c0089c0:	00367793          	andi	a5,a2,3
1c0089c4:	cfd5                	beqz	a5,1c008a80 <plp_conv_i16s_rv32im+0x33c>
1c0089c6:	45c2                	lw	a1,16(sp)
1c0089c8:	0026d913          	srli	s2,a3,0x2
1c0089cc:	41200433          	neg	s0,s2
1c0089d0:	00158293          	addi	t0,a1,1
1c0089d4:	040e                	slli	s0,s0,0x3
1c0089d6:	0286                	slli	t0,t0,0x1
1c0089d8:	078a                	slli	a5,a5,0x2
1c0089da:	00391493          	slli	s1,s2,0x3
1c0089de:	0421                	addi	s0,s0,8
1c0089e0:	8a8d                	andi	a3,a3,3
1c0089e2:	92de                	add	t0,t0,s7
1c0089e4:	00f708b3          	add	a7,a4,a5
1c0089e8:	14e1                	addi	s1,s1,-8
1c0089ea:	9452                	add	s0,s0,s4
1c0089ec:	4a85                	li	s5,1
1c0089ee:	4b09                	li	s6,2
1c0089f0:	8e4a                	mv	t3,s2
1c0089f2:	8652                	mv	a2,s4
1c0089f4:	879e                	mv	a5,t2
1c0089f6:	4e81                	li	t4,0
1c0089f8:	00061303          	lh	t1,0(a2)
1c0089fc:	00079803          	lh	a6,0(a5)
1c008a00:	00279503          	lh	a0,2(a5)
1c008a04:	ffe61c03          	lh	s8,-2(a2)
1c008a08:	02680833          	mul	a6,a6,t1
1c008a0c:	00479583          	lh	a1,4(a5)
1c008a10:	ffc61f83          	lh	t6,-4(a2)
1c008a14:	07a1                	addi	a5,a5,8
1c008a16:	1661                	addi	a2,a2,-8
1c008a18:	ffe79303          	lh	t1,-2(a5)
1c008a1c:	00261f03          	lh	t5,2(a2)
1c008a20:	1e7d                	addi	t3,t3,-1
1c008a22:	03850533          	mul	a0,a0,s8
1c008a26:	9876                	add	a6,a6,t4
1c008a28:	03f585b3          	mul	a1,a1,t6
1c008a2c:	9542                	add	a0,a0,a6
1c008a2e:	03e30833          	mul	a6,t1,t5
1c008a32:	95aa                	add	a1,a1,a0
1c008a34:	00b80eb3          	add	t4,a6,a1
1c008a38:	fc0e10e3          	bnez	t3,1c0089f8 <plp_conv_i16s_rv32im+0x2b4>
1c008a3c:	93a6                	add	t2,t2,s1
1c008a3e:	ca95                	beqz	a3,1c008a72 <plp_conv_i16s_rv32im+0x32e>
1c008a40:	00839783          	lh	a5,8(t2)
1c008a44:	ff841603          	lh	a2,-8(s0)
1c008a48:	02c787b3          	mul	a5,a5,a2
1c008a4c:	9ebe                	add	t4,t4,a5
1c008a4e:	03568263          	beq	a3,s5,1c008a72 <plp_conv_i16s_rv32im+0x32e>
1c008a52:	00a39783          	lh	a5,10(t2)
1c008a56:	ff641603          	lh	a2,-10(s0)
1c008a5a:	02c787b3          	mul	a5,a5,a2
1c008a5e:	9ebe                	add	t4,t4,a5
1c008a60:	01668963          	beq	a3,s6,1c008a72 <plp_conv_i16s_rv32im+0x32e>
1c008a64:	00c39783          	lh	a5,12(t2)
1c008a68:	ff441603          	lh	a2,-12(s0)
1c008a6c:	02c787b3          	mul	a5,a5,a2
1c008a70:	9ebe                	add	t4,t4,a5
1c008a72:	0711                	addi	a4,a4,4
1c008a74:	ffd72e23          	sw	t4,-4(a4)
1c008a78:	8396                	mv	t2,t0
1c008a7a:	0289                	addi	t0,t0,2
1c008a7c:	f7171ae3          	bne	a4,a7,1c0089f0 <plp_conv_i16s_rv32im+0x2ac>
1c008a80:	4732                	lw	a4,12(sp)
1c008a82:	00171793          	slli	a5,a4,0x1
1c008a86:	9bbe                	add	s7,s7,a5
1c008a88:	0a098763          	beqz	s3,1c008b36 <plp_conv_i16s_rv32im+0x3f2>
1c008a8c:	4385                	li	t2,1
1c008a8e:	4409                	li	s0,2
1c008a90:	0029df93          	srli	t6,s3,0x2
1c008a94:	120f8363          	beqz	t6,1c008bba <plp_conv_i16s_rv32im+0x476>
1c008a98:	887e                	mv	a6,t6
1c008a9a:	8752                	mv	a4,s4
1c008a9c:	87de                	mv	a5,s7
1c008a9e:	4301                	li	t1,0
1c008aa0:	00071503          	lh	a0,0(a4)
1c008aa4:	00079583          	lh	a1,0(a5)
1c008aa8:	00279603          	lh	a2,2(a5)
1c008aac:	ffe71f03          	lh	t5,-2(a4)
1c008ab0:	02a585b3          	mul	a1,a1,a0
1c008ab4:	00479683          	lh	a3,4(a5)
1c008ab8:	ffc71e83          	lh	t4,-4(a4)
1c008abc:	07a1                	addi	a5,a5,8
1c008abe:	1761                	addi	a4,a4,-8
1c008ac0:	ffe79503          	lh	a0,-2(a5)
1c008ac4:	00271e03          	lh	t3,2(a4)
1c008ac8:	187d                	addi	a6,a6,-1
1c008aca:	03e60633          	mul	a2,a2,t5
1c008ace:	959a                	add	a1,a1,t1
1c008ad0:	03d686b3          	mul	a3,a3,t4
1c008ad4:	962e                	add	a2,a2,a1
1c008ad6:	03c505b3          	mul	a1,a0,t3
1c008ada:	96b2                	add	a3,a3,a2
1c008adc:	00d58333          	add	t1,a1,a3
1c008ae0:	fc0810e3          	bnez	a6,1c008aa0 <plp_conv_i16s_rv32im+0x35c>
1c008ae4:	003f9793          	slli	a5,t6,0x3
1c008ae8:	8fbe                	mv	t6,a5
1c008aea:	41fa0fb3          	sub	t6,s4,t6
1c008aee:	97de                	add	a5,a5,s7
1c008af0:	0039f713          	andi	a4,s3,3
1c008af4:	cb15                	beqz	a4,1c008b28 <plp_conv_i16s_rv32im+0x3e4>
1c008af6:	00079683          	lh	a3,0(a5)
1c008afa:	000f9603          	lh	a2,0(t6)
1c008afe:	02c686b3          	mul	a3,a3,a2
1c008b02:	9336                	add	t1,t1,a3
1c008b04:	02770263          	beq	a4,t2,1c008b28 <plp_conv_i16s_rv32im+0x3e4>
1c008b08:	ffef9683          	lh	a3,-2(t6)
1c008b0c:	00279603          	lh	a2,2(a5)
1c008b10:	02c686b3          	mul	a3,a3,a2
1c008b14:	9336                	add	t1,t1,a3
1c008b16:	00870963          	beq	a4,s0,1c008b28 <plp_conv_i16s_rv32im+0x3e4>
1c008b1a:	00479783          	lh	a5,4(a5)
1c008b1e:	ffcf9703          	lh	a4,-4(t6)
1c008b22:	02e787b3          	mul	a5,a5,a4
1c008b26:	933e                	add	t1,t1,a5
1c008b28:	0891                	addi	a7,a7,4
1c008b2a:	fe68ae23          	sw	t1,-4(a7)
1c008b2e:	19fd                	addi	s3,s3,-1
1c008b30:	0b89                	addi	s7,s7,2
1c008b32:	f4099fe3          	bnez	s3,1c008a90 <plp_conv_i16s_rv32im+0x34c>
1c008b36:	40f6                	lw	ra,92(sp)
1c008b38:	4466                	lw	s0,88(sp)
1c008b3a:	44d6                	lw	s1,84(sp)
1c008b3c:	4946                	lw	s2,80(sp)
1c008b3e:	49b6                	lw	s3,76(sp)
1c008b40:	4a26                	lw	s4,72(sp)
1c008b42:	4a96                	lw	s5,68(sp)
1c008b44:	4b06                	lw	s6,64(sp)
1c008b46:	5bf2                	lw	s7,60(sp)
1c008b48:	5c62                	lw	s8,56(sp)
1c008b4a:	5cd2                	lw	s9,52(sp)
1c008b4c:	5d42                	lw	s10,48(sp)
1c008b4e:	5db2                	lw	s11,44(sp)
1c008b50:	6125                	addi	sp,sp,96
1c008b52:	8082                	ret
1c008b54:	00169a13          	slli	s4,a3,0x1
1c008b58:	1a79                	addi	s4,s4,-2
1c008b5a:	9a32                	add	s4,s4,a2
1c008b5c:	47b2                	lw	a5,12(sp)
1c008b5e:	c3b5                	beqz	a5,1c008bc2 <plp_conv_i16s_rv32im+0x47e>
1c008b60:	c2c5                	beqz	a3,1c008c00 <plp_conv_i16s_rv32im+0x4bc>
1c008b62:	0a098d63          	beqz	s3,1c008c1c <plp_conv_i16s_rv32im+0x4d8>
1c008b66:	4789                	li	a5,2
1c008b68:	06f68163          	beq	a3,a5,1c008bca <plp_conv_i16s_rv32im+0x486>
1c008b6c:	47b2                	lw	a5,12(sp)
1c008b6e:	000a1e03          	lh	t3,0(s4)
1c008b72:	ffea1303          	lh	t1,-2(s4)
1c008b76:	ffca1883          	lh	a7,-4(s4)
1c008b7a:	00179f13          	slli	t5,a5,0x1
1c008b7e:	01eb8eb3          	add	t4,s7,t5
1c008b82:	855e                	mv	a0,s7
1c008b84:	883a                	mv	a6,a4
1c008b86:	00051683          	lh	a3,0(a0)
1c008b8a:	00251603          	lh	a2,2(a0)
1c008b8e:	00451783          	lh	a5,4(a0)
1c008b92:	03c686b3          	mul	a3,a3,t3
1c008b96:	0811                	addi	a6,a6,4
1c008b98:	0509                	addi	a0,a0,2
1c008b9a:	02660633          	mul	a2,a2,t1
1c008b9e:	031787b3          	mul	a5,a5,a7
1c008ba2:	96b2                	add	a3,a3,a2
1c008ba4:	97b6                	add	a5,a5,a3
1c008ba6:	fef82e23          	sw	a5,-4(a6)
1c008baa:	fdd51ee3          	bne	a0,t4,1c008b86 <plp_conv_i16s_rv32im+0x442>
1c008bae:	47b2                	lw	a5,12(sp)
1c008bb0:	9bfa                	add	s7,s7,t5
1c008bb2:	00279893          	slli	a7,a5,0x2
1c008bb6:	98ba                	add	a7,a7,a4
1c008bb8:	bdd1                	j	1c008a8c <plp_conv_i16s_rv32im+0x348>
1c008bba:	8fd2                	mv	t6,s4
1c008bbc:	87de                	mv	a5,s7
1c008bbe:	4301                	li	t1,0
1c008bc0:	bf05                	j	1c008af0 <plp_conv_i16s_rv32im+0x3ac>
1c008bc2:	88ba                	mv	a7,a4
1c008bc4:	bd75                	j	1c008a80 <plp_conv_i16s_rv32im+0x33c>
1c008bc6:	83de                	mv	t2,s7
1c008bc8:	bbd5                	j	1c0089bc <plp_conv_i16s_rv32im+0x278>
1c008bca:	47b2                	lw	a5,12(sp)
1c008bcc:	000a1883          	lh	a7,0(s4)
1c008bd0:	ffea1803          	lh	a6,-2(s4)
1c008bd4:	00179f13          	slli	t5,a5,0x1
1c008bd8:	01eb8533          	add	a0,s7,t5
1c008bdc:	865e                	mv	a2,s7
1c008bde:	85ba                	mv	a1,a4
1c008be0:	00261783          	lh	a5,2(a2)
1c008be4:	00061683          	lh	a3,0(a2)
1c008be8:	0591                	addi	a1,a1,4
1c008bea:	030787b3          	mul	a5,a5,a6
1c008bee:	0609                	addi	a2,a2,2
1c008bf0:	031686b3          	mul	a3,a3,a7
1c008bf4:	97b6                	add	a5,a5,a3
1c008bf6:	fef5ae23          	sw	a5,-4(a1)
1c008bfa:	fea613e3          	bne	a2,a0,1c008be0 <plp_conv_i16s_rv32im+0x49c>
1c008bfe:	bf45                	j	1c008bae <plp_conv_i16s_rv32im+0x46a>
1c008c00:	00279413          	slli	s0,a5,0x2
1c008c04:	853a                	mv	a0,a4
1c008c06:	8622                	mv	a2,s0
1c008c08:	4581                	li	a1,0
1c008c0a:	0da020ef          	jal	ra,1c00ace4 <memset>
1c008c0e:	4732                	lw	a4,12(sp)
1c008c10:	008508b3          	add	a7,a0,s0
1c008c14:	00171f13          	slli	t5,a4,0x1
1c008c18:	9bfa                	add	s7,s7,t5
1c008c1a:	bd8d                	j	1c008a8c <plp_conv_i16s_rv32im+0x348>
1c008c1c:	000a1603          	lh	a2,0(s4)
1c008c20:	00179693          	slli	a3,a5,0x1
1c008c24:	96de                	add	a3,a3,s7
1c008c26:	000b9783          	lh	a5,0(s7)
1c008c2a:	0711                	addi	a4,a4,4
1c008c2c:	0b89                	addi	s7,s7,2
1c008c2e:	02c787b3          	mul	a5,a5,a2
1c008c32:	fef72e23          	sw	a5,-4(a4)
1c008c36:	fedb98e3          	bne	s7,a3,1c008c26 <plp_conv_i16s_rv32im+0x4e2>
1c008c3a:	bdf5                	j	1c008b36 <plp_conv_i16s_rv32im+0x3f2>
1c008c3c:	8fde                	mv	t6,s7
1c008c3e:	4e01                	li	t3,0
1c008c40:	b6e5                	j	1c008828 <plp_conv_i16s_rv32im+0xe4>

1c008c42 <plp_conv_i16s_xpulpv2>:
1c008c42:	0585                	addi	a1,a1,1
1c008c44:	715d                	addi	sp,sp,-80
1c008c46:	8d95                	sub	a1,a1,a3
1c008c48:	c0ca                	sw	s2,64(sp)
1c008c4a:	d85a                	sw	s6,48(sp)
1c008c4c:	c686                	sw	ra,76(sp)
1c008c4e:	c4a2                	sw	s0,72(sp)
1c008c50:	c2a6                	sw	s1,68(sp)
1c008c52:	de4e                	sw	s3,60(sp)
1c008c54:	dc52                	sw	s4,56(sp)
1c008c56:	da56                	sw	s5,52(sp)
1c008c58:	d65e                	sw	s7,44(sp)
1c008c5a:	d462                	sw	s8,40(sp)
1c008c5c:	d266                	sw	s9,36(sp)
1c008c5e:	d06a                	sw	s10,32(sp)
1c008c60:	ce6e                	sw	s11,28(sp)
1c008c62:	fff68913          	addi	s2,a3,-1
1c008c66:	c42e                	sw	a1,8(sp)
1c008c68:	8b2a                	mv	s6,a0
1c008c6a:	36090563          	beqz	s2,1c008fd4 <plp_conv_i16s_xpulpv2+0x392>
1c008c6e:	8faa                	mv	t6,a0
1c008c70:	00260293          	addi	t0,a2,2
1c008c74:	84ba                	mv	s1,a4
1c008c76:	87b2                	mv	a5,a2
1c008c78:	4585                	li	a1,1
1c008c7a:	4501                	li	a0,0
1c008c7c:	fa25b833          	p.bclr	a6,a1,29,2
1c008c80:	02080863          	beqz	a6,1c008cb0 <plp_conv_i16s_xpulpv2+0x6e>
1c008c84:	000f9303          	lh	t1,0(t6)
1c008c88:	00079883          	lh	a7,0(a5)
1c008c8c:	43130533          	p.mac	a0,t1,a7
1c008c90:	02182063          	p.beqimm	a6,1,1c008cb0 <plp_conv_i16s_xpulpv2+0x6e>
1c008c94:	002f9303          	lh	t1,2(t6)
1c008c98:	ffe79883          	lh	a7,-2(a5)
1c008c9c:	43130533          	p.mac	a0,t1,a7
1c008ca0:	00282863          	p.beqimm	a6,2,1c008cb0 <plp_conv_i16s_xpulpv2+0x6e>
1c008ca4:	004f9803          	lh	a6,4(t6)
1c008ca8:	ffc79783          	lh	a5,-4(a5)
1c008cac:	42f80533          	p.mac	a0,a6,a5
1c008cb0:	00a4a22b          	p.sw	a0,4(s1!)
1c008cb4:	00158413          	addi	s0,a1,1
1c008cb8:	8796                	mv	a5,t0
1c008cba:	04868c63          	beq	a3,s0,1c008d12 <plp_conv_i16s_xpulpv2+0xd0>
1c008cbe:	00245393          	srli	t2,s0,0x2
1c008cc2:	3e038463          	beqz	t2,1c0090aa <plp_conv_i16s_xpulpv2+0x468>
1c008cc6:	00339813          	slli	a6,t2,0x3
1c008cca:	1861                	addi	a6,a6,-8
1c008ccc:	00385813          	srli	a6,a6,0x3
1c008cd0:	ffa28f13          	addi	t5,t0,-6
1c008cd4:	ffe28e93          	addi	t4,t0,-2
1c008cd8:	004b0e13          	addi	t3,s6,4
1c008cdc:	8fda                	mv	t6,s6
1c008cde:	4501                	li	a0,0
1c008ce0:	0805                	addi	a6,a6,1
1c008ce2:	010840fb          	lp.setup	x1,a6,1c008d02 <plp_conv_i16s_xpulpv2+0xc0>
1c008ce6:	ff8ea58b          	p.lw	a1,-8(t4!)
1c008cea:	ff8f278b          	p.lw	a5,-8(t5!)
1c008cee:	008fa30b          	p.lw	t1,8(t6!)
1c008cf2:	008e288b          	p.lw	a7,8(t3!)
1c008cf6:	c205e5d7          	pv.shuffle.sci.h	a1,a1,1
1c008cfa:	b8b30557          	pv.sdotsp.h	a0,t1,a1
1c008cfe:	c207e7d7          	pv.shuffle.sci.h	a5,a5,1
1c008d02:	b8f88557          	pv.sdotsp.h	a0,a7,a5
1c008d06:	038e                	slli	t2,t2,0x3
1c008d08:	407287b3          	sub	a5,t0,t2
1c008d0c:	0289                	addi	t0,t0,2
1c008d0e:	85a2                	mv	a1,s0
1c008d10:	b7b5                	j	1c008c7c <plp_conv_i16s_xpulpv2+0x3a>
1c008d12:	00169993          	slli	s3,a3,0x1
1c008d16:	058a                	slli	a1,a1,0x2
1c008d18:	19f9                	addi	s3,s3,-2
1c008d1a:	478d                	li	a5,3
1c008d1c:	972e                	add	a4,a4,a1
1c008d1e:	99b2                	add	s3,s3,a2
1c008d20:	2ad7fe63          	bleu	a3,a5,1c008fdc <plp_conv_i16s_xpulpv2+0x39a>
1c008d24:	47a2                	lw	a5,8(sp)
1c008d26:	8389                	srli	a5,a5,0x2
1c008d28:	c63e                	sw	a5,12(sp)
1c008d2a:	30078863          	beqz	a5,1c00903a <plp_conv_i16s_xpulpv2+0x3f8>
1c008d2e:	0026d613          	srli	a2,a3,0x2
1c008d32:	c032                	sw	a2,0(sp)
1c008d34:	8bbe                	mv	s7,a5
1c008d36:	40c007b3          	neg	a5,a2
1c008d3a:	1c000637          	lui	a2,0x1c000
1c008d3e:	48462403          	lw	s0,1156(a2) # 1c000484 <__DTOR_END__+0x198>
1c008d42:	4602                	lw	a2,0(sp)
1c008d44:	078e                	slli	a5,a5,0x3
1c008d46:	c23e                	sw	a5,4(sp)
1c008d48:	00361a13          	slli	s4,a2,0x3
1c008d4c:	fa26bc33          	p.bclr	s8,a3,29,2
1c008d50:	9a5a                	add	s4,s4,s6
1c008d52:	00f98cb3          	add	s9,s3,a5
1c008d56:	8aba                	mv	s5,a4
1c008d58:	ffa98d13          	addi	s10,s3,-6
1c008d5c:	087bc07b          	lp.setup	x0,s7,1c008e6a <plp_conv_i16s_xpulpv2+0x228>
1c008d60:	4792                	lw	a5,4(sp)
1c008d62:	4282                	lw	t0,0(sp)
1c008d64:	83ea                	mv	t2,s10
1c008d66:	00fa0533          	add	a0,s4,a5
1c008d6a:	4301                	li	t1,0
1c008d6c:	4e01                	li	t3,0
1c008d6e:	4f01                	li	t5,0
1c008d70:	4f81                	li	t6,0
1c008d72:	0272c0fb          	lp.setup	x1,t0,1c008dc0 <plp_conv_i16s_xpulpv2+0x17e>
1c008d76:	414c                	lw	a1,4(a0)
1c008d78:	00852803          	lw	a6,8(a0)
1c008d7c:	4544                	lw	s1,12(a0)
1c008d7e:	00852e8b          	p.lw	t4,8(a0!)
1c008d82:	0043a603          	lw	a2,4(t2)
1c008d86:	88ae                	mv	a7,a1
1c008d88:	ff83a78b          	p.lw	a5,-8(t2!)
1c008d8c:	8df6                	mv	s11,t4
1c008d8e:	c2066657          	pv.shuffle.sci.h	a2,a2,1
1c008d92:	c88808d7          	pv.shuffle2.h	a7,a6,s0
1c008d96:	c8858dd7          	pv.shuffle2.h	s11,a1,s0
1c008d9a:	b8ce8fd7          	pv.sdotsp.h	t6,t4,a2
1c008d9e:	b8cd8f57          	pv.sdotsp.h	t5,s11,a2
1c008da2:	b8c58e57          	pv.sdotsp.h	t3,a1,a2
1c008da6:	b8c88357          	pv.sdotsp.h	t1,a7,a2
1c008daa:	8642                	mv	a2,a6
1c008dac:	c207e7d7          	pv.shuffle.sci.h	a5,a5,1
1c008db0:	c8848657          	pv.shuffle2.h	a2,s1,s0
1c008db4:	b8f58fd7          	pv.sdotsp.h	t6,a1,a5
1c008db8:	b8f88f57          	pv.sdotsp.h	t5,a7,a5
1c008dbc:	b8f80e57          	pv.sdotsp.h	t3,a6,a5
1c008dc0:	b8f60357          	pv.sdotsp.h	t1,a2,a5
1c008dc4:	080c0a63          	beqz	s8,1c008e58 <plp_conv_i16s_xpulpv2+0x216>
1c008dc8:	000a2783          	lw	a5,0(s4)
1c008dcc:	000c9583          	lh	a1,0(s9)
1c008dd0:	004a2603          	lw	a2,4(s4)
1c008dd4:	7807e557          	pv.extract.h	a0,a5,0
1c008dd8:	7a07e7d7          	pv.extract.h	a5,a5,1
1c008ddc:	80b5055b          	p.muls	a0,a0,a1
1c008de0:	78066857          	pv.extract.h	a6,a2,0
1c008de4:	7a066657          	pv.extract.h	a2,a2,1
1c008de8:	80b787db          	p.muls	a5,a5,a1
1c008dec:	9faa                	add	t6,t6,a0
1c008dee:	9f3e                	add	t5,t5,a5
1c008df0:	43058e33          	p.mac	t3,a1,a6
1c008df4:	42c58333          	p.mac	t1,a1,a2
1c008df8:	061c2063          	p.beqimm	s8,1,1c008e58 <plp_conv_i16s_xpulpv2+0x216>
1c008dfc:	002a2783          	lw	a5,2(s4)
1c008e00:	ffec9883          	lh	a7,-2(s9)
1c008e04:	006a2583          	lw	a1,6(s4)
1c008e08:	7a07e2d7          	pv.extract.h	t0,a5,1
1c008e0c:	7807eed7          	pv.extract.h	t4,a5,0
1c008e10:	7805e557          	pv.extract.h	a0,a1,0
1c008e14:	7a05e5d7          	pv.extract.h	a1,a1,1
1c008e18:	811287db          	p.muls	a5,t0,a7
1c008e1c:	811e8edb          	p.muls	t4,t4,a7
1c008e20:	9f3e                	add	t5,t5,a5
1c008e22:	8115055b          	p.muls	a0,a0,a7
1c008e26:	9ff6                	add	t6,t6,t4
1c008e28:	811587db          	p.muls	a5,a1,a7
1c008e2c:	9e2a                	add	t3,t3,a0
1c008e2e:	933e                	add	t1,t1,a5
1c008e30:	022c2463          	p.beqimm	s8,2,1c008e58 <plp_conv_i16s_xpulpv2+0x216>
1c008e34:	008a2783          	lw	a5,8(s4)
1c008e38:	ffcc9583          	lh	a1,-4(s9)
1c008e3c:	7807e557          	pv.extract.h	a0,a5,0
1c008e40:	7a07e7d7          	pv.extract.h	a5,a5,1
1c008e44:	80b5055b          	p.muls	a0,a0,a1
1c008e48:	80b787db          	p.muls	a5,a5,a1
1c008e4c:	9e2a                	add	t3,t3,a0
1c008e4e:	42b80fb3          	p.mac	t6,a6,a1
1c008e52:	933e                	add	t1,t1,a5
1c008e54:	42b60f33          	p.mac	t5,a2,a1
1c008e58:	01faa023          	sw	t6,0(s5)
1c008e5c:	01eaa223          	sw	t5,4(s5)
1c008e60:	01caa423          	sw	t3,8(s5)
1c008e64:	0ac1                	addi	s5,s5,16
1c008e66:	fe6aae23          	sw	t1,-4(s5)
1c008e6a:	0a21                	addi	s4,s4,8
1c008e6c:	4632                	lw	a2,12(sp)
1c008e6e:	00461793          	slli	a5,a2,0x4
1c008e72:	00361f93          	slli	t6,a2,0x3
1c008e76:	060a                	slli	a2,a2,0x2
1c008e78:	973e                	add	a4,a4,a5
1c008e7a:	9fda                	add	t6,t6,s6
1c008e7c:	c632                	sw	a2,12(sp)
1c008e7e:	4622                	lw	a2,8(sp)
1c008e80:	fa2637b3          	p.bclr	a5,a2,29,2
1c008e84:	cfd1                	beqz	a5,1c008f20 <plp_conv_i16s_xpulpv2+0x2de>
1c008e86:	4632                	lw	a2,12(sp)
1c008e88:	0026d413          	srli	s0,a3,0x2
1c008e8c:	078a                	slli	a5,a5,0x2
1c008e8e:	00160293          	addi	t0,a2,1
1c008e92:	0286                	slli	t0,t0,0x1
1c008e94:	00341493          	slli	s1,s0,0x3
1c008e98:	fa26b6b3          	p.bclr	a3,a3,29,2
1c008e9c:	92da                	add	t0,t0,s6
1c008e9e:	00f703b3          	add	t2,a4,a5
1c008ea2:	409984b3          	sub	s1,s3,s1
1c008ea6:	00341a93          	slli	s5,s0,0x3
1c008eaa:	ffa98d13          	addi	s10,s3,-6
1c008eae:	ffe98a13          	addi	s4,s3,-2
1c008eb2:	8f6a                	mv	t5,s10
1c008eb4:	8ed2                	mv	t4,s4
1c008eb6:	004f8e13          	addi	t3,t6,4
1c008eba:	837e                	mv	t1,t6
1c008ebc:	4581                	li	a1,0
1c008ebe:	8522                	mv	a0,s0
1c008ec0:	010540fb          	lp.setup	x1,a0,1c008ee0 <plp_conv_i16s_xpulpv2+0x29e>
1c008ec4:	ff8ea60b          	p.lw	a2,-8(t4!)
1c008ec8:	ff8f278b          	p.lw	a5,-8(t5!)
1c008ecc:	0083288b          	p.lw	a7,8(t1!)
1c008ed0:	008e280b          	p.lw	a6,8(t3!)
1c008ed4:	c2066657          	pv.shuffle.sci.h	a2,a2,1
1c008ed8:	b8c885d7          	pv.sdotsp.h	a1,a7,a2
1c008edc:	c207e7d7          	pv.shuffle.sci.h	a5,a5,1
1c008ee0:	b8f805d7          	pv.sdotsp.h	a1,a6,a5
1c008ee4:	9fd6                	add	t6,t6,s5
1c008ee6:	c69d                	beqz	a3,1c008f14 <plp_conv_i16s_xpulpv2+0x2d2>
1c008ee8:	000f9603          	lh	a2,0(t6)
1c008eec:	00049783          	lh	a5,0(s1)
1c008ef0:	42f605b3          	p.mac	a1,a2,a5
1c008ef4:	0216a063          	p.beqimm	a3,1,1c008f14 <plp_conv_i16s_xpulpv2+0x2d2>
1c008ef8:	002f9603          	lh	a2,2(t6)
1c008efc:	ffe49783          	lh	a5,-2(s1)
1c008f00:	42f605b3          	p.mac	a1,a2,a5
1c008f04:	0026a863          	p.beqimm	a3,2,1c008f14 <plp_conv_i16s_xpulpv2+0x2d2>
1c008f08:	004f9603          	lh	a2,4(t6)
1c008f0c:	ffc49783          	lh	a5,-4(s1)
1c008f10:	42f605b3          	p.mac	a1,a2,a5
1c008f14:	00b7222b          	p.sw	a1,4(a4!)
1c008f18:	8f96                	mv	t6,t0
1c008f1a:	0289                	addi	t0,t0,2
1c008f1c:	f8e39be3          	bne	t2,a4,1c008eb2 <plp_conv_i16s_xpulpv2+0x270>
1c008f20:	46a2                	lw	a3,8(sp)
1c008f22:	00169793          	slli	a5,a3,0x1
1c008f26:	9b3e                	add	s6,s6,a5
1c008f28:	08090763          	beqz	s2,1c008fb6 <plp_conv_i16s_xpulpv2+0x374>
1c008f2c:	8fca                	mv	t6,s2
1c008f2e:	043fc07b          	lp.setup	x0,t6,1c008fb4 <plp_conv_i16s_xpulpv2+0x372>
1c008f32:	00295f13          	srli	t5,s2,0x2
1c008f36:	0e0f0e63          	beqz	t5,1c009032 <plp_conv_i16s_xpulpv2+0x3f0>
1c008f3a:	ffa98e93          	addi	t4,s3,-6
1c008f3e:	ffe98e13          	addi	t3,s3,-2
1c008f42:	004b0313          	addi	t1,s6,4
1c008f46:	88da                	mv	a7,s6
1c008f48:	4601                	li	a2,0
1c008f4a:	85fa                	mv	a1,t5
1c008f4c:	0105c0fb          	lp.setup	x1,a1,1c008f6c <plp_conv_i16s_xpulpv2+0x32a>
1c008f50:	ff8e268b          	p.lw	a3,-8(t3!)
1c008f54:	ff8ea78b          	p.lw	a5,-8(t4!)
1c008f58:	0088a80b          	p.lw	a6,8(a7!)
1c008f5c:	0083250b          	p.lw	a0,8(t1!)
1c008f60:	c206e6d7          	pv.shuffle.sci.h	a3,a3,1
1c008f64:	b8d80657          	pv.sdotsp.h	a2,a6,a3
1c008f68:	c207e7d7          	pv.shuffle.sci.h	a5,a5,1
1c008f6c:	b8f50657          	pv.sdotsp.h	a2,a0,a5
1c008f70:	003f1793          	slli	a5,t5,0x3
1c008f74:	8f3e                	mv	t5,a5
1c008f76:	41e98f33          	sub	t5,s3,t5
1c008f7a:	97da                	add	a5,a5,s6
1c008f7c:	fa2936b3          	p.bclr	a3,s2,29,2
1c008f80:	c69d                	beqz	a3,1c008fae <plp_conv_i16s_xpulpv2+0x36c>
1c008f82:	00079503          	lh	a0,0(a5)
1c008f86:	000f1583          	lh	a1,0(t5)
1c008f8a:	42b50633          	p.mac	a2,a0,a1
1c008f8e:	0216a063          	p.beqimm	a3,1,1c008fae <plp_conv_i16s_xpulpv2+0x36c>
1c008f92:	00279503          	lh	a0,2(a5)
1c008f96:	ffef1583          	lh	a1,-2(t5)
1c008f9a:	42b50633          	p.mac	a2,a0,a1
1c008f9e:	0026a863          	p.beqimm	a3,2,1c008fae <plp_conv_i16s_xpulpv2+0x36c>
1c008fa2:	00479683          	lh	a3,4(a5)
1c008fa6:	ffcf1783          	lh	a5,-4(t5)
1c008faa:	42f68633          	p.mac	a2,a3,a5
1c008fae:	00c7222b          	p.sw	a2,4(a4!)
1c008fb2:	0b09                	addi	s6,s6,2
1c008fb4:	197d                	addi	s2,s2,-1
1c008fb6:	40b6                	lw	ra,76(sp)
1c008fb8:	4426                	lw	s0,72(sp)
1c008fba:	4496                	lw	s1,68(sp)
1c008fbc:	4906                	lw	s2,64(sp)
1c008fbe:	59f2                	lw	s3,60(sp)
1c008fc0:	5a62                	lw	s4,56(sp)
1c008fc2:	5ad2                	lw	s5,52(sp)
1c008fc4:	5b42                	lw	s6,48(sp)
1c008fc6:	5bb2                	lw	s7,44(sp)
1c008fc8:	5c22                	lw	s8,40(sp)
1c008fca:	5c92                	lw	s9,36(sp)
1c008fcc:	5d02                	lw	s10,32(sp)
1c008fce:	4df2                	lw	s11,28(sp)
1c008fd0:	6161                	addi	sp,sp,80
1c008fd2:	8082                	ret
1c008fd4:	00169993          	slli	s3,a3,0x1
1c008fd8:	19f9                	addi	s3,s3,-2
1c008fda:	99b2                	add	s3,s3,a2
1c008fdc:	47a2                	lw	a5,8(sp)
1c008fde:	d3a9                	beqz	a5,1c008f20 <plp_conv_i16s_xpulpv2+0x2de>
1c008fe0:	cac1                	beqz	a3,1c009070 <plp_conv_i16s_xpulpv2+0x42e>
1c008fe2:	0a090563          	beqz	s2,1c00908c <plp_conv_i16s_xpulpv2+0x44a>
1c008fe6:	0426ac63          	p.beqimm	a3,2,1c00903e <plp_conv_i16s_xpulpv2+0x3fc>
1c008fea:	00179e93          	slli	t4,a5,0x1
1c008fee:	ffee8613          	addi	a2,t4,-2
1c008ff2:	00099503          	lh	a0,0(s3)
1c008ff6:	00299303          	lh	t1,2(s3)
1c008ffa:	00499e03          	lh	t3,4(s3)
1c008ffe:	8205                	srli	a2,a2,0x1
1c009000:	86da                	mv	a3,s6
1c009002:	85ba                	mv	a1,a4
1c009004:	0605                	addi	a2,a2,1
1c009006:	00e640fb          	lp.setup	x1,a2,1c009022 <plp_conv_i16s_xpulpv2+0x3e0>
1c00900a:	0026978b          	p.lh	a5,2(a3!)
1c00900e:	02a787b3          	mul	a5,a5,a0
1c009012:	00069883          	lh	a7,0(a3)
1c009016:	00269803          	lh	a6,2(a3)
1c00901a:	426887b3          	p.mac	a5,a7,t1
1c00901e:	43c807b3          	p.mac	a5,a6,t3
1c009022:	00f5a22b          	p.sw	a5,4(a1!)
1c009026:	46a2                	lw	a3,8(sp)
1c009028:	9b76                	add	s6,s6,t4
1c00902a:	00269793          	slli	a5,a3,0x2
1c00902e:	973e                	add	a4,a4,a5
1c009030:	bdf5                	j	1c008f2c <plp_conv_i16s_xpulpv2+0x2ea>
1c009032:	8f4e                	mv	t5,s3
1c009034:	87da                	mv	a5,s6
1c009036:	4601                	li	a2,0
1c009038:	b791                	j	1c008f7c <plp_conv_i16s_xpulpv2+0x33a>
1c00903a:	8fda                	mv	t6,s6
1c00903c:	b589                	j	1c008e7e <plp_conv_i16s_xpulpv2+0x23c>
1c00903e:	00179e93          	slli	t4,a5,0x1
1c009042:	ffee8693          	addi	a3,t4,-2
1c009046:	00099503          	lh	a0,0(s3)
1c00904a:	00299303          	lh	t1,2(s3)
1c00904e:	8285                	srli	a3,a3,0x1
1c009050:	865a                	mv	a2,s6
1c009052:	85ba                	mv	a1,a4
1c009054:	0685                	addi	a3,a3,1
1c009056:	00a6c0fb          	lp.setup	x1,a3,1c00906a <plp_conv_i16s_xpulpv2+0x428>
1c00905a:	0026178b          	p.lh	a5,2(a2!)
1c00905e:	02a787b3          	mul	a5,a5,a0
1c009062:	00061803          	lh	a6,0(a2)
1c009066:	426807b3          	p.mac	a5,a6,t1
1c00906a:	00f5a22b          	p.sw	a5,4(a1!)
1c00906e:	bf65                	j	1c009026 <plp_conv_i16s_xpulpv2+0x3e4>
1c009070:	00279413          	slli	s0,a5,0x2
1c009074:	853a                	mv	a0,a4
1c009076:	8622                	mv	a2,s0
1c009078:	4581                	li	a1,0
1c00907a:	46b010ef          	jal	ra,1c00ace4 <memset>
1c00907e:	46a2                	lw	a3,8(sp)
1c009080:	00850733          	add	a4,a0,s0
1c009084:	00169e93          	slli	t4,a3,0x1
1c009088:	9b76                	add	s6,s6,t4
1c00908a:	b54d                	j	1c008f2c <plp_conv_i16s_xpulpv2+0x2ea>
1c00908c:	0786                	slli	a5,a5,0x1
1c00908e:	17f9                	addi	a5,a5,-2
1c009090:	00099503          	lh	a0,0(s3)
1c009094:	8385                	srli	a5,a5,0x1
1c009096:	0785                	addi	a5,a5,1
1c009098:	0067c0fb          	lp.setup	x1,a5,1c0090a4 <plp_conv_i16s_xpulpv2+0x462>
1c00909c:	002b168b          	p.lh	a3,2(s6!)
1c0090a0:	02a686b3          	mul	a3,a3,a0
1c0090a4:	00d7222b          	p.sw	a3,4(a4!)
1c0090a8:	b739                	j	1c008fb6 <plp_conv_i16s_xpulpv2+0x374>
1c0090aa:	8fda                	mv	t6,s6
1c0090ac:	4501                	li	a0,0
1c0090ae:	b9b9                	j	1c008d0c <plp_conv_i16s_xpulpv2+0xca>

1c0090b0 <rt_user_alloc_init>:
1c0090b0:	00758793          	addi	a5,a1,7
1c0090b4:	9be1                	andi	a5,a5,-8
1c0090b6:	40b785b3          	sub	a1,a5,a1
1c0090ba:	c11c                	sw	a5,0(a0)
1c0090bc:	8e0d                	sub	a2,a2,a1
1c0090be:	00c05663          	blez	a2,1c0090ca <rt_user_alloc_init+0x1a>
1c0090c2:	9a61                	andi	a2,a2,-8
1c0090c4:	c390                	sw	a2,0(a5)
1c0090c6:	0007a223          	sw	zero,4(a5)
1c0090ca:	8082                	ret

1c0090cc <rt_user_alloc>:
1c0090cc:	411c                	lw	a5,0(a0)
1c0090ce:	059d                	addi	a1,a1,7
1c0090d0:	99e1                	andi	a1,a1,-8
1c0090d2:	4701                	li	a4,0
1c0090d4:	cb89                	beqz	a5,1c0090e6 <rt_user_alloc+0x1a>
1c0090d6:	4394                	lw	a3,0(a5)
1c0090d8:	43d0                	lw	a2,4(a5)
1c0090da:	00b6c863          	blt	a3,a1,1c0090ea <rt_user_alloc+0x1e>
1c0090de:	00b69b63          	bne	a3,a1,1c0090f4 <rt_user_alloc+0x28>
1c0090e2:	c719                	beqz	a4,1c0090f0 <rt_user_alloc+0x24>
1c0090e4:	c350                	sw	a2,4(a4)
1c0090e6:	853e                	mv	a0,a5
1c0090e8:	8082                	ret
1c0090ea:	873e                	mv	a4,a5
1c0090ec:	87b2                	mv	a5,a2
1c0090ee:	b7dd                	j	1c0090d4 <rt_user_alloc+0x8>
1c0090f0:	c110                	sw	a2,0(a0)
1c0090f2:	bfd5                	j	1c0090e6 <rt_user_alloc+0x1a>
1c0090f4:	00b78833          	add	a6,a5,a1
1c0090f8:	40b685b3          	sub	a1,a3,a1
1c0090fc:	00b82023          	sw	a1,0(a6)
1c009100:	00c82223          	sw	a2,4(a6)
1c009104:	c701                	beqz	a4,1c00910c <rt_user_alloc+0x40>
1c009106:	01072223          	sw	a6,4(a4)
1c00910a:	bff1                	j	1c0090e6 <rt_user_alloc+0x1a>
1c00910c:	01052023          	sw	a6,0(a0)
1c009110:	bfd9                	j	1c0090e6 <rt_user_alloc+0x1a>

1c009112 <rt_user_free>:
1c009112:	411c                	lw	a5,0(a0)
1c009114:	061d                	addi	a2,a2,7
1c009116:	9a61                	andi	a2,a2,-8
1c009118:	4701                	li	a4,0
1c00911a:	c399                	beqz	a5,1c009120 <rt_user_free+0xe>
1c00911c:	02b7e763          	bltu	a5,a1,1c00914a <rt_user_free+0x38>
1c009120:	00c586b3          	add	a3,a1,a2
1c009124:	02d79663          	bne	a5,a3,1c009150 <rt_user_free+0x3e>
1c009128:	4394                	lw	a3,0(a5)
1c00912a:	43dc                	lw	a5,4(a5)
1c00912c:	9636                	add	a2,a2,a3
1c00912e:	c190                	sw	a2,0(a1)
1c009130:	c1dc                	sw	a5,4(a1)
1c009132:	c31d                	beqz	a4,1c009158 <rt_user_free+0x46>
1c009134:	4314                	lw	a3,0(a4)
1c009136:	00d707b3          	add	a5,a4,a3
1c00913a:	00f59d63          	bne	a1,a5,1c009154 <rt_user_free+0x42>
1c00913e:	419c                	lw	a5,0(a1)
1c009140:	97b6                	add	a5,a5,a3
1c009142:	c31c                	sw	a5,0(a4)
1c009144:	41dc                	lw	a5,4(a1)
1c009146:	c35c                	sw	a5,4(a4)
1c009148:	8082                	ret
1c00914a:	873e                	mv	a4,a5
1c00914c:	43dc                	lw	a5,4(a5)
1c00914e:	b7f1                	j	1c00911a <rt_user_free+0x8>
1c009150:	c190                	sw	a2,0(a1)
1c009152:	bff9                	j	1c009130 <rt_user_free+0x1e>
1c009154:	c34c                	sw	a1,4(a4)
1c009156:	8082                	ret
1c009158:	c10c                	sw	a1,0(a0)
1c00915a:	8082                	ret

1c00915c <rt_alloc>:
1c00915c:	1101                	addi	sp,sp,-32
1c00915e:	cc22                	sw	s0,24(sp)
1c009160:	ce06                	sw	ra,28(sp)
1c009162:	ca26                	sw	s1,20(sp)
1c009164:	c84a                	sw	s2,16(sp)
1c009166:	c64e                	sw	s3,12(sp)
1c009168:	c452                	sw	s4,8(sp)
1c00916a:	4789                	li	a5,2
1c00916c:	842a                	mv	s0,a0
1c00916e:	02a7ed63          	bltu	a5,a0,1c0091a8 <rt_alloc+0x4c>
1c009172:	1c001937          	lui	s2,0x1c001
1c009176:	89ae                	mv	s3,a1
1c009178:	448d                	li	s1,3
1c00917a:	13090913          	addi	s2,s2,304 # 1c001130 <__rt_alloc_l2>
1c00917e:	4a0d                	li	s4,3
1c009180:	00241513          	slli	a0,s0,0x2
1c009184:	85ce                	mv	a1,s3
1c009186:	954a                	add	a0,a0,s2
1c009188:	3791                	jal	1c0090cc <rt_user_alloc>
1c00918a:	e519                	bnez	a0,1c009198 <rt_alloc+0x3c>
1c00918c:	0405                	addi	s0,s0,1
1c00918e:	01441363          	bne	s0,s4,1c009194 <rt_alloc+0x38>
1c009192:	4401                	li	s0,0
1c009194:	14fd                	addi	s1,s1,-1
1c009196:	f4ed                	bnez	s1,1c009180 <rt_alloc+0x24>
1c009198:	40f2                	lw	ra,28(sp)
1c00919a:	4462                	lw	s0,24(sp)
1c00919c:	44d2                	lw	s1,20(sp)
1c00919e:	4942                	lw	s2,16(sp)
1c0091a0:	49b2                	lw	s3,12(sp)
1c0091a2:	4a22                	lw	s4,8(sp)
1c0091a4:	6105                	addi	sp,sp,32
1c0091a6:	8082                	ret
1c0091a8:	1c0017b7          	lui	a5,0x1c001
1c0091ac:	ffd50413          	addi	s0,a0,-3
1c0091b0:	12c7a503          	lw	a0,300(a5) # 1c00112c <__rt_alloc_l1>
1c0091b4:	040a                	slli	s0,s0,0x2
1c0091b6:	40f2                	lw	ra,28(sp)
1c0091b8:	9522                	add	a0,a0,s0
1c0091ba:	4462                	lw	s0,24(sp)
1c0091bc:	44d2                	lw	s1,20(sp)
1c0091be:	4942                	lw	s2,16(sp)
1c0091c0:	49b2                	lw	s3,12(sp)
1c0091c2:	4a22                	lw	s4,8(sp)
1c0091c4:	6105                	addi	sp,sp,32
1c0091c6:	b719                	j	1c0090cc <rt_user_alloc>

1c0091c8 <__rt_alloc_init_l1>:
1c0091c8:	1c0017b7          	lui	a5,0x1c001
1c0091cc:	12c7a703          	lw	a4,300(a5) # 1c00112c <__rt_alloc_l1>
1c0091d0:	100027b7          	lui	a5,0x10002
1c0091d4:	01651593          	slli	a1,a0,0x16
1c0091d8:	6639                	lui	a2,0xe
1c0091da:	050a                	slli	a0,a0,0x2
1c0091dc:	40c78793          	addi	a5,a5,1036 # 1000240c <__l1_end>
1c0091e0:	bf460613          	addi	a2,a2,-1036 # dbf4 <__l1_heap_size>
1c0091e4:	95be                	add	a1,a1,a5
1c0091e6:	953a                	add	a0,a0,a4
1c0091e8:	b5e1                	j	1c0090b0 <rt_user_alloc_init>

1c0091ea <__rt_alloc_init_l1_for_fc>:
1c0091ea:	100025b7          	lui	a1,0x10002
1c0091ee:	01651793          	slli	a5,a0,0x16
1c0091f2:	40c58593          	addi	a1,a1,1036 # 1000240c <__l1_end>
1c0091f6:	00b78733          	add	a4,a5,a1
1c0091fa:	050a                	slli	a0,a0,0x2
1c0091fc:	0791                	addi	a5,a5,4
1c0091fe:	6639                	lui	a2,0xe
1c009200:	1c0016b7          	lui	a3,0x1c001
1c009204:	bf060613          	addi	a2,a2,-1040 # dbf0 <_l1_preload_size+0xb7e8>
1c009208:	95be                	add	a1,a1,a5
1c00920a:	953a                	add	a0,a0,a4
1c00920c:	12e6a623          	sw	a4,300(a3) # 1c00112c <__rt_alloc_l1>
1c009210:	b545                	j	1c0090b0 <rt_user_alloc_init>

1c009212 <__rt_allocs_init>:
1c009212:	1141                	addi	sp,sp,-16
1c009214:	1c0015b7          	lui	a1,0x1c001
1c009218:	c606                	sw	ra,12(sp)
1c00921a:	17c58793          	addi	a5,a1,380 # 1c00117c <__l2_priv0_end>
1c00921e:	1c008637          	lui	a2,0x1c008
1c009222:	06c7ca63          	blt	a5,a2,1c009296 <__rt_allocs_init+0x84>
1c009226:	4581                	li	a1,0
1c009228:	4601                	li	a2,0
1c00922a:	1c001537          	lui	a0,0x1c001
1c00922e:	13050513          	addi	a0,a0,304 # 1c001130 <__rt_alloc_l2>
1c009232:	3dbd                	jal	1c0090b0 <rt_user_alloc_init>
1c009234:	1c00c5b7          	lui	a1,0x1c00c
1c009238:	b8c58793          	addi	a5,a1,-1140 # 1c00bb8c <__l2_priv1_end>
1c00923c:	1c010637          	lui	a2,0x1c010
1c009240:	04c7cf63          	blt	a5,a2,1c00929e <__rt_allocs_init+0x8c>
1c009244:	4581                	li	a1,0
1c009246:	4601                	li	a2,0
1c009248:	1c001537          	lui	a0,0x1c001
1c00924c:	13450513          	addi	a0,a0,308 # 1c001134 <__rt_alloc_l2+0x4>
1c009250:	3585                	jal	1c0090b0 <rt_user_alloc_init>
1c009252:	1c0125b7          	lui	a1,0x1c012
1c009256:	59058793          	addi	a5,a1,1424 # 1c012590 <__l2_shared_end>
1c00925a:	1c080637          	lui	a2,0x1c080
1c00925e:	1c001537          	lui	a0,0x1c001
1c009262:	8e1d                	sub	a2,a2,a5
1c009264:	59058593          	addi	a1,a1,1424
1c009268:	13850513          	addi	a0,a0,312 # 1c001138 <__rt_alloc_l2+0x8>
1c00926c:	3591                	jal	1c0090b0 <rt_user_alloc_init>
1c00926e:	f14027f3          	csrr	a5,mhartid
1c009272:	8795                	srai	a5,a5,0x5
1c009274:	03f7f793          	andi	a5,a5,63
1c009278:	e789                	bnez	a5,1c009282 <__rt_allocs_init+0x70>
1c00927a:	40b2                	lw	ra,12(sp)
1c00927c:	4501                	li	a0,0
1c00927e:	0141                	addi	sp,sp,16
1c009280:	b7ad                	j	1c0091ea <__rt_alloc_init_l1_for_fc>
1c009282:	4591                	li	a1,4
1c009284:	4501                	li	a0,0
1c009286:	3dd9                	jal	1c00915c <rt_alloc>
1c009288:	40b2                	lw	ra,12(sp)
1c00928a:	1c0017b7          	lui	a5,0x1c001
1c00928e:	12a7a623          	sw	a0,300(a5) # 1c00112c <__rt_alloc_l1>
1c009292:	0141                	addi	sp,sp,16
1c009294:	8082                	ret
1c009296:	8e1d                	sub	a2,a2,a5
1c009298:	17c58593          	addi	a1,a1,380
1c00929c:	b779                	j	1c00922a <__rt_allocs_init+0x18>
1c00929e:	8e1d                	sub	a2,a2,a5
1c0092a0:	b8c58593          	addi	a1,a1,-1140
1c0092a4:	b755                	j	1c009248 <__rt_allocs_init+0x36>

1c0092a6 <__rt_init_cluster_data>:
1c0092a6:	04050793          	addi	a5,a0,64
1c0092aa:	01679693          	slli	a3,a5,0x16
1c0092ae:	6705                	lui	a4,0x1
1c0092b0:	177d                	addi	a4,a4,-1
1c0092b2:	00400793          	li	a5,4
1c0092b6:	8ff9                	and	a5,a5,a4
1c0092b8:	1c010737          	lui	a4,0x1c010
1c0092bc:	97b6                	add	a5,a5,a3
1c0092be:	6609                	lui	a2,0x2
1c0092c0:	18870713          	addi	a4,a4,392 # 1c010188 <_l1_preload_start_inL2>
1c0092c4:	40860613          	addi	a2,a2,1032 # 2408 <_l1_preload_size>
1c0092c8:	8f99                	sub	a5,a5,a4
1c0092ca:	00f705b3          	add	a1,a4,a5
1c0092ce:	02c04b63          	bgtz	a2,1c009304 <__rt_init_cluster_data+0x5e>
1c0092d2:	02800713          	li	a4,40
1c0092d6:	02e50733          	mul	a4,a0,a4
1c0092da:	1c0017b7          	lui	a5,0x1c001
1c0092de:	14078513          	addi	a0,a5,320 # 1c001140 <__rt_fc_cluster_data>
1c0092e2:	002017b7          	lui	a5,0x201
1c0092e6:	e0478793          	addi	a5,a5,-508 # 200e04 <__l1_heap_size+0x1f3210>
1c0092ea:	97b6                	add	a5,a5,a3
1c0092ec:	953a                	add	a0,a0,a4
1c0092ee:	c91c                	sw	a5,16(a0)
1c0092f0:	6705                	lui	a4,0x1
1c0092f2:	00400793          	li	a5,4
1c0092f6:	177d                	addi	a4,a4,-1
1c0092f8:	8ff9                	and	a5,a5,a4
1c0092fa:	97b6                	add	a5,a5,a3
1c0092fc:	00052423          	sw	zero,8(a0)
1c009300:	c95c                	sw	a5,20(a0)
1c009302:	8082                	ret
1c009304:	00072803          	lw	a6,0(a4) # 1000 <__rt_hyper_pending_emu_stride+0xd58>
1c009308:	1671                	addi	a2,a2,-4
1c00930a:	0711                	addi	a4,a4,4
1c00930c:	0105a023          	sw	a6,0(a1)
1c009310:	bf6d                	j	1c0092ca <__rt_init_cluster_data+0x24>

1c009312 <__rt_cluster_mount_step>:
1c009312:	7179                	addi	sp,sp,-48
1c009314:	d04a                	sw	s2,32(sp)
1c009316:	ce4e                	sw	s3,28(sp)
1c009318:	6785                	lui	a5,0x1
1c00931a:	1c0089b7          	lui	s3,0x1c008
1c00931e:	00400913          	li	s2,4
1c009322:	17fd                	addi	a5,a5,-1
1c009324:	08098993          	addi	s3,s3,128 # 1c008080 <_start>
1c009328:	d422                	sw	s0,40(sp)
1c00932a:	d606                	sw	ra,44(sp)
1c00932c:	d226                	sw	s1,36(sp)
1c00932e:	cc52                	sw	s4,24(sp)
1c009330:	842a                	mv	s0,a0
1c009332:	00f97933          	and	s2,s2,a5
1c009336:	f009f993          	andi	s3,s3,-256
1c00933a:	4c5c                	lw	a5,28(s0)
1c00933c:	4705                	li	a4,1
1c00933e:	02e78d63          	beq	a5,a4,1c009378 <__rt_cluster_mount_step+0x66>
1c009342:	4709                	li	a4,2
1c009344:	0ae78d63          	beq	a5,a4,1c0093fe <__rt_cluster_mount_step+0xec>
1c009348:	e7dd                	bnez	a5,1c0093f6 <__rt_cluster_mount_step+0xe4>
1c00934a:	5018                	lw	a4,32(s0)
1c00934c:	00042c23          	sw	zero,24(s0)
1c009350:	eb01                	bnez	a4,1c009360 <__rt_cluster_mount_step+0x4e>
1c009352:	5048                	lw	a0,36(s0)
1c009354:	006c                	addi	a1,sp,12
1c009356:	c602                	sw	zero,12(sp)
1c009358:	422010ef          	jal	ra,1c00a77a <__rt_pmu_cluster_power_up>
1c00935c:	47b2                	lw	a5,12(sp)
1c00935e:	cc08                	sw	a0,24(s0)
1c009360:	4c58                	lw	a4,28(s0)
1c009362:	0705                	addi	a4,a4,1
1c009364:	cc58                	sw	a4,28(s0)
1c009366:	dbf1                	beqz	a5,1c00933a <__rt_cluster_mount_step+0x28>
1c009368:	50b2                	lw	ra,44(sp)
1c00936a:	5422                	lw	s0,40(sp)
1c00936c:	5492                	lw	s1,36(sp)
1c00936e:	5902                	lw	s2,32(sp)
1c009370:	49f2                	lw	s3,28(sp)
1c009372:	4a62                	lw	s4,24(sp)
1c009374:	6145                	addi	sp,sp,48
1c009376:	8082                	ret
1c009378:	02042a03          	lw	s4,32(s0)
1c00937c:	040a0493          	addi	s1,s4,64
1c009380:	04da                	slli	s1,s1,0x16
1c009382:	00990733          	add	a4,s2,s1
1c009386:	00072223          	sw	zero,4(a4)
1c00938a:	00072423          	sw	zero,8(a4)
1c00938e:	00072023          	sw	zero,0(a4)
1c009392:	1c001737          	lui	a4,0x1c001
1c009396:	00c72703          	lw	a4,12(a4) # 1c00100c <__rt_platform>
1c00939a:	00f70f63          	beq	a4,a5,1c0093b8 <__rt_cluster_mount_step+0xa6>
1c00939e:	4505                	li	a0,1
1c0093a0:	13e010ef          	jal	ra,1c00a4de <__rt_fll_init>
1c0093a4:	1c0017b7          	lui	a5,0x1c001
1c0093a8:	17478793          	addi	a5,a5,372 # 1c001174 <__rt_freq_domains>
1c0093ac:	43cc                	lw	a1,4(a5)
1c0093ae:	c5b1                	beqz	a1,1c0093fa <__rt_cluster_mount_step+0xe8>
1c0093b0:	4601                	li	a2,0
1c0093b2:	4505                	li	a0,1
1c0093b4:	2c0010ef          	jal	ra,1c00a674 <rt_freq_set_and_get>
1c0093b8:	8552                	mv	a0,s4
1c0093ba:	35f5                	jal	1c0092a6 <__rt_init_cluster_data>
1c0093bc:	8552                	mv	a0,s4
1c0093be:	3529                	jal	1c0091c8 <__rt_alloc_init_l1>
1c0093c0:	002017b7          	lui	a5,0x201
1c0093c4:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f380c>
1c0093c8:	97a6                	add	a5,a5,s1
1c0093ca:	577d                	li	a4,-1
1c0093cc:	c398                	sw	a4,0(a5)
1c0093ce:	002007b7          	lui	a5,0x200
1c0093d2:	04078713          	addi	a4,a5,64 # 200040 <__l1_heap_size+0x1f244c>
1c0093d6:	06078793          	addi	a5,a5,96
1c0093da:	9726                	add	a4,a4,s1
1c0093dc:	97a6                	add	a5,a5,s1
1c0093de:	01372023          	sw	s3,0(a4)
1c0093e2:	0711                	addi	a4,a4,4
1c0093e4:	fef71de3          	bne	a4,a5,1c0093de <__rt_cluster_mount_step+0xcc>
1c0093e8:	002007b7          	lui	a5,0x200
1c0093ec:	07a1                	addi	a5,a5,8
1c0093ee:	94be                	add	s1,s1,a5
1c0093f0:	0ff00793          	li	a5,255
1c0093f4:	c09c                	sw	a5,0(s1)
1c0093f6:	4781                	li	a5,0
1c0093f8:	b7a5                	j	1c009360 <__rt_cluster_mount_step+0x4e>
1c0093fa:	c3c8                	sw	a0,4(a5)
1c0093fc:	bf75                	j	1c0093b8 <__rt_cluster_mount_step+0xa6>
1c0093fe:	505c                	lw	a5,36(s0)
1c009400:	5b98                	lw	a4,48(a5)
1c009402:	d398                	sw	a4,32(a5)
1c009404:	5798                	lw	a4,40(a5)
1c009406:	c398                	sw	a4,0(a5)
1c009408:	57d8                	lw	a4,44(a5)
1c00940a:	c3d8                	sw	a4,4(a5)
1c00940c:	0207a823          	sw	zero,48(a5) # 200030 <__l1_heap_size+0x1f243c>
1c009410:	505c                	lw	a5,36(s0)
1c009412:	02802703          	lw	a4,40(zero) # 28 <__rt_sched>
1c009416:	0007ac23          	sw	zero,24(a5)
1c00941a:	cb01                	beqz	a4,1c00942a <__rt_cluster_mount_step+0x118>
1c00941c:	02c02703          	lw	a4,44(zero) # 2c <__rt_sched+0x4>
1c009420:	cf1c                	sw	a5,24(a4)
1c009422:	02f02623          	sw	a5,44(zero) # 2c <__rt_sched+0x4>
1c009426:	4785                	li	a5,1
1c009428:	bf25                	j	1c009360 <__rt_cluster_mount_step+0x4e>
1c00942a:	02f02423          	sw	a5,40(zero) # 28 <__rt_sched>
1c00942e:	bfd5                	j	1c009422 <__rt_cluster_mount_step+0x110>

1c009430 <__rt_cluster_init>:
1c009430:	1c001537          	lui	a0,0x1c001
1c009434:	1141                	addi	sp,sp,-16
1c009436:	02800613          	li	a2,40
1c00943a:	4581                	li	a1,0
1c00943c:	14050513          	addi	a0,a0,320 # 1c001140 <__rt_fc_cluster_data>
1c009440:	c606                	sw	ra,12(sp)
1c009442:	0a3010ef          	jal	ra,1c00ace4 <memset>
1c009446:	1c0085b7          	lui	a1,0x1c008
1c00944a:	17e58593          	addi	a1,a1,382 # 1c00817e <__rt_remote_enqueue_event>
1c00944e:	4505                	li	a0,1
1c009450:	2511                	jal	1c009a54 <rt_irq_set_handler>
1c009452:	f14027f3          	csrr	a5,mhartid
1c009456:	8795                	srai	a5,a5,0x5
1c009458:	03f7f793          	andi	a5,a5,63
1c00945c:	477d                	li	a4,31
1c00945e:	02e79e63          	bne	a5,a4,1c00949a <__rt_cluster_init+0x6a>
1c009462:	1a10a7b7          	lui	a5,0x1a10a
1c009466:	4709                	li	a4,2
1c009468:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1073f8>
1c00946c:	1c0085b7          	lui	a1,0x1c008
1c009470:	14658593          	addi	a1,a1,326 # 1c008146 <__rt_bridge_enqueue_event>
1c009474:	4511                	li	a0,4
1c009476:	2bf9                	jal	1c009a54 <rt_irq_set_handler>
1c009478:	f14027f3          	csrr	a5,mhartid
1c00947c:	8795                	srai	a5,a5,0x5
1c00947e:	03f7f793          	andi	a5,a5,63
1c009482:	477d                	li	a4,31
1c009484:	02e79063          	bne	a5,a4,1c0094a4 <__rt_cluster_init+0x74>
1c009488:	1a10a7b7          	lui	a5,0x1a10a
1c00948c:	4741                	li	a4,16
1c00948e:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1073f8>
1c009492:	40b2                	lw	ra,12(sp)
1c009494:	4501                	li	a0,0
1c009496:	0141                	addi	sp,sp,16
1c009498:	8082                	ret
1c00949a:	002047b7          	lui	a5,0x204
1c00949e:	4709                	li	a4,2
1c0094a0:	cbd8                	sw	a4,20(a5)
1c0094a2:	b7e9                	j	1c00946c <__rt_cluster_init+0x3c>
1c0094a4:	002047b7          	lui	a5,0x204
1c0094a8:	4741                	li	a4,16
1c0094aa:	cbd8                	sw	a4,20(a5)
1c0094ac:	b7dd                	j	1c009492 <__rt_cluster_init+0x62>

1c0094ae <pi_cluster_conf_init>:
1c0094ae:	00052223          	sw	zero,4(a0)
1c0094b2:	8082                	ret

1c0094b4 <pi_cluster_open>:
1c0094b4:	1101                	addi	sp,sp,-32
1c0094b6:	ce06                	sw	ra,28(sp)
1c0094b8:	cc22                	sw	s0,24(sp)
1c0094ba:	ca26                	sw	s1,20(sp)
1c0094bc:	c84a                	sw	s2,16(sp)
1c0094be:	c64e                	sw	s3,12(sp)
1c0094c0:	30047973          	csrrci	s2,mstatus,8
1c0094c4:	00452983          	lw	s3,4(a0)
1c0094c8:	02800793          	li	a5,40
1c0094cc:	0049a483          	lw	s1,4(s3)
1c0094d0:	02f484b3          	mul	s1,s1,a5
1c0094d4:	1c0017b7          	lui	a5,0x1c001
1c0094d8:	14078793          	addi	a5,a5,320 # 1c001140 <__rt_fc_cluster_data>
1c0094dc:	94be                	add	s1,s1,a5
1c0094de:	c504                	sw	s1,8(a0)
1c0094e0:	3bd000ef          	jal	ra,1c00a09c <__rt_wait_event_prepare_blocking>
1c0094e4:	f14027f3          	csrr	a5,mhartid
1c0094e8:	8795                	srai	a5,a5,0x5
1c0094ea:	03f7f793          	andi	a5,a5,63
1c0094ee:	477d                	li	a4,31
1c0094f0:	842a                	mv	s0,a0
1c0094f2:	04e79463          	bne	a5,a4,1c00953a <pi_cluster_open+0x86>
1c0094f6:	511c                	lw	a5,32(a0)
1c0094f8:	0004ae23          	sw	zero,28(s1)
1c0094fc:	d0c8                	sw	a0,36(s1)
1c0094fe:	d91c                	sw	a5,48(a0)
1c009500:	411c                	lw	a5,0(a0)
1c009502:	02052223          	sw	zero,36(a0)
1c009506:	d51c                	sw	a5,40(a0)
1c009508:	415c                	lw	a5,4(a0)
1c00950a:	c144                	sw	s1,4(a0)
1c00950c:	d55c                	sw	a5,44(a0)
1c00950e:	1c0097b7          	lui	a5,0x1c009
1c009512:	31278793          	addi	a5,a5,786 # 1c009312 <__rt_cluster_mount_step>
1c009516:	c11c                	sw	a5,0(a0)
1c009518:	4785                	li	a5,1
1c00951a:	d11c                	sw	a5,32(a0)
1c00951c:	8526                	mv	a0,s1
1c00951e:	3bd5                	jal	1c009312 <__rt_cluster_mount_step>
1c009520:	8522                	mv	a0,s0
1c009522:	4cb000ef          	jal	ra,1c00a1ec <__rt_wait_event>
1c009526:	30091073          	csrw	mstatus,s2
1c00952a:	40f2                	lw	ra,28(sp)
1c00952c:	4462                	lw	s0,24(sp)
1c00952e:	44d2                	lw	s1,20(sp)
1c009530:	4942                	lw	s2,16(sp)
1c009532:	49b2                	lw	s3,12(sp)
1c009534:	4501                	li	a0,0
1c009536:	6105                	addi	sp,sp,32
1c009538:	8082                	ret
1c00953a:	0049a483          	lw	s1,4(s3)
1c00953e:	8526                	mv	a0,s1
1c009540:	339d                	jal	1c0092a6 <__rt_init_cluster_data>
1c009542:	04048513          	addi	a0,s1,64
1c009546:	002017b7          	lui	a5,0x201
1c00954a:	055a                	slli	a0,a0,0x16
1c00954c:	40078793          	addi	a5,a5,1024 # 201400 <__l1_heap_size+0x1f380c>
1c009550:	97aa                	add	a5,a5,a0
1c009552:	577d                	li	a4,-1
1c009554:	c398                	sw	a4,0(a5)
1c009556:	1c0086b7          	lui	a3,0x1c008
1c00955a:	002007b7          	lui	a5,0x200
1c00955e:	04478713          	addi	a4,a5,68 # 200044 <__l1_heap_size+0x1f2450>
1c009562:	08068693          	addi	a3,a3,128 # 1c008080 <_start>
1c009566:	06078793          	addi	a5,a5,96
1c00956a:	972a                	add	a4,a4,a0
1c00956c:	97aa                	add	a5,a5,a0
1c00956e:	f006f693          	andi	a3,a3,-256
1c009572:	c314                	sw	a3,0(a4)
1c009574:	0711                	addi	a4,a4,4
1c009576:	fef71ee3          	bne	a4,a5,1c009572 <pi_cluster_open+0xbe>
1c00957a:	002007b7          	lui	a5,0x200
1c00957e:	07a1                	addi	a5,a5,8
1c009580:	953e                	add	a0,a0,a5
1c009582:	57fd                	li	a5,-1
1c009584:	c11c                	sw	a5,0(a0)
1c009586:	8522                	mv	a0,s0
1c009588:	3e1000ef          	jal	ra,1c00a168 <rt_event_push>
1c00958c:	bf51                	j	1c009520 <pi_cluster_open+0x6c>

1c00958e <pi_cluster_close>:
1c00958e:	451c                	lw	a5,8(a0)
1c009590:	1101                	addi	sp,sp,-32
1c009592:	cc22                	sw	s0,24(sp)
1c009594:	5380                	lw	s0,32(a5)
1c009596:	1c0017b7          	lui	a5,0x1c001
1c00959a:	00c7a703          	lw	a4,12(a5) # 1c00100c <__rt_platform>
1c00959e:	ce06                	sw	ra,28(sp)
1c0095a0:	4785                	li	a5,1
1c0095a2:	00f70563          	beq	a4,a5,1c0095ac <pi_cluster_close+0x1e>
1c0095a6:	4505                	li	a0,1
1c0095a8:	7ed000ef          	jal	ra,1c00a594 <__rt_fll_deinit>
1c0095ac:	c602                	sw	zero,12(sp)
1c0095ae:	e409                	bnez	s0,1c0095b8 <pi_cluster_close+0x2a>
1c0095b0:	006c                	addi	a1,sp,12
1c0095b2:	4501                	li	a0,0
1c0095b4:	182010ef          	jal	ra,1c00a736 <__rt_pmu_cluster_power_down>
1c0095b8:	40f2                	lw	ra,28(sp)
1c0095ba:	4462                	lw	s0,24(sp)
1c0095bc:	4501                	li	a0,0
1c0095be:	6105                	addi	sp,sp,32
1c0095c0:	8082                	ret

1c0095c2 <__rt_cluster_push_fc_event>:
1c0095c2:	002047b7          	lui	a5,0x204
1c0095c6:	0c078793          	addi	a5,a5,192 # 2040c0 <__l1_heap_size+0x1f64cc>
1c0095ca:	0007e703          	p.elw	a4,0(a5)
1c0095ce:	f14027f3          	csrr	a5,mhartid
1c0095d2:	8795                	srai	a5,a5,0x5
1c0095d4:	02800693          	li	a3,40
1c0095d8:	03f7f793          	andi	a5,a5,63
1c0095dc:	02d787b3          	mul	a5,a5,a3
1c0095e0:	1c001737          	lui	a4,0x1c001
1c0095e4:	14070713          	addi	a4,a4,320 # 1c001140 <__rt_fc_cluster_data>
1c0095e8:	4689                	li	a3,2
1c0095ea:	97ba                	add	a5,a5,a4
1c0095ec:	00204737          	lui	a4,0x204
1c0095f0:	43d0                	lw	a2,4(a5)
1c0095f2:	ee01                	bnez	a2,1c00960a <__rt_cluster_push_fc_event+0x48>
1c0095f4:	c3c8                	sw	a0,4(a5)
1c0095f6:	4709                	li	a4,2
1c0095f8:	1a10a7b7          	lui	a5,0x1a10a
1c0095fc:	80e7a823          	sw	a4,-2032(a5) # 1a109810 <__l1_end+0xa107404>
1c009600:	002047b7          	lui	a5,0x204
1c009604:	0c07a023          	sw	zero,192(a5) # 2040c0 <__l1_heap_size+0x1f64cc>
1c009608:	8082                	ret
1c00960a:	c714                	sw	a3,8(a4)
1c00960c:	03c76603          	p.elw	a2,60(a4) # 20403c <__l1_heap_size+0x1f6448>
1c009610:	c354                	sw	a3,4(a4)
1c009612:	bff9                	j	1c0095f0 <__rt_cluster_push_fc_event+0x2e>

1c009614 <__rt_cluster_new>:
1c009614:	1c0095b7          	lui	a1,0x1c009
1c009618:	1141                	addi	sp,sp,-16
1c00961a:	4601                	li	a2,0
1c00961c:	43058593          	addi	a1,a1,1072 # 1c009430 <__rt_cluster_init>
1c009620:	4501                	li	a0,0
1c009622:	c606                	sw	ra,12(sp)
1c009624:	23c1                	jal	1c009be4 <__rt_cbsys_add>
1c009626:	c105                	beqz	a0,1c009646 <__rt_cluster_new+0x32>
1c009628:	f1402673          	csrr	a2,mhartid
1c00962c:	1c000537          	lui	a0,0x1c000
1c009630:	40565593          	srai	a1,a2,0x5
1c009634:	03f5f593          	andi	a1,a1,63
1c009638:	8a7d                	andi	a2,a2,31
1c00963a:	48850513          	addi	a0,a0,1160 # 1c000488 <__DTOR_END__+0x19c>
1c00963e:	0e5010ef          	jal	ra,1c00af22 <printf>
1c009642:	06d010ef          	jal	ra,1c00aeae <abort>
1c009646:	40b2                	lw	ra,12(sp)
1c009648:	0141                	addi	sp,sp,16
1c00964a:	8082                	ret

1c00964c <__rt_cluster_pulpos_emu_init>:
1c00964c:	1141                	addi	sp,sp,-16
1c00964e:	45b1                	li	a1,12
1c009650:	4501                	li	a0,0
1c009652:	c606                	sw	ra,12(sp)
1c009654:	3621                	jal	1c00915c <rt_alloc>
1c009656:	1c0017b7          	lui	a5,0x1c001
1c00965a:	0ea7ae23          	sw	a0,252(a5) # 1c0010fc <__rt_fc_cluster_device>
1c00965e:	e105                	bnez	a0,1c00967e <__rt_cluster_pulpos_emu_init+0x32>
1c009660:	f1402673          	csrr	a2,mhartid
1c009664:	1c000537          	lui	a0,0x1c000
1c009668:	40565593          	srai	a1,a2,0x5
1c00966c:	03f5f593          	andi	a1,a1,63
1c009670:	8a7d                	andi	a2,a2,31
1c009672:	4d050513          	addi	a0,a0,1232 # 1c0004d0 <__DTOR_END__+0x1e4>
1c009676:	0ad010ef          	jal	ra,1c00af22 <printf>
1c00967a:	035010ef          	jal	ra,1c00aeae <abort>
1c00967e:	40b2                	lw	ra,12(sp)
1c009680:	0141                	addi	sp,sp,16
1c009682:	8082                	ret

1c009684 <rt_cluster_call>:
1c009684:	7139                	addi	sp,sp,-64
1c009686:	d84a                	sw	s2,48(sp)
1c009688:	4906                	lw	s2,64(sp)
1c00968a:	dc22                	sw	s0,56(sp)
1c00968c:	842e                	mv	s0,a1
1c00968e:	de06                	sw	ra,60(sp)
1c009690:	da26                	sw	s1,52(sp)
1c009692:	d64e                	sw	s3,44(sp)
1c009694:	300479f3          	csrrci	s3,mstatus,8
1c009698:	84ca                	mv	s1,s2
1c00969a:	02091163          	bnez	s2,1c0096bc <rt_cluster_call+0x38>
1c00969e:	ce32                	sw	a2,28(sp)
1c0096a0:	cc36                	sw	a3,24(sp)
1c0096a2:	ca3a                	sw	a4,20(sp)
1c0096a4:	c83e                	sw	a5,16(sp)
1c0096a6:	c642                	sw	a6,12(sp)
1c0096a8:	c446                	sw	a7,8(sp)
1c0096aa:	1f3000ef          	jal	ra,1c00a09c <__rt_wait_event_prepare_blocking>
1c0096ae:	48a2                	lw	a7,8(sp)
1c0096b0:	4832                	lw	a6,12(sp)
1c0096b2:	47c2                	lw	a5,16(sp)
1c0096b4:	4752                	lw	a4,20(sp)
1c0096b6:	46e2                	lw	a3,24(sp)
1c0096b8:	4672                	lw	a2,28(sp)
1c0096ba:	84aa                	mv	s1,a0
1c0096bc:	4531                	li	a0,12
1c0096be:	02a40433          	mul	s0,s0,a0
1c0096c2:	1c0015b7          	lui	a1,0x1c001
1c0096c6:	03058313          	addi	t1,a1,48 # 1c001030 <__rt_pulpos_emu_global_cluster_task>
1c0096ca:	00f32623          	sw	a5,12(t1)
1c0096ce:	1c0017b7          	lui	a5,0x1c001
1c0096d2:	0fc7a503          	lw	a0,252(a5) # 1c0010fc <__rt_fc_cluster_device>
1c0096d6:	00c32023          	sw	a2,0(t1)
1c0096da:	03058593          	addi	a1,a1,48
1c0096de:	8626                	mv	a2,s1
1c0096e0:	00d32223          	sw	a3,4(t1)
1c0096e4:	9522                	add	a0,a0,s0
1c0096e6:	00e32423          	sw	a4,8(t1)
1c0096ea:	01032823          	sw	a6,16(t1)
1c0096ee:	01132a23          	sw	a7,20(t1)
1c0096f2:	2041                	jal	1c009772 <pi_cluster_send_task_to_cl_async>
1c0096f4:	842a                	mv	s0,a0
1c0096f6:	cd01                	beqz	a0,1c00970e <rt_cluster_call+0x8a>
1c0096f8:	30099073          	csrw	mstatus,s3
1c0096fc:	547d                	li	s0,-1
1c0096fe:	8522                	mv	a0,s0
1c009700:	50f2                	lw	ra,60(sp)
1c009702:	5462                	lw	s0,56(sp)
1c009704:	54d2                	lw	s1,52(sp)
1c009706:	5942                	lw	s2,48(sp)
1c009708:	59b2                	lw	s3,44(sp)
1c00970a:	6121                	addi	sp,sp,64
1c00970c:	8082                	ret
1c00970e:	00091563          	bnez	s2,1c009718 <rt_cluster_call+0x94>
1c009712:	8526                	mv	a0,s1
1c009714:	2d9000ef          	jal	ra,1c00a1ec <__rt_wait_event>
1c009718:	30099073          	csrw	mstatus,s3
1c00971c:	b7cd                	j	1c0096fe <rt_cluster_call+0x7a>

1c00971e <rt_cluster_mount>:
1c00971e:	7139                	addi	sp,sp,-64
1c009720:	dc22                	sw	s0,56(sp)
1c009722:	da26                	sw	s1,52(sp)
1c009724:	d84a                	sw	s2,48(sp)
1c009726:	4431                	li	s0,12
1c009728:	1c0014b7          	lui	s1,0x1c001
1c00972c:	de06                	sw	ra,60(sp)
1c00972e:	d64e                	sw	s3,44(sp)
1c009730:	8936                	mv	s2,a3
1c009732:	02858433          	mul	s0,a1,s0
1c009736:	0fc48493          	addi	s1,s1,252 # 1c0010fc <__rt_fc_cluster_device>
1c00973a:	c905                	beqz	a0,1c00976a <rt_cluster_mount+0x4c>
1c00973c:	0068                	addi	a0,sp,12
1c00973e:	89ae                	mv	s3,a1
1c009740:	33bd                	jal	1c0094ae <pi_cluster_conf_init>
1c009742:	4088                	lw	a0,0(s1)
1c009744:	006c                	addi	a1,sp,12
1c009746:	9522                	add	a0,a0,s0
1c009748:	2621                	jal	1c009a50 <pi_open_from_conf>
1c00974a:	4088                	lw	a0,0(s1)
1c00974c:	c84e                	sw	s3,16(sp)
1c00974e:	9522                	add	a0,a0,s0
1c009750:	3395                	jal	1c0094b4 <pi_cluster_open>
1c009752:	00090563          	beqz	s2,1c00975c <rt_cluster_mount+0x3e>
1c009756:	854a                	mv	a0,s2
1c009758:	211000ef          	jal	ra,1c00a168 <rt_event_push>
1c00975c:	50f2                	lw	ra,60(sp)
1c00975e:	5462                	lw	s0,56(sp)
1c009760:	54d2                	lw	s1,52(sp)
1c009762:	5942                	lw	s2,48(sp)
1c009764:	59b2                	lw	s3,44(sp)
1c009766:	6121                	addi	sp,sp,64
1c009768:	8082                	ret
1c00976a:	4088                	lw	a0,0(s1)
1c00976c:	9522                	add	a0,a0,s0
1c00976e:	3505                	jal	1c00958e <pi_cluster_close>
1c009770:	b7cd                	j	1c009752 <rt_cluster_mount+0x34>

1c009772 <pi_cluster_send_task_to_cl_async>:
1c009772:	1101                	addi	sp,sp,-32
1c009774:	ca26                	sw	s1,20(sp)
1c009776:	4504                	lw	s1,8(a0)
1c009778:	cc22                	sw	s0,24(sp)
1c00977a:	c256                	sw	s5,4(sp)
1c00977c:	842e                	mv	s0,a1
1c00977e:	8ab2                	mv	s5,a2
1c009780:	ce06                	sw	ra,28(sp)
1c009782:	c84a                	sw	s2,16(sp)
1c009784:	c64e                	sw	s3,12(sp)
1c009786:	c452                	sw	s4,8(sp)
1c009788:	30047a73          	csrrci	s4,mstatus,8
1c00978c:	00060823          	sb	zero,16(a2)
1c009790:	4785                	li	a5,1
1c009792:	d1dc                	sw	a5,36(a1)
1c009794:	49dc                	lw	a5,20(a1)
1c009796:	0144a983          	lw	s3,20(s1)
1c00979a:	e399                	bnez	a5,1c0097a0 <pi_cluster_send_task_to_cl_async+0x2e>
1c00979c:	47a1                	li	a5,8
1c00979e:	c9dc                	sw	a5,20(a1)
1c0097a0:	441c                	lw	a5,8(s0)
1c0097a2:	ef85                	bnez	a5,1c0097da <pi_cluster_send_task_to_cl_async+0x68>
1c0097a4:	445c                	lw	a5,12(s0)
1c0097a6:	eb81                	bnez	a5,1c0097b6 <pi_cluster_send_task_to_cl_async+0x44>
1c0097a8:	6785                	lui	a5,0x1
1c0097aa:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c0097ae:	c45c                	sw	a5,12(s0)
1c0097b0:	40000793          	li	a5,1024
1c0097b4:	c81c                	sw	a5,16(s0)
1c0097b6:	4818                	lw	a4,16(s0)
1c0097b8:	445c                	lw	a5,12(s0)
1c0097ba:	e311                	bnez	a4,1c0097be <pi_cluster_send_task_to_cl_async+0x4c>
1c0097bc:	c81c                	sw	a5,16(s0)
1c0097be:	01442903          	lw	s2,20(s0)
1c0097c2:	4818                	lw	a4,16(s0)
1c0097c4:	448c                	lw	a1,8(s1)
1c0097c6:	197d                	addi	s2,s2,-1
1c0097c8:	02e90933          	mul	s2,s2,a4
1c0097cc:	993e                	add	s2,s2,a5
1c0097ce:	c9bd                	beqz	a1,1c009844 <pi_cluster_send_task_to_cl_async+0xd2>
1c0097d0:	44d0                	lw	a2,12(s1)
1c0097d2:	07261063          	bne	a2,s2,1c009832 <pi_cluster_send_task_to_cl_async+0xc0>
1c0097d6:	449c                	lw	a5,8(s1)
1c0097d8:	c41c                	sw	a5,8(s0)
1c0097da:	4858                	lw	a4,20(s0)
1c0097dc:	4785                	li	a5,1
1c0097de:	01542c23          	sw	s5,24(s0)
1c0097e2:	00e797b3          	sll	a5,a5,a4
1c0097e6:	17fd                	addi	a5,a5,-1
1c0097e8:	d41c                	sw	a5,40(s0)
1c0097ea:	02042023          	sw	zero,32(s0)
1c0097ee:	0089a783          	lw	a5,8(s3)
1c0097f2:	cbbd                	beqz	a5,1c009868 <pi_cluster_send_task_to_cl_async+0xf6>
1c0097f4:	d380                	sw	s0,32(a5)
1c0097f6:	0089a423          	sw	s0,8(s3)
1c0097fa:	0009a783          	lw	a5,0(s3)
1c0097fe:	e399                	bnez	a5,1c009804 <pi_cluster_send_task_to_cl_async+0x92>
1c009800:	0089a023          	sw	s0,0(s3)
1c009804:	509c                	lw	a5,32(s1)
1c009806:	00201737          	lui	a4,0x201
1c00980a:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3210>
1c00980e:	04078793          	addi	a5,a5,64
1c009812:	07da                	slli	a5,a5,0x16
1c009814:	97ba                	add	a5,a5,a4
1c009816:	0007a023          	sw	zero,0(a5)
1c00981a:	300a1073          	csrw	mstatus,s4
1c00981e:	4501                	li	a0,0
1c009820:	40f2                	lw	ra,28(sp)
1c009822:	4462                	lw	s0,24(sp)
1c009824:	44d2                	lw	s1,20(sp)
1c009826:	4942                	lw	s2,16(sp)
1c009828:	49b2                	lw	s3,12(sp)
1c00982a:	4a22                	lw	s4,8(sp)
1c00982c:	4a92                	lw	s5,4(sp)
1c00982e:	6105                	addi	sp,sp,32
1c009830:	8082                	ret
1c009832:	509c                	lw	a5,32(s1)
1c009834:	1c001737          	lui	a4,0x1c001
1c009838:	12c72503          	lw	a0,300(a4) # 1c00112c <__rt_alloc_l1>
1c00983c:	078a                	slli	a5,a5,0x2
1c00983e:	953e                	add	a0,a0,a5
1c009840:	8d3ff0ef          	jal	ra,1c009112 <rt_user_free>
1c009844:	509c                	lw	a5,32(s1)
1c009846:	1c001737          	lui	a4,0x1c001
1c00984a:	12c72503          	lw	a0,300(a4) # 1c00112c <__rt_alloc_l1>
1c00984e:	078a                	slli	a5,a5,0x2
1c009850:	0124a623          	sw	s2,12(s1)
1c009854:	85ca                	mv	a1,s2
1c009856:	953e                	add	a0,a0,a5
1c009858:	875ff0ef          	jal	ra,1c0090cc <rt_user_alloc>
1c00985c:	c488                	sw	a0,8(s1)
1c00985e:	fd25                	bnez	a0,1c0097d6 <pi_cluster_send_task_to_cl_async+0x64>
1c009860:	300a1073          	csrw	mstatus,s4
1c009864:	557d                	li	a0,-1
1c009866:	bf6d                	j	1c009820 <pi_cluster_send_task_to_cl_async+0xae>
1c009868:	0089a223          	sw	s0,4(s3)
1c00986c:	b769                	j	1c0097f6 <pi_cluster_send_task_to_cl_async+0x84>

1c00986e <rt_perf_init>:
1c00986e:	00450793          	addi	a5,a0,4
1c009872:	04850513          	addi	a0,a0,72
1c009876:	0007a023          	sw	zero,0(a5)
1c00987a:	0791                	addi	a5,a5,4
1c00987c:	fea79de3          	bne	a5,a0,1c009876 <rt_perf_init+0x8>
1c009880:	8082                	ret

1c009882 <rt_perf_conf>:
1c009882:	c10c                	sw	a1,0(a0)
1c009884:	7a059073          	csrw	pcer,a1
1c009888:	8082                	ret

1c00988a <cluster_start>:
1c00988a:	002047b7          	lui	a5,0x204
1c00988e:	00070737          	lui	a4,0x70
1c009892:	c798                	sw	a4,8(a5)
1c009894:	0ff00713          	li	a4,255
1c009898:	08e7a223          	sw	a4,132(a5) # 204084 <__l1_heap_size+0x1f6490>
1c00989c:	20e7a023          	sw	a4,512(a5)
1c0098a0:	20e7a623          	sw	a4,524(a5)
1c0098a4:	8082                	ret

1c0098a6 <__rt_init>:
1c0098a6:	1101                	addi	sp,sp,-32
1c0098a8:	ce06                	sw	ra,28(sp)
1c0098aa:	cc22                	sw	s0,24(sp)
1c0098ac:	23d5                	jal	1c009e90 <__rt_bridge_set_available>
1c0098ae:	1c0017b7          	lui	a5,0x1c001
1c0098b2:	00c7a703          	lw	a4,12(a5) # 1c00100c <__rt_platform>
1c0098b6:	478d                	li	a5,3
1c0098b8:	02f71263          	bne	a4,a5,1c0098dc <__rt_init+0x36>
1c0098bc:	7d005073          	csrwi	0x7d0,0
1c0098c0:	1c0007b7          	lui	a5,0x1c000
1c0098c4:	63078793          	addi	a5,a5,1584 # 1c000630 <.got>
1c0098c8:	7d179073          	csrw	0x7d1,a5
1c0098cc:	1c0017b7          	lui	a5,0x1c001
1c0098d0:	e3078793          	addi	a5,a5,-464 # 1c000e30 <stack>
1c0098d4:	7d279073          	csrw	0x7d2,a5
1c0098d8:	7d00d073          	csrwi	0x7d0,1
1c0098dc:	2c29                	jal	1c009af6 <__rt_irq_init>
1c0098de:	1a1067b7          	lui	a5,0x1a106
1c0098e2:	577d                	li	a4,-1
1c0098e4:	c3d8                	sw	a4,4(a5)
1c0098e6:	1c0085b7          	lui	a1,0x1c008
1c0098ea:	c798                	sw	a4,8(a5)
1c0098ec:	32e58593          	addi	a1,a1,814 # 1c00832e <__rt_fc_socevents_handler>
1c0098f0:	4569                	li	a0,26
1c0098f2:	228d                	jal	1c009a54 <rt_irq_set_handler>
1c0098f4:	f14027f3          	csrr	a5,mhartid
1c0098f8:	8795                	srai	a5,a5,0x5
1c0098fa:	03f7f793          	andi	a5,a5,63
1c0098fe:	477d                	li	a4,31
1c009900:	0ae79e63          	bne	a5,a4,1c0099bc <__rt_init+0x116>
1c009904:	1a10a7b7          	lui	a5,0x1a10a
1c009908:	04000737          	lui	a4,0x4000
1c00990c:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1073f8>
1c009910:	6a1000ef          	jal	ra,1c00a7b0 <__rt_pmu_init>
1c009914:	59f000ef          	jal	ra,1c00a6b2 <__rt_freq_init>
1c009918:	f14027f3          	csrr	a5,mhartid
1c00991c:	8795                	srai	a5,a5,0x5
1c00991e:	03f7f793          	andi	a5,a5,63
1c009922:	477d                	li	a4,31
1c009924:	00e78763          	beq	a5,a4,1c009932 <__rt_init+0x8c>
1c009928:	002017b7          	lui	a5,0x201
1c00992c:	577d                	li	a4,-1
1c00992e:	40e7a023          	sw	a4,1024(a5) # 201400 <__l1_heap_size+0x1f380c>
1c009932:	1c000437          	lui	s0,0x1c000
1c009936:	2605                	jal	1c009c56 <__rt_utils_init>
1c009938:	2b440413          	addi	s0,s0,692 # 1c0002b4 <ctor_list+0x4>
1c00993c:	8d7ff0ef          	jal	ra,1c009212 <__rt_allocs_init>
1c009940:	25cd                	jal	1c00a022 <__rt_thread_sched_init>
1c009942:	0ed000ef          	jal	ra,1c00a22e <__rt_event_sched_init>
1c009946:	6a7000ef          	jal	ra,1c00a7ec <__rt_padframe_init>
1c00994a:	401c                	lw	a5,0(s0)
1c00994c:	efb5                	bnez	a5,1c0099c8 <__rt_init+0x122>
1c00994e:	30045073          	csrwi	mstatus,8
1c009952:	4501                	li	a0,0
1c009954:	2cc1                	jal	1c009c24 <__rt_cbsys_exec>
1c009956:	e521                	bnez	a0,1c00999e <__rt_init+0xf8>
1c009958:	f14027f3          	csrr	a5,mhartid
1c00995c:	8795                	srai	a5,a5,0x5
1c00995e:	03f7f793          	andi	a5,a5,63
1c009962:	477d                	li	a4,31
1c009964:	0ae78763          	beq	a5,a4,1c009a12 <__rt_init+0x16c>
1c009968:	4681                	li	a3,0
1c00996a:	4601                	li	a2,0
1c00996c:	4581                	li	a1,0
1c00996e:	4505                	li	a0,1
1c009970:	cfb9                	beqz	a5,1c0099ce <__rt_init+0x128>
1c009972:	3375                	jal	1c00971e <rt_cluster_mount>
1c009974:	6591                	lui	a1,0x4
1c009976:	450d                	li	a0,3
1c009978:	fe4ff0ef          	jal	ra,1c00915c <rt_alloc>
1c00997c:	872a                	mv	a4,a0
1c00997e:	c105                	beqz	a0,1c00999e <__rt_init+0xf8>
1c009980:	6805                	lui	a6,0x1
1c009982:	80080813          	addi	a6,a6,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009986:	1c00a637          	lui	a2,0x1c00a
1c00998a:	c002                	sw	zero,0(sp)
1c00998c:	48a1                	li	a7,8
1c00998e:	87c2                	mv	a5,a6
1c009990:	4681                	li	a3,0
1c009992:	88a60613          	addi	a2,a2,-1910 # 1c00988a <cluster_start>
1c009996:	4581                	li	a1,0
1c009998:	4501                	li	a0,0
1c00999a:	31ed                	jal	1c009684 <rt_cluster_call>
1c00999c:	c93d                	beqz	a0,1c009a12 <__rt_init+0x16c>
1c00999e:	f1402673          	csrr	a2,mhartid
1c0099a2:	1c000537          	lui	a0,0x1c000
1c0099a6:	40565593          	srai	a1,a2,0x5
1c0099aa:	03f5f593          	andi	a1,a1,63
1c0099ae:	8a7d                	andi	a2,a2,31
1c0099b0:	52450513          	addi	a0,a0,1316 # 1c000524 <__DTOR_END__+0x238>
1c0099b4:	56e010ef          	jal	ra,1c00af22 <printf>
1c0099b8:	4f6010ef          	jal	ra,1c00aeae <abort>
1c0099bc:	002047b7          	lui	a5,0x204
1c0099c0:	04000737          	lui	a4,0x4000
1c0099c4:	cbd8                	sw	a4,20(a5)
1c0099c6:	b7a9                	j	1c009910 <__rt_init+0x6a>
1c0099c8:	9782                	jalr	a5
1c0099ca:	0411                	addi	s0,s0,4
1c0099cc:	bfbd                	j	1c00994a <__rt_init+0xa4>
1c0099ce:	3b81                	jal	1c00971e <rt_cluster_mount>
1c0099d0:	6591                	lui	a1,0x4
1c0099d2:	80058593          	addi	a1,a1,-2048 # 3800 <_l1_preload_size+0x13f8>
1c0099d6:	450d                	li	a0,3
1c0099d8:	f84ff0ef          	jal	ra,1c00915c <rt_alloc>
1c0099dc:	d169                	beqz	a0,1c00999e <__rt_init+0xf8>
1c0099de:	00204737          	lui	a4,0x204
1c0099e2:	0ff00793          	li	a5,255
1c0099e6:	08f72223          	sw	a5,132(a4) # 204084 <__l1_heap_size+0x1f6490>
1c0099ea:	1c0107b7          	lui	a5,0x1c010
1c0099ee:	14478793          	addi	a5,a5,324 # 1c010144 <__rt_set_slave_stack>
1c0099f2:	0017e793          	ori	a5,a5,1
1c0099f6:	08f72023          	sw	a5,128(a4)
1c0099fa:	6785                	lui	a5,0x1
1c0099fc:	4462                	lw	s0,24(sp)
1c0099fe:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c009a02:	08f72023          	sw	a5,128(a4)
1c009a06:	40f2                	lw	ra,28(sp)
1c009a08:	08a72023          	sw	a0,128(a4)
1c009a0c:	4501                	li	a0,0
1c009a0e:	6105                	addi	sp,sp,32
1c009a10:	bdad                	j	1c00988a <cluster_start>
1c009a12:	40f2                	lw	ra,28(sp)
1c009a14:	4462                	lw	s0,24(sp)
1c009a16:	6105                	addi	sp,sp,32
1c009a18:	8082                	ret

1c009a1a <__rt_deinit>:
1c009a1a:	1c0017b7          	lui	a5,0x1c001
1c009a1e:	00c7a703          	lw	a4,12(a5) # 1c00100c <__rt_platform>
1c009a22:	1141                	addi	sp,sp,-16
1c009a24:	c606                	sw	ra,12(sp)
1c009a26:	c422                	sw	s0,8(sp)
1c009a28:	478d                	li	a5,3
1c009a2a:	00f71463          	bne	a4,a5,1c009a32 <__rt_deinit+0x18>
1c009a2e:	7d005073          	csrwi	0x7d0,0
1c009a32:	4505                	li	a0,1
1c009a34:	1c000437          	lui	s0,0x1c000
1c009a38:	22f5                	jal	1c009c24 <__rt_cbsys_exec>
1c009a3a:	2e840413          	addi	s0,s0,744 # 1c0002e8 <dtor_list+0x4>
1c009a3e:	401c                	lw	a5,0(s0)
1c009a40:	e789                	bnez	a5,1c009a4a <__rt_deinit+0x30>
1c009a42:	40b2                	lw	ra,12(sp)
1c009a44:	4422                	lw	s0,8(sp)
1c009a46:	0141                	addi	sp,sp,16
1c009a48:	8082                	ret
1c009a4a:	9782                	jalr	a5
1c009a4c:	0411                	addi	s0,s0,4
1c009a4e:	bfc5                	j	1c009a3e <__rt_deinit+0x24>

1c009a50 <pi_open_from_conf>:
1c009a50:	c14c                	sw	a1,4(a0)
1c009a52:	8082                	ret

1c009a54 <rt_irq_set_handler>:
1c009a54:	f14027f3          	csrr	a5,mhartid
1c009a58:	8795                	srai	a5,a5,0x5
1c009a5a:	03f7f793          	andi	a5,a5,63
1c009a5e:	477d                	li	a4,31
1c009a60:	04e79063          	bne	a5,a4,1c009aa0 <rt_irq_set_handler+0x4c>
1c009a64:	1a1047b7          	lui	a5,0x1a104
1c009a68:	43dc                	lw	a5,4(a5)
1c009a6a:	050a                	slli	a0,a0,0x2
1c009a6c:	8d89                	sub	a1,a1,a0
1c009a6e:	8d9d                	sub	a1,a1,a5
1c009a70:	000ff737          	lui	a4,0xff
1c009a74:	00f506b3          	add	a3,a0,a5
1c009a78:	8f6d                	and	a4,a4,a1
1c009a7a:	0145d793          	srli	a5,a1,0x14
1c009a7e:	06f76713          	ori	a4,a4,111
1c009a82:	07fe                	slli	a5,a5,0x1f
1c009a84:	8fd9                	or	a5,a5,a4
1c009a86:	7fe00637          	lui	a2,0x7fe00
1c009a8a:	01459713          	slli	a4,a1,0x14
1c009a8e:	8f71                	and	a4,a4,a2
1c009a90:	8fd9                	or	a5,a5,a4
1c009a92:	05a6                	slli	a1,a1,0x9
1c009a94:	00100737          	lui	a4,0x100
1c009a98:	8df9                	and	a1,a1,a4
1c009a9a:	8ddd                	or	a1,a1,a5
1c009a9c:	c28c                	sw	a1,0(a3)
1c009a9e:	8082                	ret
1c009aa0:	002007b7          	lui	a5,0x200
1c009aa4:	43bc                	lw	a5,64(a5)
1c009aa6:	b7d1                	j	1c009a6a <rt_irq_set_handler+0x16>

1c009aa8 <illegal_insn_handler_c>:
1c009aa8:	8082                	ret

1c009aaa <__rt_handle_illegal_instr>:
1c009aaa:	1c0017b7          	lui	a5,0x1c001
1c009aae:	e347a703          	lw	a4,-460(a5) # 1c000e34 <__rt_debug_config>
1c009ab2:	1141                	addi	sp,sp,-16
1c009ab4:	c422                	sw	s0,8(sp)
1c009ab6:	c606                	sw	ra,12(sp)
1c009ab8:	8b05                	andi	a4,a4,1
1c009aba:	843e                	mv	s0,a5
1c009abc:	c30d                	beqz	a4,1c009ade <__rt_handle_illegal_instr+0x34>
1c009abe:	341026f3          	csrr	a3,mepc
1c009ac2:	f1402673          	csrr	a2,mhartid
1c009ac6:	1c000537          	lui	a0,0x1c000
1c009aca:	4298                	lw	a4,0(a3)
1c009acc:	40565593          	srai	a1,a2,0x5
1c009ad0:	03f5f593          	andi	a1,a1,63
1c009ad4:	8a7d                	andi	a2,a2,31
1c009ad6:	57c50513          	addi	a0,a0,1404 # 1c00057c <__DTOR_END__+0x290>
1c009ada:	448010ef          	jal	ra,1c00af22 <printf>
1c009ade:	e3442783          	lw	a5,-460(s0)
1c009ae2:	8385                	srli	a5,a5,0x1
1c009ae4:	8b85                	andi	a5,a5,1
1c009ae6:	c399                	beqz	a5,1c009aec <__rt_handle_illegal_instr+0x42>
1c009ae8:	3c6010ef          	jal	ra,1c00aeae <abort>
1c009aec:	4422                	lw	s0,8(sp)
1c009aee:	40b2                	lw	ra,12(sp)
1c009af0:	0141                	addi	sp,sp,16
1c009af2:	fb7ff06f          	j	1c009aa8 <illegal_insn_handler_c>

1c009af6 <__rt_irq_init>:
1c009af6:	f14027f3          	csrr	a5,mhartid
1c009afa:	8795                	srai	a5,a5,0x5
1c009afc:	03f7f793          	andi	a5,a5,63
1c009b00:	477d                	li	a4,31
1c009b02:	02e79763          	bne	a5,a4,1c009b30 <__rt_irq_init+0x3a>
1c009b06:	1a10a7b7          	lui	a5,0x1a10a
1c009b0a:	577d                	li	a4,-1
1c009b0c:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_end+0xa1073fc>
1c009b10:	f14027f3          	csrr	a5,mhartid
1c009b14:	8795                	srai	a5,a5,0x5
1c009b16:	1c008737          	lui	a4,0x1c008
1c009b1a:	03f7f793          	andi	a5,a5,63
1c009b1e:	46fd                	li	a3,31
1c009b20:	00070713          	mv	a4,a4
1c009b24:	00d79b63          	bne	a5,a3,1c009b3a <__rt_irq_init+0x44>
1c009b28:	1a1047b7          	lui	a5,0x1a104
1c009b2c:	c3d8                	sw	a4,4(a5)
1c009b2e:	8082                	ret
1c009b30:	002047b7          	lui	a5,0x204
1c009b34:	577d                	li	a4,-1
1c009b36:	cb98                	sw	a4,16(a5)
1c009b38:	bfe1                	j	1c009b10 <__rt_irq_init+0x1a>
1c009b3a:	002007b7          	lui	a5,0x200
1c009b3e:	c3b8                	sw	a4,64(a5)
1c009b40:	8082                	ret

1c009b42 <__rt_fc_cluster_lock_req>:
1c009b42:	1141                	addi	sp,sp,-16
1c009b44:	c606                	sw	ra,12(sp)
1c009b46:	c422                	sw	s0,8(sp)
1c009b48:	c226                	sw	s1,4(sp)
1c009b4a:	300474f3          	csrrci	s1,mstatus,8
1c009b4e:	09654703          	lbu	a4,150(a0)
1c009b52:	411c                	lw	a5,0(a0)
1c009b54:	c729                	beqz	a4,1c009b9e <__rt_fc_cluster_lock_req+0x5c>
1c009b56:	4398                	lw	a4,0(a5)
1c009b58:	c30d                	beqz	a4,1c009b7a <__rt_fc_cluster_lock_req+0x38>
1c009b5a:	43d8                	lw	a4,4(a5)
1c009b5c:	cf09                	beqz	a4,1c009b76 <__rt_fc_cluster_lock_req+0x34>
1c009b5e:	4798                	lw	a4,8(a5)
1c009b60:	c348                	sw	a0,4(a4)
1c009b62:	c788                	sw	a0,8(a5)
1c009b64:	00052223          	sw	zero,4(a0)
1c009b68:	30049073          	csrw	mstatus,s1
1c009b6c:	40b2                	lw	ra,12(sp)
1c009b6e:	4422                	lw	s0,8(sp)
1c009b70:	4492                	lw	s1,4(sp)
1c009b72:	0141                	addi	sp,sp,16
1c009b74:	8082                	ret
1c009b76:	c3c8                	sw	a0,4(a5)
1c009b78:	b7ed                	j	1c009b62 <__rt_fc_cluster_lock_req+0x20>
1c009b7a:	4705                	li	a4,1
1c009b7c:	08e50a23          	sb	a4,148(a0)
1c009b80:	4705                	li	a4,1
1c009b82:	c398                	sw	a4,0(a5)
1c009b84:	09554783          	lbu	a5,149(a0)
1c009b88:	04078793          	addi	a5,a5,64 # 200040 <__l1_heap_size+0x1f244c>
1c009b8c:	00201737          	lui	a4,0x201
1c009b90:	07da                	slli	a5,a5,0x16
1c009b92:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3210>
1c009b96:	97ba                	add	a5,a5,a4
1c009b98:	0007a023          	sw	zero,0(a5)
1c009b9c:	b7f1                	j	1c009b68 <__rt_fc_cluster_lock_req+0x26>
1c009b9e:	842a                	mv	s0,a0
1c009ba0:	47c8                	lw	a0,12(a5)
1c009ba2:	cd01                	beqz	a0,1c009bba <__rt_fc_cluster_lock_req+0x78>
1c009ba4:	0007a023          	sw	zero,0(a5)
1c009ba8:	0007a623          	sw	zero,12(a5)
1c009bac:	2185                	jal	1c00a00c <__rt_thread_wakeup>
1c009bae:	4785                	li	a5,1
1c009bb0:	08f40a23          	sb	a5,148(s0)
1c009bb4:	09544783          	lbu	a5,149(s0)
1c009bb8:	bfc1                	j	1c009b88 <__rt_fc_cluster_lock_req+0x46>
1c009bba:	43d8                	lw	a4,4(a5)
1c009bbc:	e701                	bnez	a4,1c009bc4 <__rt_fc_cluster_lock_req+0x82>
1c009bbe:	0007a023          	sw	zero,0(a5)
1c009bc2:	b7f5                	j	1c009bae <__rt_fc_cluster_lock_req+0x6c>
1c009bc4:	4354                	lw	a3,4(a4)
1c009bc6:	c3d4                	sw	a3,4(a5)
1c009bc8:	4785                	li	a5,1
1c009bca:	08f70a23          	sb	a5,148(a4)
1c009bce:	09574783          	lbu	a5,149(a4)
1c009bd2:	00201737          	lui	a4,0x201
1c009bd6:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3210>
1c009bda:	04078793          	addi	a5,a5,64
1c009bde:	07da                	slli	a5,a5,0x16
1c009be0:	97ba                	add	a5,a5,a4
1c009be2:	bff1                	j	1c009bbe <__rt_fc_cluster_lock_req+0x7c>

1c009be4 <__rt_cbsys_add>:
1c009be4:	1101                	addi	sp,sp,-32
1c009be6:	cc22                	sw	s0,24(sp)
1c009be8:	ca26                	sw	s1,20(sp)
1c009bea:	842a                	mv	s0,a0
1c009bec:	84ae                	mv	s1,a1
1c009bee:	4501                	li	a0,0
1c009bf0:	45b1                	li	a1,12
1c009bf2:	c632                	sw	a2,12(sp)
1c009bf4:	ce06                	sw	ra,28(sp)
1c009bf6:	d66ff0ef          	jal	ra,1c00915c <rt_alloc>
1c009bfa:	4632                	lw	a2,12(sp)
1c009bfc:	c115                	beqz	a0,1c009c20 <__rt_cbsys_add+0x3c>
1c009bfe:	1c0017b7          	lui	a5,0x1c001
1c009c02:	040a                	slli	s0,s0,0x2
1c009c04:	e3878793          	addi	a5,a5,-456 # 1c000e38 <cbsys_first>
1c009c08:	97a2                	add	a5,a5,s0
1c009c0a:	4398                	lw	a4,0(a5)
1c009c0c:	c104                	sw	s1,0(a0)
1c009c0e:	c150                	sw	a2,4(a0)
1c009c10:	c518                	sw	a4,8(a0)
1c009c12:	c388                	sw	a0,0(a5)
1c009c14:	4501                	li	a0,0
1c009c16:	40f2                	lw	ra,28(sp)
1c009c18:	4462                	lw	s0,24(sp)
1c009c1a:	44d2                	lw	s1,20(sp)
1c009c1c:	6105                	addi	sp,sp,32
1c009c1e:	8082                	ret
1c009c20:	557d                	li	a0,-1
1c009c22:	bfd5                	j	1c009c16 <__rt_cbsys_add+0x32>

1c009c24 <__rt_cbsys_exec>:
1c009c24:	00251793          	slli	a5,a0,0x2
1c009c28:	1c001537          	lui	a0,0x1c001
1c009c2c:	e3850513          	addi	a0,a0,-456 # 1c000e38 <cbsys_first>
1c009c30:	1141                	addi	sp,sp,-16
1c009c32:	953e                	add	a0,a0,a5
1c009c34:	c422                	sw	s0,8(sp)
1c009c36:	4100                	lw	s0,0(a0)
1c009c38:	c606                	sw	ra,12(sp)
1c009c3a:	e411                	bnez	s0,1c009c46 <__rt_cbsys_exec+0x22>
1c009c3c:	4501                	li	a0,0
1c009c3e:	40b2                	lw	ra,12(sp)
1c009c40:	4422                	lw	s0,8(sp)
1c009c42:	0141                	addi	sp,sp,16
1c009c44:	8082                	ret
1c009c46:	401c                	lw	a5,0(s0)
1c009c48:	4048                	lw	a0,4(s0)
1c009c4a:	9782                	jalr	a5
1c009c4c:	e119                	bnez	a0,1c009c52 <__rt_cbsys_exec+0x2e>
1c009c4e:	4400                	lw	s0,8(s0)
1c009c50:	b7ed                	j	1c009c3a <__rt_cbsys_exec+0x16>
1c009c52:	557d                	li	a0,-1
1c009c54:	b7ed                	j	1c009c3e <__rt_cbsys_exec+0x1a>

1c009c56 <__rt_utils_init>:
1c009c56:	1c0017b7          	lui	a5,0x1c001
1c009c5a:	e3878793          	addi	a5,a5,-456 # 1c000e38 <cbsys_first>
1c009c5e:	0007a023          	sw	zero,0(a5)
1c009c62:	0007a223          	sw	zero,4(a5)
1c009c66:	0007a423          	sw	zero,8(a5)
1c009c6a:	0007a623          	sw	zero,12(a5)
1c009c6e:	0007a823          	sw	zero,16(a5)
1c009c72:	0007aa23          	sw	zero,20(a5)
1c009c76:	8082                	ret

1c009c78 <__rt_fc_lock>:
1c009c78:	1141                	addi	sp,sp,-16
1c009c7a:	c422                	sw	s0,8(sp)
1c009c7c:	842a                	mv	s0,a0
1c009c7e:	c606                	sw	ra,12(sp)
1c009c80:	c226                	sw	s1,4(sp)
1c009c82:	c04a                	sw	s2,0(sp)
1c009c84:	300474f3          	csrrci	s1,mstatus,8
1c009c88:	401c                	lw	a5,0(s0)
1c009c8a:	eb99                	bnez	a5,1c009ca0 <__rt_fc_lock+0x28>
1c009c8c:	4785                	li	a5,1
1c009c8e:	c01c                	sw	a5,0(s0)
1c009c90:	30049073          	csrw	mstatus,s1
1c009c94:	40b2                	lw	ra,12(sp)
1c009c96:	4422                	lw	s0,8(sp)
1c009c98:	4492                	lw	s1,4(sp)
1c009c9a:	4902                	lw	s2,0(sp)
1c009c9c:	0141                	addi	sp,sp,16
1c009c9e:	8082                	ret
1c009ca0:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009ca4:	4585                	li	a1,1
1c009ca6:	e3ff6517          	auipc	a0,0xe3ff6
1c009caa:	38250513          	addi	a0,a0,898 # 28 <__rt_sched>
1c009cae:	c45c                	sw	a5,12(s0)
1c009cb0:	29f1                	jal	1c00a18c <__rt_event_execute>
1c009cb2:	bfd9                	j	1c009c88 <__rt_fc_lock+0x10>

1c009cb4 <__rt_fc_unlock>:
1c009cb4:	300476f3          	csrrci	a3,mstatus,8
1c009cb8:	415c                	lw	a5,4(a0)
1c009cba:	e791                	bnez	a5,1c009cc6 <__rt_fc_unlock+0x12>
1c009cbc:	00052023          	sw	zero,0(a0)
1c009cc0:	30069073          	csrw	mstatus,a3
1c009cc4:	8082                	ret
1c009cc6:	43d8                	lw	a4,4(a5)
1c009cc8:	c158                	sw	a4,4(a0)
1c009cca:	4705                	li	a4,1
1c009ccc:	08e78a23          	sb	a4,148(a5)
1c009cd0:	0957c783          	lbu	a5,149(a5)
1c009cd4:	00201737          	lui	a4,0x201
1c009cd8:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3210>
1c009cdc:	04078793          	addi	a5,a5,64
1c009ce0:	07da                	slli	a5,a5,0x16
1c009ce2:	97ba                	add	a5,a5,a4
1c009ce4:	0007a023          	sw	zero,0(a5)
1c009ce8:	bfe1                	j	1c009cc0 <__rt_fc_unlock+0xc>

1c009cea <__rt_fc_cluster_lock>:
1c009cea:	f14027f3          	csrr	a5,mhartid
1c009cee:	8795                	srai	a5,a5,0x5
1c009cf0:	03f7f793          	andi	a5,a5,63
1c009cf4:	08f58aa3          	sb	a5,149(a1)
1c009cf8:	4785                	li	a5,1
1c009cfa:	08f58b23          	sb	a5,150(a1)
1c009cfe:	1c00a7b7          	lui	a5,0x1c00a
1c009d02:	b4278793          	addi	a5,a5,-1214 # 1c009b42 <__rt_fc_cluster_lock_req>
1c009d06:	c188                	sw	a0,0(a1)
1c009d08:	08058a23          	sb	zero,148(a1)
1c009d0c:	0205a423          	sw	zero,40(a1)
1c009d10:	0205a623          	sw	zero,44(a1)
1c009d14:	c59c                	sw	a5,8(a1)
1c009d16:	c5cc                	sw	a1,12(a1)
1c009d18:	05a1                	addi	a1,a1,8
1c009d1a:	0015e513          	ori	a0,a1,1
1c009d1e:	8a5ff06f          	j	1c0095c2 <__rt_cluster_push_fc_event>

1c009d22 <__rt_fc_cluster_unlock>:
1c009d22:	f14027f3          	csrr	a5,mhartid
1c009d26:	8795                	srai	a5,a5,0x5
1c009d28:	03f7f793          	andi	a5,a5,63
1c009d2c:	08f58aa3          	sb	a5,149(a1)
1c009d30:	1c00a7b7          	lui	a5,0x1c00a
1c009d34:	b4278793          	addi	a5,a5,-1214 # 1c009b42 <__rt_fc_cluster_lock_req>
1c009d38:	c188                	sw	a0,0(a1)
1c009d3a:	08058a23          	sb	zero,148(a1)
1c009d3e:	08058b23          	sb	zero,150(a1)
1c009d42:	0205a423          	sw	zero,40(a1)
1c009d46:	0205a623          	sw	zero,44(a1)
1c009d4a:	c59c                	sw	a5,8(a1)
1c009d4c:	c5cc                	sw	a1,12(a1)
1c009d4e:	05a1                	addi	a1,a1,8
1c009d50:	0015e513          	ori	a0,a1,1
1c009d54:	86fff06f          	j	1c0095c2 <__rt_cluster_push_fc_event>

1c009d58 <__rt_event_enqueue>:
1c009d58:	02802783          	lw	a5,40(zero) # 28 <__rt_sched>
1c009d5c:	00052c23          	sw	zero,24(a0)
1c009d60:	c799                	beqz	a5,1c009d6e <__rt_event_enqueue+0x16>
1c009d62:	02c02783          	lw	a5,44(zero) # 2c <__rt_sched+0x4>
1c009d66:	cf88                	sw	a0,24(a5)
1c009d68:	02a02623          	sw	a0,44(zero) # 2c <__rt_sched+0x4>
1c009d6c:	8082                	ret
1c009d6e:	02a02423          	sw	a0,40(zero) # 28 <__rt_sched>
1c009d72:	bfdd                	j	1c009d68 <__rt_event_enqueue+0x10>

1c009d74 <__rt_bridge_check_bridge_req.part.5>:
1c009d74:	1c001737          	lui	a4,0x1c001
1c009d78:	f4c70793          	addi	a5,a4,-180 # 1c000f4c <__hal_debug_struct>
1c009d7c:	0a47a783          	lw	a5,164(a5)
1c009d80:	f4c70713          	addi	a4,a4,-180
1c009d84:	c789                	beqz	a5,1c009d8e <__rt_bridge_check_bridge_req.part.5+0x1a>
1c009d86:	4f94                	lw	a3,24(a5)
1c009d88:	e681                	bnez	a3,1c009d90 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c009d8a:	0af72623          	sw	a5,172(a4)
1c009d8e:	8082                	ret
1c009d90:	479c                	lw	a5,8(a5)
1c009d92:	bfcd                	j	1c009d84 <__rt_bridge_check_bridge_req.part.5+0x10>

1c009d94 <__rt_bridge_wait>:
1c009d94:	f14027f3          	csrr	a5,mhartid
1c009d98:	8795                	srai	a5,a5,0x5
1c009d9a:	03f7f793          	andi	a5,a5,63
1c009d9e:	477d                	li	a4,31
1c009da0:	02e79a63          	bne	a5,a4,1c009dd4 <__rt_bridge_wait+0x40>
1c009da4:	1a10a7b7          	lui	a5,0x1a10a
1c009da8:	6711                	lui	a4,0x4
1c009daa:	300476f3          	csrrci	a3,mstatus,8
1c009dae:	80c7a603          	lw	a2,-2036(a5) # 1a10980c <__l1_end+0xa107400>
1c009db2:	01161593          	slli	a1,a2,0x11
1c009db6:	0005cb63          	bltz	a1,1c009dcc <__rt_bridge_wait+0x38>
1c009dba:	80e7a223          	sw	a4,-2044(a5)
1c009dbe:	10500073          	wfi
1c009dc2:	80e7a423          	sw	a4,-2040(a5)
1c009dc6:	30069073          	csrw	mstatus,a3
1c009dca:	b7c5                	j	1c009daa <__rt_bridge_wait+0x16>
1c009dcc:	80e7aa23          	sw	a4,-2028(a5)
1c009dd0:	30069073          	csrw	mstatus,a3
1c009dd4:	8082                	ret

1c009dd6 <__rt_bridge_handle_notif>:
1c009dd6:	1141                	addi	sp,sp,-16
1c009dd8:	c422                	sw	s0,8(sp)
1c009dda:	1c001437          	lui	s0,0x1c001
1c009dde:	f4c40793          	addi	a5,s0,-180 # 1c000f4c <__hal_debug_struct>
1c009de2:	0a47a783          	lw	a5,164(a5)
1c009de6:	c606                	sw	ra,12(sp)
1c009de8:	c226                	sw	s1,4(sp)
1c009dea:	c04a                	sw	s2,0(sp)
1c009dec:	f4c40413          	addi	s0,s0,-180
1c009df0:	c399                	beqz	a5,1c009df6 <__rt_bridge_handle_notif+0x20>
1c009df2:	4bd8                	lw	a4,20(a5)
1c009df4:	e30d                	bnez	a4,1c009e16 <__rt_bridge_handle_notif+0x40>
1c009df6:	0b442783          	lw	a5,180(s0)
1c009dfa:	c789                	beqz	a5,1c009e04 <__rt_bridge_handle_notif+0x2e>
1c009dfc:	43a8                	lw	a0,64(a5)
1c009dfe:	0a042a23          	sw	zero,180(s0)
1c009e02:	3f99                	jal	1c009d58 <__rt_event_enqueue>
1c009e04:	0ac42783          	lw	a5,172(s0)
1c009e08:	eb95                	bnez	a5,1c009e3c <__rt_bridge_handle_notif+0x66>
1c009e0a:	4422                	lw	s0,8(sp)
1c009e0c:	40b2                	lw	ra,12(sp)
1c009e0e:	4492                	lw	s1,4(sp)
1c009e10:	4902                	lw	s2,0(sp)
1c009e12:	0141                	addi	sp,sp,16
1c009e14:	b785                	j	1c009d74 <__rt_bridge_check_bridge_req.part.5>
1c009e16:	4784                	lw	s1,8(a5)
1c009e18:	4fd8                	lw	a4,28(a5)
1c009e1a:	0a942223          	sw	s1,164(s0)
1c009e1e:	cb01                	beqz	a4,1c009e2e <__rt_bridge_handle_notif+0x58>
1c009e20:	0b042703          	lw	a4,176(s0)
1c009e24:	c798                	sw	a4,8(a5)
1c009e26:	0af42823          	sw	a5,176(s0)
1c009e2a:	87a6                	mv	a5,s1
1c009e2c:	b7d1                	j	1c009df0 <__rt_bridge_handle_notif+0x1a>
1c009e2e:	43a8                	lw	a0,64(a5)
1c009e30:	30047973          	csrrci	s2,mstatus,8
1c009e34:	3715                	jal	1c009d58 <__rt_event_enqueue>
1c009e36:	30091073          	csrw	mstatus,s2
1c009e3a:	bfc5                	j	1c009e2a <__rt_bridge_handle_notif+0x54>
1c009e3c:	40b2                	lw	ra,12(sp)
1c009e3e:	4422                	lw	s0,8(sp)
1c009e40:	4492                	lw	s1,4(sp)
1c009e42:	4902                	lw	s2,0(sp)
1c009e44:	0141                	addi	sp,sp,16
1c009e46:	8082                	ret

1c009e48 <__rt_bridge_check_connection>:
1c009e48:	1c001737          	lui	a4,0x1c001
1c009e4c:	f4c70713          	addi	a4,a4,-180 # 1c000f4c <__hal_debug_struct>
1c009e50:	471c                	lw	a5,8(a4)
1c009e52:	ef95                	bnez	a5,1c009e8e <__rt_bridge_check_connection+0x46>
1c009e54:	1a1047b7          	lui	a5,0x1a104
1c009e58:	5bfc                	lw	a5,116(a5)
1c009e5a:	469d                	li	a3,7
1c009e5c:	83a5                	srli	a5,a5,0x9
1c009e5e:	8b9d                	andi	a5,a5,7
1c009e60:	02d79763          	bne	a5,a3,1c009e8e <__rt_bridge_check_connection+0x46>
1c009e64:	1141                	addi	sp,sp,-16
1c009e66:	c422                	sw	s0,8(sp)
1c009e68:	c226                	sw	s1,4(sp)
1c009e6a:	c606                	sw	ra,12(sp)
1c009e6c:	4785                	li	a5,1
1c009e6e:	c71c                	sw	a5,8(a4)
1c009e70:	1a1044b7          	lui	s1,0x1a104
1c009e74:	441d                	li	s0,7
1c009e76:	58fc                	lw	a5,116(s1)
1c009e78:	83a5                	srli	a5,a5,0x9
1c009e7a:	8b9d                	andi	a5,a5,7
1c009e7c:	00878763          	beq	a5,s0,1c009e8a <__rt_bridge_check_connection+0x42>
1c009e80:	40b2                	lw	ra,12(sp)
1c009e82:	4422                	lw	s0,8(sp)
1c009e84:	4492                	lw	s1,4(sp)
1c009e86:	0141                	addi	sp,sp,16
1c009e88:	8082                	ret
1c009e8a:	3729                	jal	1c009d94 <__rt_bridge_wait>
1c009e8c:	b7ed                	j	1c009e76 <__rt_bridge_check_connection+0x2e>
1c009e8e:	8082                	ret

1c009e90 <__rt_bridge_set_available>:
1c009e90:	1c0017b7          	lui	a5,0x1c001
1c009e94:	f4c78793          	addi	a5,a5,-180 # 1c000f4c <__hal_debug_struct>
1c009e98:	479c                	lw	a5,8(a5)
1c009e9a:	8082                	ret

1c009e9c <__rt_bridge_send_notif>:
1c009e9c:	1141                	addi	sp,sp,-16
1c009e9e:	c606                	sw	ra,12(sp)
1c009ea0:	3765                	jal	1c009e48 <__rt_bridge_check_connection>
1c009ea2:	40b2                	lw	ra,12(sp)
1c009ea4:	1c0017b7          	lui	a5,0x1c001
1c009ea8:	f4c78793          	addi	a5,a5,-180 # 1c000f4c <__hal_debug_struct>
1c009eac:	479c                	lw	a5,8(a5)
1c009eae:	0141                	addi	sp,sp,16
1c009eb0:	8082                	ret

1c009eb2 <__rt_bridge_clear_notif>:
1c009eb2:	1141                	addi	sp,sp,-16
1c009eb4:	c606                	sw	ra,12(sp)
1c009eb6:	3f49                	jal	1c009e48 <__rt_bridge_check_connection>
1c009eb8:	1c0017b7          	lui	a5,0x1c001
1c009ebc:	f4c78793          	addi	a5,a5,-180 # 1c000f4c <__hal_debug_struct>
1c009ec0:	4798                	lw	a4,8(a5)
1c009ec2:	c311                	beqz	a4,1c009ec6 <__rt_bridge_clear_notif+0x14>
1c009ec4:	479c                	lw	a5,8(a5)
1c009ec6:	40b2                	lw	ra,12(sp)
1c009ec8:	0141                	addi	sp,sp,16
1c009eca:	8082                	ret

1c009ecc <__rt_bridge_printf_flush>:
1c009ecc:	1141                	addi	sp,sp,-16
1c009ece:	c422                	sw	s0,8(sp)
1c009ed0:	c606                	sw	ra,12(sp)
1c009ed2:	1c001437          	lui	s0,0x1c001
1c009ed6:	3f8d                	jal	1c009e48 <__rt_bridge_check_connection>
1c009ed8:	f4c40793          	addi	a5,s0,-180 # 1c000f4c <__hal_debug_struct>
1c009edc:	479c                	lw	a5,8(a5)
1c009ede:	c385                	beqz	a5,1c009efe <__rt_bridge_printf_flush+0x32>
1c009ee0:	f4c40413          	addi	s0,s0,-180
1c009ee4:	485c                	lw	a5,20(s0)
1c009ee6:	e399                	bnez	a5,1c009eec <__rt_bridge_printf_flush+0x20>
1c009ee8:	4c1c                	lw	a5,24(s0)
1c009eea:	cb91                	beqz	a5,1c009efe <__rt_bridge_printf_flush+0x32>
1c009eec:	3f45                	jal	1c009e9c <__rt_bridge_send_notif>
1c009eee:	485c                	lw	a5,20(s0)
1c009ef0:	e789                	bnez	a5,1c009efa <__rt_bridge_printf_flush+0x2e>
1c009ef2:	4422                	lw	s0,8(sp)
1c009ef4:	40b2                	lw	ra,12(sp)
1c009ef6:	0141                	addi	sp,sp,16
1c009ef8:	bf6d                	j	1c009eb2 <__rt_bridge_clear_notif>
1c009efa:	3d69                	jal	1c009d94 <__rt_bridge_wait>
1c009efc:	bfcd                	j	1c009eee <__rt_bridge_printf_flush+0x22>
1c009efe:	40b2                	lw	ra,12(sp)
1c009f00:	4422                	lw	s0,8(sp)
1c009f02:	0141                	addi	sp,sp,16
1c009f04:	8082                	ret

1c009f06 <__rt_bridge_req_shutdown>:
1c009f06:	1141                	addi	sp,sp,-16
1c009f08:	c606                	sw	ra,12(sp)
1c009f0a:	c422                	sw	s0,8(sp)
1c009f0c:	c226                	sw	s1,4(sp)
1c009f0e:	3f2d                	jal	1c009e48 <__rt_bridge_check_connection>
1c009f10:	1c0017b7          	lui	a5,0x1c001
1c009f14:	f4c78793          	addi	a5,a5,-180 # 1c000f4c <__hal_debug_struct>
1c009f18:	479c                	lw	a5,8(a5)
1c009f1a:	cb95                	beqz	a5,1c009f4e <__rt_bridge_req_shutdown+0x48>
1c009f1c:	3f45                	jal	1c009ecc <__rt_bridge_printf_flush>
1c009f1e:	1a1044b7          	lui	s1,0x1a104
1c009f22:	441d                	li	s0,7
1c009f24:	58fc                	lw	a5,116(s1)
1c009f26:	83a5                	srli	a5,a5,0x9
1c009f28:	8b9d                	andi	a5,a5,7
1c009f2a:	02878763          	beq	a5,s0,1c009f58 <__rt_bridge_req_shutdown+0x52>
1c009f2e:	1a1044b7          	lui	s1,0x1a104
1c009f32:	441d                	li	s0,7
1c009f34:	58fc                	lw	a5,116(s1)
1c009f36:	83a5                	srli	a5,a5,0x9
1c009f38:	8b9d                	andi	a5,a5,7
1c009f3a:	02879163          	bne	a5,s0,1c009f5c <__rt_bridge_req_shutdown+0x56>
1c009f3e:	1a1044b7          	lui	s1,0x1a104
1c009f42:	441d                	li	s0,7
1c009f44:	58fc                	lw	a5,116(s1)
1c009f46:	83a5                	srli	a5,a5,0x9
1c009f48:	8b9d                	andi	a5,a5,7
1c009f4a:	00878b63          	beq	a5,s0,1c009f60 <__rt_bridge_req_shutdown+0x5a>
1c009f4e:	40b2                	lw	ra,12(sp)
1c009f50:	4422                	lw	s0,8(sp)
1c009f52:	4492                	lw	s1,4(sp)
1c009f54:	0141                	addi	sp,sp,16
1c009f56:	8082                	ret
1c009f58:	3d35                	jal	1c009d94 <__rt_bridge_wait>
1c009f5a:	b7e9                	j	1c009f24 <__rt_bridge_req_shutdown+0x1e>
1c009f5c:	3d25                	jal	1c009d94 <__rt_bridge_wait>
1c009f5e:	bfd9                	j	1c009f34 <__rt_bridge_req_shutdown+0x2e>
1c009f60:	3d15                	jal	1c009d94 <__rt_bridge_wait>
1c009f62:	b7cd                	j	1c009f44 <__rt_bridge_req_shutdown+0x3e>

1c009f64 <__rt_bridge_init>:
1c009f64:	1c0017b7          	lui	a5,0x1c001
1c009f68:	1a10a737          	lui	a4,0x1a10a
1c009f6c:	f4c78793          	addi	a5,a5,-180 # 1c000f4c <__hal_debug_struct>
1c009f70:	81070713          	addi	a4,a4,-2032 # 1a109810 <__l1_end+0xa107404>
1c009f74:	0ae7ac23          	sw	a4,184(a5)
1c009f78:	4741                	li	a4,16
1c009f7a:	0a07a223          	sw	zero,164(a5)
1c009f7e:	0a07a623          	sw	zero,172(a5)
1c009f82:	0a07aa23          	sw	zero,180(a5)
1c009f86:	0ae7ae23          	sw	a4,188(a5)
1c009f8a:	00400793          	li	a5,4
1c009f8e:	0007a823          	sw	zero,16(a5)
1c009f92:	0007a023          	sw	zero,0(a5)
1c009f96:	8082                	ret

1c009f98 <__rt_thread_enqueue_ready>:
1c009f98:	01802703          	lw	a4,24(zero) # 18 <__rt_ready_queue>
1c009f9c:	02052c23          	sw	zero,56(a0)
1c009fa0:	01800793          	li	a5,24
1c009fa4:	e711                	bnez	a4,1c009fb0 <__rt_thread_enqueue_ready+0x18>
1c009fa6:	c388                	sw	a0,0(a5)
1c009fa8:	c3c8                	sw	a0,4(a5)
1c009faa:	0c052a23          	sw	zero,212(a0)
1c009fae:	8082                	ret
1c009fb0:	43d8                	lw	a4,4(a5)
1c009fb2:	df08                	sw	a0,56(a4)
1c009fb4:	bfd5                	j	1c009fa8 <__rt_thread_enqueue_ready+0x10>

1c009fb6 <__rt_thread_sleep>:
1c009fb6:	01800713          	li	a4,24
1c009fba:	4708                	lw	a0,8(a4)
1c009fbc:	01800793          	li	a5,24
1c009fc0:	438c                	lw	a1,0(a5)
1c009fc2:	c999                	beqz	a1,1c009fd8 <__rt_thread_sleep+0x22>
1c009fc4:	5d98                	lw	a4,56(a1)
1c009fc6:	c398                	sw	a4,0(a5)
1c009fc8:	4705                	li	a4,1
1c009fca:	0ce5aa23          	sw	a4,212(a1)
1c009fce:	00b50c63          	beq	a0,a1,1c009fe6 <__rt_thread_sleep+0x30>
1c009fd2:	c78c                	sw	a1,8(a5)
1c009fd4:	af0fe06f          	j	1c0082c4 <__rt_thread_switch>
1c009fd8:	10500073          	wfi
1c009fdc:	30045073          	csrwi	mstatus,8
1c009fe0:	30047773          	csrrci	a4,mstatus,8
1c009fe4:	bff1                	j	1c009fc0 <__rt_thread_sleep+0xa>
1c009fe6:	8082                	ret

1c009fe8 <rt_thread_exit>:
1c009fe8:	300477f3          	csrrci	a5,mstatus,8
1c009fec:	02002783          	lw	a5,32(zero) # 20 <__rt_thread_current>
1c009ff0:	4705                	li	a4,1
1c009ff2:	c3e8                	sw	a0,68(a5)
1c009ff4:	5fc8                	lw	a0,60(a5)
1c009ff6:	c3b8                	sw	a4,64(a5)
1c009ff8:	c909                	beqz	a0,1c00a00a <rt_thread_exit+0x22>
1c009ffa:	0d452783          	lw	a5,212(a0)
1c009ffe:	c791                	beqz	a5,1c00a00a <rt_thread_exit+0x22>
1c00a000:	1141                	addi	sp,sp,-16
1c00a002:	c606                	sw	ra,12(sp)
1c00a004:	3f51                	jal	1c009f98 <__rt_thread_enqueue_ready>
1c00a006:	40b2                	lw	ra,12(sp)
1c00a008:	0141                	addi	sp,sp,16
1c00a00a:	b775                	j	1c009fb6 <__rt_thread_sleep>

1c00a00c <__rt_thread_wakeup>:
1c00a00c:	5d18                	lw	a4,56(a0)
1c00a00e:	eb09                	bnez	a4,1c00a020 <__rt_thread_wakeup+0x14>
1c00a010:	02002703          	lw	a4,32(zero) # 20 <__rt_thread_current>
1c00a014:	00a70663          	beq	a4,a0,1c00a020 <__rt_thread_wakeup+0x14>
1c00a018:	0d452783          	lw	a5,212(a0)
1c00a01c:	c391                	beqz	a5,1c00a020 <__rt_thread_wakeup+0x14>
1c00a01e:	bfad                	j	1c009f98 <__rt_thread_enqueue_ready>
1c00a020:	8082                	ret

1c00a022 <__rt_thread_sched_init>:
1c00a022:	1141                	addi	sp,sp,-16
1c00a024:	c422                	sw	s0,8(sp)
1c00a026:	1c0087b7          	lui	a5,0x1c008
1c00a02a:	1c001437          	lui	s0,0x1c001
1c00a02e:	c226                	sw	s1,4(sp)
1c00a030:	c04a                	sw	s2,0(sp)
1c00a032:	c606                	sw	ra,12(sp)
1c00a034:	e5040413          	addi	s0,s0,-432 # 1c000e50 <__rt_thread_main>
1c00a038:	2be78793          	addi	a5,a5,702 # 1c0082be <__rt_thread_start>
1c00a03c:	c01c                	sw	a5,0(s0)
1c00a03e:	1c00a7b7          	lui	a5,0x1c00a
1c00a042:	04840913          	addi	s2,s0,72
1c00a046:	fe878793          	addi	a5,a5,-24 # 1c009fe8 <rt_thread_exit>
1c00a04a:	01800493          	li	s1,24
1c00a04e:	c45c                	sw	a5,12(s0)
1c00a050:	854a                	mv	a0,s2
1c00a052:	4785                	li	a5,1
1c00a054:	e3ff6597          	auipc	a1,0xe3ff6
1c00a058:	fd458593          	addi	a1,a1,-44 # 28 <__rt_sched>
1c00a05c:	0cf42a23          	sw	a5,212(s0)
1c00a060:	0004a023          	sw	zero,0(s1) # 1a104000 <__l1_end+0xa101bf4>
1c00a064:	02042a23          	sw	zero,52(s0)
1c00a068:	00042223          	sw	zero,4(s0)
1c00a06c:	00042423          	sw	zero,8(s0)
1c00a070:	2829                	jal	1c00a08a <__rt_event_init>
1c00a072:	02402783          	lw	a5,36(zero) # 24 <__rt_first_free>
1c00a076:	c480                	sw	s0,8(s1)
1c00a078:	40b2                	lw	ra,12(sp)
1c00a07a:	d03c                	sw	a5,96(s0)
1c00a07c:	4422                	lw	s0,8(sp)
1c00a07e:	03202223          	sw	s2,36(zero) # 24 <__rt_first_free>
1c00a082:	4492                	lw	s1,4(sp)
1c00a084:	4902                	lw	s2,0(sp)
1c00a086:	0141                	addi	sp,sp,16
1c00a088:	8082                	ret

1c00a08a <__rt_event_init>:
1c00a08a:	02052023          	sw	zero,32(a0)
1c00a08e:	02052223          	sw	zero,36(a0)
1c00a092:	02052823          	sw	zero,48(a0)
1c00a096:	00052023          	sw	zero,0(a0)
1c00a09a:	8082                	ret

1c00a09c <__rt_wait_event_prepare_blocking>:
1c00a09c:	02400793          	li	a5,36
1c00a0a0:	4388                	lw	a0,0(a5)
1c00a0a2:	4d18                	lw	a4,24(a0)
1c00a0a4:	02052223          	sw	zero,36(a0)
1c00a0a8:	c398                	sw	a4,0(a5)
1c00a0aa:	4785                	li	a5,1
1c00a0ac:	d11c                	sw	a5,32(a0)
1c00a0ae:	00052023          	sw	zero,0(a0)
1c00a0b2:	8082                	ret

1c00a0b4 <rt_event_alloc>:
1c00a0b4:	1141                	addi	sp,sp,-16
1c00a0b6:	c422                	sw	s0,8(sp)
1c00a0b8:	842e                	mv	s0,a1
1c00a0ba:	c606                	sw	ra,12(sp)
1c00a0bc:	c226                	sw	s1,4(sp)
1c00a0be:	300474f3          	csrrci	s1,mstatus,8
1c00a0c2:	f14027f3          	csrr	a5,mhartid
1c00a0c6:	8795                	srai	a5,a5,0x5
1c00a0c8:	03f7f793          	andi	a5,a5,63
1c00a0cc:	477d                	li	a4,31
1c00a0ce:	00378513          	addi	a0,a5,3
1c00a0d2:	00e79363          	bne	a5,a4,1c00a0d8 <rt_event_alloc+0x24>
1c00a0d6:	4501                	li	a0,0
1c00a0d8:	08c00593          	li	a1,140
1c00a0dc:	02b405b3          	mul	a1,s0,a1
1c00a0e0:	87cff0ef          	jal	ra,1c00915c <rt_alloc>
1c00a0e4:	87aa                	mv	a5,a0
1c00a0e6:	557d                	li	a0,-1
1c00a0e8:	cf91                	beqz	a5,1c00a104 <rt_event_alloc+0x50>
1c00a0ea:	02402683          	lw	a3,36(zero) # 24 <__rt_first_free>
1c00a0ee:	4581                	li	a1,0
1c00a0f0:	4601                	li	a2,0
1c00a0f2:	02400713          	li	a4,36
1c00a0f6:	00864c63          	blt	a2,s0,1c00a10e <rt_event_alloc+0x5a>
1c00a0fa:	c191                	beqz	a1,1c00a0fe <rt_event_alloc+0x4a>
1c00a0fc:	c314                	sw	a3,0(a4)
1c00a0fe:	30049073          	csrw	mstatus,s1
1c00a102:	4501                	li	a0,0
1c00a104:	40b2                	lw	ra,12(sp)
1c00a106:	4422                	lw	s0,8(sp)
1c00a108:	4492                	lw	s1,4(sp)
1c00a10a:	0141                	addi	sp,sp,16
1c00a10c:	8082                	ret
1c00a10e:	cf94                	sw	a3,24(a5)
1c00a110:	0207a023          	sw	zero,32(a5)
1c00a114:	0207a223          	sw	zero,36(a5)
1c00a118:	0207a823          	sw	zero,48(a5)
1c00a11c:	0007a023          	sw	zero,0(a5)
1c00a120:	86be                	mv	a3,a5
1c00a122:	0605                	addi	a2,a2,1
1c00a124:	4585                	li	a1,1
1c00a126:	08c78793          	addi	a5,a5,140
1c00a12a:	b7f1                	j	1c00a0f6 <rt_event_alloc+0x42>

1c00a12c <rt_event_get>:
1c00a12c:	30047773          	csrrci	a4,mstatus,8
1c00a130:	02400793          	li	a5,36
1c00a134:	4388                	lw	a0,0(a5)
1c00a136:	c509                	beqz	a0,1c00a140 <rt_event_get+0x14>
1c00a138:	4d14                	lw	a3,24(a0)
1c00a13a:	c150                	sw	a2,4(a0)
1c00a13c:	c394                	sw	a3,0(a5)
1c00a13e:	c10c                	sw	a1,0(a0)
1c00a140:	30071073          	csrw	mstatus,a4
1c00a144:	8082                	ret

1c00a146 <rt_event_get_blocking>:
1c00a146:	30047773          	csrrci	a4,mstatus,8
1c00a14a:	02400793          	li	a5,36
1c00a14e:	4388                	lw	a0,0(a5)
1c00a150:	c909                	beqz	a0,1c00a162 <rt_event_get_blocking+0x1c>
1c00a152:	4d14                	lw	a3,24(a0)
1c00a154:	00052223          	sw	zero,4(a0)
1c00a158:	c394                	sw	a3,0(a5)
1c00a15a:	4785                	li	a5,1
1c00a15c:	00052023          	sw	zero,0(a0)
1c00a160:	d11c                	sw	a5,32(a0)
1c00a162:	30071073          	csrw	mstatus,a4
1c00a166:	8082                	ret

1c00a168 <rt_event_push>:
1c00a168:	30047773          	csrrci	a4,mstatus,8
1c00a16c:	02400693          	li	a3,36
1c00a170:	42d4                	lw	a3,4(a3)
1c00a172:	00052c23          	sw	zero,24(a0)
1c00a176:	02400793          	li	a5,36
1c00a17a:	e691                	bnez	a3,1c00a186 <rt_event_push+0x1e>
1c00a17c:	c3c8                	sw	a0,4(a5)
1c00a17e:	c788                	sw	a0,8(a5)
1c00a180:	30071073          	csrw	mstatus,a4
1c00a184:	8082                	ret
1c00a186:	4794                	lw	a3,8(a5)
1c00a188:	ce88                	sw	a0,24(a3)
1c00a18a:	bfd5                	j	1c00a17e <rt_event_push+0x16>

1c00a18c <__rt_event_execute>:
1c00a18c:	1141                	addi	sp,sp,-16
1c00a18e:	c422                	sw	s0,8(sp)
1c00a190:	02400793          	li	a5,36
1c00a194:	43dc                	lw	a5,4(a5)
1c00a196:	c606                	sw	ra,12(sp)
1c00a198:	c226                	sw	s1,4(sp)
1c00a19a:	02400413          	li	s0,36
1c00a19e:	eb91                	bnez	a5,1c00a1b2 <__rt_event_execute+0x26>
1c00a1a0:	c1a9                	beqz	a1,1c00a1e2 <__rt_event_execute+0x56>
1c00a1a2:	10500073          	wfi
1c00a1a6:	30045073          	csrwi	mstatus,8
1c00a1aa:	300477f3          	csrrci	a5,mstatus,8
1c00a1ae:	405c                	lw	a5,4(s0)
1c00a1b0:	cb8d                	beqz	a5,1c00a1e2 <__rt_event_execute+0x56>
1c00a1b2:	4485                	li	s1,1
1c00a1b4:	4f98                	lw	a4,24(a5)
1c00a1b6:	53d4                	lw	a3,36(a5)
1c00a1b8:	00978823          	sb	s1,16(a5)
1c00a1bc:	c058                	sw	a4,4(s0)
1c00a1be:	43c8                	lw	a0,4(a5)
1c00a1c0:	4398                	lw	a4,0(a5)
1c00a1c2:	e691                	bnez	a3,1c00a1ce <__rt_event_execute+0x42>
1c00a1c4:	5394                	lw	a3,32(a5)
1c00a1c6:	e681                	bnez	a3,1c00a1ce <__rt_event_execute+0x42>
1c00a1c8:	4014                	lw	a3,0(s0)
1c00a1ca:	c01c                	sw	a5,0(s0)
1c00a1cc:	cf94                	sw	a3,24(a5)
1c00a1ce:	0207a023          	sw	zero,32(a5)
1c00a1d2:	c711                	beqz	a4,1c00a1de <__rt_event_execute+0x52>
1c00a1d4:	30045073          	csrwi	mstatus,8
1c00a1d8:	9702                	jalr	a4
1c00a1da:	300477f3          	csrrci	a5,mstatus,8
1c00a1de:	405c                	lw	a5,4(s0)
1c00a1e0:	fbf1                	bnez	a5,1c00a1b4 <__rt_event_execute+0x28>
1c00a1e2:	40b2                	lw	ra,12(sp)
1c00a1e4:	4422                	lw	s0,8(sp)
1c00a1e6:	4492                	lw	s1,4(sp)
1c00a1e8:	0141                	addi	sp,sp,16
1c00a1ea:	8082                	ret

1c00a1ec <__rt_wait_event>:
1c00a1ec:	1141                	addi	sp,sp,-16
1c00a1ee:	c422                	sw	s0,8(sp)
1c00a1f0:	c606                	sw	ra,12(sp)
1c00a1f2:	842a                	mv	s0,a0
1c00a1f4:	501c                	lw	a5,32(s0)
1c00a1f6:	ef81                	bnez	a5,1c00a20e <__rt_wait_event+0x22>
1c00a1f8:	581c                	lw	a5,48(s0)
1c00a1fa:	eb91                	bnez	a5,1c00a20e <__rt_wait_event+0x22>
1c00a1fc:	02400793          	li	a5,36
1c00a200:	4398                	lw	a4,0(a5)
1c00a202:	40b2                	lw	ra,12(sp)
1c00a204:	c380                	sw	s0,0(a5)
1c00a206:	cc18                	sw	a4,24(s0)
1c00a208:	4422                	lw	s0,8(sp)
1c00a20a:	0141                	addi	sp,sp,16
1c00a20c:	8082                	ret
1c00a20e:	4585                	li	a1,1
1c00a210:	4501                	li	a0,0
1c00a212:	3fad                	jal	1c00a18c <__rt_event_execute>
1c00a214:	b7c5                	j	1c00a1f4 <__rt_wait_event+0x8>

1c00a216 <rt_event_wait>:
1c00a216:	1141                	addi	sp,sp,-16
1c00a218:	c606                	sw	ra,12(sp)
1c00a21a:	c422                	sw	s0,8(sp)
1c00a21c:	30047473          	csrrci	s0,mstatus,8
1c00a220:	37f1                	jal	1c00a1ec <__rt_wait_event>
1c00a222:	30041073          	csrw	mstatus,s0
1c00a226:	40b2                	lw	ra,12(sp)
1c00a228:	4422                	lw	s0,8(sp)
1c00a22a:	0141                	addi	sp,sp,16
1c00a22c:	8082                	ret

1c00a22e <__rt_event_sched_init>:
1c00a22e:	02400513          	li	a0,36
1c00a232:	00052023          	sw	zero,0(a0)
1c00a236:	00052223          	sw	zero,4(a0)
1c00a23a:	4585                	li	a1,1
1c00a23c:	0511                	addi	a0,a0,4
1c00a23e:	bd9d                	j	1c00a0b4 <rt_event_alloc>

1c00a240 <__rt_time_poweroff>:
1c00a240:	1a10b7b7          	lui	a5,0x1a10b
1c00a244:	47d8                	lw	a4,12(a5)
1c00a246:	1c0017b7          	lui	a5,0x1c001
1c00a24a:	4501                	li	a0,0
1c00a24c:	10e7a023          	sw	a4,256(a5) # 1c001100 <timer_count>
1c00a250:	8082                	ret

1c00a252 <__rt_time_poweron>:
1c00a252:	1c0017b7          	lui	a5,0x1c001
1c00a256:	1007a703          	lw	a4,256(a5) # 1c001100 <timer_count>
1c00a25a:	1a10b7b7          	lui	a5,0x1a10b
1c00a25e:	4501                	li	a0,0
1c00a260:	c7d8                	sw	a4,12(a5)
1c00a262:	8082                	ret

1c00a264 <rt_event_push_delayed>:
1c00a264:	30047373          	csrrci	t1,mstatus,8
1c00a268:	1a10b6b7          	lui	a3,0x1a10b
1c00a26c:	46d0                	lw	a2,12(a3)
1c00a26e:	1c001737          	lui	a4,0x1c001
1c00a272:	16872783          	lw	a5,360(a4) # 1c001168 <first_delayed>
1c00a276:	86ba                	mv	a3,a4
1c00a278:	0005d363          	bgez	a1,1c00a27e <rt_event_push_delayed+0x1a>
1c00a27c:	4581                	li	a1,0
1c00a27e:	4779                	li	a4,30
1c00a280:	02e5c5b3          	div	a1,a1,a4
1c00a284:	80000737          	lui	a4,0x80000
1c00a288:	fff74713          	not	a4,a4
1c00a28c:	00e67833          	and	a6,a2,a4
1c00a290:	0585                	addi	a1,a1,1
1c00a292:	962e                	add	a2,a2,a1
1c00a294:	d950                	sw	a2,52(a0)
1c00a296:	982e                	add	a6,a6,a1
1c00a298:	4601                	li	a2,0
1c00a29a:	c799                	beqz	a5,1c00a2a8 <rt_event_push_delayed+0x44>
1c00a29c:	0347a883          	lw	a7,52(a5) # 1a10b034 <__l1_end+0xa108c28>
1c00a2a0:	00e8f8b3          	and	a7,a7,a4
1c00a2a4:	0108e863          	bltu	a7,a6,1c00a2b4 <rt_event_push_delayed+0x50>
1c00a2a8:	ca09                	beqz	a2,1c00a2ba <rt_event_push_delayed+0x56>
1c00a2aa:	ce08                	sw	a0,24(a2)
1c00a2ac:	cd1c                	sw	a5,24(a0)
1c00a2ae:	30031073          	csrw	mstatus,t1
1c00a2b2:	8082                	ret
1c00a2b4:	863e                	mv	a2,a5
1c00a2b6:	4f9c                	lw	a5,24(a5)
1c00a2b8:	b7cd                	j	1c00a29a <rt_event_push_delayed+0x36>
1c00a2ba:	cd1c                	sw	a5,24(a0)
1c00a2bc:	1a10b7b7          	lui	a5,0x1a10b
1c00a2c0:	47d8                	lw	a4,12(a5)
1c00a2c2:	16a6a423          	sw	a0,360(a3) # 1a10b168 <__l1_end+0xa108d5c>
1c00a2c6:	95ba                	add	a1,a1,a4
1c00a2c8:	cbcc                	sw	a1,20(a5)
1c00a2ca:	08500713          	li	a4,133
1c00a2ce:	c3d8                	sw	a4,4(a5)
1c00a2d0:	bff9                	j	1c00a2ae <rt_event_push_delayed+0x4a>

1c00a2d2 <rt_time_wait_us>:
1c00a2d2:	1101                	addi	sp,sp,-32
1c00a2d4:	85aa                	mv	a1,a0
1c00a2d6:	4501                	li	a0,0
1c00a2d8:	ce06                	sw	ra,28(sp)
1c00a2da:	cc22                	sw	s0,24(sp)
1c00a2dc:	c62e                	sw	a1,12(sp)
1c00a2de:	35a5                	jal	1c00a146 <rt_event_get_blocking>
1c00a2e0:	45b2                	lw	a1,12(sp)
1c00a2e2:	842a                	mv	s0,a0
1c00a2e4:	3741                	jal	1c00a264 <rt_event_push_delayed>
1c00a2e6:	8522                	mv	a0,s0
1c00a2e8:	4462                	lw	s0,24(sp)
1c00a2ea:	40f2                	lw	ra,28(sp)
1c00a2ec:	6105                	addi	sp,sp,32
1c00a2ee:	b725                	j	1c00a216 <rt_event_wait>

1c00a2f0 <__rt_time_init>:
1c00a2f0:	1141                	addi	sp,sp,-16
1c00a2f2:	1c0017b7          	lui	a5,0x1c001
1c00a2f6:	1607a423          	sw	zero,360(a5) # 1c001168 <first_delayed>
1c00a2fa:	08300713          	li	a4,131
1c00a2fe:	1a10b7b7          	lui	a5,0x1a10b
1c00a302:	c606                	sw	ra,12(sp)
1c00a304:	c422                	sw	s0,8(sp)
1c00a306:	1c00a5b7          	lui	a1,0x1c00a
1c00a30a:	c3d8                	sw	a4,4(a5)
1c00a30c:	38858593          	addi	a1,a1,904 # 1c00a388 <__rt_timer_handler>
1c00a310:	452d                	li	a0,11
1c00a312:	f42ff0ef          	jal	ra,1c009a54 <rt_irq_set_handler>
1c00a316:	f14027f3          	csrr	a5,mhartid
1c00a31a:	8795                	srai	a5,a5,0x5
1c00a31c:	6705                	lui	a4,0x1
1c00a31e:	03f7f793          	andi	a5,a5,63
1c00a322:	46fd                	li	a3,31
1c00a324:	80070713          	addi	a4,a4,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a328:	04d79863          	bne	a5,a3,1c00a378 <__rt_time_init+0x88>
1c00a32c:	1a10a7b7          	lui	a5,0x1a10a
1c00a330:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_end+0xa1073f8>
1c00a334:	1c00a5b7          	lui	a1,0x1c00a
1c00a338:	4601                	li	a2,0
1c00a33a:	24058593          	addi	a1,a1,576 # 1c00a240 <__rt_time_poweroff>
1c00a33e:	4509                	li	a0,2
1c00a340:	8a5ff0ef          	jal	ra,1c009be4 <__rt_cbsys_add>
1c00a344:	1c00a5b7          	lui	a1,0x1c00a
1c00a348:	842a                	mv	s0,a0
1c00a34a:	4601                	li	a2,0
1c00a34c:	25258593          	addi	a1,a1,594 # 1c00a252 <__rt_time_poweron>
1c00a350:	450d                	li	a0,3
1c00a352:	893ff0ef          	jal	ra,1c009be4 <__rt_cbsys_add>
1c00a356:	8d41                	or	a0,a0,s0
1c00a358:	c505                	beqz	a0,1c00a380 <__rt_time_init+0x90>
1c00a35a:	f1402673          	csrr	a2,mhartid
1c00a35e:	1c000537          	lui	a0,0x1c000
1c00a362:	40565593          	srai	a1,a2,0x5
1c00a366:	03f5f593          	andi	a1,a1,63
1c00a36a:	8a7d                	andi	a2,a2,31
1c00a36c:	48850513          	addi	a0,a0,1160 # 1c000488 <__DTOR_END__+0x19c>
1c00a370:	3b3000ef          	jal	ra,1c00af22 <printf>
1c00a374:	33b000ef          	jal	ra,1c00aeae <abort>
1c00a378:	002047b7          	lui	a5,0x204
1c00a37c:	cbd8                	sw	a4,20(a5)
1c00a37e:	bf5d                	j	1c00a334 <__rt_time_init+0x44>
1c00a380:	40b2                	lw	ra,12(sp)
1c00a382:	4422                	lw	s0,8(sp)
1c00a384:	0141                	addi	sp,sp,16
1c00a386:	8082                	ret

1c00a388 <__rt_timer_handler>:
1c00a388:	7179                	addi	sp,sp,-48
1c00a38a:	ce36                	sw	a3,28(sp)
1c00a38c:	cc3a                	sw	a4,24(sp)
1c00a38e:	1a10b6b7          	lui	a3,0x1a10b
1c00a392:	1c001737          	lui	a4,0x1c001
1c00a396:	d61a                	sw	t1,44(sp)
1c00a398:	d032                	sw	a2,32(sp)
1c00a39a:	ca3e                	sw	a5,20(sp)
1c00a39c:	00c6a303          	lw	t1,12(a3) # 1a10b00c <__l1_end+0xa108c00>
1c00a3a0:	16872783          	lw	a5,360(a4) # 1c001168 <first_delayed>
1c00a3a4:	02802603          	lw	a2,40(zero) # 28 <__rt_sched>
1c00a3a8:	02c02683          	lw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a3ac:	c842                	sw	a6,16(sp)
1c00a3ae:	80000837          	lui	a6,0x80000
1c00a3b2:	d42a                	sw	a0,40(sp)
1c00a3b4:	d22e                	sw	a1,36(sp)
1c00a3b6:	c646                	sw	a7,12(sp)
1c00a3b8:	c472                	sw	t3,8(sp)
1c00a3ba:	4581                	li	a1,0
1c00a3bc:	4501                	li	a0,0
1c00a3be:	ffe84813          	xori	a6,a6,-2
1c00a3c2:	efb9                	bnez	a5,1c00a420 <__rt_timer_handler+0x98>
1c00a3c4:	c119                	beqz	a0,1c00a3ca <__rt_timer_handler+0x42>
1c00a3c6:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a3ca:	c199                	beqz	a1,1c00a3d0 <__rt_timer_handler+0x48>
1c00a3cc:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a3d0:	16072423          	sw	zero,360(a4)
1c00a3d4:	1a10b7b7          	lui	a5,0x1a10b
1c00a3d8:	08100713          	li	a4,129
1c00a3dc:	c3d8                	sw	a4,4(a5)
1c00a3de:	6785                	lui	a5,0x1
1c00a3e0:	1a10a737          	lui	a4,0x1a10a
1c00a3e4:	80078793          	addi	a5,a5,-2048 # 800 <__rt_hyper_pending_emu_stride+0x558>
1c00a3e8:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__l1_end+0xa107408>
1c00a3ec:	5332                	lw	t1,44(sp)
1c00a3ee:	5522                	lw	a0,40(sp)
1c00a3f0:	5592                	lw	a1,36(sp)
1c00a3f2:	5602                	lw	a2,32(sp)
1c00a3f4:	46f2                	lw	a3,28(sp)
1c00a3f6:	4762                	lw	a4,24(sp)
1c00a3f8:	47d2                	lw	a5,20(sp)
1c00a3fa:	4842                	lw	a6,16(sp)
1c00a3fc:	48b2                	lw	a7,12(sp)
1c00a3fe:	4e22                	lw	t3,8(sp)
1c00a400:	6145                	addi	sp,sp,48
1c00a402:	30200073          	mret
1c00a406:	0187a883          	lw	a7,24(a5)
1c00a40a:	0007ac23          	sw	zero,24(a5)
1c00a40e:	c611                	beqz	a2,1c00a41a <__rt_timer_handler+0x92>
1c00a410:	ce9c                	sw	a5,24(a3)
1c00a412:	86be                	mv	a3,a5
1c00a414:	4585                	li	a1,1
1c00a416:	87c6                	mv	a5,a7
1c00a418:	b76d                	j	1c00a3c2 <__rt_timer_handler+0x3a>
1c00a41a:	863e                	mv	a2,a5
1c00a41c:	4505                	li	a0,1
1c00a41e:	bfd5                	j	1c00a412 <__rt_timer_handler+0x8a>
1c00a420:	0347a883          	lw	a7,52(a5)
1c00a424:	41130e33          	sub	t3,t1,a7
1c00a428:	fdc87fe3          	bleu	t3,a6,1c00a406 <__rt_timer_handler+0x7e>
1c00a42c:	c119                	beqz	a0,1c00a432 <__rt_timer_handler+0xaa>
1c00a42e:	02c02423          	sw	a2,40(zero) # 28 <__rt_sched>
1c00a432:	c199                	beqz	a1,1c00a438 <__rt_timer_handler+0xb0>
1c00a434:	02d02623          	sw	a3,44(zero) # 2c <__rt_sched+0x4>
1c00a438:	16f72423          	sw	a5,360(a4)
1c00a43c:	1a10b737          	lui	a4,0x1a10b
1c00a440:	475c                	lw	a5,12(a4)
1c00a442:	406787b3          	sub	a5,a5,t1
1c00a446:	97c6                	add	a5,a5,a7
1c00a448:	cb5c                	sw	a5,20(a4)
1c00a44a:	08500793          	li	a5,133
1c00a44e:	c35c                	sw	a5,4(a4)
1c00a450:	bf71                	j	1c00a3ec <__rt_timer_handler+0x64>

1c00a452 <__rt_fll_set_freq>:
1c00a452:	1141                	addi	sp,sp,-16
1c00a454:	c422                	sw	s0,8(sp)
1c00a456:	c226                	sw	s1,4(sp)
1c00a458:	c606                	sw	ra,12(sp)
1c00a45a:	842a                	mv	s0,a0
1c00a45c:	84ae                	mv	s1,a1
1c00a45e:	e111                	bnez	a0,1c00a462 <__rt_fll_set_freq+0x10>
1c00a460:	345d                	jal	1c009f06 <__rt_bridge_req_shutdown>
1c00a462:	8526                	mv	a0,s1
1c00a464:	88efe0ef          	jal	ra,1c0084f2 <__clzsi2>
1c00a468:	1579                	addi	a0,a0,-2
1c00a46a:	00155793          	srli	a5,a0,0x1
1c00a46e:	e391                	bnez	a5,1c00a472 <__rt_fll_set_freq+0x20>
1c00a470:	4785                	li	a5,1
1c00a472:	fff78713          	addi	a4,a5,-1
1c00a476:	4505                	li	a0,1
1c00a478:	00e51533          	sll	a0,a0,a4
1c00a47c:	00f494b3          	sll	s1,s1,a5
1c00a480:	7761                	lui	a4,0xffff8
1c00a482:	8f65                	and	a4,a4,s1
1c00a484:	1c0016b7          	lui	a3,0x1c001
1c00a488:	953a                	add	a0,a0,a4
1c00a48a:	16c68693          	addi	a3,a3,364 # 1c00116c <__rt_fll_freq>
1c00a48e:	00241713          	slli	a4,s0,0x2
1c00a492:	9736                	add	a4,a4,a3
1c00a494:	00f55533          	srl	a0,a0,a5
1c00a498:	c308                	sw	a0,0(a4)
1c00a49a:	1c001737          	lui	a4,0x1c001
1c00a49e:	10470713          	addi	a4,a4,260 # 1c001104 <__rt_fll_is_on>
1c00a4a2:	9722                	add	a4,a4,s0
1c00a4a4:	00074703          	lbu	a4,0(a4)
1c00a4a8:	c715                	beqz	a4,1c00a4d4 <__rt_fll_set_freq+0x82>
1c00a4aa:	1a100737          	lui	a4,0x1a100
1c00a4ae:	0711                	addi	a4,a4,4
1c00a4b0:	0412                	slli	s0,s0,0x4
1c00a4b2:	943a                	add	s0,s0,a4
1c00a4b4:	4018                	lw	a4,0(s0)
1c00a4b6:	80bd                	srli	s1,s1,0xf
1c00a4b8:	76c1                	lui	a3,0xffff0
1c00a4ba:	04c2                	slli	s1,s1,0x10
1c00a4bc:	8f75                	and	a4,a4,a3
1c00a4be:	80c1                	srli	s1,s1,0x10
1c00a4c0:	0785                	addi	a5,a5,1
1c00a4c2:	c40006b7          	lui	a3,0xc4000
1c00a4c6:	8f45                	or	a4,a4,s1
1c00a4c8:	8bbd                	andi	a5,a5,15
1c00a4ca:	16fd                	addi	a3,a3,-1
1c00a4cc:	07ea                	slli	a5,a5,0x1a
1c00a4ce:	8f75                	and	a4,a4,a3
1c00a4d0:	8fd9                	or	a5,a5,a4
1c00a4d2:	c01c                	sw	a5,0(s0)
1c00a4d4:	40b2                	lw	ra,12(sp)
1c00a4d6:	4422                	lw	s0,8(sp)
1c00a4d8:	4492                	lw	s1,4(sp)
1c00a4da:	0141                	addi	sp,sp,16
1c00a4dc:	8082                	ret

1c00a4de <__rt_fll_init>:
1c00a4de:	1141                	addi	sp,sp,-16
1c00a4e0:	1a1005b7          	lui	a1,0x1a100
1c00a4e4:	00451613          	slli	a2,a0,0x4
1c00a4e8:	c226                	sw	s1,4(sp)
1c00a4ea:	84aa                	mv	s1,a0
1c00a4ec:	00458513          	addi	a0,a1,4 # 1a100004 <__l1_end+0xa0fdbf8>
1c00a4f0:	9532                	add	a0,a0,a2
1c00a4f2:	4114                	lw	a3,0(a0)
1c00a4f4:	c606                	sw	ra,12(sp)
1c00a4f6:	c422                	sw	s0,8(sp)
1c00a4f8:	87b6                	mv	a5,a3
1c00a4fa:	0406c963          	bltz	a3,1c00a54c <__rt_fll_init+0x6e>
1c00a4fe:	00858793          	addi	a5,a1,8
1c00a502:	97b2                	add	a5,a5,a2
1c00a504:	4398                	lw	a4,0(a5)
1c00a506:	7841                	lui	a6,0xffff0
1c00a508:	3ff80813          	addi	a6,a6,1023 # ffff03ff <pulp__FC+0xffff0400>
1c00a50c:	01077733          	and	a4,a4,a6
1c00a510:	6809                	lui	a6,0x2
1c00a512:	80080813          	addi	a6,a6,-2048 # 1800 <__rt_hyper_pending_emu_stride+0x1558>
1c00a516:	01076733          	or	a4,a4,a6
1c00a51a:	f0010837          	lui	a6,0xf0010
1c00a51e:	187d                	addi	a6,a6,-1
1c00a520:	01077733          	and	a4,a4,a6
1c00a524:	00500837          	lui	a6,0x500
1c00a528:	01076733          	or	a4,a4,a6
1c00a52c:	05b1                	addi	a1,a1,12
1c00a52e:	c398                	sw	a4,0(a5)
1c00a530:	962e                	add	a2,a2,a1
1c00a532:	421c                	lw	a5,0(a2)
1c00a534:	fc010737          	lui	a4,0xfc010
1c00a538:	177d                	addi	a4,a4,-1
1c00a53a:	8ff9                	and	a5,a5,a4
1c00a53c:	014c0737          	lui	a4,0x14c0
1c00a540:	8fd9                	or	a5,a5,a4
1c00a542:	c21c                	sw	a5,0(a2)
1c00a544:	c00007b7          	lui	a5,0xc0000
1c00a548:	8fd5                	or	a5,a5,a3
1c00a54a:	c11c                	sw	a5,0(a0)
1c00a54c:	1c001637          	lui	a2,0x1c001
1c00a550:	00249713          	slli	a4,s1,0x2
1c00a554:	16c60613          	addi	a2,a2,364 # 1c00116c <__rt_fll_freq>
1c00a558:	9732                	add	a4,a4,a2
1c00a55a:	4300                	lw	s0,0(a4)
1c00a55c:	c015                	beqz	s0,1c00a580 <__rt_fll_init+0xa2>
1c00a55e:	85a2                	mv	a1,s0
1c00a560:	8526                	mv	a0,s1
1c00a562:	3dc5                	jal	1c00a452 <__rt_fll_set_freq>
1c00a564:	1c001537          	lui	a0,0x1c001
1c00a568:	10450513          	addi	a0,a0,260 # 1c001104 <__rt_fll_is_on>
1c00a56c:	9526                	add	a0,a0,s1
1c00a56e:	4785                	li	a5,1
1c00a570:	00f50023          	sb	a5,0(a0)
1c00a574:	40b2                	lw	ra,12(sp)
1c00a576:	8522                	mv	a0,s0
1c00a578:	4422                	lw	s0,8(sp)
1c00a57a:	4492                	lw	s1,4(sp)
1c00a57c:	0141                	addi	sp,sp,16
1c00a57e:	8082                	ret
1c00a580:	06c2                	slli	a3,a3,0x10
1c00a582:	83e9                	srli	a5,a5,0x1a
1c00a584:	82c1                	srli	a3,a3,0x10
1c00a586:	8bbd                	andi	a5,a5,15
1c00a588:	06be                	slli	a3,a3,0xf
1c00a58a:	17fd                	addi	a5,a5,-1
1c00a58c:	00f6d433          	srl	s0,a3,a5
1c00a590:	c300                	sw	s0,0(a4)
1c00a592:	bfc9                	j	1c00a564 <__rt_fll_init+0x86>

1c00a594 <__rt_fll_deinit>:
1c00a594:	1c0017b7          	lui	a5,0x1c001
1c00a598:	10478793          	addi	a5,a5,260 # 1c001104 <__rt_fll_is_on>
1c00a59c:	953e                	add	a0,a0,a5
1c00a59e:	00050023          	sb	zero,0(a0)
1c00a5a2:	8082                	ret

1c00a5a4 <__rt_flls_constructor>:
1c00a5a4:	1c0017b7          	lui	a5,0x1c001
1c00a5a8:	1607a623          	sw	zero,364(a5) # 1c00116c <__rt_fll_freq>
1c00a5ac:	16c78793          	addi	a5,a5,364
1c00a5b0:	0007a223          	sw	zero,4(a5)
1c00a5b4:	1c0017b7          	lui	a5,0x1c001
1c00a5b8:	10079223          	sh	zero,260(a5) # 1c001104 <__rt_fll_is_on>
1c00a5bc:	8082                	ret

1c00a5be <gcd>:
1c00a5be:	cd19                	beqz	a0,1c00a5dc <gcd+0x1e>
1c00a5c0:	cd81                	beqz	a1,1c00a5d8 <gcd+0x1a>
1c00a5c2:	00054463          	bltz	a0,1c00a5ca <gcd+0xc>
1c00a5c6:	0005d563          	bgez	a1,1c00a5d0 <gcd+0x12>
1c00a5ca:	55fd                	li	a1,-1
1c00a5cc:	a031                	j	1c00a5d8 <gcd+0x1a>
1c00a5ce:	85be                	mv	a1,a5
1c00a5d0:	02b567b3          	rem	a5,a0,a1
1c00a5d4:	852e                	mv	a0,a1
1c00a5d6:	ffe5                	bnez	a5,1c00a5ce <gcd+0x10>
1c00a5d8:	852e                	mv	a0,a1
1c00a5da:	8082                	ret
1c00a5dc:	4581                	li	a1,0
1c00a5de:	bfed                	j	1c00a5d8 <gcd+0x1a>

1c00a5e0 <__rt_freq_set_periph_freq.isra.3.constprop.4>:
1c00a5e0:	1101                	addi	sp,sp,-32
1c00a5e2:	1c0017b7          	lui	a5,0x1c001
1c00a5e6:	c84a                	sw	s2,16(sp)
1c00a5e8:	1087a903          	lw	s2,264(a5) # 1c001108 <__rt_periph_lcm>
1c00a5ec:	c452                	sw	s4,8(sp)
1c00a5ee:	8a2e                	mv	s4,a1
1c00a5f0:	85ca                	mv	a1,s2
1c00a5f2:	ce06                	sw	ra,28(sp)
1c00a5f4:	cc22                	sw	s0,24(sp)
1c00a5f6:	ca26                	sw	s1,20(sp)
1c00a5f8:	842a                	mv	s0,a0
1c00a5fa:	c64e                	sw	s3,12(sp)
1c00a5fc:	89aa                	mv	s3,a0
1c00a5fe:	37c1                	jal	1c00a5be <gcd>
1c00a600:	02a44533          	div	a0,s0,a0
1c00a604:	03250933          	mul	s2,a0,s2
1c00a608:	4511                	li	a0,4
1c00a60a:	e1aff0ef          	jal	ra,1c009c24 <__rt_cbsys_exec>
1c00a60e:	1c0017b7          	lui	a5,0x1c001
1c00a612:	16c7a783          	lw	a5,364(a5) # 1c00116c <__rt_fll_freq>
1c00a616:	028954b3          	divu	s1,s2,s0
1c00a61a:	0527f263          	bleu	s2,a5,1c00a65e <__rt_freq_set_periph_freq.isra.3.constprop.4+0x7e>
1c00a61e:	1a1047b7          	lui	a5,0x1a104
1c00a622:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa101cc8>
1c00a626:	4705                	li	a4,1
1c00a628:	0ce7ae23          	sw	a4,220(a5)
1c00a62c:	85a2                	mv	a1,s0
1c00a62e:	4501                	li	a0,0
1c00a630:	350d                	jal	1c00a452 <__rt_fll_set_freq>
1c00a632:	57fd                	li	a5,-1
1c00a634:	00fa0963          	beq	s4,a5,1c00a646 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x66>
1c00a638:	c099                	beqz	s1,1c00a63e <__rt_freq_set_periph_freq.isra.3.constprop.4+0x5e>
1c00a63a:	029459b3          	divu	s3,s0,s1
1c00a63e:	1c0017b7          	lui	a5,0x1c001
1c00a642:	1737aa23          	sw	s3,372(a5) # 1c001174 <__rt_freq_domains>
1c00a646:	4515                	li	a0,5
1c00a648:	ddcff0ef          	jal	ra,1c009c24 <__rt_cbsys_exec>
1c00a64c:	40f2                	lw	ra,28(sp)
1c00a64e:	4462                	lw	s0,24(sp)
1c00a650:	44d2                	lw	s1,20(sp)
1c00a652:	4942                	lw	s2,16(sp)
1c00a654:	49b2                	lw	s3,12(sp)
1c00a656:	4a22                	lw	s4,8(sp)
1c00a658:	4501                	li	a0,0
1c00a65a:	6105                	addi	sp,sp,32
1c00a65c:	8082                	ret
1c00a65e:	85a2                	mv	a1,s0
1c00a660:	4501                	li	a0,0
1c00a662:	3bc5                	jal	1c00a452 <__rt_fll_set_freq>
1c00a664:	1a1047b7          	lui	a5,0x1a104
1c00a668:	0c97aa23          	sw	s1,212(a5) # 1a1040d4 <__l1_end+0xa101cc8>
1c00a66c:	4705                	li	a4,1
1c00a66e:	0ce7ae23          	sw	a4,220(a5)
1c00a672:	b7c1                	j	1c00a632 <__rt_freq_set_periph_freq.isra.3.constprop.4+0x52>

1c00a674 <rt_freq_set_and_get>:
1c00a674:	1141                	addi	sp,sp,-16
1c00a676:	c422                	sw	s0,8(sp)
1c00a678:	842e                	mv	s0,a1
1c00a67a:	c606                	sw	ra,12(sp)
1c00a67c:	c226                	sw	s1,4(sp)
1c00a67e:	300474f3          	csrrci	s1,mstatus,8
1c00a682:	4785                	li	a5,1
1c00a684:	00f51f63          	bne	a0,a5,1c00a6a2 <rt_freq_set_and_get+0x2e>
1c00a688:	33e9                	jal	1c00a452 <__rt_fll_set_freq>
1c00a68a:	1c0017b7          	lui	a5,0x1c001
1c00a68e:	1687ac23          	sw	s0,376(a5) # 1c001178 <__rt_freq_domains+0x4>
1c00a692:	4501                	li	a0,0
1c00a694:	30049073          	csrw	mstatus,s1
1c00a698:	40b2                	lw	ra,12(sp)
1c00a69a:	4422                	lw	s0,8(sp)
1c00a69c:	4492                	lw	s1,4(sp)
1c00a69e:	0141                	addi	sp,sp,16
1c00a6a0:	8082                	ret
1c00a6a2:	4581                	li	a1,0
1c00a6a4:	8522                	mv	a0,s0
1c00a6a6:	3f2d                	jal	1c00a5e0 <__rt_freq_set_periph_freq.isra.3.constprop.4>
1c00a6a8:	00a03533          	snez	a0,a0
1c00a6ac:	40a00533          	neg	a0,a0
1c00a6b0:	b7d5                	j	1c00a694 <rt_freq_set_and_get+0x20>

1c00a6b2 <__rt_freq_init>:
1c00a6b2:	1141                	addi	sp,sp,-16
1c00a6b4:	c422                	sw	s0,8(sp)
1c00a6b6:	c606                	sw	ra,12(sp)
1c00a6b8:	35f5                	jal	1c00a5a4 <__rt_flls_constructor>
1c00a6ba:	1c0017b7          	lui	a5,0x1c001
1c00a6be:	00c7a703          	lw	a4,12(a5) # 1c00100c <__rt_platform>
1c00a6c2:	4785                	li	a5,1
1c00a6c4:	1c001437          	lui	s0,0x1c001
1c00a6c8:	02f70a63          	beq	a4,a5,1c00a6fc <__rt_freq_init+0x4a>
1c00a6cc:	4501                	li	a0,0
1c00a6ce:	3d01                	jal	1c00a4de <__rt_fll_init>
1c00a6d0:	16a42a23          	sw	a0,372(s0) # 1c001174 <__rt_freq_domains>
1c00a6d4:	17440413          	addi	s0,s0,372
1c00a6d8:	00042223          	sw	zero,4(s0)
1c00a6dc:	1a1047b7          	lui	a5,0x1a104
1c00a6e0:	4709                	li	a4,2
1c00a6e2:	0ce7a823          	sw	a4,208(a5) # 1a1040d0 <__l1_end+0xa101cc4>
1c00a6e6:	4705                	li	a4,1
1c00a6e8:	0ce7ac23          	sw	a4,216(a5)
1c00a6ec:	40b2                	lw	ra,12(sp)
1c00a6ee:	4422                	lw	s0,8(sp)
1c00a6f0:	0ce7ae23          	sw	a4,220(a5)
1c00a6f4:	0ce7aa23          	sw	a4,212(a5)
1c00a6f8:	0141                	addi	sp,sp,16
1c00a6fa:	8082                	ret
1c00a6fc:	026267b7          	lui	a5,0x2626
1c00a700:	a0078793          	addi	a5,a5,-1536 # 2625a00 <__l1_heap_size+0x2617e0c>
1c00a704:	16f42a23          	sw	a5,372(s0)
1c00a708:	b7f1                	j	1c00a6d4 <__rt_freq_init+0x22>

1c00a70a <hal_itc_wait_for_event_noirq>:
1c00a70a:	1a10a7b7          	lui	a5,0x1a10a
1c00a70e:	300476f3          	csrrci	a3,mstatus,8
1c00a712:	80c7a703          	lw	a4,-2036(a5) # 1a10980c <__l1_end+0xa107400>
1c00a716:	8f69                	and	a4,a4,a0
1c00a718:	eb11                	bnez	a4,1c00a72c <hal_itc_wait_for_event_noirq+0x22>
1c00a71a:	80a7a223          	sw	a0,-2044(a5)
1c00a71e:	10500073          	wfi
1c00a722:	80a7a423          	sw	a0,-2040(a5)
1c00a726:	30069073          	csrw	mstatus,a3
1c00a72a:	b7d5                	j	1c00a70e <hal_itc_wait_for_event_noirq+0x4>
1c00a72c:	80a7aa23          	sw	a0,-2028(a5)
1c00a730:	30069073          	csrw	mstatus,a3
1c00a734:	8082                	ret

1c00a736 <__rt_pmu_cluster_power_down>:
1c00a736:	1a1047b7          	lui	a5,0x1a104
1c00a73a:	5bbc                	lw	a5,112(a5)
1c00a73c:	01079713          	slli	a4,a5,0x10
1c00a740:	02074c63          	bltz	a4,1c00a778 <__rt_pmu_cluster_power_down+0x42>
1c00a744:	1141                	addi	sp,sp,-16
1c00a746:	c422                	sw	s0,8(sp)
1c00a748:	c606                	sw	ra,12(sp)
1c00a74a:	c226                	sw	s1,4(sp)
1c00a74c:	1a104437          	lui	s0,0x1a104
1c00a750:	547c                	lw	a5,108(s0)
1c00a752:	e385                	bnez	a5,1c00a772 <__rt_pmu_cluster_power_down+0x3c>
1c00a754:	4485                	li	s1,1
1c00a756:	c444                	sw	s1,12(s0)
1c00a758:	478d                	li	a5,3
1c00a75a:	d83c                	sw	a5,112(s0)
1c00a75c:	00800537          	lui	a0,0x800
1c00a760:	376d                	jal	1c00a70a <hal_itc_wait_for_event_noirq>
1c00a762:	d824                	sw	s1,112(s0)
1c00a764:	4422                	lw	s0,8(sp)
1c00a766:	40b2                	lw	ra,12(sp)
1c00a768:	4492                	lw	s1,4(sp)
1c00a76a:	00400537          	lui	a0,0x400
1c00a76e:	0141                	addi	sp,sp,16
1c00a770:	bf69                	j	1c00a70a <hal_itc_wait_for_event_noirq>
1c00a772:	4505                	li	a0,1
1c00a774:	3eb9                	jal	1c00a2d2 <rt_time_wait_us>
1c00a776:	bfe9                	j	1c00a750 <__rt_pmu_cluster_power_down+0x1a>
1c00a778:	8082                	ret

1c00a77a <__rt_pmu_cluster_power_up>:
1c00a77a:	1141                	addi	sp,sp,-16
1c00a77c:	c606                	sw	ra,12(sp)
1c00a77e:	c422                	sw	s0,8(sp)
1c00a780:	478d                	li	a5,3
1c00a782:	1a104437          	lui	s0,0x1a104
1c00a786:	d83c                	sw	a5,112(s0)
1c00a788:	00400537          	lui	a0,0x400
1c00a78c:	3fbd                	jal	1c00a70a <hal_itc_wait_for_event_noirq>
1c00a78e:	02700793          	li	a5,39
1c00a792:	d83c                	sw	a5,112(s0)
1c00a794:	00800537          	lui	a0,0x800
1c00a798:	3f8d                	jal	1c00a70a <hal_itc_wait_for_event_noirq>
1c00a79a:	6791                	lui	a5,0x4
1c00a79c:	00042623          	sw	zero,12(s0) # 1a10400c <__l1_end+0xa101c00>
1c00a7a0:	02778793          	addi	a5,a5,39 # 4027 <_l1_preload_size+0x1c1f>
1c00a7a4:	d83c                	sw	a5,112(s0)
1c00a7a6:	40b2                	lw	ra,12(sp)
1c00a7a8:	4422                	lw	s0,8(sp)
1c00a7aa:	4505                	li	a0,1
1c00a7ac:	0141                	addi	sp,sp,16
1c00a7ae:	8082                	ret

1c00a7b0 <__rt_pmu_init>:
1c00a7b0:	1a1077b7          	lui	a5,0x1a107
1c00a7b4:	4741                	li	a4,16
1c00a7b6:	cb98                	sw	a4,16(a5)
1c00a7b8:	1a10a7b7          	lui	a5,0x1a10a
1c00a7bc:	02000737          	lui	a4,0x2000
1c00a7c0:	80e7aa23          	sw	a4,-2028(a5) # 1a109814 <__l1_end+0xa107408>
1c00a7c4:	4709                	li	a4,2
1c00a7c6:	02e02e23          	sw	a4,60(zero) # 3c <__rt_pmu_current_sequence>
1c00a7ca:	8082                	ret

1c00a7cc <rt_padframe_set>:
1c00a7cc:	300476f3          	csrrci	a3,mstatus,8
1c00a7d0:	4158                	lw	a4,4(a0)
1c00a7d2:	1a1047b7          	lui	a5,0x1a104
1c00a7d6:	4310                	lw	a2,0(a4)
1c00a7d8:	cb90                	sw	a2,16(a5)
1c00a7da:	4350                	lw	a2,4(a4)
1c00a7dc:	cbd0                	sw	a2,20(a5)
1c00a7de:	4710                	lw	a2,8(a4)
1c00a7e0:	cf90                	sw	a2,24(a5)
1c00a7e2:	4758                	lw	a4,12(a4)
1c00a7e4:	cfd8                	sw	a4,28(a5)
1c00a7e6:	30069073          	csrw	mstatus,a3
1c00a7ea:	8082                	ret

1c00a7ec <__rt_padframe_init>:
1c00a7ec:	1c001537          	lui	a0,0x1c001
1c00a7f0:	f3c50513          	addi	a0,a0,-196 # 1c000f3c <__rt_padframe_profiles>
1c00a7f4:	bfe1                	j	1c00a7cc <rt_padframe_set>

1c00a7f6 <rt_periph_copy>:
1c00a7f6:	7179                	addi	sp,sp,-48
1c00a7f8:	d422                	sw	s0,40(sp)
1c00a7fa:	842a                	mv	s0,a0
1c00a7fc:	d606                	sw	ra,44(sp)
1c00a7fe:	d226                	sw	s1,36(sp)
1c00a800:	d04a                	sw	s2,32(sp)
1c00a802:	30047973          	csrrci	s2,mstatus,8
1c00a806:	4015d493          	srai	s1,a1,0x1
1c00a80a:	1a102537          	lui	a0,0x1a102
1c00a80e:	049e                	slli	s1,s1,0x7
1c00a810:	94aa                	add	s1,s1,a0
1c00a812:	00459513          	slli	a0,a1,0x4
1c00a816:	8941                	andi	a0,a0,16
1c00a818:	94aa                	add	s1,s1,a0
1c00a81a:	853e                	mv	a0,a5
1c00a81c:	ef89                	bnez	a5,1c00a836 <rt_periph_copy+0x40>
1c00a81e:	ce2e                	sw	a1,28(sp)
1c00a820:	cc32                	sw	a2,24(sp)
1c00a822:	ca36                	sw	a3,20(sp)
1c00a824:	c83a                	sw	a4,16(sp)
1c00a826:	c63e                	sw	a5,12(sp)
1c00a828:	875ff0ef          	jal	ra,1c00a09c <__rt_wait_event_prepare_blocking>
1c00a82c:	47b2                	lw	a5,12(sp)
1c00a82e:	4742                	lw	a4,16(sp)
1c00a830:	46d2                	lw	a3,20(sp)
1c00a832:	4662                	lw	a2,24(sp)
1c00a834:	45f2                	lw	a1,28(sp)
1c00a836:	e419                	bnez	s0,1c00a844 <rt_periph_copy+0x4e>
1c00a838:	03450413          	addi	s0,a0,52 # 1a102034 <__l1_end+0xa0ffc28>
1c00a83c:	04052023          	sw	zero,64(a0)
1c00a840:	04052823          	sw	zero,80(a0)
1c00a844:	00c42803          	lw	a6,12(s0)
1c00a848:	c054                	sw	a3,4(s0)
1c00a84a:	cc08                	sw	a0,24(s0)
1c00a84c:	00f87813          	andi	a6,a6,15
1c00a850:	4891                	li	a7,4
1c00a852:	01076713          	ori	a4,a4,16
1c00a856:	0708ec63          	bltu	a7,a6,1c00a8ce <rt_periph_copy+0xd8>
1c00a85a:	04000893          	li	a7,64
1c00a85e:	0596                	slli	a1,a1,0x5
1c00a860:	98ae                	add	a7,a7,a1
1c00a862:	0008a303          	lw	t1,0(a7)
1c00a866:	00042a23          	sw	zero,20(s0)
1c00a86a:	04000813          	li	a6,64
1c00a86e:	02031663          	bnez	t1,1c00a89a <rt_periph_copy+0xa4>
1c00a872:	0088a023          	sw	s0,0(a7)
1c00a876:	00b808b3          	add	a7,a6,a1
1c00a87a:	0088a303          	lw	t1,8(a7)
1c00a87e:	0088a223          	sw	s0,4(a7)
1c00a882:	02031163          	bnez	t1,1c00a8a4 <rt_periph_copy+0xae>
1c00a886:	0084a883          	lw	a7,8(s1)
1c00a88a:	0208f893          	andi	a7,a7,32
1c00a88e:	00089b63          	bnez	a7,1c00a8a4 <rt_periph_copy+0xae>
1c00a892:	c090                	sw	a2,0(s1)
1c00a894:	c0d4                	sw	a3,4(s1)
1c00a896:	c498                	sw	a4,8(s1)
1c00a898:	a005                	j	1c00a8b8 <rt_periph_copy+0xc2>
1c00a89a:	0048a883          	lw	a7,4(a7)
1c00a89e:	0088aa23          	sw	s0,20(a7)
1c00a8a2:	bfd1                	j	1c00a876 <rt_periph_copy+0x80>
1c00a8a4:	00042823          	sw	zero,16(s0)
1c00a8a8:	c010                	sw	a2,0(s0)
1c00a8aa:	c054                	sw	a3,4(s0)
1c00a8ac:	c418                	sw	a4,8(s0)
1c00a8ae:	00031563          	bnez	t1,1c00a8b8 <rt_periph_copy+0xc2>
1c00a8b2:	982e                	add	a6,a6,a1
1c00a8b4:	00882423          	sw	s0,8(a6) # 500008 <__l1_heap_size+0x4f2414>
1c00a8b8:	e399                	bnez	a5,1c00a8be <rt_periph_copy+0xc8>
1c00a8ba:	933ff0ef          	jal	ra,1c00a1ec <__rt_wait_event>
1c00a8be:	30091073          	csrw	mstatus,s2
1c00a8c2:	50b2                	lw	ra,44(sp)
1c00a8c4:	5422                	lw	s0,40(sp)
1c00a8c6:	5492                	lw	s1,36(sp)
1c00a8c8:	5902                	lw	s2,32(sp)
1c00a8ca:	6145                	addi	sp,sp,48
1c00a8cc:	8082                	ret
1c00a8ce:	4899                	li	a7,6
1c00a8d0:	ff1814e3          	bne	a6,a7,1c00a8b8 <rt_periph_copy+0xc2>
1c00a8d4:	04000893          	li	a7,64
1c00a8d8:	0596                	slli	a1,a1,0x5
1c00a8da:	98ae                	add	a7,a7,a1
1c00a8dc:	0008a303          	lw	t1,0(a7)
1c00a8e0:	00042a23          	sw	zero,20(s0)
1c00a8e4:	04000813          	li	a6,64
1c00a8e8:	00031f63          	bnez	t1,1c00a906 <rt_periph_copy+0x110>
1c00a8ec:	0088a023          	sw	s0,0(a7)
1c00a8f0:	95c2                	add	a1,a1,a6
1c00a8f2:	c1c0                	sw	s0,4(a1)
1c00a8f4:	00031e63          	bnez	t1,1c00a910 <rt_periph_copy+0x11a>
1c00a8f8:	02442803          	lw	a6,36(s0)
1c00a8fc:	1a1025b7          	lui	a1,0x1a102
1c00a900:	1305a023          	sw	a6,288(a1) # 1a102120 <__l1_end+0xa0ffd14>
1c00a904:	b779                	j	1c00a892 <rt_periph_copy+0x9c>
1c00a906:	0048a883          	lw	a7,4(a7)
1c00a90a:	0088aa23          	sw	s0,20(a7)
1c00a90e:	b7cd                	j	1c00a8f0 <rt_periph_copy+0xfa>
1c00a910:	c418                	sw	a4,8(s0)
1c00a912:	4598                	lw	a4,8(a1)
1c00a914:	c010                	sw	a2,0(s0)
1c00a916:	c054                	sw	a3,4(s0)
1c00a918:	00042823          	sw	zero,16(s0)
1c00a91c:	ff51                	bnez	a4,1c00a8b8 <rt_periph_copy+0xc2>
1c00a91e:	c580                	sw	s0,8(a1)
1c00a920:	bf61                	j	1c00a8b8 <rt_periph_copy+0xc2>

1c00a922 <__rt_periph_init>:
1c00a922:	1c0085b7          	lui	a1,0x1c008
1c00a926:	04000693          	li	a3,64
1c00a92a:	4601                	li	a2,0
1c00a92c:	04000793          	li	a5,64
1c00a930:	1a1028b7          	lui	a7,0x1a102
1c00a934:	3a258593          	addi	a1,a1,930 # 1c0083a2 <udma_event_handler>
1c00a938:	4841                	li	a6,16
1c00a93a:	40165713          	srai	a4,a2,0x1
1c00a93e:	00461513          	slli	a0,a2,0x4
1c00a942:	071e                	slli	a4,a4,0x7
1c00a944:	9746                	add	a4,a4,a7
1c00a946:	8941                	andi	a0,a0,16
1c00a948:	972a                	add	a4,a4,a0
1c00a94a:	0006a023          	sw	zero,0(a3) # c4000000 <pulp__FC+0xc4000001>
1c00a94e:	0006a423          	sw	zero,8(a3)
1c00a952:	c6d8                	sw	a4,12(a3)
1c00a954:	cecc                	sw	a1,28(a3)
1c00a956:	0605                	addi	a2,a2,1
1c00a958:	02068693          	addi	a3,a3,32
1c00a95c:	fd061fe3          	bne	a2,a6,1c00a93a <__rt_periph_init+0x18>
1c00a960:	1c008737          	lui	a4,0x1c008
1c00a964:	37070713          	addi	a4,a4,880 # 1c008370 <__rt_soc_evt_no_udma>
1c00a968:	2007a023          	sw	zero,512(a5) # 1a104200 <__l1_end+0xa101df4>
1c00a96c:	20e7a423          	sw	a4,520(a5)
1c00a970:	20e7a623          	sw	a4,524(a5)
1c00a974:	20e7a823          	sw	a4,528(a5)
1c00a978:	20e7aa23          	sw	a4,532(a5)
1c00a97c:	20e7ac23          	sw	a4,536(a5)
1c00a980:	20e7ae23          	sw	a4,540(a5)
1c00a984:	22e7a023          	sw	a4,544(a5)
1c00a988:	22e7a223          	sw	a4,548(a5)
1c00a98c:	2007a223          	sw	zero,516(a5)
1c00a990:	8082                	ret

1c00a992 <__rt_i2c_init>:
1c00a992:	1c0107b7          	lui	a5,0x1c010
1c00a996:	16878793          	addi	a5,a5,360 # 1c010168 <__cluster_text_end>
1c00a99a:	00078223          	sb	zero,4(a5)
1c00a99e:	00078a23          	sb	zero,20(a5)
1c00a9a2:	8082                	ret

1c00a9a4 <__rt_hyper_init>:
1c00a9a4:	1c001737          	lui	a4,0x1c001
1c00a9a8:	26800793          	li	a5,616
1c00a9ac:	10072623          	sw	zero,268(a4) # 1c00110c <__pi_hyper_cluster_reqs_first>
1c00a9b0:	577d                	li	a4,-1
1c00a9b2:	0007aa23          	sw	zero,20(a5)
1c00a9b6:	0207a823          	sw	zero,48(a5)
1c00a9ba:	cf98                	sw	a4,24(a5)
1c00a9bc:	1c0017b7          	lui	a5,0x1c001
1c00a9c0:	1007a823          	sw	zero,272(a5) # 1c001110 <__rt_hyper_open_count>
1c00a9c4:	8082                	ret

1c00a9c6 <__rt_spim_init>:
1c00a9c6:	1c0017b7          	lui	a5,0x1c001
1c00a9ca:	1007aa23          	sw	zero,276(a5) # 1c001114 <__rt_spim_open_count>
1c00a9ce:	8082                	ret

1c00a9d0 <rt_is_fc>:
1c00a9d0:	f1402573          	csrr	a0,mhartid
1c00a9d4:	8515                	srai	a0,a0,0x5
1c00a9d6:	03f57513          	andi	a0,a0,63
1c00a9da:	1505                	addi	a0,a0,-31
1c00a9dc:	00153513          	seqz	a0,a0
1c00a9e0:	8082                	ret

1c00a9e2 <__rt_io_end_of_flush>:
1c00a9e2:	1c0017b7          	lui	a5,0x1c001
1c00a9e6:	1007ae23          	sw	zero,284(a5) # 1c00111c <__rt_io_pending_flush>
1c00a9ea:	00052c23          	sw	zero,24(a0)
1c00a9ee:	8082                	ret

1c00a9f0 <__rt_io_uart_wait_req>:
1c00a9f0:	1141                	addi	sp,sp,-16
1c00a9f2:	c226                	sw	s1,4(sp)
1c00a9f4:	84aa                	mv	s1,a0
1c00a9f6:	c606                	sw	ra,12(sp)
1c00a9f8:	c422                	sw	s0,8(sp)
1c00a9fa:	c04a                	sw	s2,0(sp)
1c00a9fc:	30047973          	csrrci	s2,mstatus,8
1c00aa00:	1c001437          	lui	s0,0x1c001
1c00aa04:	11840413          	addi	s0,s0,280 # 1c001118 <__rt_io_event_current>
1c00aa08:	4008                	lw	a0,0(s0)
1c00aa0a:	c509                	beqz	a0,1c00aa14 <__rt_io_uart_wait_req+0x24>
1c00aa0c:	80bff0ef          	jal	ra,1c00a216 <rt_event_wait>
1c00aa10:	00042023          	sw	zero,0(s0)
1c00aa14:	4785                	li	a5,1
1c00aa16:	08f48623          	sb	a5,140(s1)
1c00aa1a:	08d4c783          	lbu	a5,141(s1)
1c00aa1e:	00201737          	lui	a4,0x201
1c00aa22:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3210>
1c00aa26:	04078793          	addi	a5,a5,64
1c00aa2a:	07da                	slli	a5,a5,0x16
1c00aa2c:	97ba                	add	a5,a5,a4
1c00aa2e:	0007a023          	sw	zero,0(a5)
1c00aa32:	30091073          	csrw	mstatus,s2
1c00aa36:	40b2                	lw	ra,12(sp)
1c00aa38:	4422                	lw	s0,8(sp)
1c00aa3a:	4492                	lw	s1,4(sp)
1c00aa3c:	4902                	lw	s2,0(sp)
1c00aa3e:	0141                	addi	sp,sp,16
1c00aa40:	8082                	ret

1c00aa42 <__rt_io_start>:
1c00aa42:	1101                	addi	sp,sp,-32
1c00aa44:	0028                	addi	a0,sp,8
1c00aa46:	ce06                	sw	ra,28(sp)
1c00aa48:	cc22                	sw	s0,24(sp)
1c00aa4a:	7d1000ef          	jal	ra,1c00ba1a <rt_uart_conf_init>
1c00aa4e:	4585                	li	a1,1
1c00aa50:	4501                	li	a0,0
1c00aa52:	e62ff0ef          	jal	ra,1c00a0b4 <rt_event_alloc>
1c00aa56:	547d                	li	s0,-1
1c00aa58:	ed1d                	bnez	a0,1c00aa96 <__rt_io_start+0x54>
1c00aa5a:	1c0017b7          	lui	a5,0x1c001
1c00aa5e:	0107a783          	lw	a5,16(a5) # 1c001010 <__rt_iodev_uart_baudrate>
1c00aa62:	842a                	mv	s0,a0
1c00aa64:	1c001537          	lui	a0,0x1c001
1c00aa68:	e3ff5597          	auipc	a1,0xe3ff5
1c00aa6c:	5c058593          	addi	a1,a1,1472 # 28 <__rt_sched>
1c00aa70:	05c50513          	addi	a0,a0,92 # 1c00105c <__rt_io_event>
1c00aa74:	c43e                	sw	a5,8(sp)
1c00aa76:	e14ff0ef          	jal	ra,1c00a08a <__rt_event_init>
1c00aa7a:	1c0017b7          	lui	a5,0x1c001
1c00aa7e:	1287a503          	lw	a0,296(a5) # 1c001128 <__rt_iodev_uart_channel>
1c00aa82:	4681                	li	a3,0
1c00aa84:	4601                	li	a2,0
1c00aa86:	002c                	addi	a1,sp,8
1c00aa88:	050d                	addi	a0,a0,3
1c00aa8a:	7a1000ef          	jal	ra,1c00ba2a <__rt_uart_open>
1c00aa8e:	1c0017b7          	lui	a5,0x1c001
1c00aa92:	12a7a023          	sw	a0,288(a5) # 1c001120 <_rt_io_uart>
1c00aa96:	8522                	mv	a0,s0
1c00aa98:	40f2                	lw	ra,28(sp)
1c00aa9a:	4462                	lw	s0,24(sp)
1c00aa9c:	6105                	addi	sp,sp,32
1c00aa9e:	8082                	ret

1c00aaa0 <rt_event_execute.isra.2.constprop.11>:
1c00aaa0:	1141                	addi	sp,sp,-16
1c00aaa2:	c606                	sw	ra,12(sp)
1c00aaa4:	c422                	sw	s0,8(sp)
1c00aaa6:	30047473          	csrrci	s0,mstatus,8
1c00aaaa:	4585                	li	a1,1
1c00aaac:	e3ff5517          	auipc	a0,0xe3ff5
1c00aab0:	57c50513          	addi	a0,a0,1404 # 28 <__rt_sched>
1c00aab4:	ed8ff0ef          	jal	ra,1c00a18c <__rt_event_execute>
1c00aab8:	30041073          	csrw	mstatus,s0
1c00aabc:	40b2                	lw	ra,12(sp)
1c00aabe:	4422                	lw	s0,8(sp)
1c00aac0:	0141                	addi	sp,sp,16
1c00aac2:	8082                	ret

1c00aac4 <__rt_io_lock>:
1c00aac4:	1c0017b7          	lui	a5,0x1c001
1c00aac8:	f5c7a783          	lw	a5,-164(a5) # 1c000f5c <__hal_debug_struct+0x10>
1c00aacc:	c791                	beqz	a5,1c00aad8 <__rt_io_lock+0x14>
1c00aace:	1c0017b7          	lui	a5,0x1c001
1c00aad2:	1207a783          	lw	a5,288(a5) # 1c001120 <_rt_io_uart>
1c00aad6:	c3a1                	beqz	a5,1c00ab16 <__rt_io_lock+0x52>
1c00aad8:	7171                	addi	sp,sp,-176
1c00aada:	d706                	sw	ra,172(sp)
1c00aadc:	3dd5                	jal	1c00a9d0 <rt_is_fc>
1c00aade:	1c0017b7          	lui	a5,0x1c001
1c00aae2:	c901                	beqz	a0,1c00aaf2 <__rt_io_lock+0x2e>
1c00aae4:	f2c78513          	addi	a0,a5,-212 # 1c000f2c <__rt_io_fc_lock>
1c00aae8:	990ff0ef          	jal	ra,1c009c78 <__rt_fc_lock>
1c00aaec:	50ba                	lw	ra,172(sp)
1c00aaee:	614d                	addi	sp,sp,176
1c00aaf0:	8082                	ret
1c00aaf2:	002c                	addi	a1,sp,8
1c00aaf4:	f2c78513          	addi	a0,a5,-212
1c00aaf8:	9f2ff0ef          	jal	ra,1c009cea <__rt_fc_cluster_lock>
1c00aafc:	4689                	li	a3,2
1c00aafe:	00204737          	lui	a4,0x204
1c00ab02:	09c14783          	lbu	a5,156(sp)
1c00ab06:	0ff7f793          	andi	a5,a5,255
1c00ab0a:	f3ed                	bnez	a5,1c00aaec <__rt_io_lock+0x28>
1c00ab0c:	c714                	sw	a3,8(a4)
1c00ab0e:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6448>
1c00ab12:	c354                	sw	a3,4(a4)
1c00ab14:	b7fd                	j	1c00ab02 <__rt_io_lock+0x3e>
1c00ab16:	8082                	ret

1c00ab18 <__rt_io_unlock>:
1c00ab18:	1c0017b7          	lui	a5,0x1c001
1c00ab1c:	f5c7a783          	lw	a5,-164(a5) # 1c000f5c <__hal_debug_struct+0x10>
1c00ab20:	c791                	beqz	a5,1c00ab2c <__rt_io_unlock+0x14>
1c00ab22:	1c0017b7          	lui	a5,0x1c001
1c00ab26:	1207a783          	lw	a5,288(a5) # 1c001120 <_rt_io_uart>
1c00ab2a:	c3a1                	beqz	a5,1c00ab6a <__rt_io_unlock+0x52>
1c00ab2c:	7171                	addi	sp,sp,-176
1c00ab2e:	d706                	sw	ra,172(sp)
1c00ab30:	3545                	jal	1c00a9d0 <rt_is_fc>
1c00ab32:	1c0017b7          	lui	a5,0x1c001
1c00ab36:	c901                	beqz	a0,1c00ab46 <__rt_io_unlock+0x2e>
1c00ab38:	f2c78513          	addi	a0,a5,-212 # 1c000f2c <__rt_io_fc_lock>
1c00ab3c:	978ff0ef          	jal	ra,1c009cb4 <__rt_fc_unlock>
1c00ab40:	50ba                	lw	ra,172(sp)
1c00ab42:	614d                	addi	sp,sp,176
1c00ab44:	8082                	ret
1c00ab46:	002c                	addi	a1,sp,8
1c00ab48:	f2c78513          	addi	a0,a5,-212
1c00ab4c:	9d6ff0ef          	jal	ra,1c009d22 <__rt_fc_cluster_unlock>
1c00ab50:	4689                	li	a3,2
1c00ab52:	00204737          	lui	a4,0x204
1c00ab56:	09c14783          	lbu	a5,156(sp)
1c00ab5a:	0ff7f793          	andi	a5,a5,255
1c00ab5e:	f3ed                	bnez	a5,1c00ab40 <__rt_io_unlock+0x28>
1c00ab60:	c714                	sw	a3,8(a4)
1c00ab62:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6448>
1c00ab66:	c354                	sw	a3,4(a4)
1c00ab68:	b7fd                	j	1c00ab56 <__rt_io_unlock+0x3e>
1c00ab6a:	8082                	ret

1c00ab6c <__rt_io_uart_wait_pending>:
1c00ab6c:	7135                	addi	sp,sp,-160
1c00ab6e:	cd22                	sw	s0,152(sp)
1c00ab70:	cf06                	sw	ra,156(sp)
1c00ab72:	cb26                	sw	s1,148(sp)
1c00ab74:	1c001437          	lui	s0,0x1c001
1c00ab78:	11c42783          	lw	a5,284(s0) # 1c00111c <__rt_io_pending_flush>
1c00ab7c:	e39d                	bnez	a5,1c00aba2 <__rt_io_uart_wait_pending+0x36>
1c00ab7e:	1c001437          	lui	s0,0x1c001
1c00ab82:	11840413          	addi	s0,s0,280 # 1c001118 <__rt_io_event_current>
1c00ab86:	4004                	lw	s1,0(s0)
1c00ab88:	c881                	beqz	s1,1c00ab98 <__rt_io_uart_wait_pending+0x2c>
1c00ab8a:	3599                	jal	1c00a9d0 <rt_is_fc>
1c00ab8c:	cd19                	beqz	a0,1c00abaa <__rt_io_uart_wait_pending+0x3e>
1c00ab8e:	8526                	mv	a0,s1
1c00ab90:	e86ff0ef          	jal	ra,1c00a216 <rt_event_wait>
1c00ab94:	00042023          	sw	zero,0(s0)
1c00ab98:	40fa                	lw	ra,156(sp)
1c00ab9a:	446a                	lw	s0,152(sp)
1c00ab9c:	44da                	lw	s1,148(sp)
1c00ab9e:	610d                	addi	sp,sp,160
1c00aba0:	8082                	ret
1c00aba2:	3f9d                	jal	1c00ab18 <__rt_io_unlock>
1c00aba4:	3df5                	jal	1c00aaa0 <rt_event_execute.isra.2.constprop.11>
1c00aba6:	3f39                	jal	1c00aac4 <__rt_io_lock>
1c00aba8:	bfc1                	j	1c00ab78 <__rt_io_uart_wait_pending+0xc>
1c00abaa:	f14027f3          	csrr	a5,mhartid
1c00abae:	8795                	srai	a5,a5,0x5
1c00abb0:	03f7f793          	andi	a5,a5,63
1c00abb4:	08f106a3          	sb	a5,141(sp)
1c00abb8:	1c00b7b7          	lui	a5,0x1c00b
1c00abbc:	9f078793          	addi	a5,a5,-1552 # 1c00a9f0 <__rt_io_uart_wait_req>
1c00abc0:	c03e                	sw	a5,0(sp)
1c00abc2:	00010793          	mv	a5,sp
1c00abc6:	4705                	li	a4,1
1c00abc8:	c23e                	sw	a5,4(sp)
1c00abca:	850a                	mv	a0,sp
1c00abcc:	1c0017b7          	lui	a5,0x1c001
1c00abd0:	06e7ae23          	sw	a4,124(a5) # 1c00107c <__rt_io_event+0x20>
1c00abd4:	08010623          	sb	zero,140(sp)
1c00abd8:	d002                	sw	zero,32(sp)
1c00abda:	d202                	sw	zero,36(sp)
1c00abdc:	9e7fe0ef          	jal	ra,1c0095c2 <__rt_cluster_push_fc_event>
1c00abe0:	4689                	li	a3,2
1c00abe2:	00204737          	lui	a4,0x204
1c00abe6:	08c14783          	lbu	a5,140(sp)
1c00abea:	0ff7f793          	andi	a5,a5,255
1c00abee:	f7cd                	bnez	a5,1c00ab98 <__rt_io_uart_wait_pending+0x2c>
1c00abf0:	c714                	sw	a3,8(a4)
1c00abf2:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6448>
1c00abf6:	c354                	sw	a3,4(a4)
1c00abf8:	b7fd                	j	1c00abe6 <__rt_io_uart_wait_pending+0x7a>

1c00abfa <__rt_io_stop>:
1c00abfa:	1141                	addi	sp,sp,-16
1c00abfc:	c422                	sw	s0,8(sp)
1c00abfe:	1c001437          	lui	s0,0x1c001
1c00ac02:	c606                	sw	ra,12(sp)
1c00ac04:	12040413          	addi	s0,s0,288 # 1c001120 <_rt_io_uart>
1c00ac08:	3795                	jal	1c00ab6c <__rt_io_uart_wait_pending>
1c00ac0a:	4008                	lw	a0,0(s0)
1c00ac0c:	4581                	li	a1,0
1c00ac0e:	6a5000ef          	jal	ra,1c00bab2 <rt_uart_close>
1c00ac12:	40b2                	lw	ra,12(sp)
1c00ac14:	00042023          	sw	zero,0(s0)
1c00ac18:	4422                	lw	s0,8(sp)
1c00ac1a:	4501                	li	a0,0
1c00ac1c:	0141                	addi	sp,sp,16
1c00ac1e:	8082                	ret

1c00ac20 <__rt_io_uart_flush.constprop.10>:
1c00ac20:	7131                	addi	sp,sp,-192
1c00ac22:	dd22                	sw	s0,184(sp)
1c00ac24:	df06                	sw	ra,188(sp)
1c00ac26:	db26                	sw	s1,180(sp)
1c00ac28:	d94a                	sw	s2,176(sp)
1c00ac2a:	d74e                	sw	s3,172(sp)
1c00ac2c:	d552                	sw	s4,168(sp)
1c00ac2e:	d356                	sw	s5,164(sp)
1c00ac30:	1c001437          	lui	s0,0x1c001
1c00ac34:	11c42783          	lw	a5,284(s0) # 1c00111c <__rt_io_pending_flush>
1c00ac38:	11c40a13          	addi	s4,s0,284
1c00ac3c:	e7bd                	bnez	a5,1c00acaa <__rt_io_uart_flush.constprop.10+0x8a>
1c00ac3e:	1c0014b7          	lui	s1,0x1c001
1c00ac42:	f4c48793          	addi	a5,s1,-180 # 1c000f4c <__hal_debug_struct>
1c00ac46:	4f80                	lw	s0,24(a5)
1c00ac48:	f4c48a93          	addi	s5,s1,-180
1c00ac4c:	c431                	beqz	s0,1c00ac98 <__rt_io_uart_flush.constprop.10+0x78>
1c00ac4e:	3349                	jal	1c00a9d0 <rt_is_fc>
1c00ac50:	1c0017b7          	lui	a5,0x1c001
1c00ac54:	1207a903          	lw	s2,288(a5) # 1c001120 <_rt_io_uart>
1c00ac58:	1c0019b7          	lui	s3,0x1c001
1c00ac5c:	cd29                	beqz	a0,1c00acb6 <__rt_io_uart_flush.constprop.10+0x96>
1c00ac5e:	1c00b5b7          	lui	a1,0x1c00b
1c00ac62:	4785                	li	a5,1
1c00ac64:	f4c48613          	addi	a2,s1,-180
1c00ac68:	9e258593          	addi	a1,a1,-1566 # 1c00a9e2 <__rt_io_end_of_flush>
1c00ac6c:	4501                	li	a0,0
1c00ac6e:	00fa2023          	sw	a5,0(s4)
1c00ac72:	cbaff0ef          	jal	ra,1c00a12c <rt_event_get>
1c00ac76:	00492583          	lw	a1,4(s2)
1c00ac7a:	87aa                	mv	a5,a0
1c00ac7c:	4701                	li	a4,0
1c00ac7e:	0586                	slli	a1,a1,0x1
1c00ac80:	86a2                	mv	a3,s0
1c00ac82:	f6898613          	addi	a2,s3,-152 # 1c000f68 <__hal_debug_struct+0x1c>
1c00ac86:	0585                	addi	a1,a1,1
1c00ac88:	4501                	li	a0,0
1c00ac8a:	b6dff0ef          	jal	ra,1c00a7f6 <rt_periph_copy>
1c00ac8e:	3569                	jal	1c00ab18 <__rt_io_unlock>
1c00ac90:	000a2783          	lw	a5,0(s4)
1c00ac94:	ef99                	bnez	a5,1c00acb2 <__rt_io_uart_flush.constprop.10+0x92>
1c00ac96:	353d                	jal	1c00aac4 <__rt_io_lock>
1c00ac98:	50fa                	lw	ra,188(sp)
1c00ac9a:	546a                	lw	s0,184(sp)
1c00ac9c:	54da                	lw	s1,180(sp)
1c00ac9e:	594a                	lw	s2,176(sp)
1c00aca0:	59ba                	lw	s3,172(sp)
1c00aca2:	5a2a                	lw	s4,168(sp)
1c00aca4:	5a9a                	lw	s5,164(sp)
1c00aca6:	6129                	addi	sp,sp,192
1c00aca8:	8082                	ret
1c00acaa:	35bd                	jal	1c00ab18 <__rt_io_unlock>
1c00acac:	3bd5                	jal	1c00aaa0 <rt_event_execute.isra.2.constprop.11>
1c00acae:	3d19                	jal	1c00aac4 <__rt_io_lock>
1c00acb0:	b751                	j	1c00ac34 <__rt_io_uart_flush.constprop.10+0x14>
1c00acb2:	33fd                	jal	1c00aaa0 <rt_event_execute.isra.2.constprop.11>
1c00acb4:	bff1                	j	1c00ac90 <__rt_io_uart_flush.constprop.10+0x70>
1c00acb6:	0054                	addi	a3,sp,4
1c00acb8:	8622                	mv	a2,s0
1c00acba:	f6898593          	addi	a1,s3,-152
1c00acbe:	854a                	mv	a0,s2
1c00acc0:	63d000ef          	jal	ra,1c00bafc <rt_uart_cluster_write>
1c00acc4:	4689                	li	a3,2
1c00acc6:	00204737          	lui	a4,0x204
1c00acca:	09c14783          	lbu	a5,156(sp)
1c00acce:	0ff7f793          	andi	a5,a5,255
1c00acd2:	c781                	beqz	a5,1c00acda <__rt_io_uart_flush.constprop.10+0xba>
1c00acd4:	000aac23          	sw	zero,24(s5)
1c00acd8:	b7c1                	j	1c00ac98 <__rt_io_uart_flush.constprop.10+0x78>
1c00acda:	c714                	sw	a3,8(a4)
1c00acdc:	03c76783          	p.elw	a5,60(a4) # 20403c <__l1_heap_size+0x1f6448>
1c00ace0:	c354                	sw	a3,4(a4)
1c00ace2:	b7e5                	j	1c00acca <__rt_io_uart_flush.constprop.10+0xaa>

1c00ace4 <memset>:
1c00ace4:	962a                	add	a2,a2,a0
1c00ace6:	87aa                	mv	a5,a0
1c00ace8:	00c79363          	bne	a5,a2,1c00acee <memset+0xa>
1c00acec:	8082                	ret
1c00acee:	0785                	addi	a5,a5,1
1c00acf0:	feb78fa3          	sb	a1,-1(a5)
1c00acf4:	bfd5                	j	1c00ace8 <memset+0x4>

1c00acf6 <memcpy>:
1c00acf6:	962a                	add	a2,a2,a0
1c00acf8:	87aa                	mv	a5,a0
1c00acfa:	00c79363          	bne	a5,a2,1c00ad00 <memcpy+0xa>
1c00acfe:	8082                	ret
1c00ad00:	0585                	addi	a1,a1,1
1c00ad02:	fff5c703          	lbu	a4,-1(a1)
1c00ad06:	0785                	addi	a5,a5,1
1c00ad08:	fee78fa3          	sb	a4,-1(a5)
1c00ad0c:	b7fd                	j	1c00acfa <memcpy+0x4>

1c00ad0e <memmove>:
1c00ad0e:	40b507b3          	sub	a5,a0,a1
1c00ad12:	00c7e763          	bltu	a5,a2,1c00ad20 <memmove+0x12>
1c00ad16:	962e                	add	a2,a2,a1
1c00ad18:	87aa                	mv	a5,a0
1c00ad1a:	00c59e63          	bne	a1,a2,1c00ad36 <memmove+0x28>
1c00ad1e:	8082                	ret
1c00ad20:	167d                	addi	a2,a2,-1
1c00ad22:	00c587b3          	add	a5,a1,a2
1c00ad26:	0007c703          	lbu	a4,0(a5)
1c00ad2a:	00c507b3          	add	a5,a0,a2
1c00ad2e:	00e78023          	sb	a4,0(a5)
1c00ad32:	f67d                	bnez	a2,1c00ad20 <memmove+0x12>
1c00ad34:	8082                	ret
1c00ad36:	0005c703          	lbu	a4,0(a1)
1c00ad3a:	0785                	addi	a5,a5,1
1c00ad3c:	0585                	addi	a1,a1,1
1c00ad3e:	fee78fa3          	sb	a4,-1(a5)
1c00ad42:	bfe1                	j	1c00ad1a <memmove+0xc>

1c00ad44 <strchr>:
1c00ad44:	0ff5f593          	andi	a1,a1,255
1c00ad48:	00054783          	lbu	a5,0(a0)
1c00ad4c:	00b78563          	beq	a5,a1,1c00ad56 <strchr+0x12>
1c00ad50:	e781                	bnez	a5,1c00ad58 <strchr+0x14>
1c00ad52:	c191                	beqz	a1,1c00ad56 <strchr+0x12>
1c00ad54:	4501                	li	a0,0
1c00ad56:	8082                	ret
1c00ad58:	0505                	addi	a0,a0,1
1c00ad5a:	b7fd                	j	1c00ad48 <strchr+0x4>

1c00ad5c <__rt_putc_debug_bridge>:
1c00ad5c:	1141                	addi	sp,sp,-16
1c00ad5e:	c422                	sw	s0,8(sp)
1c00ad60:	1c001437          	lui	s0,0x1c001
1c00ad64:	c226                	sw	s1,4(sp)
1c00ad66:	c606                	sw	ra,12(sp)
1c00ad68:	84aa                	mv	s1,a0
1c00ad6a:	f4c40413          	addi	s0,s0,-180 # 1c000f4c <__hal_debug_struct>
1c00ad6e:	485c                	lw	a5,20(s0)
1c00ad70:	c791                	beqz	a5,1c00ad7c <__rt_putc_debug_bridge+0x20>
1c00ad72:	06400513          	li	a0,100
1c00ad76:	d5cff0ef          	jal	ra,1c00a2d2 <rt_time_wait_us>
1c00ad7a:	bfd5                	j	1c00ad6e <__rt_putc_debug_bridge+0x12>
1c00ad7c:	4c1c                	lw	a5,24(s0)
1c00ad7e:	00178713          	addi	a4,a5,1
1c00ad82:	97a2                	add	a5,a5,s0
1c00ad84:	00978e23          	sb	s1,28(a5)
1c00ad88:	cc18                	sw	a4,24(s0)
1c00ad8a:	4c14                	lw	a3,24(s0)
1c00ad8c:	08000793          	li	a5,128
1c00ad90:	00f68563          	beq	a3,a5,1c00ad9a <__rt_putc_debug_bridge+0x3e>
1c00ad94:	47a9                	li	a5,10
1c00ad96:	00f49663          	bne	s1,a5,1c00ada2 <__rt_putc_debug_bridge+0x46>
1c00ad9a:	c701                	beqz	a4,1c00ada2 <__rt_putc_debug_bridge+0x46>
1c00ad9c:	c858                	sw	a4,20(s0)
1c00ad9e:	00042c23          	sw	zero,24(s0)
1c00ada2:	4c1c                	lw	a5,24(s0)
1c00ada4:	e799                	bnez	a5,1c00adb2 <__rt_putc_debug_bridge+0x56>
1c00ada6:	4422                	lw	s0,8(sp)
1c00ada8:	40b2                	lw	ra,12(sp)
1c00adaa:	4492                	lw	s1,4(sp)
1c00adac:	0141                	addi	sp,sp,16
1c00adae:	91eff06f          	j	1c009ecc <__rt_bridge_printf_flush>
1c00adb2:	40b2                	lw	ra,12(sp)
1c00adb4:	4422                	lw	s0,8(sp)
1c00adb6:	4492                	lw	s1,4(sp)
1c00adb8:	0141                	addi	sp,sp,16
1c00adba:	8082                	ret

1c00adbc <__rt_putc_uart>:
1c00adbc:	1101                	addi	sp,sp,-32
1c00adbe:	c62a                	sw	a0,12(sp)
1c00adc0:	ce06                	sw	ra,28(sp)
1c00adc2:	336d                	jal	1c00ab6c <__rt_io_uart_wait_pending>
1c00adc4:	1c0017b7          	lui	a5,0x1c001
1c00adc8:	f4c78793          	addi	a5,a5,-180 # 1c000f4c <__hal_debug_struct>
1c00adcc:	4f94                	lw	a3,24(a5)
1c00adce:	4532                	lw	a0,12(sp)
1c00add0:	00168713          	addi	a4,a3,1
1c00add4:	cf98                	sw	a4,24(a5)
1c00add6:	97b6                	add	a5,a5,a3
1c00add8:	00a78e23          	sb	a0,28(a5)
1c00addc:	08000793          	li	a5,128
1c00ade0:	00f70563          	beq	a4,a5,1c00adea <__rt_putc_uart+0x2e>
1c00ade4:	47a9                	li	a5,10
1c00ade6:	00f51563          	bne	a0,a5,1c00adf0 <__rt_putc_uart+0x34>
1c00adea:	40f2                	lw	ra,28(sp)
1c00adec:	6105                	addi	sp,sp,32
1c00adee:	bd0d                	j	1c00ac20 <__rt_io_uart_flush.constprop.10>
1c00adf0:	40f2                	lw	ra,28(sp)
1c00adf2:	6105                	addi	sp,sp,32
1c00adf4:	8082                	ret

1c00adf6 <tfp_putc.isra.8>:
1c00adf6:	1c0017b7          	lui	a5,0x1c001
1c00adfa:	1207a783          	lw	a5,288(a5) # 1c001120 <_rt_io_uart>
1c00adfe:	c391                	beqz	a5,1c00ae02 <tfp_putc.isra.8+0xc>
1c00ae00:	bf75                	j	1c00adbc <__rt_putc_uart>
1c00ae02:	1c0017b7          	lui	a5,0x1c001
1c00ae06:	f5c7a783          	lw	a5,-164(a5) # 1c000f5c <__hal_debug_struct+0x10>
1c00ae0a:	c395                	beqz	a5,1c00ae2e <tfp_putc.isra.8+0x38>
1c00ae0c:	6689                	lui	a3,0x2
1c00ae0e:	f14027f3          	csrr	a5,mhartid
1c00ae12:	f8068693          	addi	a3,a3,-128 # 1f80 <__rt_hyper_pending_emu_stride+0x1cd8>
1c00ae16:	00379713          	slli	a4,a5,0x3
1c00ae1a:	078a                	slli	a5,a5,0x2
1c00ae1c:	0ff77713          	andi	a4,a4,255
1c00ae20:	8ff5                	and	a5,a5,a3
1c00ae22:	97ba                	add	a5,a5,a4
1c00ae24:	1a10f737          	lui	a4,0x1a10f
1c00ae28:	97ba                	add	a5,a5,a4
1c00ae2a:	c388                	sw	a0,0(a5)
1c00ae2c:	8082                	ret
1c00ae2e:	b73d                	j	1c00ad5c <__rt_putc_debug_bridge>

1c00ae30 <fputc_locked>:
1c00ae30:	1141                	addi	sp,sp,-16
1c00ae32:	c422                	sw	s0,8(sp)
1c00ae34:	842a                	mv	s0,a0
1c00ae36:	0ff57513          	andi	a0,a0,255
1c00ae3a:	c606                	sw	ra,12(sp)
1c00ae3c:	3f6d                	jal	1c00adf6 <tfp_putc.isra.8>
1c00ae3e:	8522                	mv	a0,s0
1c00ae40:	40b2                	lw	ra,12(sp)
1c00ae42:	4422                	lw	s0,8(sp)
1c00ae44:	0141                	addi	sp,sp,16
1c00ae46:	8082                	ret

1c00ae48 <_prf_locked>:
1c00ae48:	1101                	addi	sp,sp,-32
1c00ae4a:	ce06                	sw	ra,28(sp)
1c00ae4c:	c02a                	sw	a0,0(sp)
1c00ae4e:	c62e                	sw	a1,12(sp)
1c00ae50:	c432                	sw	a2,8(sp)
1c00ae52:	c236                	sw	a3,4(sp)
1c00ae54:	3985                	jal	1c00aac4 <__rt_io_lock>
1c00ae56:	4692                	lw	a3,4(sp)
1c00ae58:	4622                	lw	a2,8(sp)
1c00ae5a:	45b2                	lw	a1,12(sp)
1c00ae5c:	4502                	lw	a0,0(sp)
1c00ae5e:	2acd                	jal	1c00b050 <_prf>
1c00ae60:	c02a                	sw	a0,0(sp)
1c00ae62:	395d                	jal	1c00ab18 <__rt_io_unlock>
1c00ae64:	40f2                	lw	ra,28(sp)
1c00ae66:	4502                	lw	a0,0(sp)
1c00ae68:	6105                	addi	sp,sp,32
1c00ae6a:	8082                	ret

1c00ae6c <exit>:
1c00ae6c:	1141                	addi	sp,sp,-16
1c00ae6e:	c226                	sw	s1,4(sp)
1c00ae70:	800004b7          	lui	s1,0x80000
1c00ae74:	8cc9                	or	s1,s1,a0
1c00ae76:	1a1047b7          	lui	a5,0x1a104
1c00ae7a:	c606                	sw	ra,12(sp)
1c00ae7c:	c422                	sw	s0,8(sp)
1c00ae7e:	1c001437          	lui	s0,0x1c001
1c00ae82:	0a97a023          	sw	s1,160(a5) # 1a1040a0 <__l1_end+0xa101c94>
1c00ae86:	f4c40413          	addi	s0,s0,-180 # 1c000f4c <__hal_debug_struct>
1c00ae8a:	842ff0ef          	jal	ra,1c009ecc <__rt_bridge_printf_flush>
1c00ae8e:	c444                	sw	s1,12(s0)
1c00ae90:	80cff0ef          	jal	ra,1c009e9c <__rt_bridge_send_notif>
1c00ae94:	441c                	lw	a5,8(s0)
1c00ae96:	cb99                	beqz	a5,1c00aeac <exit+0x40>
1c00ae98:	1a1046b7          	lui	a3,0x1a104
1c00ae9c:	471d                	li	a4,7
1c00ae9e:	5afc                	lw	a5,116(a3)
1c00aea0:	83a5                	srli	a5,a5,0x9
1c00aea2:	8b9d                	andi	a5,a5,7
1c00aea4:	fee79de3          	bne	a5,a4,1c00ae9e <exit+0x32>
1c00aea8:	80aff0ef          	jal	ra,1c009eb2 <__rt_bridge_clear_notif>
1c00aeac:	a001                	j	1c00aeac <exit+0x40>

1c00aeae <abort>:
1c00aeae:	1141                	addi	sp,sp,-16
1c00aeb0:	557d                	li	a0,-1
1c00aeb2:	c606                	sw	ra,12(sp)
1c00aeb4:	3f65                	jal	1c00ae6c <exit>

1c00aeb6 <__rt_io_init>:
1c00aeb6:	1c0017b7          	lui	a5,0x1c001
1c00aeba:	f2c78793          	addi	a5,a5,-212 # 1c000f2c <__rt_io_fc_lock>
1c00aebe:	0007a223          	sw	zero,4(a5)
1c00aec2:	0007a023          	sw	zero,0(a5)
1c00aec6:	0007a623          	sw	zero,12(a5)
1c00aeca:	1c0017b7          	lui	a5,0x1c001
1c00aece:	1207a023          	sw	zero,288(a5) # 1c001120 <_rt_io_uart>
1c00aed2:	1c0017b7          	lui	a5,0x1c001
1c00aed6:	1007ac23          	sw	zero,280(a5) # 1c001118 <__rt_io_event_current>
1c00aeda:	1c0017b7          	lui	a5,0x1c001
1c00aede:	1247a703          	lw	a4,292(a5) # 1c001124 <__rt_iodev>
1c00aee2:	4785                	li	a5,1
1c00aee4:	02f71e63          	bne	a4,a5,1c00af20 <__rt_io_init+0x6a>
1c00aee8:	1c00b5b7          	lui	a1,0x1c00b
1c00aeec:	1141                	addi	sp,sp,-16
1c00aeee:	4601                	li	a2,0
1c00aef0:	a4258593          	addi	a1,a1,-1470 # 1c00aa42 <__rt_io_start>
1c00aef4:	4501                	li	a0,0
1c00aef6:	c606                	sw	ra,12(sp)
1c00aef8:	cedfe0ef          	jal	ra,1c009be4 <__rt_cbsys_add>
1c00aefc:	1c00b5b7          	lui	a1,0x1c00b
1c00af00:	bfa58593          	addi	a1,a1,-1030 # 1c00abfa <__rt_io_stop>
1c00af04:	4601                	li	a2,0
1c00af06:	4505                	li	a0,1
1c00af08:	cddfe0ef          	jal	ra,1c009be4 <__rt_cbsys_add>
1c00af0c:	40b2                	lw	ra,12(sp)
1c00af0e:	1c0017b7          	lui	a5,0x1c001
1c00af12:	1007ae23          	sw	zero,284(a5) # 1c00111c <__rt_io_pending_flush>
1c00af16:	4585                	li	a1,1
1c00af18:	4501                	li	a0,0
1c00af1a:	0141                	addi	sp,sp,16
1c00af1c:	998ff06f          	j	1c00a0b4 <rt_event_alloc>
1c00af20:	8082                	ret

1c00af22 <printf>:
1c00af22:	7139                	addi	sp,sp,-64
1c00af24:	d432                	sw	a2,40(sp)
1c00af26:	862a                	mv	a2,a0
1c00af28:	1c00b537          	lui	a0,0x1c00b
1c00af2c:	d22e                	sw	a1,36(sp)
1c00af2e:	d636                	sw	a3,44(sp)
1c00af30:	4589                	li	a1,2
1c00af32:	1054                	addi	a3,sp,36
1c00af34:	e3050513          	addi	a0,a0,-464 # 1c00ae30 <fputc_locked>
1c00af38:	ce06                	sw	ra,28(sp)
1c00af3a:	d83a                	sw	a4,48(sp)
1c00af3c:	da3e                	sw	a5,52(sp)
1c00af3e:	dc42                	sw	a6,56(sp)
1c00af40:	de46                	sw	a7,60(sp)
1c00af42:	c636                	sw	a3,12(sp)
1c00af44:	3711                	jal	1c00ae48 <_prf_locked>
1c00af46:	40f2                	lw	ra,28(sp)
1c00af48:	6121                	addi	sp,sp,64
1c00af4a:	8082                	ret

1c00af4c <_to_x>:
1c00af4c:	872a                	mv	a4,a0
1c00af4e:	87aa                	mv	a5,a0
1c00af50:	4325                	li	t1,9
1c00af52:	02c5f8b3          	remu	a7,a1,a2
1c00af56:	02700513          	li	a0,39
1c00af5a:	02c5d5b3          	divu	a1,a1,a2
1c00af5e:	0ff8f813          	andi	a6,a7,255
1c00af62:	01136363          	bltu	t1,a7,1c00af68 <_to_x+0x1c>
1c00af66:	4501                	li	a0,0
1c00af68:	03080813          	addi	a6,a6,48
1c00af6c:	0785                	addi	a5,a5,1
1c00af6e:	9542                	add	a0,a0,a6
1c00af70:	fea78fa3          	sb	a0,-1(a5)
1c00af74:	fdf9                	bnez	a1,1c00af52 <_to_x+0x6>
1c00af76:	03000613          	li	a2,48
1c00af7a:	40e78533          	sub	a0,a5,a4
1c00af7e:	00d54863          	blt	a0,a3,1c00af8e <_to_x+0x42>
1c00af82:	00078023          	sb	zero,0(a5)
1c00af86:	17fd                	addi	a5,a5,-1
1c00af88:	00f76763          	bltu	a4,a5,1c00af96 <_to_x+0x4a>
1c00af8c:	8082                	ret
1c00af8e:	0785                	addi	a5,a5,1
1c00af90:	fec78fa3          	sb	a2,-1(a5)
1c00af94:	b7dd                	j	1c00af7a <_to_x+0x2e>
1c00af96:	00074603          	lbu	a2,0(a4) # 1a10f000 <__l1_end+0xa10cbf4>
1c00af9a:	0007c683          	lbu	a3,0(a5)
1c00af9e:	0705                	addi	a4,a4,1
1c00afa0:	00c78023          	sb	a2,0(a5)
1c00afa4:	fed70fa3          	sb	a3,-1(a4)
1c00afa8:	17fd                	addi	a5,a5,-1
1c00afaa:	bff9                	j	1c00af88 <_to_x+0x3c>

1c00afac <_rlrshift>:
1c00afac:	411c                	lw	a5,0(a0)
1c00afae:	4154                	lw	a3,4(a0)
1c00afb0:	0017f713          	andi	a4,a5,1
1c00afb4:	01f69613          	slli	a2,a3,0x1f
1c00afb8:	8385                	srli	a5,a5,0x1
1c00afba:	8fd1                	or	a5,a5,a2
1c00afbc:	97ba                	add	a5,a5,a4
1c00afbe:	8285                	srli	a3,a3,0x1
1c00afc0:	00e7b733          	sltu	a4,a5,a4
1c00afc4:	9736                	add	a4,a4,a3
1c00afc6:	c11c                	sw	a5,0(a0)
1c00afc8:	c158                	sw	a4,4(a0)
1c00afca:	8082                	ret

1c00afcc <_ldiv5>:
1c00afcc:	4118                	lw	a4,0(a0)
1c00afce:	4154                	lw	a3,4(a0)
1c00afd0:	4615                	li	a2,5
1c00afd2:	00270793          	addi	a5,a4,2
1c00afd6:	00e7b733          	sltu	a4,a5,a4
1c00afda:	9736                	add	a4,a4,a3
1c00afdc:	02c755b3          	divu	a1,a4,a2
1c00afe0:	02b606b3          	mul	a3,a2,a1
1c00afe4:	8f15                	sub	a4,a4,a3
1c00afe6:	01d71693          	slli	a3,a4,0x1d
1c00afea:	0037d713          	srli	a4,a5,0x3
1c00afee:	8f55                	or	a4,a4,a3
1c00aff0:	02c75733          	divu	a4,a4,a2
1c00aff4:	01d75693          	srli	a3,a4,0x1d
1c00aff8:	070e                	slli	a4,a4,0x3
1c00affa:	95b6                	add	a1,a1,a3
1c00affc:	02e606b3          	mul	a3,a2,a4
1c00b000:	8f95                	sub	a5,a5,a3
1c00b002:	02c7d7b3          	divu	a5,a5,a2
1c00b006:	973e                	add	a4,a4,a5
1c00b008:	00f737b3          	sltu	a5,a4,a5
1c00b00c:	97ae                	add	a5,a5,a1
1c00b00e:	c118                	sw	a4,0(a0)
1c00b010:	c15c                	sw	a5,4(a0)
1c00b012:	8082                	ret

1c00b014 <_get_digit>:
1c00b014:	419c                	lw	a5,0(a1)
1c00b016:	03000713          	li	a4,48
1c00b01a:	02f05863          	blez	a5,1c00b04a <_get_digit+0x36>
1c00b01e:	17fd                	addi	a5,a5,-1
1c00b020:	4114                	lw	a3,0(a0)
1c00b022:	c19c                	sw	a5,0(a1)
1c00b024:	415c                	lw	a5,4(a0)
1c00b026:	4729                	li	a4,10
1c00b028:	02d70633          	mul	a2,a4,a3
1c00b02c:	02f707b3          	mul	a5,a4,a5
1c00b030:	c110                	sw	a2,0(a0)
1c00b032:	02d73733          	mulhu	a4,a4,a3
1c00b036:	100006b7          	lui	a3,0x10000
1c00b03a:	16fd                	addi	a3,a3,-1
1c00b03c:	97ba                	add	a5,a5,a4
1c00b03e:	01c7d713          	srli	a4,a5,0x1c
1c00b042:	8ff5                	and	a5,a5,a3
1c00b044:	03070713          	addi	a4,a4,48
1c00b048:	c15c                	sw	a5,4(a0)
1c00b04a:	0ff77513          	andi	a0,a4,255
1c00b04e:	8082                	ret

1c00b050 <_prf>:
1c00b050:	714d                	addi	sp,sp,-336
1c00b052:	14912223          	sw	s1,324(sp)
1c00b056:	13312e23          	sw	s3,316(sp)
1c00b05a:	13812423          	sw	s8,296(sp)
1c00b05e:	14112623          	sw	ra,332(sp)
1c00b062:	14812423          	sw	s0,328(sp)
1c00b066:	15212023          	sw	s2,320(sp)
1c00b06a:	13412c23          	sw	s4,312(sp)
1c00b06e:	13512a23          	sw	s5,308(sp)
1c00b072:	13612823          	sw	s6,304(sp)
1c00b076:	13712623          	sw	s7,300(sp)
1c00b07a:	13912223          	sw	s9,292(sp)
1c00b07e:	13a12023          	sw	s10,288(sp)
1c00b082:	11b12e23          	sw	s11,284(sp)
1c00b086:	cc2a                	sw	a0,24(sp)
1c00b088:	ce2e                	sw	a1,28(sp)
1c00b08a:	84b2                	mv	s1,a2
1c00b08c:	8c36                	mv	s8,a3
1c00b08e:	4981                	li	s3,0
1c00b090:	0004c503          	lbu	a0,0(s1) # 80000000 <pulp__FC+0x80000001>
1c00b094:	00148b93          	addi	s7,s1,1
1c00b098:	cd01                	beqz	a0,1c00b0b0 <_prf+0x60>
1c00b09a:	02500793          	li	a5,37
1c00b09e:	14f50963          	beq	a0,a5,1c00b1f0 <_prf+0x1a0>
1c00b0a2:	45f2                	lw	a1,28(sp)
1c00b0a4:	4762                	lw	a4,24(sp)
1c00b0a6:	9702                	jalr	a4
1c00b0a8:	57fd                	li	a5,-1
1c00b0aa:	04f51063          	bne	a0,a5,1c00b0ea <_prf+0x9a>
1c00b0ae:	59fd                	li	s3,-1
1c00b0b0:	14c12083          	lw	ra,332(sp)
1c00b0b4:	14812403          	lw	s0,328(sp)
1c00b0b8:	854e                	mv	a0,s3
1c00b0ba:	14412483          	lw	s1,324(sp)
1c00b0be:	14012903          	lw	s2,320(sp)
1c00b0c2:	13c12983          	lw	s3,316(sp)
1c00b0c6:	13812a03          	lw	s4,312(sp)
1c00b0ca:	13412a83          	lw	s5,308(sp)
1c00b0ce:	13012b03          	lw	s6,304(sp)
1c00b0d2:	12c12b83          	lw	s7,300(sp)
1c00b0d6:	12812c03          	lw	s8,296(sp)
1c00b0da:	12412c83          	lw	s9,292(sp)
1c00b0de:	12012d03          	lw	s10,288(sp)
1c00b0e2:	11c12d83          	lw	s11,284(sp)
1c00b0e6:	6171                	addi	sp,sp,336
1c00b0e8:	8082                	ret
1c00b0ea:	0985                	addi	s3,s3,1
1c00b0ec:	8a62                	mv	s4,s8
1c00b0ee:	84de                	mv	s1,s7
1c00b0f0:	8c52                	mv	s8,s4
1c00b0f2:	bf79                	j	1c00b090 <_prf+0x40>
1c00b0f4:	0f2a8563          	beq	s5,s2,1c00b1de <_prf+0x18e>
1c00b0f8:	0d596863          	bltu	s2,s5,1c00b1c8 <_prf+0x178>
1c00b0fc:	fa0a8ae3          	beqz	s5,1c00b0b0 <_prf+0x60>
1c00b100:	0dba8d63          	beq	s5,s11,1c00b1da <_prf+0x18a>
1c00b104:	8ba6                	mv	s7,s1
1c00b106:	001b8493          	addi	s1,s7,1
1c00b10a:	fff4ca83          	lbu	s5,-1(s1)
1c00b10e:	1c0007b7          	lui	a5,0x1c000
1c00b112:	5d878513          	addi	a0,a5,1496 # 1c0005d8 <__DTOR_END__+0x2ec>
1c00b116:	85d6                	mv	a1,s5
1c00b118:	3135                	jal	1c00ad44 <strchr>
1c00b11a:	fd69                	bnez	a0,1c00b0f4 <_prf+0xa4>
1c00b11c:	02a00693          	li	a3,42
1c00b120:	0eda9a63          	bne	s5,a3,1c00b214 <_prf+0x1c4>
1c00b124:	000c2903          	lw	s2,0(s8)
1c00b128:	004c0693          	addi	a3,s8,4
1c00b12c:	00095663          	bgez	s2,1c00b138 <_prf+0xe8>
1c00b130:	4705                	li	a4,1
1c00b132:	41200933          	neg	s2,s2
1c00b136:	c63a                	sw	a4,12(sp)
1c00b138:	0004ca83          	lbu	s5,0(s1)
1c00b13c:	8c36                	mv	s8,a3
1c00b13e:	002b8493          	addi	s1,s7,2
1c00b142:	0c800713          	li	a4,200
1c00b146:	01277463          	bleu	s2,a4,1c00b14e <_prf+0xfe>
1c00b14a:	0c800913          	li	s2,200
1c00b14e:	02e00693          	li	a3,46
1c00b152:	5d7d                	li	s10,-1
1c00b154:	02da9463          	bne	s5,a3,1c00b17c <_prf+0x12c>
1c00b158:	0004c703          	lbu	a4,0(s1)
1c00b15c:	02a00793          	li	a5,42
1c00b160:	10f71063          	bne	a4,a5,1c00b260 <_prf+0x210>
1c00b164:	000c2d03          	lw	s10,0(s8)
1c00b168:	0485                	addi	s1,s1,1
1c00b16a:	0c11                	addi	s8,s8,4
1c00b16c:	0c800793          	li	a5,200
1c00b170:	01a7d363          	ble	s10,a5,1c00b176 <_prf+0x126>
1c00b174:	5d7d                	li	s10,-1
1c00b176:	0004ca83          	lbu	s5,0(s1)
1c00b17a:	0485                	addi	s1,s1,1
1c00b17c:	1c0007b7          	lui	a5,0x1c000
1c00b180:	85d6                	mv	a1,s5
1c00b182:	5e078513          	addi	a0,a5,1504 # 1c0005e0 <__DTOR_END__+0x2f4>
1c00b186:	bbfff0ef          	jal	ra,1c00ad44 <strchr>
1c00b18a:	c501                	beqz	a0,1c00b192 <_prf+0x142>
1c00b18c:	0004ca83          	lbu	s5,0(s1)
1c00b190:	0485                	addi	s1,s1,1
1c00b192:	06700693          	li	a3,103
1c00b196:	1356c263          	blt	a3,s5,1c00b2ba <_prf+0x26a>
1c00b19a:	06500693          	li	a3,101
1c00b19e:	1edadd63          	ble	a3,s5,1c00b398 <_prf+0x348>
1c00b1a2:	04700693          	li	a3,71
1c00b1a6:	0d56c163          	blt	a3,s5,1c00b268 <_prf+0x218>
1c00b1aa:	04500693          	li	a3,69
1c00b1ae:	1edad563          	ble	a3,s5,1c00b398 <_prf+0x348>
1c00b1b2:	ee0a8fe3          	beqz	s5,1c00b0b0 <_prf+0x60>
1c00b1b6:	02500713          	li	a4,37
1c00b1ba:	68ea8263          	beq	s5,a4,1c00b83e <_prf+0x7ee>
1c00b1be:	0c800713          	li	a4,200
1c00b1c2:	69575763          	ble	s5,a4,1c00b850 <_prf+0x800>
1c00b1c6:	b5e5                	j	1c00b0ae <_prf+0x5e>
1c00b1c8:	034a8163          	beq	s5,s4,1c00b1ea <_prf+0x19a>
1c00b1cc:	016a8b63          	beq	s5,s6,1c00b1e2 <_prf+0x192>
1c00b1d0:	f3aa9ae3          	bne	s5,s10,1c00b104 <_prf+0xb4>
1c00b1d4:	4785                	li	a5,1
1c00b1d6:	ca3e                	sw	a5,20(sp)
1c00b1d8:	b735                	j	1c00b104 <_prf+0xb4>
1c00b1da:	4405                	li	s0,1
1c00b1dc:	b725                	j	1c00b104 <_prf+0xb4>
1c00b1de:	4c85                	li	s9,1
1c00b1e0:	b715                	j	1c00b104 <_prf+0xb4>
1c00b1e2:	03000713          	li	a4,48
1c00b1e6:	c83a                	sw	a4,16(sp)
1c00b1e8:	bf31                	j	1c00b104 <_prf+0xb4>
1c00b1ea:	4785                	li	a5,1
1c00b1ec:	c63e                	sw	a5,12(sp)
1c00b1ee:	bf19                	j	1c00b104 <_prf+0xb4>
1c00b1f0:	02000713          	li	a4,32
1c00b1f4:	c83a                	sw	a4,16(sp)
1c00b1f6:	4401                	li	s0,0
1c00b1f8:	ca02                	sw	zero,20(sp)
1c00b1fa:	c602                	sw	zero,12(sp)
1c00b1fc:	4c81                	li	s9,0
1c00b1fe:	02300913          	li	s2,35
1c00b202:	02d00a13          	li	s4,45
1c00b206:	03000b13          	li	s6,48
1c00b20a:	02b00d13          	li	s10,43
1c00b20e:	02000d93          	li	s11,32
1c00b212:	bdd5                	j	1c00b106 <_prf+0xb6>
1c00b214:	fd0a8693          	addi	a3,s5,-48
1c00b218:	4625                	li	a2,9
1c00b21a:	4901                	li	s2,0
1c00b21c:	45a9                	li	a1,10
1c00b21e:	f2d662e3          	bltu	a2,a3,1c00b142 <_prf+0xf2>
1c00b222:	000bc683          	lbu	a3,0(s7)
1c00b226:	001b8493          	addi	s1,s7,1
1c00b22a:	fd068713          	addi	a4,a3,-48 # fffffd0 <__l1_heap_size+0xfff23dc>
1c00b22e:	8ab6                	mv	s5,a3
1c00b230:	f0e669e3          	bltu	a2,a4,1c00b142 <_prf+0xf2>
1c00b234:	02b90933          	mul	s2,s2,a1
1c00b238:	8ba6                	mv	s7,s1
1c00b23a:	9936                	add	s2,s2,a3
1c00b23c:	fd090913          	addi	s2,s2,-48
1c00b240:	b7cd                	j	1c00b222 <_prf+0x1d2>
1c00b242:	02ad0733          	mul	a4,s10,a0
1c00b246:	84ae                	mv	s1,a1
1c00b248:	973e                	add	a4,a4,a5
1c00b24a:	fd070d13          	addi	s10,a4,-48
1c00b24e:	0004c783          	lbu	a5,0(s1)
1c00b252:	00148593          	addi	a1,s1,1
1c00b256:	fd078613          	addi	a2,a5,-48
1c00b25a:	fec6f4e3          	bleu	a2,a3,1c00b242 <_prf+0x1f2>
1c00b25e:	b739                	j	1c00b16c <_prf+0x11c>
1c00b260:	4d01                	li	s10,0
1c00b262:	46a5                	li	a3,9
1c00b264:	4529                	li	a0,10
1c00b266:	b7e5                	j	1c00b24e <_prf+0x1fe>
1c00b268:	06300693          	li	a3,99
1c00b26c:	0cda8b63          	beq	s5,a3,1c00b342 <_prf+0x2f2>
1c00b270:	0756c563          	blt	a3,s5,1c00b2da <_prf+0x28a>
1c00b274:	05800693          	li	a3,88
1c00b278:	f4da93e3          	bne	s5,a3,1c00b1be <_prf+0x16e>
1c00b27c:	04410b93          	addi	s7,sp,68
1c00b280:	004c0a13          	addi	s4,s8,4
1c00b284:	000c2583          	lw	a1,0(s8)
1c00b288:	845e                	mv	s0,s7
1c00b28a:	000c8963          	beqz	s9,1c00b29c <_prf+0x24c>
1c00b28e:	76e1                	lui	a3,0xffff8
1c00b290:	8306c693          	xori	a3,a3,-2000
1c00b294:	04d11223          	sh	a3,68(sp)
1c00b298:	04610413          	addi	s0,sp,70
1c00b29c:	86ea                	mv	a3,s10
1c00b29e:	4641                	li	a2,16
1c00b2a0:	8522                	mv	a0,s0
1c00b2a2:	316d                	jal	1c00af4c <_to_x>
1c00b2a4:	05800693          	li	a3,88
1c00b2a8:	58da8863          	beq	s5,a3,1c00b838 <_prf+0x7e8>
1c00b2ac:	41740433          	sub	s0,s0,s7
1c00b2b0:	9522                	add	a0,a0,s0
1c00b2b2:	01903433          	snez	s0,s9
1c00b2b6:	0406                	slli	s0,s0,0x1
1c00b2b8:	a8c9                	j	1c00b38a <_prf+0x33a>
1c00b2ba:	07000693          	li	a3,112
1c00b2be:	50da8163          	beq	s5,a3,1c00b7c0 <_prf+0x770>
1c00b2c2:	0556c163          	blt	a3,s5,1c00b304 <_prf+0x2b4>
1c00b2c6:	06e00693          	li	a3,110
1c00b2ca:	46da8b63          	beq	s5,a3,1c00b740 <_prf+0x6f0>
1c00b2ce:	4956c063          	blt	a3,s5,1c00b74e <_prf+0x6fe>
1c00b2d2:	06900693          	li	a3,105
1c00b2d6:	eeda94e3          	bne	s5,a3,1c00b1be <_prf+0x16e>
1c00b2da:	000c2a83          	lw	s5,0(s8)
1c00b2de:	004c0a13          	addi	s4,s8,4
1c00b2e2:	04410b13          	addi	s6,sp,68
1c00b2e6:	060ad963          	bgez	s5,1c00b358 <_prf+0x308>
1c00b2ea:	02d00693          	li	a3,45
1c00b2ee:	04d10223          	sb	a3,68(sp)
1c00b2f2:	800006b7          	lui	a3,0x80000
1c00b2f6:	415005b3          	neg	a1,s5
1c00b2fa:	06da9963          	bne	s5,a3,1c00b36c <_prf+0x31c>
1c00b2fe:	800005b7          	lui	a1,0x80000
1c00b302:	a0ad                	j	1c00b36c <_prf+0x31c>
1c00b304:	07500693          	li	a3,117
1c00b308:	50da8063          	beq	s5,a3,1c00b808 <_prf+0x7b8>
1c00b30c:	07800693          	li	a3,120
1c00b310:	f6da86e3          	beq	s5,a3,1c00b27c <_prf+0x22c>
1c00b314:	07300693          	li	a3,115
1c00b318:	eada93e3          	bne	s5,a3,1c00b1be <_prf+0x16e>
1c00b31c:	000c2583          	lw	a1,0(s8)
1c00b320:	004c0a13          	addi	s4,s8,4
1c00b324:	4c81                	li	s9,0
1c00b326:	0c800793          	li	a5,200
1c00b32a:	019586b3          	add	a3,a1,s9
1c00b32e:	0006c683          	lbu	a3,0(a3) # 80000000 <pulp__FC+0x80000001>
1c00b332:	4a068f63          	beqz	a3,1c00b7f0 <_prf+0x7a0>
1c00b336:	0c85                	addi	s9,s9,1
1c00b338:	fefc99e3          	bne	s9,a5,1c00b32a <_prf+0x2da>
1c00b33c:	4a0d5c63          	bgez	s10,1c00b7f4 <_prf+0x7a4>
1c00b340:	a97d                	j	1c00b7fe <_prf+0x7ae>
1c00b342:	000c2783          	lw	a5,0(s8)
1c00b346:	004c0a13          	addi	s4,s8,4
1c00b34a:	040102a3          	sb	zero,69(sp)
1c00b34e:	04f10223          	sb	a5,68(sp)
1c00b352:	4c85                	li	s9,1
1c00b354:	4401                	li	s0,0
1c00b356:	a105                	j	1c00b776 <_prf+0x726>
1c00b358:	4752                	lw	a4,20(sp)
1c00b35a:	02b00693          	li	a3,43
1c00b35e:	e701                	bnez	a4,1c00b366 <_prf+0x316>
1c00b360:	c41d                	beqz	s0,1c00b38e <_prf+0x33e>
1c00b362:	02000693          	li	a3,32
1c00b366:	04d10223          	sb	a3,68(sp)
1c00b36a:	85d6                	mv	a1,s5
1c00b36c:	04510c13          	addi	s8,sp,69
1c00b370:	86ea                	mv	a3,s10
1c00b372:	4629                	li	a2,10
1c00b374:	8562                	mv	a0,s8
1c00b376:	bd7ff0ef          	jal	ra,1c00af4c <_to_x>
1c00b37a:	47d2                	lw	a5,20(sp)
1c00b37c:	9562                	add	a0,a0,s8
1c00b37e:	41650533          	sub	a0,a0,s6
1c00b382:	eb89                	bnez	a5,1c00b394 <_prf+0x344>
1c00b384:	e019                	bnez	s0,1c00b38a <_prf+0x33a>
1c00b386:	01fad413          	srli	s0,s5,0x1f
1c00b38a:	57fd                	li	a5,-1
1c00b38c:	a9a1                	j	1c00b7e4 <_prf+0x794>
1c00b38e:	85d6                	mv	a1,s5
1c00b390:	8c5a                	mv	s8,s6
1c00b392:	bff9                	j	1c00b370 <_prf+0x320>
1c00b394:	4452                	lw	s0,20(sp)
1c00b396:	bfd5                	j	1c00b38a <_prf+0x33a>
1c00b398:	0c1d                	addi	s8,s8,7
1c00b39a:	ff8c7c13          	andi	s8,s8,-8
1c00b39e:	000c2883          	lw	a7,0(s8)
1c00b3a2:	004c2303          	lw	t1,4(s8)
1c00b3a6:	80000737          	lui	a4,0x80000
1c00b3aa:	0158d593          	srli	a1,a7,0x15
1c00b3ae:	00b31693          	slli	a3,t1,0xb
1c00b3b2:	8ecd                	or	a3,a3,a1
1c00b3b4:	fff74713          	not	a4,a4
1c00b3b8:	01435613          	srli	a2,t1,0x14
1c00b3bc:	08ae                	slli	a7,a7,0xb
1c00b3be:	8ef9                	and	a3,a3,a4
1c00b3c0:	7ff67613          	andi	a2,a2,2047
1c00b3c4:	d846                	sw	a7,48(sp)
1c00b3c6:	da36                	sw	a3,52(sp)
1c00b3c8:	7ff00593          	li	a1,2047
1c00b3cc:	008c0a13          	addi	s4,s8,8
1c00b3d0:	08b61d63          	bne	a2,a1,1c00b46a <_prf+0x41a>
1c00b3d4:	00d0                	addi	a2,sp,68
1c00b3d6:	8732                	mv	a4,a2
1c00b3d8:	00035863          	bgez	t1,1c00b3e8 <_prf+0x398>
1c00b3dc:	02d00713          	li	a4,45
1c00b3e0:	04e10223          	sb	a4,68(sp)
1c00b3e4:	04510713          	addi	a4,sp,69
1c00b3e8:	00d8e6b3          	or	a3,a7,a3
1c00b3ec:	fbfa8793          	addi	a5,s5,-65
1c00b3f0:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c00b3f4:	eaa1                	bnez	a3,1c00b444 <_prf+0x3f4>
1c00b3f6:	46e5                	li	a3,25
1c00b3f8:	02f6ee63          	bltu	a3,a5,1c00b434 <_prf+0x3e4>
1c00b3fc:	6795                	lui	a5,0x5
1c00b3fe:	e4978793          	addi	a5,a5,-439 # 4e49 <_l1_preload_size+0x2a41>
1c00b402:	00f71023          	sh	a5,0(a4)
1c00b406:	04600793          	li	a5,70
1c00b40a:	00f70123          	sb	a5,2(a4)
1c00b40e:	000701a3          	sb	zero,3(a4)
1c00b412:	8d11                	sub	a0,a0,a2
1c00b414:	47d2                	lw	a5,20(sp)
1c00b416:	48079f63          	bnez	a5,1c00b8b4 <_prf+0x864>
1c00b41a:	e419                	bnez	s0,1c00b428 <_prf+0x3d8>
1c00b41c:	04414403          	lbu	s0,68(sp)
1c00b420:	fd340413          	addi	s0,s0,-45
1c00b424:	00143413          	seqz	s0,s0
1c00b428:	0c800793          	li	a5,200
1c00b42c:	c8a7c1e3          	blt	a5,a0,1c00b0ae <_prf+0x5e>
1c00b430:	8caa                	mv	s9,a0
1c00b432:	a691                	j	1c00b776 <_prf+0x726>
1c00b434:	679d                	lui	a5,0x7
1c00b436:	e6978793          	addi	a5,a5,-407 # 6e69 <_l1_preload_size+0x4a61>
1c00b43a:	00f71023          	sh	a5,0(a4)
1c00b43e:	06600793          	li	a5,102
1c00b442:	b7e1                	j	1c00b40a <_prf+0x3ba>
1c00b444:	46e5                	li	a3,25
1c00b446:	00f6ea63          	bltu	a3,a5,1c00b45a <_prf+0x40a>
1c00b44a:	6791                	lui	a5,0x4
1c00b44c:	14e78793          	addi	a5,a5,334 # 414e <_l1_preload_size+0x1d46>
1c00b450:	00f71023          	sh	a5,0(a4)
1c00b454:	04e00793          	li	a5,78
1c00b458:	bf4d                	j	1c00b40a <_prf+0x3ba>
1c00b45a:	6799                	lui	a5,0x6
1c00b45c:	16e78793          	addi	a5,a5,366 # 616e <_l1_preload_size+0x3d66>
1c00b460:	00f71023          	sh	a5,0(a4)
1c00b464:	06e00793          	li	a5,110
1c00b468:	b74d                	j	1c00b40a <_prf+0x3ba>
1c00b46a:	04600593          	li	a1,70
1c00b46e:	00ba9463          	bne	s5,a1,1c00b476 <_prf+0x426>
1c00b472:	06600a93          	li	s5,102
1c00b476:	011665b3          	or	a1,a2,a7
1c00b47a:	8dd5                	or	a1,a1,a3
1c00b47c:	c9c9                	beqz	a1,1c00b50e <_prf+0x4be>
1c00b47e:	800007b7          	lui	a5,0x80000
1c00b482:	8edd                	or	a3,a3,a5
1c00b484:	da36                	sw	a3,52(sp)
1c00b486:	d846                	sw	a7,48(sp)
1c00b488:	c0260c13          	addi	s8,a2,-1022
1c00b48c:	02d00693          	li	a3,45
1c00b490:	00034b63          	bltz	t1,1c00b4a6 <_prf+0x456>
1c00b494:	4752                	lw	a4,20(sp)
1c00b496:	02b00693          	li	a3,43
1c00b49a:	e711                	bnez	a4,1c00b4a6 <_prf+0x456>
1c00b49c:	04410b13          	addi	s6,sp,68
1c00b4a0:	c419                	beqz	s0,1c00b4ae <_prf+0x45e>
1c00b4a2:	02000693          	li	a3,32
1c00b4a6:	04d10223          	sb	a3,68(sp)
1c00b4aa:	04510b13          	addi	s6,sp,69
1c00b4ae:	4b81                	li	s7,0
1c00b4b0:	55f9                	li	a1,-2
1c00b4b2:	06bc4363          	blt	s8,a1,1c00b518 <_prf+0x4c8>
1c00b4b6:	0b804a63          	bgtz	s8,1c00b56a <_prf+0x51a>
1c00b4ba:	4d91                	li	s11,4
1c00b4bc:	1808                	addi	a0,sp,48
1c00b4be:	0c05                	addi	s8,s8,1
1c00b4c0:	aedff0ef          	jal	ra,1c00afac <_rlrshift>
1c00b4c4:	ffbc1ce3          	bne	s8,s11,1c00b4bc <_prf+0x46c>
1c00b4c8:	000d5363          	bgez	s10,1c00b4ce <_prf+0x47e>
1c00b4cc:	4d19                	li	s10,6
1c00b4ce:	fdfaf593          	andi	a1,s5,-33
1c00b4d2:	04700513          	li	a0,71
1c00b4d6:	0ca59663          	bne	a1,a0,1c00b5a2 <_prf+0x552>
1c00b4da:	4c01                	li	s8,0
1c00b4dc:	000c9463          	bnez	s9,1c00b4e4 <_prf+0x494>
1c00b4e0:	01a03c33          	snez	s8,s10
1c00b4e4:	55f5                	li	a1,-3
1c00b4e6:	00bbc663          	blt	s7,a1,1c00b4f2 <_prf+0x4a2>
1c00b4ea:	001d0593          	addi	a1,s10,1
1c00b4ee:	0b75df63          	ble	s7,a1,1c00b5ac <_prf+0x55c>
1c00b4f2:	06700593          	li	a1,103
1c00b4f6:	14ba8c63          	beq	s5,a1,1c00b64e <_prf+0x5fe>
1c00b4fa:	04500a93          	li	s5,69
1c00b4fe:	001d0593          	addi	a1,s10,1
1c00b502:	4541                	li	a0,16
1c00b504:	d62a                	sw	a0,44(sp)
1c00b506:	0ab55c63          	ble	a1,a0,1c00b5be <_prf+0x56e>
1c00b50a:	45c1                	li	a1,16
1c00b50c:	a84d                	j	1c00b5be <_prf+0x56e>
1c00b50e:	4c01                	li	s8,0
1c00b510:	b751                	j	1c00b494 <_prf+0x444>
1c00b512:	1808                	addi	a0,sp,48
1c00b514:	a99ff0ef          	jal	ra,1c00afac <_rlrshift>
1c00b518:	55d2                	lw	a1,52(sp)
1c00b51a:	333337b7          	lui	a5,0x33333
1c00b51e:	33278793          	addi	a5,a5,818 # 33333332 <__l2_shared_end+0x17320da2>
1c00b522:	5342                	lw	t1,48(sp)
1c00b524:	0c05                	addi	s8,s8,1
1c00b526:	feb7e6e3          	bltu	a5,a1,1c00b512 <_prf+0x4c2>
1c00b52a:	4895                	li	a7,5
1c00b52c:	02b88533          	mul	a0,a7,a1
1c00b530:	1bfd                	addi	s7,s7,-1
1c00b532:	0268b5b3          	mulhu	a1,a7,t1
1c00b536:	026888b3          	mul	a7,a7,t1
1c00b53a:	95aa                	add	a1,a1,a0
1c00b53c:	da2e                	sw	a1,52(sp)
1c00b53e:	4501                	li	a0,0
1c00b540:	d846                	sw	a7,48(sp)
1c00b542:	800006b7          	lui	a3,0x80000
1c00b546:	fff6c693          	not	a3,a3
1c00b54a:	00b6f663          	bleu	a1,a3,1c00b556 <_prf+0x506>
1c00b54e:	d12d                	beqz	a0,1c00b4b0 <_prf+0x460>
1c00b550:	d846                	sw	a7,48(sp)
1c00b552:	da2e                	sw	a1,52(sp)
1c00b554:	bfb1                	j	1c00b4b0 <_prf+0x460>
1c00b556:	01f8d313          	srli	t1,a7,0x1f
1c00b55a:	00159513          	slli	a0,a1,0x1
1c00b55e:	00a365b3          	or	a1,t1,a0
1c00b562:	0886                	slli	a7,a7,0x1
1c00b564:	1c7d                	addi	s8,s8,-1
1c00b566:	4505                	li	a0,1
1c00b568:	bfe9                	j	1c00b542 <_prf+0x4f2>
1c00b56a:	1808                	addi	a0,sp,48
1c00b56c:	a61ff0ef          	jal	ra,1c00afcc <_ldiv5>
1c00b570:	58c2                	lw	a7,48(sp)
1c00b572:	55d2                	lw	a1,52(sp)
1c00b574:	1c7d                	addi	s8,s8,-1
1c00b576:	0b85                	addi	s7,s7,1
1c00b578:	4501                	li	a0,0
1c00b57a:	80000737          	lui	a4,0x80000
1c00b57e:	fff74713          	not	a4,a4
1c00b582:	00b77663          	bleu	a1,a4,1c00b58e <_prf+0x53e>
1c00b586:	d905                	beqz	a0,1c00b4b6 <_prf+0x466>
1c00b588:	d846                	sw	a7,48(sp)
1c00b58a:	da2e                	sw	a1,52(sp)
1c00b58c:	b72d                	j	1c00b4b6 <_prf+0x466>
1c00b58e:	01f8d313          	srli	t1,a7,0x1f
1c00b592:	00159513          	slli	a0,a1,0x1
1c00b596:	00a365b3          	or	a1,t1,a0
1c00b59a:	0886                	slli	a7,a7,0x1
1c00b59c:	1c7d                	addi	s8,s8,-1
1c00b59e:	4505                	li	a0,1
1c00b5a0:	bfe9                	j	1c00b57a <_prf+0x52a>
1c00b5a2:	06600593          	li	a1,102
1c00b5a6:	4c01                	li	s8,0
1c00b5a8:	f4ba9be3          	bne	s5,a1,1c00b4fe <_prf+0x4ae>
1c00b5ac:	01ab85b3          	add	a1,s7,s10
1c00b5b0:	06600a93          	li	s5,102
1c00b5b4:	f405d7e3          	bgez	a1,1c00b502 <_prf+0x4b2>
1c00b5b8:	45c1                	li	a1,16
1c00b5ba:	d62e                	sw	a1,44(sp)
1c00b5bc:	4581                	li	a1,0
1c00b5be:	4301                	li	t1,0
1c00b5c0:	080003b7          	lui	t2,0x8000
1c00b5c4:	dc1a                	sw	t1,56(sp)
1c00b5c6:	de1e                	sw	t2,60(sp)
1c00b5c8:	5dfd                	li	s11,-1
1c00b5ca:	15fd                	addi	a1,a1,-1
1c00b5cc:	09b59463          	bne	a1,s11,1c00b654 <_prf+0x604>
1c00b5d0:	55c2                	lw	a1,48(sp)
1c00b5d2:	5562                	lw	a0,56(sp)
1c00b5d4:	58d2                	lw	a7,52(sp)
1c00b5d6:	5372                	lw	t1,60(sp)
1c00b5d8:	952e                	add	a0,a0,a1
1c00b5da:	00b535b3          	sltu	a1,a0,a1
1c00b5de:	989a                	add	a7,a7,t1
1c00b5e0:	95c6                	add	a1,a1,a7
1c00b5e2:	d82a                	sw	a0,48(sp)
1c00b5e4:	f0000537          	lui	a0,0xf0000
1c00b5e8:	da2e                	sw	a1,52(sp)
1c00b5ea:	8de9                	and	a1,a1,a0
1c00b5ec:	c981                	beqz	a1,1c00b5fc <_prf+0x5ac>
1c00b5ee:	1808                	addi	a0,sp,48
1c00b5f0:	9ddff0ef          	jal	ra,1c00afcc <_ldiv5>
1c00b5f4:	1808                	addi	a0,sp,48
1c00b5f6:	9b7ff0ef          	jal	ra,1c00afac <_rlrshift>
1c00b5fa:	0b85                	addi	s7,s7,1
1c00b5fc:	06600593          	li	a1,102
1c00b600:	001b0d93          	addi	s11,s6,1
1c00b604:	08ba9663          	bne	s5,a1,1c00b690 <_prf+0x640>
1c00b608:	05705f63          	blez	s7,1c00b666 <_prf+0x616>
1c00b60c:	017b0db3          	add	s11,s6,s7
1c00b610:	106c                	addi	a1,sp,44
1c00b612:	1808                	addi	a0,sp,48
1c00b614:	0b05                	addi	s6,s6,1
1c00b616:	9ffff0ef          	jal	ra,1c00b014 <_get_digit>
1c00b61a:	feab0fa3          	sb	a0,-1(s6)
1c00b61e:	ffbb19e3          	bne	s6,s11,1c00b610 <_prf+0x5c0>
1c00b622:	4b81                	li	s7,0
1c00b624:	000c9463          	bnez	s9,1c00b62c <_prf+0x5dc>
1c00b628:	020d0063          	beqz	s10,1c00b648 <_prf+0x5f8>
1c00b62c:	02e00613          	li	a2,46
1c00b630:	00cd8023          	sb	a2,0(s11)
1c00b634:	8b6e                	mv	s6,s11
1c00b636:	01ad8cb3          	add	s9,s11,s10
1c00b63a:	03000313          	li	t1,48
1c00b63e:	036c9963          	bne	s9,s6,1c00b670 <_prf+0x620>
1c00b642:	001d0713          	addi	a4,s10,1
1c00b646:	9dba                	add	s11,s11,a4
1c00b648:	060c1e63          	bnez	s8,1c00b6c4 <_prf+0x674>
1c00b64c:	a8d1                	j	1c00b720 <_prf+0x6d0>
1c00b64e:	06500a93          	li	s5,101
1c00b652:	b575                	j	1c00b4fe <_prf+0x4ae>
1c00b654:	1828                	addi	a0,sp,56
1c00b656:	c42e                	sw	a1,8(sp)
1c00b658:	975ff0ef          	jal	ra,1c00afcc <_ldiv5>
1c00b65c:	1828                	addi	a0,sp,56
1c00b65e:	94fff0ef          	jal	ra,1c00afac <_rlrshift>
1c00b662:	45a2                	lw	a1,8(sp)
1c00b664:	b79d                	j	1c00b5ca <_prf+0x57a>
1c00b666:	03000593          	li	a1,48
1c00b66a:	00bb0023          	sb	a1,0(s6)
1c00b66e:	bf5d                	j	1c00b624 <_prf+0x5d4>
1c00b670:	000b8763          	beqz	s7,1c00b67e <_prf+0x62e>
1c00b674:	006b00a3          	sb	t1,1(s6)
1c00b678:	0b85                	addi	s7,s7,1
1c00b67a:	0b05                	addi	s6,s6,1
1c00b67c:	b7c9                	j	1c00b63e <_prf+0x5ee>
1c00b67e:	106c                	addi	a1,sp,44
1c00b680:	1808                	addi	a0,sp,48
1c00b682:	c41a                	sw	t1,8(sp)
1c00b684:	991ff0ef          	jal	ra,1c00b014 <_get_digit>
1c00b688:	00ab00a3          	sb	a0,1(s6)
1c00b68c:	4322                	lw	t1,8(sp)
1c00b68e:	b7f5                	j	1c00b67a <_prf+0x62a>
1c00b690:	106c                	addi	a1,sp,44
1c00b692:	1808                	addi	a0,sp,48
1c00b694:	981ff0ef          	jal	ra,1c00b014 <_get_digit>
1c00b698:	00ab0023          	sb	a0,0(s6)
1c00b69c:	03000593          	li	a1,48
1c00b6a0:	00b50363          	beq	a0,a1,1c00b6a6 <_prf+0x656>
1c00b6a4:	1bfd                	addi	s7,s7,-1
1c00b6a6:	000c9463          	bnez	s9,1c00b6ae <_prf+0x65e>
1c00b6aa:	000d0b63          	beqz	s10,1c00b6c0 <_prf+0x670>
1c00b6ae:	002b0d93          	addi	s11,s6,2
1c00b6b2:	02e00593          	li	a1,46
1c00b6b6:	00bb00a3          	sb	a1,1(s6)
1c00b6ba:	9d6e                	add	s10,s10,s11
1c00b6bc:	07bd1863          	bne	s10,s11,1c00b72c <_prf+0x6dc>
1c00b6c0:	000c0f63          	beqz	s8,1c00b6de <_prf+0x68e>
1c00b6c4:	03000593          	li	a1,48
1c00b6c8:	fffdc603          	lbu	a2,-1(s11)
1c00b6cc:	fffd8713          	addi	a4,s11,-1
1c00b6d0:	06b60663          	beq	a2,a1,1c00b73c <_prf+0x6ec>
1c00b6d4:	02e00593          	li	a1,46
1c00b6d8:	00b61363          	bne	a2,a1,1c00b6de <_prf+0x68e>
1c00b6dc:	8dba                	mv	s11,a4
1c00b6de:	fdfaf713          	andi	a4,s5,-33
1c00b6e2:	04500613          	li	a2,69
1c00b6e6:	02c71d63          	bne	a4,a2,1c00b720 <_prf+0x6d0>
1c00b6ea:	87d6                	mv	a5,s5
1c00b6ec:	00fd8023          	sb	a5,0(s11)
1c00b6f0:	02b00793          	li	a5,43
1c00b6f4:	000bd663          	bgez	s7,1c00b700 <_prf+0x6b0>
1c00b6f8:	41700bb3          	neg	s7,s7
1c00b6fc:	02d00793          	li	a5,45
1c00b700:	00fd80a3          	sb	a5,1(s11)
1c00b704:	47a9                	li	a5,10
1c00b706:	02fbc733          	div	a4,s7,a5
1c00b70a:	0d91                	addi	s11,s11,4
1c00b70c:	02fbe6b3          	rem	a3,s7,a5
1c00b710:	03070713          	addi	a4,a4,48 # 80000030 <pulp__FC+0x80000031>
1c00b714:	feed8f23          	sb	a4,-2(s11)
1c00b718:	03068693          	addi	a3,a3,48 # 80000030 <pulp__FC+0x80000031>
1c00b71c:	fedd8fa3          	sb	a3,-1(s11)
1c00b720:	00c8                	addi	a0,sp,68
1c00b722:	000d8023          	sb	zero,0(s11)
1c00b726:	40ad8533          	sub	a0,s11,a0
1c00b72a:	b1ed                	j	1c00b414 <_prf+0x3c4>
1c00b72c:	106c                	addi	a1,sp,44
1c00b72e:	1808                	addi	a0,sp,48
1c00b730:	0d85                	addi	s11,s11,1
1c00b732:	8e3ff0ef          	jal	ra,1c00b014 <_get_digit>
1c00b736:	fead8fa3          	sb	a0,-1(s11)
1c00b73a:	b749                	j	1c00b6bc <_prf+0x66c>
1c00b73c:	8dba                	mv	s11,a4
1c00b73e:	b769                	j	1c00b6c8 <_prf+0x678>
1c00b740:	000c2783          	lw	a5,0(s8)
1c00b744:	004c0a13          	addi	s4,s8,4
1c00b748:	0137a023          	sw	s3,0(a5)
1c00b74c:	b255                	j	1c00b0f0 <_prf+0xa0>
1c00b74e:	004c0a13          	addi	s4,s8,4
1c00b752:	000c2583          	lw	a1,0(s8)
1c00b756:	00dc                	addi	a5,sp,68
1c00b758:	040c8463          	beqz	s9,1c00b7a0 <_prf+0x750>
1c00b75c:	03000693          	li	a3,48
1c00b760:	04d10223          	sb	a3,68(sp)
1c00b764:	04510513          	addi	a0,sp,69
1c00b768:	ed8d                	bnez	a1,1c00b7a2 <_prf+0x752>
1c00b76a:	040102a3          	sb	zero,69(sp)
1c00b76e:	57fd                	li	a5,-1
1c00b770:	4401                	li	s0,0
1c00b772:	0efd1163          	bne	s10,a5,1c00b854 <_prf+0x804>
1c00b776:	0f2cc363          	blt	s9,s2,1c00b85c <_prf+0x80c>
1c00b77a:	8966                	mv	s2,s9
1c00b77c:	00c0                	addi	s0,sp,68
1c00b77e:	40898ab3          	sub	s5,s3,s0
1c00b782:	5b7d                	li	s6,-1
1c00b784:	015409b3          	add	s3,s0,s5
1c00b788:	960904e3          	beqz	s2,1c00b0f0 <_prf+0xa0>
1c00b78c:	45f2                	lw	a1,28(sp)
1c00b78e:	00044503          	lbu	a0,0(s0)
1c00b792:	47e2                	lw	a5,24(sp)
1c00b794:	9782                	jalr	a5
1c00b796:	91650ce3          	beq	a0,s6,1c00b0ae <_prf+0x5e>
1c00b79a:	197d                	addi	s2,s2,-1
1c00b79c:	0405                	addi	s0,s0,1
1c00b79e:	b7dd                	j	1c00b784 <_prf+0x734>
1c00b7a0:	853e                	mv	a0,a5
1c00b7a2:	86ea                	mv	a3,s10
1c00b7a4:	4621                	li	a2,8
1c00b7a6:	40f50433          	sub	s0,a0,a5
1c00b7aa:	fa2ff0ef          	jal	ra,1c00af4c <_to_x>
1c00b7ae:	9522                	add	a0,a0,s0
1c00b7b0:	57fd                	li	a5,-1
1c00b7b2:	4401                	li	s0,0
1c00b7b4:	c6fd0ae3          	beq	s10,a5,1c00b428 <_prf+0x3d8>
1c00b7b8:	02000793          	li	a5,32
1c00b7bc:	c83e                	sw	a5,16(sp)
1c00b7be:	b1ad                	j	1c00b428 <_prf+0x3d8>
1c00b7c0:	000c2583          	lw	a1,0(s8)
1c00b7c4:	77e1                	lui	a5,0xffff8
1c00b7c6:	8307c793          	xori	a5,a5,-2000
1c00b7ca:	46a1                	li	a3,8
1c00b7cc:	4641                	li	a2,16
1c00b7ce:	04610513          	addi	a0,sp,70
1c00b7d2:	04f11223          	sh	a5,68(sp)
1c00b7d6:	f76ff0ef          	jal	ra,1c00af4c <_to_x>
1c00b7da:	004c0a13          	addi	s4,s8,4
1c00b7de:	0509                	addi	a0,a0,2
1c00b7e0:	57fd                	li	a5,-1
1c00b7e2:	4401                	li	s0,0
1c00b7e4:	c4fd02e3          	beq	s10,a5,1c00b428 <_prf+0x3d8>
1c00b7e8:	02000713          	li	a4,32
1c00b7ec:	c83a                	sw	a4,16(sp)
1c00b7ee:	b92d                	j	1c00b428 <_prf+0x3d8>
1c00b7f0:	000d4563          	bltz	s10,1c00b7fa <_prf+0x7aa>
1c00b7f4:	019d5363          	ble	s9,s10,1c00b7fa <_prf+0x7aa>
1c00b7f8:	8cea                	mv	s9,s10
1c00b7fa:	8e0c8be3          	beqz	s9,1c00b0f0 <_prf+0xa0>
1c00b7fe:	8666                	mv	a2,s9
1c00b800:	00c8                	addi	a0,sp,68
1c00b802:	cf4ff0ef          	jal	ra,1c00acf6 <memcpy>
1c00b806:	b6b9                	j	1c00b354 <_prf+0x304>
1c00b808:	000c2583          	lw	a1,0(s8)
1c00b80c:	86ea                	mv	a3,s10
1c00b80e:	4629                	li	a2,10
1c00b810:	00c8                	addi	a0,sp,68
1c00b812:	004c0a13          	addi	s4,s8,4
1c00b816:	f36ff0ef          	jal	ra,1c00af4c <_to_x>
1c00b81a:	bf59                	j	1c00b7b0 <_prf+0x760>
1c00b81c:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00b820:	0ff67613          	andi	a2,a2,255
1c00b824:	00c5e563          	bltu	a1,a2,1c00b82e <_prf+0x7de>
1c00b828:	1781                	addi	a5,a5,-32
1c00b82a:	00f68023          	sb	a5,0(a3)
1c00b82e:	0685                	addi	a3,a3,1
1c00b830:	0006c783          	lbu	a5,0(a3)
1c00b834:	f7e5                	bnez	a5,1c00b81c <_prf+0x7cc>
1c00b836:	bc9d                	j	1c00b2ac <_prf+0x25c>
1c00b838:	86de                	mv	a3,s7
1c00b83a:	45e5                	li	a1,25
1c00b83c:	bfd5                	j	1c00b830 <_prf+0x7e0>
1c00b83e:	45f2                	lw	a1,28(sp)
1c00b840:	4762                	lw	a4,24(sp)
1c00b842:	02500513          	li	a0,37
1c00b846:	9702                	jalr	a4
1c00b848:	57fd                	li	a5,-1
1c00b84a:	86f502e3          	beq	a0,a5,1c00b0ae <_prf+0x5e>
1c00b84e:	0985                	addi	s3,s3,1
1c00b850:	8a62                	mv	s4,s8
1c00b852:	b879                	j	1c00b0f0 <_prf+0xa0>
1c00b854:	02000793          	li	a5,32
1c00b858:	c83e                	sw	a5,16(sp)
1c00b85a:	bf31                	j	1c00b776 <_prf+0x726>
1c00b85c:	4732                	lw	a4,12(sp)
1c00b85e:	cf01                	beqz	a4,1c00b876 <_prf+0x826>
1c00b860:	02000713          	li	a4,32
1c00b864:	00d4                	addi	a3,sp,68
1c00b866:	019687b3          	add	a5,a3,s9
1c00b86a:	00e78023          	sb	a4,0(a5)
1c00b86e:	0c85                	addi	s9,s9,1
1c00b870:	ff991ae3          	bne	s2,s9,1c00b864 <_prf+0x814>
1c00b874:	b721                	j	1c00b77c <_prf+0x72c>
1c00b876:	00cc                	addi	a1,sp,68
1c00b878:	41990bb3          	sub	s7,s2,s9
1c00b87c:	001c8613          	addi	a2,s9,1
1c00b880:	01758533          	add	a0,a1,s7
1c00b884:	c8aff0ef          	jal	ra,1c00ad0e <memmove>
1c00b888:	4742                	lw	a4,16(sp)
1c00b88a:	02000793          	li	a5,32
1c00b88e:	00f70363          	beq	a4,a5,1c00b894 <_prf+0x844>
1c00b892:	c622                	sw	s0,12(sp)
1c00b894:	47b2                	lw	a5,12(sp)
1c00b896:	9bbe                	add	s7,s7,a5
1c00b898:	4732                	lw	a4,12(sp)
1c00b89a:	ef7751e3          	ble	s7,a4,1c00b77c <_prf+0x72c>
1c00b89e:	4732                	lw	a4,12(sp)
1c00b8a0:	00d4                	addi	a3,sp,68
1c00b8a2:	00e687b3          	add	a5,a3,a4
1c00b8a6:	4742                	lw	a4,16(sp)
1c00b8a8:	00e78023          	sb	a4,0(a5)
1c00b8ac:	47b2                	lw	a5,12(sp)
1c00b8ae:	0785                	addi	a5,a5,1
1c00b8b0:	c63e                	sw	a5,12(sp)
1c00b8b2:	b7dd                	j	1c00b898 <_prf+0x848>
1c00b8b4:	4452                	lw	s0,20(sp)
1c00b8b6:	be8d                	j	1c00b428 <_prf+0x3d8>

1c00b8b8 <__rt_uart_cluster_req_done>:
1c00b8b8:	300476f3          	csrrci	a3,mstatus,8
1c00b8bc:	4785                	li	a5,1
1c00b8be:	08f50c23          	sb	a5,152(a0) # f0000098 <pulp__FC+0xf0000099>
1c00b8c2:	09954783          	lbu	a5,153(a0)
1c00b8c6:	00201737          	lui	a4,0x201
1c00b8ca:	e0470713          	addi	a4,a4,-508 # 200e04 <__l1_heap_size+0x1f3210>
1c00b8ce:	04078793          	addi	a5,a5,64
1c00b8d2:	07da                	slli	a5,a5,0x16
1c00b8d4:	97ba                	add	a5,a5,a4
1c00b8d6:	0007a023          	sw	zero,0(a5)
1c00b8da:	30069073          	csrw	mstatus,a3
1c00b8de:	8082                	ret

1c00b8e0 <__rt_uart_setup.isra.6>:
1c00b8e0:	1c001737          	lui	a4,0x1c001
1c00b8e4:	17472703          	lw	a4,372(a4) # 1c001174 <__rt_freq_domains>
1c00b8e8:	00155793          	srli	a5,a0,0x1
1c00b8ec:	97ba                	add	a5,a5,a4
1c00b8ee:	02a7d7b3          	divu	a5,a5,a0
1c00b8f2:	1a102737          	lui	a4,0x1a102
1c00b8f6:	17fd                	addi	a5,a5,-1
1c00b8f8:	07c2                	slli	a5,a5,0x10
1c00b8fa:	3067e793          	ori	a5,a5,774
1c00b8fe:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0ffd98>
1c00b902:	8082                	ret

1c00b904 <__rt_uart_setfreq_after>:
1c00b904:	1c0017b7          	lui	a5,0x1c001
1c00b908:	0e878793          	addi	a5,a5,232 # 1c0010e8 <__rt_uart>
1c00b90c:	4398                	lw	a4,0(a5)
1c00b90e:	cb09                	beqz	a4,1c00b920 <__rt_uart_setfreq_after+0x1c>
1c00b910:	4788                	lw	a0,8(a5)
1c00b912:	1141                	addi	sp,sp,-16
1c00b914:	c606                	sw	ra,12(sp)
1c00b916:	37e9                	jal	1c00b8e0 <__rt_uart_setup.isra.6>
1c00b918:	40b2                	lw	ra,12(sp)
1c00b91a:	4501                	li	a0,0
1c00b91c:	0141                	addi	sp,sp,16
1c00b91e:	8082                	ret
1c00b920:	4501                	li	a0,0
1c00b922:	8082                	ret

1c00b924 <__rt_uart_cluster_req>:
1c00b924:	1141                	addi	sp,sp,-16
1c00b926:	c606                	sw	ra,12(sp)
1c00b928:	c422                	sw	s0,8(sp)
1c00b92a:	30047473          	csrrci	s0,mstatus,8
1c00b92e:	1c00c7b7          	lui	a5,0x1c00c
1c00b932:	8b878793          	addi	a5,a5,-1864 # 1c00b8b8 <__rt_uart_cluster_req_done>
1c00b936:	c55c                	sw	a5,12(a0)
1c00b938:	4785                	li	a5,1
1c00b93a:	d55c                	sw	a5,44(a0)
1c00b93c:	411c                	lw	a5,0(a0)
1c00b93e:	02052823          	sw	zero,48(a0)
1c00b942:	c908                	sw	a0,16(a0)
1c00b944:	43cc                	lw	a1,4(a5)
1c00b946:	4514                	lw	a3,8(a0)
1c00b948:	4150                	lw	a2,4(a0)
1c00b94a:	0586                	slli	a1,a1,0x1
1c00b94c:	00c50793          	addi	a5,a0,12
1c00b950:	4701                	li	a4,0
1c00b952:	0585                	addi	a1,a1,1
1c00b954:	4501                	li	a0,0
1c00b956:	ea1fe0ef          	jal	ra,1c00a7f6 <rt_periph_copy>
1c00b95a:	30041073          	csrw	mstatus,s0
1c00b95e:	40b2                	lw	ra,12(sp)
1c00b960:	4422                	lw	s0,8(sp)
1c00b962:	0141                	addi	sp,sp,16
1c00b964:	8082                	ret

1c00b966 <__rt_uart_wait_tx_done.isra.5>:
1c00b966:	1a102737          	lui	a4,0x1a102
1c00b96a:	19872783          	lw	a5,408(a4) # 1a102198 <__l1_end+0xa0ffd8c>
1c00b96e:	8bc1                	andi	a5,a5,16
1c00b970:	e7b9                	bnez	a5,1c00b9be <__rt_uart_wait_tx_done.isra.5+0x58>
1c00b972:	1a102737          	lui	a4,0x1a102
1c00b976:	1a072783          	lw	a5,416(a4) # 1a1021a0 <__l1_end+0xa0ffd94>
1c00b97a:	8b85                	andi	a5,a5,1
1c00b97c:	ffed                	bnez	a5,1c00b976 <__rt_uart_wait_tx_done.isra.5+0x10>
1c00b97e:	f14027f3          	csrr	a5,mhartid
1c00b982:	8795                	srai	a5,a5,0x5
1c00b984:	1a10a637          	lui	a2,0x1a10a
1c00b988:	03f7f793          	andi	a5,a5,63
1c00b98c:	03200693          	li	a3,50
1c00b990:	81460813          	addi	a6,a2,-2028 # 1a109814 <__l1_end+0xa107408>
1c00b994:	6711                	lui	a4,0x4
1c00b996:	6311                	lui	t1,0x4
1c00b998:	45fd                	li	a1,31
1c00b99a:	00204537          	lui	a0,0x204
1c00b99e:	88be                	mv	a7,a5
1c00b9a0:	00682023          	sw	t1,0(a6)
1c00b9a4:	02b79063          	bne	a5,a1,1c00b9c4 <__rt_uart_wait_tx_done.isra.5+0x5e>
1c00b9a8:	80e62223          	sw	a4,-2044(a2)
1c00b9ac:	10500073          	wfi
1c00b9b0:	00b89c63          	bne	a7,a1,1c00b9c8 <__rt_uart_wait_tx_done.isra.5+0x62>
1c00b9b4:	80e62423          	sw	a4,-2040(a2)
1c00b9b8:	16fd                	addi	a3,a3,-1
1c00b9ba:	f2fd                	bnez	a3,1c00b9a0 <__rt_uart_wait_tx_done.isra.5+0x3a>
1c00b9bc:	8082                	ret
1c00b9be:	10500073          	wfi
1c00b9c2:	b765                	j	1c00b96a <__rt_uart_wait_tx_done.isra.5+0x4>
1c00b9c4:	c958                	sw	a4,20(a0)
1c00b9c6:	b7dd                	j	1c00b9ac <__rt_uart_wait_tx_done.isra.5+0x46>
1c00b9c8:	c918                	sw	a4,16(a0)
1c00b9ca:	b7fd                	j	1c00b9b8 <__rt_uart_wait_tx_done.isra.5+0x52>

1c00b9cc <__rt_uart_setfreq_before>:
1c00b9cc:	1c0017b7          	lui	a5,0x1c001
1c00b9d0:	0e87a783          	lw	a5,232(a5) # 1c0010e8 <__rt_uart>
1c00b9d4:	cf99                	beqz	a5,1c00b9f2 <__rt_uart_setfreq_before+0x26>
1c00b9d6:	1141                	addi	sp,sp,-16
1c00b9d8:	c606                	sw	ra,12(sp)
1c00b9da:	3771                	jal	1c00b966 <__rt_uart_wait_tx_done.isra.5>
1c00b9dc:	40b2                	lw	ra,12(sp)
1c00b9de:	005007b7          	lui	a5,0x500
1c00b9e2:	1a102737          	lui	a4,0x1a102
1c00b9e6:	0799                	addi	a5,a5,6
1c00b9e8:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0ffd98>
1c00b9ec:	4501                	li	a0,0
1c00b9ee:	0141                	addi	sp,sp,16
1c00b9f0:	8082                	ret
1c00b9f2:	4501                	li	a0,0
1c00b9f4:	8082                	ret

1c00b9f6 <soc_eu_fcEventMask_setEvent>:
1c00b9f6:	47fd                	li	a5,31
1c00b9f8:	4721                	li	a4,8
1c00b9fa:	00a7d463          	ble	a0,a5,1c00ba02 <soc_eu_fcEventMask_setEvent+0xc>
1c00b9fe:	1501                	addi	a0,a0,-32
1c00ba00:	4711                	li	a4,4
1c00ba02:	1a1067b7          	lui	a5,0x1a106
1c00ba06:	973e                	add	a4,a4,a5
1c00ba08:	4314                	lw	a3,0(a4)
1c00ba0a:	4785                	li	a5,1
1c00ba0c:	00a79533          	sll	a0,a5,a0
1c00ba10:	fff54513          	not	a0,a0
1c00ba14:	8d75                	and	a0,a0,a3
1c00ba16:	c308                	sw	a0,0(a4)
1c00ba18:	8082                	ret

1c00ba1a <rt_uart_conf_init>:
1c00ba1a:	000997b7          	lui	a5,0x99
1c00ba1e:	96878793          	addi	a5,a5,-1688 # 98968 <__l1_heap_size+0x8ad74>
1c00ba22:	c11c                	sw	a5,0(a0)
1c00ba24:	57fd                	li	a5,-1
1c00ba26:	c15c                	sw	a5,4(a0)
1c00ba28:	8082                	ret

1c00ba2a <__rt_uart_open>:
1c00ba2a:	1141                	addi	sp,sp,-16
1c00ba2c:	c606                	sw	ra,12(sp)
1c00ba2e:	c422                	sw	s0,8(sp)
1c00ba30:	c226                	sw	s1,4(sp)
1c00ba32:	c04a                	sw	s2,0(sp)
1c00ba34:	30047973          	csrrci	s2,mstatus,8
1c00ba38:	cd8d                	beqz	a1,1c00ba72 <__rt_uart_open+0x48>
1c00ba3a:	4194                	lw	a3,0(a1)
1c00ba3c:	1c0017b7          	lui	a5,0x1c001
1c00ba40:	ffd50713          	addi	a4,a0,-3 # 203ffd <__l1_heap_size+0x1f6409>
1c00ba44:	0e878413          	addi	s0,a5,232 # 1c0010e8 <__rt_uart>
1c00ba48:	0712                	slli	a4,a4,0x4
1c00ba4a:	943a                	add	s0,s0,a4
1c00ba4c:	4010                	lw	a2,0(s0)
1c00ba4e:	0e878793          	addi	a5,a5,232
1c00ba52:	c60d                	beqz	a2,1c00ba7c <__rt_uart_open+0x52>
1c00ba54:	c589                	beqz	a1,1c00ba5e <__rt_uart_open+0x34>
1c00ba56:	418c                	lw	a1,0(a1)
1c00ba58:	4414                	lw	a3,8(s0)
1c00ba5a:	04d59a63          	bne	a1,a3,1c00baae <__rt_uart_open+0x84>
1c00ba5e:	97ba                	add	a5,a5,a4
1c00ba60:	0605                	addi	a2,a2,1
1c00ba62:	c390                	sw	a2,0(a5)
1c00ba64:	8522                	mv	a0,s0
1c00ba66:	40b2                	lw	ra,12(sp)
1c00ba68:	4422                	lw	s0,8(sp)
1c00ba6a:	4492                	lw	s1,4(sp)
1c00ba6c:	4902                	lw	s2,0(sp)
1c00ba6e:	0141                	addi	sp,sp,16
1c00ba70:	8082                	ret
1c00ba72:	000996b7          	lui	a3,0x99
1c00ba76:	96868693          	addi	a3,a3,-1688 # 98968 <__l1_heap_size+0x8ad74>
1c00ba7a:	b7c9                	j	1c00ba3c <__rt_uart_open+0x12>
1c00ba7c:	4785                	li	a5,1
1c00ba7e:	1a102737          	lui	a4,0x1a102
1c00ba82:	c01c                	sw	a5,0(s0)
1c00ba84:	c048                	sw	a0,4(s0)
1c00ba86:	c414                	sw	a3,8(s0)
1c00ba88:	78072683          	lw	a3,1920(a4) # 1a102780 <__l1_end+0xa100374>
1c00ba8c:	00a797b3          	sll	a5,a5,a0
1c00ba90:	00151493          	slli	s1,a0,0x1
1c00ba94:	8fd5                	or	a5,a5,a3
1c00ba96:	78f72023          	sw	a5,1920(a4)
1c00ba9a:	8526                	mv	a0,s1
1c00ba9c:	3fa9                	jal	1c00b9f6 <soc_eu_fcEventMask_setEvent>
1c00ba9e:	00148513          	addi	a0,s1,1
1c00baa2:	3f91                	jal	1c00b9f6 <soc_eu_fcEventMask_setEvent>
1c00baa4:	4408                	lw	a0,8(s0)
1c00baa6:	3d2d                	jal	1c00b8e0 <__rt_uart_setup.isra.6>
1c00baa8:	30091073          	csrw	mstatus,s2
1c00baac:	bf65                	j	1c00ba64 <__rt_uart_open+0x3a>
1c00baae:	4401                	li	s0,0
1c00bab0:	bf55                	j	1c00ba64 <__rt_uart_open+0x3a>

1c00bab2 <rt_uart_close>:
1c00bab2:	1141                	addi	sp,sp,-16
1c00bab4:	c606                	sw	ra,12(sp)
1c00bab6:	c422                	sw	s0,8(sp)
1c00bab8:	c226                	sw	s1,4(sp)
1c00baba:	300474f3          	csrrci	s1,mstatus,8
1c00babe:	411c                	lw	a5,0(a0)
1c00bac0:	17fd                	addi	a5,a5,-1
1c00bac2:	c11c                	sw	a5,0(a0)
1c00bac4:	e78d                	bnez	a5,1c00baee <rt_uart_close+0x3c>
1c00bac6:	842a                	mv	s0,a0
1c00bac8:	3d79                	jal	1c00b966 <__rt_uart_wait_tx_done.isra.5>
1c00baca:	005007b7          	lui	a5,0x500
1c00bace:	1a102737          	lui	a4,0x1a102
1c00bad2:	0799                	addi	a5,a5,6
1c00bad4:	1af72223          	sw	a5,420(a4) # 1a1021a4 <__l1_end+0xa0ffd98>
1c00bad8:	4050                	lw	a2,4(s0)
1c00bada:	78072683          	lw	a3,1920(a4)
1c00bade:	4785                	li	a5,1
1c00bae0:	00c797b3          	sll	a5,a5,a2
1c00bae4:	fff7c793          	not	a5,a5
1c00bae8:	8ff5                	and	a5,a5,a3
1c00baea:	78f72023          	sw	a5,1920(a4)
1c00baee:	30049073          	csrw	mstatus,s1
1c00baf2:	40b2                	lw	ra,12(sp)
1c00baf4:	4422                	lw	s0,8(sp)
1c00baf6:	4492                	lw	s1,4(sp)
1c00baf8:	0141                	addi	sp,sp,16
1c00bafa:	8082                	ret

1c00bafc <rt_uart_cluster_write>:
1c00bafc:	f14027f3          	csrr	a5,mhartid
1c00bb00:	8795                	srai	a5,a5,0x5
1c00bb02:	03f7f793          	andi	a5,a5,63
1c00bb06:	08f68ca3          	sb	a5,153(a3)
1c00bb0a:	1c00c7b7          	lui	a5,0x1c00c
1c00bb0e:	92478793          	addi	a5,a5,-1756 # 1c00b924 <__rt_uart_cluster_req>
1c00bb12:	c6dc                	sw	a5,12(a3)
1c00bb14:	4785                	li	a5,1
1c00bb16:	c288                	sw	a0,0(a3)
1c00bb18:	c2cc                	sw	a1,4(a3)
1c00bb1a:	c690                	sw	a2,8(a3)
1c00bb1c:	08068c23          	sb	zero,152(a3)
1c00bb20:	0206a823          	sw	zero,48(a3)
1c00bb24:	ca94                	sw	a3,16(a3)
1c00bb26:	d6dc                	sw	a5,44(a3)
1c00bb28:	00c68513          	addi	a0,a3,12
1c00bb2c:	a97fd06f          	j	1c0095c2 <__rt_cluster_push_fc_event>

1c00bb30 <__rt_uart_init>:
1c00bb30:	1c00c5b7          	lui	a1,0x1c00c
1c00bb34:	1141                	addi	sp,sp,-16
1c00bb36:	4601                	li	a2,0
1c00bb38:	9cc58593          	addi	a1,a1,-1588 # 1c00b9cc <__rt_uart_setfreq_before>
1c00bb3c:	4511                	li	a0,4
1c00bb3e:	c606                	sw	ra,12(sp)
1c00bb40:	c422                	sw	s0,8(sp)
1c00bb42:	8a2fe0ef          	jal	ra,1c009be4 <__rt_cbsys_add>
1c00bb46:	1c00c5b7          	lui	a1,0x1c00c
1c00bb4a:	842a                	mv	s0,a0
1c00bb4c:	4601                	li	a2,0
1c00bb4e:	90458593          	addi	a1,a1,-1788 # 1c00b904 <__rt_uart_setfreq_after>
1c00bb52:	4515                	li	a0,5
1c00bb54:	890fe0ef          	jal	ra,1c009be4 <__rt_cbsys_add>
1c00bb58:	1c0017b7          	lui	a5,0x1c001
1c00bb5c:	0e07a423          	sw	zero,232(a5) # 1c0010e8 <__rt_uart>
1c00bb60:	8d41                	or	a0,a0,s0
1c00bb62:	c105                	beqz	a0,1c00bb82 <__rt_uart_init+0x52>
1c00bb64:	f1402673          	csrr	a2,mhartid
1c00bb68:	1c000537          	lui	a0,0x1c000
1c00bb6c:	40565593          	srai	a1,a2,0x5
1c00bb70:	03f5f593          	andi	a1,a1,63
1c00bb74:	8a7d                	andi	a2,a2,31
1c00bb76:	5e850513          	addi	a0,a0,1512 # 1c0005e8 <__DTOR_END__+0x2fc>
1c00bb7a:	ba8ff0ef          	jal	ra,1c00af22 <printf>
1c00bb7e:	b30ff0ef          	jal	ra,1c00aeae <abort>
1c00bb82:	40b2                	lw	ra,12(sp)
1c00bb84:	4422                	lw	s0,8(sp)
1c00bb86:	0141                	addi	sp,sp,16
1c00bb88:	8082                	ret

1c00bb8a <_endtext>:
	...

Disassembly of section .text.cluster:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x1f640c>
1c010016:	0e059863          	bnez	a1,1c010106 <__rt_slave_start>
1c01001a:	e3ff0417          	auipc	s0,0xe3ff0
1c01001e:	fea40413          	addi	s0,s0,-22 # 4 <__rt_bridge_flash_handle>
1c010022:	002049b7          	lui	s3,0x204
1c010026:	4a09                	li	s4,2
1c010028:	00000a97          	auipc	s5,0x0
1c01002c:	034a8a93          	addi	s5,s5,52 # 1c01005c <__rt_master_event>
1c010030:	ffff1b97          	auipc	s7,0xffff1
1c010034:	110b8b93          	addi	s7,s7,272 # 1c001140 <__rt_fc_cluster_data>
1c010038:	02800393          	li	t2,40
1c01003c:	02a383b3          	mul	t2,t2,a0
1c010040:	9b9e                	add	s7,s7,t2
1c010042:	0b91                	addi	s7,s7,4
1c010044:	1a10acb7          	lui	s9,0x1a10a
1c010048:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_end+0xa107404>
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
1c0100cc:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1f6490>
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
1c010124:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x1f6628>

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
