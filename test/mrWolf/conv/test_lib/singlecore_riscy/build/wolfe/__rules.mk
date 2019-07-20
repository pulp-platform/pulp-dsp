
#
# HEADER RULES
#

define declareInstallFile

$(PULP_SDK_INSTALL)/$(1): $(1)
	install -D $(1) $$@

INSTALL_HEADERS += $(PULP_SDK_INSTALL)/$(1)

endef


define declareWsInstallFile

$(PULP_SDK_WS_INSTALL)/$(1): $(1)
	install -D $(1) $$@

WS_INSTALL_HEADERS += $(PULP_SDK_WS_INSTALL)/$(1)

endef


$(foreach file, $(INSTALL_FILES), $(eval $(call declareInstallFile,$(file))))

$(foreach file, $(WS_INSTALL_FILES), $(eval $(call declareWsInstallFile,$(file))))


#
# CC RULES for domain: cluster
#

PULP_LIB_NAME_test ?= test


PULP_CL_EXTRA_SRCS_test = 
PULP_CL_EXTRA_ASM_SRCS_test = 
PULP_CL_EXTRA_OMP_SRCS_test = 

test_CL_OBJS =     $(patsubst %.cpp,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/%.o, $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/%.o, $(PULP_APP_CL_SRCS_test) $(PULP_CL_SRCS_test) $(PULP_APP_CL_SRCS) $(PULP_APP_SRCS) $(PULP_CL_EXTRA_SRCS_test)))
test_CL_ASM_OBJS = $(patsubst %.S,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/%.o, $(PULP_APP_CL_ASM_SRCS_test) $(PULP_CL_ASM_SRCS_test) $(PULP_APP_CL_ASM_SRCS) $(PULP_APP_ASM_SRCS) $(PULP_CL_EXTRA_ASM_SRCS_test))
test_CL_OMP_OBJS = $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/omp/%.o, $(PULP_APP_CL_OMP_SRCS_test) $(PULP_CL_OMP_SRCS_test) $(PULP_APP_CL_OMP_SRCS) $(PULP_APP_OMP_SRCS) $(PULP_CL_EXTRA_OMP_SRCS_test))

ifneq '$(test_CL_OMP_OBJS)' ''
PULP_LDFLAGS_test += $(PULP_OMP_LDFLAGS_test)
endif

-include $(test_CL_OBJS:.o=.d)
-include $(test_CL_ASM_OBJS:.o=.d)
-include $(test_CL_OMP_OBJS:.o=.d)

test_cl_cflags = $(PULP_CL_ARCH_CFLAGS) $(PULP_CFLAGS) $(PULP_CL_CFLAGS) $(PULP_CFLAGS_test) $(PULP_CL_CFLAGS_test) $(PULP_APP_CFLAGS_test)
test_cl_omp_cflags = $(test_cl_cflags) $(PULP_OMP_CFLAGS) $(PULP_CL_OMP_CFLAGS) $(PULP_OMP_CFLAGS_test) $(PULP_CL_OMP_CFLAGS_test)

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/%.o: %.c
	@mkdir -p `dirname $@`
	$(PULP_CL_CC) $(test_cl_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/%.o: %.cpp
	@mkdir -p `dirname $@`
	$(PULP_CL_CC) $(test_cl_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/%.o: %.S
	@mkdir -p `dirname $@`
	$(PULP_CL_CC) $(test_cl_cflags) -DLANGUAGE_ASSEMBLY -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/cl/omp/%.o: %.c
	@mkdir -p `dirname $@`
	touch libgomp.spec
	$(PULP_CL_CC) $(test_cl_omp_cflags) -MMD -MP -c $< -o $@

test_OBJS += $(test_CL_OBJS) $(test_CL_ASM_OBJS) $(test_CL_OMP_OBJS)



#
# CC RULES for domain: fabric_controller
#

PULP_LIB_NAME_test ?= test


PULP_FC_EXTRA_SRCS_test = /home/moritz/PULP-DSP/test/mrWolf/conv/test_lib/singlecore_riscy/build/wolfe/rt_conf.c /home/moritz/PULP-DSP/test/mrWolf/conv/test_lib/singlecore_riscy/build/wolfe/rt_pad_conf.c
PULP_FC_EXTRA_ASM_SRCS_test = 
PULP_FC_EXTRA_OMP_SRCS_test = 

test_FC_OBJS =     $(patsubst %.cpp,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/%.o, $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/%.o, $(PULP_APP_FC_SRCS_test) $(PULP_FC_SRCS_test) $(PULP_APP_FC_SRCS)  $(PULP_FC_EXTRA_SRCS_test)))
test_FC_ASM_OBJS = $(patsubst %.S,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/%.o, $(PULP_APP_FC_ASM_SRCS_test) $(PULP_FC_ASM_SRCS_test) $(PULP_APP_FC_ASM_SRCS)  $(PULP_FC_EXTRA_ASM_SRCS_test))
test_FC_OMP_OBJS = $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/omp/%.o, $(PULP_APP_FC_OMP_SRCS_test) $(PULP_FC_OMP_SRCS_test) $(PULP_APP_FC_OMP_SRCS)  $(PULP_FC_EXTRA_OMP_SRCS_test))

