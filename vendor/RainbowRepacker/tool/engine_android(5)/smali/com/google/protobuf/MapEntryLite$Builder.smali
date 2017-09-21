.class public Lcom/google/protobuf/MapEntryLite$Builder;
.super Lcom/google/protobuf/AbstractMessageLite$Builder;
.source "MapEntryLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/MapEntryLite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/protobuf/AbstractMessageLite$Builder",
        "<",
        "Lcom/google/protobuf/MapEntryLite$Builder",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private final metadata:Lcom/google/protobuf/MapEntryLite$Metadata;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapEntryLite$Metadata",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/protobuf/MapEntryLite$Metadata;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/MapEntryLite$Metadata",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 241
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    .local p1, "metadata":Lcom/google/protobuf/MapEntryLite$Metadata;, "Lcom/google/protobuf/MapEntryLite$Metadata<TK;TV;>;"
    invoke-direct {p0}, Lcom/google/protobuf/AbstractMessageLite$Builder;-><init>()V

    .line 242
    iput-object p1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    .line 243
    iget-object v0, p1, Lcom/google/protobuf/MapEntryLite$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntryLite;

    # getter for: Lcom/google/protobuf/MapEntryLite;->key:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$300(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    .line 244
    iget-object v0, p1, Lcom/google/protobuf/MapEntryLite$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntryLite;

    # getter for: Lcom/google/protobuf/MapEntryLite;->value:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$400(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    .line 245
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/MapEntryLite$Metadata;Lcom/google/protobuf/MapEntryLite$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/MapEntryLite$Metadata;
    .param p2, "x1"    # Lcom/google/protobuf/MapEntryLite$1;

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-direct {p0, p1}, Lcom/google/protobuf/MapEntryLite$Builder;-><init>(Lcom/google/protobuf/MapEntryLite$Metadata;)V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/MapEntryLite$Metadata;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/MapEntryLite$Metadata",
            "<TK;TV;>;TK;TV;)V"
        }
    .end annotation

    .prologue
    .line 309
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    .local p1, "metadata":Lcom/google/protobuf/MapEntryLite$Metadata;, "Lcom/google/protobuf/MapEntryLite$Metadata<TK;TV;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    invoke-direct {p0}, Lcom/google/protobuf/AbstractMessageLite$Builder;-><init>()V

    .line 310
    iput-object p1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    .line 311
    iput-object p2, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    .line 312
    iput-object p3, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    .line 313
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/MapEntryLite$Metadata;Ljava/lang/Object;Ljava/lang/Object;Lcom/google/protobuf/MapEntryLite$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/MapEntryLite$Metadata;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Ljava/lang/Object;
    .param p4, "x3"    # Lcom/google/protobuf/MapEntryLite$1;

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/google/protobuf/MapEntryLite$Builder;-><init>(Lcom/google/protobuf/MapEntryLite$Metadata;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/google/protobuf/MapEntryLite;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntryLite",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 284
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntryLite$Builder;->buildPartial()Lcom/google/protobuf/MapEntryLite;

    move-result-object v0

    .line 285
    .local v0, "result":Lcom/google/protobuf/MapEntryLite;, "Lcom/google/protobuf/MapEntryLite<TK;TV;>;"
    invoke-virtual {v0}, Lcom/google/protobuf/MapEntryLite;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 286
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite$Builder;->newUninitializedMessageException(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 288
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntryLite$Builder;->build()Lcom/google/protobuf/MapEntryLite;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/google/protobuf/MapEntryLite;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntryLite",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 293
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapEntryLite;

    iget-object v1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v2, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/protobuf/MapEntryLite;-><init>(Lcom/google/protobuf/MapEntryLite$Metadata;Ljava/lang/Object;Ljava/lang/Object;Lcom/google/protobuf/MapEntryLite$1;)V

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntryLite$Builder;->buildPartial()Lcom/google/protobuf/MapEntryLite;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/google/protobuf/MapEntryLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntryLite$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 277
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntryLite$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntryLite;

    # getter for: Lcom/google/protobuf/MapEntryLite;->key:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$300(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    .line 278
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntryLite$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntryLite;

    # getter for: Lcom/google/protobuf/MapEntryLite;->value:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$400(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    .line 279
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntryLite$Builder;->clear()Lcom/google/protobuf/MapEntryLite$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearKey()Lcom/google/protobuf/MapEntryLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntryLite$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 266
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntryLite$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntryLite;

    # getter for: Lcom/google/protobuf/MapEntryLite;->key:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$300(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    .line 267
    return-object p0
.end method

.method public clearValue()Lcom/google/protobuf/MapEntryLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntryLite$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 271
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntryLite$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntryLite;

    # getter for: Lcom/google/protobuf/MapEntryLite;->value:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$400(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    .line 272
    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntryLite$Builder;->clone()Lcom/google/protobuf/MapEntryLite$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/protobuf/MapEntryLite$Builder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapEntryLite$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 317
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapEntryLite$Builder;

    iget-object v1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v2, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/MapEntryLite$Builder;-><init>(Lcom/google/protobuf/MapEntryLite$Metadata;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntryLite$Builder;->clone()Lcom/google/protobuf/MapEntryLite$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapEntryLite$Builder;->clone()Lcom/google/protobuf/MapEntryLite$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 298
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntryLite$Metadata;->defaultInstance:Lcom/google/protobuf/MapEntryLite;

    return-object v0
.end method

.method public getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 248
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 252
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 2

    .prologue
    .line 303
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object v0, v0, Lcom/google/protobuf/MapEntryLite$Metadata;->valueType:Lcom/google/protobuf/WireFormat$FieldType;

    invoke-virtual {v0}, Lcom/google/protobuf/WireFormat$FieldType;->getJavaType()Lcom/google/protobuf/WireFormat$JavaType;

    move-result-object v0

    sget-object v1, Lcom/google/protobuf/WireFormat$JavaType;->MESSAGE:Lcom/google/protobuf/WireFormat$JavaType;

    if-ne v0, v1, :cond_0

    .line 304
    iget-object v0, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    check-cast v0, Lcom/google/protobuf/MessageLite;

    invoke-interface {v0}, Lcom/google/protobuf/MessageLite;->isInitialized()Z

    move-result v0

    .line 306
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessageLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/MapEntryLite$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MapEntryLite$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MapEntryLite$Builder;
    .locals 3
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/CodedInputStream;",
            "Lcom/google/protobuf/ExtensionRegistryLite;",
            ")",
            "Lcom/google/protobuf/MapEntryLite$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapEntryLite;

    iget-object v1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->metadata:Lcom/google/protobuf/MapEntryLite$Metadata;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/google/protobuf/MapEntryLite;-><init>(Lcom/google/protobuf/MapEntryLite$Metadata;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/google/protobuf/MapEntryLite$1;)V

    .line 326
    .local v0, "entry":Lcom/google/protobuf/MapEntryLite;, "Lcom/google/protobuf/MapEntryLite<TK;TV;>;"
    # getter for: Lcom/google/protobuf/MapEntryLite;->key:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$300(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    .line 327
    # getter for: Lcom/google/protobuf/MapEntryLite;->value:Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/protobuf/MapEntryLite;->access$400(Lcom/google/protobuf/MapEntryLite;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    .line 328
    return-object p0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/MapEntryLite$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MapEntryLite$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setKey(Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Lcom/google/protobuf/MapEntryLite$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 256
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iput-object p1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->key:Ljava/lang/Object;

    .line 257
    return-object p0
.end method

.method public setValue(Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)",
            "Lcom/google/protobuf/MapEntryLite$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 261
    .local p0, "this":Lcom/google/protobuf/MapEntryLite$Builder;, "Lcom/google/protobuf/MapEntryLite$Builder<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Lcom/google/protobuf/MapEntryLite$Builder;->value:Ljava/lang/Object;

    .line 262
    return-object p0
.end method
