.class final Lcom/boyaa/engine/made/CallLuaHelper$1;
.super Ljava/lang/Object;
.source "CallLuaHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/CallLuaHelper;->callLua(Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

.field final synthetic val$func_name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/boyaa/engine/made/CallLuaHelper$1;->val$func_name:Ljava/lang/String;

    iput-object p2, p0, Lcom/boyaa/engine/made/CallLuaHelper$1;->val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/boyaa/engine/made/CallLuaHelper$1;->val$func_name:Ljava/lang/String;

    invoke-static {v0}, Lcom/boyaa/engine/made/GhostLib;->callLua(Ljava/lang/String;)I

    .line 21
    iget-object v0, p0, Lcom/boyaa/engine/made/CallLuaHelper$1;->val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    if-eqz v0, :cond_0

    .line 22
    iget-object v0, p0, Lcom/boyaa/engine/made/CallLuaHelper$1;->val$cb:Lcom/boyaa/engine/made/CallLuaHelper$onCallback;

    invoke-interface {v0}, Lcom/boyaa/engine/made/CallLuaHelper$onCallback;->callback()V

    .line 24
    :cond_0
    return-void
.end method