ifneq '$(test_FC_OMP_OBJS)' ''
PULP_LDFLAGS_test += $(PULP_OMP_LDFLAGS_test)
endif

-include $(test_FC_OBJS:.o=.d)
-include $(test_FC_ASM_OBJS:.o=.d)
-include $(test_FC_OMP_OBJS:.o=.d)

test_fc_cflags = $(PULP_FC_ARCH_CFLAGS) $(PULP_CFLAGS) $(PULP_FC_CFLAGS) $(PULP_CFLAGS_test) $(PULP_FC_CFLAGS_test) $(PULP_APP_CFLAGS_test)
test_fc_omp_cflags = $(test_fc_cflags) $(PULP_OMP_CFLAGS) $(PULP_FC_OMP_CFLAGS) $(PULP_OMP_CFLAGS_test) $(PULP_FC_OMP_CFLAGS_test)

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/%.o: %.c
	@mkdir -p `dirname $@`
	$(PULP_FC_CC) $(test_fc_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/%.o: %.cpp
	@mkdir -p `dirname $@`
	$(PULP_FC_CC) $(test_fc_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/%.o: %.S
	@mkdir -p `dirname $@`
	$(PULP_FC_CC) $(test_fc_cflags) -DLANGUAGE_ASSEMBLY -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_test)/fc/omp/%.o: %.c
	@mkdir -p `dirname $@`
	touch libgomp.spec
	$(PULP_FC_CC) $(test_fc_omp_cflags) -MMD -MP -c $< -o $@

test_OBJS += $(test_FC_OBJS) $(test_FC_ASM_OBJS) $(test_FC_OMP_OBJS)



#
# LINKER RULES for application: test
#

$(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP): $(test_OBJS)
	mkdir -p `dirname $@`
	$(PULP_LD) $(PULP_ARCH_LDFLAGS) -MMD -MP -o $@ $^ $(PULP_LDFLAGS) $(PULP_LDFLAGS_test)

$(PULP_SDK_INSTALL)/bin/$(PULP_APP): $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP)
	mkdir -p `dirname $@`
	cp $< $@

disopt ?= -d

dis:
	$(PULP_OBJDUMP) $(PULP_ARCH_OBJDFLAGS) $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) $(disopt)

extract:
	for symbol in $(symbols); do $(PULP_PREFIX)readelf -s $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) | grep $$symbol | gawk '{print $$2}' > $(CONFIG_BUILD_DIR)/$(PULP_APP)/$$symbol.txt; done

disdump:
	$(PULP_OBJDUMP) $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) $(disopt) > $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP).s
	@echo
	@echo  "Disasembled binary to $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP).s"

TARGETS += $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP)
CLEAN_TARGETS += $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) $(test_OBJS)
RUN_BINARY = $(PULP_APP)/$(PULP_APP)
INSTALL_TARGETS += $(PULP_SDK_INSTALL)/bin/$(PULP_APP)


header:: $(INSTALL_HEADERS) $(WS_INSTALL_HEADERS)

fullclean::
	rm -rf $(CONFIG_BUILD_DIR)

clean:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	rm -rf $(CLEAN_TARGETS)

prepare:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	pulp-run $(pulpRunOpt) prepare

runner:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	pulp-run $(pulpRunOpt) $(RUNNER_CMD)

power:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	pulp-run $(pulpRunOpt) power

gen: $(GEN_TARGETS_FORCE)

build:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk $(TARGETS)

all:: conf build prepare

install:: $(INSTALL_TARGETS)

run::
	pulp-run $(pulpRunOpt)

.PHONY: clean header prepare all install run
