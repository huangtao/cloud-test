.class public Lcom/google/protobuf/MapField;
.super Ljava/lang/Object;
.source "MapField.java"

# interfaces
.implements Lcom/google/protobuf/MutabilityOracle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/MapField$ImmutableMessageConverter;,
        Lcom/google/protobuf/MapField$Converter;,
        Lcom/google/protobuf/MapField$StorageMode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/MutabilityOracle;"
    }
.end annotation


# instance fields
.field private final converter:Lcom/google/protobuf/MapField$Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapField$Converter",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private volatile isMutable:Z

.field private listData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/Message;",
            ">;"
        }
    .end annotation
.end field

.field private mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private volatile mode:Lcom/google/protobuf/MapField$StorageMode;


# direct methods
.method private constructor <init>(Lcom/google/protobuf/MapEntry;Lcom/google/protobuf/MapField$StorageMode;Ljava/util/Map;)V
    .locals 1
    .param p2, "mode"    # Lcom/google/protobuf/MapField$StorageMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;",
            "Lcom/google/protobuf/MapField$StorageMode;",
            "Ljava/util/Map",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    .local p1, "defaultEntry":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    .local p3, "mapData":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapField$ImmutableMessageConverter;

    invoke-direct {v0, p1}, Lcom/google/protobuf/MapField$ImmutableMessageConverter;-><init>(Lcom/google/protobuf/MapEntry;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/google/protobuf/MapField;-><init>(Lcom/google/protobuf/MapField$Converter;Lcom/google/protobuf/MapField$StorageMode;Ljava/util/Map;)V

    .line 129
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/MapField$Converter;Lcom/google/protobuf/MapField$StorageMode;Ljava/util/Map;)V
    .locals 1
    .param p2, "mode"    # Lcom/google/protobuf/MapField$StorageMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/MapField$Converter",
            "<TK;TV;>;",
            "Lcom/google/protobuf/MapField$StorageMode;",
            "Ljava/util/Map",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    .local p1, "converter":Lcom/google/protobuf/MapField$Converter;, "Lcom/google/protobuf/MapField$Converter<TK;TV;>;"
    .local p3, "mapData":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-object p1, p0, Lcom/google/protobuf/MapField;->converter:Lcom/google/protobuf/MapField$Converter;

    .line 118
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/protobuf/MapField;->isMutable:Z

    .line 119
    iput-object p2, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    .line 120
    new-instance v0, Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    invoke-direct {v0, p0, p3}, Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;-><init>(Lcom/google/protobuf/MutabilityOracle;Ljava/util/Map;)V

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    .line 122
    return-void
.end method

