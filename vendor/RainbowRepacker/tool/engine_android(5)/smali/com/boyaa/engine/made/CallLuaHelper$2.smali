.class final Lcom/boyaa/engine/made/CallLuaHelper$2;
.super Ljava/lang/Object;
.source "CallLuaHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$args:Ljava/lang/String;

.field final synthetic val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

.field final synthetic val$func_name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    .locals 0

    .prologue
    .line 31
    iput-object p1, p0, Lcom/boyaa/engine/made/CallLuaHelper$2;->val$func_name:Ljava/lang/String;

    iput-object p2, p0, Lcom/boyaa/engine/made/CallLuaHelper$2;->val$args:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/engine/made/CallLuaHelper$2;->val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/boyaa/engine/made/CallLuaHelper$2;->val$func_name:Ljava/lang/String;

    iget-object v1, p0, Lcom/boyaa/engine/made/CallLuaHelper$2;->val$args:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/boyaa/engine/made/GhostLib;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    iget-object v0, p0, Lcom/boyaa/engine/made/CallLuaHelper$2;->val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/boyaa/engine/made/CallLuaHelper$2;->val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    invoke-interface {v0}, Lcom/boyaa/engine/made/CallLuaHelper$onCallback;->callback()V

    .line 39
    :cond_0
    return-void
.end method