.method private convertKeyAndValueToMessage(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/protobuf/Message;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)",
            "Lcom/google/protobuf/Message;"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/google/protobuf/MapField;->converter:Lcom/google/protobuf/MapField$Converter;

    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/MapField$Converter;->convertKeyAndValueToMessage(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/protobuf/Message;

    move-result-object v0

    return-object v0
.end method

.method private convertListToMap(Ljava/util/List;)Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/Message;",
            ">;)",
            "Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    .local p1, "listData":Ljava/util/List;, "Ljava/util/List<Lcom/google/protobuf/Message;>;"
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 168
    .local v1, "mapData":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Message;

    .line 169
    .local v0, "item":Lcom/google/protobuf/Message;
    invoke-direct {p0, v0, v1}, Lcom/google/protobuf/MapField;->convertMessageToKeyAndValue(Lcom/google/protobuf/Message;Ljava/util/Map;)V

    goto :goto_0

    .line 171
    .end local v0    # "item":Lcom/google/protobuf/Message;
    :cond_0
    new-instance v2, Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    invoke-direct {v2, p0, v1}, Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;-><init>(Lcom/google/protobuf/MutabilityOracle;Ljava/util/Map;)V

    return-object v2
.end method

.method private convertMapToList(Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap",
            "<TK;TV;>;)",
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/Message;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    .local p1, "mapData":Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;, "Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap<TK;TV;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 158
    .local v1, "listData":Ljava/util/List;, "Ljava/util/List<Lcom/google/protobuf/Message;>;"
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 161
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 160
    invoke-direct {p0, v3, v4}, Lcom/google/protobuf/MapField;->convertKeyAndValueToMessage(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/protobuf/Message;

    move-result-object v3

    .line 159
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 163
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    :cond_0
    return-object v1
.end method

.method private convertMessageToKeyAndValue(Lcom/google/protobuf/Message;Ljava/util/Map;)V
    .locals 1
    .param p1, "message"    # Lcom/google/protobuf/Message;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/Message;",
            "Ljava/util/Map",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapField;->converter:Lcom/google/protobuf/MapField$Converter;

    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/MapField$Converter;->convertMessageToKeyAndValue(Lcom/google/protobuf/Message;Ljava/util/Map;)V

    .line 154
    return-void
.end method

.method public static emptyMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;)",
            "Lcom/google/protobuf/MapField",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "defaultEntry":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapField;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    .line 136
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/google/protobuf/MapField;-><init>(Lcom/google/protobuf/MapEntry;Lcom/google/protobuf/MapField$StorageMode;Ljava/util/Map;)V

    return-object v0
.end method

.method public static newMapField(Lcom/google/protobuf/MapEntry;)Lcom/google/protobuf/MapField;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/MapEntry",
            "<TK;TV;>;)",
            "Lcom/google/protobuf/MapField",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "defaultEntry":Lcom/google/protobuf/MapEntry;, "Lcom/google/protobuf/MapEntry<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapField;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-direct {v0, p0, v1, v2}, Lcom/google/protobuf/MapField;-><init>(Lcom/google/protobuf/MapEntry;Lcom/google/protobuf/MapField$StorageMode;Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 204
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;-><init>(Lcom/google/protobuf/MutabilityOracle;Ljava/util/Map;)V

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    .line 205
    sget-object v0, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    .line 206
    return-void
.end method

.method public copy()Lcom/google/protobuf/MapField;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapField",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    new-instance v0, Lcom/google/protobuf/MapField;

    iget-object v1, p0, Lcom/google/protobuf/MapField;->converter:Lcom/google/protobuf/MapField$Converter;

    sget-object v2, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    .line 226
    invoke-virtual {p0}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v3

    invoke-static {v3}, Lcom/google/protobuf/MapFieldLite;->copy(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/MapField;-><init>(Lcom/google/protobuf/MapField$Converter;Lcom/google/protobuf/MapField$StorageMode;Ljava/util/Map;)V

    return-object v0
.end method

.method public ensureMutable()V
    .locals 1

    .prologue
    .line 282
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapField;->isMutable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 283
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 285
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 211
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    instance-of v1, p1, Lcom/google/protobuf/MapField;

    if-nez v1, :cond_0

    .line 212
    const/4 v1, 0x0

    .line 215
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 214
    check-cast v0, Lcom/google/protobuf/MapField;

    .line 215
    .local v0, "other":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/protobuf/MapFieldLite;->equals(Ljava/util/Map;Ljava/util/Map;)Z

    move-result v1

    goto :goto_0
.end method

.method getList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/Message;",
            ">;"
        }
    .end annotation

    .prologue
    .line 231
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    if-ne v0, v1, :cond_1

    .line 232
    monitor-enter p0

    .line 233
    :try_start_0
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    if-ne v0, v1, :cond_0

    .line 234
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    invoke-direct {p0, v0}, Lcom/google/protobuf/MapField;->convertMapToList(Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    .line 235
    sget-object v0, Lcom/google/protobuf/MapField$StorageMode;->BOTH:Lcom/google/protobuf/MapField$StorageMode;

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    .line 237
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 239
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 237
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->LIST:Lcom/google/protobuf/MapField$StorageMode;

    if-ne v0, v1, :cond_1

    .line 177
    monitor-enter p0

    .line 178
    :try_start_0
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->LIST:Lcom/google/protobuf/MapField$StorageMode;

    if-ne v0, v1, :cond_0

    .line 179
    iget-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/protobuf/MapField;->convertListToMap(Ljava/util/List;)Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    .line 180
    sget-object v0, Lcom/google/protobuf/MapField$StorageMode;->BOTH:Lcom/google/protobuf/MapField$StorageMode;

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    .line 182
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 182
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method getMapEntryMessageDefaultInstance()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 259
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapField;->converter:Lcom/google/protobuf/MapField$Converter;

    invoke-interface {v0}, Lcom/google/protobuf/MapField$Converter;->getMessageDefaultInstance()Lcom/google/protobuf/Message;

    move-result-object v0

    return-object v0
.end method

.method getMutableList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/protobuf/Message;",
            ">;"
        }
    .end annotation

    .prologue
    .line 244
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->LIST:Lcom/google/protobuf/MapField$StorageMode;

    if-eq v0, v1, :cond_1

    .line 245
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    if-ne v0, v1, :cond_0

    .line 246
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    invoke-direct {p0, v0}, Lcom/google/protobuf/MapField;->convertMapToList(Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    .line 248
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    .line 249
    sget-object v0, Lcom/google/protobuf/MapField$StorageMode;->LIST:Lcom/google/protobuf/MapField$StorageMode;

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    .line 251
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    return-object v0
.end method

.method public getMutableMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    if-eq v0, v1, :cond_1

    .line 190
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    sget-object v1, Lcom/google/protobuf/MapField$StorageMode;->LIST:Lcom/google/protobuf/MapField$StorageMode;

    if-ne v0, v1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/protobuf/MapField;->convertListToMap(Ljava/util/List;)Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    .line 193
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/MapField;->listData:Ljava/util/List;

    .line 194
    sget-object v0, Lcom/google/protobuf/MapField$StorageMode;->MAP:Lcom/google/protobuf/MapField$StorageMode;

    iput-object v0, p0, Lcom/google/protobuf/MapField;->mode:Lcom/google/protobuf/MapField$StorageMode;

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/MapField;->mapData:Lcom/google/protobuf/MapFieldLite$MutatabilityAwareMap;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 220
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/google/protobuf/MapFieldLite;->calculateHashCodeForMap(Ljava/util/Map;)I

    move-result v0

    return v0
.end method

.method public isMutable()Z
    .locals 1

    .prologue
    .line 274
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    iget-boolean v0, p0, Lcom/google/protobuf/MapField;->isMutable:Z

    return v0
.end method

.method public makeImmutable()V
    .locals 1

    .prologue
    .line 267
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/protobuf/MapField;->isMutable:Z

    .line 268
    return-void
.end method

.method public mergeFrom(Lcom/google/protobuf/MapField;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/MapField",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 200
    .local p0, "this":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    .local p1, "other":Lcom/google/protobuf/MapField;, "Lcom/google/protobuf/MapField<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/MapField;->getMutableMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/protobuf/MapField;->getMap()Ljava/util/Map;

    move-result-object v1

    invoke-static {v1}, Lcom/google/protobuf/MapFieldLite;->copy(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 201
    return-void
.end method
